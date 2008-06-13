From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Fri, 13 Jun 2008 08:30:52 +0200
Message-ID: <200806130830.52734.neundorf@eit.uni-kl.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806122025.54791.rob@landley.net> <8bd0f97a0806121829o6138cb30se025fa3c29cdd1a8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0806121829o6138cb30se025fa3c29cdd1a8@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-embedded@vger.kernel.org

On Friday 13 June 2008 03:29:52 Mike Frysinger wrote:
> On Thu, Jun 12, 2008 at 9:25 PM, Rob Landley wrote:
> > He recently converted Battle for Wesnoth to use something called "s=
cons"
> > as its build system,=20

Battle of Wesnoth is currently converted to both Scons and CMake, and i=
n the=20
end they will decide about the winner.
(since Eric is good at arguing I guess it will be scons).

> > and apparently the resulting make stuff was 1/17th
> > the size of the original.
>
> probably because scons has ~1/17th the functionality of autotools.
> seriously, it's terrible. =20

I saw the presentation about scons by the main scons developer at FOSDE=
M this=20
year and it felt more like a library which you can use to create a=20
buildsystem, not like a ready-to-use buildsystem itself.

Alex
--=20
TU-Kaiserslautern
Lehrstuhl f=FCr Echtzeitsysteme
Postfach 3049
D-67653 Kaiserslautern
Germany

Tel: +49 (0)631 205 3644
=46ax: +49 (0)631 205 4199
--
To unsubscribe from this list: send the line "unsubscribe linux-embedde=
d" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
