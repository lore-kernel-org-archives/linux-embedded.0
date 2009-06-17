From: "Chris Friesen" <cfriesen@nortel.com>
Subject: Re: [PATCH 00/14] Pramfs: Persistent and protected ram filesystem
Date: Wed, 17 Jun 2009 12:32:00 -0600
Message-ID: <4A3936A0.9050709@nortel.com>
References: <4A33A7A2.1050608@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A33A7A2.1050608@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco <marco.stornelli@gmail.com>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Daniel Walker <dwalker@soe.ucsc.edu>

Marco wrote:
> This is a second attempt at mainlining Pramfs. The first attempt was
> back in early 2004 by MontaVista. Since then the kernel code has almost
> been completely rewritten. So my first item on the list was porting the
> code on a recent kernel version. After that I added the XIP support.
> 
> Now some FAQs:
> 
> What is the goal of this filesystem?
> 
> Many embedded systems have a block of non-volatile RAM separate from
> normal system memory, i.e. of which the kernel maintains no memory page
> descriptors. For such systems it would be beneficial to mount a
> fast read/write filesystem over this "I/O memory", for storing
> frequently accessed data that must survive system reboots and power
> cycles. An example usage might be system logs under /var/log, or a user
> address book in a cell phone or PDA.

Nice to see something like this submitted to mainline.  We use something
similar to provide persistent storage for crash recovery debug data for
boards which don't have local storage.

In many cases kdump can provide good information, but it's not
sufficient for "flight recorder" type data if the kernel gets rebooted
by a hardware mechanism (watchdog, for instance) that doesn't give a
pre-interrupt.

I'm a bit concerned about your PTE modifications on every write
though...we do things like log every exception and scheduler operation
to persistent memory, and I think the overhead of changing the
protection on every write would be a killer.  Instead, we make extensive
use of checksums at various different levels so that the recovery app
can determine which data is valid.

Also, I'd like to ensure that direct memory access to the memory area
would be available.  There are some things (like the sched/exception
logging mentioned above) where we want to make accesses as fast as possible.

Chris
