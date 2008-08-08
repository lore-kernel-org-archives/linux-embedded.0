From: Daniel Walker <dwalker@mvista.com>
Subject: Re: [PATCH] [RFC] emit-crash-char: Allow diversion of printk
	output for crash logging
Date: Fri, 08 Aug 2008 08:55:04 -0700
Message-ID: <1218210904.19162.144.camel@localhost.localdomain>
References: <489BAD5C.2080009@cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <489BAD5C.2080009@cisco.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dvomlehn@cisco.com
Cc: linux-embedded@vger.kernel.org

On Thu, 2008-08-07 at 19:20 -0700, David VomLehn wrote:
> Allow diversion of characters generated through printk so that they can
> be logged separately. The printk_time variables is made externally visible
> so that functions processing the diverted characters can parse off the
> time added if CONFIG_PRINTK_TIME is enabled.

> +
>  static void emit_log_char(char c)
>  {
> +	emit_crash_char(c);
> +
>  	LOG_BUF(log_end) = c;

Isn't this duplicating the making of a custom console driver? I'm not a
console expect, but I think you could have a console driver which
catches this output and logs it..

Another note, usually when submitting new interfaces like this you
should also submit the code that uses the interface .. In your case you
might not be able to do that, but it could never be accepted without at
least one user.

Daniel
