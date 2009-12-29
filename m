From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight
 bootloader
Date: Tue, 29 Dec 2009 13:36:47 +0000
Message-ID: <4B3A05EF.5070809@warmcat.com>
References: <4B29EC68.1040109@0xlab.org> <200912202045.37159.rob@landley.net> <20091223022837.GE19806@shareable.org> <4B31D956.9020907@warmcat.com> <20091229131353.GA5736@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=qlw6AsvScwyALOCm2kgG0GVl7om2CNHXv4dR14Bp/rQ=;
        b=u01Chnh3kcytzgX4RifU1TR0tTPBTluH3YVgGwpZb37XP8+x+0Eq4lHqIOCscO+Fop
         hFgHGEj5Z3hZvuY8G6QutzaRhTKBg2wRAwJUskT0LGNAWGaY6UxqnaGQQAJIQAj/A5jc
         6IspHu0J397TiBHOhC4QM7lFJurjNe0VnW4lU=
In-Reply-To: <20091229131353.GA5736@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jamie Lokier <jamie@shareable.org>
Cc: Rob Landley <rob@landley.net>, celinux-dev@tree.celinuxforum.org, Matt Hsu <matt@0xlab.org>, linux-embedded@vger.kernel.org

On 12/29/09 13:13, Somebody in the thread at some point said:

Hi -

>> Sorry I missed where this kernel appears from and the bootloader that
>> spawned it, since both could get trashed.
>
> The kernel appeared from the network/serial/USB, as described.  It's
> not on the device.  The point is you don't need a "spare" kernel for
> unbrickability (and kernels are quite large); it's enough to be able
> to send one in unbricking mode.

The bootloader that will load this kernel can't be updated or trashed 
itself?

> With the disadvantage that you need the board space, connector cost
> etc. for an SD card.  It's fine if you already have that.

Sure.  Although the connector and pullups needed are really cheap.  You 
also need an SD interface on your CPU, but most of this kind of 
processor have multiple SD interfaces already.

> I'd put it into a similar category to network/serial/USB: Using
> whatever your board provides for bare-bones communication, bootstrap a
> kernel for more advanced stuff involving fancier drivers.

Well my suggestion is SD is in a different category.  Unlike network or 
serial or USB it works for boot without a host to talk to.

>>> Ew, ext2 doesn't even satisfy powerfail-during-kernel-upgrade safety.
>>
>> It's just misleading (but accurate).  ext2 is the "lowest common
>> denominator" read-only parsing that actually supports ext3 and ext4 if
>> you are careful about the formatting options.  So the actual filesystem
>> is ext3 or ext4 typically (ext3 in GTA02 case), it's not that the
>> bootloader is mandating specifically ext2.
>
> If it reads an ext3/4 filesystem using an ext2 read-only parser, then
> it will not be powerfail-safe.  Partially written files and directory
> updates will look like corruption on boot.

Yeah I think that is true.

> It's essential that it parses the journal as well.  It does not have
> to commit the journal (which would need device writing ability), but
> in that case it must allow journal blocks to supercede blocks from
> elsewhere in the filesystem.

Personally I don't use ext2 for the containing the kernels, but VFAT on 
SD.  Qi supports ext2 because that's what was going on GTA02.

>>> It's possible to boot without parsing filesystems, but that is one
>>> rather nice feature, and with the right filesystems it can make system
>>> updates powerfail-safe.
>>
>> Bootloader is tricky, but actually on this iMX31 device Fedora is used,
>> yum update keeps the last 3 kernels around and our kernel package
>> follows that.  So it's possible to have backup kernels automatically
>> integrated into the bootloader and packaging system.
>
> It's useless to have 3 kernels around if the directory containing them
> looks corrupted due to not parsing the journal. :-)  Then you won't see
> any of the kernels at boot time.

You're assuming that those kernels are in ext2/3/4, as mentioned above 
actually I have been using VFAT.  But actually with Qi there's another 
solution even for ext2 "/boot" partition that makes it safe.

Qi has a fallthru scheme for acquiring the kernels, you give a list of 
partitions and filenames and it uses the first one that gets it a good 
kernel image.

Therefore you can have a backup kernel and rootfs in a second partition 
which is not normally updated.  If the normal kernel is broken (plus or 
minus the fs parsing code being good enough it won't infinitely loop or 
whatever when given junk) it will select the backup one from the clean 
partition.

-Andy
