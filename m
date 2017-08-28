From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v2 4/5] cramfs: add mmap support
Date: Mon, 28 Aug 2017 09:29:58 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1708280914260.2606@knanqh.ubzr>
References: <20170816173536.1879-1-nicolas.pitre@linaro.org> <20170816173536.1879-5-nicolas.pitre@linaro.org> <20170828064632.GA26136@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=wNFw7+8Gpw7k6op9MIHWRs8HaXbvVCs4QIb+uxpUwJw=;
        b=W/Tf/Ex6fLv/B1AbRo1TQY+xZL10F2Zafe5aSxq5Lrmvxh6mSCPDcZkaCXaXentpL4
         SjQxs0yebwiRukFKTN9KYnKAuASrCSGeAJ4h/bYTDST2BlMZgCy1zOktG//D7BRRpFyT
         syhZ5LlIQ2oVY/mAJL6/ipCsyPO2U1eUbWAqk=
In-Reply-To: <20170828064632.GA26136@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

On Mon, 28 Aug 2017, Al Viro wrote:

> On Wed, Aug 16, 2017 at 01:35:35PM -0400, Nicolas Pitre wrote:
> 
> > +static const struct vm_operations_struct cramfs_vmasplit_ops;
> > +static int cramfs_vmasplit_fault(struct vm_fault *vmf)
> > +{
> > +	struct mm_struct *mm = vmf->vma->vm_mm;
> > +	struct vm_area_struct *vma, *new_vma;
> > +	unsigned long split_val, split_addr;
> > +	unsigned int split_pgoff, split_page;
> > +	int ret;
> > +
> > +	/* Retrieve the vma split address and validate it */
> > +	vma = vmf->vma;
> > +	split_val = (unsigned long)vma->vm_private_data;
> > +	split_pgoff = split_val & 0xffff;
> > +	split_page = split_val >> 16;
> > +	split_addr = vma->vm_start + split_page * PAGE_SIZE;
> > +	pr_debug("fault: addr=%#lx vma=%#lx-%#lx split=%#lx\n",
> > +		 vmf->address, vma->vm_start, vma->vm_end, split_addr);
> > +	if (!split_val || split_addr >= vma->vm_end || vmf->address < split_addr)
> > +		return VM_FAULT_SIGSEGV;
> > +
> > +	/* We have some vma surgery to do and need the write lock. */
> > +	up_read(&mm->mmap_sem);
> > +	if (down_write_killable(&mm->mmap_sem))
> > +		return VM_FAULT_RETRY;
> > +
> > +	/* Make sure the vma didn't change between the locks */
> > +	vma = find_vma(mm, vmf->address);
> > +	if (vma->vm_ops != &cramfs_vmasplit_ops) {
> > +		/*
> > +		 * Someone else raced with us and could have handled the fault.
> > +		 * Let it go back to user space and fault again if necessary.
> > +		 */
> > +		downgrade_write(&mm->mmap_sem);
> > +		return VM_FAULT_NOPAGE;
> > +	}
> > +
> > +	/* Split the vma between the directly mapped area and the rest */
> > +	ret = split_vma(mm, vma, split_addr, 0);
> 
> Egads...  Everything else aside, who said that your split_... will have
> anything to do with the vma you get from find_vma()?

When vma->vm_ops == &cramfs_vmasplit_ops it is guaranteed that the vma 
is not fully populated and that the unpopulated area starts at 
split_addr. That split_addr was stored in vma->vm_private_data at the 
same time as vma->vm_ops. Given that mm->mmap_sem is held all along 
across find_vma(), split_vma() and the second find_vma() I hope that I 
can trust that things will be related.


Nicolas
