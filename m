From: Gu Zheng <guz.fnst@cn.fujitsu.com>
Subject: Re: [PATCH 0/2] Squashfs: add LZ4 compression
Date: Mon, 22 Jul 2013 11:05:30 +0800
Message-ID: <51ECA17A.3060401@cn.fujitsu.com>
References: <1374459663-15363-1-git-send-email-phillip@squashfs.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1374459663-15363-1-git-send-email-phillip@squashfs.org.uk>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org

Hi Phillip,
	Have some tests been carried out to confirm that Squashfs really 
can get benefit from LZ4 compression, comparing with lzo?

Thanks,
Gu

On 07/22/2013 10:21 AM, Phillip Lougher wrote:

> Hi
> 
> Now that LZ4 compression support is in 3.11-rc1, I have written the
> following two patches for Squashfs to use it.
> 
> Phillip Lougher (2):
>   Squashfs: add LZ4 compression support
>   Squashfs: Add LZ4 compression configuration option
> 
>  Documentation/filesystems/squashfs.txt |    8 +-
>  fs/squashfs/Kconfig                    |   15 +++
>  fs/squashfs/Makefile                   |    1 +
>  fs/squashfs/decompressor.c             |    7 ++
>  fs/squashfs/decompressor.h             |    4 +
>  fs/squashfs/lz4_wrapper.c              |  163 ++++++++++++++++++++++++++++++++
>  fs/squashfs/squashfs_fs.h              |    1 +
>  7 files changed, 195 insertions(+), 4 deletions(-)
>  create mode 100644 fs/squashfs/lz4_wrapper.c
> 
> These patches are also available in the git tree here:
> 
> browse: https://git.kernel.org/cgit/linux/kernel/git/pkl/squashfs-lz4.git
> git clone: git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-lz4.git
> 
> LZ4 support has (obviously) also been added to the squashfs-tools
> (Mksquashfs and Unsquashfs).  This is available from the Squashfs-tools
> git repository here:
> 
> browse: https://git.kernel.org/cgit/fs/squashfs/squashfs-tools.git
> git clone: git://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
> 
> When building the squashfs-tools edit the Makefile to enable LZ4
> support (by default it is disabled).
> 
> LZ4 compression can be specified by using the -comp option, e.g.
> % mksquashfs xxx img.sqsh -comp lz4
> 
> The use of LZ4 high compression can be specified using -Xhc, e.g.
> 
> % mksquashfs xxx img.sqsh -comp lz4 -Xhc
> 
> Phillip
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 


