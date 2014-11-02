From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Sat, 01 Nov 2014 22:37:33 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1411012233090.11690@knanqh.ubzr>
References: <5441F592.6090807@gmail.com>
 <alpine.LFD.2.11.1410211230500.6969@knanqh.ubzr>
 <F5184659D418E34EA12B1903EE5EF5FD01BCD433E681@seldmbx02.corpusers.net>
 <alpine.LFD.2.11.1410211545330.6969@knanqh.ubzr> <5447C7BE.60506@landley.net>
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
 <CAMuHMdWFMa2ZYCY53XdfDeyhPtYOmbEBvV1bXG5NuOZ3YAS2sg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <CAMuHMdWFMa2ZYCY53XdfDeyhPtYOmbEBvV1bXG5NuOZ3YAS2sg@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tim Bird <tim.bird@sonymobile.com>, Rob Landley <rob@landley.net>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>

On Thu, 30 Oct 2014, Geert Uytterhoeven wrote:

> On Thu, Oct 30, 2014 at 12:49 AM, Tim Bird <tim.bird@sonymobile.com> wrote:
> > The way the feature is expressed in the current code is that a
> > set of drivers are marked for deferred initialization (I'll refer
> > to this as issue 0).  Then, at boot: 1) most drivers are initialized
> > normally, 2) user space is started, and then 3) user space indicates
> > to the kernel that the deferred drivers should be initialized.
> 
> One (IMHO important) point in the current implementation is that the call
> to free_initmem() is also delayed until after initialization of the
> deferred drivers.
> 
> This is different from modular drivers, which are loaded after free_initmem().

This is because modules have their __initmem sections freed right after 
each module is initialized.

The deferred initcalls could also have a separate initmem section which 
freeing is also deferred.  But I don't think it makes such a big 
difference in the end.


Nicolas
