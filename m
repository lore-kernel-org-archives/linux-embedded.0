From: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: mount ramdisk rootfs /etc directory to jffs2 filesystem.
Date: Mon, 25 Jan 2010 16:43:23 +0800
Message-ID: <cb9ecdfa1001250043q36ecfcack9ea1bb855b538dbf@mail.gmail.com>
References: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com>
	 <cb9ecdfa1001190403v433d839dy6ba2bc018024ce15@mail.gmail.com>
	 <Pine.LNX.4.64.1001191414090.32263@lnxricardw.se.axis.com>
	 <20100119140600.GH16182@darwin>
	 <cb9ecdfa1001191832k28961740qa825a8c8d5e631f2@mail.gmail.com>
	 <2ea1731b1001192357r72d627e2gb36d71f23fd69b2e@mail.gmail.com>
	 <cb9ecdfa1001211907u37415485tf3e1d2c443a506f7@mail.gmail.com>
	 <2ea1731b1001220014v59ea7767m6e1a8547d41c6afb@mail.gmail.com>
	 <cb9ecdfa1001242009x30eabcd3gbd0bb1d8a931199e@mail.gmail.com>
	 <4B5D560E.2020901@2net.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=yUvsYjDMxqEoJ2VyV9/80MG5uFbSAlHfWHZfAGZtWps=;
        b=RNS8EdV04Go0bx1t1y4Ejw2lbKh/zcm/LrT61H1xFSB0PY1oCKW3yCHu0yPPblZb+E
         kyz1DF0mBIWLhr24J6QBMnuvdzOL4M7EjL+drzeA84TihWtMefQf9uu4qeqYeR5CeMHX
         GBdrJIyZUIHVORT8dOngDELSWknQZhRqHse34=
In-Reply-To: <4B5D560E.2020901@2net.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: chris@2net.co.uk
Cc: Marco Stornelli <marco.stornelli@gmail.com>, Matthias Kaehlcke <matthias@kaehlcke.net>, Ricard Wanderlof <ricard.wanderlof@axis.com>, kernelnewbies <kernelnewbies@nl.linux.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

2010/1/25 Chris Simmonds <chris@2net.co.uk>:
> Johnny Hung wrote:
>>
>> 2010/1/22 Marco Stornelli <marco.stornelli@gmail.com>:
>>>
>>> 2010/1/22 Johnny Hung <johnny.hacking@gmail.com>:
>>>>
>>>> 2010/1/20 Marco Stornelli <marco.stornelli@gmail.com>:
>>>>>
>>>>> 2010/1/20 Johnny Hung <johnny.hacking@gmail.com>:
>>>>>>
>>>>>> 2010/1/19 Matthias Kaehlcke <matthias@kaehlcke.net>:
>>>>>>>
>>>>>>> El Tue, Jan 19, 2010 at 02:17:22PM +0100 Ricard Wanderlof ha di=
t:
>>>>>>>
>>>>>> I consider to use ramdisk as rootfs because worry about wrong
>>>>>> operation in rootfs (is use jffs2 rootfs) and it will cause syst=
em
>>>>>> boot up failed.
>>>>>> Another query, does the syslogd/klogd log files also store in jf=
fs2
>>>>>> rootfs? Write to jffs2 frequently will reduce flash life cycle.
>>>>>>
>>>>>> BRs, H. Johnny
>>>>>>>
>>>>>>> --
>>>>
>>>> It seems there are a lot of file-systems I have to study :P. The s=
ame
>>>> question is
>>>> how to split my rootfs? Re-mount /etc, /var to another file-sysyem=
 mtd
>>>> part when
>>>> system boot up?
>>>>
>> Yes, I know. So if I want set etc directoyr to /dev/mtd5 not in root=
fs
>> /, I need to add "/dev/mtdblock5 =A0/etc =A0 =A0 =A0 =A0jffs2 =A0 de=
faults
>> 0 =A0 =A0 =A0 0" in /etc/fstab file but rootfs doesn't contain /etc
>> directory because /etc directoyr is store in /dev/mtdblock5.
>> Do you know what I mean? The kernel execute /sbin/init after mount
>> rootfs and /sbin/init is link to busybox, busybox will read
>> /etc/inittab file to initial. The problem is coming, how busybox to
>> read /etc in rootfs before mount /dev/mtdblock5 to /etc? There is no
>> program to mount /dev/mtdblock5 to /etc before busybox init execute.
>>
>> I think I must mistake some concept, please give me a hint.
>> Thank you
>> BRs, H. Johnny
>>
>

I got it. The rootfs contains at least /etc directory, /etc/inittab,
/etc/fstab. Bysybox will read /etc/fstab to mount etc to rootfs's etc
from other partition. Okay, it's reasonable. Another query, how to do
it in many Linux dist as Macro mentioned, use initramfs ? I am sure I
can arrange / to /dev/hda1 and /etc to /dev/hda2.

Thank you so much
BRs, H. Johnny

> You have two /etc directories: one in the the read-only root file sys=
tem and
> one in the jffs2 fs. In the root fs you have /etc/fstab, /etc/inittab=
 and
> any scripts it may call. The init program will mount /dev/mtdblock5 o=
ver the
> top of the /etc that is in the rootfs, so giving you the read/write v=
ersion
> of /etc. Any files open in the old /etc - e.g. /etc/inittab - will co=
ntinue
> to be open, but any new files opened in /etc will use the read/write =
version
> in jffs2. You can also do some interesting things with symbolic links=
=2E..
> This technique works. I have used it in several projects.
>
> --
> Chris Simmonds =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 2net Limited
> chris@2net.co.uk =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 http://www.2net.co.u=
k/
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embed=
ded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
