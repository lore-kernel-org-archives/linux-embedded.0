From: Bill Gatliff <bgat@billgatliff.com>
Subject: Avoiding platform-specific callbacks in drivers?
Date: Tue, 9 Nov 2010 16:32:16 -0600
Message-ID: <AANLkTinG4y_Uxes0CJYMH+uwr1TcWwjQy+4+_ftyrnML@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Guys:


Let's say that on a given platform, I need to twiddle with a GPIO pin
when a chip enters and exits suspend.  One way to do that is to hack
the driver itself; a slightly less-inelegant way is to add a function
pointer in the platform data, and have the driver call back in its
suspend() and resume() methods.  I'm not real keen on either strategy,
because they both involve touching driver code that should be
platform-agnostic.  They seem... hacky.  :)

I would love to come up with a way that prevents touching the driver
at all, since the activity is terribly platform-specific. Is there
such a way?

One possibility is to set up some sort of parent-child relationship
between the device and a pseudo-device that deals with the GPIO pin.
But I'm not sure that will actually work, and it seems a bit
overly-complicated.

Ideas, anyone?  I'll be happy to try them out if they seem feasible,
and post code and feedback.


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
