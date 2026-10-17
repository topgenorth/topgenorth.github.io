--- 
date: "2007-11-15T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
    - mono 
title: 'Fun with Open Source: OpenDental' 
type: post 
---

The past week I've been dabbling with an open source program called [Open Dental](http://www.open-dent.com/) - mostly trying to see if can get it to compile under Mono, and running under Linux.  I figure that this would be a good opportunity to and work with a cross platform application.

According to their website, Open Dental has been supported under Linux since v4.7.  Here are some notes of my efforts so far.

You will need Mono v1.2.5.  It seems that there is a problem with the Linux binary installer ( a known bug that will be corrected in 1.2.6).  I used the [OpenSUSE 10.2 VMWare image](http://www.mono-project.com/Downloads) which had a 1.2.5 install all set up.  That solved my problem of getting a current Linux distro with the most recent version of Mono.

There is a website for getting [Open Dental to run under Ubuntu](http://opendental.carlier-online.be/ubuntu.html), and instructions on how to [compile on Linux](http://opendental.carlier-online.be/source.html).  I couldn't get the application to compile under Linux using those instructions.  I suspect that they are a bit out of date.  What I ended up doing was compiling the application in VS2005, setting the build to LinuxRelease.  I then copied the binaries over to my OpenSUSE VM, and ran Open Dental.

Now, Open Dental uses MySQL 5 for a database backend.  The problem that I ran into next is that the database script that is provided to setup the database is for a very old version of Open Dental (like v3.x).  Open Dental is supposed to be smart enough to update the database to the correct version.  However the DB upgrading process seemed to keep crashing.

What I ended up doing was installing the trial version of Open Dental.  This created a database for me.  Once I had a database, the application seemed to run.

A curious thing is that when I would try to run Open Dental on Windows, using Mono 1.2.5.2, the application crashes.  No such problems running under Linux though.
