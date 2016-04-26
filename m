From: Rob Landley <rob@landley.net>
Subject: Re: mounting squashfs as initrd from RAM
Date: Mon, 25 Apr 2016 21:55:57 -0500
Message-ID: <571ED8BD.2010402@landley.net>
References: <20FFB90893A2AB4492D9DFB3B61CC8C403A15778@MBX028-W1-CA-4.exch028.domain.local>
 <5717BBF5.1000401@landley.net>
 <20FFB90893A2AB4492D9DFB3B61CC8C403A372F9@MBX028-W1-CA-4.exch028.domain.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=CXRJ60KE+4qVh9QNkAfAoQ2Vk9wJye9rbLxPuFqYs10=;
        b=ZRdgA/zB/5wx/1f41q8J1nPHrWLSUrHxjqNeNsd0QJCvdUZnjj8EWY43yNWXad70yL
         sTknqggXq3/gaCwAA1ZnfF7Ed3bnK02BeZ1D8cl/AO9aZrGEBvJpEVpuq49BNxZ+zj1l
         F1sNmvo4vdwZTda7uOPDhfg8ItIiDqTnY4HosTtpsNNNNVBxamxT7Gm1LfcAIkBSbzxy
         W6ZOCm17BziYg185nv0nQx8XUWYA0l01rOzNDJNXkWxzRB3TR6AsVCkDN+mv3g/pPM5X
         Ivxw7DdXe89ur7f+vni13IZkMLrBXBvDxy+vXnWPLP0THm+d/30QoMpJmRF5za6NUihP
         Oh6w==
In-Reply-To: <20FFB90893A2AB4492D9DFB3B61CC8C403A372F9@MBX028-W1-CA-4.exch028.domain.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Gifford <nick.gifford@ingenu.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On 04/25/2016 01:36 PM, Nick Gifford wrote:
> Thanks for the help, Rob.  Comments inline...
> 
> nick
> ________________________________________
> From: Rob Landley [rob@landley.net]
> Sent: Wednesday, April 20, 2016 10:27 AM
> To: Nick Gifford; linux-embedded@vger.kernel.org
> Subject: Re: mounting squashfs as initrd from RAM
> 
> On 04/12/2016 04:42 PM, Nick Gifford wrote:
>> I have a squashfs filesystem that I want to mount as initrd.  I don't
>> want to use initramfs since the squashfs compresses better.  I'm ok
>> with the wasted RAM since our system is much more constrained by flash
>> space than RAM.
> 
> Did we ever hook up initramfs xz compression in the kernel? That really
> should compress better than squashfs (for the same reason tar compresses
> better than zip, no need to retain random access capabaility to the data).
> 
> [nick] I can look into that.  I'm not against using initramfs, but I tried
> that and had a similar issue.  My main requirement is that the rootfs
> is not bundled with the kernel.

You can load your initramfs using the old initrd mechanism; if it's a
cpio.gz file the kernel will recognize that and know what to do with it.
(I.E. feed a cpio.gz file in place of your squashfs image, and it should
be extracted to initramfs.)

If you have both a static and external initramfs, the static one is
extracted first and then the external one is extracted over it.
(Conflicting files are either replaced or extended depending on your
kernel version.)

>> I want to mount it from RAM so that the flash partition can be safely
>> written/upgraded while linux is running with the RAM copy mounted.
> 
> So you're using a squashfs formatted initrd.
> [nick] yes
> 
>> Eventually, I want the linux kernel and the initrd to each have their
>> own partition (for upgradeability), but right now I'm just copying them
>> directly into RAM from u-boot and passing the initrd RAM address as the
>> second arg to bootm.  Below is my u-boot environment and console log.
> 
> Let's see...
> 
>> Trying to unpack rootfs image as initramfs...
>> DEBUG unpack_to_rootfs buf=[fe7f9000], len=15958016
>> Unable to handle kernel paging request at virtual address fe7f9000
> 
> That second line does not exist in the kernel source I have, so I'm
> guessing that's a debug printf you added. Given that, I don't know if
> that's the source buffer or the destination buffer, but whatever it is
> the kernel can't access it.
> 
> [nick] I'll attach a diff below.  Those are the arguments to the unpack_to_rootfs function.

Ok, so it looks like your phys_initrd_start isn't mapped.

> Sounds like your u-boot isn't correctly telling the kernel where to find
> the blob it loaded? Let's see...
> 
> [nick] I believe uboot is doing the right thing.  It was not even booting linux until I got the uboot image header right.  Also, the "len=15958016" in my linux debug log is exactly the right size, so the blob size is being passed to linux correctly.
> 
>> Virtual kernel memory layout:
>>     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>>     fixmap  : 0xffc00000 - 0xffe00000   (2048 kB)
>>     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)

Because fe7f9000 is off the top of "fixmap", but before the start of
"vector", so it's in an unmapped area.

Yeah, that'll segfault. What's telling your kernel that this is where to
load the external initrd image from there? (Your bootloader, presumably...)

>>     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
>>     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
>>     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
>>       .text : 0xc0008000 - 0xc071b584   (7246 kB)
>>       .init : 0xc071c000 - 0xc0756880   ( 235 kB)
>>       .data : 0xc0758000 - 0xc07ae0b8   ( 345 kB)
>>        .bss : 0xc07ae0b8 - 0xc0fb33b8   (8213 kB)
> 
> It's in the vmalloc space. So presumably destination buffer?
> 
>> TFTP from server 10.50.4.82; our IP address is 10.50.6.251
>> Filename 'urootfs.squashfs'.
>> Load address: 0x1000000
> 
> Your u-boot thinks it loaded the initrd at 0x1000000, which is not
> mentioned in your printk. Not knowing where you added your printk, I
> couldn't tell you what variable it corresponds to...
> 
> [nick] Due to reasons above, I my guess is that uboot is moving the
> image from 0x1000000 to 0x3e7f9000 before booting linux.

Where does it say it's moving it? WHY move it? Why isn't the tftp just
loading it at the right place to begin with? (The load address is an
argument to the tftp command.)

And how does 3e7f become f37f? What's the base physical address of your
fixmap?)

> This somewhat makes sense to me since it is near the top of the 1GB
> of RAM on this system.

Is it in the 2 megabyte fixmap window above?

>> Any help on why I'd be seeing the unhandled paging request?
> 
> Not without knowing what you've done to your code, no.
> 
>> I added the "DEBUG: phys to virt addr 3e7f9000 --> fe7f9000" where it
>> looks like 0xfe7f9000 is being mapped for the initrd in
> arch/arm/mm/init.c.
> 
> That's a 790 line file, which contains 45 instances of "initrd" but does
> not contain the word "buf" so i have no idea what variable you printed out.
> 
> [nick] What I took from this is that after being moved to 0x3e7f9000, it is then being mapped to virtual memory at 0xfe7f9000.  Note that 0xfe7f9000 is the address that is later given to unpack_to_rootfs (with the correct size).
> 
> And it's architecture independent code where it looks like you're having
> a board-specific problem. Possibly this is the first vmalloc use in the
> kernel and vmalloc doesn't work on your board, it's hard to tell from here.
> 
> [nick] I don't think it is a board problem as everything boots up fine when
> I mount the rootfs out of flash with kernel arguments of
> "console=ttyPS1,115200 earlyprintk noinitrd root=/dev/mtdblock6
rootfstype=squashfs ro"

Your board's memory layout and where your board is telling the kernel to
look for the initrd data don't line up. That's either a board problem or
a bootloader config problem.

Rob
