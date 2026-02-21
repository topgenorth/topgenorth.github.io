--- 
date: "2008-03-05T00:00:00Z" 
status: publish 
categories: 
    - Technology 
tags: 
    - Linux 
title: VMware and 64-bit Ubuntu 
type: post 
---

Today I got a new hard drive for my web server, to replace the one that died back in February.  Hopefully the new 750GB drive will serve me as well as (or better) the old 200GB WD Cavair.  I must admit, I was a bit suprised at how cheap it was to get such a big HD.

The first order of business was to move my web site off it's current home and onto it's new, more permanent one.  I went about installing Ubunutu 7.10 64 bit, and them VMware server 1.0.4 on the new computer.  If you Google it, are a lot of articles on [installing VMware on Ubunutu](http://www.google.ca/search?q=vmware+server+ubuntu+7.10).  However, I did run into one stumbling block:  with 64bit Ubunutu you need one more dependency: ia32-libs

If you don't install this, then the VMWare installer can't create an SSL Certificate and your install of VMWare will fail.

So, to recap, on Gutsy Gibbon 64-bit you need to install:

```bash
sudo apt-get install build-essential linux-headers-\`uname -r\` ia32-libs
```

From there, follow basically any of the HOWTO's on installing VMWare Server, and all should work for you.
