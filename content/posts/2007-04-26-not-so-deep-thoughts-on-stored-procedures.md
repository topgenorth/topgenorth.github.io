--- 
date: "2007-04-26T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
title: Not So Deep Thoughts on Stored Procedures 
type: post 
---

Lately I've come to the conclusion that stored procedures are more of a specialist's tool than a generalist.  To me, stored procedures are the kind of thing you use when you need to optimize your data access, or you have to do something DB specific.  Sure, I've seen lots (and written lots) of stored procedures to do the basic CRUD (mostly in [SQL Server](http://www.microsoft.com/sql), but also in [PostgreSQL](http://www.postgresql.org)). These days though, I almost think that one doesn't need stored procedures for the basic CRUD, only for specific and special cases.

*Right Tool for the Right Job*

My logic for this is pretty simple: OR/M tools are pretty good these days.  I'm going to single out [NHibernate](http://www.nhibernate.org) in this case, as that is what I've got the most familiarization with.  They way I see it, [NHibernate](http://www.nhibernate.org) will do as good a job with the basic CRUD stuff as I will rolling my own stored procedures.  Factor in a code generation tool like [MyGeneration](http://www.mygenerationsoftware.com), and you're getting a DAL out the door pretty fast.

*Separation of Concerns*\
With the CRUD neatly rolled up into an [NHibernate](http://www.nhibernate.org) DAL, one can then keep business logic where it belongs:  in code (specifically a business tier) and not in the database.  One of the pitfalls with stored procedures is that sometimes business logic leaks into them.  If you ask me, business logic doesn't belong in your database.

*Maintainability*\
Need to debug a stored procedure?  That usually isn't as fun or as easy as debugging code.  This is doubly so if you've got a good battery of unit tests to back your code.  Many times I've run into a situation when a change to a stored procedure requires re-compiling the application and updating the database.  I find that it's nice when you can remove one of those steps.

*Specialization*\
As a consultant, over the past few year, I've had to work with a variety of RDBMS's:  [SQL Server](http://www.microsoft.com), [Oracle](http://www.oracle.com), [MySQL](http://www.mysql.com), [PostgreSQL](http://www.postgresql.org), and Microsoft Access (Jet) to name a few.  Each of those, if they do happen to have facilities for stored procedures, has their own way of doing so.  A tool like [NHibernate](http://www.nhibernate.org) relieves me from learning the intricacies of all these databases.  I can send my time concentrating on things like architecture, business rules, and user interface knowing that [NHibernate](http://www.nhibernate.org) has my back for my DAL. 

I'd be curious to hear what others think.
