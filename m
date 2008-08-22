From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 07/10] AXFS: axfs_bdev.c
Date: Fri, 22 Aug 2008 10:39:18 -0700
Message-ID: <6934efce0808221039o3ea57e35ka24a617621e2646e@mail.gmail.com>
References: <48AD010B.6030209@gmail.com> <20080822125440.GA1396@mx.loc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=5TKka7RvWJRywvhKKD4EuTNpv3xhoxXbIUQZd3cr60c=;
        b=sQ5wFz1kbqjG2dpsFFEUbUSsMbEq3bP+I9OO8vr4+6Sbah7Ln+twIH0isF3rzTmAPY
         MHvGLqBAxJanCrXdDo+9ZKeKNUwkJxcv7vv4+sFa0C9OJEarTWNVmPADd+DhPFgipLMe
         nAzLp5CO5tXZqKTYp/Goozrbsm1qpmIn0+tLk=
In-Reply-To: <20080822125440.GA1396@mx.loc>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

> mismatch between documentation and implementation WRT the function name ;)
oops.

>>+{
>>+      struct axfs_super *sbi = AXFS_SB(sb);
>>+      u64 boffset = AXFS_FSOFFSET_2_DEVOFFSET(sbi, fsoffset);
>>+      u64 blocks;
>>+      u64 blksize = sb->s_blocksize;
>>+      unsigned long dst;
>>+      unsigned long src;
>>+      sector_t block;
>>+      size_t bytes;
>>+      struct buffer_head *bh;
>>+      u64 copied = 0;
>>+
>>+      if (len == 0)
>>+              return 0;
>>+
>>+      blocks = len / blksize;
>>+      if ((len % blksize) > 0)
>>+              blocks += 1;
>>+
>>+      while (copied < len) {
>>+              /* Explicit casting for ARM linker errors. */
>
> did it try to emit some external div()? Is this still needed?

exactly.  I haven't heard otherwise, it was a Freescale ARM11 build
that had the issue... I don't have the set up.
