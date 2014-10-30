From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Thu, 30 Oct 2014 09:51:13 +0100
Message-ID: <CAMuHMdWFMa2ZYCY53XdfDeyhPtYOmbEBvV1bXG5NuOZ3YAS2sg@mail.gmail.com>
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
	<CAMuHMdVhfNAVdB3iHcyfXfjk1ES-bX9Xm5ySKND7qsHTFNL72Q@mail.gmail.com>
	<alpine.LFD.2.11.1410271546010.18007@knanqh.ubzr>
	<54517D1A.4030206@sonymobile.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=cG/8COHU7vTU89WZPW3e/bgN2joSMq/q0l+68l6SVmA=;
        b=HmVliiV6pvp2xxLY3LSihqQS7vBKR7KXzJLBZe7OFhvK4RbcuKXq/LA11Naje1fqfZ
         i4MICze1lo1od19lVPbUtMqypMuvg1DAhpO/RD+QwtehyMevFl5DocNGbe60grwYyGnb
         KJwbGf0FCxVXkpIRXpbDaBjbD55L/xipyNYeHD/enH4FIlZKzZ5XVkkv1G8YQ40TyoV2
         wuKNhfdi30xYGZGtvJCMs5bAqImrdIBIILYGg73ep5GKw6eH3RCSkx0PAaK03UnI10JH
         KbgSyfwBUFA1gSN9j4Bjc+5GTICLAD1xmrZqYrvTS99fjOznIUop+9e7HCgUxudWmqDL
         RolQ==
In-Reply-To: <54517D1A.4030206@sonymobile.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Bird <tim.bird@sonymobile.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, Rob Landley <rob@landley.net>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>

On Thu, Oct 30, 2014 at 12:49 AM, Tim Bird <tim.bird@sonymobile.com> wrote:
> The way the feature is expressed in the current code is that a
> set of drivers are marked for deferred initialization (I'll refer
> to this as issue 0).  Then, at boot: 1) most drivers are initialized
> normally, 2) user space is started, and then 3) user space indicates
> to the kernel that the deferred drivers should be initialized.

One (IMHO important) point in the current implementation is that the call
to free_initmem() is also delayed until after initialization of the
deferred drivers.

This is different from modular drivers, which are loaded after free_initmem().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
