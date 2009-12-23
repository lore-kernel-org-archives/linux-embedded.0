From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight
 bootloader
Date: Wed, 23 Dec 2009 08:48:22 +0000
Message-ID: <4B31D956.9020907@warmcat.com>
References: <4B29EC68.1040109@0xlab.org> <200912202045.37159.rob@landley.net> <20091223022837.GE19806@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=yFczs92s/MxbgyUqA27+k5D671YKXIBEJGrXjnyE41s=;
        b=xknLFEFBvc3np01sLt1EkeqHY/DVC9qFtutF8jQWm+5gV9OnfUz52ZFZpeevrDB+gb
         GPITdQIHmPtEOJyup0skdhcmmMYnVt2LW302TVcRW+mv51JS+M3VQ1KxU31FML8bfuZa
         T+998HmVc3qNt6FkYxJGmBx1z/OFS22qU6IiM=
In-Reply-To: <20091223022837.GE19806@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jamie Lokier <jamie@shareable.org>
Cc: Rob Landley <rob@landley.net>, celinux-dev@tree.celinuxforum.org, Matt Hsu <matt@0xlab.org>, linux-embedded@vger.kernel.org

On 12/23/09 02:28, Somebody in the thread at some point said:

Hi -

> No TCP/IP, no TFTP, not even BOOTP (but it's a nice bonus), no command
> line interpreter (just a GPIO on board to boot into "unbrick me" mode
> :-), and most strikingly _no_ flash driver for flash chip du jour.
>
> To flash it you send a kernel to boot from RAM which is capable of
> flashing it.

Sorry I missed where this kernel appears from and the bootloader that 
spawned it, since both could get trashed.  That is actually a conundrum 
on a lot of systems and some of the solutions (write-once backup 
bootloader) in the long run lead to other issues.

True SD Boot does truly deliver unbrickability if you are willing to 
swap out or reformat the SD card.

>>> http://wiki.openmoko.org/wiki/Qi
>>
>> Looking at the screen shot there, you've got code to parse ext2 filesystems.
>> What is your definition of "minimal"?
>
> Ew, ext2 doesn't even satisfy powerfail-during-kernel-upgrade safety.

It's just misleading (but accurate).  ext2 is the "lowest common 
denominator" read-only parsing that actually supports ext3 and ext4 if 
you are careful about the formatting options.  So the actual filesystem 
is ext3 or ext4 typically (ext3 in GTA02 case), it's not that the 
bootloader is mandating specifically ext2.

> I agree it does beg the question of what is "minimal".
>
> The proposal did explain quite well what Qi aims for: not duplicating
> lots of kernel drivers badly.  If it succeeds in the area of flash
> writing, network drivers, network protocols and so on it would be no
> bad thing.

Thanks.

> One area for potential common ground among bootloaders could be to
> share the code for parsing filesystems.  It'd be great to see that in
> a library shared by GRUB, Qi, U-boot and so on as it's not device
> specific at all and not particularly large, but not so trivial that
> it's good to have lots of clones.

Yeah it's not a bad idea.

> It's possible to boot without parsing filesystems, but that is one
> rather nice feature, and with the right filesystems it can make system
> updates powerfail-safe.

Bootloader is tricky, but actually on this iMX31 device Fedora is used, 
yum update keeps the last 3 kernels around and our kernel package 
follows that.  So it's possible to have backup kernels automatically 
integrated into the bootloader and packaging system.

>> Rationale for not providing a boot menu is you don't want to mess with video
>> init.  I don't think I've actually seen an embedded bootloader that messes
>> with video, they do serial console instead, and you have a screen shot of
>> serial console messages so apparently the serial driver part is there...
>
> In perspective, serial is usually quite simple.  Output only serial is
> even simpler, though :-)

Totally agree!

-Andy
