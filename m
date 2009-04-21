From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: Wait for console to become available, v3.2
Date: Tue, 21 Apr 2009 10:29:29 -0700
Message-ID: <20090421172929.GC8251@cuplxvomd02.corp.sa.net>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net> <20090421064346.GB8020@elte.hu> <200904210013.48551.david-b@pacbell.net> <1240333871.3632.70.camel@macbook.infradead.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1240333871.3632.70.camel@macbook.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1476; t=1240334974; x=1241198974;
	c=relaxed/simple; s=sjdkim5002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20Wait=20for=20console=20to=20become=20av
	ailable,=20v3.2
	|Sender:=20;
	bh=xhpyOqJ5uteZ18r99eTKeQRvVys6IGT0LHTWAC+3x4s=;
	b=I+PzkpApzeX0sUC17bmBXhiWbCjCq5hXNjHfEBISOtbS+lf/B0BgSigZP/
	SBimfQLevSh1PVDg62B8fuYI8ZcGlse+pKj7L3FJgbBHeN0NRxHjjPjIF1Zl
	yX9yf4cbDh;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: David Brownell <david-b@pacbell.net>, alan@lxorguk.ukuu.org.uk, Ingo Molnar <mingo@elte.hu>, Arjan van de Ven <arjan@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Tue, Apr 21, 2009 at 06:11:11PM +0100, David Woodhouse wrote:
...
> The kernel output is going to be spewed when a console registers with
> CON_PRINTBUFFER anyway, and if we printk a warning about userspace
> console output being lost, that ought to be good enough to notify the
> user that something may have been lost. For bonus points, we could even
> make that 'dummy' tty driver buffer a limited amount of userspace
> output, maybe.

What in the world are users going to do when they see a message about
output being lost? There is no way to recover the data and no way to
prevent it in the future. I don't think this is a good approach.

Remember, even though the previous functionality of USB consoles was, in
theory, less reliable than it appeared, it actually has been working well
for years. Thus, tossing output will count as a regression for most of the
world.

> If userspace cares, let _it_ wait, by using an ioctl to see what tty
> device it's _really_ attached to.

I have a notion, perhaps misguided, that userspace *always* cares about
seeing all the output they have generated.

I have no objection to a userspace solution, in the long run, but such an
approach represents a significantly different approach to constructing boot
filesystems and we need a transitional period. In the interim, let's get
things working as they were.

> David Woodhouse                            Open Source Technology Centre

David VomLehn
