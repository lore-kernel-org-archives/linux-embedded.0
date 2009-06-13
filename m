From: Jamie Lokier <jamie@shareable.org>
Subject: Re: Kernel crashing and log buffers...
Date: Sat, 13 Jun 2009 17:49:01 +0100
Message-ID: <20090613164901.GF16220@shareable.org>
References: <200906102126.40410.rgetz@blackfin.uclinux.org> <8bd0f97a0906111627h128cc561y2bf4a0b2b30d7187@mail.gmail.com> <20090612010707.GB23715@cuplxvomd02.corp.sa.net> <200906120054.46965.rgetz@blackfin.uclinux.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200906120054.46965.rgetz@blackfin.uclinux.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robin Getz <rgetz@blackfin.uclinux.org>
Cc: David VomLehn <dvomlehn@cisco.com>, Mike Frysinger <vapier.adi@gmail.com>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Wolfgang Denk <wd@denx.de>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>

Robin Getz wrote:
>  - late crash analysis - Sometimes - even after the kernel is up
>    and running properly - a device driver does a bad thing. 
>    Normally - complete kernel dumps can come out a serial
>    console, and you can you your favourite serial application
>    to scroll back and determine what is going on.
> 
>    In many embedded devices - this is not a possibility, since
>    all the serial ports are in use (Irda, Bluetooth, GPS, etc).

There's another thing with serial ports:

In embedded devices, I've seen serial drivers hooked up to the console
output either synchronously or asynchronously.

Synchronously, every printk() waits to be sent to the serial port, and
this slows the kernel down in normal operation, and especially boot
time.

Asynchronously, every printk() does into the log buffer without delay,
and is sent over the serial port as fast as that can.  It doesn't slow
the kernel down much.

When it's done asynchronously, if the kernel crashes you don't always
get the last output prior to the crash, even with a serial terminal
listening in your lab.  But if you do it synchronously, it slows
things down.

-- Jamie
