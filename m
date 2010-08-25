From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] detour TTY driver - now ttyprintk
Date: Wed, 25 Aug 2010 19:14:37 +0100
Message-ID: <20100825191437.1df57c9d@lxorguk.ukuu.org.uk>
References: <20100824222035.GA10625@suse.de>
	<1282690232.8020.116.camel@itpsd6lap>
	<20100824225703.GA5913@suse.de>
	<20100825002221.68fc09a4@lxorguk.ukuu.org.uk>
	<20100824231241.GA6971@suse.de>
	<20100825005152.40ba2f12@lxorguk.ukuu.org.uk>
	<20100825004134.GA28884@suse.de>
	<20100825110813.5f7d7ac8@lxorguk.ukuu.org.uk>
	<20100825155716.GB16284@suse.de>
	<20100825181108.1dcd0d80@lxorguk.ukuu.org.uk>
	<20100825171045.GA19401@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100825171045.GA19401@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@suse.de>
Cc: Kay Sievers <kay.sievers@vrfy.org>, Samo Pogacnik <samo_pogacnik@t-2.net>, linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>

> > > That's one extra process, not that much, right?
> > 
> > About 150K or so way too much and its not robust.
> 
> Fair enough.  So, with this driver, would it make sense for the distros
> to switch over to using it instead of the above line in their initrd?

Distros no - I doubt any normal PC distro would turn the facility on.
Embedded - yes especially deeply embedded.

> Ok, I didn't realize it really was that big.

libc page tables
app page tables
stacks (kernel and user)
arguments/exec page
buffers

Yes - it soon adds up.

Alan
