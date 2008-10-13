From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Mon, 13 Oct 2008 15:23:03 +0200
Message-ID: <20081013132303.GU9852@pengutronix.de>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <20081010191213.GC9852@pengutronix.de> <200810130833.26399.thomas.cooksey@trolltech.com> <20081013070017.GH9852@pengutronix.de> <48F34400.4000404@billgatliff.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48F34400.4000404@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Tom Cooksey <thomas.cooksey@trolltech.com>, linux-embedded mailing list <linux-embedded@vger.kernel.org>, Denis Olvier Kropp <dok@pengutronix.de>

On Mon, Oct 13, 2008 at 07:50:08AM -0500, Bill Gatliff wrote:
> Robert Schwebel wrote:
> > In reality, there are no real alternatives for accelerates chips.
>
> Would the Silicon Motion SM50x chips qualify as an alternative?
>
> They can do the blitting, at least.  No OpenGL, tho.  So, I guess it
> depends on your definition of "accelerated"...

Yup, from our perspective it would be fine. Unfortunately, the hardware
people in our project had (subjective, imho) concerns.

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
