--- 
date: "2008-04-10T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
    - TDD 
title: Where Should Your Tests Live? 
type: post 
---

Thanks to [Phil Haack](http://haacked.com/Default.aspx)'s [online poll](http://haacked.com/archive/2008/04/09/unit-test-project-structure-poll.aspx), there is a bit of controversy over where one's unit tests should reside:  should the unit tests be housed in a separate project and assembly, or do they shack up in the same project as the code that they are testing?  Like [Bil](http://weblogs.asp.net/bsimser/archive/2008/04/09/unit-test-projects-or-not.aspx), I figured that rather than a big long blog comment, I'd be better of with my post.

Way back when I started out with TDD, I used to put the test fixtures in the same file as the class under test, sort of like:

```csharp
public class ClassUnderTest
{

}

#if DEBUG
[TestFixture]
public class Tests_for_ClassUnderTest
{
}
#endif
```

My logic was basically this way, the test is right there - quick and easy to access.  Tests are, after all, supposed to serve as documentation, so by making the two classes share the same file, it was easy to find.  Plus, if you changed your class, you had quick access to your tests. When it came time to deploy, you could just did a RELEASE build, and the unit tests would not be included.  Or, if need be, send out the code with the unit tests included, and then your QA department could run your tests on their environment if desired.

However, I eventually moved away from this, for a couple of reasons:

I was still learning TDD, and I noticed I was doing a lot of thrashing.  This was because my test code is right next to my production code and I found myself falling into a "test last" pattern.  That is to say, I would write my code first, then my tests.  When my code didn't work, I'd change it, and then "fix" my test so that my code would work.  I lacked the discipline and experience to write good, proper tests and I felt that part of the problem was it was to easy to fall back into the "Old Ways".

I found that by putting my test classes in a separate assembly, I would actually think about what I need, and that would result in better tests and (IMHO) better code.  After all, one of the real benefits about TDD is that it forces you to think about your design up front.  I found that by using a separate assembly to house my unit tests, I ended up changing how I approached TDD.  I spent a bit more time thinking about HOW my test would work, and HOW the code would be structured.  It sounds crazy, but it worked for me. 

In my experience, the good people in QA didn't give two rips about our unit tests.  They added no value to them, as they were using their own tests.  So, if nobody cared to run the tests outside of the developers, there is no value in sending them out.  Think lean here:  no value, so no point to make the developer's unit tests available.

Also, at the time, I didn't like the idea that the code that was being deployed wasn't exactly the code that was being tested.  I'm not a big fan of compile time directives, and compile time directives change your code.  They always seemed to cause pain when you forgot one or misspelled it.  Of course, now that we're older, and using [Nant](http://nant.sourceforge.net) zealously, this isn't really an issue.

So, for those reasons, I changed the structure of my solutions.  I briefly experimented with one test assembly per production assembly, but gave that up as to unwieldy.  If you had a project with six assemblies, then you'd double it up with six test assemblies.  Now when you wanted to run tests, you'd have 12 assemblies to compile and six to run the tests on.  Not a lot of fun.  Now imagine going onto a client site with 60 project solutions:  it gets nasty fast.

I eventually settled down to the conventional "...one test assembly to rule them all..." approach, and have been doing that for a while.  It seems to work well enough, and I never worried to much about the "urban sprawl" in my namespaces.  Resharper makes it pretty easy to find classes and such, so if the namespace of my testing assembly didn't quite match up with that of my application, I never considered it to be a big deal.

I was never really concerned about making a class public, or a method public to aid in testability.  Most (all) applications I work on are basically in house line of business applications.  I'm not writing frameworks or API's to be consumed to the general public.  The people that are using my classes can be trusted.  Besides, they all had access to the code anyway, so what is to stop them from just going in and change the class/method from internal to public anyway?

So, where should your tests live?  Really, I don't think it matters.  It seems natural to me to have a separate test project, but that is only because I've been doing it that way for a long time.  I don't really see anything wrong with putting your test fixtures in the same project as your production code.  I'd think it was great that you had unit tests (something one rarely sees here in Edmonton), so if housing tests and production code in the same assembly works for you, then why not?
