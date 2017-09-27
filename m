From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v4 2/5] cramfs: make cramfs_physmem usable as root fs
Date: Wed, 27 Sep 2017 19:32:21 -0400
Message-ID: <20170927233224.31676-3-nicolas.pitre@linaro.org>
References: <20170927233224.31676-1-nicolas.pitre@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references; s=sasl; bh=pul/
        bqJBGIDrZnZxuDK2tIvPQU0=; b=ZkvLvEk72hgRn/Rwm0iSq+8BFoJkd6PUx52K
        gtogYpIq4jNuM/7jnVn9u20XSEsfPOYy4h3zckHqi/jCX1m4jfFAqtNMsrteERCs
        0p1eCoDZvBIVRzse+zKu2bppOvGF+B3OWCGggsukxA0gUarfhKVLZP+FiXS12WWK
        IT/DS3Y=
In-Reply-To: <20170927233224.31676-1-nicolas.pitre@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-mm@kvack.org
Cc: linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

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

