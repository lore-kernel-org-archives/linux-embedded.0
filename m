Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF904052D1
	for <linux-embedded@vger.kernel.org>; Tue, 13 Oct 2026 09:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883990; cv=none; b=mTaJEkdOQ5146B5DmivTWYMxQQr9pFecMKO3LYS7XK00vC9ckLDeTPATFm3TnMwlcedIAV7z+JPGcDjGe/MsCsZQflgDnUtBut/xg5ZoIPdGlqJNdsKfgWFIkahoGcCwETwgmwHDStu8BTAvL7TQ6l7xwbhEQcgENfGidrdWixs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883990; c=relaxed/simple;
	bh=XXCAheqEwWEeNXTk2daG4fV+KXtS4FyM/T+IAPa7GmE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HshjEI6UVFv0g31DiwODVJj6iPBBxXFwAv5QmhdpNbcm7zsw3b9Cx/F7kqH5i5I0ZhKh5BfM6SAtfJfvaevm4yQJ08yIQcYODK4Xnz0OEEFbXcUtLVKCby+N4la9DYA51eeZqGsQ74OXFRoDA7+xSCwUv2x9ScU3oTpOrpvsQWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcZd1h3l; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcZd1h3l"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b03f23305so2298456f8f.1
        for <linux-embedded@vger.kernel.org>; Tue, 13 Oct 2026 02:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883983; x=1792488783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SnEkf+SshAJve0553z+hLZ8mY5sSHw5Ad0IiJvmX3q0=;
        b=CcZd1h3lVFQd+meUKFFn4V679jpUAQeDvPsMEZVdOdJLPK4kIj8g9iLAseVaVK4qgp
         zbqRxxApNTUfZIYLxESROJf8GQ5/OiucAy6cvtHIkD6xcVfnWDVPVaNEC63dh+iJxkMC
         gz3vYWqBT6AI3yEVCeuFkA2avZ5AqfuyHSDrt8kOmrcFFAQ2UtGy72RbAHy1EA4mFvFC
         OTKSNuooX6pzw8hExVIO1ZSR6gMHGIjSRoO2+SmFS1HXPqmdXuJlZp/53VFSaxs+tqnE
         6JSgVG1LDFUurAWnYL9KH1P7yEFeZyzc0LMTiJEyigEaJ04uCNOFrwrs13SFUzuPkDJg
         51rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883983; x=1792488783;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnEkf+SshAJve0553z+hLZ8mY5sSHw5Ad0IiJvmX3q0=;
        b=XrbBMOx9tJbtfgnpjZtNnWC1zkHpJkoTFauqgPtH3pl88YPi/frPaPb3RkabIl9F35
         41eKs9BkawKLSkB3PfE97GQnKEi6k9uGjRwNasi9FvUc0IHH53ocojnchTGWChxG+i8L
         12ZleRfKD/75M/wzAMMv2oB9rNbQPcPSkNDK821uv6W9LfNiqpl06nqzYAgX5paUGMIN
         SSHNTMOXn9Talvr4QKOOmaHgvhRc9bUkUuf9gAzq7DUomhqMtZ2aDrO/iV4rQnB0jf/+
         hZFmcsZBddNrE3UgGLfzOKf7vXMyCXKGZXP8fAqfjySdjBiQ48+rozyeWwR/clU+jUp6
         YpFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwe4yz+YJY6psh/9AB4Sc7wZCGHSq/rpFvuD/ay9k1g45Act3zRVcZMVc7xsjStwIhM0463juVlPEzd24OrQg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIWuB4Kjrz1R0UdZi4DXqXo6IsVwfFS3zZ9PXGlEJX8eeXKZHy5
	PAWJepDWHDmPpQOKCCwMQg2xw9bhQl3uMabL7YIsMJtj4MHd6Wv3yc9K
X-Gm-Gg: AYBFou19USd1bo0oy1AV5sGBEJdEYKrqnrll0FDk3ZgjVZLsgLjEUTQo85KLa2ehTJm
	nExPwVjuLBBNzMmfRXK84A4x22QvF+3M3iYbU2mCqk8WbnqfwJkFJX5Kl0OI+flUJUkFwEDCLPk
	SBYbdN7+hCS/XXAYNxgEOusSwKSHicOmg030kBMovoDrcN7Q6mkqhwaeXUFZD2gXLPcIuau1uhL
	AORJAxZWPq9daIFEGvGWkYlAQH1QzFjAxTzUC563NQ0ptlQzhfNeVatCHbb0GIuw3H5sp+RnpDI
	CcStCWMPORa83fgKcdCz31eQZhcMoCgxwDqSJ3pr1oCpO6c3gbtUWhzHljei48RiXAKF3ZJE2tT
	HJbZrMgV0ZU3OAuUca5QvLtYzWlTIM+x9WuilCPligoxZA69Ut44fXccdv3O/78UxLwaZwAltpj
	s1Vjr8ATyrRTIfwBHo/5OqaxI+tdDsLywgZJi805VM7U3yaMDbiBpQNLu3/aLurlbPO9iLpDD5j
	v+RuFjMgegOcVQB7VnHtKmA
X-Received: by 2002:a5d:5f84:0:b0:48b:86:5563 with SMTP id ffacd0b85a97d-48dbaae6f0bmr22382083f8f.27.1791883982560;
        Tue, 13 Oct 2026 02:33:02 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm3986774f8f.48.2026.10.13.02.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:33:02 -0700 (PDT)
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
	Jonathan Corbet <corbet@lwn.net>
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
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/13] dt-bindings: display: add a boot logo node under /chosen
Date: Tue, 13 Oct 2026 11:32:36 +0200
Message-Id: <20261013093243.505776-7-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261013093243.505776-1-maximpedraza@gmail.com>
References: <20261013093243.505776-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Products built on the same board often differ only in branding. On UEFI
systems the firmware hands the operating system its boot logo through
the ACPI BGRT; a device tree system has no such table, so today the logo
is built into the kernel, and each product needs its own kernel image.
With U-Boot's Falcon mode the device tree is the only thing that reaches
the kernel, so it is also the only place the logo can come from.

Add a "boot-logo" node under /chosen. The node lives there because a
logo is configuration handed over by firmware rather than a description
of the hardware, as simple-framebuffer nodes already are.

The image is a BMP with 24 bits per pixel and no compression, the
format of the BGRT image, so that one file serves the firmware splash,
a BMP loaded as firmware and this node alike. It is carried either in
an "image" property, which dtc fills in from the file with /incbin/, or
in a reserved memory region the bootloader loaded it into, named by
"memory-region". Exactly one of the two must be present.

"logo-position" takes -1 on an axis to mean centre on that axis, which
is the only way to say it when the device tree does not know the image
size, and "logo-offset" is added afterwards. "rotation" counts degrees
counter clockwise, as for panels, and turns the image rather than the
screen, so position and offset stay in screen pixels. The optional
"background-color" goes with the image, since a logo designed for one
background looks wrong on another.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 .../bindings/display/boot-logo.yaml           | 151 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/boot-logo.yaml

diff --git a/Documentation/devicetree/bindings/display/boot-logo.yaml b/Documentation/devicetree/bindings/display/boot-logo.yaml
new file mode 100644
index 000000000000..bf4121f24f1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/boot-logo.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/boot-logo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Boot logo supplied by the device tree
+
+maintainers:
+  - Francesco Valla <francesco@valla.it>
+  - Màxim Pedraza Padilla <maximpedraza@gmail.com>
+
+description: |
+  An image for the operating system to show on the display while it boots,
+  handed over by the firmware together with where and how to show it.
+
+  Products built on the same board often differ only in branding. Carrying
+  the logo in the device tree lets a single kernel image serve all of them,
+  each booting with its own device tree, and it works where the device tree
+  is the only thing that reaches the kernel, as with U-Boot's Falcon mode.
+  It plays the part the ACPI BGRT plays on UEFI systems.
+
+  Since a logo is configuration rather than a description of the hardware,
+  the node lives under /chosen, next to the other things firmware hands to
+  the operating system.
+
+  The image is a BMP file with a 40 byte BITMAPINFOHEADER, 24 bits per pixel
+  and no compression, the format of the BGRT image. It is carried either in
+  the node itself or in a reserved memory region the bootloader loaded it
+  into, never both.
+
+properties:
+  $nodename:
+    const: logo
+
+  compatible:
+    const: boot-logo
+
+  image:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      The BMP file itself, byte for byte, which dtc can fill in from the file
+      with /incbin/. The device tree stays in memory for as long as the
+      system runs, so this is meant for small images; larger ones belong in
+      a reserved memory region.
+
+  memory-region:
+    maxItems: 1
+    description: |
+      Reserved memory region the bootloader loaded the BMP file into, starting
+      at the beginning of the region. The BMP header says how much of the
+      region is image.
+
+      This keeps the image out of the device tree, so that it can be changed
+      without rebuilding the device tree, for instance by loading it from a
+      partition of its own that userspace can update.
+
+      Memory keeps its contents across a reset, and may even across a short
+      power cycle, and the operating system cannot tell a stale image from a
+      fresh one. A bootloader that loads no image into the region therefore
+      disables the node (status = "disabled") or removes it.
+
+  logo-position:
+    $ref: /schemas/types.yaml#/definitions/int32-array
+    description:
+      X and Y coordinates, in screen pixels, of the top left corner of the
+      image once it has been rotated. A value of -1 on an axis centres the
+      image on that axis instead, which is the only way to say it when the
+      device tree does not know the image size, as with a memory region.
+      Defaults to centring on both axes.
+    items:
+      - description: X coordinate, or -1 to centre horizontally
+        minimum: -1
+        maximum: 65535
+      - description: Y coordinate, or -1 to centre vertically
+        minimum: -1
+        maximum: 65535
+
+  logo-offset:
+    $ref: /schemas/types.yaml#/definitions/int32-array
+    description:
+      X and Y displacement, in screen pixels, applied after the image has been
+      placed. Mostly useful together with a centred axis, to land the image
+      somewhere other than the middle of a panel whose visible area is not
+      the middle of the mode.
+    items:
+      - description: X displacement
+        minimum: -65535
+        maximum: 65535
+      - description: Y displacement
+        minimum: -65535
+        maximum: 65535
+
+  rotation:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Rotation applied to the image before it is shown, in degrees counter
+      clockwise, as for the rotation property of panels. It turns the image
+      and not the screen, so a quarter turn swaps how much room the image
+      takes up, but logo-position and logo-offset stay in screen pixels
+      either way.
+    enum: [0, 90, 180, 270]
+    default: 0
+
+  background-color:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Colour of the rest of the screen, as 0xRRGGBB. When absent, the
+      operating system uses its own default.
+    maximum: 0xffffff
+
+required:
+  - compatible
+
+# The image lives either in the node or in a reserved memory region,
+# never both and never neither.
+oneOf:
+  - required:
+      - image
+  - required:
+      - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    // A 2x1 image, red and blue, centred and 120 pixels below the middle
+    / {
+        compatible = "foo";
+        model = "foo";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        chosen {
+            logo {
+                compatible = "boot-logo";
+                /* Normally: image = /incbin/("logo.bmp"); */
+                image = /bits/ 8 <0x42 0x4d 0x3e 0x00 0x00 0x00 0x00 0x00
+                                  0x00 0x00 0x36 0x00 0x00 0x00 0x28 0x00
+                                  0x00 0x00 0x02 0x00 0x00 0x00 0x01 0x00
+                                  0x00 0x00 0x01 0x00 0x18 0x00 0x00 0x00
+                                  0x00 0x00 0x08 0x00 0x00 0x00 0x13 0x0b
+                                  0x00 0x00 0x13 0x0b 0x00 0x00 0x00 0x00
+                                  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+                                  0xff 0xff 0x00 0x00 0x00 0x00>;
+                logo-position = <(-1) (-1)>;
+                logo-offset = <0 120>;
+                background-color = <0x1e1e28>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 321ecb9f5b5b..0d1decaedde0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9174,6 +9174,7 @@ M:	Màxim Pedraza Padilla <maximpedraza@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/boot-logo.yaml
 F:	drivers/gpu/drm/clients/drm_splash.c
 
 DRM TTM SUBSYSTEM
-- 
2.39.5

