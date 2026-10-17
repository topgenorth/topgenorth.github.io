---
date: "2009-03-14T00:00:00Z"
status: publish 
categories: 
    - Technology 
tags: 
    - android 
title: Getting Started with My ADP1 
type: post 
---

After a bit of tinkering, I managed to provision my ADP1 setup without a SIM card.  A bit of google, and here is what I did:

1.  Download the Android SDK.  In my case, I unzipped it to C:\android-sdk-windows-1.1_r1.
2.  Connection the phone via the USB cable to my computer.  When the phone asks for a device.
3.  You'll get the new hardware dialog, when prompted for the drivers, you'll need to specify the location.  The Android SDK has the drivers, in my case they were at C:\android-sdk-windows-1.1_r1\usb_driver\x86.
4.  Once you have the drivers installed cd to c:\android-sdk-windows-1.1_r1\tools.
5.  Type adb devices.  This should list all the Android devices that you have connected.  If you don't see any devices listed, then you have a problem.
6.  Type adb shell.  This will direct your commands to your ADP1
7.  Now while at the adb shell, su to root, then : 
8.  cd /data/data/com.android/providers.settings/databases/
9.  sqlite3 settings.db
10. INSERT INTO system (name, value) VALUES ('device_provisioned', 1);
11. .quit
12. Reboot the phone
13. adb shell
14. am start -a android.intent.action.MAIN -n com.android.settings/.Settings

Once all that is done, you should be enable to use your ADP1 as if you had a SIM card in it (we'll except for the phoning part).

Useful link:  [FAQ: Unlocking/Activating a G1 or ADP1 Without A Sim Card](http://www.gotontheinter.net/content/faq-unlockingactivating-g1-or-adp1-without-sim-card).
