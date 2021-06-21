---
categories: ["Programming"]
tags: ["C#", "android", "Xamarin"]
comments: true
date: "2014-02-16T14:40:03Z"
title: Using Estimotes with Xamarin.Android
---

I recently bought some [Estimote](http://estimote.com/) beacons (a 3rd party iBeacon-like device) - largely because they seem like a cool and nerdy kind of thing. It has an [Android SDK](https://github.com/Estimote/Android-SDK) which will allow Android devices to interaction with devices. With a little big of effort, I managed to create [Xamarin.Android binding](https://github.com/topgenorth/Estimotes-Xamarin/) and port the sample Android project provided by the Estimote SDK.

You can see an example of the app in these screenshots:

![image](https://s3.amazonaws.com/opgenorthnet-blog/estimote1.png) 

<!--more-->

My Xamarin.Android port of the sample project is slightly different than the sample that Estimote provides. The obvious change is the use of a [QuickAction](https://github.com/topgenorth/QuickAction-XamarinAndroid) menu that popups up when you select an Estimote. I found this to be a more intuitive interface than what came with the default Estimote example. The menu provides you with two options:

## Ranging
The `DistanceBeaconActivity` tries to estimate how far away the selected Estimote is. Estimote refers to this as "ranging". The outer blue circle is 6 metres, so the screenshot below was taken when my phone was about 3m away from the estimote.

![image](https://s3.amazonaws.com/opgenorthnet-blog/estimote2.png)


## Monitoring 

The `NotifyDemoActivity` activity shows how to fire off a notification when the user walks into a "region" that the mobile device has moved into the vicinity of some beacons.

![image](https://s3.amazonaws.com/opgenorthnet-blog/estimote3.png)

 