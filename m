From: Jamie Lokier <jamie@shareable.org>
Subject: Re: Wait for console to become available, v3.2
Date: Wed, 22 Apr 2009 09:22:16 +0100
Message-ID: <20090422082216.GA31246@shareable.org>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net> <20090421064346.GB8020@elte.hu> <20090421063549.3b71881d@infradead.org> <20090421135034.GA30114@elte.hu> <20090421140533.GA6375@shareable.org> <20090421142627.GA18129@elte.hu> <20090421153745.2d8964c7@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090421153745.2d8964c7@lxorguk.ukuu.org.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Ingo Molnar <mingo@elte.hu>, Arjan van de Ven <arjan@infradead.org>, David VomLehn <dvomlehn@cisco.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

Alan Cox wrote:
> To start with there is no reason that the
> USB console can't implement a "maybe we have hardware, maybe I buffer 64K
> until it shows up" behaviour and bind to hardware as and when USB serial
> devices get inserted.

Ah, that doesn't work, when you want to use the USB serial console
_if_ there's a USB serial adapter plugged in, and a different (lower
priority) console if it's not.

-- Jamie
