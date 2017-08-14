From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 1/5] cramfs: direct memory access support
Date: Sun, 13 Aug 2017 22:29:09 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1708132144080.17016@knanqh.ubzr>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org> <20170811192252.19062-2-nicolas.pitre@linaro.org> <20170812074927.GA8703@infradead.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=vr/2O2IdIrbdQNeGhoHlgG87Eep2KF+h+9JWI6PDLhc=;
        b=EAXkB/+yVBUQznnPUeFdaS29iTojTkUY7Rzf5I5S2hQXj2Cq8iI6CEqzwvV2MMp9aN
         Ilq+Fe6CQG6944Prrm+a2ZI8Ke7XpXdBfr1ojCTupfuXwtVLVADjVadVePXIPS4TVWkn
         mDoXVTkhmRJQ4/ilvKpt9PLBd8QJF31SHxk4k=
In-Reply-To: <20170812074927.GA8703@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

On Sat, 12 Aug 2017, Christoph Hellwig wrote:

> Direct physical memory access in a file system is never safe.
> Please make sure this goes through struct dax_operations.

Well, after having a closer look, I don't think dax might be relevant 
here for a couple reasons:

- cramfs is read-only. No concurrent writes to worry about. Please 
  elaborate if you have other safety concerns in mind.

- This series targets small no-MMU systems. There is no paging involved 
  given the lack of a MMU. The whole of the filesystem is always 
  directly accessible in the address space from ROM alongside with the 
  actual kernel code being executed. I don't see how dax would ever be 
  pertinent here.

- Even with MMU systems, the maximum size of a cramfs image can't exceed 
  272MB. In practice it is likely to be much much less. Given this 
  targets small memory systems, there is always plenty of vmalloc space 
  left to map it all and even a 272MB memremap() wouldn't be a problem.  
  If it is a problem then maybe your system has large resources to 
  manage already and you're pretty unlikely to be using cramfs in the 
  first place, otherwise accessing it through a block device would be 
  just fine, at which point you'd better consider squashfs instead of 
  this.

All this to say that I think that dax is _way_ overkill and 
inappropriate for the intended cramfs use case this series is 
addressing.


Nicolas
