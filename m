From: Janne Karhunen <janne.karhunen@gmail.com>
Subject: Re: [PATCH] init: make init failures more explicit
Date: Fri, 18 Oct 2013 12:31:43 +0300
Message-ID: <CAE=NcraZ2pQa0tT2Xh1jXDrebUexhpAf5W4cxrv3e2YyD8Ot-w@mail.gmail.com>
References: <1382086049-14386-1-git-send-email-michael.opdenacker@free-electrons.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=ay9rmgNmWiakHYzWsQgv+1xwiipM+hGwHFQ7O0Zg0Fg=;
        b=bbg3np8QqyLNx7NlQAON8QF7orAmSJC4IYZbx0/TuDe7+nc7RU7naUDZQpAzZ9Nr7y
         IQ7WXWUVYs5JAHEqv1c/qWJPih4RSTJjWCrf857coQFMxZDf6d/9Usl17JgEbdRO2UxQ
         viChzQkCRyI7h691yOyBSCKzGoMdQwYrqaB/dJ8ueBX9akVYA9TdmKeM0BPiT/iZBEWy
         PzARk9W+F4FU/YVNsl9R77ri5euCVGCThBiWfrW1wOywTL5RkJo8qqeQjJGAXxJ1e8/Y
         hKalOJPQTOYFQu2xusEYmv/y1Tf8o2NXXZxmueZ8KmOmOZqDXG0LrzwAv8iRuKaVsW00
         IOZg==
In-Reply-To: <1382086049-14386-1-git-send-email-michael.opdenacker@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Cc: akpm@linux-foundation.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-embedded@vger.kernel.org

On Fri, Oct 18, 2013 at 11:47 AM, Michael Opdenacker
<michael.opdenacker@free-electrons.com> wrote:

> This patch proposes to make init failures more explicit.
>
> Before this, the "No init found" message didn't help much.
> It could sometimes be misleading and actually mean
> "No *working* init found".

Heh, I was just looking at similar thing, except in my case dumping
out the execve error code would be the key (now I'm getting -ENOEXEC
back from init exec for no obvious reason). In case something like
this is getting merged I'd appreciate -errno dump as well.

diff --git a/init/main.c b/init/main.c
index 63d3e8f..56fb84a 100644
--- a/init/main.c
+++ b/init/main.c
@@ -815,6 +815,8 @@ static noinline void __init kernel_init_freeable(void);

 static int __ref kernel_init(void *unused)
 {
+       int err;
+
        kernel_init_freeable();
        /* need to finish all async __init code before freeing the memory */
        async_synchronize_full();
@@ -826,9 +828,11 @@ static int __ref kernel_init(void *unused)
        flush_delayed_fput();

        if (ramdisk_execute_command) {
-               if (!run_init_process(ramdisk_execute_command))
+               err = run_init_process(ramdisk_execute_command);
+               if (!err)
                        return 0;
-               pr_err("Failed to execute %s\n", ramdisk_execute_command);
+               pr_err("Failed to execute %s, error: %d\n",
+                       ramdisk_execute_command, err);
        }

        /*
@@ -838,10 +842,12 @@ static int __ref kernel_init(void *unused)
         * trying to recover a really broken machine.
         */
        if (execute_command) {
-               if (!run_init_process(execute_command))
+               err = run_init_process(execute_command);
+               if (!err)
                        return 0;
-               pr_err("Failed to execute %s.  Attempting defaults...\n",
-                       execute_command);
+               pr_err("Failed to execute %s, error: %d\n",
+                       execute_command, err);
+               pr_err("Attempting defaults...\n");
        }
        if (!run_init_process("/sbin/init") ||
            !run_init_process("/etc/init") ||




-- 
Janne
