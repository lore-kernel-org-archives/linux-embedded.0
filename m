From: "Alex Riesen" <raa.lkml@gmail.com>
Subject: Re: Subject: [PATCH 00/16] Squashfs: compressed read-only filesystem
Date: Wed, 22 Oct 2008 00:29:22 +0200
Message-ID: <81b0412b0810211529x3fc85567yc34fd369ff7c8518@mail.gmail.com>
References: <E1KqrTW-0001x8-3h@dylan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=zKRrRnLQXXEPy/MWZg6S3+dSj7dmxXCvXHJe26FSdoM=;
        b=Sg565YZmwet0DOEgqP94GaiFsYVFcZ52iYxRWm6m0yHwHCqBs5I00uSnW4CLGaD3pn
         kc6B3fk6Ki/KoX4Vg8e2C5m+jfopiHvxMBcfT6wt/87QcJd9iqSPPOPpZ1LIFnKLf5ud
         eKGSkTLsApmM9O3K1EMNPQpPptgw/8JQNL6a0=
In-Reply-To: <E1KqrTW-0001x8-3h@dylan>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

2008/10/17 Phillip Lougher <phillip@lougher.demon.co.uk>:
> There are 16 patches in the patch set, and the patches are against the
> latest linux-next tree (linux 2.6.27-next-20081016).

You better don't base anything off linux-next. These are not stable: there
can be even something in the tree you mentioned which will never end
up in the mainline and if your patches depend on it they wont apply to
something like v2.6.26.2.

Use something tagged (v2.6.27, v2.6.27-rc*) in _mainline_ instead.
Than it can be applied to anything from stable releases to vendor trees
(which mostly are based off mainline).
