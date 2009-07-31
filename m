From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: flicker free booting
Date: Fri, 31 Jul 2009 20:09:32 +0200
Message-ID: <20090731180932.GC29245@pengutronix.de>
References: <1243964577.4229.49.camel@mulgrave.int.hansenpartnership.com> <20090602175244.GB10973@cuplxvomd02.corp.sa.net> <20090602185143.GA8655@zod.rchland.ibm.com> <4A257DF0.6040607@am.sony.com> <1243975064.6342.10.camel@mulgrave.site> <20090602213452.GK32630@pengutronix.de> <20090603033535.GA24291@kroah.com> <20090731152617.GW29245@pengutronix.de> <20090731155352.GA29245@pengutronix.de> <20090731180309.GA17314@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090731180309.GA17314@cuplxvomd02.corp.sa.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David VomLehn <dvomlehn@cisco.com>
Cc: linux-embedded@vger.kernel.org, Juergen Beisert <jbe@pengutronix.de>, Sascha Hauer <sha@pengutronix.de>, Wolfram Sang <wsa@pengutronix.de>

Hi David,

On Fri, Jul 31, 2009 at 11:03:10AM -0700, David VomLehn wrote:
> On Fri, Jul 31, 2009 at 05:53:52PM +0200, Robert Schwebel wrote:
> > On Tue, Jun 02, 2009 at 08:35:35PM -0700, Greg KH wrote:
> > > On Tue, Jun 02, 2009 at 11:34:52PM +0200, Robert Schwebel wrote:
> > > > Could flickerfree-bootsplash be a topic? Or is that completely
> > > > pushed into the userspace these fastboot days?
> ...
> > So what I would like to see is this:
> > 
> > a) power on
> > b) almost immediately (< 1s) a splash screen appears
> > c) optionally be able to do some animation, progress bar etc
> > d) application appears (instantanously or by fading)
> 
> This is an issue that I think is common to many embedded platforms, but I'm
> not sure this is the solution. (I'm not sure it's *not* the solution, either).

I hope it is more a call-for-discussion :-)

> The question I've been looking at is: do sub-second boot times make
> all this a moot point? After all, if you can bring up your graphics
> driver in a fraction of a second and use *it* to display a splash
> screen, it seems like it would meet your need to give almost immediate
> feedback to users that the system is alive.

Yup, that would be cool.

However, on flash-based systems in the ARM926 / 200...400 MHz class
(which is still quite common) the boot time up to the point where the
penguin appears is still about 3...4 s [1] which is too long. So I
suspect until systems become faster, we'll have no other choice than
such as scenario.

rsc

[1] we can do some benchmarking next week
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
