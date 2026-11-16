Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784931;
	b=iBMxVaAB2x7/zrxM9GQ2d+wfasXE/LmLQWLn7voW4+jqAD6sbhePsdycql4bVHD9UICQ
	 SWrJeZjUZbXSxrdZzctIlJlh5ppROBDygN1ZAjKZ7HsZoiChbrzdVODcy5/7OPYrTSsKp
	 UilRjpUStAghqHMhFoE512WGuZMTpIX2Iiblj1UMS68cn2iGlAD1DlJfgd06Ii5zYz2Y2
	 +cT79W1wncQwh6XPYVvgh2fHVqzAKSGNxkv1tTIs8572P6tHa8q3JltPyi+VwJo/7mAH9
	 ap5lefFjvXRV/s6bA+Gf1J5FRmSfYbTbVGGlJEV5LLMJdLcXuvzHTLu7OseCLtIETNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cn5rUH/LqEYR2KCJXDoJWBOdHFISKEsWG/FrBt6pVFs=;
	b=zbbHZyAGCMq19XxW5j8lmg9rBT0CucHRWZdvyq5BSwNFbGsDwnalbu16OPRUPioRdPvp
	 PvKgWAk59uxXULrx/G5eGCp1FhwNpzsfZL3eqHKtbu4GiMNA8zxgvyw3Mxo+epx4yGoAk
	 Fujlqlu4cvA24RCGrN2nxt+tHlhwafYU6NLEEbBOpZEiLkwzjTojmlN/AV1FR0vFGFgnE
	 5lQSdZ8RKaAgdWZIl0VXJDvoAuZQz49VrWILpN6lBU9G4BU0NVmqhD+4LPiN0hJCS1d2Q
	 3NrsAuiL/Ckqs+r0Izt/LFidzVnKkOjxJW4LJuDh42fKdKC8GeRkQCljhr013PJiT0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G9CBdrQN;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E45606A89D
	for <linux-embedded@vger.kernel.org>; Sun, 15 Nov 2026 23:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E45606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G9CBdrQN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so17861535e9.2
        for <linux-embedded@vger.kernel.org>; Sun, 15 Nov 2026 15:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794784929; x=1795389729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cn5rUH/LqEYR2KCJXDoJWBOdHFISKEsWG/FrBt6pVFs=;
        b=G9CBdrQNtD6I+H2NERBucR46iWMKI4FXSoc9YDIaNdPVJ3GqOktErVxPKbcSkKhjXp
         DtkZyeZiK6fA1156juaVQnKhABCpoflMZ2KfLXdWWyFvC1+ik1MfkVWI0tYn+uz/vQoR
         kQsBnVGNZHTfP9IJRSamewAFEroWtddScjbyvRfDIy1nY+zxa5HZ074mHmSBtPZVEuQB
         8llVNYAC5hxB6d/w0LzooOHz+n1iUS0S8/+Y5YIePrU5Yf4vpJa+C7/taYUsH5pG8HTc
         PEf/tD6Y/iQg9SL0yTBMCd/3W93sLzU7MOVUgPQ0p97cCRjes6yWZr3h9Lzj8vVmvdcc
         bMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794784929; x=1795389729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn5rUH/LqEYR2KCJXDoJWBOdHFISKEsWG/FrBt6pVFs=;
        b=sdKu+zs9p4X0hmVRB761EZCnRcCg9BXiLB7aJ/WAIDpIAeM4H02zNlOpLuJU4jmMMh
         Jz+P69ibIWJ2PuL42FvtgKgz+5dyNvkrgeq96wfsKBcbPK6MwwntpmPhWxoycuGeVRzD
         cwBLNVm1e8gQwhjOOGw7hyZ/7BgE72vRVw7mK+nPi2YvZDg7+ZE0+2rfgcBu3bDzrFif
         Z2ZG79g7LNgFPh2B+qNwDdQqpp4PIgu5Rsl0QvLFNDTyDVfd/7oybSUBlm6rvwA69ryk
         gcUXDiwtqW6C1xOqBJgCjktWFbxoS+cpTzBLnQMjZU/nTH3D2g0/J2qtcf+LsW1U62XV
         JZ9w==
X-Forwarded-Encrypted: i=1; AL+hErGLdNxtR447OyxPV/w7ov1uEoPNybQWJygggg2uAHvuSccVx3jxRE4UuqBBkkt+RviHREfNyNqc45pUfcypJg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9+/SO6fm9Dw/OvlGU4lG6BHie1UXBG8No/L9SEE69N77Z1eL2R
	xEwzzhM7NVmkvP6tChilMX1pSuNMJhx6J3SpR+3Tzjx2eTuBvZOCvPtI
X-Gm-Gg: AYBFou3VuD6+V1PQhEy9FdH/aBHErgw52kmYYhol6TwAB+luj9Dob+8F6xfQbZFvLcn
	2KrBa9EIqrlf27G2PLmuCbxDlwF/dBo5EqwPOqNldrf1hPGMW9Y5qqsIhzIhk2tiH57BzDzkiKh
	JkM8wL2It9N4m5UmcguVnDP1WQnb6ttK/4GkBtrOQNRtI6Vf2CNT8QzSfbSIvum0Ob6+akGQa6R
	868x5IRCblCnSaAR+g7PwLeicSsrh4OPYa4c66D7xgek3xSVc80JfH/CEg6OragQcVP5gt/aFYF
	LCVxaiC38QTQcmlOhjbagVmbB1hIdEDy2TLhO1HbNaDtAZyhiKv+XU+pr0YtD4p6aFdeec+RI/4
	L/j9bOoHcict6FbXsuKQlddVEDRGbAkJIYe9RidGk0IIbbI2tOVq/R58J3V+G8bJxcNd7SGBbQW
	M5xtWT3eJjj6hVKjhTBl5fA562KlNyRIYQalok6NDoT/1trIwPaedVtO/o/0vQMHGY7lVUeLVcl
	Z4RdwMxg/myYxmuTzGQNI/z+YtGVMQBe4yEfeyRZZ+AXH7wL3OuCUG9YfMvviErR0SZp+VEepkn
	+TCuB1UHVG2J9nWQANQW44wxNw7/5A1VH5rDCDjViIs/L1k903A/aAA=
X-Received: by 2002:a05:600c:4e88:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb6f413a83mr46879065e9.24.1794784928688;
        Sun, 15 Nov 2026 15:22:08 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm127920955e9.3.2026.11.15.15.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:22:08 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	linux-efi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/6] fbdev: efifb: move the BMP headers to <video/bmp.h>
Date: Mon, 16 Nov 2026 01:21:53 +0100
Message-Id: <20261116002156.1027726-4-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261116002156.1027726-1-maximpedraza@gmail.com>
References: <20261116002156.1027726-1-maximpedraza@gmail.com>
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Post: <mailto:linux-embedded@vger.kernel.org>
List-Help: <mailto:linux-embedded+help@vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-embedded+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DRM splash client parses the same BMP headers as efifb. Rather than
keep a second copy of the structures, move them to include/video/bmp.h
with the magic number.

BMP is little endian whatever the CPU, so the header gives the fields
as __le16 and __le32, and efifb now reads them with
get_unaligned_le16() and get_unaligned_le32(). Width and height are
read signed, as the format has them. No change on the little endian
systems EFI runs on.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/video/fbdev/efifb.c | 49 ++++++++++++++-----------------------
 include/video/bmp.h         | 40 ++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 31 deletions(-)
 create mode 100644 include/video/bmp.h

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 3411be06d3e6..fd348a72f780 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -16,32 +16,13 @@
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/sysfb.h>
+#include <linux/unaligned.h>
+#include <video/bmp.h>
 #include <video/vga.h>
 #include <asm/efi.h>
 #include <drm/drm_connector.h>  /* For DRM_MODE_PANEL_ORIENTATION_* */
 #include <drm/drm_panel_quirks.h> /* For drm_get_panel_orientation_quirk */
 
-struct bmp_file_header {
-	u16 id;
-	u32 file_size;
-	u32 reserved;
-	u32 bitmap_offset;
-} __packed;
-
-struct bmp_dib_header {
-	u32 dib_header_size;
-	s32 width;
-	s32 height;
-	u16 planes;
-	u16 bpp;
-	u32 compression;
-	u32 bitmap_size;
-	u32 horz_resolution;
-	u32 vert_resolution;
-	u32 colors_used;
-	u32 colors_important;
-} __packed;
-
 static bool use_bgrt = true;
 static bool request_mem_succeeded = false;
 static u64 mem_flags = EFI_MEMORY_WC | EFI_MEMORY_UC;
@@ -145,9 +126,10 @@ static bool efifb_bgrt_sanity_check(const struct screen_info *si, u32 bmp_width)
 
 static void efifb_show_boot_graphics(struct fb_info *info, const struct screen_info *si)
 {
-	u32 bmp_width, bmp_height, bmp_pitch, dst_x, y, src_y;
+	u32 bmp_width, bmp_height, bmp_pitch, bitmap_offset, dst_x, y, src_y;
 	struct bmp_file_header *file_header;
 	struct bmp_dib_header *dib_header;
+	s32 width, height;
 	void *bgrt_image = NULL;
 	u8 *dst = info->screen_base;
 
@@ -186,20 +168,25 @@ static void efifb_show_boot_graphics(struct fb_info *info, const struct screen_i
 		goto error;
 
 	file_header = bgrt_image;
-	if (file_header->id != 0x4d42 || file_header->reserved != 0)
+	if (get_unaligned_le16(&file_header->id) != BMP_FILE_MAGIC_ID ||
+	    get_unaligned_le32(&file_header->reserved) != 0)
 		goto error;
+	bitmap_offset = get_unaligned_le32(&file_header->bitmap_offset);
 
 	dib_header = bgrt_image + sizeof(*file_header);
-	if (dib_header->dib_header_size != 40 || dib_header->width < 0 ||
-	    dib_header->planes != 1 || dib_header->bpp != 24 ||
-	    dib_header->compression != 0)
+	width = get_unaligned_le32(&dib_header->width);
+	height = get_unaligned_le32(&dib_header->height);
+	if (get_unaligned_le32(&dib_header->dib_header_size) != 40 ||
+	    width < 0 || get_unaligned_le16(&dib_header->planes) != 1 ||
+	    get_unaligned_le16(&dib_header->bpp) != 24 ||
+	    get_unaligned_le32(&dib_header->compression) != 0)
 		goto error;
 
-	bmp_width = dib_header->width;
-	bmp_height = abs(dib_header->height);
+	bmp_width = width;
+	bmp_height = abs(height);
 	bmp_pitch = round_up(3 * bmp_width, 4);
 
-	if ((file_header->bitmap_offset + bmp_pitch * bmp_height) >
+	if ((bitmap_offset + bmp_pitch * bmp_height) >
 				bgrt_image_size)
 		goto error;
 
@@ -222,12 +209,12 @@ static void efifb_show_boot_graphics(struct fb_info *info, const struct screen_i
 
 		src_y = y - bgrt_tab.image_offset_y;
 		/* Positive header height means upside down row order */
-		if (dib_header->height > 0)
+		if (height > 0)
 			src_y = (bmp_height - 1) - src_y;
 
 		memset(dst, 0, bgrt_tab.image_offset_x * 4);
 		dst_x = bgrt_tab.image_offset_x;
-		efifb_copy_bmp(bgrt_image + file_header->bitmap_offset +
+		efifb_copy_bmp(bgrt_image + bitmap_offset +
 					    src_y * bmp_pitch,
 			       (u32 *)dst + dst_x, bmp_width, si);
 		dst_x += bmp_width;
diff --git a/include/video/bmp.h b/include/video/bmp.h
new file mode 100644
index 000000000000..8e97ded98dfb
--- /dev/null
+++ b/include/video/bmp.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _VIDEO_BMP_H
+#define _VIDEO_BMP_H
+
+#include <linux/types.h>
+
+/* "BM", the first two bytes of a BMP file */
+#define BMP_FILE_MAGIC_ID 0x4d42
+
+/*
+ * The headers at the start of a BMP file. Every field is little endian,
+ * whatever the CPU, and the headers need not be aligned in memory: read them
+ * with get_unaligned_le16() and get_unaligned_le32().
+ */
+struct bmp_file_header {
+	__le16 id;
+	__le32 file_size;
+	__le32 reserved;
+	__le32 bitmap_offset;
+} __packed;
+
+/*
+ * BITMAPINFOHEADER. Width and height are signed: a negative width is
+ * invalid, and a negative height means the rows go top to bottom.
+ */
+struct bmp_dib_header {
+	__le32 dib_header_size;
+	__le32 width;
+	__le32 height;
+	__le16 planes;
+	__le16 bpp;
+	__le32 compression;
+	__le32 bitmap_size;
+	__le32 horz_resolution;
+	__le32 vert_resolution;
+	__le32 colors_used;
+	__le32 colors_important;
+} __packed;
+
+#endif /* _VIDEO_BMP_H */
-- 
2.39.5

