From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: mainlining min-configs...
Date: Tue, 10 Jun 2008 13:16:05 +0900
Message-ID: <20080610041605.GA19247@linux-sh.org>
References: <48447615.5050806@am.sony.com> <20080604194002.GF4189@cs181133002.pp.htv.fi> <4849CCA3.7040102@am.sony.com> <200806062329.54019.rob@landley.net> <484DDAD9.2000306@am.sony.com> <1213067676.3213.27.camel@moss.renham>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1213067676.3213.27.camel@moss.renham>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Nizette <bn@niasdigital.com>
Cc: Tim Bird <tim.bird@am.sony.com>, Rob Landley <rob@landley.net>, Adrian Bunk <adrian.bunk@movial.fi>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Tue, Jun 10, 2008 at 01:14:36PM +1000, Ben Nizette wrote:
> On Mon, 2008-06-09 at 18:37 -0700, Tim Bird wrote:
> > Rob Landley wrote:
> > > On Friday 06 June 2008 18:47:47 Tim Bird wrote:
> > >> At a minimum, it would be nice to have a few nice examples
> > >> of really, really small configs for things like qemus for different
> > >> architectures (just to give embedded developers who are working
> > >> on size a starting point).
> > > 
> > > That's more or less what I'm trying to do with my Firmware Linux project: 
> > > creating cross compilers and minimal native build environments for every qemu 
> > > target.
> > 
> > Any chance of getting your minimal configs from Firmware Linux mainlined?
> 
> allnoconfig? ;-)
> 
It's a bit counter-intuitive, given the inverted logic employed by many
Kconfig options (enable vs disable and so on), default choices, select
abuse, etc. If your platform happens to select EMBEDDED it's a pretty
close approximation, though.

> > Does anyone else think this would be valuable?  If not in mainline, it
> > would be nice to collect them somewhere, to compare what options different
> > developers decide turn on or off.
> 
> Seriously though I maintain a bunch of AVR32 minimal configs.  I keep
> them as a smallest-working-config baseline to build on; I'm sure others
> would get value from having easy access to that kind of thing.
> 
> IMO It'd be nice to wire them to an automagic bloat-o-meter as well, but
> I suspect no-one would really take notice anyway.
> 
Most people are not opposed to taking additional defconfigs if there's
someone intends to use them and generally look after them. Many configs
are already included in linux-next and similar for nightly builds, but
that's more about making sure things keep working rather than size
measurements. On the other hand, it would be useful to extend that sort
of infrastructure to account for size changes, also, and there's
certainly no reason why minimal configs can't be rolled in, too.

For testing things like allmodconfig/allyesconfig and especially
randconfigs tend to be the most useful, but it's fairly difficult to
extract meaningful size statistics out of any of those. Likewise, a
minimal config tends to be pointless to the extent that it's not actually
useful for anything. Observing the growth in size on configurations that
people are using in the real world is far more useful. Measuring
arbitrary growth in a configuration that's not even usable isn't really
much of an indicator of anything, except that someone might have too much
free time on their hands.
