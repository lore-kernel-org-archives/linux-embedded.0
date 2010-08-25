From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] detour TTY driver - now ttyprintk
Date: Wed, 25 Aug 2010 11:08:13 +0100
Message-ID: <20100825110813.5f7d7ac8@lxorguk.ukuu.org.uk>
References: <20100625120329.1303aa61@lxorguk.ukuu.org.uk>
	<1282683470.8020.66.camel@itpsd6lap>
	<20100824211016.GA7176@suse.de>
	<1282687797.8020.108.camel@itpsd6lap>
	<20100824222035.GA10625@suse.de>
	<1282690232.8020.116.camel@itpsd6lap>
	<20100824225703.GA5913@suse.de>
	<20100825002221.68fc09a4@lxorguk.ukuu.org.uk>
	<20100824231241.GA6971@suse.de>
	<20100825005152.40ba2f12@lxorguk.ukuu.org.uk>
	<20100825004134.GA28884@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20100825004134.GA28884@suse.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@suse.de>
Cc: Kay Sievers <kay.sievers@vrfy.org>, Samo Pogacnik <samo_pogacnik@t-2.net>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>

> > Do you want to be able to flip between a real debug interface and a
> > logging device on the same software set without risking changing behaviour
> 
> I don't understand this point.

A tty has a very specific set of behaviours simply by being a tty. Some
applications rely upon them so being able to flip between the two
interfaces is useful.

> > Do you want to load a 70K daemon and an initrd or burn about 1.5K on a
> > kernel interface ?
> 
> I'd rather burn 0K on the one we have today :)

So say "N" when configuring

> Seriously, look at how Fedora 14 handles this, why can't you do the same
> for embedded systems all from userspace, no additional code needed
> anywhere.

Its a whole set of extra processes and daemons and stuff, and
minimally uses something like 70K even if its very compact (8K stack, 40K+
page tables, 16K of buffers, code, data) - oh and I forgot the fifo
buffering and pty cost - so its near 100K. 1.5K v 100K - for something
1.5K of kernel code that anyone else can turn off and would be off by
default ?

On a lot of embedded systems you don't have all the stuff Fedora carts
around. No modules, initrds, magic front end processes, graphical startup
daemons etc, all of which work to produce that feature IFF you have pty
support in your kernel, and for the current code also glibc.

You also want errors to get out (or stored) even if there are crashes -
which the Fedora one is not very good at. To be fair in the Fedora world
its not a big deal to say 'Oh dear, boot with ....'. Embedded isn't the
same, and you want to capture the odd rare error reliably.

Alan

