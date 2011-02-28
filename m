From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [GIT PULL] Generic PWM Device API
Date: Mon, 28 Feb 2011 11:31:24 +0100
Message-ID: <20110228103124.GI29521@pengutronix.de>
References: <AANLkTi=rxzrnt0QZQPJFRboSW_Fyt6zQ5S9KD4Lp=hnU@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=rxzrnt0QZQPJFRboSW_Fyt6zQ5S9KD4Lp=hnU@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux-embedded@vger.kernel.org

On Sun, Feb 27, 2011 at 09:38:38PM -0600, Bill Gatliff wrote:
> Andrew, Linus:
> 
> 
> The git repository described in the following pull request implements
> a generic PWM device driver API.  This API is intended to eventually
> supercede the existing PWM device drivers, but during a migration
> period will coexist peacefully with them.

Sorry for the late answer, but it took some time to read the patches
again.

Is it a good idea to have to APIs for the same thing in the kernel?
The old API has users whereas the new API has none. How can we migrate
from one API to the other when for example the backlight pwm driver
depends on the old API, SoC level drivers implement the old API, but
the atmel pwm driver is only available for the new API?

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
