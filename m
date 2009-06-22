From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Mon, 22 Jun 2009 08:33:07 +0200
Message-ID: <2ea1731b0906212333r20deb71q2f021fc79bcc8a8e@mail.gmail.com>
References: <4A33A7A2.1050608@gmail.com> <20090613155957.GA16220@shareable.org>
	 <4A34A394.5040509@gmail.com> <20090621064040.GC1656@ucw.cz>
	 <4A3E6F28.4090404@gmail.com> <20090621205245.GC3254@elf.ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=UoBjP4nV7M3O3xWVO3vT3oVjjXc82Am7m4C/OzvKMtg=;
        b=v125Nbt3nc59AMfS6Qslgr0KAbRP7dih94IOHkKNTroLeWo3JnP3wKcJSc5XGhs4/V
         X210UV7dzlGG9AW/ZKQklAQU1bgS10b/hID63Zu2Jrcj+ZUCcBVZfHU91qfEo+p3gz/e
         sjcBnW0ta7L+fzleMLAtWYwkarhp+LAF2SJUg=
In-Reply-To: <20090621205245.GC3254@elf.ucw.cz>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pavel Machek <pavel@ucw.cz>
Cc: Jamie Lokier <jamie@shareable.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

2009/6/21 Pavel Machek <pavel@ucw.cz>:
>
>> >> 1. Disk-based filesystems such as ext2/ext3 were designed for opt=
imum
>> >> =A0 =A0performance on spinning disk media, so they implement feat=
ures such
>> >> =A0 =A0as block groups, which attempts to group inode data into a=
 contiguous
>> >> =A0 =A0set of data blocks to minimize disk seeking when accessing=
 files. For
>> >> =A0 =A0RAM there is no such concern; a file's data blocks can be =
scattered
>> >> =A0 =A0throughout the media with no access speed penalty at all. =
So block
>> >> =A0 =A0groups in a filesystem mounted over RAM just adds unnecess=
ary
>> >> =A0 =A0complexity. A better approach is to use a filesystem speci=
fically
>> >> =A0 =A0tailored to RAM media which does away with these disk-base=
d features.
>> >> =A0 =A0This increases the efficient use of space on the media, i.=
e. more
>> >> =A0 =A0space is dedicated to actual file data storage and less to=
 meta-data
>> >> =A0 =A0needed to maintain that file data.
>> >
>> > So... what is the performance difference between ext2 and your new
>> > filesystem?
>> >
>>
>> About the "space" you can read a detailed documentation on the site:
>>
>> http://pramfs.sourceforge.net/pramfs-spec.html
>
> I do not see any numbers there. Do you think you can save significant
> memory when storing for example kernel source trees?

There aren't benchmark, but I pointed it out because if you know ext2
you can do a comparison.

>
>> In addition I can do an example of "compact" information: ext2 uses
>> directory entry objects ("dentries") to associate file names to
>> inodes,
>
> I'm not sure that on-disk directory entry =3D=3D dentry.
>
>> and these dentries are located in data blocks owned by the parent
>> directory. In pramfs, directory inode's do not need to own any data
>> blocks, because all dentry information is contained within the inode=
's
>> themselves.
>
> How do you handle hard-links, then?

Indeed hard-links are not supported :) Due to the design of this fs
there are some limitations explained in the documentation as not
hard-link, only private memory mapping and so on. However this
limitations don't limit the fs itself because you must consider the
special goal of this fs.

>
>> >From performance point of view:
>>
>> Sometimes ago I uploaded here (http://elinux.org/Pram_Fs) some bench=
mark
>> results to compare the performance with and without XIP in a real
>> embedded environment with bonnie++. You could use it as reference po=
int.
>
> Well, so XIP helps. ext2 can do XIP too, IIRC. Is your performance
> better than ext2?
>
> Wait... those numbers you pointed me... claim to be as slow as
> 13MB/sec. That's very very bad. My harddrive is faster than that.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
Pavel
>

As I said I did the test in a real embedded environment so to have
comparable result you should use the same environmente with the same
tools, with the same workload and so on.

Marco
