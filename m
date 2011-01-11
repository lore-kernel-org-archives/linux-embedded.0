From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 00/17] pramfs: persistent and protected RAM filesystem
Date: Tue, 11 Jan 2011 20:01:38 +0100
Message-ID: <4D2CA912.5070308@gmail.com>
References: <4D25AEEE.1050401@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=Rx1H/99MwTkWtuYrJ2Gh5b6oRxpOp+AH+yWQxfLga80=;
        b=IPL+zIO0ov6hh6AcSV9LiwE+TSkU9nuPaCuFdug6SjPwmzkW0+zKuYqeN1yNSySwUJ
         pb8iQBWu9z0EWS05iw8LqY/Aw7gJV9nK7Kh7J7L2OFboB9iMrr2yaZg4AxWxnsxM79C+
         xvWGE8s5GJRZilq7kf4cx1RHwED2n525Tgo+A=
In-Reply-To: <4D25AEEE.1050401@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sfr@canb.auug.org.au, Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org, mpm@selenic.com
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

Hi all,

On 06/01/2011 13:00, Marco Stornelli wrote:
> Hi all,
> 
> after several reviews is time to submit the code for mainline. Thanks to
> CELF to believe and support actively the project and thanks to Tim Bird.
> 
> Here the stats:
> 
>  Documentation/filesystems/pramfs.txt |  179 ++++++
>  Documentation/filesystems/xip.txt    |    2 +
>  arch/Kconfig                         |    3 +
>  arch/x86/Kconfig                     |    1 +
>  fs/Kconfig                           |    8 +-
>  fs/Makefile                          |    1 +
>  fs/pramfs/Kconfig                    |   72 +++
>  fs/pramfs/Makefile                   |   14 +
>  fs/pramfs/acl.c                      |  433 +++++++++++++
>  fs/pramfs/acl.h                      |   86 +++
>  fs/pramfs/balloc.c                   |  147 +++++
>  fs/pramfs/desctree.c                 |  181 ++++++
>  fs/pramfs/desctree.h                 |   44 ++
>  fs/pramfs/dir.c                      |  208 +++++++
>  fs/pramfs/file.c                     |  326 ++++++++++
>  fs/pramfs/inode.c                    |  848 ++++++++++++++++++++++++++
>  fs/pramfs/ioctl.c                    |  121 ++++
>  fs/pramfs/namei.c                    |  371 ++++++++++++
>  fs/pramfs/pram.h                     |  269 +++++++++
>  fs/pramfs/pramfs_test.c              |   47 ++
>  fs/pramfs/super.c                    |  940 +++++++++++++++++++++++++++++
>  fs/pramfs/symlink.c                  |   76 +++
>  fs/pramfs/wprotect.c                 |   41 ++
>  fs/pramfs/wprotect.h                 |  151 +++++
>  fs/pramfs/xattr.c                    | 1104 ++++++++++++++++++++++++++++++++++
>  fs/pramfs/xattr.h                    |  131 ++++
>  fs/pramfs/xattr_security.c           |   78 +++
>  fs/pramfs/xattr_trusted.c            |   65 ++
>  fs/pramfs/xattr_user.c               |   68 +++
>  fs/pramfs/xip.c                      |   83 +++
>  fs/pramfs/xip.h                      |   28 +
>  include/linux/magic.h                |    1 +
>  include/linux/pram_fs.h              |  130 ++++
>  include/linux/pram_fs_sb.h           |   45 ++
>  34 files changed, 6299 insertions(+), 3 deletions(-)
> 

Can I have a feedback to insert this fs in the linux-next? From this
latest review I received some comments about how to fix some fs problems
on-the-fly without to clean all and restart. My next step will be to
write a simple fsck.pram to allow to fix these situations. However I
think the kernel code it's mature to be inserted in a pre-mainline
container. If I'll receive a positive feedback to my question, I'll
repost the patches to the last version (I updated the fs to be RCU aware
according to the work of Nick).

Marco
