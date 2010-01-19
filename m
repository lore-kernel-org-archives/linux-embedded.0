From: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: mount ramdisk rootfs /etc directory to jffs2 filesystem.
Date: Tue, 19 Jan 2010 18:13:07 +0800
Message-ID: <cb9ecdfa1001190213u69469505k9c42142bdc17f750@mail.gmail.com>
References: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com>
	 <20100119095024.GD16182@darwin>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=2baYKU9DlXQF7VG5pVVMYH2DlxMTzha2cs3/u68hotU=;
        b=ewyHgTvvnrBi8zQdM/kl9D09ybmXcaP6HK6WOnfGbs/RfxAW1baUB/C5KpanRMIFLa
         kxn3QTLlk7ZDcX5hjPjEXiWETV6JK3eYUWaiQXZR5lvDtn2x5OsBgOgBmJvw4fMgXbk2
         By8Jg+qkpNLvEyi+xdSyPtskdg0WsYzfRpVE0=
In-Reply-To: <20100119095024.GD16182@darwin>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Matthias Kaehlcke <matthias@kaehlcke.net>
Cc: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org, kernelnewbies <kernelnewbies@nl.linux.org>

2010/1/19 Matthias Kaehlcke <matthias@kaehlcke.net>:
> El Tue, Jan 19, 2010 at 05:20:53PM +0800 Johnny Hung ha dit:
>
>> I have build an embedded Linux system and rootfs is a ramdisk. Ramdi=
sk
>> rootfs resides in memory so modify files is non-effective after a
>> reboot. Some directories in rootfs, like /etc, /usr, ... are contain
>> many application configuration files and I want to mount it to jffs2
>> flash filesysyem so it will take effect after a reboot. Is it
>> possible?
>
How to do it? The ramdisk rootfs is ext2 filesystem and I try,
mount /mnt/mtd/etc /etc

Try to modify /etc/ files is not works.

> yes, this is possible
>
>> I know the flash has write times limited so the log files
>> (syslogd/klogd) should not store in flash. In general, how to deploy
>> root file system for embedded linux with flash storage?
>
> - add jffs2 support to your kernel
> - create your image using mkfs.jffs2 from mtd-utils
> - flash the image
> - specify the rootfs partition and type in the bootargs of the kernel
The above procedure is to create a jffs2 rootfs image but I  prefer to
use ramdisk rootfs.
I think the rootfs is build as ramdisk and some configurable file is
store in jffs2 flash.

Thank your reply.
BRs, H. Johnny

>
> for further information i recommend the lecture of
> http://free-electrons.com/doc/flash-filesystems.pdf
>
> depending on your requirements/size of the rootfs partitions UBIFS
> might be an option to consider
>
> --
> Matthias Kaehlcke
> Embedded Linux Developer
> Barcelona
>
> =A0 =A0 =A0El trabajo es el refugio de los que no tienen nada que hac=
er
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(Oscar Wilde)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .''`.
> =A0 =A0using free software / Debian GNU/Linux | http://debian.org =A0=
: :' =A0:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0`. `'`
> gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0`-
>
