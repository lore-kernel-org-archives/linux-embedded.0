From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v4 4/5] cramfs: add mmap support
Date: Sun, 1 Oct 2017 18:29:22 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1710011805070.5407@knanqh.ubzr>
References: <20170927233224.31676-1-nicolas.pitre@linaro.org> <20170927233224.31676-5-nicolas.pitre@linaro.org> <20171001083052.GB17116@infradead.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=NCciCe3sgUi6lFhklJzFCDodryRY26CALCqRefdxjd0=;
        b=PClz3SctUV0cKO7xQiRtD13MoWv8VSkgHdYWchFjq7JXAbVzjI3lFoPqhlbMogi8aj
         bDScyvAqdntfbT4hxqC0tHEZj7sAtwuYpCGejdfM0XcRZNZI5IjL1D0tRkVewpNrGeuC
         MRP5Z8QcIah7ODKGe/TlDIV/Prpu/wLBbc+u4=
In-Reply-To: <20171001083052.GB17116@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

On Sun, 1 Oct 2017, Christoph Hellwig wrote:

> up_read(&mm->mmap_sem) in the fault path is a still a complete
> no-go,
> 
> NAK

Care to elaborate?

What about mm/filemap.c:__lock_page_or_retry() then?

Why the special handling on mm->mmap_sem with VM_FAULT_RETRY?

What are the potential problems with my approach I didn't cover yet?

Serious: I'm simply looking for solutions here.


Nicolas
