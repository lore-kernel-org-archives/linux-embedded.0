From: "George G. Davis" <gdavis@mvista.com>
Subject: Re: Getting physical addresses of mmap'd pages from userspace
Date: Mon, 13 Oct 2008 11:58:20 -0400
Message-ID: <20081013155820.GE2556@mvista.com>
References: <200810101815.06249.thomas.cooksey@trolltech.com> <20081010191213.GC9852@pengutronix.de> <200810130833.26399.thomas.cooksey@trolltech.com> <20081013070017.GH9852@pengutronix.de> <48F34400.4000404@billgatliff.com> <20081013132303.GU9852@pengutronix.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081013132303.GU9852@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Bill Gatliff <bgat@billgatliff.com>, Tom Cooksey <thomas.cooksey@trolltech.com>, linux-embedded mailing list <linux-embedded@vger.kernel.org>, Denis Olvier Kropp <dok@pengutronix.de>

On Mon, Oct 13, 2008 at 03:23:03PM +0200, Robert Schwebel wrote:
> On Mon, Oct 13, 2008 at 07:50:08AM -0500, Bill Gatliff wrote:
> > Robert Schwebel wrote:
> > > In reality, there are no real alternatives for accelerates chips.
> >
> > Would the Silicon Motion SM50x chips qualify as an alternative?
> >
> > They can do the blitting, at least.  No OpenGL, tho.  So, I guess it
> > depends on your definition of "accelerated"...
> 
> Yup, from our perspective it would be fine. Unfortunately, the hardware
> people in our project had (subjective, imho) concerns.

It comes down to decisions of bill-of-materials and performance, the
MBX/SGX options mentioned already are part of the SoCs and have
high bandwidth connections to the processor.  External options increase
cost and won't match bandwidth of on chip options, but that's just my
ignorant opinion w/o looking at the low-level detail comparisons.
Unless you intend to encourage the SoC vendors to use the SM50x
instead?  : )  Of course, that won't help for the current and planned
generation(s) of devices...

--
Regards,
George
> 
> rsc
> -- 
>  Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
>  Pengutronix - Linux Solutions for Science and Industry
>    Handelsregister:  Amtsgericht Hildesheim, HRA 2686
>      Hannoversche Str. 2, 31134 Hildesheim, Germany
>    Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
