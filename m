From: Robin Getz <rgetz@blackfin.uclinux.org>
Subject: Re: Kernel crashing and log buffers...
Date: Sun, 14 Jun 2009 14:33:12 -0400
Message-ID: <200906141433.12931.rgetz@blackfin.uclinux.org>
References: <200906102126.40410.rgetz@blackfin.uclinux.org> <20090613102642.GB7976@flint.arm.linux.org.uk> <20090613185926.BAB66832E416@gemini.denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090613185926.BAB66832E416@gemini.denx.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wolfgang Denk <wd@denx.de>
Cc: Russell King <rmk@arm.linux.org.uk>, Mike Frysinger <vapier@gentoo.org>, Greg Ungerer <gerg@snapgear.com>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Sat 13 Jun 2009 14:59, Wolfgang Denk pondered:
> Dear Russell King,
> 
> In message <20090613102642.GB7976@flint.arm.linux.org.uk> you wrote:
> >
> > The other way I've seen people read out crash messages is using a
> > debugger to dump the kernel's log buffer directly.  That seems to work
> > as well as any other method, and has the advantage that it doesn't
> > require any kernel modifications.
> 
> This works well in the lab during hardware bringup or BSP development.
> 
> But we are also interested in a solution that allows to get  more  or
> less  automatic access to the log buffer content after a crash - when
> you have several ten thousand systems in the field,  such  a  feature
> can save you a lot of money.

in this case - is it true that providing the kernel crash log buffer to the 
next running kernel - is actually more important than just giving it to the 
bootloader? (Since the bootloader may not have the facilities to 
email/post/netcat it to a developer - like the next running kernel might?)

In this case - the Bootloader being able to read the buffer, understand that 
there was a crash, and be able to pass the buffer (with the crash message) 
into the next running kernel - where that kernel can package it up and do 
anything it wants to it - would be a requirement?

-Robin
