From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] detour TTY driver - now ttyprintk
Date: Wed, 25 Aug 2010 00:51:52 +0100
Message-ID: <20100825005152.40ba2f12@lxorguk.ukuu.org.uk>
References: <20100622232108.26752ff8@lxorguk.ukuu.org.uk>
	<1277462596.2143.101.camel@itpsd6lap>
	<20100625120329.1303aa61@lxorguk.ukuu.org.uk>
	<1282683470.8020.66.camel@itpsd6lap>
	<20100824211016.GA7176@suse.de>
	<1282687797.8020.108.camel@itpsd6lap>
	<20100824222035.GA10625@suse.de>
	<1282690232.8020.116.camel@itpsd6lap>
	<20100824225703.GA5913@suse.de>
	<20100825002221.68fc09a4@lxorguk.ukuu.org.uk>
	<20100824231241.GA6971@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20100824231241.GA6971@suse.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@suse.de>
Cc: Kay Sievers <kay.sievers@vrfy.org>, Samo Pogacnik <samo_pogacnik@t-2.net>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>

> > - formatting
> 
> Ick, we really want to format things from userspace here?

Depends what you are trying to do.

Put an embedded hat on

Do you want to be able to flip between a real debug interface and a
logging device on the same software set without risking changing behaviour

Do you want to load a 70K daemon and an initrd or burn about 1.5K on a
kernel interface ?

Alan
