From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: Recommendation for activating a deferred module init in the
 kernel
Date: Wed, 18 Jun 2008 13:37:56 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806181336410.13297@vixen.sonytel.be>
References: <4858AF6D.7040808@codefidence.com> <1213777222.26255.1161.camel@pmac.infradead.org>
 <20080618085233.GP25911@cs181133002.pp.htv.fi> <Pine.LNX.4.64.0806181056300.13297@vixen.sonytel.be>
 <1213783190.26255.1188.camel@pmac.infradead.org> <20080618103302.GA16139@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-1262999723-1213789076=:13297"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080618103302.GA16139@cs181133002.pp.htv.fi>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Gilad Ben-Yossef <gilad@codefidence.com>, Tim Bird <tim.bird@am.sony.com>, linux-embedded <linux-embedded@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-1262999723-1213789076=:13297
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 18 Jun 2008, Adrian Bunk wrote:
> On Wed, Jun 18, 2008 at 10:59:50AM +0100, David Woodhouse wrote:
> > On Wed, 2008-06-18 at 10:57 +0200, Geert Uytterhoeven wrote:
> > > On Wed, 18 Jun 2008, Adrian Bunk wrote:
> > > > You miss the size increase imposed by CONFIG_MODULES=y.
> > > > 
> > > > E.g. setting CONFIG_MODULES=y in the arm collie_defconfig will
> > > > increase the size of vmlinux by 14% (sic).
> > > > 
> > > > I haven't investigated why it takes that much space, but stuff like 
> > > > kernel/module.o taking 23kB and each EXPORT_SYMBOL requiring a few
> > > > bytes simply cannot be completely eliminated.
> > > 
> > > Sounds like we need a tool that strips out the unneeded symbols, given a list
> > > of modules?
> > 
> > And do the --gc-sections step again after that... :)
> 
> But even after all optimizations CONFIG_MODULES=y will still cause a 
> significant additional cost [1] when thinking in the dimensions of 
> Tim's "the 30 or so Linux-tiny patches that I use get me about 110k of 
> reductions.  For me, this is about 5% of my kernel size" statement in 
> another thread.
> 
> [1] as I said, kernel/module.o alone takes 23kB

Which could be freed after the last module has been loaded?

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
---584349381-1262999723-1213789076=:13297--
