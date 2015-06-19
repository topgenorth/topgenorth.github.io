---
layout: post
title: "Windows 8 64-bit and Android Debug Bridge (Where is my Galaxy Nexus?)"
date: 2012-09-25 20:05
comments: true
categories: [android, Windows 8, Galaxy Nexus]
---
Setting up a new VM for development - this one based on Windows 8 64 bit. Not that I really want to, but it seems that I need to for work (yes, yes, first world problems). So the usual fun with standing up a new VM:

* Install OS
* Download Chrome and Firefox and ditch IE
* Download Resharper
* Remember that you need Visual Studio for Resharper so install that.
* Install Java SDK
* Install Android SDK
* Install Intellij and Eclipse
* etc.

Of course, then I notice that my phone, a Galaxy Nexus, isn't being recognized by Android Debug Bridge.  This is a problem as I much prefer to develop using a device as opposed slow emulator that Google ships for Android, and you can't deploy to the device without ADB.

<!-- more -->

The answer to the problem can be found over on this thread at [XDA-Developers](http://forum.xda-developers.com/showthread.php?t=1583801).  Here's the short version:

1. Download the [USB drivers](http://www.mediafire.com/download.php?2tunwdxr3q2q8ec).
2. Reboot the computer. This isn't your usually reboot. You'll need to [access the Windows 8 Boot Loader and Advanced Boot Options](http://www.tips-trick.com/use-access-windows-8-boot-loader-advanced-boot-options/). Basically, go to a command prompt and reboot using `shutdown.exe /r /o`. You;ll want to change the driver signing settings to allow unsigned or unverified driver installation.
3. Once you allow unsigned/unverified drivers to be installed, you can reboot into Windows 8 and connect your Galaxy Nexus.
4. Run `devmgmt.msc`. You'll see that your Galaxy Nexus has the yellow triangle over it.  Install the drivers you download in step #1 (it's a self extracting EXE).

Viola! Now your Galaxy Nexus will be recognized by ADB. 

