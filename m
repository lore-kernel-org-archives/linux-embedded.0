From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [RFC 0/6] Proposal for a Generic PWM Device API
Date: Wed, 08 Oct 2008 22:46:22 -0500
Message-ID: <48ED7E8E.3010504@billgatliff.com>
References: <cover.1223482372.git.bgat@billgatliff.com>	 <8bd0f97a0810081227u15173a70ke6ab41ea8211e66c@mail.gmail.com>	 <48ED6B38.7030001@billgatliff.com> <8bd0f97a0810081932t7e3ce7e4l785a3a841228aba2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0810081932t7e3ce7e4l785a3a841228aba2@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-embedded@vger.kernel.org

Mike Frysinger wrote:
> 
> the Blackfin timers/pwm's can flip between input and ouput based on
> the configuration register.  everything else (pin/etc...) is
> unchanged.

Interesting!

>> Are you proposing that the API accommodate both input and output devices?
> 
> i dont think we should preclude it from the outset.

I don't think have a problem with that.  At some point, I would need someone
with input/output hardware to test the input-specific parts, however.  Hint,
hint.  ;)

> not really, but i see the existing code you've posted could already
> utilize some of the "get" functions ...

Which parts?  I don't really like keeping the period_ticks and duty_ticks values
around, but in my case I have no choice--- unless I were to read the CPRE, CPRD
and CDTY values from the hardware directly.  Which could be what your proposed
"get" methods would do.

But that still isn't PWM "input" the way you are describing, because my hardware
wouldn't be _reading_ an incoming PWM: it would be just reporting back the
values that it was using to produce its output signal.  Huge difference.

I dunno, I'm still not sure that measuring the characteristics of an incoming
PWM signal isn't a different kind of device from one that produces PWM signals,
at least conceptually.  Which, in a way, makes it out of scope for the proposed
API.  Not saying I can't go along with the idea, I'm just not sure what a user
would expect to happen if they called pwm_get_period_ns() on the SAM9263 PWMC
device.  They certainly aren't going to get a measured value in return!



b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
