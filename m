From: Jim Freeman <jfree@sovereign.org>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Thu, 12 Jun 2008 16:02:46 -0600
Message-ID: <20080612220246.GB27513@sovereign.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com> <200806111941.51221.rob@landley.net> <20080612182529.GB7423@nibiru.local> <485190E8.80705@cisco.com> <48519837.1090902@katalix.com> <8bd0f97a0806121446i68af3b96sbe51cc510f7d4fb6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8bd0f97a0806121446i68af3b96sbe51cc510f7d4fb6@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: James Chapman <jchapman@katalix.com>, David VomLehn <dvomlehn@cisco.com>, weigelt@metux.de, Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Thu, Jun 12, 2008 at 05:46:42PM -0400, Mike Frysinger wrote:
> On Thu, Jun 12, 2008 at 5:42 PM, James Chapman wrote:
> > David VomLehn wrote:
> >> Amen, brother. I'm fortunate in that I work for an organization that is
> >> quite good about enforcing code reviews, specifically, the QA organization
> >> is empowered to reject changes that do not have code review notes. I also
> >> have a fairly broad scope, so I'm in on code reviews for a number of open
> >> source components. At each such review, one of my criteria is whether the
> >> change is suitable for pushing back to the appropriate community. This is
> >> not necessarily a short-term way to make friends, but the long-term effects
> >> will be good both for the company and for the open source community in
> >> general.
> >>
> >> Now, if we can only get the time to actually push all the backlogged fixes
> >> out...
> >
> > Er, is that GPL or LGPL code that you're modifying? If so, you *have* to
> > push those code changes out (make them available to others), whether you
> > think people will be interested or not!
> 
> umm, not really.  only if (1) he gives a binary to someone and (2)
> they ask him for the source.  if he doesnt distribute or no one asks,
> he doesnt have to do squat.
> -mike

And I'm just betting that when he said "push ... fixes ... out"
he meant "work to get them incorporated back upstream", not just
make them available to requesters.

Most vendors these days have finally gotten the clue that sources/changes
have to be made available to downstream requesters, but far fewer
are sufficiently self-enlightened to figure out that changes need to
be accepted upstream for them to keep flowing back.  And to make that
happen, vendors have to take on substantially higher overhead to win
acceptance of patches/changes upstream, an undertaking often sadly
fraught with hassle, uncertainty, and even peril.  So they mostly
don't bother.  To their (and their customers, and our) long-term
detriment.

And Cisco has probably learned by now (and by sad experience) to do
the Right (tm) thing.

...jfree
