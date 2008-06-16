From: Adrian Bunk <bunk@kernel.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded
	Maintainer(s)...)
Date: Mon, 16 Jun 2008 20:38:39 +0300
Message-ID: <20080616173839.GA19341@cs181133002.pp.htv.fi>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806121925.35883.rob@landley.net> <20080613145119.GF11760@nibiru.local> <200806160958.48157.neundorf@eit.uni-kl.de> <20080616160037.GD9141@nibiru.local>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080616160037.GD9141@nibiru.local>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Mon, Jun 16, 2008 at 06:00:37PM +0200, Enrico Weigelt wrote:
> * Alexander Neundorf <neundorf@eit.uni-kl.de> schrieb:
> 
> > > That's why I prefer an purely descriptive paragidm (= subset of
> > > delcarative, but practically no logic): a buildfile should only
> > > describe the package's structure (eg.: "i have some executable foo
> > > which consists of source [...] and imports libs [...]), so the
> > > buildtool (and user's config) can cope with it all.
> > 
> > This was also the plan for cmake when it was started. But it turned 
> > out that this is not enough, and for more complex projects some 
> > programming logic is required. So cmake turned from quite declarative 
> > to quite imperative over time.
> 
> And so you just open the Pandorra's Box again ;-o
> As soon as you try to build some one-fits-all-solution, you'll
> sooner or later run into similar problems as autoconf has.
> 
> I won't to that w/ my TreeBuild. It is intentionally limited on
> easily structured packages. People should either structure their
> packages properly use something else ;-P

For simple packages autoconf+automake+libtool is already near at your
descriptive paragidm.

And despite all nasty details of autoconf/automake/libtool they also 
have advantages:
- they are quite powerful when you know how to handle them
- they allow to build your software on non-Linux systems
- they are the de-facto standard in the open source world, and everyone
  building open source software knows them

And the last point is a very important one:

For me as someone who is often compiling software your plan of creating 
yet another build tool I have to handle does not sound like a good idea.

> cu

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

