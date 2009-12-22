From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi,
	lightweight bootloader
Date: Wed, 23 Dec 2009 00:28:04 +0100
Message-ID: <20091222232804.GB22533@pengutronix.de>
References: <4B29EC68.1040109@0xlab.org> <4B29F834.90108@warmcat.com> <20091221193038.38CB63F6EF@gemini.denx.de> <4B2FD7DB.10008@warmcat.com> <20091221213829.1A8B93F6EF@gemini.denx.de> <4B2FF8E7.505@warmcat.com> <20091221231922.GO22533@pengutronix.de> <4B3081C3.3000909@warmcat.com> <20091222111250.GW22533@pengutronix.de> <4B3146E9.3010101@warmcat.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B3146E9.3010101@warmcat.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Green <andy@warmcat.com>
Cc: Wolfgang Denk <wd@denx.de>, celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org

Hi Andi,

On Tue, Dec 22, 2009 at 10:23:37PM +0000, Andy Green wrote:
> Fedora provides a whole solution there, with the restriction it's
> designed for native build, not cross.

That's probably also a matter of taste. I still find it a feature to be
able to cross compile the systems - we can still recompile whole systems
consistently in just a few (ten) minutes, i.e. in order to change a
central switch (like softfloat vs. hardfloat, use another toolchain
etc). Out of interest, how long does it take to recompile Fedora on for
example MX31?

> Packages only help any QA effort. You don't have to release every
> package build to your stable repo, a staged development / testing /
> stable repo scheme is simple.

For let's say a telematics box it's almost impossible to test packet
combinations. All you can do is decide for "update application" and
"update platform". If you got your software updates via SMS, it
shouldn't go wrong because of an untested packet combination :-)

> Right. Fedora is different though, there are no cross-built packages
> (although they do provide cross compilers, I use them for kernel and
> Qi builds) and if storage is sufficient, there's no need to strip
> anything out. Just nobble init.

Hmm, I'm still not convinced. But as I don't have any data, I'll keep
quiet :-)

I think a central question is if you want to optimize things like

* early boot splash
* footprint

> Well for my uses of it I have been able to specify that we should have
> versioning GPIOs on the boards. It's a good idea anyway.

Hardware description is still one of the unsolved problems out there. It
works good if you have just a few variants. We often have for example
5-10 assembly options on a cpu module, plus several on the base board,
all not in-system detectable. We tried several variants to describe the
hardware in some config block, we tried to have oftree sniplets in the
hardware, but none of the options did really work well. In the end, you
need the schematics in machine readable form... When oftree comes into
the ARM world, we need a maximum-style bootloader which can provide
oftrees.

> > > What it led to was private bootloader trees that did not track the
> > > main one, filled with perverted bit-twiddling code that was not
> > > understood by anyone except the guy who wrote it, and that guy
> > > left a while back as did the guy after him.
> >
> > That's solvable by working on mainline integration. You'll get this
> > problem with Linux as well, if people are not on a mainline
> > strategy. No tool can change that.
>
> It's nothing to do with mainline, just intra-company communication and
> management failure.

My experience is that mainline exposure of that perverted bit-twiddling
code and ideas helps finding sane solutions, because someone will
allways ask the right questions :-)

> > Unfortunately, often people want to boot as fast as possible, which
> > requires optimization in that area as well. We recently had a board
> > which refused to boot without the PMIC having switched on some
> > voltages which are default-off.
>
> If your device is able to run from USB power, there's the issue that
> you are limited to 100mA before enumeration takes place. So without a
> USB stack, you have to trade speed for power anyway.

My argument is that there are all these different requirements out
there: your use cases, mine, others. What we want to do with barebox is
turning u-boot into something that can fulfill all of these
requirements, not only parts of it. You don't need a network driver in
your bootloader? Just configure it out and don't look at the code. But
somebody else may care, and he has a sane design to put his driver into.
The maximum paradigm works as good as the minimum does.

> > My fear is that quite often one starts with "oh, this problem is
> > simple, let's design simple". Then things move on and you notice
> > that you need to work on SPI, I2C, you need ext2, jffs2, ubifs,
> > later maybe btrfs, then SD support or USB. In the end, the problem
> > turns out to be complicated.
>
> You're right to fear it because you are too willing to re-introduce
> the bloat into your bootloader. For example you mention earlier that
> "Unfortunately, often people want to boot as fast as possible" and
> that is the rationale for re-introducing PMU management and the serial
> bus driver back into the bootloader. But actually, normal customers
> don't care about 200ms on boot either way. They can get the thing to
> market quicker and so cheaper and more reliably without that stuff in
> the bootloader.

That's a matter of the definition of "normal customers" :-)

> No offence but you are basically describing U-Boot there, mini Linux,
> scripting, hacks. Surely like U-Boot dreams of growing up into Linux,
> you will find your project dreaming of growing up into U-Boot.

Well, we think we have found a good design for reducing the hack factor
significantly.

While I'm still convinced that, for our projects, we have to stay with
barebox in maximum-mode, ptxdist's cross-building of self-made
distributions for now, there is a gradual move towards mainstream
distributions, where people can just 'apt-get install kde'. All our
recent experiments seem to suggest that mainstream distros are not able
to do what we need today, but times may change.

My conclusion is that we are on a good track: ptxdist is a 'do things in
a reproducable way, following a configuration' style system which is not
limited to cross building by design. I can imagine that, once the new
world has arrived, we can also use it for customizing standard
distributions as well. And barebox is flexible enough to serve the
maximum-bootloader pattern today, while gradually migrate towards the
minimum one.

However, I found the discussion pretty interesting! Thanks a lot, it
gave me some interesting insights.

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
