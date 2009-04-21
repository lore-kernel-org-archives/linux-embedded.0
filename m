From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: Wait for console to become available, v3.2
Date: Tue, 21 Apr 2009 10:59:52 -0700
Message-ID: <20090421175952.GA20146@cuplxvomd02.corp.sa.net>
References: <20090420234006.GA1958@cuplxvomd02.corp.sa.net> <20090421064346.GB8020@elte.hu> <200904210013.48551.david-b@pacbell.net> <1240333871.3632.70.camel@macbook.infradead.org> <20090421172929.GC8251@cuplxvomd02.corp.sa.net> <alpine.LFD.2.00.0904211036140.2199@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0904211036140.2199@localhost.localdomain>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1915; t=1240336793; x=1241200793;
	c=relaxed/simple; s=sjdkim1004;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20Wait=20for=20console=20to=20become=20av
	ailable,=20v3.2
	|Sender:=20;
	bh=ge6NLnI5DewNr3mBVOkDjRscMz9OmCDDh/rcowPzi6o=;
	b=r/gC5oe3ox7tVjBNDvLNrRpDL0HF3KKP8ZDMV92r3j2SK4BtGXssGSZlJj
	J+pisee7xMxBPiYKMWHcbC2UNXlhoTkHN9giLmBDBuj7fewumUDck9bfmskt
	lqydtOxXMgAJqgiL9vLs4CV+KgGOFcVYnLEXP6npJjBgQfgqj0dHo=;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>, David Brownell <david-b@pacbell.net>, alan@lxorguk.ukuu.org.uk, Ingo Molnar <mingo@elte.hu>, Arjan van de Ven <arjan@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, Linux Embedded Mailing List <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

 Tue, Apr 21, 2009 at 10:37:41AM -0700, Linus Torvalds wrote:
> 
> 
> On Tue, 21 Apr 2009, David VomLehn wrote:
> > 
> > What in the world are users going to do when they see a message about
> > output being lost? There is no way to recover the data and no way to
> > prevent it in the future. I don't think this is a good approach.
> 
> Sure there is. The console messages are saved too, so doing 'dmesg' will 
> get you all the data that was generated before the console went on-line.
> 
> We _already_ lose data in that sense (although we could replay it for the 
> first console connected - maybe we even do, I'm too lazy to check).

There are two different things coming out on the console, kernel log buffer
messages and userspace output to /dev/console. Kernel log buffer output
is replayed for each console as it connects. There might be quite a bit of
it, but it is pretty much the same from boot to boot, so the guy working on
the kernel, me, can tune the size of log_buf pretty easily. This is not
the problem.

The problem is the userspace output to /dev/console. I work in the embedded
space and my box does not simply throw up a few windows and wait placidly for
the user to do something. Instead, it immediately starts running a whole bunch
of software with a whole bunch of startup messages. In short order, I am
running over 300 threads. I have no control over how much output comes out,
I have no idea how much kernel memory to allocate for this, and I'm quote sure
it's enough that I wouldn't want to waste that much space even if I did. No
matter what, this looks like we'd need a new tunable for the size.

And then, what happens if I *never* get a console, because one isn't plugged
in? This happens a lot in the embedded world. How long am I supposed to keep
around this big chunk of buffered data? Sounds like I need *another* tunable.
Yuck.

> 			Linus
