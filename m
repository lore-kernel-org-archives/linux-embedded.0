From: Iulia Manda <iulia.manda21@gmail.com>
Subject: [PATCH 1/3] kernel: Add a new config option to remove command line parsing
Date: Wed,  1 Apr 2015 17:34:51 +0300
Message-ID: <1427898893-8257-1-git-send-email-iulia.manda21@gmail.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=BVQfuMo63xV8weo4gcbtqK7b3+T9xvX4NqAf4JVi5H8=;
        b=py6SP2UY8QScOiQyF33axE9H4b4LPxv0UARrItyuCjT+82dATop1VEmyfKIf6l2QJf
         Lxb7byoNrjy+U2dv13HDV+FSju11dUJsaiNGgnDiEAcs0OJuHFj0LD7LNxXs4f86zIGB
         FRATKWxiTqtm/5PpeKbvFJguB/hlQzWON5klZDAAPbPGQX//7lbhKqEdBo1ROSnuVTnm
         9ywPSu9jT15zB2EYujg51FKgJhdE8jFfl9/FVgcqXNxp6cbu37dUPoG5+Rx0s1nTXPCz
         zsvb1d2omOiRW2RnBrx8XDh5U+cfTGrDFNRRg9gyrMdn2BZsd0DtbVEQtZ12rQXaqZdb
         AQgw==
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: josh@joshtriplett.org
Cc: linux-embedded@vger.kernel.org, tim.bird@sonymobile.com, paulmck@linux.vnet.ibm.com, dvhart@linux.intel.com, peterz@infradead.org, mihai.caraman@freescale.com

This patch introduces CONFIG_CMDLINE_PARSE option which conditionally compiles
the support for parsing kernel command line arguments. The corresponding
functions that actually do the parsing will be compiled out. 

This is used when no parameters will be specified neither at compile time nor at
boot time.

Bloat-o-meter output (compared to the preivous version in which builtin cmdline
was also set to 'Y'):

add/remove: 0/8 grow/shrink: 0/6 up/down: 0/-3669 (-3669)
function                                     old     new   delta
load_module                                 5571    5563      -8
parse_early_param                             54      44     -10
parse_early_options                           33       5     -28
initcall_level_names                          32       -     -32
kernel_init_freeable                         413     360     -53
unknown_module_param_cb                       60       -     -60
setup_arch                                  3041    2972     -69
set_init_arg                                  73       -     -73
repair_env_string                             81       -     -81
start_kernel                                 857     759     -98
do_early_param                               117       -    -117
unknown_bootoption                           366       -    -366
parse_args                                   626       -    -626
builtin_cmdline                             2048       -   -2048

Signed-off-by: Iulia Manda <iulia.manda21@gmail.com>
Reviewed-by: Josh Triplett <josh@joshtriplett.org>
---
 arch/x86/Kconfig            | 15 +++++++++++++++
 include/linux/moduleparam.h | 14 ++++++++++++++
 kernel/params.c             |  2 ++
 3 files changed, 31 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index c2fb8a8..f1e02ea 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2003,8 +2003,23 @@ config COMPAT_VDSO
 	  If unsure, say N: if you are compiling your own kernel, you
 	  are unlikely to be using a buggy version of glibc.
 
+config CMDLINE_PARSE
+	bool "Enable support for command line parsing"
+	default y
+	---help---
+	  With this option set to 'Y', kernel parameters, both the ones
+	  passed at boot time and at compile time are parsed.
+
+	  If you say no here, all the kernel parameters' values will be set
+	  to their defaults at compile time, in order to make constant
+	  folding possible.
+
+	  Systems with no space constraints should leave this option set to
+	  'Y'.
+
 config CMDLINE_BOOL
 	bool "Built-in kernel command line"
+	depends on CMDLINE_PARSE
 	---help---
 	  Allow for specifying boot arguments to the kernel at
 	  build time.  On some systems (e.g. embedded ones), it is
diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 1c9effa..f97397c 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -350,6 +350,7 @@ extern bool parameq(const char *name1, const char *name2);
  */
 extern bool parameqn(const char *name1, const char *name2, size_t n);
 
+#ifdef CONFIG_CMDLINE_PARSE
 /* Called on module insert or kernel boot */
 extern char *parse_args(const char *name,
 		      char *args,
@@ -359,6 +360,19 @@ extern char *parse_args(const char *name,
 		      s16 level_max,
 		      int (*unknown)(char *param, char *val,
 			      const char *doing));
+#else
+static inline char *parse_args(const char *name,
+		      char *args,
+		      const struct kernel_param *params,
+		      unsigned num,
+		      s16 level_min,
+		      s16 level_max,
+		      int (*unknown)(char *param, char *val,
+			      const char *doing))
+{
+        return NULL;
+}
+#endif
 
 /* Called by module remove. */
 #ifdef CONFIG_SYSFS
diff --git a/kernel/params.c b/kernel/params.c
index 728e05b..d3bfe47 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -93,6 +93,7 @@ static void param_check_unsafe(const struct kernel_param *kp)
 	}
 }
 
+#ifdef CONFIG_CMDLINE_PARSE
 static int parse_one(char *param,
 		     char *val,
 		     const char *doing,
@@ -239,6 +240,7 @@ char *parse_args(const char *doing,
 	/* All parsed OK. */
 	return NULL;
 }
+#endif
 
 /* Lazy bastard, eh? */
 #define STANDARD_PARAM_DEF(name, type, format, strtolfn)      		\
-- 
1.9.1
