From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] PM: Hide CONFIG_PM from users
Date: Mon, 7 Feb 2011 16:50:53 -0800
Message-ID: <20110208005053.GB24804@core.coreip.homeip.net>
References: <1297081335-13631-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <201102072300.03986.rjw@sisk.pl>
 <20110207222350.GA24804@core.coreip.homeip.net>
 <201102080005.40448.rjw@sisk.pl>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=LxQPj3kEPMfR2gS9zzT4mlMDoPsHmXlap2MS01LvoMY=;
        b=P84tmAVmaVu0jXFdrStnmeGEDkM4jbK66urm/fXVmLQxiLGdA3lODV/XMAQOOunu/5
         q2BH95F9EYeFPFe8NwURLtjNMyFHlhHezA2ZKLtxxpmy4d2JIg52WYSEQ3zTcHpD0HXV
         jUqlYLf+3ANkouNzDyk2x1dc/WgaZzj62XCz0=
Content-Disposition: inline
In-Reply-To: <201102080005.40448.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-embedded@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

On Tue, Feb 08, 2011 at 12:05:40AM +0100, Rafael J. Wysocki wrote:
> On Monday, February 07, 2011, Dmitry Torokhov wrote:
> > On Mon, Feb 07, 2011 at 11:00:03PM +0100, Rafael J. Wysocki wrote:
> > > On Monday, February 07, 2011, Dmitry Torokhov wrote:
> > > > On Mon, Feb 07, 2011 at 10:15:59PM +0100, Rafael J. Wysocki wrote:
> > > > > On Monday, February 07, 2011, Mark Brown wrote:
> > > > > > 
> > > > > > Yeah, but some people seem very keen on removing the pointers to the PM
> > > > > > ops entirely when CONFIG_PM is disabled which means that you end up with
> > > > > > varying idioms for what you do with the PM ops as stuff gets ifdefed
> > > > > > out.  Then again I'm not sure anything would make those people any
> > > > > > happier.
> > > > > 
> > > > > I really think we should do things that makes sense rather that worry about
> > > > > who's going to like or dislike it (except for Linus maybe, but he tends to like
> > > > > things that make sense anyway).  At this point I think the change I suggested
> > > > > makes sense, because it (a) simplifies things and (b) follows the quite common
> > > > > practice which is to make PM callbacks depend on CONFIG_PM.
> > > > 
> > > > Many people make these callback dependent on PM not because it makes
> > > > much sense but because it is possible to do so. However, aside of
> > > > randconfig compile testing, nobody really tests drivers that implement
> > > > PM in the !CONFIG_PM setting.
> > > 
> > > That I can agree with, but I'm not sure whether it is an argument against
> > > the patch I've just posted or for it?
> > 
> > More of an observation for your (b) justification. I'd probably force
> > CONFIG_PM to always 'y'w while we weeding references to it from
> > drivers...
> 
> We simply can't force CONFIG_PM to 'y', because some platforms want it to be 'n'.
> 

Again, want or need? It would be nice to know answer to this question.


Thanks.

-- 
Dmitry
