From: Samo Pogacnik <samo_pogacnik@t-2.net>
Subject: Re: [PATCH] console logging detour via printk
Date: Sat, 01 May 2010 18:36:54 +0200
Message-ID: <1272731814.2147.26.camel@itpsd6lap>
References: <1272664980.10241.77.camel@itpsd6lap>
	 <z2r10f740e81005010200we353e3a4v90d9fe64620edb24@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <z2r10f740e81005010200we353e3a4v90d9fe64620edb24@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

Dne 01.05.2010 (sob) ob 11:00 +0200 je Geert Uytterhoeven zapisal(a):
> On Sat, May 1, 2010 at 00:03, Samo Pogacnik <samo_pogacnik@t-2.net> wrote:
> > while i was searching for effective logging of complete console output
> > produced by the kernel and user phase of the boot process, it turned out
> > that only kernel messages imho get systematically cached and stored into
> > log files (if needed). All userspace processes are on their own to use
> > syslog, which is fine, but there are also many console messages
> > reporting the boot status via init scripts, .... I came across the
> > bootlogd daemo, which handles the job of redirecting console output into
> > a log file, but i find it problematic to use especialy, when using
> > initial ram disk image.
> >
> > So in short i came up with an idea to transform console writes into
> > printks at appropriate code place of some console drivers (the patch
> > includes code for VT console and SERIAL_CORE console drivers). Printks
> > eventually reach console device avoiding the patched part of the console
> > drivers.
> 
> What about catching /dev/console instead of VT console,  SERIAL_CORE
> console, ...?
> Then it works with whatever console= parameter you specify.

Could not agree more, but that was as close as i was able to detect the
common code and provide something that actually works. Maybe this is
already enough to cover all boot consoles? 

> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds

regards, Samo
