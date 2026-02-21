--- 
date: "2007-12-14T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - rant 
title: "We Don't Want External Code" 
type: post 
---

One of the biggest discussions that I typically get when I try to introduce things like NHibernate (i.e. OSS) on a new contract goes like this:

"*We're a bit reluctant to use that because it will introduce more code into our code base that isn't ours. Because it's OSS, there's no support, and if there was a bug in it, we'd have to maintain it ourselves. That being case, we'd rather just write our own code, because that way we know what is going on with it and can maintain it better. We don't want to have to figure out somebody elses code.*"

There are variants of this argument, but the basic tenent is the same: we don't want code from others (note that NHibernate here is just an example, this criteria seems to be invoked frequently when suggesting OSS products). For some reason "internal code" (code written by employees or contractors working for a company), is deemed more maintainable and supportable than "external code" (code from 3rd parties, such as OSS projects).

As a consultant, I find huge flaw in this argument for one very simple reason: my mere presence on a client site is a sign that they have some tolerance to code that "isn't theirs". My typical engagements involve me coming in, writing code, and then moving on. I guess I'm kind of like an IT gyspy that way, but with out the gaudy fashion sense and the ability to place curses on those who cross me.

Anyway, the odds are VERY good that I will have to go through some sort of hand-off procedure at the end of my contract. In a perfect world, this would be an in depth session with an employee of the company, closing of any knowledge gaps of the code I was working on.

Typically, this involves explaining the architecture of my code, how to configure it, how to deploy it, etc. Even when I work on teams, there is still some sort of knowledge transfer about my specific parts of the code, with the more general architecture/configuration/deployment knowledge being disseminated over the course of the contract.

Realistically, this isn't a very in depth or detailed process: usually it just involves some high level descriptions, nothing in detail. In fact, often this is usually just a formal acknowledgement that somebody has saddled with the responsibility of looking after my code now that I'm gone, and they know where to find the files. Formal documentation consists primarily of a README, or maybe a few pages in a Word document.

Realistically, the knowledge that has been passed on is seldom enough to quickly allow someone to solve even the most simple bug. So guess what: the code was created internally, but you now have to deal with all the issues that you used to exclude OSS projects:

-   There is no support - you will have to fix all bugs yourself.
-   At a very low level, you don't know what is going on so you have to figure out the code yourself.

Maybe I'm biased, but in a lot of cases, I find OSS products easier to work with. Typically there are a lot of forums, mailing lists, and other users that I can ask questions of when I get stuck. Not so much with internal code. In many cases, even the people who wrote the code aren't helpful, often for reasons as simple as the code was written a year ago and they haven't used it since. In fact this very reason (failing memories) can make internal code more like external code over time.

Before we finish up, let's just beat down the "...no support..." argument right now. With mininal effort, I can find commerical third-party support agreements for the bulk of the OSS products I currently use. And from what some would perceive to be reputable vendors - these aren't fly by night organizations. As well, regardless of support or not you **will** need to maintain a bug regardless of external or internal code. You will have to assign someone to figure out what is being done with issue, and possible devise a work around - this is a constant no matter if the code is internal or external.

You don't want external code? Odds are that you've already go some. Why start splitting hairs because is OSS?
