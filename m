From: Jamie Lokier <jamie@shareable.org>
Subject: Re: flicker free booting
Date: Sat, 1 Aug 2009 15:25:25 +0100
Message-ID: <20090801142525.GA27574@shareable.org>
References: <1243964577.4229.49.camel@mulgrave.int.hansenpartnership.com> <20090602175244.GB10973@cuplxvomd02.corp.sa.net> <20090602185143.GA8655@zod.rchland.ibm.com> <4A257DF0.6040607@am.sony.com> <1243975064.6342.10.camel@mulgrave.site> <20090602213452.GK32630@pengutronix.de> <20090603033535.GA24291@kroah.com> <20090731152617.GW29245@pengutronix.de> <20090731155352.GA29245@pengutronix.de> <4A734545.10405@billgatliff.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A734545.10405@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org, Juergen Beisert <jbe@pengutronix.de>, Sascha Hauer <sha@pengutronix.de>, Wolfram Sang <wsa@pengutronix.de>

Bill Gatliff wrote:
> Actually, I'd rather that drivers look at the hardware itself, and 
> verify that the configuration matches what the parameter specifies 
> before making changes.  That way you could use framebuffer= to 
> communicate the desired setup to the driver in cases where the hardware 
> wasn't already initialized.

It's a good idea when possible, but some hardware cannot be queried in
enough detail to confirm the framebuffer configuration - unless the
bootloader passes an extra parameter saying what it has done.

-- Jamie
