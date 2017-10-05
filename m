From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v4 4/5] cramfs: add mmap support
Date: Thu, 5 Oct 2017 13:52:03 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1710051203260.1693@knanqh.ubzr>
References: <20171001083052.GB17116@infradead.org> <nycvar.YSQ.7.76.1710011805070.5407@knanqh.ubzr> <CAFLxGvzfQrvU-8w7F26mez6fCQD+iS_qRJpLSU+2DniEGouEfA@mail.gmail.com> <nycvar.YSQ.7.76.1710021931270.5407@knanqh.ubzr> <20171003145732.GA8890@infradead.org>
 <nycvar.YSQ.7.76.1710031107290.5407@knanqh.ubzr> <20171003153659.GA31600@infradead.org> <nycvar.YSQ.7.76.1710031137580.5407@knanqh.ubzr> <20171004072553.GA24620@infradead.org> <nycvar.YSQ.7.76.1710041608460.1693@knanqh.ubzr>
 <20171005071545.GA23364@infradead.org>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=fCy6/vT9F2jLkIUmLs358NBmHcgWlPrpOs2KO30sFUo=;
        b=ItY8OcolkcMY5/dcQf/yznwxsh4N74O+Wf3aaTaVFIsmQseLHGnrsFp9xgwnI/0xFq
         1R6Wp6pgliLB+eni35Fj1DP4Xc7Nhh2U/aUYGYGEwAK/IapIvw+vb6PsSMyHNK6OdSO5
         9NSDgdvgyCMcs5UBJYc9zsTDDwPH5QDg+x7RM=
In-Reply-To: <20171005071545.GA23364@infradead.org>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Richard Weinberger <richard.weinberger@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, "linux-mm@kvack.org" <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Chris Brandt <Chris.Brandt@renesas.com>

On Thu, 5 Oct 2017, Christoph Hellwig wrote:

> On Wed, Oct 04, 2017 at 04:47:52PM -0400, Nicolas Pitre wrote:
> > The only downside so far is the lack of visibility from user space to 
> > confirm it actually works as intended. With the vma splitting approach 
> > you clearly see what gets directly mapped in /proc/*/maps thanks to 
> > remap_pfn_range() storing the actual physical address in vma->vm_pgoff. 
> > With VM_MIXEDMAP things are no longer visible. Any opinion for the best 
> > way to overcome this?
> 
> Add trace points that allow you to trace it using trace-cmd, perf
> or just tracefs?

In memory constrained embedded environments those facilities are 
sometimes too big to be practical. And the /proc/*/maps content is 
static i.e. it is always there regardless of how many tasks you have and 
how long they've been running which makes it extremely handy.

> > Anyway, here's a replacement for patch 4/5 below:
> 
> This looks much better, and is about 100 lines less than the previous
> version.  More (mostly cosmetic) comments below:
> 
[...]
> > +	fail_reason = "vma is writable";
> > +	if (vma->vm_flags & VM_WRITE)
> > +		goto fail;
> 
> The fail_reaosn is a rather unusable style, is there any good reason
> why you need it here?  We generall don't add a debug printk for every
> pssible failure case.

There are many things that might make your files not XIP and they're 
mostly related to how the file is mmap'd or how mkcramfs was used. When 
looking where some of your memory has gone because some files are not 
directly mapped it is nice to have a hint as to why at run time. Doing 
it that way also works as comments for someone reading the code, and the 
compiler optimizes those strings away when DEBUG is not defined anyway. 

I did s/fail/bailout/ though, as those are not hard failures. The hard 
failures have no such debugging messages.

[...]
> It seems like this whole partial section should just go into a little
> helper where the nonzero case is at the end of said helper to make it
> readable.  Also lots of magic numbers again, and generally a little
> too much magic for the code to be easily understandable: why do you
> operate on pointers casted to longs, increment in 8-byte steps?
> Why is offset_in_page used for an operation that doesn't operate on
> struct page at all?  Any reason you can't just use memchr_inv?

Ahhh... use memchr_inv is in fact exactly what I was looking for.
Learn something every day.

[...]
> > +	/* We failed to do a direct map, but normal paging is still possible */
> > +	vma->vm_ops = &generic_file_vm_ops;
> 
> Maybe let the mixedmap case fall through to this instead of having
> a duplicate vm_ops assignment.

The code flow is different and that makes it hard to have a common 
assignment in this case.

Otherwise I've applied all your suggestions.

Thanks for your comments. Very appreciated.


Nicolas

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
