From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: Kernel crashing and log buffers...
Date: Thu, 11 Jun 2009 10:53:03 -0700
Message-ID: <20090611175303.GA10058@cuplxvomd02.corp.sa.net>
References: <200906102126.40410.rgetz@blackfin.uclinux.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200906102126.40410.rgetz@blackfin.uclinux.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=14622; t=1244742783; x=1245606783;
	c=relaxed/simple; s=sjdkim2002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20Kernel=20crashing=20and=20log=20buffers
	...
	|Sender:=20;
	bh=+l4C91BQrybT1sLV8ZfTZcaoW1AQRj0vmKANSG0fsnE=;
	b=Ph76yNvNckabPOedPMDDgKDDAm6GpRUg0PP9Lkj0eihf9a47++mVRACJXV
	ZvXTKUDrJoorexX6BmPOG4kOTWq05q6DNbSIkfebnjDUPcqXpUx4pwv9thwO
	tA+RqAZGOA;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robin Getz <rgetz@blackfin.uclinux.org>
Cc: Mike Frysinger <vapier@gentoo.org>, Greg Ungerer <gerg@snapgear.com>, Russell King <rmk@arm.linux.org.uk>, Paul Mundt <lethal@linux-sh.org>, Tim Bird <tim.bird@am.sony.com>, Wolfgang Denk <wd@denx.de>, Grant Erickson <gerickson@nuovations.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Wed, Jun 10, 2009 at 09:26:40PM -0400, Robin Getz wrote:
> On 17 Oct 2007, after much discussion and debate, Mike added add two new 
> functions for reading the kernel log buffer (from kernel space).
> 
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=0b15d04af3dd996035d8fa81fc849d049171f9c3
> 
> The intention was for them to be used by recovery/dump/debug code so the 
> kernel log can be easily retrieved/parsed by the bootloader (or another 
> kernel) in a crash scenario.
> 
> I was going to push the arch specific recovery/dump/debug code that uses them 
> upstream (yeah, it has been a little while - but anyway...) it was removed 
> since then by Roel Kluin ...
> 
> 21 Oct 2008:
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=acff181d3574244e651913df77332e897b88bff4
> 
> Before I ask Andrew to add it back, I thought I would make sure it was still a 
> useful function, and did everything everyone wanted - and wasn't deemed 
> unnecessary by a feature/function that I wasn't aware of - like the next 
> thing...
> 
> I saw the patch Grant sent recently - Add Alternative Log Buffer Support for 
> printk Messages (in Nov2008 to the embedded list, and Jan 2009 to lkml) - but 
> I couldn't find any followups - and it doesn't seem to be in Linus's tree.
> 
> http://thread.gmane.org/gmane.linux.kernel.embedded/1358/focus=1373
> 
> http://lkml.org/lkml/2009/1/21/250
> 
> I can see the desire on Wolfgang & Grant's part - for not needing the copy 
> from/to - (you never have to worry about crashing "nicely" - the kernel 
> panics, but you still need to copy memory around - potentially causing all 
> kinds of secondary issues - and masking the real reason the crash occurred).
> 
> But for the majority of the case - the copy from/to would work much better 
> than what we have in mainstream today...
> 
> 
> I would be interested in Paul and Russell - how have you solved this issue? 
> (Or do your kernel's never crash? :)

Our kernel does crash, so we have to do this. I had submitted a patch a
while ago that tweaks emit_log_char, but this was bounced, reasonably,
because it would be interferring with the great majority of people who
are not interested in capturing log output. The suggestion was made that
we do this with a console driver. I've recently got a version working, as
a module, but I've only started testing of the version integrated into the
kernel tree.  Still, post early, post often, so I've appended a version
of the patch here to see if this seems to be the right direction.

Regardless whether my particular patch seems like the right way to do this,
we do need to solve this problem for the embedded world. It is one of the
few areas where we have needs not shared by the rest of the kernel community.

> -Robin
------------------------------------ CUT HERE --------------------------------
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

Signed-off-by: David VomLehn <dvomlehn@cisco.com>
---
 drivers/char/Kconfig       |   14 +++
 drivers/char/Makefile      |    2 +
 drivers/char/conslogger.c  |  233 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/conslogger.h |   52 ++++++++++
 4 files changed, 301 insertions(+), 0 deletions(-)

diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 735bbe2..882ee57 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -684,6 +684,20 @@ config HVCS
 	  which will also be compiled when this driver is built as a
 	  module.
 
+config CONSLOGGER
+	tristate "Pseudo-console for capturing console output"
+	depends on PRINTK
+	default n
+	help
+	  This contains a pseudo-console to record and divert kernel console
+	  output, which is probably of most used to embedded systems. When
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
index 9caf5b5..ca62934 100644
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
index 0000000..ad44dc8
--- /dev/null
+++ b/drivers/char/conslogger.c
@@ -0,0 +1,233 @@
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
+	barrier();
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
+	barrier();
+}
+
+/**
+ * conslog_last - extract the last @n lines from recorded data
+ * @conslog:	Pointer to the &struct consolog from which to extract lines
+ * @nlines:	Number of lines to extract
+ * @report:	Function to report lines
+ *
+ * It is best to call this with recording disabled, though this is not
+ * enforced. See conslog_record().
+ */
+void conslog_last(struct conslog *conslog, unsigned nlines,
+	void (*report)(const char *p, unsigned cnt))
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
+		report(conslog->buf + BUF_IDX(conslog, start), i - start);
+		i++;			/* Skip the newline */
+	}
+}
+
diff --git a/include/linux/conslogger.h b/include/linux/conslogger.h
new file mode 100644
index 0000000..77bcb90
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
+extern void conslog_last(struct conslog *conslog, unsigned nlines,
+	void (*report)(const char *p, unsigned cnt));
+#endif
