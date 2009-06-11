From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: Kernel crashing and log buffers...
Date: Thu, 11 Jun 2009 11:22:57 -0700
Message-ID: <4A314B81.7060401@am.sony.com>
References: <200906102126.40410.rgetz@blackfin.uclinux.org> <20090611175303.GA10058@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090611175303.GA10058@cuplxvomd02.corp.sa.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David VomLehn <dvomlehn@cisco.com>
Cc: Robin Getz <rgetz@blackfin.uclinux.org>, Mike Frysinger <vapier@gentoo.org>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Wolfgang Denk <wd@denx.de>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>

David VomLehn wrote:
> Our kernel does crash, so we have to do this. I had submitted a patch a
> while ago that tweaks emit_log_char, but this was bounced, reasonably,
> because it would be interferring with the great majority of people who
> are not interested in capturing log output. The suggestion was made that
> we do this with a console driver. I've recently got a version working, as
> a module, but I've only started testing of the version integrated into the
> kernel tree.  Still, post early, post often, so I've appended a version
> of the patch here to see if this seems to be the right direction.
> 
> Regardless whether my particular patch seems like the right way to do this,
> we do need to solve this problem for the embedded world. It is one of the
> few areas where we have needs not shared by the rest of the kernel community.

In general, I like this approach to solve this problem.  I spend most of
my time in the lab with prototype boards that use a serial console, so my
terminal history has always been my crashdump repository. ;-)

This approach it unobtrusive to the rest of the log buffer system.  I never
did like the patches that introduced other ways to hack into the log
buffer.  The printk/log buffer code path is already convoluted enough,
and I didn't like the idea of adding additional hooks.  this approach
leverages an already existing hook.

I don't have much comment on the code specifics, but I have one nit
with the config help...

> diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
> index 735bbe2..882ee57 100644
> --- a/drivers/char/Kconfig
> +++ b/drivers/char/Kconfig
> @@ -684,6 +684,20 @@ config HVCS
>  	  which will also be compiled when this driver is built as a
>  	  module.
>  
> +config CONSLOGGER
> +	tristate "Pseudo-console for capturing console output"
> +	depends on PRINTK
> +	default n
> +	help
> +	  This contains a pseudo-console to record and divert kernel console
> +	  output, which is probably of most used to embedded systems. When
should be "most use" (no 'd')

> +	  a system crashes, it can divert printk output for logging information
> +	  about the failure in some persistent location. Then the output from
> +	  any function that uses printk() to display information, such as
> +	  dump_stack() can be stored in the failure log. It also stores
> +	  console output in a circular buffer so that that last <n> messages
> +	  can be added to the failure log.
> +
>  config IBM_BSR
>  	tristate "IBM POWER Barrier Synchronization Register support"
>  	depends on PPC_PSERIES

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
