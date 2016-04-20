From: Rob Landley <rob@landley.net>
Subject: Re: mounting squashfs as initrd from RAM
Date: Wed, 20 Apr 2016 12:27:17 -0500
Message-ID: <5717BBF5.1000401@landley.net>
References: <20FFB90893A2AB4492D9DFB3B61CC8C403A15778@MBX028-W1-CA-4.exch028.domain.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=qsei7Rj14g2wjTlR3hwUJp7J7kDiicQ9avm6JjT49wY=;
        b=gsPHDPSWEf0vonoXuZeth9rpIt7ko9Cl2+RlbnPYcScoZmK6k2yM9N/Q/efEsE8hhf
         UMpfREncTUa+c7vt0u1fbifndYaPYzYra5JlEIApu99v2OmbSyiIdnFqgBqdlaAASsI7
         z68EoxU59SLJhc0vL42HMwSR80guZ9cz83pdRsB5gmyXLl2lOmwc+pagBvDplmx0G/tu
         Yqbbn/jD64oGZx062t7KWIvTrXEbLjVDJPDjJVYXviGEOa04AWxuRT++6Oap94HRkP3a
         Eq3MF1dZ3OyLQEPMDO6B29ESH51AtYFAsJi0XD9jfEiMVu0yJ3brqXdmtG+5mO3CGnWA
         W3hQ==
In-Reply-To: <20FFB90893A2AB4492D9DFB3B61CC8C403A15778@MBX028-W1-CA-4.exch028.domain.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Gifford <nick.gifford@ingenu.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On 04/12/2016 04:42 PM, Nick Gifford wrote:
> I have a squashfs filesystem that I want to mount as initrd.  I don't
> want to use initramfs since the squashfs compresses better.  I'm ok
> with the wasted RAM since our system is much more constrained by flash
> space than RAM.

Did we ever hook up initramfs xz compression in the kernel? That really
should compress better than squashfs (for the same reason tar compresses
better than zip, no need to retain random access capabaility to the data).

> I want to mount it from RAM so that the flash partition can be safely
> written/upgraded while linux is running with the RAM copy mounted.

So you're using a squashfs formatted initrd.

> Eventually, I want the linux kernel and the initrd to each have their
> own partition (for upgradeability), but right now I'm just copying them
> directly into RAM from u-boot and passing the initrd RAM address as the
> second arg to bootm.  Below is my u-boot environment and console log.

Let's see...

> Trying to unpack rootfs image as initramfs...
> DEBUG unpack_to_rootfs buf=[fe7f9000], len=15958016
> Unable to handle kernel paging request at virtual address fe7f9000

That second line does not exist in the kernel source I have, so I'm
guessing that's a debug printf you added. Given that, I don't know if
that's the source buffer or the destination buffer, but whatever it is
the kernel can't access it.

Sounds like your u-boot isn't correctly telling the kernel where to find
the blob it loaded? Let's see...

> Virtual kernel memory layout:
>     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>     fixmap  : 0xffc00000 - 0xffe00000   (2048 kB)
>     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
>     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
>     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
>     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
>       .text : 0xc0008000 - 0xc071b584   (7246 kB)
>       .init : 0xc071c000 - 0xc0756880   ( 235 kB)
>       .data : 0xc0758000 - 0xc07ae0b8   ( 345 kB)
>        .bss : 0xc07ae0b8 - 0xc0fb33b8   (8213 kB)

It's in the vmalloc space. So presumably destination buffer?

> TFTP from server 10.50.4.82; our IP address is 10.50.6.251
> Filename 'urootfs.squashfs'.
> Load address: 0x1000000

Your u-boot thinks it loaded the initrd at 0x1000000, which is not
mentioned in your printk. Not knowing where you added your printk, I
couldn't tell you what variable it corresponds to...

> Any help on why I'd be seeing the unhandled paging request?

Not without knowing what you've done to your code, no.

> I added the "DEBUG: phys to virt addr 3e7f9000 --> fe7f9000" where it
> looks like 0xfe7f9000 is being mapped for the initrd in
arch/arm/mm/init.c.

That's a 790 line file, which contains 45 instances of "initrd" but does
not contain the word "buf" so i have no idea what variable you printed out.

And it's architecture independent code where it looks like you're having
a board-specific problem. Possibly this is the first vmalloc use in the
kernel and vmalloc doesn't work on your board, it's hard to tell from here.

Rob
