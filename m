From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH 13/14] Pramfs: Write Protection
Date: Thu, 18 Jun 2009 11:57:36 +0900
Message-ID: <20090618025736.GB26531@linux-sh.org>
References: <4A392098.9060205@gmail.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A392098.9060205@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco <marco.stornelli@gmail.com>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, linux@arm.linux.org.uk, linux-m68k@lists.linux-m68k.org, uclinux-dist-devel@blackfin.uclinux.org, Linux Embedded <linux-embedded@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Walker <dwalker@soe.ucsc.edu>

On Wed, Jun 17, 2009 at 06:58:00PM +0200, Marco wrote:
> Jared Hulbert wrote:
> > > Why not just fix flush_tlb_range()?
> > > 
> > > If an arch has a flush_tlb_kernel_page() that works then it stands to
> > > reason that the flush_tlb_kernel_range() shouldn't work with minimal
> > > effort, no?
> > 
> > flush_tlb_kernel_page() is a new one to me, it doesn't have any mention
> > in Documentation/cachetlb.txt anyways.
> > 
> > Many of the flush_tlb_kernel_range() implementations do ranged checks
> > with tunables to determine whether it is more expensive to selectively
> > flush vs just blowing the entire TLB away.
> > 
> > Likewise, there is no reason why those 4 architectures can not just shove
> > that if (end <= start + PAGE_SIZE) check in the beginning of their
> > flush_tlb_kernel_range() and fall back on flush_tlb_kernel_page() for
> > those cases. Hiding this in generic code is definitely not the way to go.
> 
> Ok I'll change that function at arch level and I'll remove the ifdef,
> I'll call only flush_tlb_kernel_page(), but I'd like to know what is
> the opinion of the arch maintainers to do that.  (Who is the maintainer
> of H8300 arch?)
> 
No, you should call flush_tlb_kernel_range() and just fix up the
flush_tlb_kernel_range() calls to wrap in to flush_tlb_kernel_page(). As
far as the kernel is concerned, flush_tlb_kernel_page() is not a standard
interface, as it has no mention in Documentation/cachetlb.txt.
flush_tlb_page() and flush_tlb_kernel_range() on the other hand are both
standard interfaces.

H8300 is a nommu platform, so it has no TLB to flush. Yoshinori Sato is
the maintainer. Consult the MAINTAINERS file, that's what it is there for.
