From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: flicker free booting
Date: Fri, 31 Jul 2009 14:25:57 -0500
Message-ID: <4A734545.10405@billgatliff.com>
References: <1243956140.4229.25.camel@mulgrave.int.hansenpartnership.com> <20090602172941.GL3095@hansolo.jdub.homelinux.org> <1243964577.4229.49.camel@mulgrave.int.hansenpartnership.com> <20090602175244.GB10973@cuplxvomd02.corp.sa.net> <20090602185143.GA8655@zod.rchland.ibm.com> <4A257DF0.6040607@am.sony.com> <1243975064.6342.10.camel@mulgrave.site> <20090602213452.GK32630@pengutronix.de> <20090603033535.GA24291@kroah.com> <20090731152617.GW29245@pengutronix.de> <20090731155352.GA29245@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090731155352.GA29245@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: linux-embedded@vger.kernel.org, Juergen Beisert <jbe@pengutronix.de>, Sascha Hauer <sha@pengutronix.de>, Wolfram Sang <wsa@pengutronix.de>

Robert Schwebel wrote:
> A second step could be:
>
> - Have this initial framebuffer as /dev/fb0 (mem at the end of RAM)
> - In order to avoid flicker, the driver sets up a 2nd framebuffer,
>   in dynamically allocated memory -> /dev/fb1. This framebuffer
>   continues to display the splash image (or an animation). Switching
>   from fb0 -> fb1 is done during VSync.
>   

What about double-buffering fb0 instead?  That's how Android works.

> Drivers which see the framebuffer= parameter would have to skip their
> hardware initialisation step.
>   

Actually, I'd rather that drivers look at the hardware itself, and 
verify that the configuration matches what the parameter specifies 
before making changes.  That way you could use framebuffer= to 
communicate the desired setup to the driver in cases where the hardware 
wasn't already initialized.



-- 
Bill Gatliff
bgat@billgatliff.com
