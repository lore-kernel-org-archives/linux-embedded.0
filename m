From: "klaasjan gm" <klaasjan.gm@gmail.com>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Thu, 8 Jan 2009 14:13:57 +0100
Message-ID: <33cac1200901080513k4df78751uc752c38e71486164@mail.gmail.com>
References: <200901020207.30359.rob@landley.net>
	 <20090102172540.GE8858@knossos.aleph1.co.uk>
	 <20090102180134.GB5818@uranus.ravnborg.org>
	 <200901031348.46847.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=wC4RZOVf9+iJQUWaTlcSSRmYy9Y5Zn0BFOqvomYgIIY=;
        b=t2oIMlt+33JN4vzBPICTakx+9qiVb3M1Fgoe5Dxa6tYIBtW3x0OfS3xwd3ufvhu0fL
         D93LsqADA+gccXOY0wjTKsDrp9MNL29IO4rpHuumgsAlQjFhnBore5vXCzXxsnT6vfVB
         2pv67cYRoARkPQk0dTEmYG8YzPZHyAcVyt1Ys=
In-Reply-To: <200901031348.46847.rob@landley.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Landley <rob@landley.net>
Cc: Sam Ravnborg <sam@ravnborg.org>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Paul Mundt <lethal@linux-sh.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>

Rob and to whom it may concern,

> I didn't discover this topic independently.  Somebody pinged me about it on
> freenode back in February, and several other people sent me private email
> about it, and it's been previously raised on several other mailing lists (such
> as busybox and uclibc ones).
>
> Unfortunately, most of the embedded developers I know aren't subscribed to
> linux-kernel.

FWIW,

> Hopefully the cc: to linux-embedded is helping get more embedded guys involved
> in the discussion than just me. :)

Having some experience with cross-compiling the kernel, and some of the basic
toolsets:
I'm with you on this one (and testing the waters at linux-embedded
while I'm at it)

Regards,
Klaasjan
