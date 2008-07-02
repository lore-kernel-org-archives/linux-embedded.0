From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH v4 2/6] dmaengine: Add dma_chan_is_in_use() function
Date: Wed, 2 Jul 2008 09:56:04 +0200
Message-ID: <20080702095604.33c5f62b@hskinnemo-gx745.norway.atmel.com>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-2-git-send-email-haavard.skinnemoen@atmel.com>
	<1214486603-23655-3-git-send-email-haavard.skinnemoen@atmel.com>
	<e9c3a7c20807011831n74eb69b8r3095b62515fe5c9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <e9c3a7c20807011831n74eb69b8r3095b62515fe5c9@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Williams <dan.j.williams@intel.com>
Cc: Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, shannon.nelson@intel.com, David Brownell <david-b@pacbell.net>

"Dan Williams" <dan.j.williams@intel.com> wrote:
> On Thu, Jun 26, 2008 at 6:23 AM, Haavard Skinnemoen
> <haavard.skinnemoen@atmel.com> wrote:
> > This moves the code checking if a DMA channel is in use from
> > show_in_use() into an inline helper function, dma_is_in_use(). DMA
> > controllers can use this in order to give clients exclusive access to
> > channels (usually necessary when setting up slave DMA.)
> >
> > I have to admit that I don't really understand the channel refcounting
> > logic at all... dma_chan_get() simply increments a per-cpu value. How
> > can we be sure that whatever CPU calls dma_chan_is_in_use() sees the
> > same value?
> 
> As Chris noted in the comments at the top of dmaengine.c this is an
> implementation Rusty's 'bigref'.  It seeks to avoid the
> cache-line-bouncing overhead of maintaining a single global refcount
> in hot paths like tcp_v{4,6}_rcv().  When the channel is being
> removed, a rare event, we transition to the accurate, yet slow, global
> method.

Ok, I was sort of wondering what happens if you call dma_chan_get() on
one cpu and dma_chan_put() on a different cpu later on. But it looks
like when it really matters, the sum across all cpus is used, so the end
result will be correct.

> Your observation is correct, dma_chan_is_in_use() may lie in the case
> when the current cpu is not using the channel.  For this particular
> test I think you can look to see if this channel's resources are
> already allocated.  If they are then some other client got a hold of
> this channel before the current attempt.  Hmm... that would also
> require that we free the channel's resources in the case where the
> client replies with DMA_NAK, probably something we should do anyways.

Yes, I think that's good thing to do in general. In fact, I think the
dw_dmac driver will waste a channel for each slave because it always
assigns the channel to the client even if the client may NAK or DUP it
later on. I haven't seen this actually happening because I only have
one slave client at the moment.

Another reason to do this is to reclaim the memory used for
descriptors. Currently, a channel that was NAK'ed or DUP'ed will still
have a lot of preallocated descriptors, possibly with client-specific
parameters already set up.

Haavard
