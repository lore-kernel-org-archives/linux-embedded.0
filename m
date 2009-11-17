From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Tue, 17 Nov 2009 00:47:02 -0700
Message-ID: <200911162347.02364.david-b@pacbell.net>
References: <cover.1224093510.git.bgat@billgatliff.com> <8bd0f97a0911132022pf743558lfef1402125d4b60b@mail.gmail.com> <fa686aa40911132355t3b79fe46m90005ecba453dcc1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40911132355t3b79fe46m90005ecba453dcc1@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Mike Frysinger <vapier.adi@gmail.com>, Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org

On Friday 13 November 2009, Grant Likely wrote:
> 		  Right now, I don't
> see a fundamental difference is between GPIO and PWM pin management.
> It is essentially the same problem, and in many cases PWM pins can
> also be used as GPIOs. 

Pin management for a given SoC is going to be relevant to setting
every signal, no matter what peripheral it's associated with.  The
same argument applies to an MDIO bus, I2C, 1-wire, and more.

And I don't buy it in those cases either.


> I think the question should be flipped around; 
> rather than asking for a compelling reason for them to be merged; I
> want to know the compelling reason to keep them separate.  What is the
> fundamental difference that keeps them apart?

PWM is about periodic signal generation without CPU intervention.

GPIO is about explicit CPU management/interrogation of single
signals.


> What I would like to see is the PWM functions added to the GPIO API.

No.  If you want a pin mux interface, come up with one of them.

It shouldn't be a PWM interface, a GPIO interface, an I2C interface,
a SPI interface, an MDIO interface, a 1-wire interface ... or any of
dozens of other things.  It'd be purely for pinmux.

