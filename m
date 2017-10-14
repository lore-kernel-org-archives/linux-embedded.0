From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v6 1/4] cramfs: direct memory access support
Date: Fri, 13 Oct 2017 22:37:58 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1710132229560.1750@knanqh.ubzr>
References: <20171012061613.28705-1-nicolas.pitre@linaro.org> <20171012061613.28705-2-nicolas.pitre@linaro.org> <20171013172934.GG21978@ZenIV.linux.org.uk> <nycvar.YSQ.7.76.1710131332360.1718@knanqh.ubzr> <20171013175208.GI21978@ZenIV.linux.org.uk>
 <nycvar.YSQ.7.76.1710131532291.1750@knanqh.ubzr> <20171014003151.GK21978@ZenIV.linux.org.uk> <nycvar.YSQ.7.76.1710132204420.1750@knanqh.ubzr>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=al1eiE33JHlbEPvVi8oTY1sLhNqVDF/A1ESoY4Mx7jM=;
        b=cNy46y8ggVp++qwsj+uYBsNbmVtKBRw2o1GV/1DAW7o5MK7DsDYCsMSY44DwFB+Tk2
         UnGPwB/ixFVX/lGmB32Ek2l60gGG1addDRZx+OBMSFHjlAtIsnJ9DSzBnZobf8EzqJIA
         k7A27eCP7NJD7z63C7axPjcuKm1obv0CCoqIY=
In-Reply-To: <nycvar.YSQ.7.76.1710132204420.1750@knanqh.ubzr>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

On Fri, 13 Oct 2017, Nicolas Pitre wrote:

> On Sat, 14 Oct 2017, Al Viro wrote:
> 
> > On Fri, Oct 13, 2017 at 04:09:23PM -0400, Nicolas Pitre wrote:
> > > On Fri, 13 Oct 2017, Al Viro wrote:
> > > 
> > > > OK...  I wonder if it should simply define stubs for kill_mtd_super(),
> > > > mtd_unpoint() and kill_block_super() in !CONFIG_MTD and !CONFIG_BLOCK
> > > > cases.  mount_mtd() and mount_bdev() as well - e.g.  mount_bdev()
> > > > returning ERR_PTR(-ENODEV) and kill_block_super() being simply BUG()
> > > > in !CONFIG_BLOCK case.  Then cramfs_kill_sb() would be
> > > > 	if (sb->s_mtd) {
> > > > 		if (sbi->mtd_point_size)
> > > > 			mtd_unpoint(sb->s_mtd, 0, sbi->mtd_point_size);
> > > > 		kill_mtd_super(sb);
> > > > 	} else {
> > > > 		kill_block_super(sb);
> > > > 	}
> > > > 	kfree(sbi);
> > > 
> > > Well... Stubs have to be named differently or they conflict with 
> > > existing declarations. At that point that makes for more lines of code 
> > > compared to the current patch and the naming indirection makes it less 
> > > obvious when reading the code. Alternatively I could add those stubs in 
> > > the corresponding header files and #ifdef the existing declarations 
> > > away. That might look somewhat less cluttered in the main code but it 
> > > also hides what is actually going on and left me unconvinced. And I'm 
> > > not sure this is worth it in the end given this is not a common 
> > > occurrence in the kernel either.
> > 
> > What I mean is this (completely untested) for CONFIG_BLOCK side of things,
> > with something similar for CONFIG_MTD one:
> > 
> > Provide definitions of mount_bdev/kill_block_super() in case !CONFIG_BLOCK
> 
> Yes, that's what I thought you meant, which corresponds to the second 
> part of my comment above. And as I said I'm not convinced this hiding of 
> kernel config effects is better for understanding what is actually going 
> on locally, and my own preference is how things are right now.

Another case that your suggestion doesn't cover well is the ability to 
still have block device support in the kernel for other filesystems but 
_without_ block device support in the cramfs case. In other words, 
having CONFIG_BLOCK=y and CONFIG_CRAMFS_BLOCKDEV=n. This is a common 
case to have embedded devices with the root filesystem in flash while 
still needing access to a FAT filesystem on SD cards. Your stubs are 
conditional on CONFIG_BLOCK but that is not sufficient in this example.


Nicolas

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
