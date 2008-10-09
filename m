From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Subject: Re: [RFC 5/6] [PWM] Install new Atmel PWMC driver in Kconfig,
 expunge old one
Date: Thu, 9 Oct 2008 07:21:26 +0200
Message-ID: <20081009072126.1dd3898d@hcegtvedt>
References: <cover.1223482372.git.bgat@billgatliff.com>
	<4b5c3aa2b1bc2b7efad834da49c2dec8c0a8726b.1223482372.git.bgat@billgatliff.com>
	<88de40673cc33e014928c2ee3a86bdac566021c8.1223482372.git.bgat@billgatliff.com>
	<7b16004ca5f8030184c2de96cbcee38657d56252.1223482372.git.bgat@billgatliff.com>
	<5640f37b779f953c83e79c16b2a0466c0f5da702.1223482372.git.bgat@billgatliff.com>
	<475b4a5985463015fdfa943b9835ab8136dbc06a.1223482372.git.bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <475b4a5985463015fdfa943b9835ab8136dbc06a.1223482372.git.bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org, Bill Gatliff <bgat@billgatliff.com>

On Wed,  8 Oct 2008 11:43:17 -0500
Bill Gatliff <bgat@billgatliff.com> wrote:

<snipp>

> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index a726f3b..cdea0bb 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -13,15 +13,6 @@ menuconfig MISC_DEVICES
>  
>  if MISC_DEVICES
>  
> -config ATMEL_PWM
> -	tristate "Atmel AT32/AT91 PWM support"
> -	depends on AVR32 || ARCH_AT91
> -	help
> -	  This option enables device driver support for the PWM
> channels
> -	  on certain Atmel prcoessors.  Pulse Width Modulation is
> used for
> -	  purposes including software controlled power-efficent
> backlights
> -	  on LCD displays, motor control, and waveform generation.
> -

You know that there are other users of ATMEL_PWM ?

There is a atmel-pwm-bl driver in drivers/video/backlight which could
probably be converted to pwm-bl using the new pwm framework.

>  config ATMEL_TCLIB
>  	bool "Atmel AT32/AT91 Timer/Counter Library"
>  	depends on (AVR32 || ARCH_AT91)

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
