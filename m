From: super.firetwister@googlemail.com
Subject: Re: UIO not working on ppc405 onchip registers
Date: Tue, 22 Jul 2008 18:20:21 +0200
Message-ID: <200807221820.22333.super.firetwister@gmail.com>
References: <200807212152.16080.super.firetwister@gmail.com> <20080722061730.GB12576@digi.com> <200807220947.43074.super.firetwister@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:to:subject:date:user-agent:cc
         :references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id:from;
        bh=GvXWdLccb6zTTKQgHpjqqc0IqXL0oUq/8GpCs34e2oE=;
        b=gLZCM//ByrONQ1iL0WAr3E4Q0l9sFPCroWpBwmGG6aGpQ4AUhT58L/q7K/o6tly5Hd
         uDGjkKzmdcLYbMDKK2OzA7cN+cUZG7OWvdGTyoKEVKSQ1lW5Hv4rCdJemtwuZiF0genX
         Ng8KHP3ST0iiaAyuSm4KsEZN0xp6T2m6GdWdY=
In-Reply-To: <200807220947.43074.super.firetwister@gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On Tuesday 22 July 2008, super.firetwister@gmail.com wrote:
> Hello Uwe,
>
> On Tuesday 22 July 2008, Uwe Kleine-K=F6nig wrote:
> > I don't know powerpc in general nor ppc405ep in detail but IIRC arm=
 has
> > problems if some memory is mapped twice.  Might this be the problem
> > here?
>
> Maybee, the emac0 (0xef600800) and emac1 (0xef600900) get mapped as w=
ell,
> because AFAIK I have to map a whole pagesize (0x1000).

Same problem without emac module loaded.

Did anybody tried to reproduce the problem?

Regards

Markus

