--- 
date: "2008-04-19T00:00:00Z" 
status: publish 
categories:     
    - Programming 
tags: 
    - .NET 
    - ALT.NET 
    - Linux 
title: "ALT.NET Session #5: Mono - Not Just For Linux" 
type: post 
---

Joe starts polling to see what people want to talk about.  Most seem to be interest the libraries for Mono (being that they also work on Windows/.NET.  So, Joe starts talking about libraries for/from Mono.

1.  [Mono.Cecil](http://www.mono-project.com/Cecil).  For all your reflecting and assembly modification needs.
2.  [Mono.Addins](http://www.mono-project.com/Mono.Addins).  I've been looking at this off and on today, and I have to admit it looks pretty intriguing
3.  [Mono.Rocks](http://www.mono-project.com/Rocks):  Handy extension methods.
4.  [Mono.Zeroconf](http://www.mono-project.com/Mono.Zeroconf): Zero configuration networking library
5.  [DBus#](http://www.ndesk.org/DBusSharp):  A C# implementation of [D-Bus](http://www.freedesktop.org/wiki/Software/dbus).
6.  [MonoCurses](http://www.mono-project.com/MonoCurses): An API for console based applications
7.  GTK# vs Windows:
    - My suggestion is to consider the target environment.  If you targeting Windows, stick with WinForms.  If you're targetting Linux/Mac, go with GTK#. 
    - Another issue that might influence your decision is that the documentation for GTK# is pretty sketchy, not very good.
8.  [IOMap](http://www.mono-project.com/IOMap).  Turning this flag on, will help you with some of the cross-platform development issues.  This is a portable library that will help resolve things like directory seperators, case sensitivity in paths, and that sort of thing.

A short session, which isn't bad.  Gives me a chance to float around to check out some other things.
