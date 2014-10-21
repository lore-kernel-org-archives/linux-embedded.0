From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Tue, 21 Oct 2014 13:52:05 +0100
Message-ID: <CACxGe6s7rdYn+7HgWC1SkZ26v97YhmO04pv3SZJk00BtehAPqQ@mail.gmail.com>
References: <5441F592.6090807@gmail.com> <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Bird, Tim" <Tim.Bird@sonymobile.com>
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Dirk Behme <dirk.behme@gmail.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "tim.bird@am.sony.com" <tim.bird@am.sony.com>, "Christopher_Hallinan@mentor.com" <Christopher_Hallinan@mentor.com>

On Sat, Oct 18, 2014 at 9:11 AM, Bird, Tim <Tim.Bird@sonymobile.com> wrote:
> The answer is pretty easy, I think.  I tried to mainline it once but failed, and didn't really try again. If it is being found useful,  we should try to mainline it again,  this time with more persistence.  The reason it got rejected before IIRC was that you can accomplish a similar thing with modules, with no changes to the kernel. But that doesn't cover the case where the loadable modules feature of the kernel is turned off, which is common in very small systems.

It is a rather clumsy approach though since it requires changes to
modules and it makes the configuration static per build. Could it
instead be done by the kernel accepting a list of initcalls that
should be deferred? It would depend I suppose on the cost of finding
the initcalls to defer at boot time.

I missed the session unfortunately, are there some measurements
available that I could look at? Which subsystems are typically the
problem?

g.

>
>   -- Tim
>
> Sent from my Sony smartphone on T-Mobile's 4G LTE Network
>
>
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
