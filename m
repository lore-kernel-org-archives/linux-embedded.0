From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v4 4/5] cramfs: add mmap support
Date: Tue, 3 Oct 2017 11:30:50 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1710031107290.5407@knanqh.ubzr>
References: <20170927233224.31676-1-nicolas.pitre@linaro.org> <20170927233224.31676-5-nicolas.pitre@linaro.org> <20171001083052.GB17116@infradead.org> <nycvar.YSQ.7.76.1710011805070.5407@knanqh.ubzr> <CAFLxGvzfQrvU-8w7F26mez6fCQD+iS_qRJpLSU+2DniEGouEfA@mail.gmail.com>
 <nycvar.YSQ.7.76.1710021931270.5407@knanqh.ubzr> <20171003145732.GA8890@infradead.org>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=ELOuK+006P1JEy1toCWHLm1ZJe/mLBPC/CzB2bPLUgE=;
        b=ZTNIjLCcSsmKaM6tlaJCsRScRLhHFQu4nqMa5yWnDWTsd+QUzB5RrIgFjC/jmpOhSR
         xgzkhNo0zMvql85xqZPOgRQ69C0CAYlLG3bApacjeLPcDpzS6/5sTRTikymRHcyaUM8W
         gRLQEymgxKk1bJFDx/HpX48JEM6De+fCsEYiw=
In-Reply-To: <20171003145732.GA8890@infradead.org>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Richard Weinberger <richard.weinberger@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, "linux-mm@kvack.org" <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Chris Brandt <Chris.Brandt@renesas.com>

On Tue, 3 Oct 2017, Christoph Hellwig wrote:

> On Mon, Oct 02, 2017 at 07:33:29PM -0400, Nicolas Pitre wrote:
> > On Tue, 3 Oct 2017, Richard Weinberger wrote:
> > 
> > > On Mon, Oct 2, 2017 at 12:29 AM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> > > > On Sun, 1 Oct 2017, Christoph Hellwig wrote:
> > > >
> > > >> up_read(&mm->mmap_sem) in the fault path is a still a complete
> > > >> no-go,
> > > >>
> > > >> NAK
> > > >
> > > > Care to elaborate?
> > > >
> > > > What about mm/filemap.c:__lock_page_or_retry() then?
> > > 
> > > As soon you up_read() in the page fault path other tasks will race
> > > with you before
> > > you're able to grab the write lock.
> > 
> > But I _know_ that.
> > 
> > Could you highlight an area in my code where this is not accounted for?
> 
> Existing users of lock_page_or_retry return VM_FAULT_RETRY right after
> up()ing mmap_sem, and they must already have a reference to the page
> which is the only thing touched until then.
> 
> Your patch instead goes for an exclusive mmap_sem if it can, and
> even if there is nothing that breaks with that scheme right now
> there s nothing documenting that this actually safe, and we are
> way down in the complex page fault path.

It is pretty obvious looking at the existing code that if you want to 
safely manipulate a vma you need the write lock. There are many things 
in the kernel tree that are not explicitly documented. Did that stop 
people from adding new code?

I agree that the fault path is quite complex. I've studied it carefully 
before coming up with this scheme. This is not something that came about 
just because the sunshine felt good when I woke up one day.

So if you agree that I've done a reasonable job creating a scheme that 
currently doesn't break then IMHO this should be good enough, 
*especially* for such an isolated and specialized use case with zero 
impact on anyone else. And if things break in the future than I will be 
the one working out the pieces not you, and _that_ can be written down 
somewhere if necessary so nobody has an obligation to bend backward for 
not breaking it.

Unless you have a better scheme altogether  to suggest of course, given 
the existing constraints.


Nicolas

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
