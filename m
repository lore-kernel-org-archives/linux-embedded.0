Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639941CD0C;
	Sun, 29 Dec 2024 17:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735491793; cv=pass; b=Ih/AujWOQB6fc2FnAz6gEwkh+F3yrppBu+xWr3f1TqGX8XSiKMCDz79+KEhGH6woLuzAouSPE/xFgeVaipYLXJeHl66oVpXvlfRDKcKFBR2IODua+/3dcFodQBuxep5dPoch3NSh6cYI7LuTO0sRIapFExyja8ceu1AQY9e9Mho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735491793; c=relaxed/simple;
	bh=SnG9gIwuBb8N1AnR8IbN5Atv79AKr3+ipxeVMXdcbXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QUwyVV2PvAzEpm5X1cvRaEotkZj4suYY6hcNXDaCQKRpMcdWGPzuRKWmA2BzX4tnxUyPuyW4YeIlr8/u0MFi4b03GwLn6lAlHyefo6iLlAJzQxwp5k9quvH7hWpywWsK7UugOM5ET+rPrPjiRGZQsAAtsf+lrtFMEtQr0poNTN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=BCJxo7q4; arc=pass smtp.client-ip=185.56.87.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="BCJxo7q4"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-kfn0.prod.antispam.mailspamprotection.com; s=arckey; t=1735491790;
	 b=k8op+O/o8A7v27HBJvg04FQH99oF5uWYtVEcPFdQ27kMizsmfpWenc7M87yg/trZjJO1WXPeln
	  wQDN4Cx5t5zF3fEz+sepeC52C+rhDRrA9T0P7VydAu82m24vPN1KADZSoV55gBQCJSfBeZ8ryH
	  qC/VaGjbGMManRvUvLVU7YQaqn37anJr8L246zP6lER4CiLwJ+tgEM8O4Mtg0wr7Pfl9+9qOvN
	  o+mqRsU0ngbSGoqvqKW2KaVOSHOLl5tt9iu4TfFp7FgWqlLgjkWT9kLihWd8lGC41B2ktA833m
	  IdHWhPYOk72Ir6XlyQbvtnGV/xxe/S71w52JIxEFpJsbBA==;
ARC-Authentication-Results: i=1; instance-europe-west4-kfn0.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-kfn0.prod.antispam.mailspamprotection.com; s=arckey; t=1735491790;
	bh=SnG9gIwuBb8N1AnR8IbN5Atv79AKr3+ipxeVMXdcbXU=;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	  DKIM-Signature;
	b=OjUsPw6k/p17AVBqWvx0Yi+QvxlAxpBcUwGBDsPPJaPvkzoH9ITCzGr7zFfsHThQDd6P9zc5UT
	  kjkxo2aiH6R7fBulEDM7mJI0B3mLJeh9Z+9GciKHPSskPFv8NYz+wQcpOsi0Vp+PF4D9TEksNX
	  MMAvy6mFQfkG8LECFwcEqB5hlCiltHfvegHB4Tu6LsJ6pErPT9VwAYhRj+owfnC+DCXwh4d7gH
	  vFuRt5cOi0NzHtxUhUxFNpnE0Kx8LSVhft4PXfDjqqQNrsSJH1kwbSBl/eMo7ftktsQiF0Orna
	  /6pyEPaeUeb1H/2323cZMA/ks8qgTvnR2NTMqRlyimXUOQ==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-kfn0.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tRwAy-00000001ntY-3d2d;
	Sun, 29 Dec 2024 16:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=so1IiFnXdJxivviY5LBDlBSNPk+TBTX+iD4UEf61ERs=; b=BCJxo7q4z78E81mvAcA8IOwukC
	vx16t4Ad5Wfalo90YzpKVdeAXW3bVZQ7VE9oTgYhZKyx1CqXx+ecRwauL50igGJCntToCS5QXMk+H
	p7aDzQq+9xeETltVaLoP8ikJsMN28/xsbOlvmGmpxXeSK+tJNf4wwjFVZdL/rrt6gOGw=;
Received: from [87.11.41.26] (port=65168 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tRwAs-00000000Gzn-0Fyw;
	Sun, 29 Dec 2024 16:29:56 +0000
From: Francesco Valla <francesco@valla.it>
To: linux-kernel@vger.kernel.org
Cc: linux-embedded@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Tim Bird <Tim.Bird@sony.com>
Subject: [PATCH] init/main.c: print initcall level when initcall_debug is used
Date: Sun, 29 Dec 2024 17:29:01 +0100
Message-ID: <20241229162901.126411-1-francesco@valla.it>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 19e0eb74ba57cb83310c4216f29eaf06
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-kfn0.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

When initcall_debug is specified on the command line, the start and
return point for each initcall is printed. However, no information on
the initcall level is reported.

Add to the initcall_debug infrastructure an additional print that
informs when a new initcall level is entered. This is particularly
useful when debugging dependency chains and/or working on boot time
reduction.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 init/main.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/init/main.c b/init/main.c
index 00fac1170294..160c93332536 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1223,6 +1223,12 @@ trace_initcall_finish_cb(void *data, initcall_t fn, int ret)
 		 fn, ret, (unsigned long long)ktime_us_delta(rettime, *calltime));
 }
 
+static __init_or_module void
+trace_initcall_level_cb(void *data, const char *level)
+{
+	printk(KERN_DEBUG "entering %s initcall level\n", level);
+}
+
 static ktime_t initcall_calltime;
 
 #ifdef TRACEPOINTS_ENABLED
@@ -1234,10 +1240,12 @@ static void __init initcall_debug_enable(void)
 					    &initcall_calltime);
 	ret |= register_trace_initcall_finish(trace_initcall_finish_cb,
 					      &initcall_calltime);
+	ret |= register_trace_initcall_level(trace_initcall_level_cb, NULL);
 	WARN(ret, "Failed to register initcall tracepoints\n");
 }
 # define do_trace_initcall_start	trace_initcall_start
 # define do_trace_initcall_finish	trace_initcall_finish
+# define do_trace_initcall_level	trace_initcall_level
 #else
 static inline void do_trace_initcall_start(initcall_t fn)
 {
@@ -1251,6 +1259,12 @@ static inline void do_trace_initcall_finish(initcall_t fn, int ret)
 		return;
 	trace_initcall_finish_cb(&initcall_calltime, fn, ret);
 }
+static inline void do_trace_initcall_level(const char *level)
+{
+	if (!initcall_debug)
+		return;
+	trace_initcall_level_cb(NULL, level);
+}
 #endif /* !TRACEPOINTS_ENABLED */
 
 int __init_or_module do_one_initcall(initcall_t fn)
@@ -1323,7 +1337,7 @@ static void __init do_initcall_level(int level, char *command_line)
 		   level, level,
 		   NULL, ignore_unknown_bootoption);
 
-	trace_initcall_level(initcall_level_names[level]);
+	do_trace_initcall_level(initcall_level_names[level]);
 	for (fn = initcall_levels[level]; fn < initcall_levels[level+1]; fn++)
 		do_one_initcall(initcall_from_entry(fn));
 }
@@ -1367,7 +1381,7 @@ static void __init do_pre_smp_initcalls(void)
 {
 	initcall_entry_t *fn;
 
-	trace_initcall_level("early");
+	do_trace_initcall_level("early");
 	for (fn = __initcall_start; fn < __initcall0_start; fn++)
 		do_one_initcall(initcall_from_entry(fn));
 }
-- 
2.47.1

