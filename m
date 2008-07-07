From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: building Rootfs
Date: Mon, 7 Jul 2008 23:21:50 +0200
Message-ID: <20080707212150.GK4319@pengutronix.de>
References: <BAY131-W252EE4B85EEB3F7A87466FE2940@phx.gbl> <4871E98F.8030802@gmail.com> <20080707181018.GG4319@pengutronix.de> <63386a3d0807071334q2242ac45x540cee2a3fcb231b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <63386a3d0807071334q2242ac45x540cee2a3fcb231b@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: linux-embedded@vger.kernel.org, r.schwebel@pengutronix.de

On Mon, Jul 07, 2008 at 10:34:11PM +0200, Linus Walleij wrote:
> Robert, can you brief us of how ptxdist fits together with
> OpenEmbedded? What does these two projects actually share? Where do
> they do similar things in parallel for example?

They are both build systems for userlands, or whole embedded linux
systems. I cannot speak for OE as I don't really know it in detail.

The idea behind ptxdist is executable documentation. If you use Open
Source software for business critical industrial applications, having
control over the source is an important thing. So our customers are
usually able to reproduce their root filesystems with one "ptxdist go"
directly from the sources. Our design criteria are

- things are highly configurable
- you have to find out what was done why
- going the mainline way where ever possible
- use proven technology (ptxdist is written in bash & gnu make)

> I'm trying - real hard - to get an idea of how people out there prefer
> to build their root filesystems in cross-compiled environments.

Well, I still havn't seen a real argument against it. At least not for
our usecases.

> Rob Landley recently wrote up a small blurb on why native
> compilation is the way to go, and a small roadmap on how
> he intended to get there using e.g. Qemu and Firmware Linux,
> c.f: http://www.landley.net/code/firmware/about.html
> which finally won me over to that line of thinking.
> Debian and friends obviously go this way now.

Cool, so what do we do for platforms like Blackfin, or any of the random
ARM processors out there, write qemu support first? Sorry, you cannot
really suggest this. Not with Qemu being in such a crude state that it
can not even be built with modern compilers.

Being able to be cross compiled is actually a *feature* of unix
software, be it autotoolized or not. And, in reality, the problems which
usually come up in these 'build native' discussions are very often
academic.

> However, when it comes to the widespread and much fragmented ways of
> cross-compiling a rootfs, including the stuff put together by
> MontaVista, WR and all those animals in the forest, obviously based on
> RPM (build systems I haven't put my hands inside, since they are
> proprietary) there seems to be very little consensus.

Well, the consensus is usually configure && make && make install. If
people just wouldn't assume that they know it better than autotools ...

But don't let us start a flamewar in this direction here. It doesn't
bring us anywhere.

> ptxdist stands out but do you get a lot of outside contributions for
> it? As it looks it seems you're running it yourself. (Beware: I
> haven't looked close.)

Oh, we have quite a bunch of contributions from the outside, and almost
200 people on the mailing list. It goes up and down, there are times
where we get more contributions from the customers, then from the
community, but in general it works really good.

Note that it is a tool to solve *our* problems (which consist of making
reproducable embedded linux systems for our customers, while being able
to fix problems as they arise). And it solves them very, very well.

> What else is there out there for rootfs, really? A hack from every
> embedded company there is?

PTXdist doesn't invent something new, it just exercises the usual
configure && make && make install canon, in a reproducable way. Nothing
more and nothing less. It is completely open, being GPL, so you can
freely choose if you accept realizing it being on the way to world
domination or not :-)

It's not even focussed on building root filesystems. We also use it to
build cross compilers and well defined Eclipse installations.

> I'm more after what people actually *use* and what is community driven
> here, not so much opinions on what is best (which will probably be the
> unwanted side effect of this mail anyway...)

PTXdist is in use and community driven, so it migth be worth a look :-)

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
