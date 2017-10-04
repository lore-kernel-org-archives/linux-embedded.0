From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 4/5] cramfs: add mmap support
Date: Wed, 4 Oct 2017 00:25:53 -0700
Message-ID: <20171004072553.GA24620@infradead.org>
References: <20170927233224.31676-1-nicolas.pitre@linaro.org>
 <20170927233224.31676-5-nicolas.pitre@linaro.org>
 <20171001083052.GB17116@infradead.org>
 <nycvar.YSQ.7.76.1710011805070.5407@knanqh.ubzr>
 <CAFLxGvzfQrvU-8w7F26mez6fCQD+iS_qRJpLSU+2DniEGouEfA@mail.gmail.com>
 <nycvar.YSQ.7.76.1710021931270.5407@knanqh.ubzr>
 <20171003145732.GA8890@infradead.org>
 <nycvar.YSQ.7.76.1710031107290.5407@knanqh.ubzr>
 <20171003153659.GA31600@infradead.org>
 <nycvar.YSQ.7.76.1710031137580.5407@knanqh.ubzr>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=9I2tVpSnXUnso50qTdXwCSZzxw0XbETjPIF1em5/Y+4=; b=jB55OZb5IZEK78Ub4URjDLpNo
        oiIDBQR/VysZMxT6OzS330Qn+egKKL/bPeYGO+h02fWp8rWKFzdreeoErWEhTk/zGmOpZXYOUW8RT
        o5EkTTufOD3WtTNWJGQzBfz/Wm6Urw+EC4VyGWoi7JUDqGqxP3DYdci75p6xkBIlu7sp6E0MrvwGR
        R0gfx7rnEh747s7sOIHLBVLfgeb7jPUrOK3E4MCABVnCC+N+eoBqvDxeOCKn3BRGK9oWfsTAVpPbt
        BRUBDXDf0Ar5PGgf6Lqdh1ty8B1ZYQlHIuSsKHUMXLO8ZPEciArmqiTwV8vpJ2VrB2/3kqn83If7R
    
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.1710031137580.5407@knanqh.ubzr>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Christoph Hellwig <hch@infradead.org>, Richard Weinberger <richard.weinberger@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, "linux-mm@kvack.org" <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Chris Brandt <Chris.Brandt@renesas.com>

On Tue, Oct 03, 2017 at 11:40:28AM -0400, Nicolas Pitre wrote:
> I provided that explanation several times by now in my cover letter. And 
> separately even to you directly at least once.  What else should I do?

You should do the right things instead of stating irrelevant things
in your cover letter.  As said in my last mail: look at the VM_MIXEDMAP
flag and how it is used by DAX, and you'll get out of the vma splitting
business in the fault path.

If the fs/dax.c code scares you take a look at drivers/dax/device.c
instead.
