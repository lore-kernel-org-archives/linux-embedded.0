From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: A better way to sequence driver initialization?
Date: Sat, 10 Apr 2010 22:30:20 -0500
Message-ID: <4BC1424C.8030309@billgatliff.com>
References: <4BBF7E9C.80604@billgatliff.com> <1270889597.6865.107.camel@pasglop> <4BC07EAD.9020307@billgatliff.com> <20100410233909.GA16099@linux-sh.org> <k2ufa686aa41004101647md1e8cfbfw85c5b98b9613cd2d@mail.gmail.com> <4BC12701.7000208@billgatliff.com> <20100411014751.GB16099@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20100411014751.GB16099@linux-sh.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Mundt <lethal@linux-sh.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux-embedded <linux-embedded@vger.kernel.org>

Paul Mundt wrote:
> In some cases that might be valid, but there are many cases where drivers
> can reconfigure their capability sets based on which GPIOs are and aren't
> available. Just because a pin isn't available doesn't make it a
> show-stopper for the probe path..
>   

Understood.

I just tweaked my kernel to run all probe()s  in their own kthreads. 
The results were a mixed bag, as expected.

On the one hand, it's pretty cool to see everything running in parallel!

On the other hand, I can see now yet another big reason why a probe
free-for-all won't work.  Busses are also devices, so there are plenty
of places where a device for a particular bus type won't be able to
probe because the target bus simply doesn't exist yet.  That's yet
another dependency that I hadn't thought about.

Were I to rewrite Linux :), I would make probing parallel from the
beginning.  But I think I'm going to have to settle for now with
kthreading my probes that might want to sleep, and adding a wait queue
to gpio_request() and a few others.  It ain't perfect, but it is
achieveable.  *sigh*


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
