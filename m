From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: Module init for compiled in vs loaded modules
Date: Wed, 20 Aug 2008 11:06:32 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0808201104131.4596@vixen.sonytel.be>
References: <487558.67644.qm@web63404.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-1264883109-1219223192=:4596"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <487558.67644.qm@web63404.mail.re1.yahoo.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Fundu <fundu_1999@yahoo.com>
Cc: linux embedded <linux-embedded@vger.kernel.org>, Amol Lad <amol.lad@gmail.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-1264883109-1219223192=:4596
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 19 Aug 2008, Fundu wrote:
> > linux/init.h:
> > 
> > #ifndef MODULE
> > ...
> > #define module_init(x)  __initcall(x);
> > #define __initcall(fn) device_initcall(fn)
> > #define device_initcall(fn)    
> > __define_initcall("6",fn)
> > #define __define_initcall(level,fn) \
> >     static initcall_t __initcall_##fn __attribute_used__
> > \
> >     __attribute__((__section__(".initcall" level
> > ".init"))) = fn
> > ...
> > #endif
> > 
> > initcalls are processed in do_initcalls function in
> > init/main.c
> > 
> > static void __init do_basic_setup(void)
> > {
> >     ....
> >     do_initcalls();
> > }
> > 
> > >
> > > thanks !
> > 
> > Amol
> thanks Rajat and Amol. 
> 
> One other question,
> 1) how does the kernel know which module to load first in order to satisfy dependencies issues ?

By looking at the needed symbols (cfr. depmod).

> 2) is there a way i could print the module init fn name from do_initcalls. to see in what order compiled in modules are called.

Add `initcall_debug' to the kernel command line (if you would have looked at
do_initcalls() and do_one_initcall(), you would have known).

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
---584349381-1264883109-1219223192=:4596--
