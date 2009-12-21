From: Rob Landley <rob@landley.net>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight bootloader
Date: Mon, 21 Dec 2009 02:00:09 -0600
Message-ID: <200912210200.10047.rob@landley.net>
References: <4B29EC68.1040109@0xlab.org> <200912202045.37159.rob@landley.net> <4B2F0CDB.3050305@0xlab.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B2F0CDB.3050305@0xlab.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Matt Hsu <matt@0xlab.org>
Cc: celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org, Andy Green <andy@warmcat.com>

On Sunday 20 December 2009 23:51:23 Matt Hsu wrote:
> Rob Landley wrote:
> > However, if that's your minimum then you can't use the bootloader to
> > re-flash the device, which is kind of handy.  (It gives you an
> > un-bricking fallback short of pulling out a jtag.)
>
>     Hi Rob,
>
>     Well, Boot from SD is your good friend.

Ok, not aiming to be a generic bootloader then.  You're only trying to support 
hardware that has the flash equivalent of a floppy drive.  Got it.

>     If you look at the platform that Qi which is supported, most of them
> all have this feature.

Because if they didn't you wouldn't support them?  Bit of a selection bias 
there...

Life is a bit easier if you can stick a USB port on your device and boot from 
a USB stick or cdrom.  Most of the SoCs coming down the pipe support USB too, 
but your wiki doesn't seem to consider this an interesting case...

>     If you notice the trend of SoC, booting from peripherals becomes a
> must.

Depends how cheap you want your hardware to be, and whether you can afford 
separate development and deployment boards.

Software development is a bit easier when you can spec adding a extra few 
dollars worth of hardware to your device rather than redoing its software.  I 
tend to deal with people who repurpose existing cheap plastic crap already 
being knocked out in huge quantities somewhere in china.  (Their hardware 
contribution _might_ be a different plastic case for the thing.)  I've also 
dealt with highly integrated little suckers that haven't got _space_ for an sd 
card.  Since I one day dream of following Moore's Law down to "disposable 
computing", I'm reluctant to discard these cases as uninteresting.

>     Once you step into kernel via Qi, kernel provides you everything
> such as mtd utils to re-flash device.
>     We don't need to support programming the device in the bootloader
> anymore.

Depending on the kernel to reflash the device means that if you reflash the 
device with a kernel that doesn't work, what you have is a brick.  There's 
lots and lots of reasons for a kernel not to work, and a 2.6 kernel kernel 
takes up around a megabyte on a device that may only have 2 or 4 megs of ram 
so keeping an old one around at all times isn't feasible.  So without some 
kind of fallback (such as a little ~32k bootloader at the start of flash that 
you never overwrite, in its own little erase block), every time you install a 
new kernel you risk bricking the device.  (If you only care about devices that 
have 2 gigs of flash, life is much easier.)

>     Don't reinvent the wheel.

There are how many existing bootloaders out there already?

> > Looking at the screen shot there, you've got code to parse ext2
> > filesystems. What is your definition of "minimal"?
>
>     Enough to boot into Linux.

You need to parse an ext2 filesystem to boot into linux?  (I'm not saying it's 
a _bad_ thing, I'm just not seeing how it's "minimal".)

> > Rationale for not providing a boot menu is you don't want to mess with
> > video init.
>
>     Nope, the centric idea of Qi, is let kernel deal with everything it
> could handle.

So the fact the kernel can provide a serial console means you shouldn't?

>     The video init should be handled by kernel stead of bootloader.

Oh agreed.  What that has to do with a command line interpreter on the serial 
console was my question.

Personally, i'm used to embedded devices being headless.  (I tend to consider 
the iPhone the next stage in the mainframe->micro->mini evolution and it'll 
soon be "just another PC" target when they get the ergonomics worked out.  
Heck, give those suckers a USB port and you could give 'em a big keyboard and 
display today, and they could even charge themselves through the thing.  Way 
more powerful than my first 386 PC.  Actually about as powerful as the laptop I 
had circa 2002 or 2003.)

>     The following clip demonstrate the advantage of Qi bootloader:
>
>     http://www.youtube.com/watch?v=ol9LWBKXXwQ&feature=related
>
>     - Faster booting time

I.E. you enable the cpu cache during kernel decompression.

I believe the u-boot guy just posted that as a todo item, and that falls on 
the coreboot side of bootloading, which really should be broken out into its 
own little project someday...

The other delay in something like u-boot is it pausing to see if it gets an 
"esc" or similar from the serial console, so it can be interrupted and provide 
a prompt.  That's a configurable delay which can be removed if it really bugs 
you.

>     - Get rid of flash on display device when stepping into kernel
>
>     Hope these could clear your doubt.

Your proposal confused me when it said things like "improve portability" and 
"make people spend less time on bootloader development", so I thought you were 
aiming at something more generic.  But this bootloader is not intended to ever 
apply to something like a hammer board, or any existing linksys-class router, 
most current cell phones, devices like handheld game consoles where the sd 
card stores data but not the operating system (due to the thing still needing 
to work when you swap sd cards)...

My mistake.  You're creating a bootloader specifically tailored to booting from 
sd cards.  Might want to make that clear on the web page.

>     Cheers,
>     Matt

Rob
-- 
Latency is more important than throughput. It's that simple. - Linus Torvalds
