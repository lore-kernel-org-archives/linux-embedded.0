From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: New MMC maintainer needed
Date: Thu, 23 Jul 2009 15:42:31 +0900
Message-ID: <20090723064230.GA7658@linux-sh.org>
References: <20090714153601.6dfe70ff@mjolnir.ossman.eu> <20090722151744.fffd7bf5.akpm@linux-foundation.org> <4A67A9E8.5080002@mnementh.co.uk> <20090723055447.GA12211@console-pimps.org> <20090722232259.d0ff3495.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090722232259.d0ff3495.akpm@linux-foundation.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matt Fleming <matt@console-pimps.org>, Ian Molton <ian@mnementh.co.uk>, Pierre Ossman <pierre@ossman.eu>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, nico@cam.org, nicolas.ferre@rfo.atmel.com, hskinnemoen@atmel.com, tony@atomide.com, david-b@pacbell.net, manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl, ppisa@pikron.com, jarkko.lavinen@nokia.com, ben@fluff.org, saschasommer@freenet.de, avorontsov@ru.mvista.com, oakad@yahoo.com, HaraldWelte@viatech.com, JosephChan@via.com.tw, adrian.hunter@nokia.com

On Wed, Jul 22, 2009 at 11:22:59PM -0700, Andrew Morton wrote:
> On Thu, 23 Jul 2009 06:54:47 +0100 Matt Fleming <matt@console-pimps.org> wrote:
> 
> > On Thu, Jul 23, 2009 at 01:08:08AM +0100, Ian Molton wrote:
> > > Andrew Morton wrote:
> > >
> > >> Until and unless someone else steps up I can act as maintainer of last
> > >> resort for MMC.  As I'm presently doing for fbdev, hwmon, rtc, spi,
> > >> gpio, i2o and about 1000 other identifiable subsystems.
> > >
> > > If no-one else is helping out, Im happy to also be CC'd on MMC patches.
> > >
> > 
> > Ditto.
> 
> Thanks, guys.
> 
> I actually already have a little pile of MMC things queued:
> 
> http://userweb.kernel.org/~akpm/mmotm/broken-out/mmc-in-mmc_power_up-use-previously-selected-ocr-if-available.patch
> http://userweb.kernel.org/~akpm/mmotm/broken-out/omap-hsmmc-do-not-enable-buffer-ready-interrupt-if-using-dma.patch
> http://userweb.kernel.org/~akpm/mmotm/broken-out/mmc-msm_sdccc-driver-for-htc-dream.patch
> http://userweb.kernel.org/~akpm/mmotm/broken-out/msm_sdccc-convert-printkkern_level-to-pr_level.patch
> http://userweb.kernel.org/~akpm/mmotm/broken-out/msm_sdccc-stylistic-cleaning.patch
> http://userweb.kernel.org/~akpm/mmotm/broken-out/msm_sdccc-move-overly-indented-code-to-separate-function.patch
> 
> I guess we own them now ;)

While you're in MMC collection mode:

	http://lkml.org/lkml/2009/7/17/75

wants to be queued, too. Presumably Ian will get to it at some point,
though.
