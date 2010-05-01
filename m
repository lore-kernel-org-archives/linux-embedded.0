From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] console logging detour via printk
Date: Sat, 1 May 2010 11:00:22 +0200
Message-ID: <z2r10f740e81005010200we353e3a4v90d9fe64620edb24@mail.gmail.com>
References: <1272664980.10241.77.camel@itpsd6lap>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type;
        bh=vmTfNz5l203PtCKhgfCmcNNgK7qg/Mg9V/4pWfc5+RY=;
        b=JWHnAM4mjw//n7Gf/47kyQwPLAhMiVvPV/EwBFLPtrhh4hqYob9JGex4pg/kJ/uiyW
         axnGacwFwQ8YSsotboLxjgPhSPYjnIVXhbCjZL97uuKua2fj4ImdgtIRPVsLOjXVjYHQ
         zjYnp7N6EubC9guWYZy7lETbDmFKAp1bP1sAc=
In-Reply-To: <1272664980.10241.77.camel@itpsd6lap>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samo Pogacnik <samo_pogacnik@t-2.net>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Sat, May 1, 2010 at 00:03, Samo Pogacnik <samo_pogacnik@t-2.net> wrote:
> while i was searching for effective logging of complete console output
> produced by the kernel and user phase of the boot process, it turned out
> that only kernel messages imho get systematically cached and stored into
> log files (if needed). All userspace processes are on their own to use
> syslog, which is fine, but there are also many console messages
> reporting the boot status via init scripts, .... I came across the
> bootlogd daemo, which handles the job of redirecting console output into
> a log file, but i find it problematic to use especialy, when using
> initial ram disk image.
>
> So in short i came up with an idea to transform console writes into
> printks at appropriate code place of some console drivers (the patch
> includes code for VT console and SERIAL_CORE console drivers). Printks
> eventually reach console device avoiding the patched part of the console
> drivers.

What about catching /dev/console instead of VT console,  SERIAL_CORE
console, ...?
Then it works with whatever console= parameter you specify.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
