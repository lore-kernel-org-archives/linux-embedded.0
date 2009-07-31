From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: flicker free booting
Date: Fri, 31 Jul 2009 11:03:10 -0700
Message-ID: <20090731180309.GA17314@cuplxvomd02.corp.sa.net>
References: <20090602172941.GL3095@hansolo.jdub.homelinux.org> <1243964577.4229.49.camel@mulgrave.int.hansenpartnership.com> <20090602175244.GB10973@cuplxvomd02.corp.sa.net> <20090602185143.GA8655@zod.rchland.ibm.com> <4A257DF0.6040607@am.sony.com> <1243975064.6342.10.camel@mulgrave.site> <20090602213452.GK32630@pengutronix.de> <20090603033535.GA24291@kroah.com> <20090731152617.GW29245@pengutronix.de> <20090731155352.GA29245@pengutronix.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090731155352.GA29245@pengutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1060; t=1249063389; x=1249927389;
	c=relaxed/simple; s=sjdkim1004;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20flicker=20free=20booting
	|Sender:=20;
	bh=NKNs1l2yBb6QBM2S+8MOqyaR1Fk7b2a1brre1sOK/3E=;
	b=puaKBe/U+52esbl0nm1cR9V1iKdeIWHh+DRJSvdWhuFyp2IICV2Gghqjc3
	vlhhF4hyPMDwJV928SQq0fshonD9IVsTSVAHt3szm/IdEAQLFMdGG9seanux
	TAGrTWe+BgZgsIko+A+tg/LGRL87XSMbR/Fna/2/e8yqVOvZz9V9Q=;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: linux-embedded@vger.kernel.org, Juergen Beisert <jbe@pengutronix.de>, Sascha Hauer <sha@pengutronix.de>, Wolfram Sang <wsa@pengutronix.de>

On Fri, Jul 31, 2009 at 05:53:52PM +0200, Robert Schwebel wrote:
> On Tue, Jun 02, 2009 at 08:35:35PM -0700, Greg KH wrote:
> > On Tue, Jun 02, 2009 at 11:34:52PM +0200, Robert Schwebel wrote:
> > > Could flickerfree-bootsplash be a topic? Or is that completely
> > > pushed into the userspace these fastboot days?
...
> So what I would like to see is this:
> 
> a) power on
> b) almost immediately (< 1s) a splash screen appears
> c) optionally be able to do some animation, progress bar etc
> d) application appears (instantanously or by fading)

This is an issue that I think is common to many embedded platforms, but I'm
not sure this is the solution. (I'm not sure it's *not* the solution, either).
The question I've been looking at is: do sub-second boot times make all this
a moot point? After all, if you can bring up your graphics driver in a fraction
of a second and use *it* to display a splash screen, it seems like it would
meet your need to give almost immediate feedback to users that the system is
alive.
--
David VomLehn
