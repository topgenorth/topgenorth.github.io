---
categories: ["Programming"]
tags: ["Xamarin", "android", "C#"]
comments: true
date: "2013-02-04T00:00:00Z"
title: rake your Xamarin.Android Application
---
Deploy early, deploy often is a popular goal in Agile methodologies. One easy way to support this to automate your build process. Last year at this time I would just use [FinalBuilder](http://www.finalbuilder.com/finalbuilder.aspx) to automate the builds of my Xamarin.Android pet projects. It doesn't take much to set FinalBuilder, and it does provide support for a lot of tasks such as versioning .NET assemblies, manipulating XML, dealing with the file system, and so on.

The problem is that FinalBuilder is Windows only. OS X and Linux types are left out in the cold. As I find myself working almost exclusive in OS X when developing my Xamarin.Android applications, I was looking for a Windows free way to automate my builds.

Enter [rake](http://rake.rubyforge.org/) and [albacore](http://albacorebuild.net/). rake is, of course the build system for Ruby. 

<!--more-->


Albacore is a suite of rake tasks for building .NET applications. With a trivial amount of effort, I managed to setup a command line build of my Xamarin.AndroidXamarin.Android projects (which would also sign and zip align the APK file).

Assuming that you have ruby installed, you just need to install rake and albacore:

    gem install rake
    gem install albacore

That's pretty much it. Create your Rakefile and `require 'albacore'` and you now have access to a whole bunch of rake tasks to help you with building your Xamarin.Android app.

Right now my Rakefile is pretty barebones - I don't auto-increment the build number and I don't create any tags in git to track each build. Also, right now my Rakefile will pause partway through in order to collect the password for my keystore file as well. This is fine for me right now as I do all this at the command line by it would be a bit of a drag if I was using a headless CI server.

For references sake, here is the Rakefile I currently use:

``` ruby Rakefile.rb
	require 'albacore'
	
	@file_version = "2.3.0.0"
	
	@keystore     = "<PATH TO MY KEYSTORE FILE>"
	@alias_name   = "<ALIAS TO THE KEY I WANT TO SIGN WITH>"
	@input_apk    = "ReportGraffiti.Android/bin/Release/net.opgenorth.reportgraffiti.apk"
	@signed_apk   = "ReportGraffiti.Android/bin/Release/net.opgenorth.reportgraffiti_signed_notaligned.apk"
	@final_apk    = "ReportGraffiti.Android/reportgraffiti.apk"
	
	task :default => [:clean, :versioning, :build, :sign]
	
	desc "Remove the bin and obj directories."
	task :clean do
		rm_rf "ReportGraffiti.Android/bin"
		rm_rf "ReportGraffiti.Android/obj"
	end
	
	desc "Update the build number before compiling."
	assemblyinfo :versioning do |asm|
		asm.input_file  = "ReportGraffiti.Android/Properties/AssemblyInfo.cs"
		asm.output_file = "ReportGraffiti.Android/Properties/AssemblyInfo.cs"
		asm.version = @file_version
		asm.file_version = @_file_version
	end
	
	desc "Compiles the project"
	xbuild :build do |msb|
		msb.solution = "ReportGraffiti.Android/ReportGraffiti.Android.csproj"
		msb.properties = { :configuration => :release }
		msb.targets [ :Clean, :Build, :SignAndroidPackage ]
	end
	
	desc "Signs and zip aligns the APK."
	task :sign do 
		
		sh "jarsigner",  "-verbose", "-sigalg", "MD5withRSA", "-digestalg", "SHA1", "-keystore",  @keystore, "-signedjar", @signed_apk, @input_apk, @alias_name
		sh "zipalign", "-f", "-v", "4", @signed_apk, @final_apk
	end
```

Notice as well that I use the [xbuild](https://github.com/Albacore/albacore/wiki/XBuild-Task) task from albacore. The  documentation says that this task will be merged into the [MsBuild](https://github.com/Albacore/albacore/wiki/MSBuild-Task) task, but until then I guess one is supposed to keep using xbuild.

