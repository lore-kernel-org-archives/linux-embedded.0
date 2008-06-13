From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded
 Maintainer(s)...)
Date: Fri, 13 Jun 2008 13:14:52 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806131314270.2141@vixen.sonytel.be>
References: <1209577322.25560.402.camel@pmac.infradead.org>
 <200806102235.09598.rob@landley.net> <484F66F8.4020409@snapgear.com>
 <200806111941.51221.rob@landley.net> <48513F5A.6010008@am.sony.com>
 <1213285831.26255.152.camel@pmac.infradead.org>
 <8bd0f97a0806120905u532ce5f9sf231e185173de791@mail.gmail.com>
 <alpine.LFD.1.10.0806121208320.22877@localhost.localdomain>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-497380002-1213355692=:2141"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.1.10.0806121208320.22877@localhost.localdomain>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Mike Frysinger <vapier.adi@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Tim Bird <tim.bird@am.sony.com>, Rob Landley <rob@landley.net>, Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, linux-embedded@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-497380002-1213355692=:2141
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 12 Jun 2008, Robert P. J. Day wrote:
> On Thu, 12 Jun 2008, Mike Frysinger wrote:
> > On Thu, Jun 12, 2008 at 11:50 AM, David Woodhouse wrote:
> > > If we just made people write portable code and proper Makefiles,
> > > it would be less of an issue :)
> >
> > people cant even write proper *native* makefiles.  mtd-utils for
> > example ;).
> 
> meooowww!  :-)  but at the risk of dragging this even further
> off-topic, i am *constantly* asked by people how to set up makefiles
> for their software project, and what would be nice is a small
> collection of examples of a makefile (or makefiles) done *right*.  as
> in, properly recursive, supports cross-compiling without having to
      ^^^^^^^^^^^^^^^^^^
      Ugh?

> remove your left nad, etc, etc.
> 
> so ... would anyone like to recommend a software package or two
> somewhere whose makefile(s) is/are, ITHO, done well?  that i/we could
> just point at and say, "do it like that!"  anyone?  anyone?  bueller?

The kernel, except that it's still recursive?

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

Sony Technology and Software Centre Europe
A division of Sony Service Centre (Europe) N.V.
Registered office: Technologielaan 7 · B-1840 Londerzeel · Belgium
VAT BE 0413.825.160 · RPR Brussels
Fortis 293-0376800-10 GEBA-BE-BB
---584349381-497380002-1213355692=:2141--
