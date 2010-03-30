From: Ferenc Wagner <wferi@niif.hu>
Subject: Re: [PATCH 2/3] squashfs: gather everything block device specific into block.c
Date: Tue, 30 Mar 2010 18:50:18 +0200
Message-ID: <8739zhu52t.fsf@tac.ki.iif.hu>
References: <87mxxxltk6.fsf@tac.ki.iif.hu>
	<1269955969-26123-3-git-send-email-wferi@niif.hu>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1269955969-26123-3-git-send-email-wferi@niif.hu> (Ferenc
	Wagner's message of "Tue, 30 Mar 2010 15:32:48 +0200")
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Phillip Lougher <phillip.lougher@gmail.com>, linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

---
I lost this free somehow.  Does squashfs_put_super() need protection
from multiple invocation?  If not, this kfree could be removed from
there, and the condition from both places.

 fs/squashfs/backend.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/fs/squashfs/backend.c b/fs/squashfs/backend.c
index a6136ca..0ae37ab 100644
--- a/fs/squashfs/backend.c
+++ b/fs/squashfs/backend.c
@@ -24,6 +24,10 @@ int squashfs_find_backend(struct file_system_type *fs_type, int flags,
 
 void squashfs_kill_super(struct super_block *sb)
 {
+	if (sb->s_fs_info) {
+		kfree(sb->s_fs_info);
+		sb->s_fs_info = NULL;
+	}
 #ifdef CONFIG_BLOCK
 	if (sb->s_bdev) {
 		kill_block_super(sb);
-- 
1.6.5
