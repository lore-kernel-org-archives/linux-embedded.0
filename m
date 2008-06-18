From: Gilad Ben-Yossef <gilad@codefidence.com>
Subject: Re: Recommendation for activating a deferred module init in the kernel
Date: Wed, 18 Jun 2008 09:47:09 +0300
Message-ID: <4858AF6D.7040808@codefidence.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

[Resending due to reject from vger mail server. My apologies if you got 
this twice ]


Hi,


Tim Bird wrote:

> I am working with a product team on bootup time issues.  One technique
> that we are forward-porting from an old kernel (and that I thought I
> might work on mainlining) is to compile modules statically into the kernel,
> but defer their initialization until after boot time.
>   
This may sound like a stupid question, but why are you compiling the 
modules statically?

I mean, it sounds to me like the perfect way to do what you want is to 
compile the modules dynamically (you can store them in a an in kernel 
initramfs if you want to keep them attached to the kernel binary for 
ease of maintenance) and simply call a script that calls modprobe when 
it's OK to load them?

Sounds a hell of lot simpler to me...

Gilad

-- 
Gilad Ben-Yossef 
Chief Coffee Drinker

Codefidence Ltd.
The code is free, your time isn't.(TM)

Web:    http://codefidence.com
Email:  gilad@codefidence.com
Office: +972-8-9316883 ext. 201
Fax:    +972-8-9316885
Mobile: +972-52-8260388

	Q: How many NSA agents does it take to replace a lightbulb?
	A: dSva7DrYiY24yeTItKyyogFXD5gRuoRqPNQ9v6WCLLywZPINlu!


