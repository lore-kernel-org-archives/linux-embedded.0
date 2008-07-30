From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: prevalence of C++ in embedded linux?
Date: Wed, 30 Jul 2008 15:01:38 +0200
Message-ID: <20080730150138.5b5e558e@hskinnemo-gx745.norway.atmel.com>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain>
	<200807290951.34563.neundorf@eit.uni-kl.de>
	<1217319612.24988.15.camel@spike.firmix.at>
	<200807291058.06240.neundorf@eit.uni-kl.de>
	<1217324838.24988.41.camel@spike.firmix.at>
	<556445368AFA1C438794ABDA8901891C092D3CF7@USA0300MS03.na.xerox.net>
	<e2e108260807292146n581b655an3119be9e33af871c@mail.gmail.com>
	<20080730102523.GB8992@shareable.org>
	<e2e108260807300404r65bfb2b2xfb07687601dc59da@mail.gmail.com>
	<20080730135834.74018bf6@hskinnemo-gx745.norway.atmel.com>
	<20080730123827.GA12252@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080730123827.GA12252@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Bart Van Assche <bart.vanassche@gmail.com>, "Leisner, Martin" <Martin.Leisner@xerox.com>, Bernd Petrovitsch <bernd@firmix.at>, Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

Jamie Lokier <jamie@shareable.org> wrote:
> The GNU Binutils requirement was to target lots of different object
> formats, and architectures, allow different ones to be interconverted
> and linked together, and to run on lots of platforms.

The Linux kernel also meets those requirements (the ones that are
relevant for a kernel that is.)

> Given those constraints, probably C was the only option at the time,
> and BFD's interface, although ugly and difficult to work with, does
> reflect the abstractions of different object formats and architectures
> moderately well IMHO.

Well, I guess it does work moderately well once you get used to it. But
there are lots of hidden dependencies all over the place. I still
haven't figured out how to un-break the debugging information after
relaxing, for example.

But what I disagree with is that these problems are somehow a symptom
of using C as the implementation language. They're a symptom of bad
design decisions IMO.

> It's tough to make a nice design that meets those requirements.

Absolutely. But does using C++ as an implementation language really
make it any easier?

> It's unfortunate that BFD is so hard to work with that people resort
> to post-processing tools and other hacks, instead of enjoying adding
> new format support to it.
> 
> For all it's faults working with it, the tools themselves are very
> versatile and useful compared with most equivalents.

Agreed. I definitely prefer using the GNU tools over the alternatives
I've seen. But that doesn't mean they can't be improved further.

> If you have clear improvements that would simplify GOLD (without
> breaking it or requirements you might not be aware of), the author may
> be quite receptive to them.  He seems keen on the code being of high
> quality, and he's quite experienced at working on "open" projects with
> many contributors.

Yeah, I suppose I should put my money where my mouth is and offer some
constructive suggestions. Right now I'm waiting for someone to get the
necessary paperwork in place so that we can work as closely with the
GNU community as we do with the Linux kernel and several other
communities.

Off the top of my head, after looking just at the target interface, I'd
really like to see
  * A few better abstractions so that the target relocation hooks
    don't need a gazillion parameters.
  * Some way to spread the target implementation across a few more
    files/classes so that we don't end up with a single
    several-thousand-lines file for each architecture. A subdir for each
    arch would be nice.

Currently, it looks like the target interface is headed down the same
road as libbfd, and that means the code will be just as unmanageable in
a few years.

I'm also curious about what things will look like once support for
complicated things like --relax and --gc-sections is added...

But I guess complaining about it here won't do much good.

Haavard
