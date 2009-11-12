From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH, RFC] panic-note: Annotation from user space for panics
Date: Thu, 12 Nov 2009 14:50:41 -0500
Message-ID: <4AFC6711.1090405@windriver.com>
References: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20091112021322.GA6166@dvomlehn-lnx2.corp.sa.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David VomLehn <dvomlehn@cisco.com>
Cc: linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, linux-kernel@vger.kernel.org, mpm@selenic.com

David VomLehn wrote:
> Allows annotation of panics to include platform information. It's no big
> deal to collect information, but way helpful when you are collecting
> failure reports from a eventual base of millions of systems deployed in
> other people's homes.
> 
> One of the biggest reasons this is an RFC is that I'm uncomfortable with
> putting the pseudo-file that holds the annotation information in /proc.
> Different layers of the software stack may drop dynamic information, such
> as DHCP-supplied IP addresses, in here as they come up. This means it's
> necessary to be able to append to the end of the annotation, so this looks
> much more like a real file than a sysctl file.  It also has multiple lines,
> which doesn't look a sysctl file. Annotation can be viewed as a debug thing,
> so maybe it belongs in debugfs, but people seem to be doing somewhat different
> things with that filesystem.
> 
> So, suggestions on this issue, and any others are most welcome. If there a
> better way to do this, I'll be happy to use it.
> 
> Signed-off-by: David VomLehn <dvomlehn@cisco.com>
> ---

> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -70,6 +70,7 @@ NORET_TYPE void panic(const char * fmt, ...)
>  	vsnprintf(buf, sizeof(buf), fmt, args);
>  	va_end(args);
>  	printk(KERN_EMERG "Kernel panic - not syncing: %s\n",buf);
> +	panic_note_print();
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>  	dump_stack();
>  #endif


Why hook into panic() directly like this, vs. using the panic
notifier list? If you use that, and then put the data handling
magic that you need into your own kernel module that knows how
to interface with the reporting apps that you have, you can
do the whole thing without having to alter existing code, I think.

Paul.

> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 30df586..bade7a1 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1045,6 +1045,14 @@ config DMA_API_DEBUG
>  	  This option causes a performance degredation.  Use only if you want
>  	  to debug device drivers. If unsure, say N.
>  
> +config PANIC_NOTE
> +	bool "Create file for user space data to be reported at panic time"
> +	default n
> +	help
> +	  This creates a pseudo-file, named /proc/panic_note, into which
> +	  user space data can be written. If a panic occurs, the contents
> +	  of the file will be included in the failure report.
> +
>  source "samples/Kconfig"
>  
>  source "lib/Kconfig.kgdb"
