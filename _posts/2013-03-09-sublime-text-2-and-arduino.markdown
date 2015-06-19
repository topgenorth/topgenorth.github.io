---
layout: post
title: "Sublime Text 2 and Arduino"
date: 2013-03-09 16:38
comments: true
categories: [arduino]
---

If you're looking to get into Arduino, and you're a programmer, the first thing that will jump out at you is the Arduino IDE. It's best described as "spartan" (to say the least). As I'm used to full featured IDE's I started looking for a replacement to the default Arduino IDE. 

There are extensions to use Visual Studio, but that means me starting up a VM to run Windows which I don't really want to do for Arduino development. There is a another IDE which looks promising called Maria Mole - but it's Windows only so not really a contender for me.  I need something for OS X. I looked at setting up Eclipse as my default IDE, but ran into some issues with that. Nothing to major, but as I don't like Eclipse in the first place I wasn't to motivated to sort things out, so I abandoned Eclipse as an IDE choice.

The next thing I tried was [Sublime Text](http://www.sublimetext.com/). There is an Ardunio plugin called [Stino](https://github.com/Robot-Will/Stino) that turns Sublime into a not bad IDE. In terms of writing your programs, Stino can pretty much do everything the Arduino IDE can do: compile programs, upload them to your Arduino board, import libraries, etc.

<!-- more -->

Installing Stino isn't that bad:

1. First make sure that you have downloaded [Arduino 1.0.3](http://arduino.cc/en/Main/Software). I'm not to sure how well Stino will work with the current beta.
2. In Sublime Text, go to Package Control, and type `Install Package`.
3. Search using the keyword `Arduino`, you should see a couple of packages - one contains Stino and the other are a couple of snippets.
4. Next open a `.ino` file in Sublime Text. When you do this the `Arduino` menu should appear in the Sublime toolbard.
5. From the Arduino menu, specify the location of the Ardunio directory, i.e. `/Applications/Arduino.app`.

Done!

To monitor the serial port, I'm using [CoolTerm](http://freeware.the-meiers.org/).  Seems to be "good enough" for what I want to do, and it's free. On Windows, I'd probably use something like puTTY.

[1] Blog post for Stino: [http://kaixin.netii.net/stino-a-sublime-text-2-plugin-for-arduino.html](http://kaixin.netii.net/stino-a-sublime-text-2-plugin-for-arduino.html)