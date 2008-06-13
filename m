From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded
	Maintainer(s)...)
Date: Fri, 13 Jun 2008 20:51:57 +0200
Message-ID: <20080613185157.GT13599@pengutronix.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806122025.54791.rob@landley.net> <8bd0f97a0806121829o6138cb30se025fa3c29cdd1a8@mail.gmail.com> <200806130830.52734.neundorf@eit.uni-kl.de>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200806130830.52734.neundorf@eit.uni-kl.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Neundorf <neundorf@eit.uni-kl.de>
Cc: linux-embedded@vger.kernel.org

On Fri, Jun 13, 2008 at 08:30:52AM +0200, Alexander Neundorf wrote:
> Battle of Wesnoth is currently converted to both Scons and CMake, and
> in the end they will decide about the winner. (since Eric is good at
> arguing I guess it will be scons).

The thing is that 'configure && make && make install' plus the usuall
--enable-foo / --disable-foo / --with-bla=blub semantics is simply *the*
standard way of configuring stuff for unix systems. You don't need fancy
tools, you get cross compiling almost for free and unix people simply
know how to use it.

All the cool kids out there who think they know everything better
usually start with "I hate autotools", then invent something which
solves 0.1% of the problems (including their very special problem) and
tell the rest of the world that their shiny new tools is *soooo cooool*.

Been there, seen that. I maintain > 500 packets in PTXdist and guess
which ones make 90% of the problems. Hint: they are not related to
autotools ...

rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9

