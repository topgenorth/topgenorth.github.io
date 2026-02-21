--- 
date: "2007-07-24T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
title: 'Coding for Fun: Spying on Serial Ports' 
type: post 
---

Yesterday I was house-bound looking after a sick eight year old boy.  To help pass time, I decided to play around with my chronograph (to clarify: in this context a chronograph is a tool to help you measure the velocity of projecticles, i.e. bullets).  I happen to own a [Shooting Chrony](http://www.shootingchrony.com/) Beta Master, which you can, in theory, hook up via a serial port to your computer, download the velocities of up to 60 shots, and use that data to help you with building up some ballisitic tables for your firearm and hand-loaded ammunition.

The only problem is that the software that Shooting Chrony sells sucks.  It was probably okay ten or twelve years ago, but by today's standards it's lacking.

I figured that it would be neat to try and figure out how the Shooting Chrony software communications with the actual chronograph.  Typically serial port communications isn't to complex, but figuring out what is happening on the wire isn't necessarily the easiest thing.

To help me, I used [Eltima](http://Eltima)'s [Serial Port Monitor](http://www.serial-port-communication.com/serial-monitor/).  This handy little application allows you to see all the traffic on a given serial port, in both directions.  You can even save a log of the traffic for later analysis.  Pretty handy little tool, well suited for just this kind of thing.

So, I started up Shooting Chrony's application, started up Serial Port Monitor, and proceeded to download the velocities from my last trip to the range.  I then spent some quality time dissecting the log of the traffic generated, and figured out what commands I need to send to download the velocities from the chrony.  A couple more hours inside VS2008, and I had a quick and dirty WinForms app that would download the data from the chrony and display it in a simple text box.

It's nothing fancy, but it does the trick.  The next step is to parse this data into a more meaningful format, persist it somehow, and then do a self-taught crash course in exterior ballistics for my own home grown .NET ballistics program.

Of course, I'll try to keep this compatible with [Mono](http://www.mono-project.com/Main_Page).  :)
