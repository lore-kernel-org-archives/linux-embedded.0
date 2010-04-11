From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: A better way to sequence driver initialization?
Date: Sat, 10 Apr 2010 20:31:31 -0500
Message-ID: <4BC12673.2090602@billgatliff.com>
References: <4BBF7E9C.80604@billgatliff.com> <1270889597.6865.107.camel@pasglop> <4BC07EAD.9020307@billgatliff.com> <20100410233909.GA16099@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20100410233909.GA16099@linux-sh.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Mundt <lethal@linux-sh.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux-embedded <linux-embedded@vger.kernel.org>

Paul Mundt wrote:
>
> In cases where you can specifically note that dependencies, doing so will
> save you a world of pain. Despite that, it's simply not possible to do
> this as a free-for-all. Devices or busses that can tolerate multi-threaded
> probing need to be converted over one at a time, but even then you still
> need the dependency tracking for those that depend on link order today.
>   

Right now I'm thinking mostly about GPIO devices which need to register
before things like gpio-leds can use them.  Sometimes the GPIO expansion
chip of interest is on i2c, other times it's spi, and still others it's
a platform or USB device.  Linking the gpio-led driver late helps that
specific situation.

But what about when I want to use a pin on a GPIO expansion device as
the card-detect for an MMC slot?  Or, as I've just recently noticed in
one hardware platform I'm working on, using a pin on a SPI GPIO expander
as a chip-select for another SPI device, but through gpiolib? 
Eventually, the dependencies don't become circular but changing the link
order will break some and fix others.  Ugh.

Definitely, a free-for-all isn't going to work.  But I don't think that
having every driver do its own kthread_run() is a solution, either. 
I'll keep tinkering.  :)


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
