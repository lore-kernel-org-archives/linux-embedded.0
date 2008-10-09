From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [RFC 0/6] Proposal for a Generic PWM Device API
Date: Wed, 08 Oct 2008 23:18:53 -0500
Message-ID: <48ED862D.8000601@billgatliff.com>
References: <cover.1223482372.git.bgat@billgatliff.com>	 <8bd0f97a0810081227u15173a70ke6ab41ea8211e66c@mail.gmail.com>	 <48ED6B38.7030001@billgatliff.com>	 <8bd0f97a0810081932t7e3ce7e4l785a3a841228aba2@mail.gmail.com>	 <48ED7E8E.3010504@billgatliff.com> <8bd0f97a0810082105mabededn54ffcc937674af3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0810082105mabededn54ffcc937674af3@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-embedded@vger.kernel.org

Mike Frysinger wrote:
> if you'd seriously play with a Blackfin board, i think we can arrange that

I'd seriously *love* to play with one, but I'm pretty strapped for time for
another couple of months.  The only purpose it would serve near-term would be to
prove out the input capabilities of a device that I probably wouldn't have time
to write a driver for.  :(

> while true, hardware that can support PWM as both input/output would
> suffer from two frameworks.  if there's ambiguity in behavior (using
> "get" in an output mode), then we can just stick it in the
> documentation and move on.  the GPIO framework already has this
> behavior (set a pin to output and then try and read the data) and i
> dont recall it ever being an issue there.

Good point.  I think I'm sold on the idea now.

We'd need a PWM_CONFIG_<something> to tell the hardware to switch to
"measurement mode" if such a mode is supported (suggestions for <something>
welcomed).  The config function would return an error if the measurement mode
wasn't supported by the device.  PWM_CONFIG_INPUT and PWM_CONFIG_OUTPUT, perhaps?

In output mode, the pwm_get_*() methods would return the driven values if the
device didn't support a (simultaneous) measurement mode, or cached values if the
device's configuration registers were write-only.  In measurement mode, they'd
return the measured values.

I think this'll work.



b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
