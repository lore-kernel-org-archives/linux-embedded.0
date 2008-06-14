From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: about size optimizations (Re: Not as much ccache win as I
	expected)
Date: Sat, 14 Jun 2008 08:43:23 +0100
Message-ID: <1213429403.26255.298.camel@pmac.infradead.org>
References: <8499950a0806131452j5dc9574dk336e9e06ee9e1785@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <8499950a0806131452j5dc9574dk336e9e06ee9e1785@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Verych <olecom@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org, segher@kernel.crashing.org

On Fri, 2008-06-13 at 22:52 +0100, Oleg Verych wrote:
> Using same `gcc -E` principle, I once had a dream to create
> build with something like "whole-kernel-at-time" optimising
> compiler option:

Doing it for the whole kernel probably doesn't buy you a whole lot more
than doing it a bit more selectively, which is what I was doing in
http://lkml.org/lkml/2006/8/24/212

I think Segher has been playing with it a bit recently, and confirms my
suspicion that combining kernel/ with arch/$ARCH/kernel, and mm/ with
arch/$ARCH/mm, is also a big win.

The GCC problems should mostly be fixed now, I think -- we just need to
have another go at doing the Kbuild side of it properly.

-- 
dwmw2

