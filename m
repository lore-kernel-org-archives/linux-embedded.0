From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Mon, 23 Nov 2009 15:29:43 +0000
Message-ID: <20091123152943.GC3987@sirena.org.uk>
References: <cover.1224093510.git.bgat@billgatliff.com> <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com> <200911170027.38664.david-b@pacbell.net> <fa686aa40911201421k67d1de27u2c6dbe337989696b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fa686aa40911201421k67d1de27u2c6dbe337989696b@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@secretlab.ca>
Cc: David Brownell <david-b@pacbell.net>, Bill Gatliff <bgat@billgatliff.com>, linux-embedded@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>

On Fri, Nov 20, 2009 at 03:21:31PM -0700, Grant Likely wrote:
> On Tue, Nov 17, 2009 at 1:27 AM, David Brownell <david-b@pacbell.net> wrote:

> > Since *everything* boils down to one or more signal lines,
> > your argument leads directly to Linux having no native
> > hardware interface except GPIOs. ?Not ... practical. ;)

> I think you've missed my point and taken it to an illogical extreme to
> counter it.  I agree that PWMs are not GPIOs and visa versa.  However,
> *some* devices are both GPIOs and PWMs.  Also what is needed to manage
> GPIO and PWM pins is pretty much identical.

On most of the ARM SoCs PWM and GPIO aren't particularly special here -
most of the on-SoC functionality is multiplexed onto pins through the
same hardware interface.  A very large proportion of the pins of the SoC
will have muxes to bring out the signals from the internal IP blocks,
and pretty much all of those will have GPIO as one of those functions.

For many SoCs there will be multiple pin options for bringing out each
of the internal signals which complicates matters further.

> But that *isn't* the primary purpose of the GPIO subsystem.  All that
> stuff is layered on top of the GPIO pin management code and doesn't
> really play into this debate.

The GPIO subsystem isn't doing pin management in that way for most
systems, it's just controlling the GPIO functionality and relies on
separate configuration to ensure that the relevant pins are in GPIO
mode.
