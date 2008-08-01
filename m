From: Tim Bird <tim.bird@am.sony.com>
Subject: [PATCH] embedded: fix vc_translate operator precedence
Date: Fri, 1 Aug 2008 14:05:50 -0700
Message-ID: <48937AAE.5070407@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded <linux-embedded@vger.kernel.org>
Cc: linux kernel <linux-kernel@vger.kernel.org>

This fixes a bug in operator precedence in the newly introduced vc_translate
macro.  Without this fix, the translation of some characters on the
kernel console is garbled.

This patch was copied to the e-mail list previously for testing.  Now,
all reports confirm that it works, so this is an official post for
application.

Signed-off-by: Tim Bird <tim.bird@am.sony.com>
---
 vt_kern.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/vt_kern.h b/include/linux/vt_kern.h
index 14c0e91..8c8119f 100644
--- a/include/linux/vt_kern.h
+++ b/include/linux/vt_kern.h
@@ -74,7 +74,7 @@ void con_protect_unimap(struct vc_data *vc, int rdonly);
 int con_copy_unimap(struct vc_data *dst_vc, struct vc_data *src_vc);

 #define vc_translate(vc, c) ((vc)->vc_translate[(c) |			\
-					(vc)->vc_toggle_meta ? 0x80 : 0])
+					((vc)->vc_toggle_meta ? 0x80 : 0)])
 #else
 #define con_set_trans_old(arg) (0)
 #define con_get_trans_old(arg) (-EINVAL)
