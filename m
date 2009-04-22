From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: Wait for console to become available, v3.2
Date: Wed, 22 Apr 2009 22:08:53 +0100
Message-ID: <20090422220853.0af12ece@lxorguk.ukuu.org.uk>
References: <20090421230849.GA29555@cuplxvomd02.corp.sa.net>
	<Pine.LNX.4.44L0.0904221111320.3405-100000@iolanthe.rowland.org>
	<20090422205427.GA28435@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090422205427.GA28435@cuplxvomd02.corp.sa.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Jamie Lokier <jamie@shareable.org>, Ingo Molnar <mingo@elte.hu>, Arjan van de Ven <arjan@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

> Alright, I know you (Alan (Stern)) know about USB. I think someone else
> mentioned Firewire. What other hotpluggable buses do we need to worry about
> and how can we get them interested?

In theory any console can be hot pluggable - PCI-X hotplug video cards,
hotplug serial ports. In fact right now bad things occur if you
hot-unplug consoles.

> 2.	All devices have been probed
> If we exit for reason 2, it means that no such device is present,
> and we go on to the do the appropriate thing for that device class.

USB has no notion of #2 really

> Yes, I think we absolutely exclude devices plugged in after boot. I think such
> usage, if it needs to be supported, can be handled with hot plugging. I'm a
> little squishy on whether we might to be able to hot plug USB consoles as I
> have a request to support this, but I think it's a separate issue from
> supporting hot pluggable boot devices and I'm not worrying about it now.

This still assumes you can tell the difference, but USB in particular is
rather like undergraduate students - they turn up when they feel like it
at some point after they get kicked into life.

I don't think that is a big problem because our bus model is basically
that all devices are discovered asynchronously (increasingly so with
Arjan's speed up patches). A console model therefore has to deal with
console addition and removal being dynamic.
