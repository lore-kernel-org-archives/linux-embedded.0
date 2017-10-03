From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v4 4/5] cramfs: add mmap support
Date: Tue, 3 Oct 2017 11:40:28 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1710031137580.5407@knanqh.ubzr>
References: <20170927233224.31676-1-nicolas.pitre@linaro.org> <20170927233224.31676-5-nicolas.pitre@linaro.org> <20171001083052.GB17116@infradead.org> <nycvar.YSQ.7.76.1710011805070.5407@knanqh.ubzr> <CAFLxGvzfQrvU-8w7F26mez6fCQD+iS_qRJpLSU+2DniEGouEfA@mail.gmail.com>
 <nycvar.YSQ.7.76.1710021931270.5407@knanqh.ubzr> <20171003145732.GA8890@infradead.org> <nycvar.YSQ.7.76.1710031107290.5407@knanqh.ubzr> <20171003153659.GA31600@infradead.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=4bUyl9ZiICdu392ku9gXOzg2y0sEsT8w0Zw090tLfMA=;
        b=EBIlpfAxekxv2KFz9VO6jLKih3lpWe2mQD9ZrG2MhAzS2xM/xAC+/XJUmqgBFBcwRg
         ZYz4O6pCQbSBhwbscRXcmjrQHraYUMPGtFwAgzfY4FYkZdas92PTNZfM5hTZtqi42ilF
         lcJondhHJdiLkOPtWLxcMLUV58qYLBo0a5r0k=
In-Reply-To: <20171003153659.GA31600@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Richard Weinberger <richard.weinberger@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, "linux-mm@kvack.org" <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Chris Brandt <Chris.Brandt@renesas.com>

On Tue, 3 Oct 2017, Christoph Hellwig wrote:

> On Tue, Oct 03, 2017 at 11:30:50AM -0400, Nicolas Pitre wrote:
> > Unless you have a better scheme altogether  to suggest of course, given 
> > the existing constraints.
> 
> I still can't understand why this convoluted fault path that finds
> vma, attempts with all kinds of races and then tries to update things
> like vm_ops is even nessecary.
> 
> We have direct mappings of physical address perfectly working in the
> DAX code (even with write support!) or in drivers using remap_pfn_range
> so a really good explanation why neither scheme can be used is needed
> first.

I provided that explanation several times by now in my cover letter. And 
separately even to you directly at least once.  What else should I do?


Nicolas
