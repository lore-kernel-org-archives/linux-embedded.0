From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: Adding a new platform
Date: Wed, 20 Aug 2008 13:44:02 +0900
Message-ID: <20080820044402.GA12839@linux-sh.org>
References: <48AB0A7A.8040209@cisco.com> <7d1d9c250808192019g6ec73ec7x53563b8ad2130df@mail.gmail.com> <f608b67d0808192057w29988500o2793dfb7f0c99314@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f608b67d0808192057w29988500o2793dfb7f0c99314@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vb <vb@vsbe.com>
Cc: Paul Gortmaker <paul.gortmaker@gmail.com>, Linux Embedded Maillist <linux-embedded@vger.kernel.org>, corbet@lwn.net

On Tue, Aug 19, 2008 at 08:57:59PM -0700, vb wrote:
> On Tue, Aug 19, 2008 at 8:19 PM, Paul Gortmaker
> <paul.gortmaker@gmail.com> wrote:
> > On Tue, Aug 19, 2008 at 2:01 PM, David VomLehn <dvomlehn@cisco.com> wrote:
> >> I'm working to educate our management on the need to get our platform in the
> >> kernel mainline. I expect I will be asked to tell them how much work this
> >> is. What do we need to do to add a new MIPS platform?
> >
> > Based on the phrase "educate our management"  -- I would strongly suggest you
> > have a look at Jonathan Corbet's document that describes the process and the
> > eventual value-add of having things in-kernel -- with an audience of non-kernel
> > hackers in mind.  I think this will really assist you in your efforts,
> > and I'm glad that
> > Jonathan put the time into this that he did.
> >
> > His original post can be viewed here:
> >
> > http://lkml.org/lkml/2008/7/29/363
> >
> > or here:
> >
> > http://lwn.net/Articles/291967/
> >
> 
> This indeed is a very interesting document. I can hardly agree with
> the below point, however:
> 
> +- While kernel developers strive to maintain a stable interface to user
> +  space, the internal kernel API is in constant flux.  The lack of a stable
> +  internal interface is a deliberate design decision; it allows fundamental
> +  improvements to be made at any time and results in higher-quality code.
> +  But one result of that policy is that any out-of-tree code requires
> +  constant upkeep if it is to work with new kernels.  Maintaining
> +  out-of-tree code requires significant amounts of work just to keep that
> +  code working.
> 
> so, say a developer submits a proprietary driver and it gets accepted.

This doesn't make any sense to begin with. It's not possible to merge a
proprietary driver in to the kernel. If you're talking about a GPLed
driver, then the word proprietary here is meaningless (ie, whether
hardware is widely available or not is not a concern as long as someone
is actively looking after the code). On the other hand, if you are
talking about an out-of-tree driver, then the maintenance burden is
purely on whoever is maintaining that.

> Then some internal kernel interface gets changed. Who now has to
> modify and retest the driver? Is it the person who introduces the
> change (how can he even do this, as he does not have the proprietary
> hardware available)? Or is this the original submitter - then where is
> the benefit of saving on upkeep?
> 
In the general case, interface changes are done carefully, and in-tree
users are converted over as to minimize breakage. Obviously whoever is
making the change is not going to be able to test each driver, so it
usually comes down to common sense. If there's something that's
potentially problematic for a given driver, then testing is solicited
from those that have a vested interest in the continued functionality of
said driver. Likewise, if the change goes in and breaks things, that's a
regression, and is usually reverted or quickly fixed once it's been
identified. People that habitually cause regressions will suddenly find
it much more difficult to get anything applied to the kernel, it's fairly
self-regulating.

People don't inherently go out of their way to break others code, but it
certainly does happen. The main thing is that we have a pretty good
process in place to handle those sorts of problems as they come up, so
there's generally no reason _not_ to keep things changing.

On the embedded side there is obviously the issue that some people will
only test things once or twice a year, but at that level of active
involvement, they may as well just do all of their things out-of-tree
instead.

> This constant change of the kernel innards is hardly a good selling
> point, would you agree?
> 
No, but there are others that might. Have you considered BSD?
