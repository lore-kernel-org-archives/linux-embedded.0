From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH v2 4/5] cramfs: add mmap support
Date: Mon, 28 Aug 2017 15:23:06 +0100
Message-ID: <20170828142306.GJ5426@ZenIV.linux.org.uk>
References: <20170816173536.1879-1-nicolas.pitre@linaro.org>
 <20170816173536.1879-5-nicolas.pitre@linaro.org>
 <20170828064632.GA26136@ZenIV.linux.org.uk>
 <nycvar.YSQ.7.76.1708280914260.2606@knanqh.ubzr>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.1708280914260.2606@knanqh.ubzr>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

On Mon, Aug 28, 2017 at 09:29:58AM -0400, Nicolas Pitre wrote:
> > > +	/* Make sure the vma didn't change between the locks */
> > > +	vma = find_vma(mm, vmf->address);
> > > +	if (vma->vm_ops != &cramfs_vmasplit_ops) {
> > > +		/*
> > > +		 * Someone else raced with us and could have handled the fault.
> > > +		 * Let it go back to user space and fault again if necessary.
> > > +		 */
> > > +		downgrade_write(&mm->mmap_sem);
> > > +		return VM_FAULT_NOPAGE;
> > > +	}
> > > +
> > > +	/* Split the vma between the directly mapped area and the rest */
> > > +	ret = split_vma(mm, vma, split_addr, 0);
> > 
> > Egads...  Everything else aside, who said that your split_... will have
> > anything to do with the vma you get from find_vma()?
> 
> When vma->vm_ops == &cramfs_vmasplit_ops it is guaranteed that the vma 
> is not fully populated and that the unpopulated area starts at 
> split_addr. That split_addr was stored in vma->vm_private_data at the 
> same time as vma->vm_ops. Given that mm->mmap_sem is held all along 
> across find_vma(), split_vma() and the second find_vma() I hope that I 
> can trust that things will be related.

Huh?  You do realize that another thread might've been blocked on that ->mmap_sem
in mremap(), get it, have ours block on attempt to get ->mmap_sem exclusive,
exterminate the original vma and put there a vma that has also come from cramfs,
but other than that had not a damn thing in common with the original.  Different
memory area, etc.

Matching ->vm_ops is nowhere near enough.

While we are at it, what happens if you mmap 120Kb, then munmap() the middle
40Kb.  Leaving two 40Kb VMAs with 40Kb gap between them, that is.  Will your
->vm_private_data be correct for both?
