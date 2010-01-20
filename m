From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: mount ramdisk rootfs /etc directory to jffs2 filesystem.
Date: Wed, 20 Jan 2010 08:15:01 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1001200809550.32263@lnxricardw.se.axis.com>
References: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com> 
	<20100119095024.GD16182@darwin>
	<cb9ecdfa1001190213u69469505k9c42142bdc17f750@mail.gmail.com>
	<20100119102026.GF16182@darwin>
	<cb9ecdfa1001190403v433d839dy6ba2bc018024ce15@mail.gmail.com>
	<Pine.LNX.4.64.1001191414090.32263@lnxricardw.se.axis.com> 
	<20100119140600.GH16182@darwin>
	<cb9ecdfa1001191832k28961740qa825a8c8d5e631f2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <cb9ecdfa1001191832k28961740qa825a8c8d5e631f2@mail.gmail.com>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: =?iso-8859-1?Q?Ricard_Wanderl=F6f?= <Ricard.Wanderlof@axis.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, kernelnewbies <kernelnewbies@nl.linux.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Matthias Kaehlcke <matthias@kaehlcke.net>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>


On Wed, 20 Jan 2010, Johnny Hung wrote:

>> i'd also recommend you to consider if you really need the
>> ramdisk. when using a ram disk its entire content is loaded to the RAM
>> occupying space, even if you don't use certain files (or part of
>> them). other filesystems are more efficient in this aspect.
>> if the main purpose is to have a read only rootfs, i'd suggest a look
>> at squashfs.
>
> I consider to use ramdisk as rootfs because worry about wrong
> operation in rootfs (is use jffs2 rootfs) and it will cause system
> boot up failed.

You have a point, however, you could do two things to help:

a) Mount the root file system as read-only. That way you can never write =

to it, unless you remount it read-write. But you can still reflash that =

partition if you need to upgrade.

b) Register the mtd partition holding the root file system as read-only.
This is even more seecure as remounting the file system won't permit =

writes. However, it also means you can't write to it for upgrading. (I
don't think the mtd core permits changing an already registered mtd =

partition from readonly to writable, but I could be wrong.)

> Another query, does the syslogd/klogd log files also store in jffs2
> rootfs? Write to jffs2 frequently will reduce flash life cycle.

I think it is fairly common to have a combination of devices:

/ (root)        is a readonly flash device (mtd partition)
/etc            is a writable flash device (mtd partition)
/tmp and /var   are ramdisks (tmpfs), so they are writable, but lost when
                 power is cycled.

/Ricard
-- =

Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
