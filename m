From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: RE: [PATCH 0/5] cramfs refresh for embedded usage
Date: Wed, 16 Aug 2017 10:29:07 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1708161002500.17016@knanqh.ubzr>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org> <SG2PR06MB1165840F183EADFC3265D7D98A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com> <alpine.LFD.2.20.1708141322170.17016@knanqh.ubzr> <SG2PR06MB116563FCF10E2615C65080F28A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708141405390.17016@knanqh.ubzr> <SG2PR06MB1165D300028F81087B045C8A8A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com> <alpine.LFD.2.20.1708150001380.17016@knanqh.ubzr> <SG2PR06MB1165749BD3C8336AB0CD27618A8D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708160105470.17016@knanqh.ubzr> <SG2PR06MB1165E8DC60659449C24DD6B68A820@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=SW4SaBT/vUUKNW4haAukCEMA/nv1Vi9nAjPJr5/1urA=;
        b=aywqsQqByLtpYngozExAgVtLfBeQ5+TzCeqzyjdyNNBCAZFvoaebeyFFn3lRj/7kNE
         s7XzRD/aLu1qG6npuzhZv4qoOtYgZr/sNAnR7XY1BEa5coSEjuI9Lu2Qmlou/2C6PzJZ
         waEOeYSsZAtjHHMUhuwQv3pbstrNnMjk10Dlk=
In-Reply-To: <SG2PR06MB1165E8DC60659449C24DD6B68A820@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, 16 Aug 2017, Chris Brandt wrote:

> On Wednesday, August 16, 2017, Nicolas Pitre wrote:
> > > Yes, now I can boot with my rootfs being a XIP cramfs.
> > >
> > > However, like you said, libc is not XIP.
> > 
> > I think I have it working now. Probably learned more about the memory
> > management internals than I ever wanted to know. Please try the patch
> > below on top of all the previous ones. If it works for you as well then
> > I'll rebase and repost the whole thing.
> > 
> > diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> > index 4c7f01fcd2..0b651f985c 100644
> > --- a/fs/cramfs/inode.c
> > +++ b/fs/cramfs/inode.c
> 
> 
> Yes, that worked. Very nice!

Good.

> Just FYI,
> I'm running an xipImage with all the RZ/A1 upstream drivers enabled and 
> only using about 4.5MB of total system RAM.
> That's pretty good. Of course for a real application, you would trim off
> the drivers and subsystems you don't plan on using, thus lowering your
> RAM usage.

On my MMU-less test target I'm going under the 1MB mark now.

> > +/*
> > + * It is possible for cramfs_physmem_mmap() to partially populate the mapping
> > + * causing page faults in the unmapped area. When that happens, we need to
> > + * split the vma so that the unmapped area gets its own vma that can be backed
> > + * with actual memory pages and loaded normally. This is necessary because
> > + * remap_pfn_range() overwrites vma->vm_pgoff with the pfn and filemap_fault()
> > + * no longer works with it. Furthermore this makes /proc/x/maps right.
> > + * Q: is there a way to do split vma at mmap() time?
> > + */
> 
> So if I understand correctly, the issue is that sometimes you only have 
> a partial PAGE worth that you need to map. Correct?

Yes, or the page is stored in its compressed form in the filesystem, or 
it is misaligned, or any combination of those.

> For the AXFS file system, XIP page mapping was done on a per page 
> decision, not per file. So the mkfs.axfs tool would only mark a page as XIP if
> the entire section would fit in a complete PAGE. If for example you had
> a partial page at the end of a multi page code segment, it would put 
> that partial page in a separate portion of the AXFS image and be marked as
> 'copy to RAM' instead of being marked as 'map as XIP'.
> So in the AXFS case, it was a combination of the creation tool and file 
> system driver features to fix the partial page issue.
> Not sure if any of this info is relevant, but I thought I would mention 
> anyway.

Same applies here.  The XIP decision is no longer a per file thing. This 
is why mkcramfs puts loadable and read-only ELF segments into 
uncompressed and aligned blocks while still packing the remaining of the 
file. The partial page issue can be "fixed" within mkcramfs if 
considered worth it. To incure the page alignment overhead only once, 
all the uncompressed blocks can be located together away from their file 
block tables, etc.  The extended format implemented in this seris allows 
for all this layout flexibility the fs creation tool may exploit.

The current restriction in the fs driver at the moment is that XIP 
blocks must be contiguous in the filesystem. That is a hard requirement 
in the non-mmu case anyway.

Given that I also applied the device table patch to mkcramfs (that 
allows for the creation of device nodes and arbitrary 
user/group/permission without being root) it would be possible to extend 
this mechanism to implement other XIP patterns such as for 
uncompressible media files for example.

> Thank you for your efforts on adding XIP to cramfs!

Thank you for testing.


Nicolas
