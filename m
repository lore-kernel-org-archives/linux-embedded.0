From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [RFC 0/6] Proposal for a Generic PWM Device API
Date: Thu, 9 Oct 2008 00:33:48 -0400
Message-ID: <8bd0f97a0810082133ucd89b0fg6d0d5c92fd31b5b3@mail.gmail.com>
References: <cover.1223482372.git.bgat@billgatliff.com>
	 <8bd0f97a0810081227u15173a70ke6ab41ea8211e66c@mail.gmail.com>
	 <48ED6B38.7030001@billgatliff.com>
	 <8bd0f97a0810081932t7e3ce7e4l785a3a841228aba2@mail.gmail.com>
	 <48ED7E8E.3010504@billgatliff.com>
	 <8bd0f97a0810082105mabededn54ffcc937674af3@mail.gmail.com>
	 <48ED862D.8000601@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=DpN/lxW6d0R+nDelTS6l1rEsgsHMebDjoTNXjVqwU9U=;
        b=YAwjB3wd4FrXbCCI/ZJGcze6AZJHavmrUfDTk7AbRMKC8ruqPjTokp/mNeI0pAHzQw
         acn/FgazSjYRxYWVKpdSNi4CEjxZlbnRqiVDXiQ1UVqd09iFkQCeLuwhvUgZvOozP5ko
         0+ccir5Y7833sgfEMtVIxHBbmkNPlLC+/34gk=
In-Reply-To: <48ED862D.8000601@billgatliff.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Thu, Oct 9, 2008 at 00:18, Bill Gatliff wrote:
> Mike Frysinger wrote:
>> if you'd seriously play with a Blackfin board, i think we can arrange that
>
> I'd seriously *love* to play with one, but I'm pretty strapped for time for
> another couple of months.  The only purpose it would serve near-term would be to
> prove out the input capabilities of a device that I probably wouldn't have time
> to write a driver for.  :(

i'll probably look at the Blackfin-pwm core soonish ... we already
implemented a generic framework for it (look for "gptimers"), so it
shouldnt take too much time to transition code for it.

>> while true, hardware that can support PWM as both input/output would
>> suffer from two frameworks.  if there's ambiguity in behavior (using
>> "get" in an output mode), then we can just stick it in the
>> documentation and move on.  the GPIO framework already has this
>> behavior (set a pin to output and then try and read the data) and i
>> dont recall it ever being an issue there.
>
> Good point.  I think I'm sold on the idea now.
>
> We'd need a PWM_CONFIG_<something> to tell the hardware to switch to
> "measurement mode" if such a mode is supported (suggestions for <something>
> welcomed).  The config function would return an error if the measurement mode
> wasn't supported by the device.  PWM_CONFIG_INPUT and PWM_CONFIG_OUTPUT, perhaps?

only part on Kconfig i think we'll need is each implementation
selecting "GENERIC_PWM_INPUT" and "GENERIC_PWM_OUTPUT".  are we
looking towards having multiple master implementations being usable
simultaneously ?

otherwise, i dont think defining things in terms of "generating" and
"measuring" is really needed ... "input" and "output" seems
straightforward enough.

> In output mode, the pwm_get_*() methods would return the driven values if the
> device didn't support a (simultaneous) measurement mode, or cached values if the
> device's configuration registers were write-only.  In measurement mode, they'd
> return the measured values.

the current generic core looks like it could handle this easily enough
since we're working with an array of function pointers.
-mike
