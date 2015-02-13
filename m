From: Sam Protsenko <semen.protsenko@globallogic.com>
Subject: Re: embedding dtb file into kernel
Date: Fri, 13 Feb 2015 15:31:15 +0200
Message-ID: <CAJOTznW_XEwHOiYafPivR17xMvPKNgKiCrimdmE01KrHWZtvDA@mail.gmail.com>
References: <54DD0018.7010409@graphitesystems.com>
Reply-To: semen.protsenko@globallogic.com
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=mime-version:reply-to:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=mNcOKtOocABuhv6DqIvVtV+pgb5Z5YHBGwIW6qweB/U=;
        b=kj8RJkYvdswtbPu1IOBbDhrzsW2KhKY39+znAQ2hf3ebPu/NXouKUWBMpy20xTtkwf
         PFJFOcWONGIa571PTb0hUTJzwickVfHHd2rwsFf2B7hsiqEMFbrdFc6EEMgynjS+huQE
         2gJ00TTX7TSUl3SkUz+lqfFyRKxYry05Do6JE=
In-Reply-To: <54DD0018.7010409@graphitesystems.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: K Richard Pixley <rpixley@graphitesystems.com>
Cc: linux-embedded@vger.kernel.org

On Thu, Feb 12, 2015 at 9:33 PM, K Richard Pixley
<rpixley@graphitesystems.com> wrote:
> I'm having trouble figuring out how to embed a dtb file into my kernel.  I'm
> thinking that there should be a standard, architecture independent facility
> for this akin to initramfs, yes?
>
> Could someone please either point me to the standard facility, relevant doc,
> a currently building board that uses the standard facility, or outline what
> needs to be done to do this with a new board?
>
> If it matters, (I can't think why it would), I'm working with powerpc on a
> 3.10 kernel.  But if there are better facilities in other versions I'd
> appreciate hearing about that too.
>
> Thank you in advance.
>
> --rich
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Look into Documentation/powerpc/bootwrapper.txt.
It reveals that there is "wrapper" script which does the trick and
this script should be used
via Makefile. Both "wrapper" script and Makefile resides in
arch/powerpc/boot/ directory.
I think you can figure out how to use it properly from that documentation.
