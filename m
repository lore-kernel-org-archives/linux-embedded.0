From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 10/10] AXFS: axfs_uncompress.c
Date: Thu, 21 Aug 2008 07:37:27 -0700
Message-ID: <6934efce0808210737w16b5f8dcr1657ea46099e4901@mail.gmail.com>
References: <48AD0126.1050609@gmail.com>
	 <alpine.LNX.1.10.0808211028150.12259@titan.stealer.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=vnsBZYWZDvMRBlW7nxTzCUyFv5WofZPSPMKdemKGDX0=;
        b=kXR2Xt32DC9PPLP5Er+QfBGTDhv/N6FtjU/dsgJg4w9QAXP2rpbAZtnz1x/5I4pmVs
         MDF+IU/1nvVe7Vjgi8aqDp62ra+u9vKT+EEydK05ouHPuSm5Dj4GHi3kiiLXND+ex8ct
         iYBFT6mxgc3bf7uwxnFlqpPKrh9i40Ee7Pt1w=
In-Reply-To: <alpine.LNX.1.10.0808211028150.12259@titan.stealer.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sven Wegener <sven.wegener@stealer.net>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> Use DEFINE_MUTEX and drop the mutex_init() down in the init function.

okay.  by drop you mean delete?

> axfs_uncompress_init() and axfs_uncompress_exit() are only called during
> init and exit of the module, no need for the initialized variable and the
> functions can be annotated with __init and __exit.

can be annotated or should be?
