From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: Wait for console to become available, v3.2
Date: Mon, 27 Apr 2009 01:23:24 +0200
Message-ID: <ac3eb2510904261623g6270b9a4x20252e06fc8d8bf6@mail.gmail.com>
References: <20090426195249.GC10627@shareable.org> <Pine.LNX.4.44L0.0904261715250.26439-100000@netrider.rowland.org> 
	<20090426213746.GH10627@shareable.org> <ac3eb2510904261536t7a37f970tfafba71d1e67cfb6@mail.gmail.com> 
	<20090426231208.GA17240@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756547AbZDZXXs@vger.kernel.org>
In-Reply-To: <20090426231208.GA17240@shareable.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jamie Lokier <jamie@shareable.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, David VomLehn <dvomlehn@cisco.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Ingo Molnar <mingo@elte.hu>, Arjan van de Ven <arjan@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Mon, Apr 27, 2009 at 01:12, Jamie Lokier <jamie@shareable.org> wrote=
:
> Kay Sievers wrote:
>> > _If_ the system doesn't wait for all block devices present at boot=
 to
>> > be enumerated before the boot script, then when the script looks i=
n
>> > that directory for a specific UUID, it would be good to wait until
>> > "has everything present at boot been enumerated?" says yes.
>>
>> That's what distros do with initramfs today.
>
> I don't see how that's possible. =C2=A0Haven't we been discussing how=
 the
> USB driver does not have any support (yet) for saying when it's found
> every device present at boot time, and that it can probably be added?

It's easy for the rootfs, or any other mandatory filesystem, unlike it
is for the console stuff.

There is no timeout, distro's initramfs waits for the specified root
device until it appears. It's simple, there is nothing else to do for
it. It does not care what bus it is, or who is probing what for how
long. It loads all drivers it finds hardware for, and then spins until
the device shows up and continues.

Kay
