--- 
date: "2010-11-15T00:00:00Z"
status: publish 
categories: 
    - Programming 
tags: 
    - .NET 
title: 'First Impressions: Windows Phone 7 Development' 
type: post 
--- 

I’ve spent a bit of my spare time in the past week looking at Windows Phone 7 from a developer’s point of view.  I’d have started sooner, but honestly, I didn’t see the point until there were actually devices that I could hold and use.  I know that in the U.S., some guys got developer phones from Microsoft, but I don’t think that anybody up here in Canada was that lucky. So, over the past year or so I’ve been dabbling with Android and I actually like programming for Android.  

The biggest issues I’ve run into with Android are my lack of Java skills – I keep doing things the C# way (you really don’t realize how handy Linq is until you don’t have it) and the fact that Android doesn’t have a decent UI designer.  But otherwise, I like Android. 

I was curious what the developer experience was for WP7.  In a nutshell – it’s not bad, and in some ways better than that of Android. Things I like about WP7 development:

- Being a C# guy, it was pretty easy and fast for me to get going with WP7.  Of course, Linux now has [MonoDroid](http://www.monodroid.net) which in theory should lessen the learning curve for a C# guy to create Android applications.
- It’s nice to have good tooling to help with creating my UI’s.  Blend and Cider are pretty decent. Android does have [DroidDraw](http://droiddraw.org), but I’ve never really found that tool to be good to work with.  Eclipse has some sort of an GUI designer thingy, but again, I’ve found it to be kind of lack-lustre at best.  That, and I don’t use Eclipse – I prefer IntelliJ.
- The Emulator seems to start up faster to me that the Android emulator – but that could just be me.
- The MVVM pattern.  I know the theory, and am now learning the more practical side of it.  Was worried that WP7 was going to decent into the path of darkness and pain that was/is Web Forms.
- I think that the debugger integrates better with the WP7 emulator.  Not that, generally speaking, I spend a lot of time in the debugger, but when you need it, it does seem to be more natural to me.  Again, this could just be because by day I do a lot of C# development so I’m more used to the Microsoft tooling to begin with.

Some things I didn’t like about WP7 development:

- You have to have Vista or Windows 7.  Yes, I know, XP is almost 10 years old, time to move on.  Call me an O/S curmudgeon.  I don’t mind Windows 7, but Vista sucks/sucked.
- It seems like to build your apps, you have to use Visual Studio 2010.  Not a problem for a developer, but I’m old school when it comes to compiling applications, and your build server shouldn’t be tainted by your IDE.
- I’m use to the relatively easy going Google marketplace and the fact I have numerous avenues available to me to distribute Android applications.  No such joy with WP7 apps.
- Editing XAML by hand.  But, I suppose it’s no worse that the XML resource files that Android uses.
- Not seeing a lot of projects whose code I can read.  Granted it’s still early, so hopefully that will change.  Or not.  .NET doesn’t seem to have the same OSS community spirit that Java does.

Microsoft has always tried to be pretty good to developers (sometimes to their own detriment), but I think Windows Phone 7 does have some things going for it, from a developer’s point of view anyway.  Here’s to hoping that strategy pays off – that cool apps will get written for WP7, and that it will be commercially viable.  Competition is good – it will keep Apple and Google on their toes. 
