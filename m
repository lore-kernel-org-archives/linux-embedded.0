From: VomLehn <dvomlehn@cisco.com>
Subject: [PATCH] Wait for console to become available
Date: Tue, 14 Apr 2009 16:28:36 -0700
Message-ID: <20090414232835.GA20307@cuplxvomd02.corp.sa.net>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1926; t=1239751716; x=1240615716;
	c=relaxed/simple; s=sjdkim2002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20[PATCH]=20Wait=20for=20console=20to=20become=20
	available
	|Sender:=20;
	bh=E82uSc4OrgdHJuRZA//A6kk0iH+a8AxsCO6Wn6QKy9A=;
	b=VlglKsgXN9ZwtBVnTWyTRb1VZq/yu2GILwQpNP1zq3lp9LJ+gBpFTwqTBL
	77zXsCa40xR7Den6mhTK3DDuZhMqUaxSO8MfP/zjQNptUKfJutM5fmLhF5fv
	x5G5xVAOyh;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Embedded Mailing List <linux-embedded@vger.kernel.org>

Work to improve boot times appears to be successful enough that a race
condition has been created between the open of /dev/console in init_post
and USB serial device initialization. Embedded systems are probably the
primary users of USB serial devices, though I can certainly image blade
servers using them, as well.

This patch works for me and, though it's possible this is all that needs
to be done, I think it's likely there are some other changes required,
as well.

Signed-off-by: David VomLehn <dvomlehn@cisco>
---
 kernel/printk.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/kernel/printk.c b/kernel/printk.c
index e3602d0..39f554a 100644
--- a/kernel/printk.c
+++ b/kernel/printk.c
@@ -104,6 +104,10 @@ static unsigned log_start;	/* Index into log_buf: next char to be read by syslog
 static unsigned con_start;	/* Index into log_buf: next char to be sent to consoles */
 static unsigned log_end;	/* Index into log_buf: most-recently-written-char + 1 */
 
+/* Definitions for waiting until a console is registered */
+#define MAX_CONSOLE_WAIT	msecs_to_jiffies(2000)
+static DECLARE_WAIT_QUEUE_HEAD(console_wait);
+
 /*
  *	Array of consoles built from command line options (console=)
  */
@@ -1062,6 +1066,10 @@ struct tty_driver *console_device(int *index)
 	struct console *c;
 	struct tty_driver *driver = NULL;
 
+	/* Wait a while for a console to show up. If one doesn't show up
+	 * for too long, we'll just continue without a console. */
+	wait_event_timeout(console_wait, console_drivers, MAX_CONSOLE_WAIT);
+
 	acquire_console_sem();
 	for (c = console_drivers; c != NULL; c = c->next) {
 		if (!c->device)
@@ -1211,6 +1219,7 @@ void register_console(struct console *console)
 		spin_unlock_irqrestore(&logbuf_lock, flags);
 	}
 	release_console_sem();
+	wake_up_all(&console_wait);
 }
 EXPORT_SYMBOL(register_console);
 
