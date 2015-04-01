From: Iulia Manda <iulia.manda21@gmail.com>
Subject: [PATCH 3/3] init: Set initcall_debug to a default value
Date: Wed,  1 Apr 2015 17:34:53 +0300
Message-ID: <1427898893-8257-3-git-send-email-iulia.manda21@gmail.com>
References: <1427898893-8257-1-git-send-email-iulia.manda21@gmail.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WhphG+MCNz6U7B+IjSwhIajwL8Xq8fZfrn28L3FyizM=;
        b=S9XeZlgMrhsisNglpYM82LWSBg1sC0APesABc/ctvpROJhAwQuXoe0tZCmmgWl9vsp
         G6R9ld+/SLrr2VufmWXCpQI0Jdb6kBdkbZ5QcVUn52vTuDQRtIksMwml9xd0ZILboZZ0
         J59TawemLoCY+hRlxjzAZOIoYy+1eCuc6c+pUPb2M/iIeXoia+ZtkoTZ4o1k/b/cbLC5
         UMGf/m5KCDml14cDGEV8gXSiciExzorNcRVJCIZq9scGLteqmJu8lOcWuKf7+qZH0zoU
         cQuaEDtKF7e1xSp/7pBjPK2V/8V6TIYd957E5zxiNB2rtUkSRp8/4Me/Lb7f/1nLfDxa
         z5Gg==
In-Reply-To: <1427898893-8257-1-git-send-email-iulia.manda21@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: josh@joshtriplett.org
Cc: linux-embedded@vger.kernel.org, tim.bird@sonymobile.com, paulmck@linux.vnet.ibm.com, dvhart@linux.intel.com, peterz@infradead.org, mihai.caraman@freescale.com

Test the previously implemented macros on initcall_debug parameter, after
setting CONFIG_CMDLINE_PARSE to 'n'.

This change is a first example for how knowing the values of kernel parameters
at build time can allow GCC constant folding and result in an actually
relevant decrease in size. Other types of parameters also need to be handled.
Also, at the moment this would only work with default values. For being able
to change those defaults and still know their values at compile time, a
pre-compiled stand-alone parser should be run on those variables. This will be
discussed in a following patch.

The variable corresponding to initcall_debug kernel parameter is set by default
to false. Even though DEFINE_CORE_PARAM resumes to nothing when
CONFIG_CMDLINE_PARSE is not set, we need to use it in main.c so that it is
still defined when this option is 'y'.

Bloat-o-meter output:

add/remove: 0/3 grow/shrink: 0/9 up/down: 0/-385 (-385)
function                                     old     new   delta
initcall_debug                                 1       -      -1
pm_init                                      105     100      -5
__param_str_initcall_debug                    15       -     -15
__param_initcall_debug                        16       -     -16
syscore_suspend                              247     224     -23
syscore_resume                               175     152     -23
syscore_shutdown                              80      55     -25
pci_fixup_device                             235     198     -37
async_synchronize_cookie_domain              162     116     -46
async_run_entry_fn                           178     127     -51
device_shutdown                              256     204     -52
do_one_initcall                              339     248     -91

Signed-off-by: Iulia Manda <iulia.manda21@gmail.com>
Reviewed-by: Josh Triplett <josh@joshtriplett.org>
---
 include/linux/init.h | 3 ++-
 init/main.c          | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/init.h b/include/linux/init.h
index 2df8e8d..d53f28d 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -3,6 +3,7 @@
 
 #include <linux/compiler.h>
 #include <linux/types.h>
+#include <linux/params.h>
 
 /* These macros are used to mark some functions or 
  * initialized data (doesn't apply to uninitialized data)
@@ -155,7 +156,7 @@ int __init init_rootfs(void);
 
 extern void (*late_time_init)(void);
 
-extern bool initcall_debug;
+DECLARE_CORE_PARAM(initcall_debug, false, bool);
 
 #endif
   
diff --git a/init/main.c b/init/main.c
index 6f0f1c5f..85e9001 100644
--- a/init/main.c
+++ b/init/main.c
@@ -685,8 +685,7 @@ static void __init do_ctors(void)
 #endif
 }
 
-bool initcall_debug;
-core_param(initcall_debug, initcall_debug, bool, 0644);
+DEFINE_CORE_PARAM(initcall_debug, initcall_debug, false, bool, 0644);
 
 #ifdef CONFIG_KALLSYMS
 struct blacklist_entry {
-- 
1.9.1
