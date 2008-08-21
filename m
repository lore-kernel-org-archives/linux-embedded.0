From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 16:49:40 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0808211641150.20704@vixen.sonytel.be>
References: <48AD00C4.6060302@gmail.com> <20080821083916.GF5706@disturbed>
 <6934efce0808210719s6458dc77w2c0755a4bf90bf8a@mail.gmail.com>
 <c384c5ea0808210731k17ccc836u60c4803c3abfea31@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-1853657733-1219330180=:20704"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <c384c5ea0808210731k17ccc836u60c4803c3abfea31@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Cc: Jared Hulbert <jaredeh@gmail.com>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-1853657733-1219330180=:20704
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 21 Aug 2008, Leon Woestenberg wrote:
> On Thu, Aug 21, 2008 at 4:19 PM, Jared Hulbert <jaredeh@gmail.com> wrote:
> >> FWIW, I'm not sure it's a good idea to name this new filesystem AXFS.
> >> People are almost certainly going to confuse it with XFS despite
> >
> People that care about their filesystem choice know their choices.
> People that don't
> care, well they don't care.
> 
> Maybe AXIPFS would be the close alternative.

It seems to be useful for non-XIP, too...

> One question on the use-case profiling and subsequent image rebuild:
> 
> What if the use-case did not cover all cases of XIP use?
> 
> If a compressed page is attempted to be executed, will the filesystem
> fall back to decompression to RAM and execution from RAM, or will this
> result in a faulty system?
> 
> The design choices look real good. Congrats on the achievement.

You probably want to read the paper at
http://ols.fedoraproject.org/OLS/Reprints-2008/hulbert-reprint.pdf

BTW, I regret now not having attended the OLS presentation, because there was
so much emphasis on `XIP' in the description :-)

Fortunately it's been recorded:

http://free-electrons.com/community/videos/conferences/

so I'm gonna watch it right now...

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
---584349381-1853657733-1219330180=:20704--
