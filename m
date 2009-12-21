From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight
 bootloader
Date: Mon, 21 Dec 2009 09:54:22 +0000
Message-ID: <4B2F45CE.8060903@warmcat.com>
References: <4B29EC68.1040109@0xlab.org> <200912202045.37159.rob@landley.net> <4B2F0CDB.3050305@0xlab.org> <200912210200.10047.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=AjFl4yW47rbF+C8Krra1YwTJlk+zbpo3Zo5Xnx80pCI=;
        b=Pu/pcSSs+b7gE5898hN5qVAIGQ4tmLJhiDw+Lq1AxOEL5itptDe9ApvuXGvU50u5kS
         WhGelPAwwlWbZE5LUYZzAKFRsaVVRhIpi4BnXk1QFUC1YFg2bny1ua+SKuIoATuvFSv1
         P8O83etc/Rq0uVxI/XAQ+e+eVOdJrFnsm/OxQ=
In-Reply-To: <200912210200.10047.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Landley <rob@landley.net>
Cc: Matt Hsu <matt@0xlab.org>, celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org

On 12/21/09 08:00, Somebody in the thread at some point said:

Hi Rob -

>>> However, if that's your minimum then you can't use the bootloader to
>>> re-flash the device, which is kind of handy.  (It gives you an
>>> un-bricking fallback short of pulling out a jtag.)

There is a simple and much more flexible alternative to have a "recovery 
rootfs" on the device that can be selected, by holding down a button or 
somesuch which is understood by Qi.  That gives you ALL the options 
possible in Linux like network connectivity for your recovery without 
doubling the support load in having a "smart" bootloader and its 
different drivers to deal with.

>>      Well, Boot from SD is your good friend.
>
> Ok, not aiming to be a generic bootloader then.  You're only trying to support
> hardware that has the flash equivalent of a floppy drive.  Got it.

No, Qi will boot from onboard NAND or NOR as well as SD.

For other reasons -- eg, unbrickability -- true boot from SD is very 
powerful.  By "true boot from SD" I mean the on-CPU ROM is pulling a 
bootloader from SD so the entire software environment is coming from there.

>>      If you look at the platform that Qi which is supported, most of them
>> all have this feature.
>
> Because if they didn't you wouldn't support them?  Bit of a selection bias
> there...

Naturally enough we only added support for devices we are using in the 
real world :-)

All the devices Qi target have what Samsung called "steppingstone", some 
small SRAM on the die that can hold your core bootloader startup from 
NAND or SD (since you cannot execute direct from NAND).  That's probably 
a better one-liner to describe the scope of it.

> Life is a bit easier if you can stick a USB port on your device and boot from
> a USB stick or cdrom.  Most of the SoCs coming down the pipe support USB too,
> but your wiki doesn't seem to consider this an interesting case...

To be clear Openmoko Wiki isn't "our Wiki".  Qi got started there to 
solve the difficulties created by having basically a second Linux on the 
device in the form of U-Boot.  But the main work on Qi is done now at 
warmcat and Matt's OMAP branch.  Openmoko doesn't seem to be in the 
phone business any more.

> Depending on the kernel to reflash the device means that if you reflash the
> device with a kernel that doesn't work, what you have is a brick.  There's

That does not follow if you have a recovery kernel + initrd / rootfs in 
another partition that can be selected by holding down a key.

> new kernel you risk bricking the device.  (If you only care about devices that
> have 2 gigs of flash, life is much easier.)
>
>>      Don't reinvent the wheel.
>
> There are how many existing bootloaders out there already?

So what?

As described the advantages of Qi's debloated and Linux-centric 
philosophy came from having our noses pushed for months into the world 
of crap coming from supporting multiple drivers and power behaviours 
spread over U-Boot and Linux.

We did not find any existing open ARM bootloader that had a solid 
internal structure and avoided the bloat.

Therefore we made one that proves that it is possible to push most of 
the features of U-Boot and other heavy bootloaders to Linux.

>>> Looking at the screen shot there, you've got code to parse ext2
>>> filesystems. What is your definition of "minimal"?

Yes the main tenet is it has got to "load" and "boot" the kernel.  If 
the kernel is on ext* then that's part of its remit.

>>      Enough to boot into Linux.
>
> You need to parse an ext2 filesystem to boot into linux?  (I'm not saying it's
> a _bad_ thing, I'm just not seeing how it's "minimal".)

The ext* code is tight (taken from U-Boot and cleaned up).

With VFAT, ext*, memory test, all of the features Qi comes to 28KBytes 
typical binary.

>>> Rationale for not providing a boot menu is you don't want to mess with
>>> video init.
>>
>>      Nope, the centric idea of Qi, is let kernel deal with everything it
>> could handle.
>
> So the fact the kernel can provide a serial console means you shouldn't?

Qi provides serial output for diagnosis of the boot action.  But not input.

But the answer to your rhetorical question is "yes".  It costs mindspace 
and support effort to support and work with these complex chunks of 
software, it's real money.

Turn your question around, what is your rationale for duplicating the 
stuff that Linux does great into a bloated bootloader with its own 
shell?  If you look at each of the features in a bootloader like U-Boot 
that is not directly needed for "load" and "boot", they each have a more 
powerful counterpart in Linux already.  You have to support the Linux 
version on your Linux box, just simplify it down to that alone.

>>      The video init should be handled by kernel stead of bootloader.
>
> Oh agreed.  What that has to do with a command line interpreter on the serial
> console was my question.

First maybe it's on you to explain why, other than habit, you think that 
is worth the bloat.

> I.E. you enable the cpu cache during kernel decompression.

You are assuming wrongly that the kernel is compressed.  On iMX31 I use 
Qi with uncompressed 3MByte kernel from SD Card, it's booted to shell 
from cold in 2.5s.  In any event with compressed kernels, we use the 
kernel uncompress, it's not done in Qi.

> aiming at something more generic.  But this bootloader is not intended to ever
> apply to something like a hammer board, or any existing linksys-class router,
> most current cell phones, devices like handheld game consoles where the sd
> card stores data but not the operating system (due to the thing still needing
> to work when you swap sd cards)...
>
> My mistake.  You're creating a bootloader specifically tailored to booting from
> sd cards.  Might want to make that clear on the web page.

Apologies for throwing you back into confusion and doubt by the fact Qi 
boots fine from NAND, NOR and SD.

Actually Qi will work fine on most current ARM-based cellphones and game 
consoles with NAND or NOR.

-Andy
