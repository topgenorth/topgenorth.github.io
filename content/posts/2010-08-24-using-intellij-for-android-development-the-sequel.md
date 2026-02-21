--- 
date: "2010-08-24T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - android 
title: "Using IntelliJ for Android Development â\x80\x93 the Sequel" 
type: post -
---

A while ago, I posted a blog article about [using IntelliJ for Android development](http://www.opgenorth.net/2009/06/19/using-intellij-for-android-development-2/).  Given that was a year ago, and one version of IntelliJ later, I thought I would do a follow up post.  Long story short (and to sound like a TV commercial):  I liked IntelliJ IDEA 9 so much, I bought a license.

Since I blogged last year, the Android plug-in for IntelliJ has really matured.  I guess the only draw back to it is that you only get the Android plug-in when you buy the Unlimited Edition of IntelliJ – it’s not in the Community Edition.  Here are some general comments/thoughts/observations of mine:

- It’s cool to have IntelliSense in the XML files.  One of the biggest failings of Android (perhaps Java in general?) is the painful lack of a surface designer for a user interface.  [DroidDraw](http://www.droiddraw.org/) is tolerable with enough [scotch](http://www.malts.com/index.php/Gateway-en).  One could say say the same thing about the UI “designer” that comes with the [ADT](http://developer.android.com/sdk/eclipse-adt.html).  So, much of the time I find myself just plugging away at the UI in XML.  Sub-optimal, but I don’t have the resources to write a nice designer for the Android layout files, so I’ll just pour another double of Talisker and carry on.  :)
- I like the fact that, as a Resharper junkie, IntelliJ seems very natural to me to use.  The keyboard mappings are not 100% between IntelliJ and Resharper, but that is merely semantics. I find that within about 30 minutes or so I’ve recovered from the differences and that I don’t suffer to much of a penalty switching between the two.
- I’m a bit more structured when it comes to deplopyment.  I don’t like how IntelliJ wraps all the deployment magic for me.  Don’t get me wrong – it’s handy as all hell for development and getting an APK on my phone real quick.  For production level stuff though, I’m finding that Rake more than handles what I need done.

Of course, with [Monodroid](http://www.monodroid.net/) now in a closed beta and looming in the future, perhaps IntelliJ will be redundant to me?  Can I actually just write my Android applications in C# and forget about Java? As [Monodroid](http://www.monodroid.net/) is in a closed beta, I can’t really comment much about it at this point in time.  I think I can say, without the [Mono](www.go-mono.com) gods smiting me from above with hail, thunder, and lightening, that I’m cautiously optimistic that Monodroid will be appealing to those who want to target mobile devices.

So, over-all impression: 

- I like IntelliJ better than Eclipse for Android development.
- I’d say that IntelliJ is worth the money I spent on the unlimited license. 

*This claim may not be valid in all states.  It is also void where prohibited by law.  There is a good chance that it may not apply in Quebec.  This definitely does not include batteries.  YMMV.*
