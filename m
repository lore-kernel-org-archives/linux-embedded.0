From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: Wait for console to become available, v3.2
Date: Mon, 27 Apr 2009 00:36:48 +0200
Message-ID: <ac3eb2510904261536t7a37f970tfafba71d1e67cfb6@mail.gmail.com>
References: <20090426195249.GC10627@shareable.org> <Pine.LNX.4.44L0.0904261715250.26439-100000@netrider.rowland.org> 
	<20090426213746.GH10627@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754342AbZDZWhe@vger.kernel.org>
In-Reply-To: <20090426213746.GH10627@shareable.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jamie Lokier <jamie@shareable.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, David VomLehn <dvomlehn@cisco.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Ingo Molnar <mingo@elte.hu>, Arjan van de Ven <arjan@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Sun, Apr 26, 2009 at 23:37, Jamie Lokier <jamie@shareable.org> wrote=
:
> Alan Stern wrote:
>> As for searching for a particular UUID, I believe recent changes to
>> sysfs/udev should improve the situation. =C2=A0There will be a "by_U=
UID"
>> directory somewhere, containing a bunch of symbolic links whose name=
s
>> are the UUID values of all the registered drives. =C2=A0Programs won=
't have
>> to read every disk; they'll only have to search through this directo=
ry.
>
> That will be great.

It is like that for years now, and it is completely in userspace at
/dev/disk/by-uuid/. I don't know of any plans to add filesystem/raid
signature uuid probing support to the kernel. And I think that will be
almost impossible to get right in the kernel.

Yes, you need to look at all the disks from userspace, if you request
to mount them by filesystem metadata like label/UUID. It works fine
even on boxes with thousands of disks.

> _If_ the system doesn't wait for all block devices present at boot to
> be enumerated before the boot script, then when the script looks in
> that directory for a specific UUID, it would be good to wait until
> "has everything present at boot been enumerated?" says yes.

That's what distros do with initramfs today.

> Otherwise you have hacks like my boot script which waits 5 seconds fo=
r
> a disk to show up on USB, and then continues if not. =C2=A0It sounds
> awfully like waiting X seconds for a USB console to show up :-)
>
> Since this is all about making boot faster, it would be quite nice no=
t
> to wait for all block devices before starting the boot script, or at
> least the initramfs module-loading script :-)

You wait in initramfs until the device show up. Usually dynamic udev
rules created from the root=3D string of the kernel commandline create =
a
rule which matches on the UUID, and creates a /dev/root symlink when
the device shows up. As soon as this link shows up,  init mounts it
and goes ahead.

Thanks,
Kay
