From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: Some embedded topics
Date: Thu, 29 May 2008 11:31:45 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0805291130580.16206@vixen.sonytel.be>
References: <483C83DE.3040604@cisco.com> <8bd0f97a0805271527i622a31b8t68ba24c80a2e034a@mail.gmail.com>
 <20080527223142.GU26837@email.mot.com> <200805282201.48746.rob@landley.net>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-1922630110-1212053505=:16206"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200805282201.48746.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Rob Landley <rob@landley.net>
Cc: T Ziomek <ctz001@email.mot.com>, Mike Frysinger <vapier.adi@gmail.com>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-1922630110-1212053505=:16206
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 28 May 2008, Rob Landley wrote:
> On Tuesday 27 May 2008 17:31:42 T Ziomek wrote:
> > If I understand correctly David is talking about logging some trace-like
> > info (so it exists before a HW watchdog expires), and having it somewhere
> > "safe" from being disturbed by a HW reset.
> 
> The standard way of doing this is to use the mem= kernel command line 
> parameter to tell the system it has less memory than it does, and using 
> what's left as a ramdisk.  Years ago I saw some userspace thing running as 
> root mmap() /dev/mem (or whatever they're calling it these days) and log to 
> it.  In theory you could even set the dmesg buffer up at the end of physical 
> memory with a smallish kernel patch, make it big, and set the kernel to doing 
> verbose printks.
> 
> The trick is A) knowing the absolute physical address at which your debug 
> buffer lives so you can find it after the reboot, B) convincing the system to 
> do something useful with it on reboot rather than just overwriting it with 
> fresh log data.

Yep, we've been doing this on Amiga for more than a decade, when `debug=mem' is
passed. Cfr. arch/m68k/tools/amiga/dmesg.c.

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
---584349381-1922630110-1212053505=:16206--
