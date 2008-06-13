From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: Cross Compiler and loads of issues
Date: Fri, 13 Jun 2008 06:34:31 +0200
Message-ID: <20080613043431.GP13599@pengutronix.de>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaz <shazalive@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On Thu, Jun 12, 2008 at 10:52:44PM +0500, Shaz wrote:
> I have been following "Re: [PATCH 0/1] Embedded Maintainer(s)" and
> felt like asking that is there one good way to get a cross compiler
> work. I tried buildroot, scratchbox and even openMoko with
> openEmbedded but all of them had lots of issues and don't know which
> will be the best alternative.

There's also OSELAS.Toolchain:
http://www.pengutronix.de/oselas/toolchain/index_en.html

We try to be as close to mainline gcc/binutils as possible, and if there
are issues, please report or send patches :-)

> Anyways, I liked the idea of Qemu based cross compiler. Is it possible
> for the inexperienced to get it working and emulate the exact model
> and devices.

No.

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9

