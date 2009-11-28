From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Sat, 28 Nov 2009 13:54:11 -0800
Message-ID: <200911281354.11653.david-b@pacbell.net>
References: <cover.1224093510.git.bgat@billgatliff.com> <fa686aa40911230944o197c732bo2d2e5f0aacd936b7@mail.gmail.com> <20091123180920.GA1404@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20091123180920.GA1404@rakim.wolfsonmicro.main>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>

On Monday 23 November 2009, Mark Brown wrote:
> Judging from some of the other messages in the thread I suspect you're
> thinking of a much closer mapping between PWM and GPIO pins - many SoCs
> do have distinct PWM controllers that aren't terribly tied to a GPIO
> pin. 

Sometimes they can be coupled to one of several pins ... possibly
even outputting to several at the same time.


> For them the whole concept of requesting a "pin" or having the PWM 
> controller be tied to a particular pin is going to be at best confusing,
> you really do want to request the PWM controller itself and let the pin
> mux setup figure out where that emerges from the SoC.

Nicely put.  At some level one ends with something like "pwm.2 channel 3"
getting allocated, and does not care about pins except as more low-level
artifacts to be ignored outside of board setup code.

- Dave
