From: root <root@lougher.demon.co.uk>
Subject: [PATCH 8/9] Squashfs: select DECOMPRESS_LZMA_NEEDED when including support for lzma
Date: Mon, 07 Dec 2009 08:25:54 +0000
Message-ID: <E1NHYuo-00028p-Ik@dylan.lougher.demon.co.uk>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934785AbZLGItc@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, phillip.lougher@gmail.com, tim.bird@am.sony.com


Signed-off-by: Phillip Lougher <phillip@lougher.demon.co.uk>
---
 fs/squashfs/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/squashfs/Kconfig b/fs/squashfs/Kconfig
index 0294aa2..7ec5d7e 100644
--- a/fs/squashfs/Kconfig
+++ b/fs/squashfs/Kconfig
@@ -30,6 +30,7 @@ config SQUASHFS_LZMA
 	bool "Include support for LZMA compressed file systems"
 	depends on SQUASHFS
 	select DECOMPRESS_LZMA
+	select DECOMPRESS_LZMA_NEEDED
 
 config SQUASHFS_EMBEDDED
 
-- 
1.6.3.3
