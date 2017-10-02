From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v4 4/5] cramfs: add mmap support
Date: Mon, 2 Oct 2017 19:33:29 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1710021931270.5407@knanqh.ubzr>
References: <20170927233224.31676-1-nicolas.pitre@linaro.org> <20170927233224.31676-5-nicolas.pitre@linaro.org> <20171001083052.GB17116@infradead.org> <nycvar.YSQ.7.76.1710011805070.5407@knanqh.ubzr>
 <CAFLxGvzfQrvU-8w7F26mez6fCQD+iS_qRJpLSU+2DniEGouEfA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=Ch2dXuB7+etLju/OYsYrUk0Au/BUOAz2iIjAvYid8g4=;
        b=a8cXqRheti1PW/GFRJYkMe6+BiwlYYeWtim7WfZwtUKPvRdSN5B00OOfl1tmfSaQ4S
         IcnNLJKHmUYCRVNO5A7r59gps0AW9mIHHaDO7Ru5ZZ8RmFzOPyd4q6tYP94qtg9ukLcs
         XTaBreMSE7jheDDf44z4iiis8NEMCanxri3wo=
In-Reply-To: <CAFLxGvzfQrvU-8w7F26mez6fCQD+iS_qRJpLSU+2DniEGouEfA@mail.gmail.com>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, "linux-mm@kvack.org" <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Chris Brandt <Chris.Brandt@renesas.com>

On Tue, 3 Oct 2017, Richard Weinberger wrote:

> On Mon, Oct 2, 2017 at 12:29 AM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> > On Sun, 1 Oct 2017, Christoph Hellwig wrote:
> >
> >> up_read(&mm->mmap_sem) in the fault path is a still a complete
> >> no-go,
> >>
> >> NAK
> >
> > Care to elaborate?
> >
> > What about mm/filemap.c:__lock_page_or_retry() then?
> 
> As soon you up_read() in the page fault path other tasks will race
> with you before
> you're able to grab the write lock.

But I _know_ that.

Could you highlight an area in my code where this is not accounted for?


Nicolas

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
