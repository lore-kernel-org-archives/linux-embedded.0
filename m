From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Mon, 27 Oct 2014 16:29:10 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1410271546010.18007@knanqh.ubzr>
References: <5441F592.6090807@gmail.com>
 <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
 <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <CAMuHMdVhfNAVdB3iHcyfXfjk1ES-bX9Xm5ySKND7qsHTFNL72Q@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Landley <rob@landley.net>, "Bird, Tim" <Tim.Bird@sonymobile.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>

On Fri, 24 Oct 2014, Geert Uytterhoeven wrote:

> Several patches are linked from
> http://elinux.org/Deferred_Initcalls
> 
> Latest version is
> http://elinux.org/images/5/51/0001-Port-deferred-initcalls-to-3.10.patch

In the hope of providing some constructive and concrete feedback to this 
thread, here's what I have to say about the patch linked above ( I 
looked only at the latest version):

- Commented out code is not acceptable for mainline. But everyone knows 
  that already.

- Returning a null byte through the /proc file is dubious.

- The /proc interface is probably not the best. I'd go with an entry in 
  /sys/kernel instead.

- If the deferred_initcall section is empty, this could return 1 upfront 
  and do the free_initmem() earlier as it used to.

- It was mentioned somewhere that the config system could use a 4th 
  state in addition to n, m and y.  That would be required before this 
  goes upstream simply to express all the dependencies between modules.  
  Right now if a core module is configured with m, then all the 
  submodules that depend on it inherit the modular-only restriction.  
  The same would need to be enforced for deferred initcalls.

- Currently all deferred initcalls are lumped together in a single 
  section with no regards to the original initcall level. This is likely 
  to cause trouble if two initcalls are called in a different order than 
  intended. Nothing prevents that from happening right now.

This patch is still not generic enough for mainline inclusion IMHO.  It 
currently falls in the "you better know what you're doing" category and 
that is possibly good enough for its actual users.  Trying to make this 
more generic is going to require some more work.  And this would have to 
come with serious arguments explaining why simply using modules in the 
first place is not acceptable.


Nicolas
