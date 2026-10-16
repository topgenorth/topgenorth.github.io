--- 
date: "2007-02-04T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
title: Embedded Database and .NET 
type: post 
---

As mentioned in some of my previous blog entries, I'm looking for am embedded database.  At the present, I think that I will remove SQL Server CE for now.  The biggest reason is that, as part of my pet project, the application to run on [Mono](http://www.mono-project.com/Main_Page) as well.  So, that kind of leaves [SQLite](http://www.sqlite.org/) and [Firebird](http://www.firebirdsql.org). \
Now, in theory, it should matter much between the two for what I want to do.  I'm planning to use [ActiveRecord](http://www.castleproject.org/activerecord/index.html) for my data layer, and I see that both [SQLite](http://www.sqlite.org/) and [Firebird](http://www.firebirdsql.org) are supported.  So, switching between [SQLite](http://www.sqlite.org/) or [Firebird](http://www.firebirdsql.org) will be pretty minimal.  What about stored procedures, I hear you say?  Well, truth be told, in my old age, I've sort of drifted away from stored procedures and look at them with a suspicious eye.  So, the fact that [SQLite](http://www.sqlite.org/) doesn't have stored procedures really doesn't bother or impact me at all.\
I'll do a bit more comparison between the two, and then decided from there which database to use.
