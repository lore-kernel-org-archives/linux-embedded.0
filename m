From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Sat, 18 Oct 2014 16:05:37 +0200
Message-ID: <20141018140536.GA10616@piout.net>
References: <5441F592.6090807@gmail.com>
 <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Bird, Tim" <Tim.Bird@sonymobile.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, "tim.bird@am.sony.com" <tim.bird@am.sony.com>, "Christopher_Hallinan@mentor.com" <Christopher_Hallinan@mentor.com>

Hi,

On 18/10/2014 at 10:11:27 +0200, Bird, Tim wrote :
> The answer is pretty easy, I think.  I tried to mainline it once but failed, and didn't really try again. If it is being found useful,  we should try to mainline it again,  this time with more persistence.  The reason it got rejected before IIRC was that you can accomplish a similar thing with modules, with no changes to the kernel. But that doesn't cover the case where the loadable modules feature of the kernel is turned off, which is common in very small systems.
> 

There is also the case of subsystems that can't be compiled as modules.
I didn't even try to push that to the mainline because I believe we
prefer not having code without any users/calls in the kernel. You would
still have to patch your kernel to use deferred_module_init().

It is also quite easy to port, maybe you can try to push it to mainline
or if you want I can try to send an updated patch myself.

> ---- Dirk Behme wrote ----
> 
> Hi,
> 
> During the ELCE 2014 in Duesseldorf in Chris Hallinan's talk [1] there
> has been the unanswered question why the deferred initcall patch [2]
> isn't mainline, yet.
> 
> Anybody remembers?
> 
> Best regards
> 
> Dirk
> 
> 
> [1] http://sched.co/1yG5fmY
> 
> [2] http://elinux.org/Deferred_Initcalls
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
