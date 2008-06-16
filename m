From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: cross-compiling alternatives
Date: Mon, 16 Jun 2008 11:25:42 +0200
Message-ID: <200806161125.42575.neundorf@eit.uni-kl.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806161002.25385.neundorf@eit.uni-kl.de> <1213604910.1710.32.camel@tara.firmix.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1213604910.1710.32.camel@tara.firmix.at>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Monday 16 June 2008 10:28:30 Bernd Petrovitsch wrote:
> On Mon, 2008-06-16 at 10:02 +0200, Alexander Neundorf wrote:
> [...]
>
> > Seriously, why is a wrapper for the compiler/linker required AT ALL if
> > the calls to these tools are made from _generated_ files ?
>
> AFAIU the motivation of libtool to provide OS-independent (and toolchain
> independent?) means to compile and link (etc.).
>
> > The generated files should just contain the appropriate calls for the
> > respective commands.
>
> But these calls are - e.g. for shared libraries - not identical. The Gnu
> toolchain is not everything.

Yes, that's what I mean. The commands for calling the tools are generated. 
They should be generated appropriately for the respective toolchains (i.e. 
the generator must know how to call the different toolchains). No 
libtool/unitool/other wrappers required.

Alex
