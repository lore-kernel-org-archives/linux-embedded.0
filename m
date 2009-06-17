From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH 13/14] Pramfs: Write Protection
Date: Wed, 17 Jun 2009 13:10:33 -0400
Message-ID: <8bd0f97a0906171010l46a0f389kb2145a5be3e4001@mail.gmail.com>
References: <4A392098.9060205@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=wvzByDKt3g+nYtd2sehsd//GhxOdaPXNvRwf4NA+VH0=;
        b=QsZqoMYAULvvqQh2HYVpQx1hsbt+whIHvyVRasHwZmaPW57PKPR/Gi/wEIY+iS/xqT
         FQZsEFs/NgqZqXJnUY3jBOswQiSpYsPAh0lAIqO+FfpjP1NDFDR5kiOMAonWOxBA1sF9
         dJzX9Msa/Cyfvth1EK+2yjFVa2Ub7XCOlYjfQ=
In-Reply-To: <4A392098.9060205@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marco <marco.stornelli@gmail.com>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, linux@arm.linux.org.uk, linux-m68k@lists.linux-m68k.org, uclinux-dist-devel@blackfin.uclinux.org, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

On Wed, Jun 17, 2009 at 12:58, Marco wrote:
> Jared Hulbert wrote:
>> > > +#if defined(CONFIG_ARM) || defined(CONFIG_M68K) || defined(CONFIG_H8300) || \
>> > > + ? ? ? defined(CONFIG_BLACKFIN)
>> > > + ? ? ? /*
>> > > + ? ? ? ?* FIXME: so far only these archs have flush_tlb_kernel_page(),
>> > > + ? ? ? ?* for the rest just use flush_tlb_kernel_range(). Not ideal
>> > > + ? ? ? ?* to use _range() because many archs just flush the whole TLB.
>> > > + ? ? ? ?*/
>> > > + ? ? ? if (end <= start + PAGE_SIZE)
>> > > + ? ? ? ? ? ? ? flush_tlb_kernel_page(start);
>> > > + ? ? ? else
>> > > +#endif
>> > > + ? ? ? ? ? ? ? flush_tlb_kernel_range(start, end);
>> > > +}
>> >
>> > Why not just fix flush_tlb_range()?
>> >
>> > If an arch has a flush_tlb_kernel_page() that works then it stands to
>> > reason that the flush_tlb_kernel_range() shouldn't work with minimal
>> > effort, no?
>>
>> flush_tlb_kernel_page() is a new one to me, it doesn't have any mention
>> in Documentation/cachetlb.txt anyways.
>>
>> Many of the flush_tlb_kernel_range() implementations do ranged checks
>> with tunables to determine whether it is more expensive to selectively
>> flush vs just blowing the entire TLB away.
>>
>> Likewise, there is no reason why those 4 architectures can not just shove
>> that if (end <= start + PAGE_SIZE) check in the beginning of their
>> flush_tlb_kernel_range() and fall back on flush_tlb_kernel_page() for
>> those cases. Hiding this in generic code is definitely not the way to go.
>
> Ok I'll change that function at arch level and I'll remove the ifdef, I'll call only flush_tlb_kernel_page(), but I'd like to know what is the opinion of the arch maintainers to do that.

considering Blackfin defines flush_tlb_kernel_page() to BUG(), i dont
think we care what happens.  we dont have a MMU, so all tlb funcs ->
BUG().  presumably this code shouldnt have been compiled in the first
place for us.
-mike
