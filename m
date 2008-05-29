From: Rob Landley <rob@landley.net>
Subject: Re: Some embedded topics
Date: Thu, 29 May 2008 12:31:10 -0500
Message-ID: <200805291231.11529.rob@landley.net>
References: <483C83DE.3040604@cisco.com> <200805282201.48746.rob@landley.net> <8bd0f97a0805282121j10a99bb7ve92efc6a8dc8bbb1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0805282121j10a99bb7ve92efc6a8dc8bbb1@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: T Ziomek <ctz001@email.mot.com>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org

On Wednesday 28 May 2008 23:21:52 Mike Frysinger wrote:
> On Wed, May 28, 2008 at 11:01 PM, Rob Landley wrote:
> > On Tuesday 27 May 2008 17:31:42 T Ziomek wrote:
> >> If I understand correctly David is talking about logging some trace-like
> >> info (so it exists before a HW watchdog expires), and having it
> >> somewhere "safe" from being disturbed by a HW reset.
> >
> > The standard way of doing this is to use the mem= kernel command line
> > parameter to tell the system it has less memory than it does, and using
> > what's left as a ramdisk.  Years ago I saw some userspace thing running
> > as root mmap() /dev/mem (or whatever they're calling it these days) and
> > log to it.  In theory you could even set the dmesg buffer up at the end
> > of physical memory with a smallish kernel patch, make it big, and set the
> > kernel to doing verbose printks.
> >
> > The trick is A) knowing the absolute physical address at which your debug
> > buffer lives so you can find it after the reboot, B) convincing the
> > system to do something useful with it on reboot rather than just
> > overwriting it with fresh log data.
>
> how about the fact that when the core resets, the memory controller is
> often reset as well ?  that external memory is going to degrade.  or
> do we just bite our thumb and weather the few random bit errors ?
> -mike

Mostly it isn't a problem because DRAM lasts longer than you think it does:
  http://www.securityfocus.com/brief/686

Your memory controller init has to go out of its way to screw it up with a 
memory test or some such.  (That said, some of 'em do...)

The people who pioneered this stuff many moons ago were the big iron guys, and 
when they had that kind of problem they'd use kexec to avoid going back 
through brain-dead firmware that did stupid things to memory:
  http://lwn.net/Articles/108595

This of course assumes you have spare ram for a while second kernel to sit 
around and do nothing until you pass control to it to fetch your diagnostics.  
Most embedded systems don't.

I'd probably start reading at http://lkcd.sf.net/doc/index.html if I wanted to 
come back up to speed on this area.  The "leave a bit of memory free at the 
end with mem=" trick is the easy way to avoid having to include actual 
_infrastructure_ for this stuff.  If you have the memory budget for 
infrastructure, there are people happily to deliver forklifts full...

This doesn't come up much for me.  During development I put /dev/console on a 
serial port and log stuff to that, so I still have it after the box has gone 
south.  By the time a device running from flash winds up in the end user's 
hands, I usually don't even know who they _are_, let alone have enough of a 
relationship with them that they'd want their appliance to spontaneously send 
info to me even if it did start malfunctioning.

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
