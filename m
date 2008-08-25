From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Mon, 25 Aug 2008 11:37:34 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0808251136140.3893@vixen.sonytel.be>
References: <48AD00C4.6060302@gmail.com> <Pine.LNX.4.64.0808221650500.17105@vixen.sonytel.be>
 <6934efce0808220951i5a2cd6f9t70f9c522eae6f1d6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-351044936-1219657054=:3893"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <6934efce0808220951i5a2cd6f9t70f9c522eae6f1d6@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-351044936-1219657054=:3893
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Aug 2008, Jared Hulbert wrote:
> > The version in SVN seems to be slightly older than the one you submitted?
> 
> Oops.  Okay I must have neglected to sync at the very end.  Thanks.
> 
> I forgot, there is also a git repo at
> 
> git://git.infradead.org/users/jehulber/axfs.git
> 
> > Which platform(s) do you use for testing?
> 
> ARM, x86

Ah, little endian.

From your good relationship with the s390 developers, I had hoped you would
have done some tests on s390 ;-)

> > I gave AxFS a try on PS3 (ppc64, always use big-endian 64-bit for testing new
> > code ;-).
> 
> Smart.  Hmmm, If only I had a PS3....
> 
> > When mounting the image, I got the crash below:
> 
> > When mounting (also on PS3) an image created on ia32, I get a different crash:
> >
> > | axfs: wrong magic
> >
> > So I guess some parts are not yet 64-bit or endian clean.
> 
> Can you run mkfs.axfs on the same trivial directory on both ia32 and
> PPC64 and then get me the resulting images?

I'll send them by private email.

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
---584349381-351044936-1219657054=:3893--
