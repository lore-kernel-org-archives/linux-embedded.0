From: Robin Getz <rgetz@blackfin.uclinux.org>
Subject: Kernel crashing and log buffers...
Date: Wed, 10 Jun 2009 21:26:40 -0400
Message-ID: <200906102126.40410.rgetz@blackfin.uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Wolfgan
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On 17 Oct 2007, after much discussion and debate, Mike added add two new 
functions for reading the kernel log buffer (from kernel space).

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=0b15d04af3dd996035d8fa81fc849d049171f9c3

The intention was for them to be used by recovery/dump/debug code so the 
kernel log can be easily retrieved/parsed by the bootloader (or another 
kernel) in a crash scenario.

I was going to push the arch specific recovery/dump/debug code that uses them 
upstream (yeah, it has been a little while - but anyway...) it was removed 
since then by Roel Kluin ...

21 Oct 2008:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=acff181d3574244e651913df77332e897b88bff4

Before I ask Andrew to add it back, I thought I would make sure it was still a 
useful function, and did everything everyone wanted - and wasn't deemed 
unnecessary by a feature/function that I wasn't aware of - like the next 
thing...

I saw the patch Grant sent recently - Add Alternative Log Buffer Support for 
printk Messages (in Nov2008 to the embedded list, and Jan 2009 to lkml) - but 
I couldn't find any followups - and it doesn't seem to be in Linus's tree.

http://thread.gmane.org/gmane.linux.kernel.embedded/1358/focus=1373

http://lkml.org/lkml/2009/1/21/250

I can see the desire on Wolfgang & Grant's part - for not needing the copy 
from/to - (you never have to worry about crashing "nicely" - the kernel 
panics, but you still need to copy memory around - potentially causing all 
kinds of secondary issues - and masking the real reason the crash occurred).

But for the majority of the case - the copy from/to would work much better 
than what we have in mainstream today...


I would be interested in Paul and Russell - how have you solved this issue? 
(Or do your kernel's never crash? :)

Thanks
-Robin
