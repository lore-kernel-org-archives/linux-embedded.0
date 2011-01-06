From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 00/17] pramfs: persistent and protected RAM filesystem
Date: Thu, 06 Jan 2011 13:00:46 +0100
Message-ID: <4D25AEEE.1050401@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=1E2aCTsmoraizoj4e2hFDF/n8RZFwJnJJDlRJuB3l3k=;
        b=nanR4s+Q2vn7U7VfZoTTKIqTifLeUHlfx2tRsMCzMQRMNARo+3AOJMdmMLKwsfwWGQ
         AagDXywVH5CXbGGP3JauitG9WpdLwWoxBHTKnlrYjYbjK1Vzl6sRF/H2224x4fZYsQJ9
         jkkAS/rTDHtRgZ+ksN/9RrLg2zNQ2vMc5Y+tc=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

Hi all,

after several reviews is time to submit the code for mainline. Thanks to
CELF to believe and support actively the project and thanks to Tim Bird.

Here the stats:

 Documentation/filesystems/pramfs.txt |  179 ++++++
 Documentation/filesystems/xip.txt    |    2 +
 arch/Kconfig                         |    3 +
 arch/x86/Kconfig                     |    1 +
 fs/Kconfig                           |    8 +-
 fs/Makefile                          |    1 +
 fs/pramfs/Kconfig                    |   72 +++
 fs/pramfs/Makefile                   |   14 +
 fs/pramfs/acl.c                      |  433 +++++++++++++
 fs/pramfs/acl.h                      |   86 +++
 fs/pramfs/balloc.c                   |  147 +++++
 fs/pramfs/desctree.c                 |  181 ++++++
 fs/pramfs/desctree.h                 |   44 ++
 fs/pramfs/dir.c                      |  208 +++++++
 fs/pramfs/file.c                     |  326 ++++++++++
 fs/pramfs/inode.c                    |  848 ++++++++++++++++++++++++++
 fs/pramfs/ioctl.c                    |  121 ++++
 fs/pramfs/namei.c                    |  371 ++++++++++++
 fs/pramfs/pram.h                     |  269 +++++++++
 fs/pramfs/pramfs_test.c              |   47 ++
 fs/pramfs/super.c                    |  940 +++++++++++++++++++++++++++++
 fs/pramfs/symlink.c                  |   76 +++
 fs/pramfs/wprotect.c                 |   41 ++
 fs/pramfs/wprotect.h                 |  151 +++++
 fs/pramfs/xattr.c                    | 1104 ++++++++++++++++++++++++++++++++++
 fs/pramfs/xattr.h                    |  131 ++++
 fs/pramfs/xattr_security.c           |   78 +++
 fs/pramfs/xattr_trusted.c            |   65 ++
 fs/pramfs/xattr_user.c               |   68 +++
 fs/pramfs/xip.c                      |   83 +++
 fs/pramfs/xip.h                      |   28 +
 include/linux/magic.h                |    1 +
 include/linux/pram_fs.h              |  130 ++++
 include/linux/pram_fs_sb.h           |   45 ++
 34 files changed, 6299 insertions(+), 3 deletions(-)


Marco 
