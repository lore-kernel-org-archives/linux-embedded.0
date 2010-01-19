From: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: mount ramdisk rootfs /etc directory to jffs2 filesystem.
Date: Tue, 19 Jan 2010 20:03:19 +0800
Message-ID: <cb9ecdfa1001190403v433d839dy6ba2bc018024ce15@mail.gmail.com>
References: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com>
	 <20100119095024.GD16182@darwin>
	 <cb9ecdfa1001190213u69469505k9c42142bdc17f750@mail.gmail.com>
	 <20100119102026.GF16182@darwin>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=K/DuPKRx/AV8uwYTaIat2YI6mT8HSMVU/+olxzY1v8Q=;
        b=uMKdlNpO+kB+OkpA9EjdgP2ZdRuVV64m12w5o8ZIvR0jmW0UAofv9CdOJvyhBOSmIN
         Lnu4jBV42MWCAvN0qxxKHEk8PbqSDTbTj7rmI2vahOMc+j3m392cw+lixwXWem+/IFvn
         UADhXGPNgHCnjCDjODrdsFTT3J5YSI9wReDvQ=
In-Reply-To: <20100119102026.GF16182@darwin>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Matthias Kaehlcke <matthias@kaehlcke.net>
Cc: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org, kernelnewbies <kernelnewbies@nl.linux.org>

2010/1/19 Matthias Kaehlcke <matthias@kaehlcke.net>:
> El Tue, Jan 19, 2010 at 06:13:07PM +0800 Johnny Hung ha dit:
>
>> 2010/1/19 Matthias Kaehlcke <matthias@kaehlcke.net>:
>> > El Tue, Jan 19, 2010 at 05:20:53PM +0800 Johnny Hung ha dit:
>> >
>> >> I have build an embedded Linux system and rootfs is a ramdisk. Ra=
mdisk
>> >> rootfs resides in memory so modify files is non-effective after a
>> >> reboot. Some directories in rootfs, like /etc, /usr, ... are cont=
ain
>> >> many application configuration files and I want to mount it to jf=
fs2
>> >> flash filesysyem so it will take effect after a reboot. Is it
>> >> possible?
>> >
>> How to do it? The ramdisk rootfs is ext2 filesystem and I try,
>> mount /mnt/mtd/etc /etc
>>
>> Try to modify /etc/ files is not works.
>
> ok, i understood you want to substitute the ramdisk rootfs by jffs2
> based one
>
> mounting the ramdisk as writable with the flash as backing storage
> isn't possible AFAIK. and even if it was possible it wouldn't be
> recommended as ext2 doesn't care about flash wear out, in consequence
> you would write the same blocks over and over again.
>
>> > yes, this is possible
>> >
>> >> I know the flash has write times limited so the log files
>> >> (syslogd/klogd) should not store in flash. In general, how to dep=
loy
>> >> root file system for embedded linux with flash storage?
>> >
>> > - add jffs2 support to your kernel
>> > - create your image using mkfs.jffs2 from mtd-utils
>> > - flash the image
>> > - specify the rootfs partition and type in the bootargs of the ker=
nel
>> The above procedure is to create a jffs2 rootfs image but I =A0prefe=
r to
>> use ramdisk rootfs.
>> I think the rootfs is build as ramdisk and some configurable file is
>> store in jffs2 flash.
>

Okay, I think the steps is below if my rootfs is ramdisk and configure
files in jffs2,

1. cp /etc/* /mnt/mtd/etc/    (/mnt/mtd is my jffs2 fs)
2. rm -rf /etc/*
3. make symbolic links from all /etc/xx to /mnt/mtd/etc/xxx
4. remake ramdisk rootfs

It seems all files in ramdisk rootfs /etc all links to /mnt/mtd/etc/
and try to modify these files is effective after reboot.
But is this a common way in embedded linux ?

I also have another idea, keep ramdisk rootfs /etc files and add a shel=
l script.

1. The shell script execute when system boot up.
2. Check /mnt/mtd/etc/xxx if is exist. If yes, remove /etc/xxx file
and make a symbolic link to /mnt/mtd/etc/xxx. If no, keep /etc/xxx
file.
3. repeat 2 for all /etc files

Any suggestion?

Thank your help.
BRs, H. Johnny

> in this case follow the above steps, except the last one about the
> bootargs and mount the jffs2 partition from your init script. you
> could use symlinks from your ramdisk to the files on jffs2 to
> integrate them in your rootfs
>
> --
> Matthias Kaehlcke
> Embedded Linux Developer
> Barcelona
>
> =A0 =A0 =A0Anyone who has never made a mistake has never tried anythi=
ng new
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(Albert Einste=
in)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .''`.
> =A0 =A0using free software / Debian GNU/Linux | http://debian.org =A0=
: :' =A0:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0`. `'`
> gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0`-
>
