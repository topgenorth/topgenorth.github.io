--- 
date: "2009-03-26T00:00:00Z"
status: publish 
categories: 
    - Programming 
tags: 
    - android 
title: Getting Started Coding for my Android Dev Phone 1 
type: post 
---

Figured I was due to spend some time setting up a Linux VM and learning how to program my Android Dev Phone 1.  [Eclipse](http://www.eclipse.org) is what is recommended, so I thought I’d give that a try first.  So, with the help of [Suse Studio](www.susestudio.com), I quick built myself a VM with Java 1.6 (*Aside:  I love Suse Studio, I can provision a VM in minutes*).  I figured it would be pretty straight forward.  The docs on the Android Developer site for [installing ADT plug-in](http://developer.android.com/guide/developing/tools/adt.html#installingplugin) seem pretty straight forward and simple, and I remember Eclipse having a very rich ecosystem of plug-ins that were easy to install (something I wish Visual Studio had – hint, hint Microsoft).

However, I ran into some hiccups with the provided documentation.

The first annoying one was item \#4 in the list for Eclipse 3.4.  You’re directed to enter the location <https://dl-ssl.google.com/android/eclipse/> for the location of the ADT plug in.  This did not work for me.  The location I had to use was  <https://dl-ssl.google.com/android/eclipse/site.xml>.  There is a chance https might not work for you, then use <http://dl-ssl.google.com/android/eclipse/site.xml>.

After overcoming that hurdle, I tried to do the [Hello World](http://developer.android.com/guide/tutorials/hello-world.html) sample.  This did not work out so well – Eclipse crashed.  Turns out that the default packages for Eclipse provided by OpenSUSE doesn’t have the [Web Standard Tools](http://www.eclipse.org/webtools/wst/main.php), which is a requirement for using ADT.  So, I went back and uninstalled Eclipse, and download the tarball from the Eclipse website.  Then I installed and setup the ADT plug.
