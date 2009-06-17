From: Marco <marco.stornelli@gmail.com>
Subject: Re: [PATCH 13/14] Pramfs: Write Protection
Date: Wed, 17 Jun 2009 18:58:00 +0200
Message-ID: <4A392098.9060205@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=RCSAQI2XZkx41LdFgk+GF43IR0HRr7kIqgUqdtANZII=;
        b=N+ZB4W5mhqDiYTF4/Ru1mZuxAnqcUgImMqotEac7zX40D8v6LwR2vL+3+jkqi/wgxx
         SjA/q6hhELgdUED6UmtufVGGtAgiNmYdapsiWOJd5mMG8oKQxm1iD0A/Im9UVaSwEpT0
         1TIAkijzQc2lSZ/ylhVHD9hNU4xOd/Omeu3O4=
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux FS Devel <linux-fsdevel@vger.kernel.org>, linux@arm.linux.org.uk, linux-m68k@lists.linux-m68k.org, uclinux-dist-devel@blackfin.uclinux.org
Cc: Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

Jared Hulbert wrote:
> > > +/* init_mm.page_table_lock must be held before calling! */
> > > +static void pram_page_writeable(unsigned long addr, int rw)
> > > +{
> > > + ? ? ? pgd_t *pgdp;
> > > + ? ? ? pud_t *pudp;
> > > + ? ? ? pmd_t *pmdp;
> > > + ? ? ? pte_t *ptep;
> > > +
> > > + ? ? ? pgdp = pgd_offset_k(addr);
> > > + ? ? ? if (!pgd_none(*pgdp)) {
> > > + ? ? ? ? ? ? ? pudp = pud_offset(pgdp, addr);
> > > + ? ? ? ? ? ? ? if (!pud_none(*pudp)) {
> > > + ? ? ? ? ? ? ? ? ? ? ? pmdp = pmd_offset(pudp, addr);
> > > + ? ? ? ? ? ? ? ? ? ? ? if (!pmd_none(*pmdp)) {
> > > + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? pte_t pte;
> > > + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ptep = pte_offset_kernel(pmdp, addr);
> > > + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? pte = *ptep;
> > > + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? if (pte_present(pte)) {
> > > + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? pte = rw ? pte_mkwrite(pte) :
> > > + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? pte_wrprotect(pte);
> > > + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? set_pte(ptep, pte);
> > > + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? }
> > > + ? ? ? ? ? ? ? ? ? ? ? }
> > > + ? ? ? ? ? ? ? }
> > > + ? ? ? }
> > > +}
> > 
> > Wow.  Don't we want to do this pte walking in mm/ someplace?
> > 
> > Do you really intend to protect just the PTE in question rather than
> > the entire physical page, regardless of which PTE is talking to it?
> > Maybe I'm missing something.
> > 
> follow_pfn() ought to be fine for this, optionally follow_pte() could be
> exported and used.


Ok I can create a new exported function follow_pte().

> > > +#if defined(CONFIG_ARM) || defined(CONFIG_M68K) || defined(CONFIG_H8300) || \
> > > + ? ? ? defined(CONFIG_BLACKFIN)
> > > + ? ? ? /*
> > > + ? ? ? ?* FIXME: so far only these archs have flush_tlb_kernel_page(),
> > > + ? ? ? ?* for the rest just use flush_tlb_kernel_range(). Not ideal
> > > + ? ? ? ?* to use _range() because many archs just flush the whole TLB.
> > > + ? ? ? ?*/
> > > + ? ? ? if (end <= start + PAGE_SIZE)
> > > + ? ? ? ? ? ? ? flush_tlb_kernel_page(start);
> > > + ? ? ? else
> > > +#endif
> > > + ? ? ? ? ? ? ? flush_tlb_kernel_range(start, end);
> > > +}
> > 
> > Why not just fix flush_tlb_range()?
> > 
> > If an arch has a flush_tlb_kernel_page() that works then it stands to
> > reason that the flush_tlb_kernel_range() shouldn't work with minimal
> > effort, no?
> 
> flush_tlb_kernel_page() is a new one to me, it doesn't have any mention
> in Documentation/cachetlb.txt anyways.
> 
> Many of the flush_tlb_kernel_range() implementations do ranged checks
> with tunables to determine whether it is more expensive to selectively
> flush vs just blowing the entire TLB away.
> 
> Likewise, there is no reason why those 4 architectures can not just shove
> that if (end <= start + PAGE_SIZE) check in the beginning of their
> flush_tlb_kernel_range() and fall back on flush_tlb_kernel_page() for
> those cases. Hiding this in generic code is definitely not the way to go.

Ok I'll change that function at arch level and I'll remove the ifdef, I'll call only flush_tlb_kernel_page(), but I'd like to know what is the opinion of the arch maintainers to do that.
(Who is the maintainer of H8300 arch?)

Marco
