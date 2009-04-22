From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Wait for console to become available, v3.2
Date: Wed, 22 Apr 2009 17:24:18 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0904221723010.23158-100000@iolanthe.rowland.org>
References: <20090422220853.0af12ece@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090422220853.0af12ece@lxorguk.ukuu.org.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: David VomLehn <dvomlehn@cisco.com>, Jamie Lokier <jamie@shareable.org>, Ingo Molnar <mingo@elte.hu>, Arjan van de Ven <arjan@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Wed, 22 Apr 2009, Alan Cox wrote:

> > 2.	All devices have been probed
> > If we exit for reason 2, it means that no such device is present,
> > and we go on to the do the appropriate thing for that device class.
> 
> USB has no notion of #2 really

That's true, it doesn't.  But it _does_ rather have a notion of "all 
devices that were present at boot time have been probed".  That should 
be good enough.

Alan Stern
