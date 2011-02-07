From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] PM: Hide CONFIG_PM from users
Date: Mon, 7 Feb 2011 13:47:33 -0800
Message-ID: <20110207214732.GA24703@core.coreip.homeip.net>
References: <1297081335-13631-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <201102072046.48763.rjw@sisk.pl>
 <20110207201803.GU10564@opensource.wolfsonmicro.com>
 <201102072215.59921.rjw@sisk.pl>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=7cDaH5ei4jxQHTZgXblu19pO23Y0JbtPXJzUMZdB8hg=;
        b=K2EZSgLT83/MkRMbcp2LP2qlHAQYqs2bNlSjOnWaepwA489ZIyYrp5EQv4mchZOzOO
         sehCpe4HFA+lrGGniq7RaKCByFSWMMEbxhMRS+FG4E6fde9GTDiFhtrRHQrp13brChQ6
         rWghlJSPkzFv4t4WhFYg8PbkQ9AIolL+BaJb4=
Content-Disposition: inline
In-Reply-To: <201102072215.59921.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-embedded@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

On Mon, Feb 07, 2011 at 10:15:59PM +0100, Rafael J. Wysocki wrote:
> On Monday, February 07, 2011, Mark Brown wrote:
> > 
> > Yeah, but some people seem very keen on removing the pointers to the PM
> > ops entirely when CONFIG_PM is disabled which means that you end up with
> > varying idioms for what you do with the PM ops as stuff gets ifdefed
> > out.  Then again I'm not sure anything would make those people any
> > happier.
> 
> I really think we should do things that makes sense rather that worry about
> who's going to like or dislike it (except for Linus maybe, but he tends to like
> things that make sense anyway).  At this point I think the change I suggested
> makes sense, because it (a) simplifies things and (b) follows the quite common
> practice which is to make PM callbacks depend on CONFIG_PM.

Many people make these callback dependent on PM not because it makes
much sense but because it is possible to do so. However, aside of
randconfig compile testing, nobody really tests drivers that implement
PM in the !CONFIG_PM setting.

-- 
Dmitry
