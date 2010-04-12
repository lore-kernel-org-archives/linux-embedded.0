From: David VomLehn <dvomlehn@cisco.com>
Subject: [PATCH] Pseudo-console for capture and redirection of console
	output
Date: Sun, 11 Apr 2010 23:35:45 -0700
Message-ID: <20100412063545.GA28646@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: to@dvomlehn-lnx2.corp.sa.net, "linux-embedded@vger.kernel.org"@cisco.com
Cc: akpm@linux-foundation.org, dwm2@infradead.org, linux-embedded@vger.kernel.org, mpm@selenic.com, paul.gortmaker@windriver.com

Provide functions for capturing console output for storage. The primary user
is likely to be embedded systems that don't have the storage for core dumps
but do have a need to log kernel panic information for later evaluation. It
offers two main areas of functionality:

o	It can maintain a circular log of console output so that kernel log
	messages written before panic() was called can be retrieved to be
	added to the failure log.
o	A function can be registered to store output from printk() in a
	persistent location, such as a reserved location in RAM.  Then,
	printk() can be used either directly, to print state information, or
	indirectly, through standard functions like dump_stack() and
	show_regs().

During normal operation, we use the circular logging. When we crash, almost
the first thing we do is to switch to storing output. This goes in a memory
buffer that is preserved over reboots. We then write a detailed crash
report using printk() and functions that use printk(). We retrieve the last
n lines of the log before the crash and print it, so that gets captured
in the log, too.

NOTE: This is not checkpatch-clean because checkpatch doesn't know that the
printk facility level is passed into this function.

Signed-off-by: David VomLehn <dvomlehn@cisco.com>
---
 drivers/char/Kconfig       |   14 +++
 drivers/char/Makefile      |    2 +
 drivers/char/conslogger.c  |  249 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/conslogger.h |   52 +++++++++
 4 files changed, 317 insertions(+), 0 deletions(-)

diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 3141dd3..b0ec4e1 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -692,6 +692,20 @@ config HVCS
 	  which will also be compiled when this driver is built as a
 	  module.
 
+config CONSLOGGER
+	tristate "Pseudo-console for capturing console output"
+	depends on PRINTK
+	default m
+	help
+	  This contains a pseudo-console to record and divert kernel console
+	  output, which is probably of most use to embedded systems. When
+	  a system crashes, it can divert printk output for logging information
+	  about the failure in some persistent location. Then the output from
+	  any function that uses printk() to display information, such as
+	  dump_stack() can be stored in the failure log. It also stores
+	  console output in a circular buffer so that that last <n> messages
+	  can be added to the failure log.
+
 config IBM_BSR
 	tristate "IBM POWER Barrier Synchronization Register support"
 	depends on PPC_PSERIES
diff --git a/drivers/char/Makefile b/drivers/char/Makefile
index f957edf..e293399 100644
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@ -111,6 +111,8 @@ obj-$(CONFIG_PS3_FLASH)		+= ps3flash.o
 obj-$(CONFIG_JS_RTC)		+= js-rtc.o
 js-rtc-y = rtc.o
 
+obj-$(CONFIG_CONSLOGGER)	+= conslogger.o
+
 # Files generated that shall be removed upon make clean
 clean-files := consolemap_deftbl.c defkeymap.c
 
diff --git a/drivers/char/conslogger.c b/drivers/char/conslogger.c
new file mode 100644
index 0000000..d795d82
--- /dev/null
+++ b/drivers/char/conslogger.c
@@ -0,0 +1,249 @@
+/*
+ *				conslogger.c
+ *
+ * Console log diversion
+ *
+ * Copyright (C) 2005-2009 Scientific-Atlanta, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Author:       David VomLehn
+ *
+ * This offers two functionalities. One is to continually record output from
+ * printk in a buffer for retrieval of history, while the second is to call
+ * a registered function so that printk output can be stored.
+ */
+
+#include <linux/kernel.h>
+#include <linux/console.h>
+#include <linux/gfp.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/compiler.h>		/* For barrier() */
+#include <linux/conslogger.h>
+
+/* Return a value for indexing into the conslog array */
+#define BUF_IDX(conslog, idx)	((idx) & (conslog)->mask)
+
+static void conslog_write(struct console *c, const char *p, unsigned n);
+
+/**
+ * conslog_register - create and register a logging console
+ * @order:	Power of two of the log buffer size
+ *
+ * Returns an ERR_VALUE on error or a pointer to a &struct conslog on success.
+ */
+struct conslog *conslog_register(unsigned order)
+{
+	struct conslog *conslog;
+
+	conslog = kmalloc(sizeof(*conslog), GFP_KERNEL);
+
+	if (conslog == NULL)
+		conslog = ERR_PTR(-ENOMEM);
+
+	else {
+		size_t	size;
+		char	*buf;
+
+		memset(conslog, 0, sizeof(*conslog));
+		size = 1 << order;
+		buf = kmalloc(size, GFP_KERNEL);
+
+		if (buf == NULL) {
+			kfree(conslog);
+			conslog = ERR_PTR(-ENOMEM);
+		}
+
+		else {
+			conslog->size = size;
+			conslog->buf = buf;
+			conslog->mask = conslog->size - 1;
+			conslog->state = CONSLOG_DISABLE;
+
+			/* Initialize the console part of the structure */
+			conslog->console.data = conslog;
+
+			strlcpy(conslog->console.name, "console_logger",
+				sizeof(conslog->console.name));
+			conslog->console.write = conslog_write;
+			conslog->console.flags = CON_ENABLED;
+			conslog->console.index = -1;
+			register_console(&conslog->console);
+		}
+	}
+
+	return conslog;
+}
+EXPORT_SYMBOL(conslog_register);
+
+/**
+ * conslog_unregister - Unregister a console logger
+ * @conslog:	Value returned by conslog_register
+ */
+int conslog_unregister(struct conslog *conslog)
+{
+	int	ret;
+
+	ret = unregister_console(&conslog->console);
+
+	if (conslog->buf != NULL)
+		kfree(conslog->buf);
+
+	return ret;
+}
+EXPORT_SYMBOL(conslog_unregister);
+
+/**
+ * conslog_record - enable or disable storage of console to circular buffer
+ * @conslog:	Pointer to &struct conslog returned by conslog_register()
+ * @record:	True if data should be stored in the circular buffer, false
+ *		to disable data storage.
+ */
+void conslog_record(struct conslog *conslog, bool record)
+{
+	conslog->state = record ? CONSLOG_RECORD : CONSLOG_DISABLE;
+}
+EXPORT_SYMBOL(conslog_record);
+
+/**
+ * conslog_divert - define a function to call with console output
+ * @conslog:	Pointer to &struct conslog returned by conslog_register()
+ * @divert:	Pointer to the function to call
+ */
+void conslog_divert(struct conslog *conslog,
+	void (*divert)(const char *p, size_t n))
+{
+	conslog->divert = divert;
+	conslog->state = CONSLOG_DIVERT;
+}
+EXPORT_SYMBOL(conslog_divert);
+
+/**
+ * conslog_write - console write function
+ * @c:	Pointer to the &console structure
+ * @p:	Pointer to data to write
+ * @n:	Number of bytes to write
+ *
+ * Called with console write data, which it either stores in the buffer,
+ * passes to the diversion function, or just ignores.
+ */
+static void conslog_write(struct console *c, const char *p, unsigned n)
+{
+	struct conslog *conslog;
+	static bool busy;
+
+	if (busy)
+		return;
+
+	busy = true;
+	conslog = c->data;
+
+	switch (conslog->state) {
+	case CONSLOG_RECORD:
+		while (n-- != 0) {
+			conslog->buf[BUF_IDX(conslog, conslog->idx)] = *p++;
+			conslog->idx++;
+			if (unlikely(conslog->idx == conslog->size))
+				conslog->wrapped = true;
+		}
+		break;
+
+	case CONSLOG_DIVERT:
+		conslog->divert(p, n);
+		break;
+
+	case CONSLOG_DISABLE:
+		break;
+	}
+	busy = false;
+}
+
+/**
+ * conslog_print - print the last @n lines from recorded data
+ * @conslog:	Pointer to the &struct consolog from which to extract lines
+ * @nlines:	Number of lines to extract
+ * @leader:	String to print before each line. This should include the
+ *		printk priority.
+ *
+ * It is best to call this with recording disabled, though this is not
+ * enforced. See conslog_record().
+ */
+void conslog_print(struct conslog *conslog, unsigned nlines, const char *leader)
+{
+	unsigned	i;
+	unsigned	newest;
+	unsigned	oldest;
+	unsigned	n;
+
+	if (nlines == 0)
+		return;
+
+	oldest = conslog->wrapped ? conslog->idx - conslog->size : 0;
+
+	/* Set newest to be the index of the character most recently added to
+	 * the buffer, but if the most recent line ends with a newline, skip
+	 * the newline. This makes things work correctly even if the last
+	 * line was incomplete. */
+	newest = conslog->idx - 1;
+	if (newest != oldest && conslog->buf[BUF_IDX(conslog, newest)] == '\n')
+		newest--;
+
+	/* Scan backwards for the requested number of lines */
+	for (i = newest, n = 0; n != nlines && i != oldest; i--) {
+		if (conslog->buf[BUF_IDX(conslog, i)] == '\n')
+			n++;
+	}
+
+	/* We may be part-way through a line, in which case we need to scan
+	 * forward until we find a newline. Then we skip that newline. */
+	while (i != newest && conslog->buf[BUF_IDX(conslog, i)] != '\n')
+		i++;
+	i++;
+
+	/* We have n lines, let's print them */
+	for (; n != 0; n--) {
+		size_t	start;
+		size_t	idx_i, idx_start;
+
+		start = i;
+
+		/* Search until we find the end of the line or we reach the
+		 * end of data. */
+		while (i != newest && conslog->buf[BUF_IDX(conslog, i)] != '\n')
+			i++;
+
+		/* If we stopped because i equaled newest, we need to increment
+		 * once more to get the correct end. */
+		if (i == newest)
+			i++;
+
+		/* The line may have been broken into two pieces, one starting
+		 * at end of the buffer and finishing at the beginning. We need
+		 * to detect and handle this correctly */
+		idx_i = BUF_IDX(conslog, i);
+		idx_start = BUF_IDX(conslog, start);
+
+		if (idx_i < idx_start)
+			printk("%s%.*s%.*s\n", leader,
+				conslog->size - idx_start,
+				conslog->buf + idx_start, idx_i, conslog->buf);
+		else
+			printk("%s%.*s\n", leader, i - start,
+				conslog->buf + idx_start);
+		i++;			/* Skip the newline */
+	}
+}
+EXPORT_SYMBOL(conslog_print);
diff --git a/include/linux/conslogger.h b/include/linux/conslogger.h
new file mode 100644
index 0000000..aa1b0df
--- /dev/null
+++ b/include/linux/conslogger.h
@@ -0,0 +1,52 @@
+/*
+ *				conslog.h
+ *
+ * Definitions for using the console diverter
+ *
+ * Copyright (C) 2005-2009 Scientific-Atlanta, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Author:       David VomLehn
+ */
+
+#ifndef _INCLUDE_LINUX_CONSLOG_H_
+#define _INCLUDE_LINUX_CONSLOG_H_
+#include <linux/console.h>
+#include <linux/err.h>
+
+enum conslog_state {
+	CONSLOG_DISABLE, CONSLOG_RECORD, CONSLOG_DIVERT
+};
+
+struct conslog {
+	enum conslog_state state;
+	char		*buf;
+	unsigned	idx;
+	bool		wrapped;
+	size_t		mask;
+	size_t		size;
+	void		(*divert)(const char *p, size_t n);
+	struct console	console;
+};
+
+extern struct conslog *conslog_register(unsigned order);
+extern int conslog_unregister(struct conslog *conslog);
+extern void conslog_record(struct conslog *conslog, bool record);
+extern void conslog_divert(struct conslog *conslog,
+	void (*divert)(const char *p, size_t n));
+extern void conslog_print(struct conslog *conslog, unsigned nlines,
+	const char *leader);
+#endif
