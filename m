From: Iulia Manda <iulia.manda21@gmail.com>
Subject: [PATCH 2/3] linux: Add macros that define and declare a core_param variable
Date: Wed,  1 Apr 2015 17:34:52 +0300
Message-ID: <1427898893-8257-2-git-send-email-iulia.manda21@gmail.com>
References: <1427898893-8257-1-git-send-email-iulia.manda21@gmail.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DYL2YUeuBm768sZnEJH797QIWGNWLBBK/+A9L5nyDws=;
        b=iKvxQP3Lr5upEtiPfL8MlR8RpEuAsvLWlARVsrP02A5rKDmwEl82k5JkTJAWogLcTk
         IAeF4pVRH8pcPYq1O9NQUCpgPcc3wVwbzagB579RzcRIdzbkdOrIB+em/BZw7Rhi6Udg
         xn8A2OiyYvKNUtWyX+sS4W+osCZ6E9VPJGIx6DC/pTNwQuvUAf/CGAR3sz9iHJtNNXM0
         kEN6N9hZKDcOYp8eRjuv6LZj0/uW31GIZfAWKLREmJeTTtxh8KxHKgLfhqTA7HuDvgm5
         6JUfDbMuaMVib8SI1bu7/UEgdzBXpJ9NSyjDnT6Llb9yg4miUygW161+ZburN6bDeAeQ
         Rd4g==
In-Reply-To: <1427898893-8257-1-git-send-email-iulia.manda21@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: josh@joshtriplett.org
Cc: linux-embedded@vger.kernel.org, tim.bird@sonymobile.com, paulmck@linux.vnet.ibm.com, dvhart@linux.intel.com, peterz@infradead.org, mihai.caraman@freescale.com

This patch introduces two macros for kernel command line arguments subsequently
defined as core parameters:
* DECLARE_CORE_PARAM - declares an extern variable in case CMDLINE_PARSE is
set. In the other case it will make the variable a static constant asigned with
a default value to enable constant folding;
* DEFINE_CORE_PARAM - defines a core_param variable if CMDLINE_PARSE is set. In
the other case it leaves the definition to be handled by DECLARE_CORE_PARAM
macro.

Introducing a new header file for the declaration of kernel parameters seemed
to be the best option, because it solves the circular includes problem. Any
other proposal that would be fit for this case is welcomed.

Signed-off-by: Iulia Manda <iulia.manda21@gmail.com>
Reviewed-by: Josh Triplett <josh@joshtriplett.org>
---
 include/linux/moduleparam.h |  9 +++++++++
 include/linux/params.h      | 12 ++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 include/linux/params.h

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index f97397c..17efa97 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -310,6 +310,15 @@ static inline void __kernel_param_unlock(void)
 #define core_param(name, var, type, perm)				\
 	param_check_##type(name, &(var));				\
 	__module_param_call("", name, &param_ops_##type, &var, perm, -1, 0)
+
+#ifdef CONFIG_CMDLINE_PARSE
+#define DEFINE_CORE_PARAM(name, var, val, type, perm)			\
+        type var = val;                                                 \
+        core_param(name, var, type, perm)
+#else
+#define DEFINE_CORE_PARAM(name, var, val, type, perm)
+#endif
+
 #endif /* !MODULE */
 
 /**
diff --git a/include/linux/params.h b/include/linux/params.h
new file mode 100644
index 0000000..c1ee6ff
--- /dev/null
+++ b/include/linux/params.h
@@ -0,0 +1,12 @@
+#ifndef _LINUX_PARAMS_H
+#define _LINUX_PARAMS_H
+
+#ifdef CONFIG_CMDLINE_PARSE
+#define DECLARE_CORE_PARAM(var, val, type)                              \
+        extern type var
+#else
+#define DECLARE_CORE_PARAM(var, val, type)                              \
+        static const type var = val
+#endif
+
+#endif /* _LINUX_PARAMS_H */
-- 
1.9.1
