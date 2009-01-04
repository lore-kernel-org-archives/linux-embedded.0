From: Robert Hancock <hancockr@shaw.ca>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 03 Jan 2009 18:44:58 -0600
Message-ID: <4960068A.3040109@shaw.ca>
References: <200901020207.30359.rob@landley.net> <200901020513.19593.rob@landley.net> <495E3AF8.6000006@parrot.com> <200901031346.01325.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901031346.01325.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Landley <rob@landley.net>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>, Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

Rob Landley wrote:
> For the record, the reason I can't just pregenerate all these suckers on a 
> system that's got an arbitrary precision calculator (ala dc) and then just 
> ship the resulting header files (more or less the what the first version of 
> that first patch did) is that some architectures (arm omap and and arm at91) 
> allow you to enter arbitrary HZ values in kconfig.  (Their help text says that 
> in many cases values that aren't powers of two won't work, but nothing 
> enforces this.)  So if we didn't have the capability to dynamically generate 
> these, you could enter a .config value that would break the build.

Is there a good reason that these archs allow you enter arbitrary HZ 
values? The use case for using custom HZ values at all nowadays seems 
fairly low now that dynticks is around (if that arch supports it 
anyway), let alone being able to specify wierd obscure values for it. 
Especially if nothing can ensure that all values it allows will actually 
result in a functional kernel..
