---
aliases:
- /post/2017-05-06-norinco-762x39-ballistics/
comments: true
date: '2017-05-06T19:10:00Z'
draft: true
tags:
- ballistics
title: Ballistics of Norinco 7.62x39
---


On of the great things about 7.62x39mm rifles (like the SKS) is that (at the time of writing) ammo is fairly inexpensive. A fellow who keeps his eye open for a deal can find 7.62x39mm in the range of $0.16CAD (for corrosive) to $0.30CAD (for non-corrosive) ammo. Of course being surplus ammo, finding ballistics data on this ammunition can be a bit of a trick. Granted, the 7.62x39 cartridge isn't exactly a "precision" round, but intellectual curiousity had me wondering what the ballistic coefficient (BC) of this Norinco ammo was.

![Norinco 7.62x39mm cartridge](762x39_round.jpg )

Given the right inputs, it is possible to calculate the BC for a given round. The tricky thing is that you need the velocity of the projectile at two points along the path of the bullet. This requirement makes it somewhat difficult (if not impossible) for the layman to perform his own amateur calculations.

Luckily, technology has improved a bit and with a good chronograph it is possible to track the velocity of a projectile. So, what does a middle-age guy do on a Friday night? Why he analyzes the data from his previous trip to the range and tries to figure out what the BC of this surplus ammo could be.


(For the curious, I used the [BC Calculator](http://www.jbmballistics.com/cgi-bin/jbmbcv-5.1.cgi) available from [JBM Ballistics website](http://www.jbmballistics.com))


First some environmental data that I recorded while I was at the range (or looked up on Google Maps) earlier this week:

|   | Imperial  | Metric  | 
|---:|---|---|
| **Altitude:** | 2490 feet | 758 metres |
| **Temperature:** | 61 F  | 16 C |
| **Air Pressure:**  |  29.58 inHg | 1001.6 mb |

**Humidity:** 31%

Next, after firing 20 rounds through my SKS, here is the ballistic data from the rounds that were discharged:


|  | Imperial  | Metric |
|---:|---|---|
| **Average Velocity:** | 2450.63 fps | 746.95 m/s |
| **Highest Velocity:** | 2483.85 fps | 757.08 m/s |
| **Lowest Velocity:** | 2421.29 fps | 738.01 m/s |
| **Extreme Spread:** | 62.56 fps | 19.07 m/s |
| **Std. Dev:** | 12.74 fps | 3.88 m/s |


I'll omit the velocities from the flight of the bullet, we've got enough boring numbers. So running these numbers through the [JBM BC calculator](http://www.jbmballistics.com/cgi-bin/jbmbcv-5.1.cgi) and we get the following two BC values: 

| BC Model | Value |
|---------:|-------|
|G1 | 0.266 |
|G7 | 0.131 |


Comparing these BC values to commercial ammo, and we can see that [Tula has a G1 BC of 0.306](http://en.tulammo.ru/products/rifle_cartridges/762x39_fmj/) and that [Hornady has a BC of 0.295](http://www.hornady.com/store/7.62x39-123-gr-sst/).

Hope this information is useful to someone else out there.