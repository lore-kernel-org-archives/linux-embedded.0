From: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: mount ramdisk rootfs /etc directory to jffs2 filesystem.
Date: Wed, 20 Jan 2010 10:32:15 +0800
Message-ID: <cb9ecdfa1001191832k28961740qa825a8c8d5e631f2@mail.gmail.com>
References: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com>
	 <20100119095024.GD16182@darwin>
	 <cb9ecdfa1001190213u69469505k9c42142bdc17f750@mail.gmail.com>
	 <20100119102026.GF16182@darwin>
	 <cb9ecdfa1001190403v433d839dy6ba2bc018024ce15@mail.gmail.com>
	 <Pine.LNX.4.64.1001191414090.32263@lnxricardw.se.axis.com>
	 <20100119140600.GH16182@darwin>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=tNknsR7GVoJb/lAMNq0BAVnCOWG04wNbCxNJENqd9SY=;
        b=t/icn+YwJh29VSBeulMnDKmqxPRn3EFXRRzeCx+FsIdjK1UQWMj25uyBbHql5Htr0i
         mvZR7vljyKUAZcIvvLDQMLUCAl1DMfMSvyDcemmtho7dxsSYtBWVL0s5LP4bW4qsPW3d
         Xph0PRWQy0vzJfiMIEhP961NHvo0XSyBu29DI=
In-Reply-To: <20100119140600.GH16182@darwin>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Matthias Kaehlcke <matthias@kaehlcke.net>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>, kernelnewbies <kernelnewbies@nl.linux.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

2010/1/19 Matthias Kaehlcke <matthias@kaehlcke.net>:
> El Tue, Jan 19, 2010 at 02:17:22PM +0100 Ricard Wanderlof ha dit:
>
>> On Tue, 19 Jan 2010, Johnny Hung wrote:
>>
>>> Okay, I think the steps is below if my rootfs is ramdisk and config=
ure
>>> files in jffs2,
>>>
>>> 1. cp /etc/* /mnt/mtd/etc/ =A0 =A0(/mnt/mtd is my jffs2 fs)
>>> 2. rm -rf /etc/*
>>> 3. make symbolic links from all /etc/xx to /mnt/mtd/etc/xxx
>>> 4. remake ramdisk rootfs
>>>
>>> It seems all files in ramdisk rootfs /etc all links to /mnt/mtd/etc=
/
>>> and try to modify these files is effective after reboot.
>>> But is this a common way in embedded linux ?
>>

Thanks, I understand.

>> In principle, but it is easier (and cleaner) to make a symbolic link=
 from
>> (say) /etc -> /mnt/mtd/etc without linking every individual file and
>> directory.
>
> i totally agree with ricard when you want to move the entire director=
y
> to jffs2 and not only some selected files
>
>> You could also use a jffs2 file system in flash for your rootfs, tha=
t way
>> you wouldn't need a ramdisk at all.
>
> i'd also recommend you to consider if you really need the
> ramdisk. when using a ram disk its entire content is loaded to the RA=
M
> occupying space, even if you don't use certain files (or part of
> them). other filesystems are more efficient in this aspect.
> if the main purpose is to have a read only rootfs, i'd suggest a look
> at squashfs.

I consider to use ramdisk as rootfs because worry about wrong
operation in rootfs (is use jffs2 rootfs) and it will cause system
boot up failed.
Another query, does the syslogd/klogd log files also store in jffs2
rootfs? Write to jffs2 frequently will reduce flash life cycle.

BRs, H. Johnny
>
> --
> Matthias Kaehlcke
> Embedded Linux Developer
> Barcelona
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0La posibilidad de realizar un suenyo es lo
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 que hace que la vida sea interesante
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .''`.
> =A0 =A0using free software / Debian GNU/Linux | http://debian.org =A0=
: :' =A0:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0`. `'`
> gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0`-
>
