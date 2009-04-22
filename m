From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: Wait for console to become available, v3.2
Date: Wed, 22 Apr 2009 10:11:09 +0100
Message-ID: <20090422101109.7beee3ee@lxorguk.ukuu.org.uk>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net>
	<20090421064346.GB8020@elte.hu>
	<200904210013.48551.david-b@pacbell.net>
	<1240333871.3632.70.camel@macbook.infradead.org>
	<alpine.LFD.2.00.0904211016190.2199@localhost.localdomain>
	<20090422082547.GB31246@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090422082547.GB31246@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>, David Brownell <david-b@pacbell.net>, Ingo Molnar <mingo@elte.hu>, David VomLehn <dvomlehn@cisco.com>, Arjan van de Ven <arjan@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

> It would be a sensible though boring cleanup to change all the "VC"
> (virtual console) stuff to use the name "VT" (virtual terminal)
> consistently.

Then we would have two completely different meanings for virtual terminal
in the kernel.

Alan
