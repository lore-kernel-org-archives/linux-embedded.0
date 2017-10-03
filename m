From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 4/5] cramfs: add mmap support
Date: Tue, 3 Oct 2017 08:37:00 -0700
Message-ID: <20171003153659.GA31600@infradead.org>
References: <20170927233224.31676-1-nicolas.pitre@linaro.org>
 <20170927233224.31676-5-nicolas.pitre@linaro.org>
 <20171001083052.GB17116@infradead.org>
 <nycvar.YSQ.7.76.1710011805070.5407@knanqh.ubzr>
 <CAFLxGvzfQrvU-8w7F26mez6fCQD+iS_qRJpLSU+2DniEGouEfA@mail.gmail.com>
 <nycvar.YSQ.7.76.1710021931270.5407@knanqh.ubzr>
 <20171003145732.GA8890@infradead.org>
 <nycvar.YSQ.7.76.1710031107290.5407@knanqh.ubzr>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	 bh=t6gl+5nnj2ils1PJAHQGdW9jOjV7eXxI+cCw+WHmldk=; b=jjOy4gBSyt8dcAFMTQrI9bodr
	2HTms1I0ezSG86X3QOCCUBC1Xl4h7AtdtdT2frFr1y7tP7SAwSjEaw7GQ5mrhvJHYObplFRFXU8vY
	CLpeXRNHOiOO1nuw11EhiVffLmiOdxTB5W1hq4W56HRC8ZrDEXxtqQHbBlDg7GbWnYEK1sCWstE8c
	aetVqfov05/Xgm5+xcUB+nqG2JmTLwLxAz5yxF7rHh837PyJYKXXgeFtR6a3Pd2Q7iRO31aobGXRe
	qj7ZFqbAQqWlq31zg6x6/gAWVnZ8IxildYY5SIN33IjYJEa1BgSoWromLX4/u7Gme/yHOFMiEjtl6
	OqcMavLJQ==;
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.1710031107290.5407@knanqh.ubzr>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Christoph Hellwig <hch@infradead.org>, Richard Weinberger <richard.weinberger@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, "linux-mm@kvack.org" <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Chris Brandt <Chris.Brandt@renesas.com>

On Tue, Oct 03, 2017 at 11:30:50AM -0400, Nicolas Pitre wrote:
> Unless you have a better scheme altogether  to suggest of course, given 
> the existing constraints.

I still can't understand why this convoluted fault path that finds
vma, attempts with all kinds of races and then tries to update things
like vm_ops is even nessecary.

We have direct mappings of physical address perfectly working in the
DAX code (even with write support!) or in drivers using remap_pfn_range
so a really good explanation why neither scheme can be used is needed
first.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
