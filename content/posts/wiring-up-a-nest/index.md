---
aliases:
- /post/2015-09-08-wiring-up-a-nest/
categories:
- Technology
comments: true
date: '2015-09-08T00:00:00Z'
draft: true
title: Wiring Up a 2nd Generation Nest
---

This weekend I finally broke down and installed a [2nd generation Nest thermostat](http://www.nest.com) in my house. They have a nice [compatibility wizard](https://nest.com/widget/compatibility/) which does a pretty good job of showing you how to wire up your Nest based on the wires you can see in your existing thermostat.  There were two gotchas that their wiring diagram didn't cover. Here is a picture of the old thermostat (a Rodgers-White):

![Old thermostat](old_thermostat.png)

Notice that there were two **W** wires. I'm not to sure what is up with that, I suspect that that one wire leads up to the humidifier. I ended up splicing the two wires together with a marette, and then connecting the spliced wire to the **W** connection on the Nest. This was not documented anywhere on the Nest website.

The second thing I noticed was that the **Rc** post on the thermostat was jumpered over to the **Rh** post. All I had to do here is remove the jumper and just plug the wire into the **Rh** connection on my Nest. This issue was [documented on the Nest website](https://nest.com/ca/support/article/How-do-I-install-Nest-if-my-old-thermostat-had-a-short-wire-connecting-Rh-and-Rc).

All in all, the process was quick and easy. YMMV
