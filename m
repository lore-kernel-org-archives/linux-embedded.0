From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 0/5] cramfs refresh for embedded usage
Date: Wed, 16 Aug 2017 11:08:30 +0000
Message-ID: <SG2PR06MB1165E8DC60659449C24DD6B68A820@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org>
 <SG2PR06MB1165840F183EADFC3265D7D98A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708141322170.17016@knanqh.ubzr>
 <SG2PR06MB116563FCF10E2615C65080F28A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708141405390.17016@knanqh.ubzr>
 <SG2PR06MB1165D300028F81087B045C8A8A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708150001380.17016@knanqh.ubzr>
 <SG2PR06MB1165749BD3C8336AB0CD27618A8D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708160105470.17016@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9lmfO7bDKC0VxKmS1EVyjcNXmN9Fq4uQed94ypglGXc=;
 b=pSPY3/U5p6Mocjt1OAK2fBVwJmDwq3826gXMBOVau5bBN6fJ+GpJRbjyS7vg0zKL4YibJwYuuxkp73wP5RWkeGrPnYknQgyDtXTCKTOXFTcz15qrZVvrtlV/gFTwcysidAq6y01yb/tSQxjp0STVIBCZkCq/SiP7YqOaVhUJJPg=
In-Reply-To: <alpine.LFD.2.20.1708160105470.17016@knanqh.ubzr>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wednesday, August 16, 2017, Nicolas Pitre wrote:
> > Yes, now I can boot with my rootfs being a XIP cramfs.
> >
> > However, like you said, libc is not XIP.
>=20
> I think I have it working now. Probably learned more about the memory
> management internals than I ever wanted to know. Please try the patch
> below on top of all the previous ones. If it works for you as well then
> I'll rebase and repost the whole thing.
>=20
> diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> index 4c7f01fcd2..0b651f985c 100644
> --- a/fs/cramfs/inode.c
> +++ b/fs/cramfs/inode.c


Yes, that worked. Very nice!

$ cat /proc/self/maps
00008000-000a1000 r-xp 1b005000 00:0c 18192      /bin/busybox
000a9000-000aa000 rw-p 00099000 00:0c 18192      /bin/busybox
000aa000-000ac000 rw-p 00000000 00:00 0          [heap]
b6e23000-b6efc000 r-xp 1b0bc000 00:0c 766540     /lib/libc-2.18-2013.10.so
b6efc000-b6f04000 ---p 1b195000 00:0c 766540     /lib/libc-2.18-2013.10.so
b6f04000-b6f06000 r--p 000d9000 00:0c 766540     /lib/libc-2.18-2013.10.so
b6f06000-b6f07000 rw-p 000db000 00:0c 766540     /lib/libc-2.18-2013.10.so
b6f07000-b6f0a000 rw-p 00000000 00:00 0
b6f0a000-b6f21000 r-xp 1b0a4000 00:0c 670372     /lib/ld-2.18-2013.10.so
b6f24000-b6f25000 rw-p 00000000 00:00 0
b6f26000-b6f28000 rw-p 00000000 00:00 0
b6f28000-b6f29000 r--p 00016000 00:0c 670372     /lib/ld-2.18-2013.10.so
b6f29000-b6f2a000 rw-p 00017000 00:0c 670372     /lib/ld-2.18-2013.10.so
be877000-be898000 rw-p 00000000 00:00 0          [stack]
beba9000-bebaa000 r-xp 00000000 00:00 0          [sigpage]
ffff0000-ffff1000 r-xp 00000000 00:00 0          [vectors]


Just FYI,
I'm running an xipImage with all the RZ/A1 upstream drivers enabled and=20
only using about 4.5MB of total system RAM.
That's pretty good. Of course for a real application, you would trim off
the drivers and subsystems you don't plan on using, thus lowering your
RAM usage.


> +/*
> + * It is possible for cramfs_physmem_mmap() to partially populate the
> mapping
> + * causing page faults in the unmapped area. When that happens, we need
> to
> + * split the vma so that the unmapped area gets its own vma that can be
> backed
> + * with actual memory pages and loaded normally. This is necessary
> because
> + * remap_pfn_range() overwrites vma->vm_pgoff with the pfn and
> filemap_fault()
> + * no longer works with it. Furthermore this makes /proc/x/maps right.
> + * Q: is there a way to do split vma at mmap() time?
> + */


So if I understand correctly, the issue is that sometimes you only have=20
a partial PAGE worth that you need to map. Correct?

For the AXFS file system, XIP page mapping was done on a per page=20
decision, not per file. So the mkfs.axfs tool would only mark a page as XIP=
 if
the entire section would fit in a complete PAGE. If for example you had
a partial page at the end of a multi page code segment, it would put=20
that partial page in a separate portion of the AXFS image and be marked as
'copy to RAM' instead of being marked as 'map as XIP'.
So in the AXFS case, it was a combination of the creation tool and file=20
system driver features to fix the partial page issue.
Not sure if any of this info is relevant, but I thought I would mention=20
anyway.


Thank you for your efforts on adding XIP to cramfs!


Chris

