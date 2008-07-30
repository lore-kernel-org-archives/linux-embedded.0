From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: AT91 kernel programming documentation ?
Date: Wed, 30 Jul 2008 16:01:14 +0200
Message-ID: <20080730140113.GY8254@pengutronix.de>
References: <4890724F.2020505@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4890724F.2020505@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Schoenleitner <dev.c0debabe@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Wed, Jul 30, 2008 at 03:53:19PM +0200, Stefan Schoenleitner wrote:
> I'm looking for some good documentation concerning AT91 Linux kernel
> development. Currently I have a Olimex AT91SAM9260 development board
> which is supported by the at91 patch set.

The base functionality is supported in the Linux mainline.

> Now I would like to add different hardware to the board and write some
> kernel code for it.

What kind of hardware?

> Unfortunately, there doesn't seem to be a lot of documentation. At
> the moment I'm reading mach-at91 related source code and trying to
> find out how things work.

I assume you've already bought a copy of the Rubini Device Driver book?

> Specificly, I would like to know how the different SoC devices can be
> accessed and used, how I can do port multiplexing, how I can tell the
> kernel which hardware is attached to where and so on.

Check arch/arm/mach-at91/*. It very much depends on what you want to do.
Documentation/drivermodel/ might also be worth a look.

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
