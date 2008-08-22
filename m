From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: mkfs.axfs
Date: Fri, 22 Aug 2008 16:49:35 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0808221644540.17105@vixen.sonytel.be>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-584349381-842243557-1219416575=:17105"
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Jared Hulbert <jaredeh@gmail.com>
Cc: linux-embedded@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-842243557-1219416575=:17105
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

	Hi Jared,

When compiling mkfs.axfs from SourceForge SVN (tried ia32, amd64, ppc64), I
get:

cc -g -I./ -O0   -c -o mkfs.axfs.o mkfs.axfs.c
In file included from ./linux/axfs.h:32,
                 from mkfs.axfs.c:58:
/usr/include/linux/time.h:9: error: redefinition of ‘struct timespec’
/usr/include/linux/time.h:15: error: redefinition of ‘struct timeval’

The patch below fixes this:

diff --git a/mkfs.axfs/trunk/linux/axfs.h b/mkfs.axfs/trunk/linux/axfs.h
index 6dc7c62..60ffd70 100644
--- a/mkfs.axfs/trunk/linux/axfs.h
+++ b/mkfs.axfs/trunk/linux/axfs.h
@@ -26,9 +26,9 @@
 
 #ifdef __KERNEL__
 #include <linux/rwsem.h>
-#endif
 #include <linux/errno.h>
 #include <linux/time.h>
+#endif
 
 #define AXFS_MAGIC	0x48A0E4CD	/* some random number */
 #define AXFS_SIGNATURE	"Advanced XIP FS"

BTW, there are still lots of suspicious warnings if you compile it with -Wall.

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 · RPR Brussels
Fortis · BIC GEBABEBB · IBAN BE41293037680010
---584349381-842243557-1219416575=:17105--
