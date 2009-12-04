From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [POWER] battery calibration parameters from sysfs
Date: Fri, 4 Dec 2009 10:49:31 +0000
Message-ID: <20091204104930.GA28625@sirena.org.uk>
References: <A6D19A13FE030A409EC4362C172E091F0E0495F6@eseldmw101.eemea.ericsson.se>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755004AbZLDKtc@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <A6D19A13FE030A409EC4362C172E091F0E0495F6@eseldmw101.eemea.ericsson.se>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@stericsson.com>
Cc: cbou@mai.ru, dwmw2@infradead.org, LKML <linux-kernel@vger.kernel.org>, linux-embedded@vger.kernel.org

On Fri, Dec 04, 2009 at 11:42:22AM +0100, Linus Walleij wrote:

> Most devices of this kind does not need the stuff we're doing so we're
> the odd bird here. Other batteries are "smart" (contain factory
> calibration inside of them) or get calibration from some BIOS or such.

> In our code we have a number of (x,y) pair tables like this:

> /* Vbat mV to Battery capacity % */
> struct voltage_vs_capacity {
> 	int voltage;
> 	int capacity;
> };

Isn't the standard thing here to handle this voltage to capacity mapping
in userspace if we're just extrapolating from experimental results?
Even with the "smart" batteries in PCs there are some accuracy concerns
and obviously the performance of the battery will change over time.
