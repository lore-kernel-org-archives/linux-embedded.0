From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Mon, 16 Jun 2008 10:02:25 +0200
Message-ID: <200806161002.25385.neundorf@eit.uni-kl.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <20080613184555.GR13599@pengutronix.de> <20080615231241.GA8899@nibiru.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080615231241.GA8899@nibiru.local>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Monday 16 June 2008 01:12:41 Enrico Weigelt wrote:
> * Robert Schwebel <r.schwebel@pengutronix.de> schrieb:
>
> Hi,
>
> > Instead of hacking around and inventing new things, you should have
> > spent your time for improving libtool ...
>
> No, not with libtool.
> I do not want to support that insane approach of tweaking command
> lines in the middle - it's an Pandorra's Box. I've already spent
> too much time on it and decided to completely drop it.
>
> Instead I prefer *clean* lines.
>
> Unitool provides commands on an higher level than, gcc+co do.
> These commands are on an higher functional level, hiding the
> individual platform's details. Also including things like importing
> .la-libs, sysroot, etc.
>
> Lt-unitool is a wrapper which parses the libtool commands and calls
> Unitool to do the actual work.

Seriously, why is a wrapper for the compiler/linker required AT ALL if the 
calls to these tools are made from _generated_ files ?
The generated files should just contain the appropriate calls for the 
respective commands.
This layer of abstraction is unnecessary and IMO just adds confusion. 
(modifying libtool so that it calls unitool even seems to add yet another 
layer which can potentially break or bitrot etc.)

Alex
