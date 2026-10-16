---
date: "2009-06-19T00:00:00Z"
status: publish 
categories: 
    - Programming 
tags: 
    - android 
title: Using IntelliJ for Android Development 
type: post 
---

*(Note:  this article is pretty dated, and used IntelliJ 8.*

So I have this semi-fancy Google [Android Dev Phone 1](http://developer.android.com/guide/developing/device.html).  Lately I've been devoting part of my spare time to learning about programming for [Android](http://www.android.com/) (the OS of the phone).  Google (probably because they didn't ask for my opinion and/or input) decided to use Java as the lingua franca for Android programming.  If you ask me - and I know you will - they should have used C# and Mono (I might be a bit biased here).  Luckily, years ago I had done Java programming, so I wasn't that intimidated by the use of Java on Android.

The first big question that every developer faces is which IDE?  There are a few Java IDE's out there, but if you ask me the only ones worth considering are [Eclipse](http://www.eclipse.org/) and [IntelliJ](http://www.jetbrains.com/idea).  The documentation for Android points you to using Eclipse.  Eclipse is a good IDE.  However, back in the day when I was getting paid for Java development, my employer got us all copies of [IntelliJ](http://www.jetbrains.com/idea/), from JetBrains.  I liked it.  I like it enough that if I landed a contract tomorrow that involved Java, I'd buy me a copy of IntelliJ.

So, all that being said, I figured I'd give IntelliJ a spin as I travelled down the stack-trace of Android programming.  Here are my observations, in general:

1.  There is an Android plug-in for IntelliJ.  Now, you might believe that development on the Android plug is dead.  Not true.  The plug-in is undergoing active development - it just seems to be kind of slow
2.  I found the installation of the Android plug-in for IntelliJ far easier than for Eclipse.  Just download the most current release, and then unzip to your plugins folder in your IntelliJ installation.  With Eclipse, [it is simple](http://www.opgenorth.net/getting-started-coding-for-my-android-dev-phone-1.aspx), but not when the documentation is wrong.
3.  The IntelliJ plug-in is simple, and seems to get the job done.  It's a bit to simple at this time, if you ask me.  The [ADT](http://developer.android.com/guide/developing/tools/adt.html) for Eclipse provides a far richer dev-centric experience for Android coding.  For example there are designers to help you with laying out your form, a lot more control over starting up the Android emulator, and better tooling for hooking up the debugger to either the emulator or an app running on the physical phone.
4.  Being a Resharper junkie, I found that IntelliJ was more natural for me to use.
5.  I didn't run into to many problems when I was trying to use/convert Eclipse project with IntelliJ. This is good, because the vast majority (all?) projects I've seen are all Eclipse based.

So, my conclusion at the end of the day, is that I'm going to stick with Eclipse for my Android development.  There just seems to be less friction at the moment if you're using Eclipse.  In a couple of months maybe I revisit IntelliJ and see what's new with it and Android development.  However, at this time, I'd like to really concentrate on learning the Android SDK, and it seems simplest to me right now with Eclipse.
