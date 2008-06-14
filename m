From: Bernhard Fischer <rep.dot.nop@gmail.com>
Subject: Re: modules.dep and depmod.pl
Date: Sat, 14 Jun 2008 19:00:07 +0200
Message-ID: <20080614170006.GA10734@mx.loc>
References: <63386a3d0806131611g61ad6ab1t16bc68ab6407a8dc@mail.gmail.com> <63386a3d0806131633g4721216al566c8b6959e4631@mail.gmail.com> <8bd0f97a0806131645l69d9c3c8x727c3edd0cad5975@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=5TyBwGXYdGG6eHHp5RH0h/y3UuD2mxG4H82D5GF8qY0=;
        b=tQoDpOYPXKeVVM7qih5/i5mTGH0NTzHzcUg9OfAMXRITFwX3MJmkN+xCr611HQ49xk
         QHz9NPpPUIWqe+WUxnMGr7LPJHepTu2Pyw8sh/faD0xNQ4VykpHcZXNHAAxfXyrpDP3V
         CRo3Ux5+QbdxGe4/QSp7MoYrnMBn8EVZZ3AJo=
Content-Disposition: inline
In-Reply-To: <8bd0f97a0806131645l69d9c3c8x727c3edd0cad5975@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Linus Walleij <linus.ml.walleij@gmail.com>, linux-embedded@vger.kernel.org

On Fri, Jun 13, 2008 at 07:45:58PM -0400, Mike Frysinger wrote:
>On Fri, Jun 13, 2008 at 7:33 PM, Linus Walleij wrote:

>> Is there anyone beside me who would like to see this integrated
>> into scripts/ in the kernel to get some default modules.dep for
>> a read-only rootfs also when doing cross compilation, or am I
>> totally going down the wrong lane here?
>
>seems like a worthwhile step to me

Using the perl-script to create a modules.dep is one option. If you do
not have a perl interpreter on your host, then you can build busybox'
recently added depmod for your host and use that to create a
modules.dep. Alternatively you can create a modules.dep via busybox on
the fly when booting.
