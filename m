From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Wait for console to become available, v3.2
Date: Fri, 24 Apr 2009 23:11:03 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0904242309300.3926-100000@netrider.rowland.org>
References: <20090425014152.GD23106@shareable.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090425014152.GD23106@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: David VomLehn <dvomlehn@cisco.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Ingo Molnar <mingo@elte.hu>, Arjan van de Ven <arjan@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Sat, 25 Apr 2009, Jamie Lokier wrote:

> I'm thinking this broader use:
> 
>     - My boot _script_ is waiting for a disk which identifies as
>       UUID=392852908752345749857 to appear before it can mount it on
>       /data.  If there's no such disk, it proceeds without it.  It's a
>       USB disk, behind a USB hub.
> 
>     - My boot script is looking to see if I'm holding down 'z' on the
>       keyboard, to do something different.  But how does it know if
>       there's a USB keyboard plugged in (behind two USB hubs) that
>       hasn't finished being detected?
> 
> It just seemed to fit comfortably into what's being discussed.

Are you suggesting this new interface be exported to userspace somehow?

Alan Stern
