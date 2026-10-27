Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109232;
	b=F5d4Wjg9J9I6ApNEXGzM2cRSEQ67SKoku8TJyoY8OOH1bG0X7NgPwobeuYtAydLfM3Wc
	 lQGYFhycmEElTEZmeJBaWRTqkM6cJ3946VUg6+69Ecps9BGNMhYGqJoIRgFtfFSqIhxnf
	 a3d0yjbB5SPvVd9KPr2ubbN5EwwR88WaMQ7SeoSxgusK5utbCfbXg+xv4SGZr2WZ7Fb7x
	 UcBpNlC2LpXgDomYmrzoB2Yc/aMEMBSjNL5tWRYkb4Iqkq5K+teCXy4NqbJFYhpzwp8fK
	 9hBgQtrDwvGlF560RKcZCzgxY8fgxk0ON43g+hgCFwU9N9FxCFEAIdGEAgeHYi5jmaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=G1+nfUJ+NP0zqKdPIyJvkG8NMwha03wen6k4s/kDOuc=;
	b=xvNrtECo5YH3pfnNoNDpcA/V8UJLHOZCf0RHjDeNB5TnSz+K+Z4uYeF7xC0ydSC9IMMQ
	 dV/MKgsOldzJBL/8oTiFsln0tgN5A/yKOtRUhP6ritNaUPxej4nh6TYm4d8AzXRxcTr5n
	 mHwAHJBnpCsvbYswVlLWeJk+2oc9lplodWr6MbV+w7VvIBNVAS1M2e8mKoHuPOEijW/xx
	 8wQzc6I3EGutCnTP419gCCWHaixjKNEgB44Qwd97fIPpBEPKn9dhUrlhrIEnpsbMmCAvo
	 gEbIJ2PbVA8rS+0ahrk37UrKwQqUH8b22Pnn3aJ5tUON7LYN7bVKyoMEM7E9CQjH3Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2JE7Nd8;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4835D606A32D
	for <linux-embedded@vger.kernel.org>; Tue, 27 Oct 2026 13:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4835D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S2JE7Nd8
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso3034028f8f.0
        for <linux-embedded@vger.kernel.org>; Tue, 27 Oct 2026 06:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793109230; x=1793714030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1+nfUJ+NP0zqKdPIyJvkG8NMwha03wen6k4s/kDOuc=;
        b=S2JE7Nd8OTAHxoXX6BZLIyrug9lS3aM+fOmCTHlOH5CAIMWvEng6vFztONyEQONBdy
         6U0nsYeDQ35b6WSek1fAgeHdpeTYBo+D5PJK/A53gJmbPG6B2KWi4kSxAjhis7z63lHa
         VTwhOjKb0TUkye6vfPvbocaNrgfU5fOrcE9M84tEkkhZli/4vBmfKp75SaCv+h4FwTN/
         EtgzNbV7aphJrZ8dCgJJ0YE/R+1IiRFOPdV1D6GOSd7mCp7UjrZEIzeX9wntDPWIqBRW
         MCObtUrCuy1+OjRKttCmH5cUl6o9wgpDTzpxhx+fVzWDHAMjD2IUkMA1kAucOEcxqznm
         wcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109230; x=1793714030;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1+nfUJ+NP0zqKdPIyJvkG8NMwha03wen6k4s/kDOuc=;
        b=kKPUdvAtzohLKTPF+zLhnsg57Q1n0es5E0tixWiyLpIh9FXeIXQ5TozPrM9ETbn/9Z
         I6+k5SHrnK6ZFTe22kcYN8kWsHweg+sBxOdW8GRmws/Dx9cz9iipLANROX6K6ruO9sPV
         tlhr7oTpUzE8rTr9RKS/4BH6KHOxaKAmkQF9b58d6xBZiEoq9uvRk9Fu50AfIl7avOys
         mMx6a3qPdJBnfB2I8LX3g35aHNOKG5jxSIFdRPt9fAWqK+a2OccM+d6cWnyTue//7oJg
         4fDn0KkyYW/swz4RGU2qjiKk2JqevMNXyHITU4GUukmuVf0Cn9MvjZWy60ouns3nsg2o
         0+Cw==
X-Forwarded-Encrypted: i=1; AKwUvBylTiS6IktbnKp1T9LMtmSqrBws/4hCOxw9iqUS7rvDx4t4g8PYUDNa2FS2A5TDB+3bznXnT75Z9i0Xfm9MBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKhCuantpJbKmMUoeehhkA8cahH6aHRmK3ik6Uq/Oi00Vn9ljW5
	KpRT9Mb/0nV28pg3bAV+sSlv5+PAvK/irLyJpKN+FOr7tmxP5iJ/vuA4
X-Gm-Gg: AYBFou2CNhJoj2EmHXn5t5nTVKiuB4wHNg/WtDgr1vHCxP/0KfXgFdUlIAkQjJ6KlRj
	t7f4IsuS8QWb7Pf/qPdl0hJtqVS7gZ3lxBkqBMu9ekdM68U+HkO4+2CiSksFDpPslOhsIGjuzd8
	nCrr/0GZ+re7zrXQ30wNzDj3GHP1pyBOD3cLR2QswyIwfhS/wXUPAODmJgrXKDO67HcrwUoxs86
	7prPgAQ9HrtTIOB9QiCGTomLRHOwaAqnglW+O//87BteIv8TaQDmqteYQ6QfqcGxzj7LRiIrRVn
	pqzDtVIpQwRlOJiMSwlCoDghcjWLua3jW72EuysbmY5cZYbQefzmxYuahb+8IwsrXuv1v0eWUzd
	svV/vFAhz0VRBmISlgHPq2SCkPHY8HtrYOH4Z2PlmAPerFQIG/BGDH18cxE32GOnVTkxOyhMzg2
	epzwX0G7AAextPXl1fWomBSdsnPMzFXvhyrHTPaPUcZfNd/US61/eEm63Rgc9/h3XkYjuO/rQGS
	f2AvLJpeU+4cfi416vw/ayxOl7DfkJsjdNjdzTyt9IYzpKbp8Fmc2wdKwaAZ4hw9ZDBN/vFMy9t
	k9CuTio=
X-Received: by 2002:a05:6000:29d5:b0:48e:f47:273c with SMTP id ffacd0b85a97d-48e3eb45747mr11349441f8f.8.1793109229602;
        Tue, 27 Oct 2026 06:53:49 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:48 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/15] efi: bgrt: add accessors for the boot graphics
Date: Tue, 27 Oct 2026 14:53:29 +0100
Message-Id: <20261027135342.2003632-3-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261027135342.2003632-1-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
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

The DRM splash client shows the boot graphics the firmware left behind,
and needs the image address and size, its offsets and the status bits.
Reading them from bgrt_tab and bgrt_image_size works with drm_client_lib
built in, but it can be a module, and neither is exported:

  ERROR: modpost: drivers/gpu/drm/clients/drm_client_lib.ko: symbol 'bgrt_tab' undefined!
  ERROR: modpost: drivers/gpu/drm/clients/drm_client_lib.ko: symbol 'bgrt_image_size' undefined!

Rather than export the data, add an accessor for each of them, exported
GPL only, with stubs in efi-bgrt.h for CONFIG_ACPI_BGRT=n so that users
need no #ifdef of their own. The variables stay global for
drivers/acpi/bgrt.c, and are only written by efi_bgrt_init(): mark them
__ro_after_init.

The table gives the image address as a u64. efi_bgrt_has_image() only
says yes when phys_addr_t can hold it, so that it never disagrees with
efi_bgrt_image_address() on kernels with 32-bit physical addresses.

Reported-by: Mario Limonciello <mario.limonciello@amd.com>
Closes: https://lore.kernel.org/dri-devel/5d7067de-97b7-4232-9cf6-e4b978696482@amd.com/
Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/firmware/efi/efi-bgrt.c | 75 ++++++++++++++++++++++++++++++++-
 include/linux/efi-bgrt.h        | 39 ++++++++++++++++-
 2 files changed, 111 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/efi/efi-bgrt.c b/drivers/firmware/efi/efi-bgrt.c
index 1da451582812..1affe5528139 100644
--- a/drivers/firmware/efi/efi-bgrt.c
+++ b/drivers/firmware/efi/efi-bgrt.c
@@ -16,8 +16,8 @@
 #include <linux/efi.h>
 #include <linux/efi-bgrt.h>
 
-struct acpi_table_bgrt bgrt_tab;
-size_t bgrt_image_size;
+struct acpi_table_bgrt bgrt_tab __ro_after_init;
+size_t bgrt_image_size __ro_after_init;
 
 struct bmp_header {
 	u16 id;
@@ -89,3 +89,74 @@ void __init efi_bgrt_init(struct acpi_table_header *table)
 out:
 	memset(bgrt, 0, sizeof(bgrt_tab));
 }
+
+/**
+ * efi_bgrt_has_image() - Whether the firmware left a boot graphic
+ *
+ * Return: true if the BGRT points at a BMP image, which efi_bgrt_init()
+ * checked and reserved, at an address that phys_addr_t can hold.
+ */
+bool efi_bgrt_has_image(void)
+{
+	return bgrt_tab.image_address &&
+	       bgrt_tab.image_address == (phys_addr_t)bgrt_tab.image_address;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_has_image);
+
+/**
+ * efi_bgrt_image_address() - Physical address of the boot graphic
+ *
+ * Return: the address of the BMP image, or 0 if there is none.
+ */
+phys_addr_t efi_bgrt_image_address(void)
+{
+	return bgrt_tab.image_address;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_image_address);
+
+/**
+ * efi_bgrt_image_size() - Size of the boot graphic
+ *
+ * Return: the size of the BMP image, as its header gives it, or 0 if there
+ * is none.
+ */
+size_t efi_bgrt_image_size(void)
+{
+	return bgrt_image_size;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_image_size);
+
+/**
+ * efi_bgrt_status() - Status field of the BGRT
+ *
+ * Return: the status byte. Bit 0 tells whether the image is still on
+ * screen and, since ACPI 6.2, bits 1-2 how far it has to be turned to show
+ * upright (ACPI_BGRT_ORIENTATION_OFFSET).
+ */
+u8 efi_bgrt_status(void)
+{
+	return bgrt_tab.status;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_status);
+
+/**
+ * efi_bgrt_image_offset_x() - Horizontal position of the boot graphic
+ *
+ * Return: the X offset, in pixels, at which the firmware drew the image.
+ */
+u32 efi_bgrt_image_offset_x(void)
+{
+	return bgrt_tab.image_offset_x;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_image_offset_x);
+
+/**
+ * efi_bgrt_image_offset_y() - Vertical position of the boot graphic
+ *
+ * Return: the Y offset, in pixels, at which the firmware drew the image.
+ */
+u32 efi_bgrt_image_offset_y(void)
+{
+	return bgrt_tab.image_offset_y;
+}
+EXPORT_SYMBOL_GPL(efi_bgrt_image_offset_y);
diff --git a/include/linux/efi-bgrt.h b/include/linux/efi-bgrt.h
index e6cd51005633..1c287e5fd388 100644
--- a/include/linux/efi-bgrt.h
+++ b/include/linux/efi-bgrt.h
@@ -9,7 +9,14 @@
 void efi_bgrt_init(struct acpi_table_header *table);
 int __init acpi_parse_bgrt(struct acpi_table_header *table);
 
-/* The BGRT data itself; only valid if bgrt_image != NULL. */
+bool efi_bgrt_has_image(void);
+phys_addr_t efi_bgrt_image_address(void);
+size_t efi_bgrt_image_size(void);
+u8 efi_bgrt_status(void);
+u32 efi_bgrt_image_offset_x(void);
+u32 efi_bgrt_image_offset_y(void);
+
+/* The BGRT data itself; only valid if efi_bgrt_has_image(). */
 extern size_t bgrt_image_size;
 extern struct acpi_table_bgrt bgrt_tab;
 
@@ -21,6 +28,36 @@ static inline int __init acpi_parse_bgrt(struct acpi_table_header *table)
 	return 0;
 }
 
+static inline bool efi_bgrt_has_image(void)
+{
+	return false;
+}
+
+static inline phys_addr_t efi_bgrt_image_address(void)
+{
+	return 0;
+}
+
+static inline size_t efi_bgrt_image_size(void)
+{
+	return 0;
+}
+
+static inline u8 efi_bgrt_status(void)
+{
+	return 0;
+}
+
+static inline u32 efi_bgrt_image_offset_x(void)
+{
+	return 0;
+}
+
+static inline u32 efi_bgrt_image_offset_y(void)
+{
+	return 0;
+}
+
 #endif /* !CONFIG_ACPI_BGRT */
 
 #endif /* _LINUX_EFI_BGRT_H */
-- 
2.39.5

