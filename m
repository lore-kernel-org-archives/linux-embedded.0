From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Subject: Re: [RFC 5/6] [PWM] Install new Atmel PWMC driver in Kconfig,
 expunge old one
Date: Thu, 9 Oct 2008 15:44:53 +0200
Message-ID: <20081009154453.5fa378b3@hcegtvedt>
References: <cover.1223482372.git.bgat@billgatliff.com>
	<4b5c3aa2b1bc2b7efad834da49c2dec8c0a8726b.1223482372.git.bgat@billgatliff.com>
	<88de40673cc33e014928c2ee3a86bdac566021c8.1223482372.git.bgat@billgatliff.com>
	<7b16004ca5f8030184c2de96cbcee38657d56252.1223482372.git.bgat@billgatliff.com>
	<5640f37b779f953c83e79c16b2a0466c0f5da702.1223482372.git.bgat@billgatliff.com>
	<475b4a5985463015fdfa943b9835ab8136dbc06a.1223482372.git.bgat@billgatliff.com>
	<20081009072126.1dd3898d@hcegtvedt>
	<48EE09DF.7000206@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48EE09DF.7000206@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Thu, 09 Oct 2008 08:40:47 -0500
Bill Gatliff <bgat@billgatliff.com> wrote:

> Hans-Christian Egtvedt wrote:
> 
> > You know that there are other users of ATMEL_PWM ?
> > 
> > There is a atmel-pwm-bl driver in drivers/video/backlight which
> > could probably be converted to pwm-bl using the new pwm framework.
> 
> Yes, I'm aware of atmel-pwm-bl, and it's on my list--- along with
> adapting the led-pwm stuff I posted to use the led-blink API.
> 

Great, let me know if you want me to test something, I have hardware
laying around here which I can test it on.

-- 
Best regards,
Hans-Christian Egtvedt
