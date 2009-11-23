From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Mon, 23 Nov 2009 18:09:20 +0000
Message-ID: <20091123180920.GA1404@rakim.wolfsonmicro.main>
References: <cover.1224093510.git.bgat@billgatliff.com>
 <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com>
 <200911170027.38664.david-b@pacbell.net>
 <fa686aa40911201421k67d1de27u2c6dbe337989696b@mail.gmail.com>
 <20091123152943.GC3987@sirena.org.uk>
 <fa686aa40911230944o197c732bo2d2e5f0aacd936b7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fa686aa40911230944o197c732bo2d2e5f0aacd936b7@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@secretlab.ca>
Cc: David Brownell <david-b@pacbell.net>, Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>

On Mon, Nov 23, 2009 at 10:44:25AM -0700, Grant Likely wrote:

> Right, pin-mux is a different problem.  But there are also devices
> that implement both PWM and GPIO functionality in the same IP block.

That's not the general case, though - most of the SoCs seem to have PWM
as a separate IP block.  In the general case PWM and GPIO have nothing
to do with each other.  

> I think pin muxing, and pin controller drivers are different problem
> domains and should be handled separately.

...

> Sorry. when I said pin management I meant how Linux keeps track of pin
> controllers.  Not pin mux.  I should use different terminology perhaps
> to reduce confusion.

I have to confess I'm a bit lost as to what you mean by a "pin
controller" as opposed to "pin mux" interface.  For a substantial
proportion of ARMs they're going to be one and the same.

Judging from some of the other messages in the thread I suspect you're
thinking of a much closer mapping between PWM and GPIO pins - many SoCs
do have distinct PWM controllers that aren't terribly tied to a GPIO
pin.  For them the whole concept of requesting a "pin" or having the PWM
controller be tied to a particular pin is going to be at best confusing,
you really do want to request the PWM controller itself and let the pin
mux setup figure out where that emerges from the SoC.
