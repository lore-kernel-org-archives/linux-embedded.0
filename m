From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: Adding a new platform
Date: Thu, 21 Aug 2008 10:46:48 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0808211044590.20704@vixen.sonytel.be>
References: <48AB0A7A.8040209@cisco.com> <7d1d9c250808192129j3fb7ef28p8f404c6affd82078@mail.gmail.com>
 <f608b67d0808192215q5b8ffbf0w70531c31cdd66bcd@mail.gmail.com>
 <200808211502.58206.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-1901667849-1219308408=:20704"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200808211502.58206.manningc2@actrix.gen.nz>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Charles Manning <manningc2@actrix.gen.nz>
Cc: vb <vb@vsbe.com>, Paul Gortmaker <paul.gortmaker@gmail.com>, Linux Embedded Maillist <linux-embedded@vger.kernel.org>, corbet@lwn.net

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-1901667849-1219308408=:20704
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 21 Aug 2008, Charles Manning wrote:
> On Wednesday 20 August 2008 17:15:01 vb wrote:
> > On Tue, Aug 19, 2008 at 9:29 PM, Paul Gortmaker
> >
> > <paul.gortmaker@gmail.com> wrote:
> > > On Tue, Aug 19, 2008 at 11:57 PM, vb <vb@vsbe.com> wrote:
> > >> so, say a developer submits a proprietary driver and it gets accepted.
> > >
> > > Doesn't happen.  By design.  If the driver is proprietary then it is
> > > presumably not meant for open distribution, and hence not compatible with
> > > GPL and widespread distribution into 100,000 public git repositories.  So
> > > it won't get submitted and it won't get accepted.
> >
> > I guess 'proprietary' is not the right term then, how do you call a
> > driver which is not a secret and not a problem to release, but
> > controls some hardware present in only in certain devices of a certain
> > company.
> >
> > Would such a driver be accepted? Wouldn't such a driver get stale
> > after a few kernel releases?
> 
> In-tree is no silver bullet.
> 
> When people modify internal APIs they will likely fix anything that breaks 
> compilation. However many things are more subtle than that and it is very 
> easy to end up with a driver or other code that compiles but does not work 
> properly.

My experience with Linux/m68k tells me that +95% of the breakage is visible
by compiler warnings and errors. If it still compiles, it still works ;-)

> Luckily APIs for drivers (the most common stuff that people work on) don't 
> change that much, and the interfaces are reasonably clear. If you want some 
> hell then try working on file systems :-).

Really? So how come so few changes are needed to keep squashfs working?

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 · RPR Brussels
Fortis · BIC GEBABEBB · IBAN BE41293037680010
---584349381-1901667849-1219308408=:20704--
