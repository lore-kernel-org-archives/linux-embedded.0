From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH] console - Add configurable support for console charset
 translation
Date: Mon, 9 Jun 2008 13:51:16 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806091349370.17741@vixen.sonytel.be>
References: <48447615.5050806@am.sony.com> <200806041236.12349.rob@landley.net>
 <20080605004630.GA26259@linux-sh.org> <200806051835.57140.rob@landley.net>
 <484A0207.4000405@zytor.com> <20080609113856.GD25541@shareable.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-990899504-1213012276=:17741"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080609113856.GD25541@shareable.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Jamie Lokier <jamie@shareable.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Rob Landley <rob@landley.net>, Paul Mundt <lethal@linux-sh.org>, linux-embedded <linux-embedded@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-990899504-1213012276=:17741
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 9 Jun 2008, Jamie Lokier wrote:
> The uClinux devices I ship do have that.  System console is the serial
> port on a board header.  But field engineers are instructed to plug in
> a USB keyboard and Alt-F2 to get a diagnostic screen (we call it a
> "shell" ;-).  Occasionally even customers with specific requirements
> get to use that.
> 
> We had to patch the kernel to get the combination of virtual terminal
> capability on a framebuffer, but system console messages not to the
> framebuffer.  The uClinux (2.4.x) disables system console on a virtual
> terminal, but due to some confusion(*), it has the side effect that
> you can't attach a VT to a framebuffer at all.  Several howtos provide
> a "con2fb" program which didn't work with uClinux.  We had to fix that.

I think this is due to using 2.4.

In 2.6, al you have to do is pass `console=ttyS0' (replace `ttyS0' by your
serial port device) to the kernel, and system console messages will no longer
appear on the frame buffer (unless you add an explicit `console=tty0').
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
---584349381-990899504-1213012276=:17741--
