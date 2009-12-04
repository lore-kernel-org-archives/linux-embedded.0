From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [POWER] battery calibration parameters from sysfs
Date: Fri, 4 Dec 2009 14:17:32 +0000
Message-ID: <20091204141731.GA5668@sirena.org.uk>
References: <A6D19A13FE030A409EC4362C172E091F0E0495F6@eseldmw101.eemea.ericsson.se> <20091204104930.GA28625@sirena.org.uk>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091204104930.GA28625@sirena.org.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@stericsson.com>
Cc: cbou@mai.ru, dwmw2@infradead.org, LKML <linux-kernel@vger.kernel.org>, linux-embedded@vger.kernel.org

On Fri, Dec 04, 2009 at 10:49:31AM +0000, Mark Brown wrote:

> Isn't the standard thing here to handle this voltage to capacity mapping
> in userspace if we're just extrapolating from experimental results?
> Even with the "smart" batteries in PCs there are some accuracy concerns
> and obviously the performance of the battery will change over time.

Actually, one further thing here - if this functionality is implemented
in kernel then shouldn't it be a generic feature rather than part of the
driver?  The idea of mapping battery voltages to capacity percentages
isn't specific to a given charger and will apply to all batteries using
the same technology.
