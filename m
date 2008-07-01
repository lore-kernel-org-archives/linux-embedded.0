From: Gilad Ben-Yossef <gilad@codefidence.com>
Subject: Re: Dump Management
Date: Tue, 01 Jul 2008 17:05:34 +0300
Message-ID: <486A39AE.4040308@codefidence.com>
References: <4869DEF0.5060109@coritel.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4869DEF0.5060109@coritel.it>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marco Stornelli <marco.stornelli@coritel.it>
Cc: Linux-Embedded <linux-embedded@vger.kernel.org>

hI,


Marco Stornelli wrote:

> what's the standard way to manage the core dump and therefore the 
> post-mortem debug? 
For most embedded systems I know, core dumps are useful on the developer 
desk and in the testing lab. For analyzing field post-mortem (where it 
is feasible), use a custom fault signal hander in your app to catch the 
relevant information and save it.

If you're interested in a tutorial in doing this, I'm giving one at this 
year OLS. Or you can just check out the slides and example code here:

http://tuxology.net/lectures/crash-and-burn-writing-linux-application-fault-handlers/ 

> For my experience it could be useful to have a mechanism to have 
> little dump image (only some information) to store it in flash and 
> maybe to have an hook (or something like this) for each application to 
> customize the dump information. What do you think about it?
>
That's exactly what a custom fault signal handler does :-)

Cheers,
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

