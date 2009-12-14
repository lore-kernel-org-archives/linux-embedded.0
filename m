From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: [PATCH 0/3] bzip2/lzma/gzip/initramfs: NULL pointer bugs and
 missing error checks
Date: Mon, 14 Dec 2009 21:45:19 +0000
Message-ID: <4b26b1ef.4UsgG1v4tcHL5wwS%phillip@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758381AbZLNVsJ@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, akpm@linux-foundation.org
Cc: phillip@lougher.demon.co.uk, mingo@elte.hu, albin.tonnerre@free-electrons.com

Hi, 

The following patches fix up a number of NULL pointer bugs amd missing
error checks.

Thanks

Phillip

  bzip2/lzma/gzip: pre-boot malloc doesn't return NULL on failure
  bzip2: Add missing checks for malloc returning NULL
  initramfs: add missing decompressor error check

---
 include/linux/decompress/mm.h |    4 ++--
 init/initramfs.c              |   10 ++++++----
 lib/decompress_bunzip2.c      |   10 +++++++++-
 3 files changed, 17 insertions(+), 7 deletions(-)
