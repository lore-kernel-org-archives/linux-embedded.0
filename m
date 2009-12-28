From: Andy Green <andy@warmcat.com>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight
 bootloader
Date: Mon, 28 Dec 2009 20:20:59 +0000
Message-ID: <4B39132B.1020506@warmcat.com>
References: <4B29EC68.1040109@0xlab.org> <200912270117.18130.rob@landley.net>	<4B372EEB.2000902@warmcat.com> <200912271715.54249.rob@landley.net>	<4B3887F8.5020509@warmcat.com> <87ljgmvpkt.fsf@macbook.be.48ers.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:sender:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=Wk3KQkxSDeLvAe0OeF6MRstk/4fr5MQ36c9HTUAjqcw=;
        b=TZXJmnDQHuRGmnsL3I7yVW51JBg0GYYHZNgjNuXbwG9ERuted+EoBaUEcrPOnyblJz
         Av6RdY7T5SGYDdsOuwCxlSMyWtE6QsNIzkb0U1WnXMrs2EBDDVbGpSaRw/DlwTYtsl+F
         Gd3o+A2oXdbsjFdgp5jZXvzOVw/bi3e/rSBik=
In-Reply-To: <87ljgmvpkt.fsf@macbook.be.48ers.dk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter Korsgaard <jacmet@sunsite.dk>
Cc: Rob Landley <rob@landley.net>, celinux-dev@tree.celinuxforum.org, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org

On 12/28/09 19:57, Somebody in the thread at some point said:

Hi Peter -

> Thanks for an interesting discussion and all your free buildroot
> advertising ;)
>
> (buildroot maintainer)

Hey you are welcome... in the situations where you can't play the distro 
game then buildroot is the lifesaver.  Same as U-Boot I have experienced 
in detail the amount of work involved in what buildroot delivers and it 
has to be respected for what it does.

I'm really saying there's a region where buildroot is the right answer 
and a threshold beyond which a "real distro" is the right answer, we 
should not just keep on doing what we have being doing.

(But you want to be careful you don't grow into OpenEmbedded's build 
system.  For me it failed partway through a 1000+ package build on 
trying to build *host* dbus libs for me (yes, host dbus).

I just wanted to package "hello world" on Openmoko.  They did fix it in 
the end so it would build host dbus OK to be fair.  But I felt that was 
a very long way from the point.)

>   Andy>  This thread was meant to be about merits of Qi, it's kinda gone
>   Andy>  off into embedded with distro rootfs because the philosophy is
>   Andy>  related.  In both cases burden on the developer is intended to be
>   Andy>  removed and effort simplified to get the job done more reliably
>   Andy>  and quicker.
>
> Sure, if your embedded device is very PC like (size/functionality) that
> makes sense.

Thanks.  As written the threshold seems to be at ARM11+ and SD 
particularly making it into enough of a "PC" you don't have to worry 
about bash vs ash or where a few 100MB of storage is going to come from.

-Andy
