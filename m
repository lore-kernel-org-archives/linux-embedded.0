From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: A better way to sequence driver initialization?
Date: Sun, 11 Apr 2010 17:18:48 +1000
Message-ID: <1270970328.6865.119.camel@pasglop>
References: <4BBF7E9C.80604@billgatliff.com>
	 <1270889597.6865.107.camel@pasglop> <4BC07EAD.9020307@billgatliff.com>
	 <20100410233909.GA16099@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20100410233909.GA16099@linux-sh.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Mundt <lethal@linux-sh.org>
Cc: Bill Gatliff <bgat@billgatliff.com>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux-embedded <linux-embedded@vger.kernel.org>

On Sun, 2010-04-11 at 08:39 +0900, Paul Mundt wrote:
> This is a common problem for drivers that are all stuck on the same
> initcall level and as a result are entirely dependent on link order. Some
> more intelligent logic via the bus notifiers would help with some of
> this, but it wouldn't help with drivers that are effectively unable to
> probe for devices and that are entirely dependent on registration timing
> to make sure that their backing device has become available.

Right. Exactly my problem with EMAC for example.

> You could also look at doing multi-threaded probing at the bus level
> where the semantics and implications are better understood, but that
> still doesn't necessarily help with ordering. (ie, registering a GPIO
> expander on a PCI MFD before being able to bring up gpio-leds or
> so). There has been past work for both multi-threading the probe routines
> as well as constraining it and only doing it for things like PCI.

I'd like to detatch the ordering problem from the threading feature,
those are mostly orthogonal. We could solve the ordering problem with
either some creative way of defining dependencies statically (but I
personally think that's doomed) or a way for probe() to return -EAGAIN
after the driver got a chance to attach itself to some kind of mechanism
to re-trigger the probing when some condition is satisfied (bus
notifier ? exported service names as in my previous example ? some combo
of these ?).

Then for archs like powerpc, we can add a layer to automate maybe the
dependency resolution by using the device-tree, though the underlying
mechanism doesn't need to be device-tree based.

> In cases where you can specifically note that dependencies, doing so will
> save you a world of pain. Despite that, it's simply not possible to do
> this as a free-for-all. Devices or busses that can tolerate multi-threaded
> probing need to be converted over one at a time, but even then you still
> need the dependency tracking for those that depend on link order today.
> 
> Vendors often end up doing this sort of work for device-specific kernels
> where the underlying set of drivers is fixed, so there are also some
> alternative approaches you can investigate there (OLPC comes to mind).

As I said above, I think we should keep the dependency handling from the
threading two separate things :-)



