From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] console logging detour via printk
Date: Fri, 30 Apr 2010 15:45:22 -0700
Message-ID: <20100430154522.489df8bc.rdunlap@xenotime.net>
References: <1272664980.10241.77.camel@itpsd6lap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1272664980.10241.77.camel@itpsd6lap>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Samo Pogacnik <samo_pogacnik@t-2.net>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Sat, 01 May 2010 00:03:00 +0200 Samo Pogacnik wrote:

> Hi,

> diff --git a_linux-2.6.33.3/drivers/char/Kconfig b_linux-2.6.33.3/drivers/char/Kconfig
> index e023682..b5d0909 100644
> --- a_linux-2.6.33.3/drivers/char/Kconfig
> +++ b_linux-2.6.33.3/drivers/char/Kconfig
> @@ -66,6 +66,23 @@ config VT_CONSOLE
>  
>  	  If unsure, say Y.
>  
> +config VT_CONSOLE_DETOUR
> +	bool "Support for VT console detour via printk"
> +	depends on VT_CONSOLE
> +	default n
> +	---help---
> +	  If you do say Y here, the support for writing console messages via

	  If you say Y here,

> +	  printk is included into VT console code.
> +
> +	  The feature is usefull to catch all console log. In order to use this

	                 useful                       log messages.

> +	  feature, you should specify kernel command line option "detour" or write a
> +	  positive number into /proc/sys/kernel/console_detour. You can disable
> +	  the feature on-line by writing zero into the proc file. By writing a
> +	  negative value into the proc file, the feature is disabled permanently
> +	  (until next boot).
> +
> +	  If unsure, say N.
> +
>  config HW_CONSOLE
>  	bool
>  	depends on VT && !S390 && !UML

> diff --git a_linux-2.6.33.3/drivers/serial/Kconfig b_linux-2.6.33.3/drivers/serial/Kconfig
> index 9ff47db..20acfab 100644
> --- a_linux-2.6.33.3/drivers/serial/Kconfig
> +++ b_linux-2.6.33.3/drivers/serial/Kconfig
> @@ -1031,6 +1031,23 @@ config SERIAL_CORE
>  config SERIAL_CORE_CONSOLE
>  	bool
>  
> +config SERIAL_CORE_CONSOLE_DETOUR
> +	bool "Support for serial console detour via printk"
> +	depends on SERIAL_CORE_CONSOLE
> +	default n
> +	---help---
> +	  If you do say Y here, the support for writing console messages via

	  If you say Y here,

> +	  printk is included into serial console code. 
> +
> +	  The feature is usefull to catch all console log. In order to use this

	                 useful                       log messages.

> +	  feature, you should specify kernel command line option "detour" or write a
> +	  positive number into /proc/sys/kernel/console_detour. You can disable
> +	  the feature on-line by writing zero into the proc file. By writing a
> +	  negative value into the proc file, the feature is disabled permanently
> +	  (until next boot).
> +
> +	  If unsure, say N.
> +

The kernel command line option needs to be added to Documentation/kernel-parameters.txt
also, please.

>  config CONSOLE_POLL
>  	bool
>  
> diff --git a_linux-2.6.33.3/include/linux/console.h b_linux-2.6.33.3/include/linux/console.h
> index dcca533..bc88030 100644
> --- a_linux-2.6.33.3/include/linux/console.h
> +++ b_linux-2.6.33.3/include/linux/console.h
> @@ -108,6 +108,12 @@ struct console {
>  	struct	 console *next;
>  };
>  
> +extern int console_detour;
> +extern void console_printk_detour(const unsigned char *, int);

Please include parameter names in function prototype(s).

> +
> +struct ctl_table;
> +int detour_sysctl_handler(struct ctl_table *, int, void __user *, size_t *, loff_t *);

ditto

> +
>  extern int console_set_on_cmdline;
>  
>  extern int add_preferred_console(char *name, int idx, char *options);


Looks interesting/useful to me.  Thanks.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
