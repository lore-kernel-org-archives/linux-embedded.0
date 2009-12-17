From: Andy Green <andy@warmcat.com>
Subject: Re: CELF Project Proposal- Refactoring Qi, lightweight bootloader
Date: Thu, 17 Dec 2009 09:21:56 +0000
Message-ID: <4B29F834.90108@warmcat.com>
References: <4B29EC68.1040109@0xlab.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=KmQ2Ba5c8BwE/BFsPWl1sxANX4aRzVsFweCi6en1CI8=;
        b=qTlsyJJexmXqpjDocgUpCbHJFJ4Zq0bFG+fk93eN8LWBsG9MbnLHLcfXS940nU4r7U
         jdyE093vGm41ewJtwUbgMbsu4ZsxcZVHhq4ufXHIRHX0XTfwPxvAXKidWvaXyEk7ED0s
         6r8Y8L/K0+HN2tnTenLUHbN7D4lg9u/udUSxk=
In-Reply-To: <4B29EC68.1040109@0xlab.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matt Hsu <matt@0xlab.org>
Cc: celinux-dev@tree.celinuxforum.org, linux-embedded@vger.kernel.org, tim.bird@am.sony.com

On 12/17/09 08:31, Somebody in the thread at some point said:

Hi -

Just read about this a little late :-)

I wrote the bulk of Qi while at Openmoko.

> Qi currently supports samsung s3c24xx series, s3c6410, TI omap3530. The

I also ported it to iMX31.

> - Generalize components which could be used in common such as I2C drivers.
> Example: platform specific I2C driver -> GPIO bitbang driver.

I wrote a generic bitbang I2C "driver" for Qi back in 2007, it's used on 
the GTA02 build IIRC to talk to the PMU:

 
http://git.warmcat.com/cgi-bin/cgit/qi/tree/src/drivers/i2c-bitbang.c?h=txtr

> - Remove duplicated, unused code, header definition. Keep Qi as minimum
> as needed.

What I can suggest would be worthwhile goals are:

  - extending the targeted CPU arches

  - folding the OMAP branch (written by Matt) back into the main tree

  - improving the memory test to force burst mode

On the txtr branch (currently they are my customer and we use Qi on 
their iMX31 e-book reader) there's already various tidying up and 
advances like FAT filesystem, PRNG-based memory test.

  http://git.warmcat.com/cgi-bin/cgit/qi/log/?h=txtr

Here is a bit more about the reasoning for bothering with another 
bootloader and the philosophy behind Qi.

While working at Openmoko maintaining their kernel, it became obvious 
that U-Boot was turning into a mini-me for Linux.  Many cut-down Linux 
drivers were appearing there, there was a shell with an environment 
holding private states like booting action commands.  This led to a 
situation where two identical devices with same patchlevel of everything 
including bootloader may act differently according to what's in that 
hidden environment.  Wanting a "boot menu" meant supporting graphics and 
some of the drivers like for Glamo were complex and always forked from 
their Linux counterparts.

The burden of maintaining forked drivers in two places (the U-Boot ones 
had to be "dumbed down" to the point it can't share sources) and the 
additional complexity of trying to manage power and additional device 
state in two places are all actually completely unnecessary.  All the 
bootloader needs is just enough to get hold of a kernel and boot it. 
That is Qi's philosophy in a nutshell: "load [the kernel], then boot". 
Linux is then the single place for good support of all assets on the device.

It can work from NAND or NOR but actually the existing support is 
designed to work with SD Card boot.  Recent devices like s3c6410 and 
i.MX31 can completely boot from SD Card, including getting their 
bootloader from there.  On i.MX31 using this scheme, we are able to boot 
to a bash prompt in 2.5s from cold.

Another big problem with U-Boot was the inability to update the 
bootloader from the Linux world.  Instead the bootloader was treated 
special and had to be updated over USB with DFU (the exclusivity of it 
enforced by an ECC policy disconnected from Linux, meaning U-Boot had to 
write it in there).  In Qi, the bootloader can be updated by a packaged 
update like anything else in the rootfs.

There are no private environment / states, there are per-board 
heuristics for where to look for a kernel, and filesystem files which 
can append to kernel commandlines if present.  Therefore identical 
devices with the same Qi patchlevel will always act the same.

-Andy
