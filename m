From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Fri, 24 Oct 2014 22:28:53 +0200
Message-ID: <CAMuHMdVhfNAVdB3iHcyfXfjk1ES-bX9Xm5ySKND7qsHTFNL72Q@mail.gmail.com>
References: <5441F592.6090807@gmail.com>
	<nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
	<CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com>
	<alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr>
	<F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net>
	<alpine.LFD.2.11.1410211545330.6969@knanqh.ubzr>
	<5447C7BE.60506@landley.net>
	<alpine.LFD.2.11.1410221137000.6969@knanqh.ubzr>
	<F5184659D418E34EA12B1903EE5EF5FD01BCD433E688@seldmbx02.corpusers.net>
	<alpine.LFD.2.11.1410231334250.6969@knanqh.ubzr>
	<20141023181336.GC10477@piout.net>
	<alpine.LFD.2.11.1410231420080.6969@knanqh.ubzr>
	<F5184659D418E34EA12B1903EE5EF5FD01BCD433E68C@seldmbx02.corpusers.net>
	<alpine.LFD.2.11.1410231616570.6969@knanqh.ubzr>
	<54498344.8080507@landley.net>
	<alpine.LFD.2.11.1410231847400.6969@knanqh.ubzr>
	<544AAA9F.8060808@landley.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=o+oYRU/qG4SOc7Pq5e5SzAR/KuWUFZljLqhu6YqinHs=;
        b=uuDCrwq+duvnX80Hc3+0Xge5IZVIvOIEexZe/CIql6Rmgcb7sGZITWPTIQVOI9dLfL
         IiN5pYPjoFkbZFjt9r0JejbFkWgxgjYFiA0AfUQyo92xznZxDhygELd9Xv8v6oBWH153
         qxO/vnShS7Pl6THP365PdxynP/H8DVRo1lKKD06QtyEbwM99ef7t5EAYRscZQxCddZN3
         B45vjowsxDPLs9vPnkxzTo7RMxYZaolID/se6WQdAxwoSS7NR9xWQ34Zy9HrXTOq3BF9
         YJ1eWe6+tdslAsSmr9LSMT7t3OdMdvfNI29BWIIVpl8/vBHTHalLkowVNdSao70VqlQB
         K/Bg==
In-Reply-To: <544AAA9F.8060808@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Nicolas Pitre <nico@fluxnic.net>, "Bird, Tim" <Tim.Bird@sonymobile.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>

On Fri, Oct 24, 2014 at 9:38 PM, Rob Landley <rob@landley.net> wrote:
> I'm going to recuse myself from the rest of this thread because I'm
> clearly getting annoyed with us talking past each other. Somebody's got
> an actual patch (which they still haven't linked to). I'll shut up and
> let them show you the code.

Several patches are linked from
http://elinux.org/Deferred_Initcalls

Latest version is
http://elinux.org/images/5/51/0001-Port-deferred-initcalls-to-3.10.patch

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
