From: Jamie Lokier <jamie@shareable.org>
Subject: Re: Wait for console to become available, v3.2
Date: Wed, 22 Apr 2009 09:25:47 +0100
Message-ID: <20090422082547.GB31246@shareable.org>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net> <20090421064346.GB8020@elte.hu> <200904210013.48551.david-b@pacbell.net> <1240333871.3632.70.camel@macbook.infradead.org> <alpine.LFD.2.00.0904211016190.2199@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0904211016190.2199@localhost.localdomain>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>, David Brownell <david-b@pacbell.net>, alan@lxorguk.ukuu.org.uk, Ingo Molnar <mingo@elte.hu>, David VomLehn <dvomlehn@cisco.com>, Arjan van de Ven <arjan@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

Linus Torvalds wrote:
> [ Actually, looking closer we should not use that particular name: we 
>   already have something called a "console_driver" which is really the 
>   "current VT" driver.

Speaking of names... The word "console" is used to mean three
different things in the kernel.  Last time I had to understand the
console code (because it wasn't showing on some device) that didn't
help.  But it was a 2.4 kernel 2 years ago so I didn't submit a patch :-)

It would be a sensible though boring cleanup to change all the "VC"
(virtual console) stuff to use the name "VT" (virtual terminal)
consistently.

-- Jamie
