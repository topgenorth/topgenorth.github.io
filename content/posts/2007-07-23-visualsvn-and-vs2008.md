--- 
date: "2007-07-23T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
title: VisualSVN and VS2008 
type: post 
---

So last night I installed Visual Studio 2008 RTM on my laptop.  This was a clean install - I did not have any beta versions of VS2008 installed.  When I went to try and do anything in VS2008, I kept getting the message 'Visual Studio has encountered an unexpected error.".  This error happens when I try to do anything, including VS2008.  The only way to close VS2008 was using Task Manager.  Most annoying.

A quick search, and I see that [JP Boodhoo has the same problem](http://www.jpboodhoo.com/blog/VS2008BringingAttentionToAnIssue.aspx).  The comments on JP's blog seems to point to [VisualSVN](http://www.visualsvn.com/) as being the culprit.  I uninstalled [VisualSVN](http://www.visualsvn.com/), and everything seems to be working again.  So, the problem was the add-in.  I then installed a new version of [VisualSVN](http://www.visualsvn.com/) (v1.3.1), and VS2008 seems to be working again.

As an side, I see that the is now a [VisualSVN Server](http://www.visualsvn.com/server/) utility (free) from the guys that make [VisualSVN](http://www.visualsvn.com).  It looks like we now have a GUI tool for managing our SVN repositories.
