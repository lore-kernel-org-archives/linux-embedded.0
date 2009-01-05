From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with kernel/timeconst.sh
Date: Mon, 5 Jan 2009 02:23:49 +0000
Message-ID: <20090105022349.GB1345@shareable.org>
References: <200901020207.30359.rob@landley.net> <200901031936.04642.rob@landley.net> <25035.1231045675@turing-police.cc.vt.edu> <200901040043.08577.rob@landley.net> <20090104221356.GA32357@shareable.org> <1231114530.3310.6.camel@gimli.at.home>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1231114530.3310.6.camel@gimli.at.home>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Petrovitsch <bernd@firmix.at>
Cc: Rob Landley <rob@landley.net>, Valdis.Kletnieks@vt.edu, Ingo Oeser <ioe-lkml@rameria.de>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

Bernd Petrovitsch wrote:
> > (I have 850 Linux boxes on my network with a bourne shell which
> > doesn't do $((...)).  I won't be building kernels on them though :-)
> 
> Believe it or not, but there are folks out there who build the firmware
> on ARM 200 MHz NFS-mounted systems natively  (and not simply
> cross-compile it on a 2GHz PC .....).

Really?

My 850 Linux boxes are 166MHz ARMs and occasionally NFS-mounted.
Their /bin/sh does not do $((...)), and Bash is not there at all.

If I were installing GCC natively on them, I'd install GNU Make and a
proper shell while I were at it.  But I don't know if Bash works
properly without fork()* - or even if GCC does :-)

Perl might be hard, as shared libraries aren't supported by the
toolchain which targets my ARMs* and Perl likes its loadable modules.

I'm not sure why I would want to build a kernel on these devices.

But I see why people with mobile ARM devices like gphones might
want to, when they're out travelling.

-- Jamie

(* - No MMU on some ARMs, but I'm working on ARM FDPIC-ELF to add
     proper shared libs.  Feel free to fund this :-)
