From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 13/14] Pramfs: Write Protection
Date: Thu, 18 Jun 2009 08:24:35 +0200
Message-ID: <2ea1731b0906172324g4654966eq22cf0bdbd3eafabf__17843.1357759566$1245306287$gmane$org@mail.gmail.com>
References: <4A392098.9060205@gmail.com> <20090618025736.GB26531@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=6mo/6tERf7N6ngCjurkz2Zp+AchUO8hlCaiGI6Jai3s=;
        b=D3XSdanidzMmZmeax4JzFzU6NXvwyrRkCIVclDlJvL2tfDyXmK+fZS790kqC+2RAHF
         FSVf33/2fO2GIiuZ8YRLpZQHh3a60HkyId1KURriCZS6EIzjpt7HnuYkLUPWH2je5i6a
         7W5cIYgDnJJckZGSEhIUgUDPozOaDqH15aLdg=
In-Reply-To: <20090618025736.GB26531@linux-sh.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Paul Mundt <lethal@linux-sh.org>, Marco <marco.stornelli@gmail.com>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, linux@arm.linux.org.uk, linux-m68k@lists.linux-m68k.org, uclinux-

2009/6/18 Paul Mundt <lethal@linux-sh.org>:
> On Wed, Jun 17, 2009 at 06:58:00PM +0200, Marco wrote:
>> Jared Hulbert wrote:
>> > > Why not just fix flush_tlb_range()?
>> > >
>> > > If an arch has a flush_tlb_kernel_page() that works then it stan=
ds to
>> > > reason that the flush_tlb_kernel_range() shouldn't work with min=
imal
>> > > effort, no?
>> >
>> > flush_tlb_kernel_page() is a new one to me, it doesn't have any me=
ntion
>> > in Documentation/cachetlb.txt anyways.
>> >
>> > Many of the flush_tlb_kernel_range() implementations do ranged che=
cks
>> > with tunables to determine whether it is more expensive to selecti=
vely
>> > flush vs just blowing the entire TLB away.
>> >
>> > Likewise, there is no reason why those 4 architectures can not jus=
t shove
>> > that if (end <=3D start + PAGE_SIZE) check in the beginning of the=
ir
>> > flush_tlb_kernel_range() and fall back on flush_tlb_kernel_page() =
for
>> > those cases. Hiding this in generic code is definitely not the way=
 to go.
>>
>> Ok I'll change that function at arch level and I'll remove the ifdef=
,
>> I'll call only flush_tlb_kernel_page(), but I'd like to know what is
>> the opinion of the arch maintainers to do that. =A0(Who is the maint=
ainer
>> of H8300 arch?)
>>
> No, you should call flush_tlb_kernel_range() and just fix up the
> flush_tlb_kernel_range() calls to wrap in to flush_tlb_kernel_page().=
 As
> far as the kernel is concerned, flush_tlb_kernel_page() is not a stan=
dard
> interface, as it has no mention in Documentation/cachetlb.txt.
> flush_tlb_page() and flush_tlb_kernel_range() on the other hand are b=
oth
> standard interfaces.

Oops, my fault. I meant flush_tlb_kernel_range not the page version,
sorry. I agree with you.

>
> H8300 is a nommu platform, so it has no TLB to flush. Yoshinori Sato =
is
> the maintainer. Consult the MAINTAINERS file, that's what it is there=
 for.
>

I know the MAINTAINERS file but for h8300 there isn't an exactly
indication (/arch/h8300 as for the other archs).

Marco
