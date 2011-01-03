From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 01/16 v5] pramfs: documentation
Date: Mon, 03 Jan 2011 10:54:28 +0100
Message-ID: <4D219CD4.1070307@gmail.com>
References: <4D0A5377.1020007@gmail.com> <20110103074526.GA2687@ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=cKufX88tLicS/T8G/reDMTf6gY3BXBaJCI7N/ki5k2g=;
        b=De3lWLb94Di94rZfZ6+dVGh5Fpisov5uslSlBjUwVwL8D7s//3IAR/1mtecvbGnQPS
         klOmyEZ5EfQ5fUidNjEbqbUi/6jO0/S2t3E9KLo5/S3SFueab+5ncJUmxfG0jVafGzhI
         o6c59u1bXhk76f/npcqcHMaFvEG2Y8Q9t60vc=
In-Reply-To: <20110103074526.GA2687@ucw.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@ucw.cz>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>

Il 03/01/2011 08:45, Pavel Machek ha scritto:
> Hi!
> 
>> +But the disk-based fs over non-volatile RAM block driver approach has
>> +some drawbacks:
>> +
>> +1. Complexity of disk-based fs: disk-based filesystems such as ext2/ext3/ext4
>> +   were designed for optimum performance on spinning disk media, so they
>> +   implement features such as block groups, which attempts to group inode data
>> +   into a contiguous set of data blocks to minimize disk seeking when accessing
>> +   files. For RAM there is no such concern; a file's data blocks can be
> 
> Yes, and they are also used on 99% of machines out there -> well
> debugged.

I know that you aren't a supporter for this kind of project...do you
mean that the world finishes with ext4? Why do you ask for removing from
mainline logfs, nilfs, btrs and so on? At the end all can use ext4
everywhere and in all situations, other fs are crap. In addition, I
really don't want to replace extN fs or say "my fs is absolute better of
extN", I'm pointing out that a simpler and ad-hoc solution for *this use
case* maybe it's better.

> 
> Is there fsck for pramfs available, for example?
> 

Currently not. First of all there isn't a device sdX to use, I could use
mem but it's not always available when you use strict_devmem option
because the memory region is marked "exclusive" (it's used to avoid to
"play" with that memory region). In addition, since the simplicity and
the scope of this fs I didn't find an use case that justifies writing an
fsck.

>> +   This increases the efficient use of space on the media, i.e. more
>> +   space is dedicated to actual file data storage and less to meta-data
>> +   needed to maintain that file data.
> 
> So... how big is overhead of pramfs compared to ext2?

You can find a lot of information on the tech web site page.

> 
> Can pramfs handle powerdown at arbitrary time?
> 

If you are asking for journaling, the answer is currently not. Adding
journaling means a deeply rework and redesing. This effort can be
justified only with high benefits. At the moment for the scope of this
fs I didn't find them. I recall that we are not talking about replace an
fs like ext4 for a desktop rootfs, but only to have a place to write not
sensible and temporary information in an embedded system. There are
other example of this kind as the pmem driver written by Google guys (it
was in the staging tree) or the "persistent store" written by Tony Luck.
The idea here is to provide a classic fs interface to that memory area.

Marco
