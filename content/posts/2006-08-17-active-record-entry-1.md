--- 
date: "2006-08-17T00:00:00Z" 
meta: {} 
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
title: 'Active Record Entry \#1' 
type: post 
---

Well, after playing with [ActiveRecord](http://www.castleproject.org/index.php/ActiveRecord) for about a week and a bit now, and I can say it's kind of a love-hate relationship.  I like how easy it is to drop in a class, or to make changes to the DB schema and have that reflected in your model.  Contrawise, changing databases should be just as easy.

Troubleshooting is a real bitch, and I find the documenatation a bit on the light side.  Also, on the surface, the parent/child relationships seem pretty easy to setup and configure, but I seem to be having some issues with it.  Also, a familiarity with [NHibernate](http://www.nhibernate.org) definately seems to be helpful when debugging/troubleshoot.

Right now I'm going to assume that my difficulties are primarily related to the learning curve, and I am plodding along merrily, content in the belief that I will work things out and solve all problems in due course. Also, for now I'm not bothering to much with the support for some of the .NET 2.0 features, such as Generics.
