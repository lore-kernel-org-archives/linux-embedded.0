From: "R, Durgadoss" <durgadoss.r@intel.com>
Subject: A new Subsystem for Current Management
Date: Thu, 10 Nov 2011 16:58:27 +0530
Message-ID: <D6D887BA8C9DFF48B5233887EF04654109F1111F6C@bgsmsx502.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Hi Mark,

> 
> > In simple terms, this framework will offer something like this:
> > 	Current[1-N]_limit - set of current limits
> > 	Voltage[1-X]_limit - set of voltage limits
> 
> What would the voltage limits be?  Whatever is going on here there
> should be some integration with the regulator framework, modern
> regulators are often able to report when they go out of regulator and
> able to impose current limits.

These (limits) are configurable voltage limits. The HW generates an
Interrupt when any of these configured voltage limits are crossed.
Similarly, for Current also.

Now, Say there are 3 current limits that we can program.
On the first and second limit violation we take some actions,
and control the current consumption, so that it does not hit the
worst current limit.

Do you think, we can fit this into the regulator framework ?

I went through the regulator framework inside Linux-3.1.
I could see the core driver and lot of regulator drivers using the Framework.
But I would like to see a 'consumer' driver that uses the framework
efficiently, so that I can get some more idea. Could you point to
some source files ?

Thanks,
Durga
