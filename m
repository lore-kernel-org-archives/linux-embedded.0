From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: modules.dep and depmod.pl
Date: Fri, 13 Jun 2008 19:45:58 -0400
Message-ID: <8bd0f97a0806131645l69d9c3c8x727c3edd0cad5975@mail.gmail.com>
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
        bh=VnchgXEKaIIq2oNWkfirXPcvo2sLRJjTvrWxDEc3xp0=;
        b=WUV5EyqfJxZkkapYXAdWSD1Gu+DL8vCgvjjyVsJ6r/FnVX8H4xNhuuAa4TMp90U56X
         4w1DDu1tv5gWkKxrf9ITET67EcL/SUB9Jf4hSFV6+a55Kl2O87K3ZqXv22m5SXD9MNVl
         xpyaXsIjSdeMxQp7nYvuJxX6+8V61023ood2s=
In-Reply-To: <63386a3d0806131633g4721216al566c8b6959e4631@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Fri, Jun 13, 2008 at 7:33 PM, Linus Walleij wrote:
> what are other embedded developers experience with using the
> script "depmod.pl" from BusyBox to create
> installdir/lib/modules/<version>/modules.dep
> during compile-time?

it's used in the uClinux distribution and works fine for me.  only had
problems when there are multiple kernel versions, but never had a
problem with a single.

> Is there anyone beside me who would like to see this integrated
> into scripts/ in the kernel to get some default modules.dep for
> a read-only rootfs also when doing cross compilation, or am I
> totally going down the wrong lane here?

seems like a worthwhile step to me
-mike
