From: Rob Landley <rob@landley.net>
Subject: Re: mainlining min-configs...
Date: Wed, 11 Jun 2008 19:01:33 -0500
Message-ID: <200806111901.34630.rob@landley.net>
References: <48447615.5050806@am.sony.com> <20080611063921.GA27978@uranus.ravnborg.org> <48502304.1030304@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48502304.1030304@am.sony.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Adrian Bunk <bunk@kernel.org>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Wednesday 11 June 2008 14:09:56 Tim Bird wrote:
> Sam Ravnborg wrote:
> >>> When I get my kconfig patchset polished you will be able to do:
> >>>
> >>> make K=my_mini_config allnoconfig
> >>
> >> So you're renaming KCONFIG_ALLNOCONFIG then?
> >
> > Somehow yes. The K= notation I hope will see more use. Only very few
> > people know the KCONFIG_ALL*CONFIG= trick.
>
> Indeed.  I had never heard of it, but it appears to have been
> around for at least 18 months.  It looks like Randy Dunlap tried
> to submit some documentation for this in Oct 2006, but it didn't
> make it in?

Nor did the documentation I posted back in November 2005:
http://lwn.net/Articles/160497/

Nor its resubmission:
http://lwn.net/Articles/161086/

Nor its re-resubmission:
http://lkml.org/lkml/2006/7/6/404

Randy's submission was after those three...

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
