From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: Re: New fast(?)-boot results on ARM
Date: Thu, 10 Sep 2009 02:03:42 +0200
Message-ID: <200909100203.42235.vda.linux@googlemail.com>
References: <20090814170228.GM13320@pengutronix.de> <20090904161626.GD3207@pengutronix.de> <20090909143354.GA15973@sig21.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=NgiYDIGgfwwx6aWUcr441MVfLxGf70nc7bEY6UiR+qY=;
        b=jHts2dIqxVikpcgug9djk/v7gEEVkuN8TCxnMHBzU4DVgdZiKaga2lJeAStVPiocke
         e9v9e7vj/tsCCzdp/cynvtNVNq+n1OS/5OJhugvriypaZxz7oU+aIQAKNzKjKSrRwVMP
         vvUxQRgi3En2GJk+A1kJQLec1jFDfYGju+V7U=
In-Reply-To: <20090909143354.GA15973@sig21.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Johannes Stezenbach <js@sig21.net>
Cc: Wolfram Sang <w.sang@pengutronix.de>, Robert Schwebel <r.schwebel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

On Wednesday 09 September 2009 16:33, Johannes Stezenbach wrote:
> Sorry for slow reply.
> 
> On Fri, Sep 04, 2009 at 06:16:26PM +0200, Wolfram Sang wrote:
> > 
> > > Now that microcom is in Debian sid (thanks!), where can I find ptx_ts?
> > > It seems to be quite useful.
> > 
> > Back from the holidays, so here it is:
> > 
> > http://pengutronix.de/software/ptx_ts/index_en.html
> > 
> > Hope it can be useful...
> 
> Yes, it is.  Thanks!
> 
> BTW, some feedback about microcom:
> 
> - the choice of ^\ as an escape charater is unfortunate since that
>   is usually mapped to set SIGQUIT in the tty; a btter choice would
>   be ^] (like telnet) or ^A (like minicom)
> - typing the escape character immediate causes the menu to be displayed,
>   so one cannot send a break sequence for SysRq without cluttering up the screen
> 
> Would you take patches for that?

Sure.
--
vda
