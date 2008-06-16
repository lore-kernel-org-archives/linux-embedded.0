From: Jamie Lokier <jamie@shareable.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Mon, 16 Jun 2008 14:32:01 +0100
Message-ID: <20080616133201.GG18857@shareable.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <20080614112656.GX13599@pengutronix.de> <20080616113946.GD18857@shareable.org> <200806161406.40063.neundorf@eit.uni-kl.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806161406.40063.neundorf@eit.uni-kl.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Neundorf <neundorf@eit.uni-kl.de>
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

Alexander Neundorf wrote:
> On Monday 16 June 2008 13:39:46 you wrote:
> ...
> > > > If you're going to rewrite Autotools using GNU Make, why not ask if
> > > > another tool would be better, perhaps a tool specially designed for
> > > > the job?
> > >
> > > Go ahead.
> >
> > The first part of going ahead is to brainstorm and find ideas and
> > likely interest...  It's too big (as you rightly note) to simply sit
> > down and do it by oneself in isolation.
> 
> You are not seriously talking about writing yet another buildsystem?
> With autotools, cmake, scons, ant, (b)jam, bitbake, makeng,
> etc. there should be enough available.

No, I'm talking about improving Autotools to handle some things better
than they do now.  Passing the high hurdles required to become part of
Autotools - especially compatibility - is part of the goal.

-- Jamie
