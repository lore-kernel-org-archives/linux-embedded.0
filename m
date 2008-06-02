From: Tim Bird <tim.bird@am.sony.com>
Subject: [PATCH] console - Add configurable support for console charset translation
Date: Mon, 2 Jun 2008 15:37:09 -0700
Message-ID: <48447615.5050806@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

With CONSOLE_TRANSLATIONS turned off, this saves about 6K
on my kernel configured for an ARM development board (OMAP
5912 OSK).  In embedded products I'm familiar with,
console translations are not needed.

This was taken from the Linux-tiny project and updated slightly
for 2.6.25.

  drivers/char/consolemap.c |   81 ++++++++++++++++++++++++++++++++++++++++++++++
  drivers/char/vt.c         |    4 ++
  init/Kconfig              |    7 +++
  3 files changed, 92 insertions(+)

Signed-off-by: Tim Bird <tim.bird@am.sony.com>

--- a/drivers/char/consolemap.c
+++ b/drivers/char/consolemap.c
@@ -22,6 +22,8 @@
  #include <linux/consolemap.h>
  #include <linux/vt_kern.h>

+#ifdef CONFIG_CONSOLE_TRANSLATIONS
+
  static unsigned short translations[][256] = {
    /* 8-bit Latin-1 mapped to Unicode -- trivial mapping */
    {
@@ -742,3 +744,82 @@ console_map_init(void)
  }

  EXPORT_SYMBOL(con_copy_unimap);
+
+#else
+
+u16 inverse_translate(struct vc_data *conp, int glyph, int use_unicode)
+{
+	return glyph;
+}
+
+unsigned short *set_translate(int m, struct vc_data *vc)
+{
+	return NULL;
+}
+
+int con_set_trans_old(unsigned char *arg)
+{
+	return 0;
+}
+
+int con_get_trans_old(unsigned char *arg)
+{
+	return -EINVAL;
+}
+
+int con_set_trans_new(ushort *arg)
+{
+	return 0;
+}
+
+int con_get_trans_new(ushort *arg)
+{
+	return -EINVAL;
+}
+
+int con_clear_unimap(struct vc_data *vc, struct unimapinit *ui)
+{
+	return 0;
+}
+
+int con_set_unimap(struct vc_data *vc, ushort ct, struct unipair *list)
+{
+	return 0;
+}
+
+int con_set_default_unimap(struct vc_data *vc)
+{
+	return 0;
+}
+
+int con_copy_unimap(struct vc_data *d, struct vc_data *s)
+{
+	return 0;
+}
+
+int con_get_unimap(struct vc_data *vc, ushort ct, ushort *uct,
+		   struct unipair *list)
+{
+	return -EINVAL;
+}
+
+void con_free_unimap(struct vc_data *vc) { }
+
+int conv_uni_to_pc(struct vc_data *conp, long ucs)
+{
+	return ucs > 0xff ? -1: ucs;
+}
+
+void __init console_map_init(void) { }
+
+u32 conv_8bit_to_uni(unsigned char c)
+{
+	return c;
+}
+
+int conv_uni_to_8bit(u32 uni)
+{
+	return (int)uni & 0xff;
+}
+
+#endif
--- a/drivers/char/vt.c
+++ b/drivers/char/vt.c
@@ -2198,7 +2198,11 @@ rescan_last_byte:
  			c = 0xfffd;
  		    tc = c;
  		} else {	/* no utf or alternate charset mode */
+#ifdef CONFIG_CONSOLE_TRANSLATIONS
  		    tc = vc->vc_translate[vc->vc_toggle_meta ? (c | 0x80) : c];
+#else
+		    tc = c;
+#endif
  		}

                  /* If the original code was a control character we
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -758,6 +758,13 @@ config PROC_PAGE_MONITOR
  	  /proc/kpagecount, and /proc/kpageflags. Disabling these
            interfaces will reduce the size of the kernel by approximately 4kb.

+config CONSOLE_TRANSLATIONS
+	default y
+	bool "Enable character translations in console" if EMBEDDED
+	help
+	  This enables support for font mapping and Unicode translation
+          on virtual consoles.
+
  endmenu		# General setup

  config SLABINFO

