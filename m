From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: New MMC maintainer needed
Date: Thu, 23 Jul 2009 00:32:28 -0700
Message-ID: <20090723003228.fc0ec34b.akpm@linux-foundation.org>
References: <20090714153601.6dfe70ff@mjolnir.ossman.eu>
	<20090722151744.fffd7bf5.akpm@linux-foundation.org>
	<4A67A9E8.5080002@mnementh.co.uk>
	<20090723055447.GA12211@console-pimps.org>
	<20090722232259.d0ff3495.akpm@linux-foundation.org>
	<20090723172559.e7aebbb5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090723172559.e7aebbb5.sfr@canb.auug.org.au>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Matt Fleming <matt@console-pimps.org>, Ian Molton <ian@mnementh.co.uk>, Pierre Ossman <pierre@ossman.eu>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, nico@cam.org, nicolas.ferre@rfo.atmel.com, hskinnemoen@atmel.com, tony@atomide.com, david-b@pacbell.net, manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl, ppisa@pikron.com, jarkko.lavinen@nokia.com, ben@fluff.org, saschasommer@freenet.de, avorontsov@ru.mvista.com, oakad@yahoo.com, HaraldWelte@viatech.com, JosephChan@via.com.tw, adrian.hunter@nokia.com

On Thu, 23 Jul 2009 17:25:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> On Wed, 22 Jul 2009 23:22:59 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > I actually already have a little pile of MMC things queued:
> > 
> > http://userweb.kernel.org/~akpm/mmotm/broken-out/mmc-in-mmc_power_up-use-previously-selected-ocr-if-available.patch
> > http://userweb.kernel.org/~akpm/mmotm/broken-out/omap-hsmmc-do-not-enable-buffer-ready-interrupt-if-using-dma.patch
> > http://userweb.kernel.org/~akpm/mmotm/broken-out/mmc-msm_sdccc-driver-for-htc-dream.patch
> > http://userweb.kernel.org/~akpm/mmotm/broken-out/msm_sdccc-convert-printkkern_level-to-pr_level.patch
> > http://userweb.kernel.org/~akpm/mmotm/broken-out/msm_sdccc-stylistic-cleaning.patch
> > http://userweb.kernel.org/~akpm/mmotm/broken-out/msm_sdccc-move-overly-indented-code-to-separate-function.patch
> > 
> > I guess we own them now ;)
> 
> So how about, as an experiment, you put all those (at least those that are
> "stable") into a git tree (or quilt series) based on Linus' tree and I
> could replace the current linux-next mmc tree (which is empty) with that.
> 

I haven't worked out how to do that yet :( (Well, I have, but it's all
complex).

It gets easy if I remove linux-next.patch from -mm.  Maybe I'll do that.
