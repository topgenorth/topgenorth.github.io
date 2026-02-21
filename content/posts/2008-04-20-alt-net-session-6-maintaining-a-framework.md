--- 
date: "2008-04-20T00:00:00Z" 
status: publish 
categories: 
  - Programming 
tags: 
  - .NET 
  - ALT.NET 
title: 'ALT.NET Session \#6: Maintaining A Framework' 
type: post 
---

[Jeremy Miller](http://codebetter.com/blogs/jeremy.miller/) talking about the trials and tribulations of keeping a [codebase](http://structuremap.sourceforge.net/Default.htm) viable and useful over the past four years.  A lot of tips and explanations were backed with diagrams on the whiteboard.  Kind of hard to blog that stuff, so this will probably be just a collection of bullets.

Lessons learned - a lot of them relate back to what are considered good, OO practices:

- [DRY](http://en.wikipedia.org/wiki/Don't_repeat_yourself), especially with the very small things.  When Jeremy was adding support for .NET 2.0, the generic support was problematic.  \
  Example:  Want to resolve a Repository\<T\>.  You can't just look for the class Repository\`1: i.e. was trying to resolve the class by using  typeof(Repository\`1).  This did not work.
- [Tell, Don't Ask](http://c2.com/cgi/wiki?TellDontAsk).  Didn't follow this to heavily at first, and so now effort has to be taken to rewrite code to adhere to this principle.
- Using a lot of Double Dispatch (*hah!  look Jeremy the picture did turn out*):
- If you need to refactor, do it now.  Procrastination only makes it (refactoring) harder and more costly.
- If you want to build a .NET framework and keep it around for four to five years, you should probably learn a bit about the fundamentals of .NET.
- Small steps, frequent commits to source code.
- Good solid battery of unit tests really helps with major changes.
- Moving more towards coarser grained tests.  Does the test check the functionality?  Not to worried about the intermediate steps.
  - Assertions based on side effects really don't work well.  Not very expressive, sometimes hard to figure out what what you're trying to test.
- It helps have tooling inside your tests in order to help you quickly create tests, especially the difficult to setup/create tests.  Will result in a faster feedback cycle.  This infrastructure is more strategic, can be very help.
- Jeremy recommends "Pragmatic Programmers"

Brief discussion about where to start learning all these pattern.  Advice is given to learn principles first (DRY, OCP, SRP, SOC, etc) as this will greatly help with the understanding and proper use of design patterns.
