--- 
date: "2008-10-18T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
title: TypeMock, TestDriven.NET, and Red Tests 
type: post 
---

Lately I've been experimenting with [TypeMock Isolator](http://www.typemock.com/),  and it's new AAA syntax.  For the past two years I've been a diehard Rhino.Mocks kind of guy, but figured that it's time to check out other tools.  Anyway, I had a situation where a unit test of mine was failing when I ran it with [TestDriven.NET](http://www.testdriven.net/), but would pass when I ran it using the unit test runner in [Resharper 4.1](http://www.jetbrains.com/resharper).

Usually when I develop, I write individual tests and then run individually with TestDriven.NET and collectively with Resharper.  In this case, as I was writing one unit test, it kept failing with TestDriven.NET.  At first I thought it was just me being stupid (always a good place to start), and then I was worried that perhaps the documentation for TypeMock was to blame.  So, I sent a email to Avi at TypeMock, mostly expecting confirmation of my stupidity.

Turns out the problem in this case was pretty obscure one (to me).  At home, I do my development in a VM running Windows 2008 64 bit.  When Resharper runs your unit tests, it does in a 32 bit process.  TD.NET, on a 64bit OS,  runs as a 64 bit process.  If you get TD.NET to run as a 32 bit process, then your tests will run fine under TD.NET.

To do so, from the Visual Studio 2008 Command Prompt, change to the directory that you have TD.NET installed in.  Then use corflags:

corflags /32bit+ ProcessInvocation.exe

Note that it's probably best to do this when logged in as the Administrator.

I will say that I was happy with the support I got from the guys (Avi, Gil and Ohad) at TypeMock.  Given the fact that we're about a half a world apart (western Canada vs. Isreal), they provided prompt, excellent support.  My thanks to them.
