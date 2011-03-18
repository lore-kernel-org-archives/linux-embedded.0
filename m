From: Tony Ibbs <tibs@tonyibbs.co.uk>
Subject: [PATCH 07/11] KBUS add ability to add devices at runtime
Date: Fri, 18 Mar 2011 17:21:16 +0000
Message-ID: <6038dbd7e203bc102bd5d33ad9f1aa4f204a3a2e.1300450604.git.tibs@tonyibbs.co.uk>
References: <cover.1300450604.git.tibs@tonyibbs.co.uk>
 <273ee9658cbcbe19adfa0d7b30082d8966e70afc.1300450604.git.tibs@tonyibbs.co.uk>
 <979f23cd5f8a9ac727f17ad359ee487cbccbf7f6.1300450604.git.tibs@tonyibbs.co.uk>
 <c28914a66ae5526f18c331475298e7ef05bf57c7.1300450604.git.tibs@tonyibbs.co.uk>
 <ffc9b735a3b61c51881c108235155384a6e6f56c.1300450604.git.tibs@tonyibbs.co.uk>
 <e1e0c80ed995eccd4881081f5a769acb148b267b.1300450604.git.tibs@tonyibbs.co.uk>
 <023b39071aff3abc8e63336be501742333ceeced.1300450604.git.tibs@tonyibbs.co.uk>
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <023b39071aff3abc8e63336be501742333ceeced.1300450604.git.tibs@tonyibbs.co.uk>
In-Reply-To: <cover.1300450604.git.tibs@tonyibbs.co.uk>
References: <cover.1300450604.git.tibs@tonyibbs.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lkml <linux-kernel@vger.kernel.org>
Cc: Linux-embedded <linux-embedded@vger.kernel.org>, Tibs at Kynesim <tibs@kynesim.co.uk>, Richard Watts <rrw@kynesim.co.uk>, Grant Likely <grant.likely@secretlab.ca>, Tony Ibbs <tibs@tonyibbs.co.uk>

Users do not always know how many KBUS devices will be needed when
the system starts. This allows a normal user to request an extra
device.

Signed-off-by: Tony Ibbs <tibs@tonyibbs.co.uk>
---
 include/linux/kbus_defns.h |   12 +++++++++++-
 ipc/kbus_main.c            |   17 +++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletions(-)

diff --git a/include/linux/kbus_defns.h b/include/linux/kbus_defns.h
index 9da72e4..4d3fcd5 100644
--- a/include/linux/kbus_defns.h
+++ b/include/linux/kbus_defns.h
@@ -611,8 +611,18 @@ struct kbus_replier_bind_event_data {
  */
 #define KBUS_IOC_VERBOSE  _IOWR(KBUS_IOC_MAGIC, 15, char *)
 
+/*
+ * NEWDEVICE - request another KBUS device (/dev/kbus<n>).
+ *
+ * The next device number (up to a maximum of 255) will be allocated.
+ *
+ * arg(out): __u32, the new device number (<n>)
+ * retval: 0 for success, negative for failure
+ */
+#define KBUS_IOC_NEWDEVICE _IOR(KBUS_IOC_MAGIC, 16, char *)
+
 /* If adding another IOCTL, remember to increment the next number! */
-#define KBUS_IOC_MAXNR	15
+#define KBUS_IOC_MAXNR	16
 
 #if !__KERNEL__ && defined(__cplusplus)
 }
diff --git a/ipc/kbus_main.c b/ipc/kbus_main.c
index a75d2e1..48ba4b2 100644
--- a/ipc/kbus_main.c
+++ b/ipc/kbus_main.c
@@ -3532,6 +3532,23 @@ static long kbus_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		retval = kbus_set_verbosity(priv, arg);
 		break;
 
+	case KBUS_IOC_NEWDEVICE:
+		/*
+		 * Request a new device
+		 *
+		 * arg out: the new device number
+		 * return: 0 means OK, otherwise not OK.
+		 */
+		kbus_maybe_dbg(priv->dev, "%u NEWDEVICE %d\n",
+			       id, kbus_num_devices);
+		retval = kbus_setup_new_device(kbus_num_devices);
+		if (retval > 0) {
+			kbus_num_devices++;
+			retval = __put_user(kbus_num_devices - 1,
+				       (u32 __user *) arg);
+		}
+		break;
+
 	default:
 		/* *Should* be redundant, if we got our range checks right */
 		retval = -ENOTTY;
-- 
1.7.4.1
