From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [RFC 0/6] Proposal for a Generic PWM Device API
Date: Fri, 10 Oct 2008 11:00:09 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0810101054140.12257@vixen.sonytel.be>
References: <cover.1223482372.git.bgat@billgatliff.com> <1223608819.8157.127.camel@pasglop>
 <48EED4D1.2040506@billgatliff.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-1062284663-1223628975=:12257"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48EED4D1.2040506@billgatliff.com>
Content-ID: <Pine.LNX.4.64.0810101057030.12257@vixen.sonytel.be>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux-embedded@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-1062284663-1223628975=:12257
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-ID: <Pine.LNX.4.64.0810101057031.12257@vixen.sonytel.be>

On Thu, 9 Oct 2008, Bill Gatliff wrote:
> Benjamin Herrenschmidt wrote:
> > On Wed, 2008-10-08 at 11:43 -0500, Bill Gatliff wrote:
> >> This series proposes a "generic PWM" driver API.
> >>
> >> This proposed API is motivated by the author's need to support
> >> pluggable devices; a secondary objective is to consolidate the
> >> existing PWM implementations behind an agreeable, consistent,
> >> redundancy-reducing interface.
> > 
> >  .../...
> > 
> > You should send your patches to the main linux kernel list !
> 
> Perhaps.  But it seemed more relevant to this crowd, and the linux-embedded
> crowd, and the linux-arm-kernel crowd.

Were did you actually sent them to?  Apparently you sent them to each mailing
list (at least linux-embedded and linuxppc-dev) _separately_ (or using bcc).

Hence different people may give the same comments without knowing about each
other, and you may have to explain everything multiple times.

I would go for lkml and linux-embedded, _together_.

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
---584349381-1062284663-1223628975=:12257--
