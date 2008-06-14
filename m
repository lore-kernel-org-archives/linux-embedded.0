From: "Dave Hylands" <dhylands@gmail.com>
Subject: Re: modules.dep and depmod.pl
Date: Fri, 13 Jun 2008 23:51:38 -0700
Message-ID: <c32efac40806132351t150259e3oc0214e3ccd5eb6c@mail.gmail.com>
References: <63386a3d0806131611g61ad6ab1t16bc68ab6407a8dc@mail.gmail.com>
	 <63386a3d0806131633g4721216al566c8b6959e4631@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=riIx7lK5cLAsB43JsMUEjfSU1+E3KXOKeYrblOi9cNg=;
        b=bW8f6v/CVY9cQzdTmcWA8xNXNTy7qXbbZ8FCsgQy8bZ4gws6PB0YGduPmAjiJfYUKQ
         +rOdeSz7l8qY+WR0ZZIvgK6kMCRluhwgJ8qlEawb2T7Xd8I+KJK9woPts6txqgxycQiJ
         7FxeHGzBtnzfDzauD5gamV50J0BVFuaNrpogs=
In-Reply-To: <63386a3d0806131633g4721216al566c8b6959e4631@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: linux-embedded@vger.kernel.org

Hi Linus,

> I tried this thing to be able to modprobe off a read-only flash
> rootfilesystem and it "sort of" works, actually.
>
> However there is no way you will pass this to the kernel DEPMOD
> parameter, I only ever get this to work when doing it after
> compilation, as a separate step.

I think it depends on which version of busybox you use.

When we were using 1.01 I think I had to patch the kernel Makefile. I
think I had to undo my patch when we upgraded to the  1.10 version of
busybox.

I'll have to wait until I get back to work on Monday to check.

> Is there anyone beside me who would like to see this integrated
> into scripts/ in the kernel to get some default modules.dep for
> a read-only rootfs also when doing cross compilation, or am I
> totally going down the wrong lane here?

You can also run the busybox depmod.pl after you've built the kernel,
but before you make the file system.

--
Dave Hylands
Vancouver, BC, Canada
http://www.DaveHylands.com/
