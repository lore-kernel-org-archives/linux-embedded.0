From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] console - Add configurable support for console charset
 translation
Date: Fri, 06 Jun 2008 20:35:35 -0700
Message-ID: <484A0207.4000405@zytor.com>
References: <48447615.5050806@am.sony.com> <200806041236.12349.rob@landley.net> <20080605004630.GA26259@linux-sh.org> <200806051835.57140.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200806051835.57140.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Landley <rob@landley.net>
Cc: Paul Mundt <lethal@linux-sh.org>, linux-embedded <linux-embedded@vger.kernel.org>

Rob Landley wrote:
>> Except for the minor fact that most early boot debugging happens long
>> before the console subsystem is even available..
> 
> Isn't that why CONFIG_EARLY_PRINTK was written?  (And I mentioned Linus's hack 
> using the RTC to see how far the _really_ early stuff got.)

Don't think that works with frame buffers.

> Earlier I was trying to distinguish between /dev/console (no controlling tty), 
> virtual terminals (tied to old VGA hardware although possibly usable through 
> the framebuffer, I'm unclear on this), the tty layer (which is what I 
> initially thought the patch was aimed at, but it seems to be the vga VT 
> stuff), and having a bitmapped display (may be GUI only).  Four separate 
> things, I've lost track of which we're talking about here.
> 
> When you imply it's stupid to think anyone will ever have a console on an 
> embedded system (because we all know the embedded world is far more uniform 
> than crazy diverse things like the desktop space), which of these are _you_ 
> referring to?

I'm talking about the virtual console stuff, which is *not* inherently 
tied to VGA.

The issue is whether it makes sense to have virtual console capability 
on a device which is so constrained that you want a *subset* of the 
functionality in place.

	-hpa

