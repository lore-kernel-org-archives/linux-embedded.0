From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: Kernel crashing and log buffers...
Date: Sat, 13 Jun 2009 11:26:42 +0100
Message-ID: <20090613102642.GB7976@flint.arm.linux.org.uk>
References: <200906102126.40410.rgetz@blackfin.uclinux.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=caramon; h=Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:In-Reply-To:
	Sender; bh=UVv+Boy4zXx4Cm7SFxSKz+FkQ0efN72ezlEXYz2Ft5k=; b=WhihC
	Tr+oz70GXOCTYbpMm8dNPxWa7FlP2BF7juIL2IDDjPhvsbqmJ7cgGftkaU5/F3g5
	PQ6lCe2mvFmys8jKD2SqfDpj8VcWragfRpFIcEwuUa9E5OJeMxRYt3Kl2JvrJkNI
	cO1NG6YL/kWJXRzN7QC/uTMudapZPeShQqmAe0=
Content-Disposition: inline
In-Reply-To: <200906102126.40410.rgetz@blackfin.uclinux.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robin Getz <rgetz@blackfin.uclinux.org>
Cc: Mike Frysinger <vapier@gentoo.org>, Greg Ungerer <gerg@snapgear.com>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Wolfgang Denk <wd@denx.de>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Wed, Jun 10, 2009 at 09:26:40PM -0400, Robin Getz wrote:
> I would be interested in Paul and Russell - how have you solved this issue? 
> (Or do your kernel's never crash? :)

We haven't any dedicated solution to reading out the crash messages.

What we do have is a very basic platform specific serial IO implementation
which we call "low level debug" - it just provides a number of functions
(eg, printascii).  These functions are callable from assembly or C, and
can work whether the MMU is enabled or not.

People can enable the low level debug build option and patch into
kernel/printk.c to hook it up (or place printascii etc where-ever they
choose.)  It has the advantage that it is entirely synchronous from
every context.

Yes, it requires a little bit of effort on the part of the developer to
hook it up - so far no one has complained about the process of hooking
this facility up in their kernel.

You can use this to debug SMP bringup, but you risk having each CPU
stomping on each other's messages - so it's in no way perfect.

The other way I've seen people read out crash messages is using a
debugger to dump the kernel's log buffer directly.  That seems to work
as well as any other method, and has the advantage that it doesn't
require any kernel modifications.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
