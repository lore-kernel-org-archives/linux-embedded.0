From: Jamie Lokier <jamie@shareable.org>
Subject: Re: prevalence of C++ in embedded linux?
Date: Wed, 30 Jul 2008 13:38:27 +0100
Message-ID: <20080730123827.GA12252@shareable.org>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain> <200807290951.34563.neundorf@eit.uni-kl.de> <1217319612.24988.15.camel@spike.firmix.at> <200807291058.06240.neundorf@eit.uni-kl.de> <1217324838.24988.41.camel@spike.firmix.at> <556445368AFA1C438794ABDA8901891C092D3CF7@USA0300MS03.na.xerox.net> <e2e108260807292146n581b655an3119be9e33af871c@mail.gmail.com> <20080730102523.GB8992@shareable.org> <e2e108260807300404r65bfb2b2xfb07687601dc59da@mail.gmail.com> <20080730135834.74018bf6@hskinnemo-gx745.norway.atmel.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080730135834.74018bf6@hskinnemo-gx745.norway.atmel.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: Bart Van Assche <bart.vanassche@gmail.com>, "Leisner, Martin" <Martin.Leisner@xerox.com>, Bernd Petrovitsch <bernd@firmix.at>, Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

Haavard Skinnemoen wrote:
> "Bart Van Assche" <bart.vanassche@gmail.com> wrote:
> > I looked through the gold sources a bit. I wish everything in the GNU
> > toolchain were written this way. It is very clean code, nicely
> > commented, and easy to follow. It shows pretty clearly, I think, the
> > ways in which C++ can be better than C when it is used well.
> 
> I guess he never looked at the target interface...
>
> [snip virtual method with loads of arguments which looks like binutils]
>
> I can't wait to implement avr32 support for that monster...I thoroughly
> hate working on libbfd, and it looks like gold has made many of the
> same stupid decisions on the interface level.

> Just shows that using C++ doesn't fix a design that is broken to begin
> with.

The GNU Binutils requirement was to target lots of different object
formats, and architectures, allow different ones to be interconverted
and linked together, and to run on lots of platforms.

Given those constraints, probably C was the only option at the time,
and BFD's interface, although ugly and difficult to work with, does
reflect the abstractions of different object formats and architectures
moderately well IMHO.

It's tough to make a nice design that meets those requirements.

It's unfortunate that BFD is so hard to work with that people resort
to post-processing tools and other hacks, instead of enjoying adding
new format support to it.

For all it's faults working with it, the tools themselves are very
versatile and useful compared with most equivalents.

If you have clear improvements that would simplify GOLD (without
breaking it or requirements you might not be aware of), the author may
be quite receptive to them.  He seems keen on the code being of high
quality, and he's quite experienced at working on "open" projects with
many contributors.

-- Jamie
