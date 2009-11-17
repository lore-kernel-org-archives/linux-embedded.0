From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Tue, 17 Nov 2009 09:45:38 -0600
Message-ID: <4B02C522.7020600@billgatliff.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com> 	<8bd0f97a0911132022pf743558lfef1402125d4b60b@mail.gmail.com> <fa686aa40911132355t3b79fe46m90005ecba453dcc1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40911132355t3b79fe46m90005ecba453dcc1@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Mike Frysinger <vapier.adi@gmail.com>, linux-embedded@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>

Grant Likely wrote:
>
> Common code is a big gain in and of itself.

I completely agree!  Which is why I used the GPIO API in my PWM
pseudo-device, along with an hrtimer.

> What I would like to see is the PWM functions added to the GPIO API.
> GPIO drivers can then either implement them or not.  If a GPIO driver
> supports the PWM function, great.  If not, then it returns -EINVAL.
> Heck, I'll even got a driver right now that I'd use it with.  I'm more
> than happy to help code it up even.
>   

I think the appropriate thing to do in such cases is to reimplement the
GPIO driver at its lowest level to provide both GPIO API and PWM API
interfaces.  In my way of thinking, such hardware is a kind of
multi-function device and it should be treated that way.  No need to
expose that multi-functionality to the user unless necessary.

The odd case to me is the concept of "timed GPIO", as in the Android
kernels.  I see the timing capability as a convenience feature that
could be realized by adding timers to the GPIO interface (as they did),
or by having a one-shot PWM channel.  I'm not really comfortable with
either as an interface concept, however, because it just doesn't... feel
right.  :)


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com

