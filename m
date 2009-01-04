From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 3 Jan 2009 19:47:20 -0600
Message-ID: <200901031947.21179.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <20090103201059.GA4875@uranus.ravnborg.org> <495FCFA3.4030000@zytor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <495FCFA3.4030000@zytor.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Matthieu CASTET <matthieu.castet@parrot.com>, Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Saturday 03 January 2009 14:50:43 H. Peter Anvin wrote:
> Sam Ravnborg wrote:
> > With respect to your three patches the plan is to:
> > - add the updated timeconst patch to kbuild-next
>
> If you add this, you take the responsibility for the breakages that will
> occur.  The reason his patch is "simpler" is because he removes the
> arbitrary-precision arithmetic, and simply hopes that the system
> utilities that he uses uses an integer size which happens to be big enough.

Actually once I _noticed_ that ADJ32 could overflow (none of the other values 
can), it was fairly easy to prevent it from doing so.  I added some comments 
analyzing the pathological case (HZ 1, assuming nobody's interested in 
HZ>1000000).

> 	-hpa

Rob
