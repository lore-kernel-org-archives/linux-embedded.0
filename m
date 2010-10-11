From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 14(16] pramfs: memory protection
Date: Mon, 11 Oct 2010 19:32:10 +0200
Message-ID: <4CB34A1A.3030003@gmail.com>
References: <4CB1EBA2.8090409@gmail.com> <87aamm3si1.fsf@basil.nowhere.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=lDqYUkRdihaVkLL6HrWusRYMEjEX9OXFinc9zJ6eYTA=;
        b=Scr/gWorvELuRi85vAAO4A0ko7vg8x6HhaPpcWxCMIJEeLH6BdCZ4I/S61Ohg+J/x2
         PMzPollb22Hn9JmWtKsoIXM5G2h4yELrLA5Ht64wruApyBY27/DtUF8kvD4y4eDxl0JT
         eb08OX4KayJZkAJFSQg7OYq4xgQ3K7L2z1Yzg=
In-Reply-To: <87aamm3si1.fsf@basil.nowhere.org>
Sender: owner-linux-mm@kvack.org
List-Id: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <andi@firstfloor.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, linux-mm@kvack.org

Il 10/10/2010 18:46, Andi Kleen ha scritto:
> This won't work at all on x86 because you don't handle large 
> pages.
> 
> And it doesn't work on x86-64 because the first 2GB are double
> mapped (direct and kernel text mapping)
> 
> Thirdly I expect it won't either on architectures that map
> the direct mapping with special registers (like IA64 or MIPS)

Andi, what do you think to use the already implemented follow_pte
instead? 

int writeable_kernel_pte_range(unsigned long address, unsigned long size,
							      unsigned int rw)
{

	unsigned long addr = address & PAGE_MASK;
	unsigned long end = address + size;
	unsigned long start = addr;
	int ret = -EINVAL;
	pte_t *ptep, pte;
	spinlock_t *lock = &init_mm.page_table_lock;

	do {
		ret = follow_pte(&init_mm, addr, &ptep, &lock);
		if (ret)
			goto out;
		pte = *ptep;
		if (pte_present(pte)) {
			  pte = rw ? pte_mkwrite(pte) : pte_wrprotect(pte);
			  *ptep = pte;
		}
		pte_unmap_unlock(ptep, lock);
		addr += PAGE_SIZE;
	} while (addr && (addr < end));

	ret = 0;

out:
	flush_tlb_kernel_range(start, end);
	return ret;
}


> 
> I'm not sure this is very useful anyways. It doesn't protect
> against stray DMA and it doesn't protect against writes through
> broken user PTEs.
> 
> -Andi
> 

It's a way to have more protection against kernel bug, for a 
in-memory fs can be important. However this option can be 
enabled/disabled at fs level.

Marco

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

