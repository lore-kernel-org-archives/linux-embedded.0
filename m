From: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH v4 4/5] cramfs: add mmap support
Date: Tue, 3 Oct 2017 00:45:27 +0200
Message-ID: <CAFLxGvzfQrvU-8w7F26mez6fCQD+iS_qRJpLSU+2DniEGouEfA@mail.gmail.com>
References: <20170927233224.31676-1-nicolas.pitre@linaro.org>
 <20170927233224.31676-5-nicolas.pitre@linaro.org> <20171001083052.GB17116@infradead.org>
 <nycvar.YSQ.7.76.1710011805070.5407@knanqh.ubzr>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=W1gRfHlSzuMUe34Bf9aJJjywsyMIiPahcB9ovyNozzY=;
        b=maC8tXQDUzFbisnqm5VS5dp7kfw00mCKr0GTIM4Ph6mlp2j5PnbXFGveDXOBb0wDBE
         ZIFnW3faENrY0byGTCgWuZ8kvWRygyOeFLN1za/mS62GgbCHiE+uwGvFK5aW0VQhlS0v
         Bkw0FA4TAlcsEuMv7iu68AlHdIX/EK8ss+HK1Hpbzu94eULmeWzRUsLoQBbdc5taC/2E
         fPWbwVdZqNGJ2NTcXLVZGpFQ2SA1CdPeJDPCYQuJXE0s5n1uyx/9gABh8kQcS4/544Eg
         zL7rClIjnG73u/YE2eRuv4d/OD8vqDCW6/jSpzbDC4AMu7l+0fv4FsIh599kY19V8PnR
         QMkA==
In-Reply-To: <nycvar.YSQ.7.76.1710011805070.5407@knanqh.ubzr>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Christoph Hellwig <hch@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, "linux-mm@kvack.org" <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Chris Brandt <Chris.Brandt@renesas.com>

On Mon, Oct 2, 2017 at 12:29 AM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> On Sun, 1 Oct 2017, Christoph Hellwig wrote:
>
>> up_read(&mm->mmap_sem) in the fault path is a still a complete
>> no-go,
>>
>> NAK
>
> Care to elaborate?
>
> What about mm/filemap.c:__lock_page_or_retry() then?

As soon you up_read() in the page fault path other tasks will race
with you before
you're able to grab the write lock.

HTH

-- 
Thanks,
//richard

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
