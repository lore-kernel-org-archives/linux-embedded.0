From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Fri, 13 Nov 2009 12:08:18 -0700
Message-ID: <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com>
References: <cover.1224093510.git.bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <cover.1224093510.git.bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>, David Brownell <dbrownell@users.sourceforge.net>

Hi Bill

On Wed, Oct 15, 2008 at 11:14 AM, Bill Gatliff <bgat@billgatliff.com> w=
rote:
> This series implements a Generic PWM Device API, including reference
> implementations for the Atmel PWMC device, an LED device, and an LED
> trigger. =A0It is based on linux-2.6.27.
[...]
> The implementation of the Generic PWM Device API is structurally
> similar to the generic GPIO API, except that the PWM code uses
> platform bus_id strings instead of integers to identify target
> deviices. =A0A configuration structure is also provided, both to
> facilitate atomic hardware state changes and so that the API can be
> extended in a source-code-compatible way to accomodate devices with
> features not anticipated by the current code.

Hey Bill,

I'm concerned about the approach taken here.  As I understand it, the
PWM signals are very similar to GPIOs in that each PWM device controls
an external signal line, just like GPIO lines.  The difference being
that PWMs cannot do input, and has additional capabilities (can be
programmed with a signal; not just on/off/tristate).  Actually, many
GPIOs have these properties too.  I've got a part with output-only
gpios, and gpio devices that also have a PWM.

What is the reason for bringing in an entirely new framework instead
of extending the GPIO API or gpiolib?  I'm not too excited about
having two entirely different frameworks for what basically boils down
to "numbered signal pins".

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
