--- 
date: "2009-02-20T00:00:00Z" 
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
title: Every Time you \[Ignore\] a Test, a Puppy Dies 
type: post 
--- 
If you using a unit testing framework such as [NUnit](http://www.nunit.org), you're no doubt familiar with the [\[Ignore\]](http://www.nunit.org/index.php?p=ignore&r=2.4.8) attribute.  (Note:  I haven't used [MbUnit](http://www.mbunit.com) in a while, but I'm pretty sure that all this applies there as well.) 

For those who aren't, when you adorn your \[Test\] with this attribute, then your test runner should pay no heed to this particular \[Test\].  Instead of going green or red, your test turns up as yellow in your test runner. At first blush, this seems handy - rather than deleting a failing or broken test you can have it \[Ignore\]d. 

Now you can deal with the wayward test on your own time with the pesky failure cluttering up your CI build (you do have a CI build box set up, right?). 

Please bear with me while I submit to you: This isn't a good idea. **This is a bad idea**. An ugly idea. The kind of bad, ugly idea than even [Belcham](http://www.igloocoder.com)-esque quantities of scotch couldn't make pretty. 

Why? Well, the whole point to having a unit test is to **test something**. If your test is failing, that means something is broken.  You should be addressing the cause of the failure and dealing with the problem now. Covering up the failure with some attribute kind of defeats the purpose of having the unit test in the first place. 

I mean, really, if you had open, festering lesions on your skin would you just cover them up with a band-aid and pretend nothing was wrong?  Odds are you'd go to a doctor and get that checked out. 

Alternately, perhaps the test isn't valid anymore: your application has changed/evolved and the code that you were testing isn't around anymore. 

Then, get rid of the test1 Delete it from your test fixtures, and don't look back. Granted the world we live in is not black and while.  

Sometimes we're working on things, and we only want tests to run when it is explicitly asked to run.  To handle this scenario, [NUnit](http://www.nunit.org) provides the [\[Explicit\]](http://www.nunit.org/index.php?p=explicit&r=2.4.8) attribute.  This is a kinder, more gentle kind of ignore.  This instructs [NUnit](http://www.nunit.org) to only run the test when it is told to run the test.  If you add a comment to the attribute, then it helps those going through the build log understand why the test is being run.  However it is still possible to run the test if desired.

```csharp
[Explicit("This test takes a really really really long time to run so we don't want to run it in this test suite every time")]

[Test]
public void My_very_important_test()
{
    // Test valuable things here

}
```

I know some people are going to protest my advice. So I will offer up this one last piece.  If you are going to \[Ignore\] a \[Test\] then please take advantage of the fact that you can add a comment to the Ignore which will show up when [NUnit](http://www.nunit.org) ignores the test:

```csharp
[Ignore("This test is ignored as I wish to incur the wrath of Cthulhu (or his proxy)")]
[Test]
public void My_very_important_test()
{
    // Test valuable things here.
}
```
Now when your CI server runs your unit tests, you will have a nice friendly message that will inform others as to why the test is not running.
