From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: New fast(?)-boot results on ARM
Date: Fri, 14 Aug 2009 23:15:00 +0200
Message-ID: <20090814211500.GC31727@pengutronix.de>
References: <20090814170228.GM13320@pengutronix.de> <4A85AAC4.7050505@acm.org> <20090814185731.GN13320@pengutronix.de> <63386a3d0908141401t6050f39ey8d85213aeccf748a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <63386a3d0908141401t6050f39ey8d85213aeccf748a@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, Zan Lynx <zlynx@acm.org>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

On Fri, Aug 14, 2009 at 11:01:58PM +0200, Linus Walleij wrote:
> >> > That's factor 70 away from the 110 ms boot time Tim has talked about
> >> > some days ago (and he measured on an ARM cpu which had almost half
> >> > the speed of this one), and I'm wondering what we can do to improve
> >> > the boot time.
> >>
> >> 2.4s in uncompression? That seems like an obvious target for
> >> improvement.
> >
> > Indeed, we'll check that.
> 
> We got rid of uncompression on a flash-based system vastly improving
> boot time. The reason is that compressed kernels are faster only when
> the throughput to the persistent storage is lower than the decompression
> throughput, and on typical embedded systems with DMA the throughput to
> memory outperforms the CPU-based decompression.
> 
> Of course it depends on a lot of stuff like performance of flash controller,
> kernel storage filesystem performance, DMA controller performance,
> cache architecture etc so it's individual per-system.

We have also done that on NOR based systems, but I'm not sure if it will
work out for NAND as well.

Thanks,

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
