From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [[RFC] 2/5] Emulates PWM hardware using a high-resolution timer
 and a GPIO pin
Date: Tue, 17 Nov 2009 10:00:46 -0600
Message-ID: <4B02C8AE.8050600@billgatliff.com>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com> <1255984366-26952-2-git-send-email-bgat@billgatliff.com> <1255984366-26952-3-git-send-email-bgat@billgatliff.com> <200911170029.36669.david-b@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200911170029.36669.david-b@pacbell.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Brownell <david-b@pacbell.net>
Cc: linux-embedded@vger.kernel.org

David Brownell wrote:
> Worth highlighting that this is necessarily a "low quality"
> PWM ... in the sense that it's got lots of jitter because
> of needing CPU intervention in IRQ context, so it's subject
> to delays from both IRQs being blocked and from other timer
> driven activities firing first.
>   

Very, very good point.

The jitter can be quite low (100's of usecs) on a 200 MHz ARM9 chip, in
fact, but you'll eat your battery alive if it's a portable device.  And
the jitter will also destroy your waveform at high or low duty cycles.

> There are lots of applications where that jitter is enough
> to preclude using this kind of PWM.  I get the feeling that
> some of the Linux folk seeing "this PWM thing" are not very
> cognizant of such issues ... they've not had to use PWM to
> do anything where the jitter matters.  (Not that I have;
> but I know that such apps are a motivation for most of the
> PWM hardware on microcontrollers.  A few PWMs plus some
> sensors, hall effect or QEI or whatever; then you get a
> motor controller.)
>   

For some definitions of "motor controller".  :)

You might even be able to use a GPIO-as-PWM signal to feed an R/C servo
positioner, but the jitter there will be very visual when it occurs.

Dimming control of LEDs and incandescent lamps can be very forgiving of
jitter, but I was thinking more along the lines of "make this LED blink
faster or slower" when I came up with the implementation.



b.g.

-- 
Bill Gatliff
bgat@billgatliff.com

