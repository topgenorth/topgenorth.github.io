--- 
date: "2007-09-24T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
title: Unit Testing Data Access
type: post 
---

One thing that I don't like about writing tests is some of the jiggery-pokery that goes on with testing database access code. Jiggery-pokery being: ensuring the tables are there, up to date, and are holding the data that they are supposed to hold before and after the test has run. If you don't pay attention to these details, you get a lot of false negatives on your unit tests. This will result in a loss of confidence in your unit tests. When this happens you stop running them, and loose confidence in your ability to refactor without fear.

In my Petshop2Monorail side project I'm working on in my spare time, I decided to see about using an in-memory database for my tests. I would get [ActiveRecord](http://www.castleproject.org/activerecord/) to create the database each and every time a test fixture runs. There may (or may not) be some activity involved with populating the database, but at least I have tight control over the database schema and the data I'm working with.

I checked out the [SQLite](http://www.sqlite.org/) documentation, and in theory one should be able to use [SQLite](http://www.sqlite.org/) as an in-memory database. I couldn't get it to work. I'm not to sure if it's something I'm doing wrong or if it's a limitation of the [ADO.NET data provider I'm using](http://sqlite.phxsoftware.com). For now, I'm willing to turn a blind eye to this shortcoming, and use a file on disk. Yes, I am aware of some of SQLite's other shortcomings (namely concurrency), but for the task at hand I don't think that these shortcomings will negatively manifest themselves.  Yes, I'm aware that I'm having a unit test use a file on disk (something I say you shouldn't do).

The one glitch I ran into was with [ActiveRecord](http://www.castleproject.org/activerecord). I kept getting the error *The IDbCommand and IDbConnection implementation in the assembly SQLite.NET could not be found*. A quick bit of googling, and [I had my answer](http://sqlite.phxsoftware.com/forums/t/564.aspx). To summarize: There are two ADO.NET drivers for SQLite, and so therefore two NHibernate drivers: [NHibernate.Driver.SQLiteDriver](http://adodotnetsqlite.sourceforge.net/) (old) and [NHibernate.Driver.SQLite20Driver](http://sqlite.phxsoftware.com/) (new). NHibernate.Driver.SQLite20Driver is what I should have been using.
