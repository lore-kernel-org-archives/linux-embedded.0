From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 1/6] [PWM] Generic PWM API implementation
Date: Tue, 4 Nov 2008 16:55:17 -0700
Message-ID: <200811041555.18234.david-b@pacbell.net>
References: <cover.1224093510.git.bgat@billgatliff.com> <8bd0f97a0810170859k72dc1bc5o34ed2388f95c3bc8@mail.gmail.com> <4910AD88.2000200@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4910AD88.2000200@billgatliff.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Tuesday 04 November 2008, Bill Gatliff wrote:
> This is literally the only feedback I have received.=20

I was waiting for followup too.  I finally get onto this
list (for some reason the list management software dropped
several previous "please add me" requests) and ... nothing!!


Patches #1 and #2 seem to be in the wrong order ... and
#2 shouldn't give the header's full pathname.  I'd have
merged the two, myself.

Patch #6 seems to remove LEDS_ATMEL_PWM from Kconfig but
leave the driver around ... and restore the now-deleted
LEDS_CORGI support (leds-gpio suffices).  If you're going
to remove LEDS_ATMEL_PWM you should update the code in
mach-at91/leds.c which sets up for that driver...


> So, what's the next step? =A0How do I advocate for getting
> this API into mainline?=20

The number of backing implementations seemed a bit low ...
just one.  And that's switching Atmel's dedicated PWM, but
not the other PWM driver in the tree (for PXA); so it's
not terrifically accessible.=09

And even for Atmel's SOC's it seemed a bit light:  the TC
blocks will do PWM quite happily, and are found on many
more chips than the dedicated PWM hardware.

My rule of thumb is that it's not worth considering a
framework as being general enough until it's got three
fairly different backing implementations.  Two is enough
to consider merging, especially with complicated drivers.

Plus the number of framework users is an issue.  The
PWM led driver is a good demo for two basic features,
and it's useful:  brightness (duty cycle beyond visual
perception) and blink rate (duty cycle easily seen with
the eye).  But it's still only really one API customer,
even given that new LED trigger...

So I'd suggest fleshing it out a bit more, so it works
on some non-Atmel hardware as well as more Atmel SOCs.
And fix the goofs I noted above.  :)

- Dave
