From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [RFC 5/6] [PWM] Install new Atmel PWMC driver in Kconfig, expunge
 old one
Date: Thu, 09 Oct 2008 09:04:00 -0500
Message-ID: <48EE0F50.4020405@billgatliff.com>
References: <cover.1223482372.git.bgat@billgatliff.com>	<4b5c3aa2b1bc2b7efad834da49c2dec8c0a8726b.1223482372.git.bgat@billgatliff.com>	<88de40673cc33e014928c2ee3a86bdac566021c8.1223482372.git.bgat@billgatliff.com>	<7b16004ca5f8030184c2de96cbcee38657d56252.1223482372.git.bgat@billgatliff.com>	<5640f37b779f953c83e79c16b2a0466c0f5da702.1223482372.git.bgat@billgatliff.com>	<475b4a5985463015fdfa943b9835ab8136dbc06a.1223482372.git.bgat@billgatliff.com>	<20081009072126.1dd3898d@hcegtvedt>	<20081009141601.6be979bc@hskinnemo-gx745.norway.atmel.com> <20081009141756.0da223ca@hcegtvedt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20081009141756.0da223ca@hcegtvedt>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Cc: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>, linux-embedded@vger.kernel.org

Hans-Christian Egtvedt wrote:
> On Thu, 9 Oct 2008 14:16:01 +0200
> Haavard Skinnemoen <haavard.skinnemoen@atmel.com> wrote:
> 
>> Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> wrote:
>>> You know that there are other users of ATMEL_PWM ?
>>>
>>> There is a atmel-pwm-bl driver in drivers/video/backlight which
>>> could probably be converted to pwm-bl using the new pwm framework.
>> There's already a pwm_bl driver there which I'm assuming is using the
>> generic pwm API. Hopefully, we can simply delete the atmel-pwm-bl
>> driver. Maybe some board code needs updating before that can happen
>> though.

Yes.  I think atmel-pwm-bl goes away completely, and video/backlight/pwm_bl.c
gets modified (slightly) to use the new PWM API and becomes the general
backlight-via-PWM-peripheral solution.  After that, anyone who wants to write a
backend pwm_device driver suddenly can use their peripheral for backlights (and
other stuff) out-of-the-box.

I just glanced over drivers/video/backlight, it looks like there are a couple
other implementations that could move over to Generic PWM as well.

> That would be the Favr-32 board, since the atmel-pwm-bl driver was
> developed for that board.
> 
> Weird how this stuff almost was inserted almost in parallel.

Indeed.  But also a bit tragic--- some wasted effort.  :(

Not entirely weird, however, since I try to follow AVR32 as closely as I do ARM.
 I have an NGW100 and an STK1000, in addition to about five different ARM
machines including ones based on the AT91SAM9263.  These common frameworks help
me slide into insanity a little more slowly.  :)

(I have some PPC and MIPS boards, too.  Occupational hazard).



b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
