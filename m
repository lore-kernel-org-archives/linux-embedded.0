From: David Brownell <david-b@pacbell.net>
Subject: Re: [[RFC] 2/5] Emulates PWM hardware using a high-resolution timer and a GPIO pin
Date: Tue, 17 Nov 2009 01:29:36 -0700
Message-ID: <200911170029.36669.david-b@pacbell.net>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com> <1255984366-26952-2-git-send-email-bgat@billgatliff.com> <1255984366-26952-3-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1255984366-26952-3-git-send-email-bgat@billgatliff.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

Worth highlighting that this is necessarily a "low quality"
PWM ... in the sense that it's got lots of jitter because
of needing CPU intervention in IRQ context, so it's subject
to delays from both IRQs being blocked and from other timer
driven activities firing first.

There are lots of applications where that jitter is enough
to preclude using this kind of PWM.  I get the feeling that
some of the Linux folk seeing "this PWM thing" are not very
cognizant of such issues ... they've not had to use PWM to
do anything where the jitter matters.  (Not that I have;
but I know that such apps are a motivation for most of the
PWM hardware on microcontrollers.  A few PWMs plus some
sensors, hall effect or QEI or whatever; then you get a
motor controller.)

- Dave
