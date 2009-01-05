From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with
	kernel/timeconst.sh
Date: Mon, 05 Jan 2009 01:15:30 +0100
Message-ID: <1231114530.3310.6.camel@gimli.at.home>
References: <200901020207.30359.rob@landley.net>
	 <200901031936.04642.rob@landley.net>
	 <25035.1231045675@turing-police.cc.vt.edu>
	 <200901040043.08577.rob@landley.net> <20090104221356.GA32357@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090104221356.GA32357@shareable.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Rob Landley <rob@landley.net>, Valdis.Kletnieks@vt.edu, Ingo Oeser <ioe-lkml@rameria.de>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Son, 2009-01-04 at 22:13 +0000, Jamie Lokier wrote:
> Rob Landley wrote:
> > In a private email, Bernd Petrovitsch suggested "set -- $i" and then
> > using NAME=$1; PERIOD=$2.  (I keep getting private email responses
> > to these sort of threads, and then getting dismissed as the only one
> > who cares about the issue.  Less so this time around, but still...)
> > This apparently works all the way back to the bourne shell.
> 
> If you're going "all the way back to the bourne shell", don't use "set

"Going back to a Bourne shell" was neither the intention nor makes it
sense IMHO.
I mentioned it to point out that the `set -- ' (or `set x `) is nothing
new or even a bash-ism.

> -- $i"; use "set x $i" instead, and don't expect to do any arithmetic
> in the shell; use "expr" or "awk" for arithmetic.
> 
> (Not relevant to kernel scripts, imho, since you can always assume
> something a bit more modern and not too stripped down).

ACK. A bash can IMHO be expected. Even going for `dash` is IMHO somewhat
too extreme.

> (I have 850 Linux boxes on my network with a bourne shell which
> doesn't do $((...)).  I won't be building kernels on them though :-)

Believe it or not, but there are folks out there who build the firmware
on ARM 200 MHz NFS-mounted systems natively  (and not simply
cross-compile it on a 2GHz PC .....).

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services
