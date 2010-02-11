From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PWM PATCH 2/5] Emulates PWM hardware using a high-resolution
	timer and a GPIO pin
Date: Thu, 11 Feb 2010 21:07:02 +0100
Message-ID: <20100211200702.GB1487@ucw.cz>
References: <cover.1265094517.git.bgat@billgatliff.com> <2d73f9b2fd175fd3e482920baebcd3028206f02e.1265094517.git.bgat@billgatliff.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2d73f9b2fd175fd3e482920baebcd3028206f02e.1265094517.git.bgat@billgatliff.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org


> +static void
> +gpio_pwm_work (struct work_struct *work)
> +{
> +	struct gpio_pwm *gp = container_of(work, struct gpio_pwm, work);
> +
> +	if (gp->active)
> +		gpio_direction_output(gp->gpio, gp->polarity ? 1 : 0);
> +	else
> +		gpio_direction_output(gp->gpio, gp->polarity ? 0 : 1);
> +}

...polarity ^ active ?

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
