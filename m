From: Robin Getz <rgetz@blackfin.uclinux.org>
Subject: Re: AT91SAM9G20 design and boot times
Date: Thu, 11 Jun 2009 09:58:08 -0400
Message-ID: <200906110958.08369.rgetz@blackfin.uclinux.org>
References: <ed62800906102037q71f2a6bdq835793a1ac36c41b@mail.gmail.com> <ed62800906102043m723911d8t1968174201ba7fbb@mail.gmail.com> <4A30FD17.7060508@atmel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A30FD17.7060508@atmel.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Aras Vaichas <arasv@magellan-technology.com>, linux-embedded@vger.kernel.org

On Thu 11 Jun 2009 08:48, Nicolas Ferre pondered:
> Aras Vaichas :
> > * what is your boot time? What is the time from power-on to kernel
> > running, how long does the kernel take to run until init starts, and
> > how long does init take?

[snip]

> That said, here are numbers from our not optimized demo
> (AT91Bootstrap+u-boot+linux+buildroot):
> - ~6s to Linux (can certainly be optimized)
> - ~+2s to init
> - ~+5s to login (here also)

Holy long boot times batman.

For a sub 1 second (973ms) boot (to userspace - end of the /etc/rc file), have 
a look at:

https://docs.blackfin.uclinux.org/doku.php?id=fast_boot_example

It also includes a 421ms for a minimal kernel.

No magic - just careful optimisation of the BootROM, U-Boot, and the kernel.

Some of the tricks we do are architecture independent, and should be able to 
be applied to any system. Your milage may vary - depending on your 
distribution, and your architecture.

-Robin
