From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: [PATCH 3/3] initramfs: add missing decompressor error check
Date: Mon, 14 Dec 2009 21:45:19 +0000
Message-ID: <4b26b1ef.0+ZWxT6886olqcSc%phillip@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, akpm@linux-foundation.org
Cc: phillip@lougher.demon.co.uk, mingo@elte.hu, albin.tonnerre@free-electrons.com


The decompressors return error by calling a supplied error function, and/or
by returning an error return value.  The initramfs code, however, fails to
check the exit code returned by the decompressor, and only checks the error
status set by calling the error function.

This patch adds a return code check and calls the error function.

Signed-off-by: Phillip Lougher <phillip@lougher.demon.co.uk>
---
 init/initramfs.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 4c00edc..b37d34b 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -413,7 +413,7 @@ static unsigned my_inptr;   /* index of next byte to be processed in inbuf */
 
 static char * __init unpack_to_rootfs(char *buf, unsigned len)
 {
-	int written;
+	int written, res;
 	decompress_fn decompress;
 	const char *compress_name;
 	static __initdata char msg_buf[64];
@@ -445,10 +445,12 @@ static char * __init unpack_to_rootfs(char *buf, unsigned len)
 		}
 		this_header = 0;
 		decompress = decompress_method(buf, len, &compress_name);
-		if (decompress)
-			decompress(buf, len, NULL, flush_buffer, NULL,
+		if (decompress) {
+			res = decompress(buf, len, NULL, flush_buffer, NULL,
 				   &my_inptr, error);
-		else if (compress_name) {
+			if (res)
+				error("decompressor failed");
+		} else if (compress_name) {
 			if (!message) {
 				snprintf(msg_buf, sizeof msg_buf,
 					 "compression method %s not configured",
-- 
1.6.3.3
