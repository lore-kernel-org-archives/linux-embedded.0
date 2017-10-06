From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v5 2/5] cramfs: make cramfs_physmem usable as root fs
Date: Thu,  5 Oct 2017 22:45:28 -0400
Message-ID: <20171006024531.8885-3-nicolas.pitre@linaro.org>
References: <20171006024531.8885-1-nicolas.pitre@linaro.org>
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=sasl; bh=pul/
	bqJBGIDrZnZxuDK2tIvPQU0=; b=gT8h7kviZcWjSbxcGM6c7BdzfNvHu61EUjHE
	5ef9A6nWaBW/klv//sNvRJzVGj+zUGmmFQUOCYQ6xeu4p9Ond8VyvpTW1H6gc7zE
	TFacCrW7uVpp1ahXGPge/+0nvYRUY0E4OK87LRl6SWf+D8mZoVvsFiKRONDCx47j
	Qk7yuno=
In-Reply-To: <20171006024531.8885-1-nicolas.pitre@linaro.org>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Tested-by: Chris Brandt <chris.brandt@renesas.com>
---
 init/do_mounts.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index c2de5104aa..43b5817f60 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -556,6 +556,14 @@ void __init prepare_namespace(void)
 		ssleep(root_delay);
 	}
 
+	if (IS_ENABLED(CONFIG_CRAMFS_PHYSMEM) && root_fs_names &&
+	    !strcmp(root_fs_names, "cramfs_physmem")) {
+		int err = do_mount_root("cramfs", "cramfs_physmem",
+					root_mountflags, root_mount_data);
+		if (!err)
+			goto out;
+	}
+
 	/*
 	 * wait for the known devices to complete their probing
 	 *
-- 
2.9.5

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
