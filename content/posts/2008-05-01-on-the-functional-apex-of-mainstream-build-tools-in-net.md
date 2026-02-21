--- 
date: "2008-05-01T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
title: On the Functional Apex of Mainstream Build Tools in .NET 
type: post 
--- 

Wordy title.  To wordy.  Kind of like build files these days. I remember when I first discovered Ant, and then [Nant](http://nant.sourceforge.net)\*.  I was pretty happy, as it allow a decent way to compile my Java (and C#) without using make files.  Life was good as I could finally introduce some structure into HOW code was compiled.  The build process was no longer using whatever "build" command the IDE exposed, hoping that I didn't forget a compiler directive or a file or a reference to some other library along the way.  Other programmers could also compile the code with out fear as well.  

Having a tool like Nant is pretty crucial to the whole concept of continuous integration. 

Somewhere along the way, though, Nant lost it's shine.  It isn't to hard to find these monster Nant scripts with all kinds of crazy things happening inside them.  Trying to work with these files can be a bit of a burden, to say the least. This takes me back to the title:  it seems to me that build tools like Nant have kind of peaked, functionally speaking.  

What does that mean?  We can always add more tasks (created in a real programming language) to do things for us, but in a lot of ways Nant is constrained by the fact that it is just XML. XML is good for config files (to a point).  It's bad for programming logic.  It is not at all uncommon to see in build files if statements doing all kinds of things.


We can always add tasks to Nant, but somethings just can't be handled by out of the box, one size fits all tasks from Nant (or [NantContrib](http://nantcontrib.sourceforge.net)).  As soon as you run into those things, you need to start writing code.  

We don't need to (and should not) make XML into another programming language.  

I spent a bit of time tonight playing with [Bake](http://code.google.com/p/boo-build-system/).  For those who don't know, [Bake](http://code.google.com/p/boo-build-system/) is to [boo](http://boo.codehaus.org) what [Rake](http://rake.rubyforge.org) is to [ruby](http://www.ruby-lang.org).  Or, in other terms, think of a build system that is actually based on a programming language, and not a configuration file.  

Why did I pick Bake?  Well, it's boo, and I want to learn boo.  Boo is .NET, so I can leverage what I already know.  Plus, I'm reading [Ayende'](http://www.ayende.com)s book [Building Domain Specific Languages in Boo](http://www.manning.com/rahien/), so Bake just seems to be a natural fit. 

So far, I'm liking it. In the span of a couple hours, I managed to figure out how to create a quick bake script (~ 40 lines of boo) to compile some code.  I'd say that this script more readable when compared to a Nant script.  Being pretty new, Bake doesn't have as many tasks as Nant.  However, it does seem pretty easy to create tasks for Bake. Plus, I have all the expressiveness of a programming language available to me. 

I did have one glitch that is worth mentioning:  the task to compile my code was using the [CSC.EXE from .NET 2.0](http://code.google.com/p/boo-build-system/issues/detail?id=3).  This is a problem when you're working with a .NET 3.5 codebase.  But, no fear, I hacked out a quick fix inside of about 15 minutes, and all is well again. I imagine that someone soon will blog about using Rake to build your .NET projects.  I eagerly await such a post.  In the meantime, I'm going to continue on with Bake, and see if it will meet my needs. 

 *NOTE:  I lump MSBuild in with NAnt as MSBuild, IMHO, is a clone of NAnt.*
