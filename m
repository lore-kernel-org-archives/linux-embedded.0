From: Rob Landley <rob@landley.net>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight bootloader
Date: Sun, 27 Dec 2009 01:17:17 -0600
Message-ID: <200912270117.18130.rob@landley.net>
References: <4B29EC68.1040109@0xlab.org> <20091222111250.GW22533@pengutronix.de> <4B3146E9.3010101@warmcat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B3146E9.3010101@warmcat.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: celinux-dev@tree.celinuxforum.org
Cc: Andy Green <andy@warmcat.com>, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org

On Tuesday 22 December 2009 16:23:37 Andy Green wrote:
> On 12/22/09 11:12, Somebody in the thread at some point said:
>
> Hi Robert -
>
> >> (Personally I used Fedora ARM port and RPM, but any distro and
> >> packagesystem like Debian workable on ARM would be fine).
> >
> > Until now, we are using the "build it yourself" approach with ptxdist,
> > basically because of these reasons:
> >
> > - If something goes wrong, we want to be able to fix it, which means
> >    that we must be able to recompile everything. Having the source is no
> >    value by itself, if you are not able to build it.
>
> Fedora provides a whole solution there, with the restriction it's
> designed for native build, not cross.

QEMU: it's not just for breakfast anymore.

Rob
-- 
Latency is more important than throughput. It's that simple. - Linus Torvalds
