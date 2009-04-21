From: Ingo Molnar <mingo@elte.hu>
Subject: Re: Wait for console to become available, v3.2
Date: Tue, 21 Apr 2009 08:43:46 +0200
Message-ID: <20090421064346.GB8020@elte.hu>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090420234006.GA1958@cuplxvomd02.corp.sa.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David VomLehn <dvomlehn@cisco.com>, Arjan van de Ven <arjan@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-fou>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>


* David VomLehn <dvomlehn@cisco.com> wrote:

> Parallelization to improve boot times has been successful enough 
> that race conditions now exist between the init_post() open of 
> /dev/console and initialization of the console device. When this 
> occurs, opening /dev/console fails and any applications inherited 
> from init have no standard in/out/error devices. This is expected 
> behavior if no console device is available, but quite unfortunate 
> in the case where the console is just a bit slow waking up.
> 
> Some buses, such as USB, offer no guarantees about how long it 
> takes to discover devices, so there is no reliable way to 
> distinguish between a missing console and a slow one.  The 
> pragmatic approach taken in this patch is to wait for a while to 
> see if a console shows up, and just go on if it doesn't. The 
> default delay is 1000 msec (1 second). This value is conjured out 
> of thing air; any suggestions for a value that more closely 
> approximates the effective delays from the olden days before USB 
> consoles starting failing are more than welcome.

hm, this really seems like a bad hack and a workaround to me and as 
such it is not really an acceptable solution.

The proper approach would be to use one of the async_synchronize*() 
facilities in kernel/async.c to properly order the opening of the 
console with device init.

Certain subsystems like storage (SCSI, libata, mount code and 
modules) has already been extended to this scheme.

So i think the right approach, if you want to speed up bootup, would 
be to extend the same concepts to console discovery, init and open 
methods.

	Ingo
