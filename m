From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: Recommendation for activating a deferred module init in the kernel
Date: Mon, 23 Jun 2008 10:40:01 -0700
Message-ID: <485FDFF1.7010408@am.sony.com>
References: <48580116.9070504@am.sony.com> <4858A659.8030502@codefidence.com> <485932F0.5050108@am.sony.com> <4859ECF3.3000500@codefidence.com> <485A9E61.6060707@am.sony.com> <485DFA81.6010600@codefidence.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <485DFA81.6010600@codefidence.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gilad Ben-Yossef <gilad@codefidence.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

Gilad Ben-Yossef wrote:
> Tim Bird wrote:
>> I agree.  When you say "have the application call modprobe directly",
>> I'm not sure I understand what you mean.
>
> I simply meant that you can fork and exec modprobe itself (or use
> system() but that
> would require a working shell). This would "save" the need for a
> separate script and a shell.

Well, this would explain why I didn't follow your original
point.  I thought you were using the word "modprobe" as a placeholder
for some other module-installation-related concept.  In all
my years of working with embedded Linux, I have never used
modprobe in a target device.  (And I avoid insmod whenever I can).
Sorry for my confusion.

> The only downside I see of calling the sys_init_module syscall directly
> is that it
> doesn't do any of the dependency tracking that modprobe does, so it's more
> a insmod replacement then a modprobe one, but I doubt this matters at
> all in an
> embedded system anyway.
It may just be my own blind spot, but I can't think of a good
reason to do such dependency tracking in an embedded device.
It is a sad state of affairs if the product developers don't
know the module dependencies for their own products.

> 
> Do people here think a shared library implementing modprobe would be
> useful?
Speaking from my own experience, not for embedded.

 -- Tim


=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
