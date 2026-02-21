--- 
date: "2009-09-01T00:00:00Z" 
status: publish 
categories: 
  - Programming 
tags: 
  - rant 
title: Good Bug Reports and Tracking 
type: post 
--- 

Every developer, no matter how experienced, has to dig in and fix bugs.  This is, in my experience, the typical cycle:

1.  bug is reported
2.  bug is assigned to developer
3.  developer thinks the bug is fixed
4.  developer marks bug as resolved
5.  tester checks to see bug is fixed, but it isn’t.
6.  tester reopens bug, assigns it back to developer
7.  back to step number two.  Repeat until developer (or tester) climbs to the top of a 307 foot administrative building with high-powered rifles to demonstrate USMC-worthy marksmanship.

Now, even if you aren’t into the whole Lean Software development philosophy (i.e. eliminating waste), you can probably appreciate that it can be pretty wasteful of time and patience every time that #6 happens, so please indulge me as I elaborate on some of the finer points of bug reporting.  

Now, where I say “bug reporter”, I typically mean somebody who is in a QA role – their job is to find bugs and report them.  This doesn’t always have to be the case though. If you check out most open source projects, you will often find rules/guidelines for reporting bugs.  In the case that doesn’t exist then perhaps the following might be of use: When you log a bug, be explicit, and give lots of details.  Don’t be lazy.  If it’s hard to duplicate your bug, then odds are it either won’t get looked at, or won’t be fixed properly.  And when it doesn’t get fixed properly, there will be a lot of churn. At the very least, when reporting a bug you should provide:

- **A detailed description of the *problem***.  Note the emphasis on problem.  Odds are you don’t have the solution, so don’t bother.  Let the programmer figure out the solution.  For example:  _Using version 3.1415 of the application on 28-July-2009, I was expected a date to be calculated a certain way based on some values.  The application didn’t crash, but the correct date was not calculated._
- **What you expect to happen**.  If you have some sort of formal spec, repeat it here, and cite how to find the spec.  i.e.  According to Page 1054, in section 1095.4.3.2 the new date is to be calculated as follows :  add the value of  *((a - b)- 10)* /2 (rounding down) to the date *Y* for a new date of *Z*.
- **What actually happened**.  i.e.  Using these values a=300, b= 150 and Y of 1-Sep-2009 I expected that the new date Z should be 2-Oct-2009
- **A step-by-step description** of HOW to duplicate the bug.  This means explaining in excruciating detail HOW the programmer can duplicate what your reporting, i.e.
  - Go to the URL <http://myproblem.com/is/here>
  - Click on the text box next to the label “Value A:” and enter a value of 300
  - From the drop down list by “Value B:” and click the value 150 from the drop down list
  - Use the tab key to navigate to the “Calculate new date” button.
  - Hit Enter
  - The text box by the “New Date:” label now has the date of 4-July-1943.  I expected 2-Oct-2009.
- **How the developer can get a hold of you**.  This comes in handy when for some reason the developer can’t duplicate your bug or doesn’t understand what you were doing.

When the developer flags the bug as resolved and it turns out not to be fixed, don’t just re-open the bug with curt “This is still broken”. Ah, but now aren’t I the smug developer – shifting my inability to quickly resolve a bug to the poor reporting capabilities of my tester.  I’m pretty ungrateful too.  I mean, somebody took the time to test out my application, and then enter a bug like “I tried to calculate the new date and it didn’t work.  Please fix”.  Well, fear not – there is a lot developers should be doing as well, but that is the subject of a later post. Of course, the key part in all of this is **COMMUNICATION**.  Don’t be afraid, as someone reporting a bug, to actually talk to the developer.  Nothing really beats face-to-face communication (or a phone call) if things seem unclear. Odds are you won’t have an empty whisky bottle thrown at you.  Most likely the personal grooming standards of the developer will be higher than that of a middle age serf during the Black Plague.  In theory, as a tester, you’re on the same side as the developer trying to fix the bug.
