From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [RFC 0/6] Proposal for a Generic PWM Device API
Date: Thu, 9 Oct 2008 00:05:39 -0400
Message-ID: <8bd0f97a0810082105mabededn54ffcc937674af3@mail.gmail.com>
References: <cover.1223482372.git.bgat@billgatliff.com>
	 <8bd0f97a0810081227u15173a70ke6ab41ea8211e66c@mail.gmail.com>
	 <48ED6B38.7030001@billgatliff.com>
	 <8bd0f97a0810081932t7e3ce7e4l785a3a841228aba2@mail.gmail.com>
	 <48ED7E8E.3010504@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=sfEqBNvILbk0Kvzy5Pxysq636nPJEShOrVgDPJCY3qs=;
        b=P8WHkvOVnYhR8n9TtExBBHx3/e6mKU7zvkOsocOslYd83Ow4b2cF/pkZNt5DHC4FU8
         IavQq3Ebfrttf57RhAObdAPC14NrV+gzAmFEk1qa+z0KglrlJO6kRwG2BiB+M7sBxm1k
         iZBa9qO7B5miWfK5TXEo+6Dal8wV/TNo/KmCw=
In-Reply-To: <48ED7E8E.3010504@billgatliff.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Wed, Oct 8, 2008 at 23:46, Bill Gatliff wrote:
> Mike Frysinger wrote:
>>> Are you proposing that the API accommodate both input and output devices?
>>
>> i dont think we should preclude it from the outset.
>
> I don't think have a problem with that.  At some point, I would need someone
> with input/output hardware to test the input-specific parts, however.  Hint,
> hint.  ;)

if you'd seriously play with a Blackfin board, i think we can arrange that

>> not really, but i see the existing code you've posted could already
>> utilize some of the "get" functions ...
>
> Which parts?  I don't really like keeping the period_ticks and duty_ticks values
> around, but in my case I have no choice--- unless I were to read the CPRE, CPRD
> and CDTY values from the hardware directly.  Which could be what your proposed
> "get" methods would do.

sorry, i misread the led driver.  too many structures! :)

> But that still isn't PWM "input" the way you are describing, because my hardware
> wouldn't be _reading_ an incoming PWM: it would be just reporting back the
> values that it was using to produce its output signal.  Huge difference.
>
> I dunno, I'm still not sure that measuring the characteristics of an incoming
> PWM signal isn't a different kind of device from one that produces PWM signals,
> at least conceptually.  Which, in a way, makes it out of scope for the proposed
> API.  Not saying I can't go along with the idea, I'm just not sure what a user
> would expect to happen if they called pwm_get_period_ns() on the SAM9263 PWMC
> device.  They certainly aren't going to get a measured value in return!

while true, hardware that can support PWM as both input/output would
suffer from two frameworks.  if there's ambiguity in behavior (using
"get" in an output mode), then we can just stick it in the
documentation and move on.  the GPIO framework already has this
behavior (set a pin to output and then try and read the data) and i
dont recall it ever being an issue there.
-mike
