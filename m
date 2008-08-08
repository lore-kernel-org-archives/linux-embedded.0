From: David VomLehn <dvomlehn@cisco.com>
Subject: [PATCH] [RFC] emit-crash-char: Allow diversion of printk output for
 crash logging
Date: Thu, 07 Aug 2008 19:20:12 -0700
Message-ID: <489BAD5C.2080009@cisco.com>
Reply-To: dvomlehn@cisco.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=5589; t=1218162017; x=1219026017;
	c=relaxed/simple; s=rtpdkim2001;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20[PATCH]=20[RFC]=20emit-crash-char=3A=20Allow=20
	diversion=20of=20printk=20output=20for=0A=20crash=20logging
	|Sender:=20
	|To:=20linux-embedded@vger.kernel.org;
	bh=r8Il7vuEhk3AozSXvcAAxKs9NtcXHmGpqQ5GUmU3u3Y=;
	b=cp6KWsUIFPV+k77siA7QHzzH+MJ5zwfDJP35wLeDeZSbO+IHpeg5LEgZ15
	Yxh0OQgvqq0oxCSVpWNl4M6KUZccG6FJGgN9EGHlZms8KoHwrZwwPgNbueOU
	Dm0Mx5OnZ0;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org

Allow diversion of characters generated through printk so that they can
be logged separately. The printk_time variables is made externally visible
so that functions processing the diverted characters can parse off the
time added if CONFIG_PRINTK_TIME is enabled.

Signed-off-by: David VomLehn <dvomlehn@cisco.com>
---
I apologize for the crufty disclaimer Cisco adds. It is on a long list on
things that make us awkward open source community members but things change
slowly at many large companies.

Rationale for this patch: The ability to divert characters is useful for
embedded systems when a panic occurs. It is frequently the case that there
is insufficient storage to hold a crash dump and too little, if any, upstream
network bandwith to upload a dump if one could be stored. Instead, we rely upon
the report written to the console for most of our debugging. The ability to
capture that report and either store it or send it upstream is a fundamental
part of our ability to support our systems in the lab and in the field.

 include/linux/kernel.h |    5 ++++
 kernel/printk.c        |   56 ++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index aaa998f..1848260 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -200,6 +200,8 @@ extern struct ratelimit_state printk_ratelimit_state;
 extern int printk_ratelimit(void);
 extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
 				   unsigned int interval_msec);
+extern void register_emit_crash_char(void (*fn)(char c));
+extern void unregister_emit_crash_char(void);
 #else
 static inline int vprintk(const char *s, va_list args)
 	__attribute__ ((format (printf, 1, 0)));
@@ -211,6 +213,8 @@ static inline int printk_ratelimit(void) { return 0; }
 static inline bool printk_timed_ratelimit(unsigned long *caller_jiffies, \
 					  unsigned int interval_msec)	\
 		{ return false; }
+static inline void register_emit_crash_char(void (*fn)(char c)) {}
+static inline void unregister_emit_crash_char() {}
 #endif
 
 extern void asmlinkage __attribute__((format(printf, 1, 2)))
@@ -229,6 +233,7 @@ static inline void console_verbose(void)
 		console_loglevel = 15;
 }
 
+extern int printk_time;
 extern void bust_spinlocks(int yes);
 extern void wake_up_klogd(void);
 extern int oops_in_progress;		/* If set, an oops, panic(), BUG() or die() is in progress */
diff --git a/kernel/printk.c b/kernel/printk.c
index b51b156..35a4d81 100644
--- a/kernel/printk.c
+++ b/kernel/printk.c
@@ -67,6 +67,9 @@ int console_printk[4] = {
 int oops_in_progress;
 EXPORT_SYMBOL(oops_in_progress);
 
+static void (*emit_crash_char_fn)(char c);
+static bool recursive_emit_crash_char;
+
 /*
  * console_sem protects the console_drivers list, and also
  * provides serialisation for access to the entire console
@@ -520,8 +523,35 @@ static void call_console_drivers(unsigned start, unsigned end)
 	_call_console_drivers(start_print, end, msg_level);
 }
 
+/*
+ * This emits a character intended for a crash log. We take special care
+ * to avoid recursive use so that we don't end up in an crash reporting loop.
+ */
+static void emit_crash_char(char c)
+{
+	static	bool in_call;
+
+	if (emit_crash_char_fn != NULL) {
+		/* Detect recursive calls and ignore them. This could happen
+		 * if the function we use to emit the character to the crash
+		 * log failed and called printk. Though we ignore the output,
+		 * we remember that we had a recursive call so that we can
+		 * report it later. */
+		if (in_call)
+			recursive_emit_crash_char = true;
+
+		else {
+			in_call = true;
+			emit_crash_char_fn(c);
+			in_call = false;
+		}
+	}
+}
+
 static void emit_log_char(char c)
 {
+	emit_crash_char(c);
+
 	LOG_BUF(log_end) = c;
 	log_end++;
 	if (log_end - log_start > log_buf_len)
@@ -533,6 +563,28 @@ static void emit_log_char(char c)
 }
 
 /*
+ * Register a function to emit a crash character
+ * @fn:	Function to register
+ */
+void register_emit_crash_char(void (*fn)(char c))
+{
+	emit_crash_char_fn = fn;
+}
+
+/*
+ * Unregister a function emiting a crash character
+ */
+void unregister_emit_crash_char()
+{
+	emit_crash_char_fn = NULL;
+
+	if (recursive_emit_crash_char) {
+		pr_err("emit_crash_char was called recursively!\n");
+		recursive_emit_crash_char = false;
+	}
+}
+
+/*
  * Zap console related locks when oopsing. Only zap at most once
  * every 10 seconds, to leave time for slow consoles to print a
  * full oops.
@@ -554,9 +606,9 @@ static void zap_locks(void)
 }
 
 #if defined(CONFIG_PRINTK_TIME)
-static int printk_time = 1;
+int printk_time = 1;
 #else
-static int printk_time = 0;
+int printk_time;
 #endif
 module_param_named(time, printk_time, bool, S_IRUGO | S_IWUSR);
 




     - - - - -                              Cisco                            - - - - -         
This e-mail and any attachments may contain information which is confidential, 
proprietary, privileged or otherwise protected by law. The information is solely 
intended for the named addressee (or a person responsible for delivering it to 
the addressee). If you are not the intended recipient of this message, you are 
not authorized to read, print, retain, copy or disseminate this message or any 
part of it. If you have received this e-mail in error, please notify the sender 
immediately by return e-mail and delete it from your computer.
