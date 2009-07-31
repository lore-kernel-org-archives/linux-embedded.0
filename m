From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: flicker free booting
Date: Fri, 31 Jul 2009 13:46:31 -0500
Message-ID: <4A733C07.3050002@billgatliff.com>
References: <20090602172941.GL3095@hansolo.jdub.homelinux.org> <1243964577.4229.49.camel@mulgrave.int.hansenpartnership.com> <20090602175244.GB10973@cuplxvomd02.corp.sa.net> <20090602185143.GA8655@zod.rchland.ibm.com> <4A257DF0.6040607@am.sony.com> <1243975064.6342.10.camel@mulgrave.site> <20090602213452.GK32630@pengutronix.de> <20090603033535.GA24291@kroah.com> <20090731152617.GW29245@pengutronix.de> <20090731155352.GA29245@pengutronix.de> <20090731180309.GA17314@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090731180309.GA17314@cuplxvomd02.corp.sa.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org, Juergen Beisert <jbe@pengutronix.de>, Sascha Hauer <sha@pengutronix.de>, Wolfram Sang <wsa@pengutronix.de>

David VomLehn wrote:
> This is an issue that I think is common to many embedded platforms, but I'm
> not sure this is the solution. (I'm not sure it's *not* the solution, either).
> The question I've been looking at is: do sub-second boot times make all this
> a moot point? After all, if you can bring up your graphics driver in a fraction
> of a second and use *it* to display a splash screen, it seems like it would
> meet your need to give almost immediate feedback to users that the system is
> alive.
>   

Those fractions-of-seconds boot times are beyond the reach of the 200 
MHz-class ARM9 processors and similar, where it takes two or three 
seconds just to load and uncompress the kernel from NOR or NAND flash.

And add a second or so on top of that to zeroinit the graphics 
framebuffer, if your display is of any decent size and depth.


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
