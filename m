From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Mon, 27 Oct 2014 22:37:31 +0100
Message-ID: <20141027213731.GA722@piout.net>
References: <alpine.LFD.2.11.1410231334250.6969@knanqh.ubzr>
 <20141023181336.GC10477@piout.net>
 <alpine.LFD.2.11.1410231420080.6969@knanqh.ubzr>
 <F5184659D418E34EA12B1903EE5EF5FD01BCD433E68C@seldmbx02.corpusers.net>
 <alpine.LFD.2.11.1410231616570.6969@knanqh.ubzr>
 <54498344.8080507@landley.net>
 <alpine.LFD.2.11.1410231847400.6969@knanqh.ubzr>
 <544AAA9F.8060808@landley.net>
 <CAMuHMdVhfNAVdB3iHcyfXfjk1ES-bX9Xm5ySKND7qsHTFNL72Q@mail.gmail.com>
 <alpine.LFD.2.11.1410271546010.18007@knanqh.ubzr>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.11.1410271546010.18007@knanqh.ubzr>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Landley <rob@landley.net>, "Bird, Tim" <Tim.Bird@sonymobile.com>, Grant Likely <grant.likely@secretlab.ca>, Borislav Petkov <bp@alien8.de>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "challinan@gmail.com" <challinan@gmail.com>

On 27/10/2014 at 16:29:10 -0400, Nicolas Pitre wrote :
> On Fri, 24 Oct 2014, Geert Uytterhoeven wrote:
> 
> > Several patches are linked from
> > http://elinux.org/Deferred_Initcalls
> > 
> > Latest version is
> > http://elinux.org/images/5/51/0001-Port-deferred-initcalls-to-3.10.patch
> 
> In the hope of providing some constructive and concrete feedback to this 
> thread, here's what I have to say about the patch linked above ( I 
> looked only at the latest version):
> 
> - Commented out code is not acceptable for mainline. But everyone knows 
>   that already.
> 
> - Returning a null byte through the /proc file is dubious.
> 
> - The /proc interface is probably not the best. I'd go with an entry in 
>   /sys/kernel instead.
> 
> - If the deferred_initcall section is empty, this could return 1 upfront 
>   and do the free_initmem() earlier as it used to.
> 
> - It was mentioned somewhere that the config system could use a 4th 
>   state in addition to n, m and y.  That would be required before this 
>   goes upstream simply to express all the dependencies between modules.  
>   Right now if a core module is configured with m, then all the 
>   submodules that depend on it inherit the modular-only restriction.  
>   The same would need to be enforced for deferred initcalls.
> 
> - Currently all deferred initcalls are lumped together in a single 
>   section with no regards to the original initcall level. This is likely 
>   to cause trouble if two initcalls are called in a different order than 
>   intended. Nothing prevents that from happening right now.
> 
> This patch is still not generic enough for mainline inclusion IMHO.  It 
> currently falls in the "you better know what you're doing" category and 
> that is possibly good enough for its actual users.  Trying to make this 
> more generic is going to require some more work.  And this would have to 
> come with serious arguments explaining why simply using modules in the 
> first place is not acceptable.
> 

That one is easy, you simply can't compile the network stack as a
module and it is huge.

I completely agree with all your arguments and I'm not sure it is worth
making it foolproof.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
