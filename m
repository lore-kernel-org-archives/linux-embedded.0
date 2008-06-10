From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: mainlining min-configs...
Date: Tue, 10 Jun 2008 20:51:23 +0200
Message-ID: <20080610185123.GA15838@uranus.ravnborg.org>
References: <48447615.5050806@am.sony.com> <20080604194002.GF4189@cs181133002.pp.htv.fi> <4849CCA3.7040102@am.sony.com> <200806062329.54019.rob@landley.net> <484DDAD9.2000306@am.sony.com> <20080610083610.GC1987@cs181133002.pp.htv.fi> <484EC576.5080302@am.sony.com> <20080610183004.GG11685@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080610183004.GG11685@cs181133002.pp.htv.fi>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@kernel.org>
Cc: Tim Bird <tim.bird@am.sony.com>, Rob Landley <rob@landley.net>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Tue, Jun 10, 2008 at 09:30:04PM +0300, Adrian Bunk wrote:
> On Tue, Jun 10, 2008 at 11:18:30AM -0700, Tim Bird wrote:
> > Adrian Bunk wrote:
> >...
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
> 
> And no, you cannot get that completely automated.

When I get my kconfig patchset polished you will be able to do:

make K=my_mini_config allnoconfig

Thus selecting 'no' for all new symbols in an automated fashion.
I know that in a few cases 'no' is the wrong answer but in the
99% of the cases 'no' is perfectly valid.

	Sam
