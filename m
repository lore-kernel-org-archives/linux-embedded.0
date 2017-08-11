From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 2/5] cramfs: make cramfs_physmem usable as root fs
Date: Fri, 11 Aug 2017 15:22:49 -0400
Message-ID: <20170811192252.19062-3-nicolas.pitre@linaro.org>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references; s=sasl; bh=Kzk1
        NoZ34grNpdHOoyv80jv8ttk=; b=Y1ii0t1GS1rEDUp+4tBwBzWdT4CMTJ1WgyWC
        JMZHMXAiFIeWtggheoWmmYefeJtIYKYFJbP0MctlTrawxZMt2snZzqmkbFb+6A4o
        FEXGtBVYL3oy7Pu8KDM48Qaxwpu2ItmmtfEQ9SN/BwZ2Kw68ekTHfXXVfaeEZDcw
        9GB4VH8=
In-Reply-To: <20170811192252.19062-1-nicolas.pitre@linaro.org>
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
2.9.4

