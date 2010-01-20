From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: mount ramdisk rootfs /etc directory to jffs2 filesystem.
Date: Wed, 20 Jan 2010 12:54:16 +0100
Message-ID: <2ea1731b1001200354t5ed29458h6fc98c49c1a555d5@mail.gmail.com>
References: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com>
	 <20100119095024.GD16182@darwin>
	 <cb9ecdfa1001190213u69469505k9c42142bdc17f750@mail.gmail.com>
	 <20100119102026.GF16182@darwin>
	 <cb9ecdfa1001190403v433d839dy6ba2bc018024ce15@mail.gmail.com>
	 <Pine.LNX.4.64.1001191414090.32263@lnxricardw.se.axis.com>
	 <20100119140600.GH16182@darwin>
	 <cb9ecdfa1001191832k28961740qa825a8c8d5e631f2@mail.gmail.com>
	 <2ea1731b1001192357r72d627e2gb36d71f23fd69b2e@mail.gmail.com>
	 <20100120102145.GV16182@darwin>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=LaMWRnCZ5/Rfp6HxbJGDLZq/qnhW7IVBMNRo1WtwVeM=;
        b=vRavAkOAoDzzrHudgXMlW5sWNt0cCrqKf+t3SVZL1+3JWJa9aKwrFv2ZRbgHDQn5tz
         yn/Dh+LOpNRXQ3OUI5emjhWtG+F7XLoGRcHJDdjQrk5C1RD9d5V0T0exjTIogADDbGhi
         ulcT46/3TB4OhrO8hnaTd8YDdq5KPjjLT2MDE=
In-Reply-To: <20100120102145.GV16182@darwin>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Kaehlcke <matthias@kaehlcke.net>
Cc: Johnny Hung <johnny.hacking@gmail.com>, Ricard Wanderlof <ricard.wanderlof@axis.com>, kernelnewbies <kernelnewbies@nl.linux.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

2010/1/20 Matthias Kaehlcke <matthias@kaehlcke.net>:
> El Wed, Jan 20, 2010 at 08:57:44AM +0100 Marco Stornelli ha dit:
>
>> 2010/1/20 Johnny Hung <johnny.hacking@gmail.com>:
>> > 2010/1/19 Matthias Kaehlcke <matthias@kaehlcke.net>:
>> >> El Tue, Jan 19, 2010 at 02:17:22PM +0100 Ricard Wanderlof ha dit:
>> >>
>> > I consider to use ramdisk as rootfs because worry about wrong
>> > operation in rootfs (is use jffs2 rootfs) and it will cause system
>> > boot up failed.
>> > Another query, does the syslogd/klogd log files also store in jffs2
>> > rootfs? Write to jffs2 frequently will reduce flash life cycle.
>> >
>> > BRs, H. Johnny
>> >>
>> >> --
>>
>> In general a good splitting for rootfs could be: squashfs for rootfs,
>> tmpfs for volatile data (/tmp), ubifs (with a flash partition) for
>> "strong" permanent data (/etc, ....) and pramfs for "light" permanent
>> data (/var/log, .....).
>
> if ubifs is a good choice depends on the size of the partition, iirc
> it has a significant overhead for very small partitions.
>
> once using ubi it could be interesting to set up the read-only rootfs
> partition upon ubi in order to spread the wear out over a maximum of blocks.
>

I don't know the size constraints of Johnny, so it can be useful to use jffs2.

Marco
