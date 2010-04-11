From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: A better way to sequence driver initialization?
Date: Sun, 11 Apr 2010 10:47:51 +0900
Message-ID: <20100411014751.GB16099@linux-sh.org>
References: <4BBF7E9C.80604@billgatliff.com> <1270889597.6865.107.camel@pasglop> <4BC07EAD.9020307@billgatliff.com> <20100410233909.GA16099@linux-sh.org> <k2ufa686aa41004101647md1e8cfbfw85c5b98b9613cd2d@mail.gmail.com> <4BC12701.7000208@billgatliff.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4BC12701.7000208@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux-embedded <linux-embedded@vger.kernel.org>

On Sat, Apr 10, 2010 at 08:33:53PM -0500, Bill Gatliff wrote:
> Grant Likely wrote:
> > On Sat, Apr 10, 2010 at 5:39 PM, Paul Mundt <lethal@linux-sh.org> wrote:
> >   
> >> In cases where you can specifically note that dependencies, doing so will
> >> save you a world of pain. Despite that, it's simply not possible to do
> >> this as a free-for-all. Devices or busses that can tolerate multi-threaded
> >> probing need to be converted over one at a time, but even then you still
> >> need the dependency tracking for those that depend on link order today.
> >>     
> 
> Who's to say a function like gpio_request_wait_for_it(GPIO_NUMBER,
> "dependent-driver") isn't the way to do the dependency tracking?  I
> can't even implement that without a context that can sleep...
> 
In some cases that might be valid, but there are many cases where drivers
can reconfigure their capability sets based on which GPIOs are and aren't
available. Just because a pin isn't available doesn't make it a
show-stopper for the probe path..
