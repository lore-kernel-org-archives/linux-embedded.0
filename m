From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] console logging detour via printk
Date: Sat, 1 May 2010 12:04:18 +0100
Message-ID: <20100501120418.6fca2aad@lxorguk.ukuu.org.uk>
References: <1272664980.10241.77.camel@itpsd6lap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1272664980.10241.77.camel@itpsd6lap>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Samo Pogacnik <samo_pogacnik@t-2.net>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

> while i was searching for effective logging of complete console output
> produced by the kernel and user phase of the boot process, it turned out
> that only kernel messages imho get systematically cached and stored into
> log files (if needed). All userspace processes are on their own to use
> syslog, which is fine, but there are also many console messages
> reporting the boot status via init scripts, .... I came across the
> bootlogd daemo, which handles the job of redirecting console output into
> a log file, but i find it problematic to use especialy, when using
> initial ram disk image.

So you want to patch the kernel because you can't work out how to do this
in userspace ? The distributions seem to have no problem doing this in
user space that I can see. It doesn't seem to be a hard user space
problem, and there are a ton of things you want to do with this sort of
stuff (like network logging) that you can't do in kernel space.

> --- a_linux-2.6.33.3/drivers/char/vt.c
> +++ b_linux-2.6.33.3/drivers/char/vt.c
> @@ -2696,6 +2696,16 @@ static int con_write(struct tty_struct *tty, const unsigned char *buf, int count
>  {
>  	int	retval;
>  
> +#ifdef CONFIG_VT_CONSOLE_DETOUR
> +	if (console_detour) {
> +		int idx = vt_console_driver.index - 1;
> + 
> +		if ((idx >= 0) && (idx == tty->index)) {
> +			console_printk_detour(buf, count);
> +			return count;
> +		}
> +	}
> +#endif

This requires you go around hacking up each device which is not a good
idea and becomes rapidly unmaintainable.

I suspect what you actually need for such logging might be to write a
very simple tty driver whose write method is implemented as printk. That
works in the general case and doesn't require hacking up the code
everywhere else.

However given your init stuff can trivially use openpty to set up a logged
console I am not sure I see the point in doing this in kernel in the
first place.

Alan
