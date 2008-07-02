From: "Dan Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 2/6] dmaengine: Add dma_chan_is_in_use() function
Date: Tue, 1 Jul 2008 18:31:25 -0700
Message-ID: <e9c3a7c20807011831n74eb69b8r3095b62515fe5c9@mail.gmail.com>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
	 <1214486603-23655-2-git-send-email-haavard.skinnemoen@atmel.com>
	 <1214486603-23655-3-git-send-email-haavard.skinnemoen@atmel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=u850g2y4NfwwhYoW/brkITTUGPddTEEO4BLbEDXkoF8=;
        b=WTTn0Zkho5O1sNb3IskHsDqiL30gXn0RJb2egnzB3Xt98PZmnXxPRSHB07JIYRsPJd
         T5iRAaUmmobjFBTjv+km/1S41OdqGi6uQYjFrDMQqeiAL8BT8XliIueVhBHD9dvgj6mK
         d+1YYh9DK8EwFOidAFewVs4HeEj0Z/pbl3IkY=
In-Reply-To: <1214486603-23655-3-git-send-email-haavard.skinnemoen@atmel.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, shannon.nelson@intel.com, David Brownell <david-b@pacbell.net>

On Thu, Jun 26, 2008 at 6:23 AM, Haavard Skinnemoen
<haavard.skinnemoen@atmel.com> wrote:
> This moves the code checking if a DMA channel is in use from
> show_in_use() into an inline helper function, dma_is_in_use(). DMA
> controllers can use this in order to give clients exclusive access to
> channels (usually necessary when setting up slave DMA.)
>
> I have to admit that I don't really understand the channel refcounting
> logic at all... dma_chan_get() simply increments a per-cpu value. How
> can we be sure that whatever CPU calls dma_chan_is_in_use() sees the
> same value?

As Chris noted in the comments at the top of dmaengine.c this is an
implementation Rusty's 'bigref'.  It seeks to avoid the
cache-line-bouncing overhead of maintaining a single global refcount
in hot paths like tcp_v{4,6}_rcv().  When the channel is being
removed, a rare event, we transition to the accurate, yet slow, global
method.

Your observation is correct, dma_chan_is_in_use() may lie in the case
when the current cpu is not using the channel.  For this particular
test I think you can look to see if this channel's resources are
already allocated.  If they are then some other client got a hold of
this channel before the current attempt.  Hmm... that would also
require that we free the channel's resources in the case where the
client replies with DMA_NAK, probably something we should do anyways.

Thoughts?

--
Dan
