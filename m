From: Jared Hulbert <jaredeh@gmail.com>
Subject: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Wed, 20 Aug 2008 22:44:36 -0700
Message-ID: <48AD00C4.6060302@gmail.com>
Reply-To: jaredeh@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:reply-to
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=tlts+ZS2u4GMaZGMnM0blmCZUpHUCDY3ye/dfiNpm6k=;
        b=H1nufmT70e3LzFORInShBwTCygaZdVvmfsu1vD6jCUPeSbzKB6ChpFoMYUH2tw8v9N
         WBrLsjDvFh6Tuwj2b4PHhSFfcGsLQnPO8MkmzFFqGfEyxpGkEczJAiVM5bun0KEnTcPL
         x1GOK0jJw2P+EbBQbtnaLCmokaX0oVvRmrQp4=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM, cotte@d

I'd like to get a first round of review on my AXFS filesystem.  This is a simple
read only compressed filesystem like Squashfs and cramfs.  AXFS is special
because it also allows for execute-in-place of your applications.  It is a major
improvement over the cramfs XIP patches that have been floating around for ages.
The biggest improvement is in the way AXFS allows for each page to be XIP or
not.  First, a user collects information about which pages are accessed on a
compressed image for each mmap()ed region from /proc/axfs/volume0.  That
'profile' is used as an input to the image builder.  The resulting image has
only the relevant pages uncompressed and XIP.  The result is smaller memory
sizes and faster launches.
                            

See http://axfs.sourceforge.net for more info.


fs/Kconfig                |   21 +
fs/Makefile               |    1 
fs/axfs/Makefile          |    7 
fs/axfs/axfs_bdev.c       |  158 ++++++++
fs/axfs/axfs_inode.c      |  490 ++++++++++++++++++++++++++
fs/axfs/axfs_mtd.c        |  233 ++++++++++++
fs/axfs/axfs_profiling.c  |  594 +++++++++++++++++++++++++++++++
fs/axfs/axfs_super.c      |  866 ++++++++++++++++++++++++++++++++++++++++++++++
fs/axfs/axfs_uml.c        |   47 ++
fs/axfs/axfs_uncompress.c |   97 +++++
include/linux/axfs.h      |  358 +++++++++++++++++++
11 files changed, 2872 insertions(+)

