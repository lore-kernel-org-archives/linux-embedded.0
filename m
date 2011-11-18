From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH RFC 3/5] kbuild/extable: Hook up sortextable into the build system.
Date: Fri, 18 Nov 2011 11:37:46 -0800
Message-ID: <1321645068-20475-4-git-send-email-ddaney.cavm@gmail.com>
References: <1321645068-20475-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
        bh=oE8YWidER0TDLf2hsyFxDQLamk46KVhqkbzL41Pj2dc=;
        b=rvY0UWrRddC5wxY02EoPqTh9ct7wHK2UGQ9ebokiSwMQOuLQlbOIIuH7vE5g8AP9ll
         ap23w0Dm3lH0M9Jp9LKzwKSowGXW6nYdKjxlP6DrZ2RQZYbI7PfudSD8olTaDeme2U9a
         +Eh2aid62nshqXKaEYy5k6HiU48IPMxLKdC1g=
In-Reply-To: <1321645068-20475-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-embedded@vger.kernel.org, x86@kernel.org
Cc: David Daney <david.daney@cavium.com>

From: David Daney <david.daney@cavium.com>

Define a config variable BUILDTIME_EXTABLE_SORT to control build time
sorting of the kernel's exception table.

Patch Makefile to do the sorting when BUILDTIME_EXTABLE_SORT is
selected.

Signed-off-by: David Daney <david.daney@cavium.com>
---
 Makefile     |   10 ++++++++++
 init/Kconfig |    3 +++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index dab8610..747074e 100644
--- a/Makefile
+++ b/Makefile
@@ -784,6 +784,10 @@ quiet_cmd_vmlinux_version = GEN     .version
 quiet_cmd_sysmap = SYSMAP
       cmd_sysmap = $(CONFIG_SHELL) $(srctree)/scripts/mksysmap
 
+# Sort exception table at build time
+quiet_cmd_sortextable = SORTEX
+      cmd_sortextable = $(objtree)/scripts/sortextable
+
 # Link of vmlinux
 # If CONFIG_KALLSYMS is set .version is already updated
 # Generate System.map and verify that the content is consistent
@@ -796,6 +800,12 @@ define rule_vmlinux__
 	$(call cmd,vmlinux__)
 	$(Q)echo 'cmd_$@ := $(cmd_vmlinux__)' > $(@D)/.$(@F).cmd
 
+	$(if $(CONFIG_BUILDTIME_EXTABLE_SORT),				\
+	$(Q)$(if $($(quiet)cmd_sortextable),				\
+	  echo '  $($(quiet)cmd_sortextable)  vmlinux' &&)		\
+	  $(cmd_sortextable)  vmlinux)
+
+
 	$(Q)$(if $($(quiet)cmd_sysmap),                                      \
 	  echo '  $($(quiet)cmd_sysmap)  System.map' &&)                     \
 	$(cmd_sysmap) $@ System.map;                                         \
diff --git a/init/Kconfig b/init/Kconfig
index 43298f9..b1bcfbd 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -27,6 +27,9 @@ config IRQ_WORK
 	bool
 	depends on HAVE_IRQ_WORK
 
+config BUILDTIME_EXTABLE_SORT
+	bool
+
 menu "General setup"
 
 config EXPERIMENTAL
-- 
1.7.2.3
