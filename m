From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 07:19:43 -0700
Message-ID: <6934efce0808210719s6458dc77w2c0755a4bf90bf8a@mail.gmail.com>
References: <48AD00C4.6060302@gmail.com> <20080821083916.GF5706@disturbed>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=cns1xl7fXWe2ReJlHTU6Vy41Q3m4yko4J32mdmmJWik=;
        b=pn3n85LUPP7Zq8ehW7dRXvcXHGL9JQkV36oI6MVEcC96v1h1u2Vb0x2COvl13KtjG6
         vEFgCx3frKv9J+z/de8W0hXeBzUZ88ERwZYZpT/cabFCmdx/2rGRXLRec5P0M06z+H+X
         c6Uuc10vs0ml5L3w3X8Yb3Lpi3RNmqSs7sVmg=
In-Reply-To: <20080821083916.GF5706@disturbed>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jared Hulbert <jaredeh@gmail.com>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logf>

> FWIW, I'm not sure it's a good idea to name this new filesystem AXFS.
> People are almost certainly going to confuse it with XFS despite
> the filesystems being aimed at diammetrically opposed ends of the
> storage spectrum. ;)

In principle I think you are right.  AXFS and XFS are similar names
and it could lead to confusion.  I think XFS should change its name to
prevent confusion.  I think by 2 years AXFS will be used in orders of
magnitude more machines anyway.  ;)

About opposite end of the spectrum...  Carsten just said AXFS might be
nice for s390, so I'm not sure how true that is.

I'm kind of attached to the name now.
