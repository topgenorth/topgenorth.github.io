---
categories: ["Personal"]
tags: ["android"]
comments: true
date: "2012-05-02T00:00:00Z"
title: Galaxy Nexus - Why don't you stay connected?
---

I recently got a Galaxy Nexus, and like a typical geek I [unlocked the bootloader and then rooted it](http://androidforums.com/international-galaxy-nexus-all-things-root/452146-how-root-gsm-hspa-samsung-galaxy-nexus.html). Life was good running Android 4.0.1. Well sort of. I had problems tethering my MacBook Pro via the WiFi hotspot, but no problems using Bluetooth. So nothing I couldn't work around.

Then I received an OTA update to Android 4.0.4 recently.  And this was when things started going not so good - specifically, for some blasted reason, I kept losing connectivity to Wind Mobile's network. At first I thought it was Wind Mobile having issues. This would be odd, because for me, Wind Mobile has been pretty solid. To troubleshoot I pulled my SIM card and dropped it into my Nexus One. Everything worked fine. So apparently something with my phone.

None of the simple tricks worked:

* pull the battery for 45 seconds
* verify the APN settings
* pull and re insert the SIM card.

I'd had good luck with [CyanogenMod](http://www.cyanogenmod.com) in the past, so I figured that maybe by installing that my problems would go away. No such luck. 

After a bit of searching, the nearest thing I could figure out is that the radio firmware I received with Android 4.0.4 (XXLA2) was troublesome - it seems that there are reports of people having issues with it going back to March or so. One suggestion that I followed through on was flashing a new firmware for the radios.    

To make a long story short I went over to the [Galaxy Nexus I9250 Baseband dumps collection](http://forum.xda-developers.com/showthread.php?t=1405345) page at [XDA-developers](http://forum.xda-developers.com/index.php), and update my radio to UGKL1. Now things to work just fine. If I understand things correctly, this radio has better support for the 850/1900/AWS frequencies that Wind Mobile uses.

Hopefully in the near future I'll remember to do another blog post on what I did. The information is out there, but it is a bit scattered.