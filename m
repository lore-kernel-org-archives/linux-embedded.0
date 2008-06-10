From: Ben Nizette <bn@niasdigital.com>
Subject: Re: mainlining min-configs...
Date: Tue, 10 Jun 2008 13:14:36 +1000
Message-ID: <1213067676.3213.27.camel@moss.renham>
References: <48447615.5050806@am.sony.com>
	 <20080604194002.GF4189@cs181133002.pp.htv.fi>
	 <4849CCA3.7040102@am.sony.com> <200806062329.54019.rob@landley.net>
	 <484DDAD9.2000306@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <484DDAD9.2000306@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Rob Landley <rob@landley.net>, Adrian Bunk <adrian.bunk@movial.fi>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>


On Mon, 2008-06-09 at 18:37 -0700, Tim Bird wrote:
> Rob Landley wrote:
> > On Friday 06 June 2008 18:47:47 Tim Bird wrote:
> >> At a minimum, it would be nice to have a few nice examples
> >> of really, really small configs for things like qemus for different
> >> architectures (just to give embedded developers who are working
> >> on size a starting point).
> > 
> > That's more or less what I'm trying to do with my Firmware Linux project: 
> > creating cross compilers and minimal native build environments for every qemu 
> > target.
> 
> Any chance of getting your minimal configs from Firmware Linux mainlined?

allnoconfig? ;-)

> 
> Does anyone else think this would be valuable?  If not in mainline, it
> would be nice to collect them somewhere, to compare what options different
> developers decide turn on or off.

Seriously though I maintain a bunch of AVR32 minimal configs.  I keep
them as a smallest-working-config baseline to build on; I'm sure others
would get value from having easy access to that kind of thing.

IMO It'd be nice to wire them to an automagic bloat-o-meter as well, but
I suspect no-one would really take notice anyway.

	--Ben.
