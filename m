From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v2 2/5] cramfs: make cramfs_physmem usable as root fs
Date: Wed, 16 Aug 2017 13:35:33 -0400
Message-ID: <20170816173536.1879-3-nicolas.pitre@linaro.org>
References: <20170816173536.1879-1-nicolas.pitre@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references; s=sasl; bh=FRW4
        h7LOGDi0rkk6CzRZnQnfVq4=; b=J+FSJHxTz9+bVarkO8RZJg6ljWmuw1MTtQNi
        jyhknqXvVjTMQU9PCwI8JBSdvH+CCQoKVWpNVPCRHApfwOpvB4TLwRjw8UB6SK5L
        3N6SpweJdf5gL5v/SJ3YHF61kz5rq/38rzSWc9YMzMUwpEVSkqu8SQY2S9wNaG2H
        d5hsJsQ=
In-Reply-To: <20170816173536.1879-1-nicolas.pitre@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>

Signed-off-by: Nicolas Pitre <nico@linaro.org>
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

