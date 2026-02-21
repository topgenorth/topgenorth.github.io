--- 
date: "2008-04-18T00:00:00Z"
status: publish 
categories: 
    - Programming 
tags: 
    - rant 
title: On Stored Procedures 
type: post 
---

Yesterday myself, [Don](http://www.igloocoder.com), [D'Arcy](http://geekswithblogs.net/dlussier/Default.aspx), and Eric were wandering around Seattle, just checking out the sights after the MVP Summit.  We took a break from the usual "run down D'Arcy and Manitoba" shtick, and actually had a serious conversation on the relevance of stored procedures for your typical database development/line of business app.  D'Arcy [blogged](http://geekswithblogs.net/dlussier/archive/2008/04/18/121341.aspx) his take on it already.  I was going to reply in his comments, but as the comments grew, I figured my own post was in order.

I wouldn't go quite so far as to say that sprocs are obsolete, but I really don't think that they are that important anymore.  Sure, there will be certain circumstances where you need stored procs:  reporting comes to mind, or maybe you need to to some really DB specific things.

However, for a lot of your day to day CRUD, you don't need stored procs.  Use an ORM.  I use [NHibernate](http://www.nhibernate.org), and as such will be speaking from that point of view.

To support your typical CRUD for a table, you usually need at least four stored procs:  Insert, Update, Delete, and Find.  Usually it's more - a lot more because of querying concerns.  These have to be maintained, and versioned, and kept in sync with the application.  This is friction.  Using NHibernate, you have a mapping file per table that is typically embedded in your assembly as a resource.  This is frictionless (relative to stored procs).

It will be said that stored procs provide you with a single API for your database which will shield your application for DB changes.  Here, I don't agree.  A lot of times if you're making drastic changes like this to the database, you're probably making changes to your application.  You're probably going to be recompiling and sending out new binaries and new stored procs.

Now, I'm sure that everybody in the stored proc camp is loading up their [blunderbusses](http://en.wikipedia.org/wiki/Blunderbuss) full of "stored procs are faster" shot and getting ready to fire a volley.  And, I'm sure that they have the "dynamic SQL is insecure" ammo in easy reach for the second volley.  This is not true.  NHibernate creates parameterized queries - parameterized queries are just as fast as stored procs.  And, because these are parameterized queries, they are just as secure as stored procs (*edit:  by secure, I mean resistant to injection attacks and the like*).

Another point to consider is this: most programmers are not DBA's.  Their proficiency is in writing code (C#, VB.NET).  Keep your programmers doing what they do best: coding in the language they are most proficient in.  I don't want to say that programmers write bad SQL, but that NHibernate will probably create the SQL statements that are just as good (or better) than what a programmer will do.  There isn't just one database driver in NHibernate churning out generic SQL for all database platforms.  The database drivers are very specialized modules that are optimized for the database in question (i.e. MySQL, Oracle, SQL Server 2000, SQL Server 2005).

Honestly though, this debate (ORM vs stored procs) has been going on for while.  I know that there are still many places that are firmly entrenched and will only use stored procs.  So, to say that stored procs are obsolete might be a bit harsh.  I do believe that they aren't as relevant anymore.
