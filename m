From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PATCH 0/6] Generic PWM API implementation
Date: Mon, 23 Nov 2009 08:13:47 -0600
Message-ID: <4B0A989B.3070403@billgatliff.com>
References: <cover.1224093510.git.bgat@billgatliff.com> <fa686aa40911131108o301efa1ew5c0ab31184aa7f75@mail.gmail.com> 	<200911170027.38664.david-b@pacbell.net> <fa686aa40911201421k67d1de27u2c6dbe337989696b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40911201421k67d1de27u2c6dbe337989696b@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: David Brownell <david-b@pacbell.net>, linux-embedded@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>

Grant Likely wrote:
>
> But that *isn't* the primary purpose of the GPIO subsystem.  All that
> stuff is layered on top of the GPIO pin management code and doesn't
> really play into this debate.
>   

I don't understand you.  You are saying that the majority of gpiochip
implementations also deal with pin multiplexing?  They must be terribly
broken on the platforms I'm working on, then, because they don't seem to
work at all!  :)


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
