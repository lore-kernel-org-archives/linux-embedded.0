From: Jamie Lokier <jamie@shareable.org>
Subject: Re: Wait for console to become available, v3.2
Date: Sun, 26 Apr 2009 20:52:49 +0100
Message-ID: <20090426195249.GC10627@shareable.org>
References: <20090425014152.GD23106@shareable.org> <Pine.LNX.4.44L0.0904242309300.3926-100000@netrider.rowland.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756419AbZDZTxm@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.0904242309300.3926-100000@netrider.rowland.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>
Cc: David VomLehn <dvomlehn@cisco.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Ingo Molnar <mingo@elte.hu>, Arjan van de Ven <arjan@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

Alan Stern wrote:
> On Sat, 25 Apr 2009, Jamie Lokier wrote:
> 
> > I'm thinking this broader use:
> > 
> >     - My boot _script_ is waiting for a disk which identifies as
> >       UUID=392852908752345749857 to appear before it can mount it on
> >       /data.  If there's no such disk, it proceeds without it.  It's a
> >       USB disk, behind a USB hub.
> > 
> >     - My boot script is looking to see if I'm holding down 'z' on the
> >       keyboard, to do something different.  But how does it know if
> >       there's a USB keyboard plugged in (behind two USB hubs) that
> >       hasn't finished being detected?
> > 
> > It just seemed to fit comfortably into what's being discussed.
> 
> Are you suggesting this new interface be exported to userspace somehow?

Not directly.  Only in the same way that open("/dev/console") delays
until there's a console, so reading the keyboard can delay until we
know if we had a keyboard plugged in at boot, and looking for a disk
called UUID=392852908752345749857 can wait until we know if there was
one plugged in at boot time.

The latter issue with UUID is done in userspace now by reading all
disks, but I'm under the impression changes are planned in that
department because reading every disk from userspace to locate
specific ones is too slow on big systems.

-- Jamie
