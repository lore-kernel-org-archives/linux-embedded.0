From: Dirk Behme <dirk.behme@gmail.com>
Subject: Re: Why is the deferred initcall patch not mainline?
Date: Sun, 19 Oct 2014 08:59:20 +0200
Message-ID: <54436148.8080803@gmail.com>
References: <5441F592.6090807@gmail.com> <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=nGHHcIQtnRR/Y1Fo6XL3DpOocb0LuANOopwf5ZjIyk4=;
        b=MrUKt5CeJTSmw93alyq6zlluNgwiKgW0qWr7kHNq88VlZ3gZP/Vd7PGnsDx90Wv0q5
         2/P/L9DKY7sKGWxTci/ocLRbaYogf4h5MhY32LkDQwC7aqJVL4T4krYDJw+gdF43Tc3W
         MpMvgMHQDMFz/H2eRVmNqBzBYnarFOTVg4DzOJ+C2Xs/E4F251LW3fXihnyLREOuCh9H
         DVtKLoYgac799TLHXTvIcMk+TfIJErL+8YkTg/DcV/HkjQxrBFz1CamlV1kz9leC/hfI
         ZiKAtIZztP0gfdv3jChh+0RFjmNCCv6hl3JAEmT78uU3gJaYctheobO4Mam2QMd6IAP2
         BJQQ==
In-Reply-To: <nngd3gtlr4ltyk2mo7p2sn30.1413619885726@email.android.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Bird, Tim" <Tim.Bird@sonymobile.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: "tim.bird@am.sony.com" <tim.bird@am.sony.com>, "Christopher_Hallinan@mentor.com" <Christopher_Hallinan@mentor.com>

On 18.10.2014 10:11, Bird, Tim wrote:
> The answer is pretty easy, I think.  I tried to mainline it once but failed, and didn't really try again. If it is being found useful,  we should try to mainline it again,  this time with more persistence.  The reason it got rejected before IIRC was that you can accomplish a similar thing with modules, with no changes to the kernel. But that doesn't cover the case where the loadable modules feature of the kernel is turned off, which is common in very small systems.

Just some other uses cases: You want to avoid the overhead of ELF 
module loading, even if module loading is on. We've seen a lot of 
cases where the overall boot time is a lot faster having the driver in 
the kernel than loading it as module. Even if the kernel size and 
therefore its load time increases with this.

And if you want to have the driver quite early, earlier than the user 
space loads the modules. But want to have the delay/wait time of that 
driver to be running _after_ you have mounted the rootfs.

Thanks

Dirk

Btw.: Does anybody have the correct mail address of Chris? Maybe he 
has some opinions on this, too, as his talk is the starting point of 
this discussion ;)


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
>
