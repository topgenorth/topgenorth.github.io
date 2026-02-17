--- 
date: "2008-04-19T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
    - ALT.NET 
title: 'ALT.NET Session #4: Sprocs Good Or Evil / NHibernate with Cartoon Bears' 
type: post 
---

Two topics merged into one.  Rod Paddock wants to talk about stored procs, and others want to learn how to explain NHibernate to other people who aren't familiar with it (and minimize the jargon).

Rod uses a custom code-gen solution based heavily on sprocs - a data driven approach.  Sounds like it works well for him.  Oren concurs that this technique could be very effective in certain circumstances.  It will have problems with complex situations that deal with convoluted/difficult data scenarios.  He's giving an example, but I just can't keep up with him.  The point of Oren's story is that a domain driven approach will would better when you're not dealing with data but with data and behavior.

Brad Abrams brings up the point of noun centric vs. verb centric  designs.  Noun centric == data driven.  Verb centric == domain driven.

Oren talks about one of the big advantages of DDD.  We can very easily change the model, as it is all in code.  Tools like R# allow us to make changes quickly, and then NHibernate will allow us to update the database just  as quickly.  Databases are an implementation detail, part of the application, a mere persistence store.  A good domain design will generally lend itself to a  decent database design.

Apparently it is possible to suffer from an SQL injection attack with NHibernate.  According to Oren, you have to be pretty stupid for this to happen, but it can happen.  I did not know this.

Topic changes:  what do you do when you come to a client who has 1.5TB of established data and database.  How do you deal with that?  Ideally, you claim ownership of the data, and carry on.  This isn't very realistic.

Oren starts explaining that NHibernate can allow you to partition the data in existing databases to match your model.  He suggests that it might be better to speak with the DBA to make a new model, as this approach might take a lot of effort.  Might be smarter/better to change the persistence.

Oren's preference is to generate the HBM's by hand.  He wants the pain to be real.  The logic is that the pain will force you to thing about your model, and helps you focus on what is important to your model.  By generating the code, you end up with, for example, a domain model that has 200 classes/tables and classes with 700 fields.

Another advantage of using NHibernate:  you get a nice way to set up a unit of work, and can specify boundaries for your application.  For example, you can, via an HttpModule with your unit of work, limit the number of queries (trips to the database).  Oren:  Going to the database is the best place to optimize, not the query itself.  Minimize the trips to the database.  You can enforce this limit right away.  It is not a problem that will hit you out of the blue in production.

NHibernate is very complex, and the learning curve very steep.  Oren argues it is not overly complex, and this complexity allows you to very advanced things.  For the simple stuff, NHibernate is very easy.  It is very irresponsible to just parachute in, introduce NHibernate, and then disappear.

Oren quotes:

- "I tend to be nice to people that pay me"
- "Use a set, that is all"
- "Don't worry about performance until you see you have a hotspot and are using a profiler"
- "Whoever designed Linq bordered between genius and madman"

[Ben Scheirman](http://www.flux88.com/) refers us to [Chapter 6](http://www.hibernate.org/hib_docs/nhibernate/1.2/reference/en/html/collections.html) in NHibernate.  Important for collections.

It seems that this session is not so much stored procs, but a Q&A session from the community about what exactly NHibernate can do.  Oren's knowledge and experience

The CLR is very fast, asserts Oren Eini.  Rod Paddock disagrees.  With WebForms, it isn't the CLR that is slower, it is all the stuff that goes on behind the scenes with the page lifecycle.

The question is asked:  Are datasets more efficient that NHibernate.  Apparently some people get hung up on these types of things, and claim that tools like ORM's aren't good because they add overhead.  Sounds like premature overhead to me.

Unrelated trivia:  This is the latest in the year it has snowed in Seattle since 1968.
