From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH] embedded: fix vc_translate operator precedence
Date: Mon, 4 Aug 2008 10:29:59 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0808041028230.31424@vixen.sonytel.be>
References: <48937AAE.5070407@am.sony.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-1437824883-1217838599=:31424"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48937AAE.5070407@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-1437824883-1217838599=:31424
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

	Hi Tim,

On Fri, 1 Aug 2008, Tim Bird wrote:
> This patch was copied to the e-mail list previously for testing.  Now,
> all reports confirm that it works, so this is an official post for
> application.

The above paragraph is not part of the patch description and should not end up
in the git history, so it should be below the first `---' and above the
diffstat, i.e.

> Signed-off-by: Tim Bird <tim.bird@am.sony.com>
> ---

---> here

>  vt_kern.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
---584349381-1437824883-1217838599=:31424--
