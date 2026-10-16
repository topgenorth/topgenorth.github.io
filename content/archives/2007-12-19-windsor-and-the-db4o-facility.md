--- 
date: "2007-12-19T00:00:00Z" 
categories: 
  - Programming 
tags: 
  - .NET 
title: Windsor and the db4o Facility 
type: post 
---

Once again, appealling to the niche (non-existant?) market, I give you a quick run down on using [db4o](http://www.db4o.com/), and the [Castle Windsor](http://www.castleproject.org/container/index.html) [db4o facility](http://www.castleproject.org/index.php/Facility:db4o).  Yes, I know the link for the db4o facility link doesn't work.  That is what prompted me to do this blog post. This is because, a while ago, the [db4o](http://www.db4o.com/) facility was pulled from the Castle Project.  Apparently there was a licencing concern.  It's my understanding that this has since been resolved, and I seen now that there is again the [db4o](http://www.db4o.com) facility.

First off, a safety tip:  the [lastest Castle binaries](http://www.castleproject.org/castle/download.html) are compiled against [db4o 6.1](http://developer.db4o.com/files/folders/db4o_61/default.aspx).  The current version of [db4o is 6.4](http://developer.db4o.com/files/folders/db4o_64/default.aspx).  The two assemblies are not compatible.  If you need to use [db4o v6.4](http://developer.db4o.com/files/folders/db4o_64/default.aspx), I suspect that you'll have to compile the Castle code on your own.  Me, I just rolled back to the older version of [db4o](http://www.db4o.com).

With that out of the way, let me make the following assumption:

1.  You are already using Castle Windsor and have that already set up in your application.
2.  You are using XML files to configure Windsor (i.e. not Binsor).  It probably wouldn't be hard to adapt this to Binsor, but for now, please humour me.

You'll need to copy two files to your bin directory:

- Castle.Facilities.Db4oIntegration.dll
- Castle.Services.Transaction.dll

Note that you don't have to reference these files in your project, but they do have to be somewhere that .NET (and Windsor) can find them and load them.

You probably have a config file where you register your components/facilities.  I'll show you the contents of my facilities config file.  It's actually pretty simple:

```
<facilities>
```

```
  <facility id="chronydownload"
```

```
            type="Castle.Facilities.Db4oIntegration.Db4oFacility, Castle.Facilities.Db4oIntegration">
```

```
    <container id="db4o.container" databaseFile="data/reloading.db4o" />
```

```
  </facility>
```

```
</facilities>
```

With this little snippet, Windsor will now resolve provide you an IObjectContainer using the database reloading.db4o.

There are some other values you can pass to the container.  The best source of documentation in this matter would be the source code for the facility.
