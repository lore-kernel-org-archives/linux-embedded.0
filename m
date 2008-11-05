From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PATCH 1/6] [PWM] Generic PWM API implementation
Date: Tue, 04 Nov 2008 20:56:33 -0600
Message-ID: <49110B61.30708@billgatliff.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <8bd0f97a0810170859k72dc1bc5o34ed2388f95c3bc8@mail.gmail.com> <4910AD88.2000200@billgatliff.com> <200811041555.18234.david-b@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200811041555.18234.david-b@pacbell.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Brownell <david-b@pacbell.net>, linux-embedded@vger.kernel.org

David Brownell wrote:
 >
> Patches #1 and #2 seem to be in the wrong order ... and
> #2 shouldn't give the header's full pathname.  I'd have
> merged the two, myself.

Ok, that's good feedback.

> Patch #6 seems to remove LEDS_ATMEL_PWM from Kconfig but
> leave the driver around ... and restore the now-deleted
> LEDS_CORGI support (leds-gpio suffices).  If you're going
> to remove LEDS_ATMEL_PWM you should update the code in
> mach-at91/leds.c which sets up for that driver...

I'll look into this before my next update.

> The number of backing implementations seemed a bit low ...
> just one.  And that's switching Atmel's dedicated PWM, but
> not the other PWM driver in the tree (for PXA); so it's
> not terrifically accessible.	
> 
> And even for Atmel's SOC's it seemed a bit light:  the TC
> blocks will do PWM quite happily, and are found on many
> more chips than the dedicated PWM hardware.

Alright.  The SAM9263 has both PWMC and TC, so it's pretty easy to add TC's to
the list of backing implementations because that hardware is already plugged in.
 :)  And I have PXA hardware here somewhere too, so I'll bring that one over as
well.  Finally, I suddenly have the need to do bit-bang PWM over GPIO, so if
nobody beats me to it (please, someone beat me to it!) then I'll implement that
one as well.

> Plus the number of framework users is an issue.  The
> PWM led driver is a good demo for two basic features,
> and it's useful:  brightness (duty cycle beyond visual
> perception) and blink rate (duty cycle easily seen with
> the eye).  But it's still only really one API customer,
> even given that new LED trigger...

That's a bit of a catch-22.  The whole point of the API is to provide a
framework for users to adopt, where previously there was none.  Adopters are
more likely if the framework is mainlined.

Granted, having a git tree on kernel.org is pretty darned close.  I'll look into
that per Mike Frysinger.

> So I'd suggest fleshing it out a bit more, so it works
> on some non-Atmel hardware as well as more Atmel SOCs.
> And fix the goofs I noted above.  :)

Roger that.  And then I expect an Acked-by from you.  :)


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
