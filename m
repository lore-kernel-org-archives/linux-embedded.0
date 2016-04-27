From: Rob Landley <rob@landley.net>
Subject: Re: mounting squashfs as initrd from RAM
Date: Wed, 27 Apr 2016 18:46:41 -0500
Message-ID: <57214F61.2090901@landley.net>
References: <20FFB90893A2AB4492D9DFB3B61CC8C403A15778@MBX028-W1-CA-4.exch028.domain.local>
 <5717BBF5.1000401@landley.net>
 <20FFB90893A2AB4492D9DFB3B61CC8C403A372F9@MBX028-W1-CA-4.exch028.domain.local>
 <571ED8BD.2010402@landley.net>
 <20FFB90893A2AB4492D9DFB3B61CC8C403A3CD25@MBX028-W1-CA-4.exch028.domain.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=nvTN1zEOhV70gI24MUssWoMjkhmg9diVk9FzgkWi1ys=;
        b=hsejLp9/iCfwdZano9rPOqitKw1XI8zDs0Tk6wuxZW5N57smAE9CQrX7rVC+wt8HMV
         VBkNHf5SFy9ofbrjShr0WtNo05GRK18fxypIXI9wHdUDA4WX9T4c1aQedEdWHI26vMcs
         ZneaNfCc8VU3U2TuKJu/ijqW1/+9qt6hKRqmZwwbxiQCGgVB+EKzNvK2bR/x+e7JwwAv
         nhwJdpJ5LqJ5IjJxWOaST5dQja5ms62b5DFdnqmiuRHzgQJ18YzuIs2tP0HYsPM7TAgr
         iaPbmFN0CNCTyUf6t6dcxCmEDqVob57U0jXx5XWAmDbltMLM2AmD4pBoUq8t4Nczr9BF
         SSZQ==
In-Reply-To: <20FFB90893A2AB4492D9DFB3B61CC8C403A3CD25@MBX028-W1-CA-4.exch028.domain.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Gifford <nick.gifford@ingenu.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>



On 04/27/2016 02:03 PM, Nick Gifford wrote:
> 
> ________________________________________
> From: Rob Landley [rob@landley.net]
> Sent: Monday, April 25, 2016 7:55 PM
> To: Nick Gifford; linux-embedded@vger.kernel.org
> Subject: Re: mounting squashfs as initrd from RAM
>>> Virtual kernel memory layout:
>>>     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>>>     fixmap  : 0xffc00000 - 0xffe00000   (2048 kB)
>>>     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
> 
> Because fe7f9000 is off the top of "fixmap", but before the start of
> "vector", so it's in an unmapped area.
> 
> [nick] Am I missing something here?  Isn't fe7f9000 in the range "vmalloc : 0xf0000000 - 0xff000000"?

You're right, I misread fe7 as ffe7.

It's _really_ hard to read your responses, by the way. The >>> format
exists for a reason, I take it your client can't do replies that way?

>> [nick] Due to reasons above, I my guess is that uboot is moving the
>> image from 0x1000000 to 0x3e7f9000 before booting linux.
> 
> Where does it say it's moving it? WHY move it? Why isn't the tftp just
> loading it at the right place to begin with? (The load address is an
> argument to the tftp command.)
> 
> And how does 3e7f become f37f? What's the base physical address of your
> fixmap?)
> 
> [nick] I don't know why, but uboot is moving it.  Snippets from the original log:
> ## Loading init Ramdisk from Legacy Image at 01000000 ...
>    Image Type:   ARM Linux RAMDisk Image (gzip compressed)
>    Data Size:    15958016 Bytes = 15.2 MiB
>    Verifying Checksum ... OK
>     Loading Ramdisk to 3e7f9000, end 3f731000 ... OK
> 
> These tell me that uboot is finding it at 01000000, verifying it, and moving it to 3e7f9000 before booting linux.  Then:

Why...?

Is it _just_ moving it, or is it decompressing it? If it decompresses
it, the kernel may not recognize it if it's expected a compressed one.

If it's not decompressing it, how is it "verifying" it?

>  DEBUG: phys to virt addr 3e7f9000 --> fe7f9000
> 
> tells me that linux has mapped 3e7f9000 (taken from uboot) to virtual address fe7f9000.  I don't know why it is not mapped later when trying to access it to copy the rootfs.

Neither do I.

Is this an initrd issue or is this an issue with your board's vmalloc
implementation? Does anything ELSE using vmalloc work?

>>> I added the "DEBUG: phys to virt addr 3e7f9000 --> fe7f9000" where it
>>> looks like 0xfe7f9000 is being mapped for the initrd in
>> arch/arm/mm/init.c.
>>
>> That's a 790 line file, which contains 45 instances of "initrd" but does
>> not contain the word "buf" so i have no idea what variable you printed out.
>>
>> [nick] What I took from this is that after being moved to 0x3e7f9000, it is then being mapped to virtual memory at 0xfe7f9000.

Correction: it's _attempting_ to map it. The fact the result segfaults
when you try to access it is a problem.

> Note that 0xfe7f9000 is the address that is later given to unpack_to_rootfs (with the correct size).
>>
>> And it's architecture independent code where it looks like you're having
>> a board-specific problem. Possibly this is the first vmalloc use in the
>> kernel and vmalloc doesn't work on your board, it's hard to tell from here.
>>
>> [nick] I don't think it is a board problem as everything boots up fine when
>> I mount the rootfs out of flash with kernel arguments of
>> "console=ttyPS1,115200 earlyprintk noinitrd root=/dev/mtdblock6
> rootfstype=squashfs ro"
> 
> Your board's memory layout and where your board is telling the kernel to
> look for the initrd data don't line up. That's either a board problem or
> a bootloader config problem.
> 
> [nick] I think the path from physical addr 01000000 to physical addr 3e7f9000 to virtual address fe7f9000 shows from the logs.  And it seems like fe7f9000 is a valid vmalloc address.

Except for the part where reading from it segfaults.

It's not objecting to the contents of the memory, it's objecting to the
_mapping_. Why is that?

Rob
