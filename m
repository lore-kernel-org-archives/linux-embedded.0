From: Rob Landley <rob@landley.net>
Subject: Re: Boot time: Initial main memory initialization optimizations?
Date: Mon, 05 May 2014 20:51:28 -0500
Message-ID: <53684020.5060204@landley.net>
References: <5367B108.8080206@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <5367B108.8080206@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Behme <dirk.behme@gmail.com>, Linux Embedded <linux-embedded@vger.kernel.org>

On 05/05/14 10:40, Dirk Behme wrote:
> Hi,
> 
> regarding boot time optimization, on an embedded ARM Cortex-A9 based
> system with 512MB or 1GB main memory, we found that initializing this
> main memory takes a somehow large amount of time.
> 
> Initializing 512MB takes <= ~100ms, the additional 512MB on the 1GB take
> <= ~100ms additionally, too. So in sum <= ~200ms for 1GB.
> 
> Having a short look to this, it looks like most of the time is spent in
> arch/arm/mm/init.c in bootmem_init()/arm_bootmem_init()/arm_bootmem_free().
> 
> Has anybody already looked into this if there are any optimizations
> possible? Maybe even some hacks, if the main memory size (512MB/1GB) is
> always known? Any pointers?

There were a couple of longish threads last year. Random links into the
middle of 'em:

http://www.spinics.net/lists/linux-mm/msg54027.html
http://lkml.iu.edu//hypermail/linux/kernel/1306.3/01915.html

> I'm looking for reducing (a) the overall init time and maybe (b) the
> dependency on the memory size.

Basically they were deferring init by abusing the hotplug mechanism, so
the system started with less memory and a background thread added more
of it.

Rob
