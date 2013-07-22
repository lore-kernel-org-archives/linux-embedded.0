From: Phillip Lougher <phillip.lougher@gmail.com>
Subject: Re: [PATCH 0/2] Squashfs: add LZ4 compression
Date: Mon, 22 Jul 2013 06:07:52 +0100
Message-ID: <CAB3wodewRSGwKt_mKP7e-HpA=b7hCUedBsAcasFxWC5ZPJ5btg@mail.gmail.com>
References: <1374459663-15363-1-git-send-email-phillip@squashfs.org.uk>
	<51ECA17A.3060401@cn.fujitsu.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=FPllbLbcDEDnzkZnsRZKcu4gBHE33P0d95eYFaV7lJY=;
        b=Z95O892tMmmYjS7U3TP/E6qEnQmKpzUxOT9fYC9apJv52P+OOh3OKf7mj1KPc9NaNL
         c5c+HXwNlFUDA9KeG5PAT4PFycBTSwR2e8ZPyY9BchwS9rOOAc/LcYvejCOp3TT5BrRQ
         GKLXF7JbjxpAD5qcG9AzO7RZ+q1xyeUAQGV2cQrShPGEvZltXjm0rKjF/Kt5i1wcgBeD
         BJfxwCd4B+Pz9vpb1Et6MnyrkEwOzdfBwpZwFcVtSLnf/9dKSDxQQ21z7xk4d6o9PPbE
         hso15lO/E/SbgOrgK71IPgNj8TzIJO5Icq5zoPM0h7faiZvBkCptjjmfhw6P8sf73nwW
         cQkQ==
In-Reply-To: <51ECA17A.3060401@cn.fujitsu.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gu Zheng <guz.fnst@cn.fujitsu.com>
Cc: Phillip Lougher <phillip@squashfs.org.uk>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org

On 22 July 2013 04:05, Gu Zheng <guz.fnst@cn.fujitsu.com> wrote:
> Hi Phillip,
>         Have some tests been carried out to confirm that Squashfs really
> can get benefit from LZ4 compression, comparing with lzo?

This seems to be a loaded question, in that it seems to be trying to
reopen the "why add lz4 when we already have lzo" debate all over
again.  As LZ4 has been merged to mainline, this appears to be a
question that has already been answered.

As far as Squashfs is concerned,  I believe it is important to give
people the choice of using LZ4 to compress Squashfs filesystems now
its been mainlined.  As far as expected benefits are concerned,
Squashfs' use in embedded systems is very similar to compressing
kernels and initramfs data, in that it tends to be used to compress
root filesystems.  As such the benefits of using LZ4 in Squashfs
should be broadly similar to using LZ4 to compress kernels and
initramfs data.  Ultimately it is up to people to experiment and
choose whatever compression is best for their systems.

People are welcome to try the patches out and report their findings.

Phillip

>
> Thanks,
> Gu
>
> On 07/22/2013 10:21 AM, Phillip Lougher wrote:
>
>> Hi
>>
>> Now that LZ4 compression support is in 3.11-rc1, I have written the
>> following two patches for Squashfs to use it.
>>
>> Phillip Lougher (2):
>>   Squashfs: add LZ4 compression support
>>   Squashfs: Add LZ4 compression configuration option
>>
>>  Documentation/filesystems/squashfs.txt |    8 +-
>>  fs/squashfs/Kconfig                    |   15 +++
>>  fs/squashfs/Makefile                   |    1 +
>>  fs/squashfs/decompressor.c             |    7 ++
>>  fs/squashfs/decompressor.h             |    4 +
>>  fs/squashfs/lz4_wrapper.c              |  163 ++++++++++++++++++++++++++++++++
>>  fs/squashfs/squashfs_fs.h              |    1 +
>>  7 files changed, 195 insertions(+), 4 deletions(-)
>>  create mode 100644 fs/squashfs/lz4_wrapper.c
>>
>> These patches are also available in the git tree here:
>>
>> browse: https://git.kernel.org/cgit/linux/kernel/git/pkl/squashfs-lz4.git
>> git clone: git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-lz4.git
>>
>> LZ4 support has (obviously) also been added to the squashfs-tools
>> (Mksquashfs and Unsquashfs).  This is available from the Squashfs-tools
>> git repository here:
>>
>> browse: https://git.kernel.org/cgit/fs/squashfs/squashfs-tools.git
>> git clone: git://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
>>
>> When building the squashfs-tools edit the Makefile to enable LZ4
>> support (by default it is disabled).
>>
>> LZ4 compression can be specified by using the -comp option, e.g.
>> % mksquashfs xxx img.sqsh -comp lz4
>>
>> The use of LZ4 high compression can be specified using -Xhc, e.g.
>>
>> % mksquashfs xxx img.sqsh -comp lz4 -Xhc
>>
>> Phillip
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> Please read the FAQ at  http://www.tux.org/lkml/
>>
>
>
