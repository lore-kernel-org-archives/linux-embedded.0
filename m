From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 4/5] cramfs: add mmap support
Date: Tue, 3 Oct 2017 07:57:32 -0700
Message-ID: <20171003145732.GA8890@infradead.org>
References: <20170927233224.31676-1-nicolas.pitre@linaro.org>
 <20170927233224.31676-5-nicolas.pitre@linaro.org>
 <20171001083052.GB17116@infradead.org>
 <nycvar.YSQ.7.76.1710011805070.5407@knanqh.ubzr>
 <CAFLxGvzfQrvU-8w7F26mez6fCQD+iS_qRJpLSU+2DniEGouEfA@mail.gmail.com>
 <nycvar.YSQ.7.76.1710021931270.5407@knanqh.ubzr>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	 bh=q98fqCOo5z94/9axuKlBx2KCYL7T6fR78DxpRrd1D7g=; b=oqX324GMgkxxAwRKa9jHAHnVy
	bP29y2xOUzJJqg2JJgXk+Nopdn0ODezuBl25XAxhBStlbFbDF0bDQQ+3kpOtXP7toP6PdPvmKatz6
	zgwNaEgUiQk45ho9dfM+zibPmW4AvcRGtMuEqi5uOVyIzlLK20C1/kwEugYEAe7V+tm5riI4xVFwD
	pJxZy+CjfzX+SF707j+thJJg8mwoO+tqLj+twm4dI1SrIFOx/9SMySi3Ll4M0Ze2p2TkU9I8Dgf5N
	RutEds59RUgnUevMsYvGNqA1dqCDr7luogW6wBa0Wwd85oN+KMcC2R9eer4H7tc3xRbKzcd/hQLpl
	50fBGnjdw==;
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.1710021931270.5407@knanqh.ubzr>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Richard Weinberger <richard.weinberger@gmail.com>, Christoph Hellwig <hch@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, "linux-mm@kvack.org" <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Chris Brandt <Chris.Brandt@renesas.com>

On Mon, Oct 02, 2017 at 07:33:29PM -0400, Nicolas Pitre wrote:
> On Tue, 3 Oct 2017, Richard Weinberger wrote:
> 
> > On Mon, Oct 2, 2017 at 12:29 AM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> > > On Sun, 1 Oct 2017, Christoph Hellwig wrote:
> > >
> > >> up_read(&mm->mmap_sem) in the fault path is a still a complete
> > >> no-go,
> > >>
> > >> NAK
> > >
> > > Care to elaborate?
> > >
> > > What about mm/filemap.c:__lock_page_or_retry() then?
> > 
> > As soon you up_read() in the page fault path other tasks will race
> > with you before
> > you're able to grab the write lock.
> 
> But I _know_ that.
> 
> Could you highlight an area in my code where this is not accounted for?

Existing users of lock_page_or_retry return VM_FAULT_RETRY right after
up()ing mmap_sem, and they must already have a reference to the page
which is the only thing touched until then.

Your patch instead goes for an exclusive mmap_sem if it can, and
even if there is nothing that breaks with that scheme right now
there s nothing documenting that this actually safe, and we are
way down in the complex page fault path.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
