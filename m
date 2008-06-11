From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Wed, 11 Jun 2008 00:25:26 -0500
Message-ID: <200806110025.27575.rob@landley.net>
References: <20080610134932.B27D62430C@gemini.denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080610134932.B27D62430C@gemini.denx.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wolfgang Denk <wd@denx.de>
Cc: Will Newton <will.newton@gmail.com>, Jamie Lokier <jamie@shareable.org>, Sam Ravnborg <sam@ravnborg.org>, Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

On Tuesday 10 June 2008 08:49:32 Wolfgang Denk wrote:
> In message <87a5b0800806100625m5a6d20dao47b884bff663c24c@mail.gmail.com> you 
wrote:
> > I'm not convinced it matters at all. Self hosting on an embedded
> > architecture is, as has been mentioned, pretty pointless.
>
> YMMV...
>
> > system. For example I don't think I'll ever be able to self host a
> > kernel build on a board with only 32Mb of on-board RAM.
>
> It depends. We've done this on board with as little as 16 MB RAM.

There's also qemu.  You can native build under emulation.

In addition, if you have a cross compiler but don't want to spend all your 
time lying to ./configure, preventing gcc from linking against the host's 
zlib or grabbing stuff out of /usr/include that your target hasn't got, or 
trying to figure out why on EARTH the perl build decided to use x86 signal 
numbers when you built it for mips, you can build natively inside the 
emulator but use distcc to call out to the cross compiler through the virtual 
network.  This uses the compiler for the heavy lifting of compilation 
_and_nothing_else_.  (make runs natively inside the emulator, ./configure 
runs inside the emulator, headers are #included inside the emulator, 
libraries are linked inside the emulator, anything that wants to look 
at /proc or sysinfo does it natively inside the emulator...)

And the thing is, QEMU is running on fast cheap x86 hardware with buckets of 
memory and disk space, and Moore's Law is doubling the power of it every 18 
months (whereas it's making a lot of embedded stuff cheaper and have longer 
battery life instead, at least until we get to fully disposable computers).  
So yay using x86 as your build envionment, but building natively under 
emulation is now an alternative to trying to make cross compiling scale.

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
