From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: Wait for console to become available, v3.2
Date: Tue, 21 Apr 2009 06:35:49 -0700
Message-ID: <20090421063549.3b71881d@infradead.org>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net>
	<20090421064346.GB8020@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090421064346.GB8020@elte.hu>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingo Molnar <mingo@elte.hu>
Cc: David VomLehn <dvomlehn@cisco.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Tue, 21 Apr 2009 08:43:46 +0200
Ingo Molnar <mingo@elte.hu> wrote:

> The proper approach would be to use one of the async_synchronize*() 
> facilities in kernel/async.c to properly order the opening of the 
> console with device init.

Unfortunately this is not the answer.

First of all, USB does not use the async_* infrastructure, so it does
not do anything.
But more importantly... USB *CANNOT* do this fundamental operation.
USB does not have the capability to know when you have seen all devices
that are connected. Devices just show up a random amount of time after
you turn the power on for the bus.... there's no "and now we've seen
all" operation.

-- 
Arjan van de Ven 	Intel Open Source Technology Centre
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
