From: Tim Bird <tim.bird@am.sony.com>
Subject: [PATCH]  Add better resolution to initcall_debug timings
Date: Fri, 12 Sep 2008 12:51:45 -0700
Message-ID: <48CAC851.4020408@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded <linux-embedded@vger.kernel.org>
Cc: linux kernel <linux-kernel@vger.kernel.org>

Change the time resolution for initcall_debug to microseconds,
from milliseconds.  This is handy to determine which
initcalls you want to work on for faster booting.

One one of my test machines, over 90% of the initcalls are
less than a millisecond and (without this patch) these are
all reported as 0 msecs.  Working on the 900 us ones is more
important than the 4 us ones.

With 'quiet' on the kernel command line, this adds no significant
overhead to kernel boot time.

Signed-off-by: Tim Bird <tim.bird@am.sony.com>
---
 init/main.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/init/main.c b/init/main.c
index bdc8be0..f441cad 100644
--- a/init/main.c
+++ b/init/main.c
@@ -719,8 +719,8 @@ int do_one_initcall(initcall_t fn)
 		delta = ktime_sub(t1, t0);

 		print_fn_descriptor_symbol("initcall %s", fn);
-		printk(" returned %d after %Ld msecs\n", result,
-			(unsigned long long) delta.tv64 >> 20);
+		printk(" returned %d after %Ld usecs\n", result,
+			(unsigned long long) delta.tv64 >> 10);
 	}

 	msgbuf[0] = 0;
-- 
1.5.6
