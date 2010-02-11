From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PWM PATCH 2/5] Emulates PWM hardware using a high-resolution
 timer and a GPIO pin
Date: Thu, 11 Feb 2010 21:58:01 +0100
Message-ID: <20100211205801.GA29159@elf.ucw.cz>
References: <cover.1265094517.git.bgat@billgatliff.com>
 <2d73f9b2fd175fd3e482920baebcd3028206f02e.1265094517.git.bgat@billgatliff.com>
 <20100211200702.GB1487@ucw.cz>
 <4B746A02.9060306@billgatliff.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B746A02.9060306@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu 2010-02-11 14:35:14, Bill Gatliff wrote:
> Pavel Machek wrote:
> >> +static void
> >> +gpio_pwm_work (struct work_struct *work)
> >> +{
> >> +	struct gpio_pwm *gp = container_of(work, struct gpio_pwm, work);
> >> +
> >> +	if (gp->active)
> >> +		gpio_direction_output(gp->gpio, gp->polarity ? 1 : 0);
> >> +	else
> >> +		gpio_direction_output(gp->gpio, gp->polarity ? 0 : 1);
> >> +}
> >>     
> >
> > ...polarity ^ active ?
> >   
> 
> ... except that if polarity and/or active are >1, I don't send the
> values 1 or 0 to gpio_direction_output.  I don't know if the API is
> specifically intended to accept nonzero values that are greater than 1.

!polarity ^ !active ? :-).
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
