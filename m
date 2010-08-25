From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] detour TTY driver - now ttyprintk
Date: Wed, 25 Aug 2010 18:11:08 +0100
Message-ID: <20100825181108.1dcd0d80@lxorguk.ukuu.org.uk>
References: <20100824211016.GA7176@suse.de>
	<1282687797.8020.108.camel@itpsd6lap>
	<20100824222035.GA10625@suse.de>
	<1282690232.8020.116.camel@itpsd6lap>
	<20100824225703.GA5913@suse.de>
	<20100825002221.68fc09a4@lxorguk.ukuu.org.uk>
	<20100824231241.GA6971@suse.de>
	<20100825005152.40ba2f12@lxorguk.ukuu.org.uk>
	<20100825004134.GA28884@suse.de>
	<20100825110813.5f7d7ac8@lxorguk.ukuu.org.uk>
	<20100825155716.GB16284@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100825155716.GB16284@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@suse.de>
Cc: Kay Sievers <kay.sievers@vrfy.org>, Samo Pogacnik <samo_pogacnik@t-2.net>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>

> Would that work for this driver in use as a console?

Yes

>   exec < /dev/console > /dev/kmsg 2>&1
> 
> That's one extra process, not that much, right?

About 150K or so way too much and its not robust.

> > You also want errors to get out (or stored) even if there are crashes -
> > which the Fedora one is not very good at. To be fair in the Fedora world
> > its not a big deal to say 'Oh dear, boot with ....'. Embedded isn't the
> > same, and you want to capture the odd rare error reliably.
> 
> again, the above exec line should work for what the embedded people
> want, right?

We didn't *need* devtmpfs either - that was a little bit of user space.
It's a similar thing - you can do the job better in 1.5K of kernel code
than 150K or more of user space - which is not trivial on a box with no
swap.

Alan
