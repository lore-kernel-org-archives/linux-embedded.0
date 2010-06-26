From: Samo Pogacnik <samo_pogacnik@t-2.net>
Subject: Re: [PATCH] detour TTY driver - now ttyprintk
Date: Sat, 26 Jun 2010 03:48:31 +0200
Message-ID: <1277516912.29797.411.camel@itpsd6lap>
References: <1273918658.2341.17.camel@itpsd6lap>
	 <1275171436.2122.29.camel@itpsd6lap>
	 <20100529235402.296406d9@lxorguk.ukuu.org.uk>
	 <1275175983.2122.42.camel@itpsd6lap> <1276123020.16010.97.camel@itpsd6lap>
	 <20100611134455.3fa7d563@lxorguk.ukuu.org.uk>
	 <1276291932.2154.45.camel@itpsd6lap>
	 <20100621153858.444695c0@lxorguk.ukuu.org.uk>
	 <1277244410.2195.47.camel@itpsd6lap>
	 <20100622232108.26752ff8@lxorguk.ukuu.org.uk>
	 <1277462596.2143.101.camel@itpsd6lap>
	 <20100625120329.1303aa61@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100625120329.1303aa61@lxorguk.ukuu.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

> > +static int tpk_write_room(struct tty_struct *tty)
> > +{
> > +	int ret = tpk_space;
> > +
> > +	/* allow char by char under max pressure */
> > +	if (tpk_space == 0)
> > +		tpk_space = 1;
> 
> That won't do what you think, the ldisc will keep seeing progress and
> generate millions of 1 byte I/Os in a loop !

I thought that this would automatically reduce processor load, which is
obviously not the case. Sorry for the delay, but i am trying to figure
out how to slow down write method when under pressure.

And that setting tpk_space to 1 would then be just in case we reach 0 to
enable further processing.

Samo

