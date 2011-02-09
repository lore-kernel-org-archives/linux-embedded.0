From: Frank Rowand <frank.rowand@gmail.com>
Subject: Re: [PATCH] Remove CONFIG_PM altogether, enable power management
 all the time
Date: Wed, 09 Feb 2011 10:31:29 -0800
Message-ID: <4D52DD81.7050401@am.sony.com>
References: <4D51D341.3040209@am.sony.com> <20110209114137.GA10163@opensource.wolfsonmicro.com> <201102091807.03094.rjw@sisk.pl>
Reply-To: frank.rowand@am.sony.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:reply-to:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=fHIt79Kj1/DN6g/JLPx+dd6MYc1B4h6ckOZp81QX6/A=;
        b=niruK3H7o+MTuiykrHoMSIKO0Fh/BhWelCutV38XY3p9xgsmjAPsTdySIHrOVSmSkU
         vDXkmxpKPFyv+BL8G9tSdU/wZC9S9e2sQKILX3fn6TtHYo7oyOm7pIBnus/5tgwrMQF8
         H0Tuy0SIjLuIa0N5jipwcqvSmi1dgD/oeI45E=
In-Reply-To: <201102091807.03094.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Ingo Molnar <mingo@elte.hu>, Linus Torvalds <torvalds@linux-foundation.org>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>, linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On 02/09/11 09:07, Rafael J. Wysocki wrote:
> On Wednesday, February 09, 2011, Mark Brown wrote:
>> On Tue, Feb 08, 2011 at 03:35:29PM -0800, Frank Rowand wrote:
>>
>>> For 2.6.38-rc4, x86_64, CONFIG_NR_CPUS=4:
>>
>>> size vmlinux
>>>    text     data       bss       dec      hex  filename
>>>
>>> 6553910  3555020   9994240  20103170  132c002  vmlinux    with    CONFIG_PM
>>> 6512652  3553116   9994240  20060008  1321768  vmlinux    without CONFIG_PM
>>>
>>>   41258     1904         0     43162                      delta
>>
>>> That is big enough for me to care.
>>
>> Hrm, that's pretty surprising.  It'd be interesting to know how much of
>> that is due to the PM core itself and how much of that is from drivers.
>> For the drivers CONFIG_PM isn't really the option they should be using
>> in the first place - they mostly want some combination of PM_SLEEP and
>> PM_RUNTIME for the specific functionality.  I'm running some checks now.
>>
>>>  > CONFIG_PM_SLEEP=y
>>
>> Raphael's patch will make this a user visible option in place of raw
>> CONFIG_PM by default so you'd be able to turn that off.
> 
> No, it won't (just to clarify).

Raphael's patch will turn on CONFIG_PM in the correct circumstances, and
leave it off when not needed by other config options.  That means that
the size overhead will _not_ be an issue for me because CONFIG_PM
will not be enabled when not needed.

-Frank
