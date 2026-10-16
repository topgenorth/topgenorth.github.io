--- 
date: "2006-09-08T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
title: 'Active Record Entry \#1.5/Genom-e Express'
type: post 
---

Well, as predicted something did distract me from my [ActiveRecord](http://www.castleproject.org/index.php/ActiveRecord) experiment.  I got a copy of [Genome Express](http://www.genom-e.com) while at an [EDMUG](http://www.edmug.net/) meeting recently.  Given that my copy of Genome Express was shiny and new, I installed it and began playing.

My initialize impression is that it's promising.  I was able to very quickly reverse engineer a SQL 2005 schema and get a heirarchical data model going.  I was able to generate working DAL code for a 12 table database inside of a couple of hours.  About 75% of this time was spent reading the documentation.

One thing I'm not to sure about is how they pretty much replace SQL. Genome has it's own Object Query Language (OQL) for getting objects from database tables.  Given that I've been working with SQL for the past 12 years, I really don't see why I need to learn a proprietary, non-standard "query language" to find data.  Doubly so with [LINQ](http://msdn.microsoft.com/data/ref/linq/) and WinFX floating around.

Another thing that kind of gives me reason to pause is, as a consultant, I don't know how receptive clients would be to me coming in and saying that they have to spend up to \$3000.00 to buy another tool.  Especially when things like [ActiveRecord](http://www.castleproject.org/index.php/ActiveRecord) do the same job for free, and the source code is available.
