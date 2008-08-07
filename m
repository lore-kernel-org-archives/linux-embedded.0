From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: kernel command line from u-boot
Date: Thu, 7 Aug 2008 16:18:59 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0808071618120.9798@vixen.sonytel.be>
References: <8c675e9b0808062141s74f1a7bfob5cab6b23b0268d3@mail.gmail.com>
 <Pine.LNX.4.64.0808071050280.9798@vixen.sonytel.be>
 <8c675e9b0808070427v42a4055bwae3adfb160a4e1ab@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-188428932-1218118739=:9798"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8c675e9b0808070427v42a4055bwae3adfb160a4e1ab@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Amol Lad <amol.lad@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-188428932-1218118739=:9798
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 7 Aug 2008, Amol Lad wrote:
> > Probably nobody noticed as this part of the code takes care of the
> > `obsolete-style' parameters. `module_param' is the new way.
> 
> Ohh, btw how module_param is different from obsolete style paramaters
> ? Do we need to pass arguments to kernel from bootloader using a
> different method for getting them processed using module_param ?

Documentation/kernel-parameters.txt:

Module parameters for loadable modules are specified only as the
parameter name with optional '=' and value as appropriate, such as:

        modprobe usbcore blinkenlights=1

Module parameters for modules that are built into the kernel image
are specified on the kernel command line with the module name plus
'.' plus parameter name, with '=' and value if appropriate, such as:

        usbcore.blinkenlights=1

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
Fortis 293-0376800-10 GEBA-BE-BB
---584349381-188428932-1218118739=:9798--
