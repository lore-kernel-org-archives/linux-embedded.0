From: "Linus Walleij" <linus.ml.walleij@gmail.com>
Subject: Re: building Rootfs
Date: Mon, 7 Jul 2008 22:34:11 +0200
Message-ID: <63386a3d0807071334q2242ac45x540cee2a3fcb231b@mail.gmail.com>
References: <BAY131-W252EE4B85EEB3F7A87466FE2940@phx.gbl>
	 <4871E98F.8030802@gmail.com> <20080707181018.GG4319@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=RR95M4NN131aSidqLQnwgp1P//7ZF2vt8LOQ8RNJZyo=;
        b=EQ4BR3hiMI6n/Bmz+TLGOVW4JYOYVjTCIQ2pZ4PYzO1JxaBOxUw6dBEtibm1C6Bnvc
         Gm3Auahp+G2nEDQ2kWYgKFuSg5xR8FZcPPWPrlmUvD/YjE7sWNJPwmpqaUNXwnJu8+Qd
         AFnJ0+RhcW7MSNnfhxUhokT9FM29rOIZU8J6c=
In-Reply-To: <20080707181018.GG4319@pengutronix.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org, r.schwebel@pengutronix.de

OK Robert wrote this on ARM-Linux mailinglist but the discussion
belongs on linux-embedded, so I'm moving it there, the suggested
ptxdist ML seems inapropriate for the entire embedded
community.

2008/7/7 Robert Schwebel <r.schwebel@pengutronix.de>:

> On Mon, Jul 07, 2008 at 06:01:51PM +0800, Eric Miao wrote:
>> or start from buildroot, scratchbox and openembedded as a tool, you've
>> really got a lot to learn :-)
>
> Or ptxdist, or course :-)

Robert, can you brief us of how ptxdist fits together with
OpenEmbedded? What does these two projects actually
share? Where do they do similar things in parallel for
example?

I'm trying - real hard - to get an idea of how people out
there prefer to build their root filesystems in cross-compiled
environments.

Rob Landley recently wrote up a small blurb on why native
compilation is the way to go, and a small roadmap on how
he intended to get there using e.g. Qemu and Firmware Linux,
c.f: http://www.landley.net/code/firmware/about.html
which finally won me over to that line of thinking.
Debian and friends obviously go this way now.

However, when it comes to the widespread and much
fragmented ways of cross-compiling a rootfs, including the
stuff put together by MontaVista, WR and all those animals
in the forest, obviously based on RPM (build systems I
haven't put my hands inside, since they are proprietary)
there seems to be very little consensus. ptxdist stands out
but do you get a lot of outside contributions for it? As it
looks it seems you're running it yourself. (Beware: I
haven't looked close.)

What else is there out there for rootfs, really? A hack
from every embedded company there is? I'm more after
what people actually *use* and what is community driven
here, not so much opinions on what is best (which will
probably be the unwanted side effect of this mail
anyway...)

Linus
