From: Matt Mackall <mpm@selenic.com>
Subject: Re: [patch 1/4] Configure out AIO support
Date: Tue, 29 Jul 2008 11:27:46 -0500
Message-ID: <1217348866.15724.148.camel@calx>
References: <20080729154520.728594017@free-electrons.com> >
	  <20080729154747.574989775@free-electrons.com>>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080729154747.574989775@free-electrons.com>>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, bcrl@kvack.org, linux-aio@kvack.org, akpm@linux-foundation.org


On Tue, 2008-07-29 at 17:45 +0200, Thomas Petazzoni wrote:
> plain text document attachment (configure-out-aio-support)
> This patchs adds the CONFIG_AIO option which allows to remove support
> for asynchronous I/O operations, that are not necessarly used by
> applications, particularly on embedded devices. As this is a
> size-reduction option, it depends on CONFIG_EMBEDDED. It allows to
> save ~7 kilobytes of kernel code/data:
> 
>    text	   data	    bss	    dec	    hex	filename
> 1115067	 119180	 217088	1451335	 162547	vmlinux
> 1108025	 119048	 217088	1444161	 160941	vmlinux.new
>   -7042    -132       0   -7174   -1C06 +/-
> 
> This patch has been originally written by Matt Mackall
> <mpm@selenic.com>, and is part of the Linux Tiny project.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: bcrl@kvack.org
> Cc: linux-aio@kvack.org
> Cc: mpm@selenic.com
> Cc: akpm@linux-foundation.org

These all look good to me, naturally.

Signed-off-by: Matt Mackall <mpm@selenic.com>

-- 
Mathematics is the supreme nostalgia of our time.
