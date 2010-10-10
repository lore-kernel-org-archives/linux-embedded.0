From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH 14(16] pramfs: memory protection
Date: Sun, 10 Oct 2010 18:46:46 +0200
Message-ID: <87aamm3si1.fsf@basil.nowhere.org>
References: <4CB1EBA2.8090409@gmail.com>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <4CB1EBA2.8090409@gmail.com> (Marco Stornelli's message of "Sun,
	10 Oct 2010 18:36:50 +0200")
Sender: owner-linux-mm@kvack.org
List-Id: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, linux-mm@kvack.org

Marco Stornelli <marco.stornelli@gmail.com> writes:
> +
> +	do {
> +		pgd = pgd_offset(&init_mm, address);
> +		if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
> +			goto out;
> +
> +		pud = pud_offset(pgd, address);
> +		if (pud_none(*pud) || unlikely(pud_bad(*pud)))
> +			goto out;
> +
> +		pmd = pmd_offset(pud, address);
> +		if (pmd_none(*pmd) || unlikely(pmd_bad(*pmd)))
> +			goto out;
> +
> +		ptep = pte_offset_kernel(pmd, addr);
> +		pte = *ptep;
> +		if (pte_present(pte)) {

This won't work at all on x86 because you don't handle large 
pages.

And it doesn't work on x86-64 because the first 2GB are double
mapped (direct and kernel text mapping)

Thirdly I expect it won't either on architectures that map
the direct mapping with special registers (like IA64 or MIPS)

I'm not sure this is very useful anyways. It doesn't protect
against stray DMA and it doesn't protect against writes through
broken user PTEs.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

