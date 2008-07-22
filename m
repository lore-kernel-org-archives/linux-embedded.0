From: super.firetwister@googlemail.com
Subject: Re: UIO not working on ppc405 onchip registers
Date: Tue, 22 Jul 2008 09:47:41 +0200
Message-ID: <200807220947.43074.super.firetwister@gmail.com>
References: <200807212152.16080.super.firetwister@gmail.com> <20080722061730.GB12576@digi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:to:subject:date:user-agent:cc
         :references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id:from;
        bh=vcDTLw0s87a4TqVQF0Rs1CrRDPnFcpgzSt82fCXSKu0=;
        b=f4B5K86IxnJoiLwOiGW0/rDs4tWdyePUvJDFQTJJwT+fkSAodDlkseRzrBzAJpihtl
         INLhnN1FbwxpL/Zvh5bbxD2dUIGMVZZj0fELEXak0indrBEZi9tgmvozT2J5O4MoKj0G
         VEJU0TH2DuGlwomIgTL6JefsaIelHGD358BSs=
In-Reply-To: <20080722061730.GB12576@digi.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Hello Uwe,

On Tuesday 22 July 2008, Uwe Kleine-K=F6nig wrote:

> I don't know powerpc in general nor ppc405ep in detail but IIRC arm h=
as
> problems if some memory is mapped twice.  Might this be the problem
> here?

Maybee, the emac0 (0xef600800) and emac1 (0xef600900) get mapped as wel=
l,=20
because AFAIK I have to map a whole pagesize (0x1000).

> > +       int uiofd =3D open(UIO_DEV,O_RDWR);
>
> For debugging this is OK, in the final application you should add som=
e
> tests.  Check the UIO documentation for the details.

The whole example was meant to be short.


> > +static int uio_gpio_remove(struct device *dev)
> > +{
> > +       uio_unregister_device(&info);
> > +       info.mem[0].addr =3D 0;
> > +       info.mem[0].size =3D 0;
> > +       return 0;
> > +}
>
> Are you sure that overwriting info.mem[0].addr is a good idea?  Then
> unbinding the platform device and rebinding it fails to do the right
> thing for sure.

This was stolen from uio_dummy. So this might become a common error :(


Thanks a lot for your comments, I will try to get an exclusive memory r=
egion=20
mapped.

Markus
