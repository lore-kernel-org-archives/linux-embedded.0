From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: Wait for console to become available, v3.2
Date: Wed, 22 Apr 2009 10:13:03 +0100
Message-ID: <20090422101303.406eef99@lxorguk.ukuu.org.uk>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net>
	<20090421064346.GB8020@elte.hu>
	<20090421063549.3b71881d@infradead.org>
	<20090421135034.GA30114@elte.hu>
	<20090421140533.GA6375@shareable.org>
	<20090421142627.GA18129@elte.hu>
	<20090421153745.2d8964c7@lxorguk.ukuu.org.uk>
	<20090422082216.GA31246@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090422082216.GA31246@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Ingo Molnar <mingo@elte.hu>, Arjan van de Ven <arjan@infradead.org>, David VomLehn <dvomlehn@cisco.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

> Ah, that doesn't work, when you want to use the USB serial console
> _if_ there's a USB serial adapter plugged in, and a different (lower
> priority) console if it's not.

I don't see the problem. If there is a lower priority console available
then the kernel can use that anyway and clearly that would be the right
thing to do.

The case that wouldn't work perhaps is the 'no console present and a USB
or firewire one might appear' - for that to work you'd need the queue to
be smarter - or even the lowest priority console...

Alan
