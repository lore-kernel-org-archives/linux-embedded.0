From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: cross-compiling alternatives
Date: Fri, 13 Jun 2008 21:10:37 +0200
Message-ID: <20080613191037.GU13599@pengutronix.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806130843.05704.neundorf@eit.uni-kl.de> <1213346316.17853.28.camel@tara.firmix.at> <200806131106.18487.neundorf@eit.uni-kl.de> <1213351433.17853.61.camel@tara.firmix.at> <20080613151634.GJ11760@nibiru.local> <1213382709.17853.79.camel@tara.firmix.at>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1213382709.17853.79.camel@tara.firmix.at>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Petrovitsch <bernd@firmix.at>
Cc: weigelt@metux.de, Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Fri, Jun 13, 2008 at 08:45:09PM +0200, Bernd Petrovitsch wrote:
> > Recent pkg-config supports sysroot.
> 
> FC-6 has "only" 0.21.

Solved in ptxdist by building the "right" pkgconfig as a host tool.

> > So you simply build your .pc files as usual (w/o sysroot prefix) and
> > set the sysroot prefix via env on the pkg-config call.

Ah, great, must be a new feature. Will have to integrate that into
ptxdist... at the moment we fix it with a wrapper script.

> The problem is that the build-time (cross-)linker needs to find the
> (cross-compiled) lib under
> /my/build/host/target/environment/opt/foo/lib at link time and the
> shared linker under /opt/foo/lib at run-time.

pkg-config is fixable (our wrapper in PTXdist does the right thing wrt.
buildtime vs. runtime paths).

> Hmm, after digging into that old project, it seems that libtool and
> the .la files were the problem.

Right, libtool's paths are critical: libtools isn't sysroot aware, and
it seems to be not easily fixable.

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9

