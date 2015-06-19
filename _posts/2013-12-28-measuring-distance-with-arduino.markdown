---
layout: post
title: "Measuring Distance with Arduino"
date: 2013-12-28 17:02:40 -0700
comments: true
categories: [Ardunio, TMP36, PING)))]
---

The [Ping)))](http://www.parallax.com/product/28015) is ultrasonic range finder that is pretty easy to use in an Arduino project. In my case, I'm using it to monitor the water level in a sump pump. I have an Arduino Uno R3 (with Ethernet Shield) connected to a Ping))) and a [TMP36](https://www.sparkfun.com/products/10988) temperature sensor that is perched above my sump pump. Every 2 minutes the Uno will send out a ping, and figure out the distance to the water below. The TMP36 is used to account for the air temperature in the speed of sound calculations.  

<!-- more -->

How It Works
------------

For now, I'm just going to discuss the code I use. At some point in the future (maybe/hopefully) I'll loop back and include the schematic for the hardware.

There are two key parts to this sketch:

1. Read the temperature from the TMP36 (convert to Celsius).
2. Send out the ping and measure the distance to the water surface. 

Each time the `loop` runs, the values from each sensor will be stored in the following structure. 

    /**
     * tmp36_sensor - The raw value from the tmp36 sensor
     * temperature  - Temperature in Celsius
     * ping_sensor  - The duration of the PING))), in microseconds
     * distance     - The distance to the object, in millimetres
     */
    struct SensorValues {
      int tmp36_sensor;                                   
      float temperature;                                  
      unsigned long ping_sensor;                          
      int distance;                                       
    };

At the end of `loop`, the `SensorValues` will be written to a text file on a micro SD card as CSV values.

Reading the Temperature
-----------------------
Let's look at the first routine. I don't expect the temperature to change to dramatically, so I only update the temperature every 10 minutes. 

    /**
     * If enough time has elapsed since the last temperature reading, this function
     * will convert the tmp36 sensor values to Celsius.
     */
    void update_temperature() {
      unsigned long current_millis = millis();

      int time_diff = abs(current_millis - last_measurement_time);
      if (time_diff >= TEMPERATURE_READING_DELAY) {
        sensor_values.tmp36_sensor = analogRead(TEMP_SENSOR_PIN);
        convert_tmp36_reading_to_celsius();
        last_measurement_time = millis();
      }
    }

For the sake of completeness, here is the code to convert the sensor value from the TMP36 into degrees Celsius: 

    float convert_tmp36_reading_to_celsius() {
      const int adjusted_sensor_value= sensor_values.tmp36_sensor + TMP36_ADJUSTMENT; 
      const float volts = (adjusted_sensor_value * SUPPLY_VOLTAGE) / 1024;
      const float adjustedVoltage = (volts - 500.0);  
      sensor_values.temperature = adjustedVoltage / 10.0;
    }

This code is pretty simple. One of my TMP36 sensors is a bit...weird. It seems to be miscalibrated or perhaps damaged. The constant `TMP36_ADJUSTMENT` is my attempt to correct the readings from that one particular sensor. I've since bought some new TMP36s, so the value of this constant is 0.

Determining the Distance
------------------------

Once we have the air temperature, we can figure out how far away the water is from the Ping))). Let's first look at the code, followed by a quick explaination:

    int update_distance() {
      const unsigned long ping_value = read_ping_value();
      const unsigned long ping_delta = abs(ping_value - sensor_values.ping_sensor);

      if (ping_delta >= MEANINGFUL_DISTANCE_DELTA) {
        sensor_values.ping_sensor = ping_value;  
        convert_ping_duration_to_distance();
        return 1;
      }
      else {
        return 0;
      }
    }

The first thing we do is retrieve the time (in microseconds) it takes the sound pulse to hit the surface of the water and bounce back (stored in `ping_value`). I noticed that `ping_value` will fluctuate a bit, even though the water level in the sump hasn't. `ping_value` must change by a significant amount (I'm using 7 microseconds right now) before the ping value will be accepted. This function will return a value of 1 to indicate the distance has been updated.

### Reading Values from the Ping)))

The Ping))) uses the same pin for both sending and receiving the ultrasonic pulse. The PING))) is triggered by a HIGH pulse of 2 or more microseconds. In this example, we'll send out a short LOW pulse for 2 microseconds to clean things up for a 5 microsecond HIGH pulse. After the pulse has been sent, the Ardunio will listen for the return pulse. Here is the code that does this:

    const unsigned long read_ping_value() {
    	// Setup for the output.
        pinMode(PING_SENSOR_PIN, OUTPUT);
        // First a LOW pulse to clean things up
        digitalWrite(PING_SENSOR_PIN, LOW);
        delayMicroseconds(2);
        // Now a HIGH pulse for the actual ping.
        digitalWrite(PING_SENSOR_PIN, HIGH);
        delayMicroseconds(5);
        digitalWrite(PING_SENSOR_PIN, LOW); 
        // Listen for the return of the signal
        pinMode(PING_SENSOR_PIN, INPUT);
        return pulseIn(PING_SENSOR_PIN, HIGH);
    }

### Converting the Ping Duration to a Distance

Once we know how long a ping took, we can convert that to a distance. The speed of sound is 331.5 m/s, give or take. It does vary depending on air temperature and pressure. I'm ignoring air pressure, largely because I don't have any Arduino sensors to measure it. Adjusting the speed of sound for the air temperature is a pretty trivial caculation:

    float speed_of_sound(float temperature) {
      float adjustment = 0.606 * temperature;
      return SPEED_OF_SOUND + adjustment;
    }

Now that we have the speed of sound (in metres per second), we can easily calculate the distance that the ping travelled. Here's another code example showing how:

    void convert_ping_duration_to_distance() {
      // correct the speed of sound based on the air temperature, in metres per second
      const float adjustedSpeedOfSound = speed_of_sound(sensor_values.temperature);

      // Now we find the net distance the ping travelled (i.e from the sensor, to the object, and then back).
      // This value is in millimetres.
      float netDistance =  (sensor_values.ping_sensor * adjustedSpeedOfSound) / 1000.0;

      // The distance to the object, in millimetres, is 1/2 of the total distance.
      unsigned int distance = netDistace / 2;
      sensor_values.distance = distance;
    }

There is, of course, other code to this sketch, but it's the boring stuff that has to do with initialization and writing to the micro SD card. If you want to look at the complete sketch, you can find the code on in my [arduino repository on Github](https://github.com/topgenorth/arduino/blob/master/DistanceFinder/DistanceFinder.ino).
