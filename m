From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi,
	lightweight bootloader
Date: Tue, 22 Dec 2009 00:19:22 +0100
Message-ID: <20091221231922.GO22533@pengutronix.de>
References: <4B29EC68.1040109@0xlab.org> <4B29F834.90108@warmcat.com> <20091221193038.38CB63F6EF@gemini.denx.de> <4B2FD7DB.10008@warmcat.com> <20091221213829.1A8B93F6EF@gemini.denx.de> <4B2FF8E7.505@warmcat.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B2FF8E7.505@warmcat.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Green <andy@warmcat.com>
Cc: Wolfgang Denk <wd@denx.de>, celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org

Andy,

On Mon, Dec 21, 2009 at 10:38:31PM +0000, Andy Green wrote:
> About tapping into the wisdom of the U-Boot community, most of their
> changes were GTAxx-specific. For example I don't know any other Linux
> device than GTA02 with a Glamo in it, there is a lot of code I ported
> from Linux for that bloating their tree. With closed docs, that would
> be completely useless for upstream.

Hmm, there have been interesting items in the openmoko trees. For
barebox, we took the DFU support, which was done in a device specific
way, cleaned that up and made a generic command out of it:

dfu /dev/self0(bootloader)sr,/dev/nand0.root.bb(root)

You can specify the slots on the command line, not hardcoded. Whereas we
reworked the interfaces, the core code was pretty interesting. So I
think some items it would have been worth to be pushed into u-boot at
the time it was written.

> Bearing in mind they could only update by DFU and with GTA01, there
> was no bootloader recovery mechanism if it failed,

Our DFU scenario goes like "press a button while booting goes into DFU
mode", so you can re-flash as often as you like. However, our use cases
are probably different than yours (deeply embedded systems, which often
don't even have removable stuff like SD or USB sticks).

In general, I like in-system techniques much better than card juggeling,
because it fits better into automated environments like our RemoteLab,
which does our automatic nightly tests. But that's surely a matter of
the use case you have.

> The main lessons I took from that was the dollar and time value of
> removing the "unnecessary features" in U-Boot and especially the
> Openmoko tree of it:

In barebox, we use Kconfig to configure things away; so removing
unnecessary features is just a matter of 'make menuconfig'.

>   - video drivers

I see video drivers in the bootloader as an optimization topic: If you
can effort to get your splash 3 s after power-on, you should leave video
drivers out of the boot loader and do it all in the kernel.

Our competition in industry projects is often the old 2-lines-alpha
displays, which are "instant on" after you hit the power switch. If this
is required, I don't see a way to achieve that with kernel-only at the
moment.

>   - shells

Especially during development, we often see that the hardware people
really like having a very limited shell with hardware bit banging access
in barebox. In a phase where you port Linux to a device, it gives you
something that works while Linux is not ready yet. And in barebox, you
have full scripting capabilities, so hardware people can even use that
for certain qualification scripts.

>   - environments

That was one of our design goals in barebox as well: get rid of the
scripting in the environment, as it was done in u-boot.

>   - special update mechanisms

What do you mean with "special"?

>   - raw NAND at all
>   - duplicating the OS in there

If you want to boot from NAND-only devices, how would you do that
without NAND drivers?

>   - private nonvolatile state

?

>   - PMU management when we are already able to run

Several CPUs need PMU support early in the boot stage, because they come
up in slow-clock mode. So you either boot slow until the kernel is up
far enough (but then the whole kernel loading is slow), or you need
access to the PMU from the bootloader.

In barebox, our design is that we have frameworks for i2c+spi to access
a PMU, but if you don't need that, you can configure it away. The idea
is that *if* you actually need it, then better have a good design for
it.

>   - per board variant bootloader image (ie, GTA02 v3 can only run a
>     special GTA02 v3 binary of U-Boot that can't run on anything else;
>     Qi has a per CPU binary that supports all variants)

I don't know the GTA02 hardware, but it is often a problem to actually
detect a certain CPU or board variant on runtime. But if that's
possible, I don't see a reason why you can't make a single image.

We had one strange case with an MPC5200 where the bootup bus
configuration was so complicated that it was a major issue and we
decided for different bootloaders, but in general it should be possible.

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
