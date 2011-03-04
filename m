From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: Question on "regulator" platform device
Date: Fri, 4 Mar 2011 16:50:52 +0000
Message-ID: <20110304165052.GF17653@sirena.org.uk>
References: <AANLkTinHgEeF6o1xkNvQFydqwfUJ1vAt-xsrXTSG2DaO@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinHgEeF6o1xkNvQFydqwfUJ1vAt-xsrXTSG2DaO@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org, lrg@slimlogic.co.uk

On Fri, Mar 04, 2011 at 08:41:00AM -0800, Bill Gatliff wrote:
> Guys:

As ever please remember to CC maintainers so they see your mails,
especially if you're going to mail a different list to the one usually
used for development of the subsystem you're working on.

> The text in Documentation/power/regulator/machine.txt describes how to
> place regulator_init_data and regulator_consumer_supply structures
> into the .dev.platform_data field of a platform_device structure.  The
> platform_device.name field equals "regulator".

> Trouble is, I can't find anywhere in the drivers/regulator code that
> registers a platform_driver named "regulator".  Am I just going blind?

This is just an example of how to supply platform data to a device.
You need to pass things into the driver for whatever regulator you are
using.  There are quite a few systems in the tree using regulators
which you can use for reference...
