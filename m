From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: [PATCH 1/3] bzip2/lzma/gzip: pre-boot malloc doesn't return NULL
 on failure
Date: Mon, 14 Dec 2009 21:45:19 +0000
Message-ID: <4b26b1ef.hIInb2AYPMtImAJO%phillip@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, akpm@linux-foundation.org
Cc: phillip@lougher.demon.co.uk, mingo@elte.hu, albin.tonnerre@free-electrons.com


The trivial malloc implementation used in the pre-boot environment by the
decompressors returns a bad pointer on failure (falling through after
calling error).  This is doubly wrong - the callers expect malloc to
return NULL on failure, second the error function is intended to be
used by the decompressors to propagate errors to *their* callers.  The
decompressors have no access to any state set by the error function.

Signed-off-by: Phillip Lougher <phillip@lougher.demon.co.uk>
---
 include/linux/decompress/mm.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/decompress/mm.h b/include/linux/decompress/mm.h
index 12ff8c3..5032b9a 100644
--- a/include/linux/decompress/mm.h
+++ b/include/linux/decompress/mm.h
@@ -25,7 +25,7 @@ static void *malloc(int size)
 	void *p;
 
 	if (size < 0)
-		error("Malloc error");
+		return NULL;
 	if (!malloc_ptr)
 		malloc_ptr = free_mem_ptr;
 
@@ -35,7 +35,7 @@ static void *malloc(int size)
 	malloc_ptr += size;
 
 	if (free_mem_end_ptr && malloc_ptr >= free_mem_end_ptr)
-		error("Out of memory");
+		return NULL;
 
 	malloc_count++;
 	return p;
-- 
1.6.3.3
