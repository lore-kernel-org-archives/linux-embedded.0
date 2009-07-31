From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: flicker free booting
Date: Fri, 31 Jul 2009 22:05:55 +0200
Message-ID: <20090731200555.GF29245@pengutronix.de>
References: <20090602185143.GA8655@zod.rchland.ibm.com> <4A257DF0.6040607@am.sony.com> <1243975064.6342.10.camel@mulgrave.site> <20090602213452.GK32630@pengutronix.de> <20090603033535.GA24291@kroah.com> <20090731152617.GW29245@pengutronix.de> <20090731155352.GA29245@pengutronix.de> <20090731180309.GA17314@cuplxvomd02.corp.sa.net> <4A733C07.3050002@billgatliff.com> <4A734A95.6060703@am.sony.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A734A95.6060703@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@am.sony.com>
Cc: Bill Gatliff <bgat@billgatliff.com>, David VomLehn <dvomlehn@cisco.com>, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org, Juergen Beisert <jbe@pengutronix.de>, Sascha Hauer <sha@pengutronix.de>, Wolfram Sang <wsa@pengutronix.de>

On Fri, Jul 31, 2009 at 12:48:37PM -0700, Tim Bird wrote:
> > Those fractions-of-seconds boot times are beyond the reach of the
> > 200 MHz-class ARM9 processors and similar, where it takes two or
> > three seconds just to load and uncompress the kernel from NOR or
> > NAND flash.
>
> While I don't disagree from a practical standpoint - at Sony using XIP
> we have been able to finish kernel boot on a 192 MHZ ARM9 in 186
> milliseconds. In the lab, anyway?

Wow, that's pretty fast; if that would be possible for standard
scenarios, it would indeed be better to do everything on the kernel
side.

Can you elaborate about the details of that experiment? Was that normal
XIP from NOR? What size has this kernel been?

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
