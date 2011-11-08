From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: A new Subsystem for Current Management
Date: Tue, 8 Nov 2011 13:56:49 +0000
Message-ID: <20111108135649.GA21630@sirena.org.uk>
References: <D6D887BA8C9DFF48B5233887EF04654109F10AF2C7@bgsmsx502.gar.corp.intel.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <D6D887BA8C9DFF48B5233887EF04654109F10AF2C7@bgsmsx502.gar.corp.intel.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "R, Durgadoss" <durgadoss.r@intel.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On Tue, Nov 08, 2011 at 04:39:17PM +0530, R, Durgadoss wrote:

> [I have posted this on lm-sensors and platform-drivers-x86
> lists earlier. As per some recommendations there, posting it
> here]

lkml would probably be useful.  It'd also help if you could publish code
along with your mail, in general people are much more likely to review
concrete code.

> In simple terms, this framework will offer something like this:
> 	Current[1-N]_limit - set of current limits
> 	Voltage[1-X]_limit - set of voltage limits

What would the voltage limits be?  Whatever is going on here there
should be some integration with the regulator framework, modern
regulators are often able to report when they go out of regulator and
able to impose current limits.
