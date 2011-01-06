From: Rob Landley <rlandley@parallels.com>
Subject: [PATCH] Move an assert under DEBUG_KERNEL.
Date: Thu, 6 Jan 2011 02:13:38 -0600
Message-ID: <4D2579B2.7060704@parallels.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: trivial@kernel.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

From: Rob Landley <rlandley@parallels.com>

Move an assert under DEBUG_KERNEL.

Signed-off-by: Rob Landley <rlandley@parallels.com>
---

Saves about 3k from x86-64 defconfig according to scripts/bloat-o-meter.

  include/linux/rtnetlink.h |    4 ++++
  1 file changed, 4 insertions(+)

diff --git a/include/linux/rtnetlink.h b/include/linux/rtnetlink.h
index bbad657..28c4025 100644
--- a/include/linux/rtnetlink.h
+++ b/include/linux/rtnetlink.h
@@ -782,6 +782,7 @@ extern struct netdev_queue 
*dev_ingress_queue_create(struct net_device *dev);
  extern void rtnetlink_init(void);
  extern void __rtnl_unlock(void);

+#ifdef CONFIG_DEBUG_KERNEL
  #define ASSERT_RTNL() do { \
  	if (unlikely(!rtnl_is_locked())) { \
  		printk(KERN_ERR "RTNL: assertion failed at %s (%d)\n", \
@@ -789,6 +790,9 @@ extern void __rtnl_unlock(void);
  		dump_stack(); \
  	} \
  } while(0)
+#else
+#define ASSERT_RTNL()
+#endif

  static inline u32 rtm_get_table(struct rtattr **rta, u8 table)
  {
