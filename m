From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: cross-compiling alternatives
Date: Mon, 16 Jun 2008 10:28:30 +0200
Message-ID: <1213604910.1710.32.camel@tara.firmix.at>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <20080613184555.GR13599@pengutronix.de>
	 <20080615231241.GA8899@nibiru.local>
	 <200806161002.25385.neundorf@eit.uni-kl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200806161002.25385.neundorf@eit.uni-kl.de>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Neundorf <neundorf@eit.uni-kl.de>
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Mon, 2008-06-16 at 10:02 +0200, Alexander Neundorf wrote:
[...]
> Seriously, why is a wrapper for the compiler/linker required AT ALL if the 
> calls to these tools are made from _generated_ files ?

AFAIU the motivation of libtool to provide OS-independent (and toolchain
independent?) means to compile and link (etc.).

> The generated files should just contain the appropriate calls for the 
> respective commands.

But these calls are - e.g. for shared libraries - not identical. The Gnu
toolchain is not everything.

> This layer of abstraction is unnecessary and IMO just adds confusion. 
> (modifying libtool so that it calls unitool even seems to add yet another 
> layer which can potentially break or bitrot etc.)

I know of more than one "occasion" where "gcc" et.al. actually where
wrappers around the actually binaries to check and guarantee commandline
parameters and options (some must be there, some mustn't be there, ...).
Usually sane Makefiles (and sane autotools usages) are enough for that.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


