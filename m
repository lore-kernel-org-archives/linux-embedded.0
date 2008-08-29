From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH 10/10] AXFS: axfs_uncompress.c
Date: Fri, 29 Aug 2008 15:48:07 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0808291547270.10397@vixen.sonytel.be>
References: <48AD0126.1050609@gmail.com> <1219318838.18027.68.camel@sauron>
 <Pine.LNX.4.64.0808211423360.20704@vixen.sonytel.be>
 <6934efce0808210735w479075abga9f660e42ab8935d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-2081338970-1220017657=:10397"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <6934efce0808210735w479075abga9f660e42ab8935d@mail.gmail.com>
Content-ID: <Pine.LNX.4.64.0808291547430.10397@vixen.sonytel.be>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Artem Bityutskiy <dedekind@infradead.org>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-2081338970-1220017657=:10397
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-ID: <Pine.LNX.4.64.0808291547431.10397@vixen.sonytel.be>

	Hi Jared,

On Thu, 21 Aug 2008, Jared Hulbert wrote:
> > If you want support for multiple decompression algorithms, you can switch
> > from using zlib_inflate*() directly to calling zlib through the crypto API.
> > Then you can call crypto_alloc_comp() with the correct decompression algorithm
> > name.
> >
> > For squashfs, I had to modify only ca. 40 lines of code.
> 
> I definately want to support multiple formats.  I have a flag in the
> superblock all ready to go for that.  One problem.  I'm not sure how
> to do it.  Can you point us to some reference code?

Please take a look at the email with subject

    [patch 3/3] squashfs: Switch from zlib/inflate to "zlib" crypto module

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
---584349381-2081338970-1220017657=:10397--
