From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 07:11:08 -0700
Message-ID: <6934efce0808210711t686a88eci6eb294dbb54d68fe@mail.gmail.com>
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759058AbYHUOLY@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=8m3YUO1Nrj/z/V6m+nDHbrRwwWZW6OCgpE9M5dkcbEc=;
        b=PGpyOG4XfmMhsOu6TyRQrIaJXPEBSIcAUeLOprikmap/00kBmuM+tu5f2RoUJaQ6dJ
         uwH5Cfqj7XKGYkgnJToY3QCgJghGZw37TBGhnojcAlF0jG6S5a+RMzzzxrRbpaGdRlpR
         Ihm3oX2HGr1vLqEZtebDn7v4wlNmVb5jNAtKU=
In-Reply-To: <20080821110749.GA1926@shareable.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> How does it fare with no MMU?  Can the profiler and image builder lay
> out the XIP pages in such a way that no-MMU mmaps can map those regions?
>
> No complaint if not, it would be a nice bonus though.

Sorry.  I don't believe it will work on no-MMU as is.  That said you
_could_ tweak the mkfs tool to lay mmap()'ed regions down contiguously
but then if you mmap() an unprofiled region, well that would be bad.
I suppose you could make axfs_mmap smart enough to handle that.  I
guess the cleanest way would be to just make files lay down
contiguously, you lose some of the space saving but it would work.

I'm not plannin to get to this anytime soon.  But I'd be willing merge
patches.  Can anybody convince me offline that working on no-MMU this
makes financial sense for my employer?  This is getting to be a common
question.  How many noMMU users are out there and why are you so
interested?
