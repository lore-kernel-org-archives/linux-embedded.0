From: Johannes Stezenbach <js@sig21.net>
Subject: Re: New fast(?)-boot results on ARM
Date: Wed, 9 Sep 2009 16:33:55 +0200
Message-ID: <20090909143354.GA15973@sig21.net>
References: <20090814170228.GM13320@pengutronix.de>
 <1158166a0908141304y70300ab3p899b0d4609efded9@mail.gmail.com>
 <20090814204305.GA31727@pengutronix.de>
 <20090815103532.GA5596@sig21.net>
 <20090904161626.GD3207@pengutronix.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090904161626.GD3207@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, Denys Vlasenko <vda.linux@googlemail.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

Sorry for slow reply.

On Fri, Sep 04, 2009 at 06:16:26PM +0200, Wolfram Sang wrote:
> 
> > Now that microcom is in Debian sid (thanks!), where can I find ptx_ts?
> > It seems to be quite useful.
> 
> Back from the holidays, so here it is:
> 
> http://pengutronix.de/software/ptx_ts/index_en.html
> 
> Hope it can be useful...

Yes, it is.  Thanks!

BTW, some feedback about microcom:

- the choice of ^\ as an escape charater is unfortunate since that
  is usually mapped to set SIGQUIT in the tty; a btter choice would
  be ^] (like telnet) or ^A (like minicom)
- typing the escape character immediate causes the menu to be displayed,
  so one cannot send a break sequence for SysRq without cluttering up the screen

Would you take patches for that?


Johannes
