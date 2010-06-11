From: Samo Pogacnik <samo_pogacnik@t-2.net>
Subject: Re: [PATCH] detour TTY driver - now ttyprintk
Date: Fri, 11 Jun 2010 23:32:12 +0200
Message-ID: <1276291932.2154.45.camel@itpsd6lap>
References: <1273918658.2341.17.camel@itpsd6lap>
	 <1275171436.2122.29.camel@itpsd6lap>
	 <20100529235402.296406d9@lxorguk.ukuu.org.uk>
	 <1275175983.2122.42.camel@itpsd6lap> <1276123020.16010.97.camel@itpsd6lap>
	 <20100611134455.3fa7d563@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100611134455.3fa7d563@lxorguk.ukuu.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>


> > +#define	TPKRLEV	(('e'<<8) | 0) /* Wait for ttyprintk ratelimiting event*/
> > +static int tpk_ioctl(struct tty_struct *tty, struct file *file,
> > +			unsigned int cmd, unsigned long arg)
> > +{
> > +	struct ttyprintk_port *port;
> > +
> > +	port = tty->driver_data;
> > +
> > +	if (!port)
> > +		return -EINVAL;
> > +
> > +	switch (cmd) {
> > +	case TPKRLEV:
> > +		wait_event_interruptible(ttyprintk_ratelimit_wq,
> > +			(ttyprintk_ratelimit_event != 0));
> 
> Ok that wasn't quite what I had in mind. 
> 
> What I was thinking was needed was this
> 
> 	/* Stop TIOCCONS */
> 	case TIOCCONS:
> 		return -EOPNOTSUPP;
> 
> only it won't work that way. I'll sort that out in tty_io.c once the
> driver is happy. That way anything trying to mis-redirect the console
> will get stopped early which is probably more reliable than a ratelimit ?
> 
I'm thinking to leave the ratelimit support in for the time being. I had
in mind cases, when someone does
 "cat /proc/kmsg > dev/ttyprintk" or
suppose the console is redirected to ttyprintk (which i would like to be
able to do from user program) and then someone does:
 "cat /proc/kmsg > /dev/console"... or
if console is redirected after this command ?

Were you thinking of some other mis-redirection case?

Samo
