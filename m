From: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH 13/14] Pramfs: Write protection
Date: Tue, 16 Jun 2009 19:35:24 -0700
Message-ID: <6934efce0906161935x65c2a31br4bf1d35493e7b77c@mail.gmail.com>
References: <4A33A835.901@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=1TsPXe5QFPKoiOP6KoCj+E/5xMf4KgOOmYJs4vMkXWY=;
        b=vkvXG8FONViLEZ1DDY6/NQ+zfIPJ7us5DBdczicqZ4ELDLgK/Yc0xXD6TMjkHVHCSp
         WVYgA0tfLXshPNw9RKuY2rbJNxanHyOhPgJCMEy8bDzzi9jymgk6as+rgL72O7Xyl516
         atnh/K3MgFmTyOjHjDB0vCa17VNEax7P503ZM=
In-Reply-To: <4A33A835.901@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marco <marco.stornelli@gmail.com>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

> +/* init_mm.page_table_lock must be held before calling! */
> +static void pram_page_writeable(unsigned long addr, int rw)
> +{
> + =A0 =A0 =A0 pgd_t *pgdp;
> + =A0 =A0 =A0 pud_t *pudp;
> + =A0 =A0 =A0 pmd_t *pmdp;
> + =A0 =A0 =A0 pte_t *ptep;
> +
> + =A0 =A0 =A0 pgdp =3D pgd_offset_k(addr);
> + =A0 =A0 =A0 if (!pgd_none(*pgdp)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pudp =3D pud_offset(pgdp, addr);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!pud_none(*pudp)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pmdp =3D pmd_offset(pud=
p, addr);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!pmd_none(*pmdp)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pte_t p=
te;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ptep =3D=
 pte_offset_kernel(pmdp, addr);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pte =3D=
 *ptep;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pte=
_present(pte)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 pte =3D rw ? pte_mkwrite(pte) :
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 pte_wrprotect(pte);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 set_pte(ptep, pte);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +}

Wow.  Don't we want to do this pte walking in mm/ someplace?

Do you really intend to protect just the PTE in question rather than
the entire physical page, regardless of which PTE is talking to it?
Maybe I'm missing something.

> +/* init_mm.page_table_lock must be held before calling! */
> +void pram_writeable(void *vaddr, unsigned long size, int rw)
> +{
> + =A0 =A0 =A0 unsigned long addr =3D (unsigned long)vaddr & PAGE_MASK=
;
> + =A0 =A0 =A0 unsigned long end =3D (unsigned long)vaddr + size;
> + =A0 =A0 =A0 unsigned long start =3D addr;
> +
> + =A0 =A0 =A0 do {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pram_page_writeable(addr, rw);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr +=3D PAGE_SIZE;
> + =A0 =A0 =A0 } while (addr && (addr < end));
> +
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* NOTE: we will always flush just one page (one TLB
> + =A0 =A0 =A0 =A0* entry) except possibly in one case: when a new
> + =A0 =A0 =A0 =A0* filesystem is initialized at mount time, when pram=
_read_super
> + =A0 =A0 =A0 =A0* calls pram_lock_range to make the super block, ino=
de
> + =A0 =A0 =A0 =A0* table, and bitmap writeable.
> + =A0 =A0 =A0 =A0*/
> +#if defined(CONFIG_ARM) || defined(CONFIG_M68K) || defined(CONFIG_H8=
300) || \
> + =A0 =A0 =A0 defined(CONFIG_BLACKFIN)
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* FIXME: so far only these archs have flush_tlb_kern=
el_page(),
> + =A0 =A0 =A0 =A0* for the rest just use flush_tlb_kernel_range(). No=
t ideal
> + =A0 =A0 =A0 =A0* to use _range() because many archs just flush the =
whole TLB.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (end <=3D start + PAGE_SIZE)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 flush_tlb_kernel_page(start);
> + =A0 =A0 =A0 else
> +#endif
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 flush_tlb_kernel_range(start, end);
> +}

Why not just fix flush_tlb_range()?

If an arch has a flush_tlb_kernel_page() that works then it stands to
reason that the flush_tlb_kernel_range() shouldn't work with minimal
effort, no?
