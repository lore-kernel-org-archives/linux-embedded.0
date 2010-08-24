From: Samo Pogacnik <samo_pogacnik@t-2.net>
Subject: Re: [PATCH] detour TTY driver - now ttyprintk
Date: Wed, 25 Aug 2010 00:50:32 +0200
Message-ID: <1282690232.8020.116.camel@itpsd6lap>
References: <20100611134455.3fa7d563@lxorguk.ukuu.org.uk>
	 <1276291932.2154.45.camel@itpsd6lap>
	 <20100621153858.444695c0@lxorguk.ukuu.org.uk>
	 <1277244410.2195.47.camel@itpsd6lap>
	 <20100622232108.26752ff8@lxorguk.ukuu.org.uk>
	 <1277462596.2143.101.camel@itpsd6lap>
	 <20100625120329.1303aa61@lxorguk.ukuu.org.uk>
	 <1282683470.8020.66.camel@itpsd6lap> <20100824211016.GA7176@suse.de>
	 <1282687797.8020.108.camel@itpsd6lap>  <20100824222035.GA10625@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-2.net; h=
	content-transfer-encoding:x-mailer:mime-version:message-id:date
	:date:content-type:content-type:references:in-reply-to:from:from
	:subject:subject:received:received:received:received; s=
	smtp-out-2; t=1282690243; x=1284504643; bh=2bGf0hMfWsENyEzbphW2H
	+vm3GqFytp5BHtPdwcFLBQ=; b=hIJo8ibaicwVJRwn7j+ctj/Jlc4rvV8vgjTXK
	AQ25rBiLttCW+D10W7c9IMkI89O2XDRJ5KpKtW03lCpORoPAxQ44m/4kCO3iWMo0
	bHO1qi4aqul3FuTNVFj6K4AShiPz1l4WuqAjMaCnL8/8sQ8vy88LmrnAgyoqRVsI
	SQb8s4=
In-Reply-To: <20100824222035.GA10625@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg KH <gregkh@suse.de>
Cc: linux kernel <linux-kernel@vger.kernel.org>, linux-embedded <linux-embedded@vger.kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>

Dne 24.08.2010 (tor) ob 15:20 -0700 je Greg KH zapisal(a):
> > > And what about the normal way of just writing to /dev/kmsg to do this?
> > > Why a whole new driver for this same functionality?
> > I must admit, i was not aware of the /dev/kmsg driver, but i made a few
> > tests and found out that it seems not to be possible to redirect console
> > to kmsg.
> 
> See how systemd does this, as it sounds like exactly what you want to
> do.  Look in either Fedora 14, or openSUSE Factory for examples of this,
> with no kernel changes needed.
> 
I'll check out systemd. 

however:)
It may be that systemd does not cover the initrd part of the
initialization and it may be an overkill do introduce systemd to an
existing system just to be analyzed.

regards, Samo
