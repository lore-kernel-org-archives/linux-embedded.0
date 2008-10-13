From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Mon, 13 Oct 2008 18:09:27 +0200
Message-ID: <20081013160927.GC9852@pengutronix.de>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <20081010191213.GC9852@pengutronix.de> <200810130833.26399.thomas.cooksey@trolltech.com> <20081013070017.GH9852@pengutronix.de> <48F34400.4000404@billgatliff.com> <20081013132303.GU9852@pengutronix.de> <20081013155820.GE2556@mvista.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081013155820.GE2556@mvista.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "George G. Davis" <gdavis@mvista.com>
Cc: Bill Gatliff <bgat@billgatliff.com>, Tom Cooksey <thomas.cooksey@trolltech.com>, linux-embedded mailing list <linux-embedded@vger.kernel.org>, Denis Olvier Kropp <dok@pengutronix.de>

On Mon, Oct 13, 2008 at 11:58:20AM -0400, George G. Davis wrote:
> It comes down to decisions of bill-of-materials and performance, the
> MBX/SGX options mentioned already are part of the SoCs and have high
> bandwidth connections to the processor. External options increase cost
> and won't match bandwidth of on chip options, but that's just my
> ignorant opinion w/o looking at the low-level detail comparisons.
> Unless you intend to encourage the SoC vendors to use the SM50x
> instead?  : )  Of course, that won't help for the current and planned
> generation(s) of devices...

The BoM argument is probably true for high volume consumer or automotive
use cases. For industrial usage, long term maintainability and thus
availability of documentation and code is usually a more important
argument.

Just my 0.02 ct. I'm just a poor open source guy :)

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
