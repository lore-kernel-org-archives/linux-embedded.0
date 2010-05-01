From: Samo Pogacnik <samo_pogacnik@t-2.net>
Subject: Re: [PATCH] console logging detour via printk
Date: Sat, 01 May 2010 10:37:14 +0200
Message-ID: <1272703034.2229.5.camel@itpsd6lap>
References: <1272664980.10241.77.camel@itpsd6lap>
	 <20100430154522.489df8bc.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20100430154522.489df8bc.rdunlap@xenotime.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

Dne 30.04.2010 (pet) ob 15:45 -0700 je Randy Dunlap zapisal(a):
> On Sat, 01 May 2010 00:03:00 +0200 Samo Pogacnik wrote:
> 
> > Hi,
> 
> > diff --git a_linux-2.6.33.3/drivers/char/Kconfig b_linux-2.6.33.3/drivers/char/Kconfig
> > index e023682..b5d0909 100644
> > --- a_linux-2.6.33.3/drivers/char/Kconfig
> > +++ b_linux-2.6.33.3/drivers/char/Kconfig
> > @@ -66,6 +66,23 @@ config VT_CONSOLE
> >  
> >  	  If unsure, say Y.
> >  
> > +config VT_CONSOLE_DETOUR
> > +	bool "Support for VT console detour via printk"
> > +	depends on VT_CONSOLE
> > +	default n
> > +	---help---
> > +	  If you do say Y here, the support for writing console messages via
> 
> 	  If you say Y here,
> 
> > +	  printk is included into VT console code.
> > +
> > +	  The feature is usefull to catch all console log. In order to use this
> 
> 	                 useful                       log messages.
> 
> > +	  feature, you should specify kernel command line option "detour" or write a
> > +	  positive number into /proc/sys/kernel/console_detour. You can disable
> > +	  the feature on-line by writing zero into the proc file. By writing a
> > +	  negative value into the proc file, the feature is disabled permanently
> > +	  (until next boot).
> > +
> > +	  If unsure, say N.
> > +
> >  config HW_CONSOLE
> >  	bool
> >  	depends on VT && !S390 && !UML
> 
> > diff --git a_linux-2.6.33.3/drivers/serial/Kconfig b_linux-2.6.33.3/drivers/serial/Kconfig
> > index 9ff47db..20acfab 100644
> > --- a_linux-2.6.33.3/drivers/serial/Kconfig
> > +++ b_linux-2.6.33.3/drivers/serial/Kconfig
> > @@ -1031,6 +1031,23 @@ config SERIAL_CORE
> >  config SERIAL_CORE_CONSOLE
> >  	bool
> >  
> > +config SERIAL_CORE_CONSOLE_DETOUR
> > +	bool "Support for serial console detour via printk"
> > +	depends on SERIAL_CORE_CONSOLE
> > +	default n
> > +	---help---
> > +	  If you do say Y here, the support for writing console messages via
> 
> 	  If you say Y here,
> 
> > +	  printk is included into serial console code. 
> > +
> > +	  The feature is usefull to catch all console log. In order to use this
> 
> 	                 useful                       log messages.
> 
> > +	  feature, you should specify kernel command line option "detour" or write a
> > +	  positive number into /proc/sys/kernel/console_detour. You can disable
> > +	  the feature on-line by writing zero into the proc file. By writing a
> > +	  negative value into the proc file, the feature is disabled permanently
> > +	  (until next boot).
> > +
> > +	  If unsure, say N.
> > +
> 
> The kernel command line option needs to be added to Documentation/kernel-parameters.txt
> also, please.
> 
> >  config CONSOLE_POLL
> >  	bool
> >  
> > diff --git a_linux-2.6.33.3/include/linux/console.h b_linux-2.6.33.3/include/linux/console.h
> > index dcca533..bc88030 100644
> > --- a_linux-2.6.33.3/include/linux/console.h
> > +++ b_linux-2.6.33.3/include/linux/console.h
> > @@ -108,6 +108,12 @@ struct console {
> >  	struct	 console *next;
> >  };
> >  
> > +extern int console_detour;
> > +extern void console_printk_detour(const unsigned char *, int);
> 
> Please include parameter names in function prototype(s).
> 
> > +
> > +struct ctl_table;
> > +int detour_sysctl_handler(struct ctl_table *, int, void __user *, size_t *, loff_t *);
> 
> ditto
> 
> > +
> >  extern int console_set_on_cmdline;
> >  
> >  extern int add_preferred_console(char *name, int idx, char *options);
> 
> 
> Looks interesting/useful to me.  Thanks.
> 
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your code ***
Good morning,

Thank you for the corrections and hints. i'll catchup with an update as
soon as i can.

regards, Samo
