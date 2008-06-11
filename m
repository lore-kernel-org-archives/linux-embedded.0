From: Rob Landley <rob@landley.net>
Subject: Re: mainlining min-configs...
Date: Wed, 11 Jun 2008 00:17:32 -0500
Message-ID: <200806110017.32880.rob@landley.net>
References: <48447615.5050806@am.sony.com> <484EC576.5080302@am.sony.com> <20080610183004.GG11685@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080610183004.GG11685@cs181133002.pp.htv.fi>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Bunk <bunk@kernel.org>
Cc: Tim Bird <tim.bird@am.sony.com>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Tuesday 10 June 2008 13:30:04 Adrian Bunk wrote:
> On Tue, Jun 10, 2008 at 11:18:30AM -0700, Tim Bird wrote:
> > Adrian Bunk wrote:
> >...
> >
> > > You need both, and ideally constantly done by the same person against
> > > Linus' tree, -next and -mm.
> > >
> > > Where to get your minimal configs from at the start is just a small
> > > thing at the beginning - don't underestimate the required manual work
> > > that will have to be done each week.
> >
> > This is probably why I haven't signed up for this myself previously.
> > I'd be interested in finding out the rate at which defconfigs
> > bitrot in mainline.  My experience is that usually a 'make oldconfig'
> > will produce something usable.  But maybe that wouldn't be as
> > effective with a minconfig?
> >...
>
> Someone has to run the 'make oldconfig' for all configs...

Running "make oldconfig" isn't necessarily enough.  If you can't build the 
result, you don't really _know_ if it's going to work.

For example, in 2.6.23 new guard symbols showed up (CONFIG_BLK_DEV and 
CONFIG_SCSI_LOWLEVEL), meaning if you had stuff under those selected but they 
defaulted to off, everything under them would silently vanish.  (I don't 
remember what their defaults were, but I do remember it broke miniconfig.)

I need to go through and teach "make miniconfig" that when you set something 
inside a menu, you set its menu symbol as well (all the way up to root if 
necessary).  That would allow the resulting config to strip down to fewer 
symbols and not get broken by the addition of guard symbols between 
versions...

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
