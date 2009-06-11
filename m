From: Robin Getz <rgetz@blackfin.uclinux.org>
Subject: Re: Kernel crashing and log buffers...
Date: Thu, 11 Jun 2009 14:52:38 -0400
Message-ID: <200906111452.39210.rgetz@blackfin.uclinux.org>
References: <200906102126.40410.rgetz@blackfin.uclinux.org> <20090611175303.GA10058@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090611175303.GA10058@cuplxvomd02.corp.sa.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Mike Frysinger <vapier@gentoo.org>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Wolfgang Denk <wd@denx.de>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>, Hariprasad Nellitheertha <hari@in.ibm.com>

On Thu 11 Jun 2009 13:53, David VomLehn pondered:
> On Wed, Jun 10, 2009 at 09:26:40PM -0400, Robin Getz wrote:
> > On 17 Oct 2007, after much discussion and debate, Mike added add 
> > two new functions for reading the kernel log buffer (from kernel space).
> > 
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=0b15d04af3dd996035d8fa81fc849d049171f9c3
> > 
> > The intention was for them to be used by recovery/dump/debug code
> > so the kernel log can be easily retrieved/parsed by the bootloader
> > (or another kernel) in a crash scenario.
> > 
> > I was going to push the arch specific recovery/dump/debug code 
> > that uses them upstream (yeah, it has been a little while - but 
> > anyway...) it was removed since then by Roel Kluin ...
> > 
> > 21 Oct 2008:
> > 
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=acff181d3574244e651913df77332e897b88bff4
> > 
> > Before I ask Andrew to add it back, I thought I would make sure it
> > was still a useful function, and did everything everyone wanted - 
> > and wasn't deemed unnecessary by a feature/function that I wasn't
> > aware of - like the next thing...
> > 
> > I saw the patch Grant sent recently - Add Alternative Log Buffer
> > Support for printk Messages (in Nov2008 to the embedded list, and 
> > Jan 2009 to lkml) - but I couldn't find any followups - and it 
> > doesn't seem to be in Linus's tree.
> > 
> > http://thread.gmane.org/gmane.linux.kernel.embedded/1358/focus=1373
> > 
> > http://lkml.org/lkml/2009/1/21/250
> > 
> > I can see the desire on Wolfgang & Grant's part - for not needing 
> > the copy from/to - (you never have to worry about crashing "nicely" - 
> > the kernel panics, but you still need to copy memory around - 
> > potentially causing all kinds of secondary issues - and masking the
> > real reason the crash occurred).
> > 
> > But for the majority of the case - the copy from/to would work much
> > better than what we have in mainstream today...
> > 
> > 
> > I would be interested in Paul and Russell - how have you solved this
> > issue? (Or do your kernel's never crash? :)
> 
> Our kernel does crash, so we have to do this. I had submitted a patch a
> while ago that tweaks emit_log_char, but this was bounced, reasonably,
> because it would be interferring with the great majority of people who
> are not interested in capturing log output. The suggestion was made that
> we do this with a console driver. I've recently got a version working,
> as a module, but I've only started testing of the version integrated 
> into the kernel tree.  Still, post early, post often, so I've appended 
> a version of the patch here to see if this seems to be the right 
> direction. 

Yeah - it looks like n people have done this n ways. 

I think even Andrew M had mentioned that he had done something in a past 
embedded life.

I think what you have would do what I need it to do - I'm not so sure about 
what Wolfgang/Grant had in mind (- since they wanted also to dump buffers 
from the bootloader into the console for syslog processing)...

> Regardless whether my particular patch seems like the right way to do
> this, we do need to solve this problem for the embedded world. It is
> one of the few areas where we have needs not shared by the rest of
> the kernel community.

I'm not so sure - googling for things last night led me to this:

http://www.faqs.org/patents/app/20090044051
EXTRACTING LOG AND TRACE BUFFERS IN THE EVENT OF SYSTEM CRASHES
Hariprasad V. Nellitheertha  - Linux Technology Center, India Software Labs, 
IBM India.

So - I think as Paul stated in a previous conversation - the high availability 
needs of servers are similar to the high availability needs of embedded...

Hari - did any of the work you did end up in mainline?

Thanks
-Robin
