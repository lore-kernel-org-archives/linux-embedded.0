From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with kernel/timeconst.sh
Date: Sun, 4 Jan 2009 22:13:57 +0000
Message-ID: <20090104221356.GA32357@shareable.org>
References: <200901020207.30359.rob@landley.net> <200901031936.04642.rob@landley.net> <25035.1231045675@turing-police.cc.vt.edu> <200901040043.08577.rob@landley.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200901040043.08577.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Landley <rob@landley.net>
Cc: Valdis.Kletnieks@vt.edu, Ingo Oeser <ioe-lkml@rameria.de>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

Rob Landley wrote:
> In a private email, Bernd Petrovitsch suggested "set -- $i" and then
> using NAME=$1; PERIOD=$2.  (I keep getting private email responses
> to these sort of threads, and then getting dismissed as the only one
> who cares about the issue.  Less so this time around, but still...)
> This apparently works all the way back to the bourne shell.

If you're going "all the way back to the bourne shell", don't use "set
-- $i"; use "set x $i" instead, and don't expect to do any arithmetic
in the shell; use "expr" or "awk" for arithmetic.

(Not relevant to kernel scripts, imho, since you can always assume
something a bit more modern and not too stripped down).

(I have 850 Linux boxes on my network with a bourne shell which
doesn't do $((...)).  I won't be building kernels on them though :-)

-- Jamie
