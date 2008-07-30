From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: prevalence of C++ in embedded linux?
Date: Wed, 30 Jul 2008 14:48:22 +0200
Message-ID: <1217422102.7892.21.camel@spike.firmix.at>
References: <alpine.LFD.1.10.0807281142430.4286@localhost.localdomain>
	 <200807290951.34563.neundorf@eit.uni-kl.de>
	 <1217319612.24988.15.camel@spike.firmix.at>
	 <200807291058.06240.neundorf@eit.uni-kl.de>
	 <1217324838.24988.41.camel@spike.firmix.at>
	 <556445368AFA1C438794ABDA8901891C092D3CF7@USA0300MS03.na.xerox.net>
	 <e2e108260807292146n581b655an3119be9e33af871c@mail.gmail.com>
	 <20080730102523.GB8992@shareable.org>
	 <e2e108260807300404r65bfb2b2xfb07687601dc59da@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <e2e108260807300404r65bfb2b2xfb07687601dc59da@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bart Van Assche <bart.vanassche@gmail.com>
Cc: Jamie Lokier <jamie@shareable.org>, "Leisner, Martin" <Martin.Leisner@xerox.com>, Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

On Wed, 2008-07-30 at 13:04 +0200, Bart Van Assche wrote:
[...]
> I don't know whether C++ is intrinsic to GOLD's linking superiority.
> The reason I cited the GOLD project is because of the programming
> style of the GOLD source code. A quote from
> http://lwn.net/Articles/274859/, about the GOLD source code:
> 
> I looked through the gold sources a bit. I wish everything in the GNU
> toolchain were written this way. It is very clean code, nicely
> commented, and easy to follow. It shows pretty clearly, I think, the
> ways in which C++ can be better than C when it is used well.

If "GOLD" is as old and flexible (and portable?) as binutils, gcc and/or
other huge software maintained to death, it is probably similar complex
and odd.
If people take a > 10 year old tool and rewrite it from scratch, I would
assume that design is better.

And I can't see any direct dependence on the used programming
language(s) if one compares running code and what is left of "design"
after years of design extensions, changes, enhancements, etc. to a new
design from scratch from the lessons learned (hopefully) from the former
one.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

