From: "Linus Walleij" <linus.ml.walleij@gmail.com>
Subject: Re: modules.dep and depmod.pl
Date: Sat, 14 Jun 2008 21:23:30 +0200
Message-ID: <63386a3d0806141223y2d3c3d0eq5a12f8fd5487e7d7@mail.gmail.com>
References: <63386a3d0806131611g61ad6ab1t16bc68ab6407a8dc@mail.gmail.com>
	 <63386a3d0806131633g4721216al566c8b6959e4631@mail.gmail.com>
	 <c32efac40806132351t150259e3oc0214e3ccd5eb6c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=IFlYRZDoFvC7HqEZgfeqN8LiEVItMDSsGB/eMDlnPhU=;
        b=Ssd0z2KG+uyou10GXlIss947Lh4k13MQhX+XFfuKkP1a8eOeu97+7X5N0dmY4fT+UV
         MekRHGBPp3wB27W7l5YMGeGXNzTLUVUm81vTIeZO0t3ECbAJ4vRQdShs4SU8iwl2F+EQ
         v1Us1AIfUmNcT76hcQ2BTuzdS5KsL9JXNfl/A=
In-Reply-To: <c32efac40806132351t150259e3oc0214e3ccd5eb6c@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

2008/6/14 Dave Hylands <dhylands@gmail.com>:

> When we were using 1.01 I think I had to patch the kernel Makefile. I
> think I had to undo my patch when we upgraded to the  1.10 version of
> busybox.

OK I'll see if there is a newer version which is good for this.

> You can also run the busybox depmod.pl after you've built the kernel,
> but before you make the file system.

Yeah that's what I do currently....

Linus Walleij
