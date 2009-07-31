From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: flicker free booting
Date: Fri, 31 Jul 2009 12:48:37 -0700
Message-ID: <4A734A95.6060703@am.sony.com>
References: <20090602172941.GL3095@hansolo.jdub.homelinux.org> <1243964577.4229.49.camel@mulgrave.int.hansenpartnership.com> <20090602175244.GB10973@cuplxvomd02.corp.sa.net> <20090602185143.GA8655@zod.rchland.ibm.com> <4A257DF0.6040607@am.sony.com> <1243975064.6342.10.camel@mulgrave.site> <20090602213452.GK32630@pengutronix.de> <20090603033535.GA24291@kroah.com> <20090731152617.GW29245@pengutronix.de> <20090731155352.GA29245@pengutronix.de> <20090731180309.GA17314@cuplxvomd02.corp.sa.net> <4A733C07.3050002@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A733C07.3050002@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: David VomLehn <dvomlehn@cisco.com>, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org, Juergen Beisert <jbe@pengutronix.de>, Sascha Hauer <sha@pengutronix.de>, Wolfram Sang <wsa@pengutronix.de>

Bill Gatliff wrote:
> 
> Those fractions-of-seconds boot times are beyond the reach of the 200
> MHz-class ARM9 processors and similar, where it takes two or three
> seconds just to load and uncompress the kernel from NOR or NAND flash.
While I don't disagree from a practical standpoint - at Sony
using XIP we have been able to finish kernel boot on a 192 MHZ ARM9
in 186 milliseconds.  In the lab, anyway?

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
