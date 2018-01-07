From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] tools: fix cross-compile var export
Date: Sun, 7 Jan 2018 14:04:54 -0500
Message-ID: <20180107190453.GN6273@windriver.com>
References: <20180106201601.11074-1-martin@martingkelly.com>
 <20180107161140.GM6273@windriver.com>
 <549cf839-9ae7-78ce-58df-3d84fc7b3d05@martingkelly.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <549cf839-9ae7-78ce-58df-3d84fc7b3d05@martingkelly.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Martin Kelly <martin@martingkelly.com>
Cc: kernel-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-embedded@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Matt Mackall <mpm@selenic.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

[Re: [PATCH] tools: fix cross-compile var export] On 07/01/2018 (Sun 10:31) Martin Kelly wrote:

[...]

> With the change, we add do CC = $(CROSS_COMPILE)gcc if and only if CC is not
> already set. I'm happy to add all these details to the commit description.

That is probably a step in the right direction.  I contribute to yocto
on a regular basis and hence am sympathetic to these frustrating SDK
type issues.  But after a quick scan of this patch it wasn't obvious to
me that existing behaviour was preserved, or that it would be a pain to
separate it into chunks. (key word here being "quick")

So I'd recommend updating the commit log, and adding a Cc: line for the
maintainers of each subsystem below, and then if nobody complains you
might get akpm to pick it up as he does for other patches w/o a clear
maintainer or subsystem.

P.
--

> 
> >>
> >>  tools/cgroup/Makefile            |  1 -
> >>  tools/gpio/Makefile              |  2 --
> >>  tools/hv/Makefile                |  1 -
> >>  tools/iio/Makefile               |  2 --
> >>  tools/laptop/freefall/Makefile   |  1 -
> >>  tools/leds/Makefile              |  1 -
> >>  tools/perf/Makefile.perf         |  6 ------
> >>  tools/power/acpi/Makefile.config |  3 ---
> >>  tools/scripts/Makefile.include   | 18 ++++++++++++++++++
> >>  tools/spi/Makefile               |  2 --
> >>  tools/usb/Makefile               |  1 -
> >>  tools/vm/Makefile                |  1 -
> >>  tools/wmi/Makefile               |  1 -
> >>  13 files changed, 18 insertions(+), 22 deletions(-)
> >>
