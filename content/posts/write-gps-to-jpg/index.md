---
aliases:
- /2013-02-18-writing-gps-information-to-a-jpeg/
categories:
- Programming
comments: true
date: '2013-02-18T00:00:00Z'
tags:
- android
- Xamarin
- 'C#'
title: Embed GPS in a JPEG
---

One of the handy things about the JPEG format is the ability to store meta-data inside the image using [EXIF](http://en.wikipedia.org/wiki/Exchangeable_image_file_format). There are a few libraries out there for the various programming languages that can help you out with this, and Android actually has something built in to the SDK - the class [ExifInterface](http://developer.android.com/reference/android/media/ExifInterface.html).

Google's documentation on writing latitude and longitude to a JPEG are a bit light on details - they loosely hint at the format that latitude or longitude should have. (See the documentation for [ExifInterface.TAG_GPS_LATITUDE](http://developer.android.com/reference/android/media/ExifInterface.html#TAG_GPS_LATITUDE)). The API itself is pretty straight forward, but what Google doesn't tell you is HOW the GPS coordinates should encoded.

<!--more-->


There are a few articles out there that explain the different ways latitude and longitude may be expressed. You might want to [quickly read](http://www.geomidpoint.com/latlon.html) one of these articles to familiarize yourself with the different formats. 

EXIF expects GPS coordinates to be encoded using geographical coordinates (degrees/minutes/seconds). There is [Wikipedia article](http://en.wikipedia.org/wiki/Geographic_coordinate_conversion) that explains how to do the conversion and provides a Java sample. For the C# types in the crowd, here is an extension method that will convert a `double` to the DMS format that EXIF expects:

```csharp
public static class GpsHelpers
{
    public static string ToDMS(this double coord)
    {
        // gets the modulus the coordinate divided by one (MOD1).
        // in other words gets all the numbers after the decimal point.
        // e.g. mod = 87.728056 % 1 == 0.728056
        //
        // next get the integer part of the coord. On other words the whole number part.
        // e.g. intPart = 87
        var mod = coord % 1;
        var intPart = (int)coord;

        //set degrees to the value of intPart
        //e.g. degrees = "87"
        var degrees = intPart.ToString();

        // next time the MOD1 of degrees by 60 so we can find the integer part for minutes.
        // get the MOD1 of the new coord to find the numbers after the decimal point
        // e.g. coord = 0.728056 * 60 == 43.68336
        //      mod = 43.68336 % 1 == 0.68336
        //
        // next get the value of the integer part of the coord.
        // e.g. intPart = 43
        coord = mod * 60;
        mod = coord % 1;
        intPart = (int)coord;
        
        // set minutes to the value of intPart
        // e.g. minutes = "43"
        var minutes = intPart.ToString();
        
        //do the same again for minutes
        //e.g. coord = 0.68336 * 60 == 41.0016
        //e.g. intPart = 41
        coord = mod * 60;
        intPart = (int)coord;

        // set seconds to the value of intPart.
        // e.g. seconds = "41"
        var seconds = intPart.ToString();
        var output = String.Format("{0}/1,{1}/1,{2}/1", degrees, minutes, seconds);
        
        return output;
    }
}
```

This next C# code snippet will show you how to use ExifInterface to write/update the GPS information to your JPG:

```csharp
var exif = new ExifInterface("path to file");
exif.SetAttribute(ExifInterface.TagGpsProcessingMethod, "GPS");

// the variable latitude is a double that has been initialized elsewhere.
exif.SetAttribute(ExifInterface.TagGpsLatitude, latitude.ToDMS());
exif.SetAttribute(ExifInterface.TagGpsLatitudeRef, latitude > 0 ? "N" : "S");

// The variable longitude is a double that has been initialized elsewhere.
exif.SetAttribute(ExifInterface.TagGpsLongitude, graffiti.Longitude.ToDMS());
exif.SetAttribute(ExifInterface.TagGpsLongitudeRef, graffiti.Longitude > 0 ? "E" : "W");
```