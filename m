From: Rob Landley <rob@landley.net>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight bootloader
Date: Sun, 27 Dec 2009 18:21:37 -0600
Message-ID: <200912271821.38258.rob@landley.net>
References: <20091221193038.38CB63F6EF@gemini.denx.de> <200912270127.35414.rob@landley.net> <4B373253.9050006@warmcat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B373253.9050006@warmcat.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Andy Green <andy@warmcat.com>
Cc: celinux-dev@tree.celinuxforum.org, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org

On Sunday 27 December 2009 04:09:23 Andy Green wrote:
> > I agree it's nice to have a build environment compatible with your
> > deployment environment, and distros certainly have their advantages, but
> > you may not want to actually _deploy_ 48 megabytes of /var/lib/apt from
> > Ubuntu in an embedded device.
>
> I did say in the thread you want ARM11+ basis and you need 100-200MBytes
> rootfs space to get the advantages of the distro basis.  If you have
> something weaker (even ARM9 since stock Fedora is ARMv5+ instruction set
> by default) then you have to do things the old way and recook everything
> yourself one way or another.

I started programming on a commodore 64.  By modern standards, that system is 
so far down into "embedded" territory it's barely a computer.  And yet people 
did development on it.

  http://landley.net/history/catfire/wheniwasaboy.mp3

That said, you can follow Moore's Law in two directions: either it makes stuff 
twice as powerful every 18 months or it makes the same amount of power half 
the price.

What really interests me is disposable computing.  Once upon a time swiss 
watches were these amazingly valuable things (which Rolex and friends try to 
cling to even today by gold-plating the suckers), but these days you can get a 
cheap little LCD clock as a happy meal toy.  The cheapest crappiest machines 
capable of running Linux are 32-bit boxes with 4 gigs of ram, which were high-
end server systems circa 1987 that cost maybe about $5k (adjusted for inflation 
anyway).  These days, the cheapest low-end Linux boxes (of the "repurposed 
router" variety) are what, about $35 new?  Moore's Law says that 21 years is 
14 doublings, which would be 1) $2500, 2) $1250, 3) $635, 4) $312, 5) $156, 6) 
$87, 7) $39, 8) $19, 9) $9.76, 10) $4.88, 11) $2.44, 12) $1.22, 13) $0.61, 14) 
$0.31.

So in 2009 that $5000 worth of computing power should actually cost about 30 
cents, and should _be_ disposable.  In reality, the CPU in that router is 
clocked 20 times faster than a Compaq deskpro 386, you get 4 to 8 times the 
memory, they added networking hardware, and so on.  And there are fixed costs 
for a case and power supply that don't care about Moore's Law, plus up-front 
costs to any design that need to be amortized over a large production run to 
become cheap, and so on.

And the real outstanding research problems include ergonomic UI issues for 
tiny portable devices, batteries wearing out after too many cycles, and the 
fact that making "disposable" devices out of materials like cadmium is dubious 
from environmental standpoint.  Oh, and of course there was the decade or two 
companies like Intel lost going up a blind alley by bolting giant heat sinks 
and fans onto abominations like the Pentium 4 and Itanic.  They didn't care 
about power consumption at all until fairly recently, and are still backing 
out of that cul-de-sac even today...

Still, I forsee a day when cereal boxes have a display on the front that 
changes every 30 seconds to attract passerby, driven by the same amount of 
circuitry and battery that makes the "free toy inside" blink an LED today.  (I 
don't know what else that sort of thing will be used for, any more than people 
predicted checking twitter from the iPhone,)

This I'm reluctant to abandond the low-end and say "oh we have more power now, 
only machines with X and Y are interesting".  The mainframe, minicomputer, and 
micro (PC) guys each said that, and today the old PC form factor's getting 
kicked into the server space by the iPhone and such.  I want to follow Moore's 
Law down into disruptive technology territory and find _out_ what it does.

> Even now there are plenty of suitable platforms that will work with it,
> and over time they will only increase.

You must be this tall to ride the computer.

> Nothing seems to totally die out
> (8051-based micros are still in the market)

Mainframes are still on the market too.

> but each time something new
> comes in at the top it grabs some of the market and the older ones shrink.
>
> It boils down to the point that if you just treat the ARM11+ platforms
> like the previous generation and stick fat bootloaders and buildroot
> blobs on them, you are going to miss out on an epochal simplification
> where embedded Linux largely becomes like desktop Linux in workflow,
> quality and reliability of update mechanisms, and effort needed to bring
> up a box / device.

New computing niches will develop new usage patterns.  The iPhone is currently 
doing this, and is unlikely to be the last cycle.

They'll also grow more powerful and expand into old niches the way "blade 
servers" are constructed from laptop components and used for batch processing 
today, but I personally find that less interesting.

> -Andy

Rob
-- 
Latency is more important than throughput. It's that simple. - Linus Torvalds
