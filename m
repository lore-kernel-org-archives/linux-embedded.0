From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [Celinux-dev] CELF Project Proposal- Refactoring Qi, lightweight bootloader
Date: Mon, 28 Dec 2009 20:57:54 +0100
Message-ID: <87ljgmvpkt.fsf@macbook.be.48ers.dk>
References: <4B29EC68.1040109@0xlab.org> <200912270117.18130.rob@landley.net>
	<4B372EEB.2000902@warmcat.com> <200912271715.54249.rob@landley.net>
	<4B3887F8.5020509@warmcat.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:received:from:to:cc
         :subject:references:date:in-reply-to:message-id:user-agent
         :mime-version:content-type;
        bh=yG17equ78Ng85SMCf1fHlra5hVOdlTogDWTNCicyWhk=;
        b=k5QNxAzmFhmL9XWvzN9qC9gPfTU2JJhA0upDfeqaCBmRa1ijstmg/rQftAD/RKUBcc
         9oJQic74NYN/971yirZ8PbKe6FxKLeaA7irXU1LgleSfzuu8NXEcRaOU2HAPc7pRKui/
         Kc9Vl3SdsUJxzknIQZRkbcOHUn2NcWQa6+Zgo=
In-Reply-To: <4B3887F8.5020509@warmcat.com> (Andy Green's message of "Mon, 28
	Dec 2009 10:27:04 +0000")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Green <andy@warmcat.com>
Cc: Rob Landley <rob@landley.net>, celinux-dev@tree.celinuxforum.org, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org

>>>>> "Andy" == Andy Green <andy@warmcat.com> writes:

Hi,

 Andy> This is what I have been calling "buildroot thinking" again.

Thanks for an interesting discussion and all your free buildroot
advertising ;)

(buildroot maintainer)

 Andy> This thread was meant to be about merits of Qi, it's kinda gone
 Andy> off into embedded with distro rootfs because the philosophy is
 Andy> related.  In both cases burden on the developer is intended to be
 Andy> removed and effort simplified to get the job done more reliably
 Andy> and quicker.

Sure, if your embedded device is very PC like (size/functionality) that
makes sense.

-- 
Bye, Peter Korsgaard
