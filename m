From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: cross-compiling alternatives
Date: Mon, 16 Jun 2008 10:33:34 +0200
Message-ID: <1213605214.1710.38.camel@tara.firmix.at>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806122025.54791.rob@landley.net>
	 <8bd0f97a0806121829o6138cb30se025fa3c29cdd1a8@mail.gmail.com>
	 <200806130830.52734.neundorf@eit.uni-kl.de>
	 <20080613185157.GT13599@pengutronix.de>
	 <20080613222523.GA28805@shareable.org>
	 <20080613231932.GW13599@pengutronix.de>
	 <20080614000749.GA30652@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080614000749.GA30652@shareable.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, Alexander Neundorf <neundorf@eit.uni-kl.de>, linux-embedded@vger.kernel.org

On Sam, 2008-06-14 at 01:07 +0100, Jamie Lokier wrote:
[...]
> You said about too many user-selectable options.  Many large packages

These are IME not a problem if they have somewhat sensible defaults.

> _check_ for many installed libraries.  Get them wrong, and you have
> the same problems of untested combinations.

As long as I can specify that libfoo support must be compiled in (and
thus libfoo must be present) and the tools throw an error if it doesn't
find it, I have no problem.
Otherwise all package builders have a serious problem.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


