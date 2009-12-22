From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi,	lightweight
 bootloader
Date: Tue, 22 Dec 2009 22:23:37 +0000
Message-ID: <4B3146E9.3010101@warmcat.com>
References: <4B29EC68.1040109@0xlab.org> <4B29F834.90108@warmcat.com> <20091221193038.38CB63F6EF@gemini.denx.de> <4B2FD7DB.10008@warmcat.com> <20091221213829.1A8B93F6EF@gemini.denx.de> <4B2FF8E7.505@warmcat.com> <20091221231922.GO22533@pengutronix.de> <4B3081C3.3000909@warmcat.com> <20091222111250.GW22533@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=YolIDU9/Wn/aaUAWj3VhMDrIWFmxirr5js/jV21YrNY=;
        b=sFXzAZsZPRJ/ovjXFdRinqb2eouSYjFghhD8o9pV0fQottaGAKFim/uCNkDpa+OhpM
         g2r4HNck9hX/JeDo3wJ8XhH1qQeDOp4TGguRo2HXnaSNHfyHDP17+/dWsyMBZ6ZiQp92
         QRpWpINGVNdkhsPiCiBGULxzKm7QKjn/T/XTQ=
In-Reply-To: <20091222111250.GW22533@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Wolfgang Denk <wd@denx.de>, celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org

On 12/22/09 11:12, Somebody in the thread at some point said:

Hi Robert -

>> (Personally I used Fedora ARM port and RPM, but any distro and
>> packagesystem like Debian workable on ARM would be fine).
>
> Until now, we are using the "build it yourself" approach with ptxdist,
> basically because of these reasons:
>
> - If something goes wrong, we want to be able to fix it, which means
>    that we must be able to recompile everything. Having the source is no
>    value by itself, if you are not able to build it.

Fedora provides a whole solution there, with the restriction it's 
designed for native build, not cross.  That puts a limit on what you can 
target with it, which is why "ARM11+".  You can just go here

http://fedoraproject.org/wiki/Architectures/ARM#Getting_Started_with_the_Fedora_ARM_Port

Get a rootfs tarball, bring it up and build packages with the compiler 
and build stuff in there already, yum install other stuff, etc.  Again 
SD rootfs makes that simple to consider and do, you can untar it from 
your PC them replug to your device and run it.

> - Root filesystems are small; a complete rootfs for a typical industrial
>    application with Linux, glibc, dbus and qt is about 20...30 MiB.

True, typical Fedora footprint for X and so on will be 200MB.

However.  The developer cost in using these distro packages is next to 
nothing, both acquiring them and their ongoing uplevelling when fc13 
comes.  Quality of the packages is better than I can make :-) and it's 
pretty much anything there is to want

http://ftp.linux.org.uk/pub/linux/arm/fedora/pub/fedora/linux/releases/12/Everything/arm/os/Packages/

And again, if you have SD Card rootfs basis, smallest one of those now 
you can get in a shop is 512MB anyway.

> - People don't change software that often, and if they do, it has to be
>    made sure that it is absolutely well tested. Nobody wants to reboot
>    their deeply embedded machine controller at the other end of the world
>    if somehting goes wrong. We usually don't have an administrator who
>    can interoperate if something goes wrong.

Packages only help any QA effort.  You don't have to release every 
package build to your stable repo, a staged development / testing / 
stable repo scheme is simple.

> - Customizability. We recently tried Debian on the Neo, and it is an
>    absolute mess. About 2.5 minutes of boot time, a lot of flicker and

:-|  Yeah.  But I admired the effort they put in there.  The CPU is too 
weak for that game though and the Glamo in there is the final insult. 
(Actually there is a good rage comic: "Problem, GTA02?")

>    almost no reactivity of the system. So for us, the question remains
>    how to customize standard distributions in a reproducable way.

Well, I can explain what I did with Fedora, we were up in Bash with 
ethernet usb gadget and sshd ready for action in < 5s from cold on iMX31 
SD Card boot.  That's the stock Fedora bash, sshd, etc from their tarball.

The main action is not to use the stock /sbin/init.  (You can still use 
sysV init / upstart to bring services up and down even if init never got 
started since it's basically all sat there in /etc/init.d.)

> So at least at the moment, I prefer ptxdist over a customized debian.
> But in general, I respect the argument why people want to use standard
> distributions (I know the pain to fix all the cross compiling issues). I
> just don't think that today's distributions are there yet. Most embedded
> systems I've seen so far which follow the strip-down-standard-distro
> pattern have been unreproducable for anyone but the original developer.

Right.  Fedora is different though, there are no cross-built packages 
(although they do provide cross compilers, I use them for kernel and Qi 
builds) and if storage is sufficient, there's no need to strip anything 
out.  Just nobble init.

>> But consider this: if your bootloader is on SD, and your bootloader
>> completely rejects to hold private state on the board (other than
>> onetime individualization, eg MAC address), something awesome happens

> In general, I agree with you here (although I think the MAC address
> should be glued to the hardware and not change if you change SD cards ->
> people will then copy it and you have the same MAC address twice).

(That's what I meant by "other than onetime individualization eg MAC 
address" -- that stuff (only) should live on the board not the card)

> However, I think it's more developer friendly to have that "no changable
> state" as a policy than a design decision: during development, we quite
> often change for example the kernel command line (adding quiet or debug
> switches, boot from net/disk...). For delivery, we just make barebox +
> it's scripting environment one image and change that to r/o, if
> necessary. So you can get best of both worlds.

Right.  Qi supports this by allowing the boot source filesystem that 
holds the kernel to also contain an optional "append" text file.  The 
text in this file, if present, is appended to the generated kernel 
commandline.  Qi auto generates the correct root= (based on where it 
found the first workable kernel) and other board-mandated options 
already, but this external append file lets you do things like force 
debuglevel=8 from the filesystem without doing anything to the 
bootloader itself.

It's a plain text file, public, exposed in a standard filesystem and 
will get copied along with the rootfs.  So it's flexibility without the 
private nonvolatile bootloader storage problems.

> Unfortunately, not all hardware vendors make different variants
> detectable in software. That's quite often a problem for us. So for the
> general case, a compile time selection is necessary. If the hardware
> behaves, you are right :-)

Well for my uses of it I have been able to specify that we should have 
versioning GPIOs on the boards.  It's a good idea anyway.

> ... and we still do have a lot of ARM9 systems in the 200...400 MHz
> range out there.

Same as GTA02 class processor.  Qi loads the kernel there in a few 
seconds and brings up its video in Linux as told.

>> What it led to was private bootloader trees that did not track the
>> main one, filled with perverted bit-twiddling code that was not
>> understood by anyone except the guy who wrote it, and that guy left a
>> while back as did the guy after him.
>
> That's solvable by working on mainline integration. You'll get this
> problem with Linux as well, if people are not on a mainline strategy. No
> tool can change that.

It's nothing to do with mainline, just intra-company communication and 
management failure.

>> But if you have NAND and SD, it is possible
>
> In barebox, we have bootloader images that run from everywhere. So you
> can for example write a little script that detects that you run from SD
> or USB stick (taken that we'll have drivers for them) and relocate
> to somewhere else (NAND on ARM, or soldered SSD on x86).

Qi works the same.  The same image can be placed in NAND, NOR or SD and 
boot any supported device.

>> Private nonvolatile state is stuff like the U-Boot environment that
>> lives on the board itself and is out of any update management.
>
> On modular systems (like phyCORE, Qseven etc) you have a CPU module, a
> baseboard, maybe additional addon boards, and requirements where to
> store information like MAC addresses, serial numbers etc. are often very
> different.

What is the point there?

>> This leads to the situation where two boards from the same factory can
>> act totally differently depending on what opaque different secrets
>> have been hidden away in their private nonvolatile state, even if
>> everything updatable in the rootfs is at the same patchlevel and even
>> the bootloaders themselves at the same patchlevel.
>
> You can make the private nonvolatile state r/o or w/once.

You can do that with individualization data, like MAC Addresses.  But 
that is not what the U-Boot environment is.

>> That enables you to complete the boot at a reasonable speed without
>> actually having the requirement to touch the PMU in those cases.
>
> Unfortunately, often people want to boot as fast as possible, which
> requires optimization in that area as well. We recently had a board
> which refused to boot without the PMIC having switched on some voltages
> which are default-off.

If your device is able to run from USB power, there's the issue that you 
are limited to 100mA before enumeration takes place.  So without a USB 
stack, you have to trade speed for power anyway.

>> Yeah Qi has generic gpio bitbang i2c implemented already and we can do
>> the same for SPI if needed. But I think you find most PMU have Vcore
>> by default at a place you can run at a reasonable speed without
>> touching it.
>
> My fear is that quite often one starts with "oh, this problem is simple,
> let's design simple". Then things move on and you notice that you need
> to work on SPI, I2C, you need ext2, jffs2, ubifs, later maybe btrfs,
> then SD support or USB. In the end, the problem turns out to be
> complicated.

You're right to fear it because you are too willing to re-introduce the 
bloat into your bootloader.  For example you mention earlier that 
"Unfortunately, often people want to boot as fast as possible" and that 
is the rationale for re-introducing PMU management and the serial bus 
driver back into the bootloader.  But actually, normal customers don't 
care about 200ms on boot either way.  They can get the thing to market 
quicker and so cheaper and more reliably without that stuff in the 
bootloader.

> That's why we more or less stayed with the overall look-and-feel of
> u-boot in barebox. We just tried to pull in the best ideas from the
> Linux and POSIX universe, like the device model, sane scripting etc.
> That way, people at least have something where they can put their hacks
> if they really need them, without too much damage for the rest of us :-)

No offence but you are basically describing U-Boot there, mini Linux, 
scripting, hacks.  Surely like U-Boot dreams of growing up into Linux, 
you will find your project dreaming of growing up into U-Boot.

Qi rejects all of those and so is different (and smaller) than your 
project, I am sure there is "room in the market" for all of the 
philosophies including U-Boot.

-Andy
