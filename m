From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] detour TTY driver - now ttyprintk
Date: Tue, 22 Jun 2010 23:21:08 +0100
Message-ID: <20100622232108.26752ff8@lxorguk.ukuu.org.uk>
References: <1273918658.2341.17.camel@itpsd6lap>
	<1275171436.2122.29.camel@itpsd6lap>
	<20100529235402.296406d9@lxorguk.ukuu.org.uk>
	<1275175983.2122.42.camel@itpsd6lap>
	<1276123020.16010.97.camel@itpsd6lap>
	<20100611134455.3fa7d563@lxorguk.ukuu.org.uk>
	<1276291932.2154.45.camel@itpsd6lap>
	<20100621153858.444695c0@lxorguk.ukuu.org.uk>
	<1277244410.2195.47.camel@itpsd6lap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1277244410.2195.47.camel@itpsd6lap>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Samo Pogacnik <samo_pogacnik@t-2.net>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

> For correct flow control, i suppose current empty space of the real
> (final) printk buffer is needed. On the other hand my intermediate

Console drivers have their own buffering so that doesn't really work. If
you want to just avoid explosions then you don't need to be quite so
clever

> in some logical manner. And the other would be to use ratelimit support
> to switch between max and zero in write_room answer and remove other
> retelimit response?

Yes - except that a driver isn't permitted to reduce the write room space
by more than bytes written. That is if you offer 512 bytes you can't
offer 0 until 512 bytes have been written - hence the design of the pseudo
code I posted in the previous message.
