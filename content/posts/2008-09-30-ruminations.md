--- 
date: "2008-09-30T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - rant 
title: Ruminations of an IT contractor
type: post 
---

Today was my last full time day on this contract.  Tomorrow I start up full-time with another.  Personally, I've gotten in the habit of looking a my past contract and conducting my own personal retrospective on what I learned or how I would do things differently.  I figured that because my memory is getting worse in my old age, I'd started putting these things down on my blog.

**For a greenfield project, don't use the database someone hands off to you**

The project I was working on was greenfield - almost.  The business analyst spent a lot of time and effort gathering requirements, and this spilled out into him creating the database for us.  On the surface, to most people, this seems like a good idea.  In reality, I'd rate it slightly above mixing nuts and chewing gum for a snack.  Why do I say that?  Because, the database schema that was handed to me was highly normalized and (so I was told) optimized for reporting purposes - at the expense of the application.  This application was more like an order-entry system, with snapshots of the data at points in time being very relevant.  This "...optimization for reporting..." cause a lot of unnecessary work on the part of us poor developers.

The argument of "...the schema is this way to make reporting easy..." doesn't fly with me.  First off, we don't have any reports defined.  In fact, reporting wasn't within the scope of this project.  So, why are we worrying about it?  Secondly, if a certain schema was necessary for reporting, then that is where views and stored procedures come into play. 

I very much wish that we would have said, "Thanks for the effort, but we will create the schema we need to delivery the product.". 

*Lesson learned for future projects*:  Greenfield projects should not accept databases designed by someone who has no stake/input/authority on the application architecture.

**People are inherently obsessed with local optimization at the expense of the whole.**

One example of this I've already quoted:  effort was expended to create an academically pure database that would be good for reporting.  This local optimization cost the project in the whole, because it incurred extra effort in developing the application.

A second example in support of this claim is a touch more elusive.  I witnessed a fair bit of "requirements dickering".  Rather than looking at the project as a whole and trying to get the most bang for the buck (this project had a hard limit on dollars, but not on time), a lot of time was spent on arguing requirements.  There was a perception that unless everything that was in the requirements document was done, "professionally" tested, and properly signed off, the application as a whole was not useful.  It seemed that everything was important and had to be done.  This obsession with getting everything done was, in my opinion, getting in the way of getting things of value done.

To misquote Napoleon:  he who defends everywhere defends nowhere.

*Lesson learned for future projects*:  Really to me, this experience did provide more anecdotal evidence supporting the [Agile Manifesto](http://www.agilemanifesto.org/) and agile techniques.  Being a lowly contract developer, I was in no position to dictate priority or importance of work.  I'm kind of used to that as a consultant.  My opinion and advice was provided and the project leadership did with it what the wanted.  However, the process did open my eyes a lot.  I hope that if I ever find myself running the show in similar circumstances, I have the wisdom and the patience to see the big picture, and not the black and white words of some document written almost a year ago.
