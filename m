From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 10/10] AXFS: axfs_uncompress.c
Date: Thu, 21 Aug 2008 07:35:21 -0700
Message-ID: <6934efce0808210735w479075abga9f660e42ab8935d@mail.gmail.com>
References: <48AD0126.1050609@gmail.com> <1219318838.18027.68.camel@sauron>
	 <Pine.LNX.4.64.0808211423360.20704@vixen.sonytel.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760182AbYHUOft@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=EcSP7//YrxJuwswpSPFoRahE68GERXcllHcWkpX5/sg=;
        b=HmtLYcYzVp4yJ6m4qQx1yjWSeKG1XUQeDiLRT665xIo85UJKot3F/gbpwra1i9L7RF
         0DERTg/a7kS3ENhVNW5cD4g6ZqPE0xsMApcrpiEOLQTVItUcmraNpxx/ouTdSo+/kP+8
         Qk2nxKPgwWmELUoMIFNaG6OWNcOXUqgBSq/5w=
In-Reply-To: <Pine.LNX.4.64.0808211423360.20704@vixen.sonytel.be>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Artem Bityutskiy <dedekind@infradead.org>, Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> If you want support for multiple decompression algorithms, you can switch
> from using zlib_inflate*() directly to calling zlib through the crypto API.
> Then you can call crypto_alloc_comp() with the correct decompression algorithm
> name.
>
> For squashfs, I had to modify only ca. 40 lines of code.

I definately want to support multiple formats.  I have a flag in the
superblock all ready to go for that.  One problem.  I'm not sure how
to do it.  Can you point us to some reference code?
