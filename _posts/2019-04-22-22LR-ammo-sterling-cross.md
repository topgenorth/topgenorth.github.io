---
layout: post
title: ".22LR Ammo Evaluation - Sterling Cross"
date: 2019-04-26 08:39:00 -0600
comments: true
categories: [.22LR, Firearms, ballistics]
---

Over the past couple of years there has been a surge of interest in .22 Rimfire in Canada (at least from my perspective). Arguably, it could be traced to the start of [Project Mapleseed](http://www.mapleseedrifleman.com) back in 2017, which then spawned the [Canadian Rimfire Precision Series](https://rimfireprecision.ca) in 2018, and now this year the [Outlaw Rimfire Precision Series](https://outlawrimfire.com). My friends south of the border have [Project Appleseed](https://appleseedinfo.org) and the [National Rimfire League](https://nrl-22.org). As you can see, plenty of opportunity to participate/compete with the humble .22LR cartridge.

Prior to this I had always assumed that all .22LR ammunition was the same - it didn't matter what brand you used they all performed the same. I've come to learn that this isn't the truth. Much like their centre-fire big brothers, .22LR rifles have their own personalities and will shoot better with some brands of ammo than other. Don't assume that the cheap ammo will always shoot poorly in a given rifle. Likewise, it's entirely possible that expensive match grade ammo will perform poorly in your rifle. The best method (and probably the most fun) is to try out different brands and see what works best.

The first brand of .22LR I decided to check out was from [Sterling Cross](http://www.sterling-cross.com). This is available from [Canada Ammo](https://www.canadaammo.com/). In went to my indoor range at 40 yards with a brick and fired a few groups to see how it performed. The rifle in question was a stock [Remington Model 597](https://www.remington.com/rifles/rimfire/model-597) and a [Bushnell AR-22](https://www.bushnell.com/products/riflescopes/ar-optics/ar-optics-riflescopes-2-7x36/) (the older version). The ammunition seemed to group okay:

![Sterling Cross .22LR group](/images/22LR-evaluation/sterling-cross-group.jpg)

However, there is very little ballistic information available for this brand of .22LR. The box has the muzzle velocity printed on the outside as 1130fps, and that is about it.  I wanted a bit more information so that I could build a drop-chart, and so I went to an outdoor range with a chronograph to do some testing at 50m.

![Shooting bench at the range](/images/22LR-evaluation/chrony-setup.jpg)

Ballistic nerds will appreciate that environmental conditions have a significant impact on ammunition and the calculation of the BC. Here is the environmental information that I recorded on that day: 

|   | Imperial  | Metric  | 
|---:|---|---|
| **Altitude:** | 2490 feet | 758 metres |
| **Temperature:** | 59 F  | 15 C |
| **Air Pressure:**  |  26.961 inHg | 913 mb |
| **Humidity:** | 51% | &nbsp; |

The wind was pretty brutal.  It was typically about 5mph with prolonged gusts around 10mph.  The highest wind I observed was 22mph. In general, the wind seemed to come in from about the 10:30 to 11:00 direction.

I gathered some velocity measurements on about 40 rounds I fired.  My chorograph captured the velocity of the projectiles at several points between  0 to 50 yards.  (Yes, I know I'm mixing systems of measure here; it's an imperfect world but at least I'm not making you do to the math). Without boring you on the chart, here's what I observed:

|                       | Imperial | Metric   |
|----------------------:|---------:|---------:|
| **Average Velocity:** | 1103 fps | 336 m/s  |
| **Highest Velocity:** | 1155 fps | 352 m/s  |
| **Lowest Velocity:**  | 1014 fps | 309 m/s  |
| **Extreme Spread:**   | 140 fps  | 42.7 m/s |
| **Std. Dev:**         | 23.5 fps | 7.16 m/s |

Punching all the above values into the online [JBM BC calculator](http://www.jbmballistics.com/cgi-bin/jbmbcv-5.1.cgi), and we arrive at the following two BC values:

| BC Model | Value |
|---------:|:------|
|G1 | 0.140 |
|G7 | 0.074 |


The .22 projectile seems more like the G1 reference projectile, so I stuck with that value to calculate a drop chart.  I did this once with [Strelok Pro](https://play.google.com/store/apps/details?id=com.borisov.strelokpro), and then again with [Applied Ballistics](https://play.google.com/store/apps/details?id=com.appliedballisticsllc.appliedballistics).  Here's the results (in MOA) for my rifle:

| Metres|  Strelok Pro | Applied Ballistics  |
|------:|--------------|---------------------|
|    25 |    - 0.50    |       0.00 |
|    50 |      0.00    |       0.00 | 
|    75 |    + 3.25    |     + 3.00 |
|   100 |    + 7.00    |     + 7.00 | 
|   125 |    +11.50    |     +11.50 |
|   150 |    +16.25    |     +16.25 |
|   175 |    +21.25    |     +21.25 |
|   200 |    +26.50    |     +26.75 |
|   225 |    +32.00    |     +32.25 |
|   250 |    +37.75    |     +38.25 |    
|   275 |    +43.75    |     +44.50 |
|   300 |    +50.00    |     +50.75 |
|   325 |    +56.5     |     +57.25 |

It's comforting to me that Strelok and Applied Ballistics have very similar values (theortical they may be). The next step for me is to head out and actually test these values in the Real World at 100m, 150m, 200m, and (time permitting) 300m.
