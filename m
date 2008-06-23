From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Mon, 23 Jun 2008 21:33:40 +0200
Message-ID: <20080623193340.GA836@uranus.ravnborg.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806231922.10864.vda.linux@googlemail.com> <20080623185728.GB30550@uranus.ravnborg.org> <200806232112.30393.vda.linux@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1763425AbYFWTdR@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806232112.30393.vda.linux@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denys Vlasenko <vda.linux@googlemail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Andi Kleen <andi@firstfloor.org>, torvalds@linux-foundation.org, akpm@linux-foundation.org, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>

On Mon, Jun 23, 2008 at 09:12:30PM +0200, Denys Vlasenko wrote:
> On Monday 23 June 2008 20:57, Sam Ravnborg wrote:
> > > > I agree. And if we do want to pay attention to pure code size, there are
> > > > other approaches -- like --gc-sections
> > > 
> > > I have some patches in this area too. Were submitted to Sam
> > > but he was too busy it seems.
> >
> > They were not trivial to apply and so went down on the TODO list.
> 
> I realize that they were not trivial to review, but that
> was unavoidable. They were even more not trivial to create.
> 
> > We could try to push the generic and x86 specific .lds stuff via
> > the arch maintainers?
> 
> IIRC I splitted the entire GC collection patch in a way
> that first patches were doing exactly this easier first part
> and I hoped that at least these first patches
> will be taken. They were big, but somewhat trivial,
> from "it's obviously safe" department.

I do not recall anything wrong with the patch-set.

> 
> Had they been applied, now making --gc-sections to work
> would be easier.
Agreed. I should have asked you to push this via arch maintainers back then.

	Sam
