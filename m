From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 3 Jan 2009 13:48:46 -0600
Message-ID: <200901031348.46847.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <20090102172540.GE8858@knossos.aleph1.co.uk> <20090102180134.GB5818@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090102180134.GB5818@uranus.ravnborg.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Paul Mundt <lethal@linux-sh.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>

On Friday 02 January 2009 12:01:34 Sam Ravnborg wrote:
> But the serie rased anohter topic: shall we ban use of perl
> for generating a kernel.

I dunno about "ban", but every time somebody adds perl to the "hot path" of 
the kernel build it breaks my build system, and I write a removal patch 
anyway.  I have to maintain them anyway, so I might as well try to push 'em 
upstream.  (I posted the first patch in this series twice before, once for 25 
and then an updated version to the linux-embedded list for .26.)

I didn't discover this topic independently.  Somebody pinged me about it on 
freenode back in February, and several other people sent me private email 
about it, and it's been previously raised on several other mailing lists (such 
as busybox and uclibc ones).

Unfortunately, most of the embedded developers I know aren't subscribed to 
linux-kernel.  (You either do kernel development, or you do everything else.  
It's not really feasible to keep up with the guts of the kernel and uClibc and 
busybox and gcc and qemu and the current offerings of three different hardware 
vendors and whatever userspace application the board's supposed to run and 
your build system and what INSANE things your EEdiot electrical engineer 
decided to miswire this time and fighting off marketing's desire to switch 
everything over to WinCE because they can get their entire advertising budget 
subsidized and there's a trade show next week we're not READY for...  Not only 
can none of 'em read a meaningful subset of linux-kernel anymore, but if you 
disappear into your own little niche for nine months, when you pop back up the 
kernel's all different and sometimes even the patch submission policy's 
migrated a bit.  Heck, I'm three months behind reading the LWN kernel page 
myself, and that's no substitute for kernel-traffic, RIP...)

Hopefully the cc: to linux-embedded is helping get more embedded guys involved 
in the discussion than just me. :)

> And this is what primary is discussed and the outcome of
> that discussion will not prevent patches that stands on their
> own to be applied.

The best way to get a patch applied is always for that patch to stand on its 
own merits.  Larger agendas are secondary.

Whether or not the kernel decides on a policy of keeping perl out of the 
kernel build's "hot path", I still need these patches for my own use, and plan 
to keep coming up with them and submitting them.  I haven't removed ones that 
haven't broken my build yet, but just because I'm not using md today doesn't 
mean I won't _start_.  (And if enough other people keep poking me about the 
kernel build I can tackle 'em to please them.  I actually _do_ know some 
embedded developers using raid for network attached storage and video servers 
and such...)

> 	Sam

Rob
