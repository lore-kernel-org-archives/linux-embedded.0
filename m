From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: Wait for console to become available, v3.2
Date: Tue, 21 Apr 2009 16:17:28 -0700
Message-ID: <20090421231728.GB29555@cuplxvomd02.corp.sa.net>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net> <20090421064346.GB8020@elte.hu> <200904210013.48551.david-b@pacbell.net> <1240333871.3632.70.camel@macbook.infradead.org> <alpine.LFD.2.00.0904211016190.2199@localhost.localdomain> <20090421202501.26a44f9d@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090421202501.26a44f9d@lxorguk.ukuu.org.uk>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1641; t=1240355857; x=1241219857;
	c=relaxed/simple; s=sjdkim2002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20Wait=20for=20console=20to=20become=20av
	ailable,=20v3.2
	|Sender:=20;
	bh=abwz3LmStZAa17awUeAxy0F7yO1eka+taP5xqNnUsiQ=;
	b=SM4HxNw/AalAR/GIYXy5lbn2G03+CSB2tK7JbzAqCEG7qd1wobNGZRqjrk
	15OMUwYXp+D9fGGy/7CFZ1I2jjHhXeveLH1TKIxI1cUF86ya3RCEiIjjgZet
	e5JTcMO3s5;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>, David Brownell <david-b@pacbell.net>, Ingo Molnar <mingo@elte.hu>, Arjan van de Ven <arjan@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Tue, Apr 21, 2009 at 08:25:01PM +0100, Alan Cox wrote:
> > Anybody want to try it? Just make it ignore any IO if there are no 
> > registered consoles. The patch shouldn't even be all that big, I suspect.
> 
> It will work, but on its own it won't actually fix the problem people
> have, which is wanting to wait for a real console to appear. Extending it
> to sleep (if not O_NDELAY) and loop back through the list when the list
> changes would however do the trick, that or a tty device that buffers
> then spews into the real device when it appears.
> 
> Definitely the right path, and we almost have every tty device in
> existance containing a struct tty_port, at which point it gets even
> cleaner.
> 
> The printk() console needs to buffer up data and replay it but we already
> pretty much do what is needed even for vt consoles because the fb isn't
> ready before the first printk.

We're already good on printk, the size of log_buf is configurable and log_buf
is dumped to each console as it gets registered. Even then, printk output is
not an especially big issue since you have dmesg to get to anything you
might have missed.

Other the other hand, userspace output is not buffered and has the potential
to be much larger. Any approach that buffers it risks either truncation or
gobbling up memory. There is also the human factors issue that users will
pretty much ignore printk output because they don't particularly understand
it. They understand, and expect to see, the output they generate. I'm pretty
sure they won't like for it to go missing under mysterious circumstances.

David VomLehn
