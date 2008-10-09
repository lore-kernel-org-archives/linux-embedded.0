From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [RFC 0/6] Proposal for a Generic PWM Device API
Date: Wed, 8 Oct 2008 22:32:14 -0400
Message-ID: <8bd0f97a0810081932t7e3ce7e4l785a3a841228aba2@mail.gmail.com>
References: <cover.1223482372.git.bgat@billgatliff.com>
	 <8bd0f97a0810081227u15173a70ke6ab41ea8211e66c@mail.gmail.com>
	 <48ED6B38.7030001@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=96dCIYUiPLAdas9L1JSdLNV/ERtbJvsHM2vLrJEJVrE=;
        b=AQtzV8HrASB8jPZU2gOO9nz0Y6zeFCn8gmc/iN9K7XwlsAlh0KLngWDJTT/pu3MQ1U
         08al0rqF1zLOGWcDNL6O22NGeH/qzn1MczHvQOmSNduFplWr/qwP2ld/cvQC1t2g9SYt
         KS2FIbR4fkiVX0YqPDdaC6hdxTdM6x0Gzm9f0=
In-Reply-To: <48ED6B38.7030001@billgatliff.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Wed, Oct 8, 2008 at 22:23, Bill Gatliff wrote:
> Mike Frysinger wrote:
>> On Wed, Oct 8, 2008 at 12:43, Bill Gatliff wrote:
>>> This series proposes a "generic PWM" driver API.
>>
>> seems that the API is solely geared to handle PWM as an output signal.
>
> True.  The peripherals I'm currently targeting are output-only devices, and the
> API reflects that.
>
>>  what about input ?
>
> Well, the SAM9263 has timer/counters that could be used to measure PWM period
> and duty cycle.  But they are a different peripheral entirely.  I haven't done
> an exhaustive survey, but I'm not aware of any PWM-generating hardware that is
> simultaneously PWM-measuring hardware as well.  Seems like they are either one
> or the other.

the Blackfin timers/pwm's can flip between input and ouput based on
the configuration register.  everything else (pin/etc...) is
unchanged.

> Are you proposing that the API accommodate both input and output devices?

i dont think we should preclude it from the outset.

>> all the utility config functions lack "set" in their name.  it's a
>> little confusing as to whether the function is a get or set at first
>> glance.  rather than expecting drivers to poke directly into the
>> structure, a set of "get" functions would work better (even if they're
>> simply #define's that poke into the structure) and line up better with
>> how the GPIO framework operates.
>
> Good point.
>
> Originally, I was thinking along the lines of a set-and-forget use case.  Do you
> use "get" functionality much when generating PWM signals in your applications?

not really, but i see the existing code you've posted could already
utilize some of the "get" functions ...
-mike
