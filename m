From: Ben Nizette <bn@niasdigital.com>
Subject: Re: UIO not working on ppc405 onchip registers
Date: Tue, 22 Jul 2008 16:42:47 +1000
Message-ID: <1216708967.4004.238.camel@moss.renham>
References: <200807212152.16080.super.firetwister@gmail.com>
	 <20080722061730.GB12576@digi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080722061730.GB12576@digi.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Markus Brunner <super.firetwister@googlemail.com>
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>


Hey Markus,

> > 
> > +config UIO_GPIO
> > +       tristate "Driver for PPC_4xx GPIO"

As an aside, you sure you want to do this anyway?  I'd suggest that you
just do a gpio chip driver for this, tie it in to gpiolib and use the
gpiolib user interface (which IIRC has only made it as far as -mm but is
on the way up).  This gives kernel internals nice access to the pins as
well through the standard gpio framework.

Thanks :-)
	--Ben.

