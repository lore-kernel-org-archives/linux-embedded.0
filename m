From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi,
	lightweight bootloader
Date: Tue, 22 Dec 2009 12:12:50 +0100
Message-ID: <20091222111250.GW22533@pengutronix.de>
References: <4B29EC68.1040109@0xlab.org> <4B29F834.90108@warmcat.com> <20091221193038.38CB63F6EF@gemini.denx.de> <4B2FD7DB.10008@warmcat.com> <20091221213829.1A8B93F6EF@gemini.denx.de> <4B2FF8E7.505@warmcat.com> <20091221231922.GO22533@pengutronix.de> <4B3081C3.3000909@warmcat.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B3081C3.3000909@warmcat.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Green <andy@warmcat.com>
Cc: Wolfgang Denk <wd@denx.de>, celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org

Hi Andy,

[is this the right set of lists to discuss these issues? It's not
directly CELF related, but I don't know a better place for general
project independend bootloader discussions]

On Tue, Dec 22, 2009 at 08:22:27AM +0000, Andy Green wrote:
> DFU is a "special update mechanism" which I believe is a bad idea.

For dedicated embedded system in the non-phone league, with small root
filesystems, it works pretty well.

> I know a lot of people are still putting out full rootfs images as
> updates, and for some platforms that are too resource-constrained
> that's all people can do.

Ah, ok, we don't do that.

> But for modern devices like ARM11+ and the kind of board they
> typically find themselves on with a network connection, these are
> fundamentally at the level of PC from a few years ago. Linux PCs then
> and now use packaged update systems to manage the software on the
> device. And they package both the kernel and the bootloader and track
> and update it like any other package, apply packagesets as
> transactions, etc. The correct approach I believe is to unify the
> bootloader (and kernel) update path with the rest of the system, all
> done from Linux alone.
>
> (Personally I used Fedora ARM port and RPM, but any distro and
> packagesystem like Debian workable on ARM would be fine).

Until now, we are using the "build it yourself" approach with ptxdist,
basically because of these reasons:

- If something goes wrong, we want to be able to fix it, which means
  that we must be able to recompile everything. Having the source is no
  value by itself, if you are not able to build it.

- Root filesystems are small; a complete rootfs for a typical industrial
  application with Linux, glibc, dbus and qt is about 20...30 MiB.

- People don't change software that often, and if they do, it has to be
  made sure that it is absolutely well tested. Nobody wants to reboot
  their deeply embedded machine controller at the other end of the world
  if somehting goes wrong. We usually don't have an administrator who
  can interoperate if something goes wrong.

- Customizability. We recently tried Debian on the Neo, and it is an
  absolute mess. About 2.5 minutes of boot time, a lot of flicker and
  almost no reactivity of the system. So for us, the question remains
  how to customize standard distributions in a reproducable way.

So at least at the moment, I prefer ptxdist over a customized debian.
But in general, I respect the argument why people want to use standard
distributions (I know the pain to fix all the cross compiling issues). I
just don't think that today's distributions are there yet. Most embedded
systems I've seen so far which follow the strip-down-standard-distro
pattern have been unreproducable for anyone but the original developer.

> So we were actually unable to migrate to hard ECC in Linux, which is
> an insane outcome of a broken system.
>
> In contrast if your chip supports it (iMX31 and s3c6410 do and Qi
> works with those) having your bootloader on some sectors of SD card is
> wonderfully simple and easy to dd in on a postinstall scriptlet of
> your bootloader package.

Agreed.

> > In general, I like in-system techniques much better than card
> > juggeling, because it fits better into automated environments like
> > our RemoteLab, which does our automatic nightly tests. But that's
> > surely a matter of the use case you have.
>
> Agreed.
>
> But consider this: if your bootloader is on SD, and your bootloader
> completely rejects to hold private state on the board (other than
> onetime individualization, eg MAC address), something awesome happens
> when you pop your SD card and put it in another board, it comes up
> like the previous board did, no ifs or buts.
>
> You can imagine the effect that has on production / test "virgin"
> board bringup. When you have seen this, you do not want to return to
> raw onboard NAND.

In general, I agree with you here (although I think the MAC address
should be glued to the hardware and not change if you change SD cards ->
people will then copy it and you have the same MAC address twice).

However, I think it's more developer friendly to have that "no changable
state" as a policy than a design decision: during development, we quite
often change for example the kernel command line (adding quiet or debug
switches, boot from net/disk...). For delivery, we just make barebox +
it's scripting environment one image and change that to r/o, if
necessary. So you can get best of both worlds.

> > In barebox, we use Kconfig to configure things away; so removing
> > unnecessary features is just a matter of 'make menuconfig'.
>
> That is good, but what I am suggesting is that
>
> - these things are definitively unnecessary, ie, they deserve
> permanent deselection
>
> - the config system leads to bootloader-binary-per-variant Hell

For us, the bootloader is not only something which is delivered with the
product - that's one use case. But there is also quite a long time where
lots of developers work with the board - and in that use case we'd like
to do things like hacking on registers (without the complexity of
Linux), do TFTP/nfsroot, change kernel command lines etc.

Seeing the production case, I'm all with you.

> Qi uses a per-board callback in an API struct to discover at runtime
> which supported board it's on, and the board can check version bits on
> GPIO typically to discover which variant it is (which is passed on to
> Linux in an ATAG).

Unfortunately, not all hardware vendors make different variants
detectable in software. That's quite often a problem for us. So for the
general case, a compile time selection is necessary. If the hardware
behaves, you are right :-)

> > I see video drivers in the bootloader as an optimization topic: If you
> > can effort to get your splash 3 s after power-on, you should leave video
> > drivers out of the boot loader and do it all in the kernel.
> >
> > Our competition in industry projects is often the old 2-lines-alpha
> > displays, which are "instant on" after you hit the power switch. If this
> > is required, I don't see a way to achieve that with kernel-only at the
> > moment.
>
> Yeah that is true.  You are into a 1.8 - 2 second (on iMX31 SD boot)
> delay from hitting the button to your driver starting up in Linux and
> getting your display up.

... and we still do have a lot of ARM9 systems in the 200...400 MHz
range out there.

> I described on the Openmoko list how even normally good programmers
> become "like a fat girl in Ibiza" when they see how it is in (Openmoko
> tree anyway) U-Boot, any wild thing goes.

That's why we went the device model way in barebox. Having a restricted
environment is no excuse for hackery (and people even assumed that the
same binary size wouldn't be possible in the beginning).

> And some people who describe themselves as "hardware guys" are not
> good programmers.

Very true ;)

> What it led to was private bootloader trees that did not track the
> main one, filled with perverted bit-twiddling code that was not
> understood by anyone except the guy who wrote it, and that guy left a
> while back as did the guy after him.

That's solvable by working on mainline integration. You'll get this
problem with Linux as well, if people are not on a mainline strategy. No
tool can change that.

> All other test actions should be integrated into the Linux driver and
> if they need to be triggered, exposed down /sys.

Ack.

> If all you have is NAND on your board then nothing can be done.
>
> But if you have NAND and SD, it is possible

In barebox, we have bootloader images that run from everywhere. So you
can for example write a little script that detects that you run from SD
or USB stick (taken that we'll have drivers for them) and relocate
to somewhere else (NAND on ARM, or soldered SSD on x86).

> >    - private nonvolatile state
>
> Private nonvolatile state is stuff like the U-Boot environment that
> lives on the board itself and is out of any update management.

On modular systems (like phyCORE, Qseven etc) you have a CPU module, a
baseboard, maybe additional addon boards, and requirements where to
store information like MAC addresses, serial numbers etc. are often very
different.

> This leads to the situation where two boards from the same factory can
> act totally differently depending on what opaque different secrets
> have been hidden away in their private nonvolatile state, even if
> everything updatable in the rootfs is at the same patchlevel and even
> the bootloaders themselves at the same patchlevel.

You can make the private nonvolatile state r/o or w/once.

> That enables you to complete the boot at a reasonable speed without
> actually having the requirement to touch the PMU in those cases.

Unfortunately, often people want to boot as fast as possible, which
requires optimization in that area as well. We recently had a board
which refused to boot without the PMIC having switched on some voltages
which are default-off.

> Yeah Qi has generic gpio bitbang i2c implemented already and we can do
> the same for SPI if needed. But I think you find most PMU have Vcore
> by default at a place you can run at a reasonable speed without
> touching it.

My fear is that quite often one starts with "oh, this problem is simple,
let's design simple". Then things move on and you notice that you need
to work on SPI, I2C, you need ext2, jffs2, ubifs, later maybe btrfs,
then SD support or USB. In the end, the problem turns out to be
complicated.

That's why we more or less stayed with the overall look-and-feel of
u-boot in barebox. We just tried to pull in the best ideas from the
Linux and POSIX universe, like the device model, sane scripting etc.
That way, people at least have something where they can put their hacks
if they really need them, without too much damage for the rest of us :-)

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
