From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH] console - Add configurable support for console charset translation
Date: Thu, 5 Jun 2008 18:35:56 -0500
Message-ID: <200806051835.57140.rob@landley.net>
References: <48447615.5050806@am.sony.com> <200806041236.12349.rob@landley.net> <20080605004630.GA26259@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080605004630.GA26259@linux-sh.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Mundt <lethal@linux-sh.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Wednesday 04 June 2008 19:46:30 Paul Mundt wrote:
> On Wed, Jun 04, 2008 at 12:36:11PM -0500, Rob Landley wrote:
> > Actually if you ever need to diagnose early boot stuff on _any_ platform,
> > you do need a console.  But it can be serial or netconsole, as long as
> > that works...
>
> Except for the minor fact that most early boot debugging happens long
> before the console subsystem is even available..

Isn't that why CONFIG_EARLY_PRINTK was written?  (And I mentioned Linus's hack 
using the RTC to see how far the _really_ early stuff got.)

> At the risk of perpetuating the stupidity of this thread..

I plead the fifth.

> If you ship a 
> device to a customer expecting them to debug it for you, you are likewise
> not likely to be very commercially successful, either.

There are such things as field servicable devices where companies either send 
people out into the wild or get hardware brought in for service.

However, looking at the message you're replying to, I was talking about during 
development.  (Remember how the early linksys boxes didn't have the serial 
port physically wired up to the outside, but if you busted out a soldering 
iron you got a shell prompt on it without even installing new software?  They 
didn't change it after they got it working because they didn't want to 
re-validate their image?  Yeah, that kind of stuff gets shipped.)

Sure if the device in the field doesn't boot, it's cheaper to just replace it, 
unless you need to get data off the sucker (in which case they bring it in).  
But the defective units returned to the factory sometimes get diagnosed so 
they can reduce the future return rate (or resell 'em used if it was pilot 
error), so once again it helps if it's possible to service 'em after the 
fact.  Depends on the company.

> Devices are not shipping with consoles, period.

Earlier I was trying to distinguish between /dev/console (no controlling tty), 
virtual terminals (tied to old VGA hardware although possibly usable through 
the framebuffer, I'm unclear on this), the tty layer (which is what I 
initially thought the patch was aimed at, but it seems to be the vga VT 
stuff), and having a bitmapped display (may be GUI only).  Four separate 
things, I've lost track of which we're talking about here.

When you imply it's stupid to think anyone will ever have a console on an 
embedded system (because we all know the embedded world is far more uniform 
than crazy diverse things like the desktop space), which of these are _you_ 
referring to?

My cable modem has a serial port that gives me a login prompt if I plug into 
it, and I watched the guy at sprint bring one up last time I broke my cell 
phone so he could get my number list off it.  That kind of console may be 
useful out in the real world, and that's the kind of console I was talking 
about in the message you replied to.

I've learned that "I don't do that, therefore nobody ever will" is not always 
the world's greatest assumption.  Somebody out there may want a console, and 
they may not want the overhead of internationalizing it because although 
their customers speak mandarin, their field service people do not.

Somebody out there may also want to do something I consider a bad idea.  
(Compared to shipping a device with Windows CE on it, any quibble I have 
about Linux configuration is a rounding error.)

> If you disagree with this, you've 
> obviously never shipped a device.

Since I haven't shipped only _one_ device, and since I used to own a tuxscreen 
phone which may actually meet _all_ the above definitions of "console", I 
guess it's ok for me to disagree with this?

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
