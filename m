From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: Some embedded topics
Date: Sat, 31 May 2008 15:32:05 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0805311528400.5249@vixen.sonytel.be>
References: <483C83DE.3040604@cisco.com> <8bd0f97a0805271527i622a31b8t68ba24c80a2e034a@mail.gmail.com>
 <20080527223142.GU26837@email.mot.com> <200805282201.48746.rob@landley.net>
 <Pine.LNX.4.64.0805291130580.16206@vixen.sonytel.be> <484086B8.4030909@am.sony.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-2065553068-1212240725=:5249"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <484086B8.4030909@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Tim Bird <tim.bird@am.sony.com>
Cc: Rob Landley <rob@landley.net>, T Ziomek <ctz001@email.mot.com>, Mike Frysinger <vapier.adi@gmail.com>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-2065553068-1212240725=:5249
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 30 May 2008, Tim Bird wrote:
> Geert Uytterhoeven wrote:
> > Yep, we've been doing this on Amiga for more than a decade, when `debug=mem'
> > is
> > passed. Cfr. arch/m68k/tools/amiga/dmesg.c.
> 
> Wow!  If tidbits like these are going to keep surfacing,
> I feel like maybe CELF should get someone to just
> permanently monitor this list and take interesting
> info like the above and put it on the elinux wiki.
> 
> There's a lot of interesting stuff flowing out of
> people's brains onto the list in the last few
> days....  It's great!
>  -- Tim
> 
> P.S. Is debug=mem something specific to Amiga?  I find
> no mention of it in Documentation/kernel-parameters.txt

It's supported on Amiga and Q40, although Q40 is not mentioned in
Documentation/m68k/kernel-options.txt.

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Network and Software Technology Center Europe
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

Sony Network and Software Technology Center Europe
A division of Sony Service Centre (Europe) N.V.
Registered office: Technologielaan 7 · B-1840 Londerzeel · Belgium
VAT BE 0413.825.160 · RPR Brussels
Fortis Bank Zaventem · BIC GEBABEBB08A · IBAN BE39001382358619
---584349381-2065553068-1212240725=:5249--
