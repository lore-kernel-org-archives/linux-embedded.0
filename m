From: Jonathan Cameron <jic23@cam.ac.uk>
Subject: Re: [GIT PULL] Generic PWM Device API
Date: Mon, 28 Feb 2011 11:28:46 +0000
Message-ID: <4D6B86EE.1050908@cam.ac.uk>
References: <AANLkTi=rxzrnt0QZQPJFRboSW_Fyt6zQ5S9KD4Lp=hnU@mail.gmail.com> <20110228103124.GI29521@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110228103124.GI29521@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Bill Gatliff <bgat@billgatliff.com>, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux-embedded@vger.kernel.org

On 02/28/11 10:31, Sascha Hauer wrote:
> On Sun, Feb 27, 2011 at 09:38:38PM -0600, Bill Gatliff wrote:
>> Andrew, Linus:
>>
>>
>> The git repository described in the following pull request implements
>> a generic PWM device driver API.  This API is intended to eventually
>> supercede the existing PWM device drivers, but during a migration
>> period will coexist peacefully with them.
> 
> Sorry for the late answer, but it took some time to read the patches
> again.
> 
> Is it a good idea to have to APIs for the same thing in the kernel?
> The old API has users whereas the new API has none. How can we migrate
> from one API to the other when for example the backlight pwm driver
> depends on the old API, SoC level drivers implement the old API, but
> the atmel pwm driver is only available for the new API?
> 
See the info in Bill's previous postings.  He has other drivers queued
up but wants to break up the review burden by merging this core stuff
first...

