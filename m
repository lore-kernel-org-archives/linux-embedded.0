From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] detour TTY driver - now ttyprintk
Date: Wed, 25 Aug 2010 00:22:21 +0100
Message-ID: <20100825002221.68fc09a4@lxorguk.ukuu.org.uk>
References: <20100621153858.444695c0@lxorguk.ukuu.org.uk>
	<1277244410.2195.47.camel@itpsd6lap>
	<20100622232108.26752ff8@lxorguk.ukuu.org.uk>
	<1277462596.2143.101.camel@itpsd6lap>
	<20100625120329.1303aa61@lxorguk.ukuu.org.uk>
	<1282683470.8020.66.camel@itpsd6lap>
	<20100824211016.GA7176@suse.de>
	<1282687797.8020.108.camel@itpsd6lap>
	<20100824222035.GA10625@suse.de>
	<1282690232.8020.116.camel@itpsd6lap>
	<20100824225703.GA5913@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20100824225703.GA5913@suse.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@suse.de>
Cc: Samo Pogacnik <samo_pogacnik@t-2.net>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>

> No, it does cover that.  You should be able to do that with a simple
> console redirection to /dev/kmsg  What happened when you tried to do
> that?

stty: standard input: Inappropriate ioctl for device

It's value is twofold

- formatting
- tty ioctls work as they should on a console (eg vhangup)

and its a tiny driver with no impact on the rest of the kernel - so to me
it seems useful in that form.

Alan
