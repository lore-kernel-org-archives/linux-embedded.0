From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with
	kernel/timeconst.sh
Date: Mon, 05 Jan 2009 11:46:18 +0100
Message-ID: <1231152378.3326.14.camel@gimli.at.home>
References: <200901020207.30359.rob@landley.net>
	 <200901031936.04642.rob@landley.net>
	 <25035.1231045675@turing-police.cc.vt.edu>
	 <200901040043.08577.rob@landley.net> <20090104221356.GA32357@shareable.org>
	 <1231114530.3310.6.camel@gimli.at.home>
	 <20090105022349.GB1345@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090105022349.GB1345@shareable.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Rob Landley <rob@landley.net>, Valdis.Kletnieks@vt.edu, Ingo Oeser <ioe-lkml@rameria.de>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Mon, 2009-01-05 at 02:23 +0000, Jamie Lokier wrote:
> Bernd Petrovitsch wrote:
> > > (I have 850 Linux boxes on my network with a bourne shell which
> > > doesn't do $((...)).  I won't be building kernels on them though :-)
> > 
> > Believe it or not, but there are folks out there who build the firmware
> > on ARM 200 MHz NFS-mounted systems natively  (and not simply
> > cross-compile it on a 2GHz PC .....).
> 
> Really?
> 
> My 850 Linux boxes are 166MHz ARMs and occasionally NFS-mounted.
> Their /bin/sh does not do $((...)), and Bash is not there at all.

I assume that the NFS-mounted root filesystem is a real distribution.
And on the local flash is a usual busybox based firmware.

> If I were installing GCC natively on them, I'd install GNU Make and a
> proper shell while I were at it.  But I don't know if Bash works

ACK.

> properly without fork()* - or even if GCC does :-)
> 
> Perl might be hard, as shared libraries aren't supported by the
> toolchain which targets my ARMs* and Perl likes its loadable modules.

The simplest way to go is probably to use CentOS or Debian or another
ready binary distribution on ARM (or MIPS or PPC or whatever core the
embedded system has) possibly on a custom build kernel (if necessary).

[...]
> (* - No MMU on some ARMs, but I'm working on ARM FDPIC-ELF to add
>      proper shared libs.  Feel free to fund this :-)

The above mentioned ARMs have a MMU. Without MMU, it would be truly
insane IMHO.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services
