From: Gilad Ben-Yossef <gilad@codefidence.com>
Subject: Re: Recommendation for activating a deferred module init in the kernel
Date: Sun, 22 Jun 2008 10:08:49 +0300
Message-ID: <485DFA81.6010600@codefidence.com>
References: <48580116.9070504@am.sony.com> <4858A659.8030502@codefidence.com> <485932F0.5050108@am.sony.com> <4859ECF3.3000500@codefidence.com> <485A9E61.6060707@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <485A9E61.6060707@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

Tim Bird wrote:

> Gilad Ben-Yossef wrote:
>   
>> Well, seeing as both modprobe and a minimal shell are part of busybox
>> which is included in over 90%+ of Linux based embedded systems and that
>> the script is trivial, not to mention that you can just have the
>> application call modprobe directly, just as it will be calling ioctl()
>> in your case, thereby negating the need for both script and shell at
>> all, I do believe that complexity wise my solution still has some merit.
>>     
>
> I agree.  When you say "have the application call modprobe directly",
> I'm not sure I understand what you mean.  Are you talking about a call
> to the kernel (a syscall) or a library function?  The kernel has the
> syscall sys_init_module(), which I'm considering using.  Is there some
> mobprobe library call that might make sense to use?
>
>   
I simply meant that you can fork and exec modprobe itself (or use 
system() but that
would require a working shell). This would "save" the need for a 
separate script and a shell.

I guess "invoking" would have been more suitable word then "calling".

The only downside I see of calling the sys_init_module syscall directly 
is that it
doesn't do any of the dependency tracking that modprobe does, so it's more
a insmod replacement then a modprobe one, but I doubt this matters at 
all in an
embedded system anyway.


Do people here think a shared library implementing modprobe would be 
useful?

I ran into such a need a couple of times myself and does not look 
difficult to do, but does
anyone else here thinks it will be useful?

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


