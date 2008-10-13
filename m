From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Mon, 13 Oct 2008 09:31:57 +0200
Message-ID: <20081013073157.GK9852@pengutronix.de>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <20081010191213.GC9852@pengutronix.de> <200810130833.26399.thomas.cooksey@trolltech.com> <20081013070017.GH9852@pengutronix.de> <20081013092815.1792708d@surf>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081013092815.1792708d@surf>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Tom Cooksey <thomas.cooksey@trolltech.com>, linux-embedded mailing list <linux-embedded@vger.kernel.org>, Denis Olvier Kropp <dok@pengutronix.de>

On Mon, Oct 13, 2008 at 09:28:15AM +0200, Thomas Petazzoni wrote:
> > We are working on DirectFB [1] support for the PowerVR MBX & SGX
> > chips these days, so I know the problem :) Our hardware platform is
> > i.MX31 with the MBX, MPC5121e also with MBX (both freescale) and a
> > TI OMAP with the SGX.
>
> This is interesting. Is this work available somewhere? Is it
> open-source, or does it rely on proprietary drivers?

It will be available when we have something which is worth being
reviewed in public. As there is currently no possibility to get any
documentation about the cores without NDAs, an open *driver* is IMHO not
possible, so we'll have to rely on the proprietary drivers Freescale
deliver. Bad, but I don't see another chance by now.

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
