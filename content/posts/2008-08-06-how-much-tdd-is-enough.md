--- 
date: "2008-08-06T00:00:00Z"
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
    - YEG 
title: How Much TDD is Enough? 
type: post 
---

At the last [Edmonton Agile Methods User Group](http://groups.google.com/group/eamug) meeting, we had a brief discussion around [code coverage](http://en.wikipedia.org/wiki/Code_coverage), and what should be an acceptable number to shoot for.  Is it okay when the unit tests cover 80% of the code?  Or should 100% be the only acceptable value?  After all, how can you be confident in your code knowing that 20% of it isn't tested.

Allow me to go out on a limb here, and state with absolute certainty that the correct answer is "It depends on your situation".  Allow me to elaborate.

1.  The number sends a wrong message.  If your team decides that they need some arbitrarily value to shoot for, that is what they will concentrate on.  Developers will worry more about how many tests they need to write, rather than on the quality of their code.
2.  Unit tests can suffer from the law of diminishing returns.  To achieve that mythical number of 100% coverage would require a large amount of effort.  I argue that in many cases, the high effort required drains away from the teams ability to keep delivering value in their software.  In particular, exception testing comes to mind.  You can spend a lot of time writing tests to cover parts of your code that, in theory, should never be executed.
3.  Unit tests do not replace other forms of testing, so functionally speaking, you should still be covered.  Sure, you may have some code that isn't covered with a unit test, but hopefully your crack team of functional testers will exercise that code as part of their efforts.  If your functional testers find a problem, and you don't have a unit test that covers the code in question, then you will obviously write a test and fix the problem.  If your functional testers don't find a problem, then you don't worry about it. 
    - Remember that as a part of agile, you have short iterations with working software at the end of each iteration.  So, if there is some problem code that is not tested, your users will find out about it fairly quickly.  The power of rapid feedback at work.
4.  The test part of TDD is a useful side-effect. The true value of TDD is that it helps you craft out a better design for your code.  If you ask me, TDD should stand for Test Driven Design, not Test Driven Development (I do believe credit for this observation belongs to [Roy Osherove](http://weblogs.asp.net/rosherove/) - at least that is where I heard from first).
