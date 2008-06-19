From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: Recommendation for activating a deferred module init in the kernel
Date: Thu, 19 Jun 2008 10:58:57 -0700
Message-ID: <485A9E61.6060707@am.sony.com>
References: <48580116.9070504@am.sony.com> <4858A659.8030502@codefidence.com> <485932F0.5050108@am.sony.com> <4859ECF3.3000500@codefidence.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4859ECF3.3000500@codefidence.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gilad Ben-Yossef <gilad@codefidence.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

Gilad Ben-Yossef wrote:
> Well, seeing as both modprobe and a minimal shell are part of busybox
> which is included in over 90%+ of Linux based embedded systems and that
> the script is trivial, not to mention that you can just have the
> application call modprobe directly, just as it will be calling ioctl()
> in your case, thereby negating the need for both script and shell at
> all, I do believe that complexity wise my solution still has some merit.

I agree.  When you say "have the application call modprobe directly",
I'm not sure I understand what you mean.  Are you talking about a call
to the kernel (a syscall) or a library function?  The kernel has the
syscall sys_init_module(), which I'm considering using.  Is there some
mobprobe library call that might make sense to use?

Thanks for the feedback.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

