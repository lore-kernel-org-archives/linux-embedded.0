From: David Wagner <david.wagner@free-electrons.com>
Subject: [PATCHv9] UBI: new module ubiblk: block layer on top of UBI
Date: Mon, 26 Sep 2011 16:40:49 +0200
Message-ID: <1317048049-19391-1-git-send-email-david.wagner@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: linux-mtd <linux-mtd@lists.infradead.org>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>, Ricard Wanderlof <ricard.wanderlof@axis.com>, David Wagner <david.wagner@free-electrons.com>, Artem Bityutskiy <dedekind1@gmail.com>, Arnd Bergmann <arnd@arndb.de>

ubiblk is a read-only block layer on top of UBI.  It presents UBI volum=
es as
read-only block devices (named ubiblkX_Y, where X is the UBI device num=
ber
and Y the Volume ID).

It is used by putting a block filesystem image on a UBI volume, creatin=
g the
corresponding ubiblk device and then mounting it.

It uses the UBI API to register to UBI notifications and to read from t=
he
volumes.  It also creates a ubiblk_ctrl device node that simply receive=
s ioctl
from a userspace tool for creating/removing ubiblk devices.

Some code is taken from mtd_blkdevs and gluebi.  Some code for the ioct=
l part is
also inspired from ubi's core.

Advantages of ubiblk over gluebi+mtdblock_ro:

 * Simpler architecture

 * The numbering of devices is much easier with ubiblk than with
   gluebi+mtdblock_ro. With gluebi+mtdblock_ro, you get one additional =
MTD
   device for each UBI volume, so the number of MTD devices grows quite=
 a lot
   and is a bit difficult to understand. For example, mtdblock[0-4] mig=
ht be
   your real MTD partitions, while mtdblock[5-9] might be your UBI volu=
mes.
   It also means that if a new real MTD partition is added, the index o=
f all the
   MTD devices exposing UBI volumes will be shifted by one, which is a =
bit
   confusing/annoying.
   As well, if you add an UBI volume, the mtdblock devices that are emu=
lated on
   top of volumes that come after this new one will have their ID incre=
mented.

 * ubiblk devices are created on a 'on-demand' basis, which avoids wast=
ing
   resources.

 * It is also possible to specify a "volume" parameter in order to crea=
te a
   ubiblk device at init time.  This makes possible to put a rootfs on =
a ubiblk
   device.  Format: "<ubi device number>:<volume name|volume ID>"

 * The performance appears to be slightly better with ubiblk than
   gluebi+mtdblock_ro, according to our benchmarks (see
   http://elinux.org/Flash_Filesystem_Benchmarks_2.6.39)

Signed-off-by: David Wagner <david.wagner@free-electrons.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
---

	changes since v8:
	~~~~~~~~~~~~~~~~~

 * Update the module parameter description

 Documentation/ioctl/ioctl-number.txt |    1 +
 drivers/mtd/ubi/Kconfig              |   16 +
 drivers/mtd/ubi/Makefile             |    1 +
 drivers/mtd/ubi/ubiblk.c             |  755 ++++++++++++++++++++++++++=
++++++++
 include/mtd/Kbuild                   |    1 +
 include/mtd/ubiblk-user.h            |   48 +++
 6 files changed, 822 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/ubi/ubiblk.c
 create mode 100644 include/mtd/ubiblk-user.h

diff --git a/Documentation/ioctl/ioctl-number.txt b/Documentation/ioctl=
/ioctl-number.txt
index 845a191..b24df7f 100644
--- a/Documentation/ioctl/ioctl-number.txt
+++ b/Documentation/ioctl/ioctl-number.txt
@@ -150,6 +150,7 @@ Code  Seq#(hex)	Include File		Comments
 'M'	00-0F	drivers/video/fsl-diu-fb.h	conflict!
 'N'	00-1F	drivers/usb/scanner.h
 'O'     00-06   mtd/ubi-user.h		UBI
+'O'     10-11   mtd/ubiblk-user.h       ubiblk
 'P'	all	linux/soundcard.h	conflict!
 'P'	60-6F	sound/sscape_ioctl.h	conflict!
 'P'	00-0F	drivers/usb/class/usblp.c	conflict!
diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 4dcc752..977934a 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -60,4 +60,20 @@ config MTD_UBI_DEBUG
 	help
 	  This option enables UBI debugging.
=20
+config MTD_UBI_UBIBLK
+	tristate "Read-only block transition layer on top of UBI"
+	help
+	   Read-only block interface on top of UBI.
+
+	   This option adds ubiblk, which creates a read-ony block device fro=
m
+	   UBI volumes.  It makes it possible to use R/O block filesystems on
+	   top of UBI volumes (and hence, on top of MTDs while avoiding bad
+	   blocks).
+
+	   ubiblk devices are created by invoking appropriate ioctl to the
+	   ubiblk_ctrl device node.
+
+	   The devices are named ubiblkX_Y where X is the UBI number and Y is
+	   the Volume ID.
+
 endif # MTD_UBI
diff --git a/drivers/mtd/ubi/Makefile b/drivers/mtd/ubi/Makefile
index c9302a5..354b2df 100644
--- a/drivers/mtd/ubi/Makefile
+++ b/drivers/mtd/ubi/Makefile
@@ -5,3 +5,4 @@ ubi-y +=3D misc.o
=20
 ubi-$(CONFIG_MTD_UBI_DEBUG) +=3D debug.o
 obj-$(CONFIG_MTD_UBI_GLUEBI) +=3D gluebi.o
+obj-$(CONFIG_MTD_UBI_UBIBLK) +=3D ubiblk.o
diff --git a/drivers/mtd/ubi/ubiblk.c b/drivers/mtd/ubi/ubiblk.c
new file mode 100644
index 0000000..ccb22de
--- /dev/null
+++ b/drivers/mtd/ubi/ubiblk.c
@@ -0,0 +1,755 @@
+/*
+ * Copyright (c) Free Electrons, 2011
+ * Copyright (c) International Business Machines Corp., 2006
+ * Copyright =C2=A9 2003-2010 David Woodhouse <dwmw2@infradead.org>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License as published b=
y
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307=
 USA
+ *
+ * Author: David Wagner
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/vmalloc.h>
+#include <linux/mtd/ubi.h>
+#include <linux/blkdev.h>
+#include <linux/miscdevice.h>
+#include <linux/kthread.h>
+#include <linux/mutex.h>
+#include <linux/list.h>
+#include <mtd/ubiblk-user.h>
+#include "ubi.h"
+#include "ubi-media.h"
+
+#define BLK_SIZE 512
+
+/**
+ * struct ubiblk_dev - represents a ubiblk device, proxying a UBI volu=
me
+ * @desc: open UBI volume descriptor
+ * @vi: UBI volume information
+ * @ubi_num: UBI device number
+ * @vol_id: UBI volume identifier
+ * @refcnt: reference counter (increases with open(), decreases with r=
elease())
+ * @gd: the disk (block device) created by ubiblk
+ * @rq: the request queue to @gd
+ * @req_task: the thread processing @rq requests
+ * @vol_lock: protects write access to the elements of this structure
+ * @queue_lock: avoids concurrent accesses to the request queue
+ * @list: linked list structure
+ */
+struct ubiblk_dev {
+	struct ubi_volume_desc *desc;
+	struct ubi_volume_info *vi;
+	int ubi_num;
+	int vol_id;
+	int refcnt;
+
+	struct gendisk *gd;
+	struct request_queue *rq;
+	struct task_struct *req_task;
+
+	struct mutex vol_lock;
+
+	spinlock_t queue_lock;
+
+	struct list_head list;
+};
+
+/* Linked list of all ubiblk_dev instances */
+static LIST_HEAD(ubiblk_devs);
+
+/* Avoid concurrent access to the above list */
+static DEFINE_MUTEX(devlist_lock);
+
+static int ubiblk_major;
+static const struct block_device_operations ubiblk_ops;
+
+/* The device receiving the ioctls */
+static struct miscdevice ctrl_dev;
+
+/* +3 is for the separator and the UBI device num */
+#define VOL_PARAM_MAXLEN (UBI_VOL_NAME_MAX + 3)
+static char *volume;
+module_param(volume, charp, 0000);
+MODULE_PARM_DESC(volume,
+	"Format: volume=3D<ubi device number>:<volume name|volume id>\n"
+	"Create a ubiblk device at init time.  Useful for mounting it as root=
 "
+	"device.");
+
+static struct ubiblk_dev *find_dev(struct ubi_volume_info *vi)
+{
+	struct ubiblk_dev *dev;
+
+	list_for_each_entry(dev, &ubiblk_devs, list) {
+		if (dev && dev->ubi_num =3D=3D vi->ubi_num &&
+		    dev->vol_id =3D=3D vi->vol_id)
+			return dev;
+	}
+	return NULL;
+}
+
+/**
+ * do_ubiblk_request - Read a LEB and fill the request buffer with the
+ * requested sector.
+ * @req: the request data structure
+ * @dev: the ubiblk device on which the request is issued
+ */
+static int do_ubiblk_request(struct request *req, struct ubiblk_dev *d=
ev)
+{
+	unsigned long start, len, read_bytes;
+	int offset;
+	int leb;
+	int ret;
+
+	start =3D blk_rq_pos(req) << 9;
+	len =3D blk_rq_cur_bytes(req);
+	read_bytes =3D 0;
+
+	/* We are always reading. No need to handle writing for now */
+
+	leb =3D start / dev->vi->usable_leb_size;
+	offset =3D start % dev->vi->usable_leb_size;
+
+	do {
+		if (offset + len > dev->vi->usable_leb_size)
+			len =3D dev->vi->usable_leb_size - offset;
+
+		if (unlikely(blk_rq_pos(req) + blk_rq_cur_sectors(req) >
+		    get_capacity(req->rq_disk))) {
+			dev_err(disk_to_dev(dev->gd),
+				"attempting to read too far\n");
+			return -EIO;
+		}
+
+		/* Read (len) bytes of LEB (leb) from (offset) and put the
+		 * result in the buffer given by the request.
+		 * If the request is overlapping on several lebs, (read_bytes)
+		 * will be > 0 and the data will be put in the buffer at
+		 * offset (read_bytes)
+		 */
+		ret =3D ubi_read(dev->desc, leb, req->buffer + read_bytes,
+			       offset, len);
+
+		if (ret) {
+			dev_err(disk_to_dev(dev->gd), "ubi_read error\n");
+			return ret;
+		}
+
+		read_bytes +=3D len;
+
+		len =3D blk_rq_cur_bytes(req) - read_bytes;
+		leb++;
+		offset =3D 0;
+	} while (read_bytes < blk_rq_cur_bytes(req));
+
+	return 0;
+}
+
+/**
+ * ubiblk_request - wakes the processing thread
+ * @rq: the request queue which device is to be awaken
+ */
+static void ubiblk_request(struct request_queue *rq)
+{
+	struct ubiblk_dev *dev;
+	struct request *req;
+
+	dev =3D rq->queuedata;
+
+	if (!dev)
+		while ((req =3D blk_fetch_request(rq)) !=3D NULL)
+			__blk_end_request_all(req, -ENODEV);
+	else
+		wake_up_process(dev->req_task);
+}
+
+/**
+ * ubiblk_open - open a UBI volume (get the volume descriptor).
+ * @bdev: the corresponding block device
+ * @mode: opening mode (don't care as long as ubiblk is read-only)
+ */
+static int ubiblk_open(struct block_device *bdev, fmode_t mode)
+{
+	struct ubiblk_dev *dev =3D bdev->bd_disk->private_data;
+	int err;
+
+	mutex_lock(&dev->vol_lock);
+	dev_dbg(disk_to_dev(dev->gd), "open(); refcnt =3D %d\n", dev->refcnt)=
;
+	if (dev->refcnt > 0) {
+		/*
+		 * The volume is already opened ; just increase the reference
+		 * counter.
+		 */
+		dev->refcnt++;
+		mutex_unlock(&dev->vol_lock);
+		return 0;
+	}
+
+	dev->desc =3D ubi_open_volume(dev->ubi_num, dev->vol_id,
+					UBI_READONLY);
+	if (IS_ERR(dev->desc)) {
+		dev_err(disk_to_dev(dev->gd), "failed to open");
+
+		err =3D PTR_ERR(dev->desc);
+		dev->desc =3D NULL;
+		goto out_unlock;
+	}
+
+	dev->vi =3D kzalloc(sizeof(struct ubi_volume_info), GFP_KERNEL);
+	if (!dev->vi) {
+		err =3D -ENOMEM;
+		goto out_close;
+	}
+	ubi_get_volume_info(dev->desc, dev->vi);
+
+	dev->refcnt++;
+	dev_dbg(disk_to_dev(dev->gd), "opened mode=3D%d\n", mode);
+	mutex_unlock(&dev->vol_lock);
+	return 0;
+
+out_close:
+	ubi_close_volume(dev->desc);
+	dev->desc =3D NULL;
+out_unlock:
+	mutex_unlock(&dev->vol_lock);
+	return err;
+}
+
+/**
+ * ubiblk_release - close a UBI volume (close the volume descriptor).
+ * @gd: the disk that was previously opened
+ * @mode: don't care
+ */
+static int ubiblk_release(struct gendisk *gd, fmode_t mode)
+{
+	struct ubiblk_dev *dev =3D gd->private_data;
+
+	mutex_lock(&dev->vol_lock);
+	dev_dbg(disk_to_dev(dev->gd), "release(); refcnt =3D %d\n", dev->refc=
nt);
+
+	dev->refcnt--;
+	if (dev->refcnt =3D=3D 0) {
+		kfree(dev->vi);
+		dev->vi =3D NULL;
+
+		ubi_close_volume(dev->desc);
+		dev->desc =3D NULL;
+
+		dev_dbg(disk_to_dev(dev->gd), "released, mode=3D%d\n", mode);
+	}
+
+	mutex_unlock(&dev->vol_lock);
+	return 0;
+}
+
+/**
+ * ubiblk_thread - loop on the block request queue and wait for new
+ * requests ; run them with do_ubiblk_request(). Mostly copied from
+ * mtd_blkdevs.c.
+ * @arg: the ubiblk device which request queue to process
+ */
+static int ubiblk_thread(void *arg)
+{
+	struct ubiblk_dev *dev =3D arg;
+	struct request_queue *rq =3D dev->rq;
+	struct request *req =3D NULL;
+
+	spin_lock_irq(rq->queue_lock);
+
+	while (!kthread_should_stop()) {
+		int res;
+
+		if (!req)
+			req =3D blk_fetch_request(rq);
+		if (!req) {
+			set_current_state(TASK_INTERRUPTIBLE);
+
+			if (kthread_should_stop())
+				set_current_state(TASK_RUNNING);
+
+			spin_unlock_irq(rq->queue_lock);
+			schedule();
+			spin_lock_irq(rq->queue_lock);
+			continue;
+		}
+
+		spin_unlock_irq(rq->queue_lock);
+
+		mutex_lock(&dev->vol_lock);
+		res =3D do_ubiblk_request(req, dev);
+		mutex_unlock(&dev->vol_lock);
+
+		spin_lock_irq(rq->queue_lock);
+
+		if (!__blk_end_request_cur(req, res))
+			req =3D NULL;
+	}
+
+	if (req)
+		__blk_end_request_all(req, -EIO);
+
+	spin_unlock_irq(rq->queue_lock);
+
+	return 0;
+}
+
+/**
+ * ubiblk_create - create a ubiblk device proxying a UBI volume.
+ * @vi: the UBI volume information data structure
+ *
+ * An UBI volume has been created ; create a corresponding ubiblk devi=
ce:
+ * Initialize the locks, the structure, the block layer infos and star=
t a
+ * req_task.
+ */
+static int ubiblk_create(struct ubi_volume_info *vi)
+{
+	struct ubiblk_dev *dev;
+	struct gendisk *gd;
+	int disk_capacity;
+	int ret;
+
+	mutex_lock(&devlist_lock);
+	/* Check that the volume isn't already proxyfied */
+	if (find_dev(vi)) {
+		ret =3D -EEXIST;
+		goto out_unlock;
+	}
+
+	dev =3D kzalloc(sizeof(struct ubiblk_dev), GFP_KERNEL);
+	if (!dev) {
+		ret =3D -ENOMEM;
+		goto out_unlock;
+	}
+
+	mutex_init(&dev->vol_lock);
+
+	dev->ubi_num =3D vi->ubi_num;
+	dev->vol_id =3D vi->vol_id;
+
+	/* Initialize the gendisk of this ubiblk device */
+	gd =3D alloc_disk(1);
+	if (!gd) {
+		pr_err("alloc_disk failed\n");
+		ret =3D -ENODEV;
+		goto out_free_dev;
+	}
+
+	gd->fops =3D &ubiblk_ops;
+	gd->major =3D ubiblk_major;
+	gd->first_minor =3D dev->ubi_num * UBI_MAX_VOLUMES + dev->vol_id;
+	gd->private_data =3D dev;
+	sprintf(gd->disk_name, "ubiblk%d_%d", dev->ubi_num, dev->vol_id);
+	disk_capacity =3D (vi->size * vi->usable_leb_size) >> 9;
+	set_capacity(gd, disk_capacity);
+	set_disk_ro(gd, 1);
+	dev->gd =3D gd;
+
+	spin_lock_init(&dev->queue_lock);
+	dev->rq =3D blk_init_queue(ubiblk_request, &dev->queue_lock);
+	if (!dev->rq) {
+		pr_err("blk_init_queue failed\n");
+		ret =3D -ENODEV;
+		goto out_put_disk;
+	}
+	dev->rq->queuedata =3D dev;
+	blk_queue_logical_block_size(dev->rq, BLK_SIZE);
+	dev->gd->queue =3D dev->rq;
+
+	/* Borrowed from mtd_blkdevs.c */
+	/* Create processing req_task
+	 *
+	 * The processing of the request has to be done in process context (i=
t
+	 * might sleep) but blk_run_queue can't block ; so we need to separat=
e
+	 * the event of a request being added to the queue (which triggers th=
e
+	 * callback ubiblk_request - that is set with blk_init_queue())
+	 * and the processing of that request.
+	 *
+	 * Thus, the sole purpose of ubi_ubiblk_reuqest is to wake the kthrea=
d
+	 * up so that it will process the request queue
+	 */
+	dev->req_task =3D kthread_run(ubiblk_thread, dev, "%s%d_%d",
+				  "kubiblk", dev->ubi_num, dev->vol_id);
+	if (IS_ERR(dev->req_task)) {
+		ret =3D PTR_ERR(dev->req_task);
+		goto out_cleanup_queue;
+	}
+
+	list_add(&dev->list, &ubiblk_devs);
+	add_disk(dev->gd);
+
+	dev_info(disk_to_dev(dev->gd),
+		 "created from ubi%d:%d(%s)\n", dev->ubi_num, dev->vol_id,
+		 vi->name);
+
+	mutex_unlock(&devlist_lock);
+
+	return 0;
+
+out_cleanup_queue:
+	blk_cleanup_queue(dev->rq);
+out_put_disk:
+	put_disk(dev->gd);
+out_free_dev:
+	kfree(dev);
+out_unlock:
+	mutex_unlock(&devlist_lock);
+
+	return ret;
+}
+
+/**
+ * ubiblk_remove - destroy a ubiblk device.
+ * @vi: the UBI volume information data structure
+ *
+ * A UBI volume has been removed or we are requested to unproxify a vo=
lume ;
+ * destroy the corresponding ubiblk device.
+ */
+static int ubiblk_remove(struct ubi_volume_info *vi)
+{
+	struct ubiblk_dev *dev;
+
+	mutex_lock(&devlist_lock);
+
+	dev =3D find_dev(vi);
+	if (!dev) {
+		mutex_unlock(&devlist_lock);
+		pr_warn("trying to remove %s, but it isn't handled\n",
+			vi->name);
+		return -ENODEV;
+	}
+
+	mutex_lock(&dev->vol_lock);
+	if (dev->desc) {
+		mutex_unlock(&dev->vol_lock);
+		mutex_unlock(&devlist_lock);
+		return -EBUSY;
+	}
+
+	del_gendisk(dev->gd);
+	blk_cleanup_queue(dev->rq);
+	kthread_stop(dev->req_task);
+	put_disk(dev->gd);
+
+	list_del(&dev->list);
+	mutex_unlock(&dev->vol_lock);
+	mutex_unlock(&devlist_lock);
+
+	kfree(dev);
+	pr_info("unproxyfied %s\n", vi->name);
+	return 0;
+}
+
+/**
+ * ubiblk_resize - resize a ubiblk device.
+ * @vi: the UBI volume information data structure
+ *
+ * A UBI volume has been resized, change the ubiblk device geometry ac=
cordingly.
+ */
+static int ubiblk_resize(struct ubi_volume_info *vi)
+{
+	struct ubiblk_dev *dev;
+	int disk_capacity;
+
+	/* We don't touch the list, but we better lock it: it could be that t=
he
+	 * device gets removed between the time the device has been found and
+	 * the time we access dev->gd
+	 */
+	mutex_lock(&devlist_lock);
+	dev =3D find_dev(vi);
+	if (!dev) {
+		mutex_unlock(&devlist_lock);
+		pr_warn("trying to resize %s, which isn't handled\n",
+			vi->name);
+		return -ENODEV;
+	}
+
+	mutex_lock(&dev->vol_lock);
+	disk_capacity =3D (vi->size * vi->usable_leb_size) >> 9;
+	set_capacity(dev->gd, disk_capacity);
+	dev_dbg(disk_to_dev(dev->gd), "resized to %d LEBs\n", vi->size);
+	mutex_unlock(&dev->vol_lock);
+
+	mutex_unlock(&devlist_lock);
+	return 0;
+}
+
+/**
+ * ubiblk_notify - dispatches the UBI notifications.
+ * @nb: unused
+ * @notification_type: the notification type sent by UBI
+ * @ns_ptr: contains the notifications' additional informations
+ */
+static int ubiblk_notify(struct notifier_block *nb,
+			 unsigned long notification_type, void *ns_ptr)
+{
+	struct ubi_notification *nt =3D ns_ptr;
+
+	switch (notification_type) {
+	case UBI_VOLUME_REMOVED:
+		ubiblk_remove(&nt->vi);
+		break;
+	case UBI_VOLUME_RESIZED:
+		ubiblk_resize(&nt->vi);
+		break;
+	default:
+		break;
+	}
+	return NOTIFY_OK;
+}
+
+static const struct block_device_operations ubiblk_ops =3D {
+	.owner =3D THIS_MODULE,
+	.open =3D ubiblk_open,
+	.release =3D ubiblk_release,
+};
+
+static struct notifier_block ubiblk_notifier =3D {
+	.notifier_call =3D ubiblk_notify,
+};
+
+
+/**
+ * ubiblk_ctrl_ioctl - ioctl handling for proxying/unproxying a UBI vo=
lume.
+ * @file: the file on which the ioctl was invoked (unused)
+ * @cmd: the ioctl type
+ * @arg: additional command informations
+ */
+static long ubiblk_ctrl_ioctl(struct file *file, unsigned int cmd,
+			      unsigned long arg)
+{
+	int err;
+	void __user *argp =3D (void __user *)arg;
+
+	struct ubi_volume_desc *desc;
+	struct ubi_volume_info vi;
+	struct ubiblk_ctrl_req req;
+
+	if (!capable(CAP_SYS_RESOURCE))
+		return -EPERM;
+
+	err =3D copy_from_user(&req, argp, sizeof(struct ubiblk_ctrl_req));
+	if (err)
+		return -EFAULT;
+
+	if (req.ubi_num < 0 || req.vol_id < 0)
+		return -EINVAL;
+
+	desc =3D ubi_open_volume(req.ubi_num, req.vol_id, UBI_READONLY);
+	if (IS_ERR(desc)) {
+		dev_err(ctrl_dev.this_device, "opening ubi%d:%d failed\n",
+			req.ubi_num, req.vol_id);
+		return PTR_ERR(desc);
+	}
+
+	ubi_get_volume_info(desc, &vi);
+
+	switch (cmd) {
+	case UBIBLK_IOCADD:
+		dev_info(ctrl_dev.this_device, "proxying ubi%d:%d\n",
+			 req.ubi_num, req.vol_id);
+		err =3D ubiblk_create(&vi);
+		break;
+	case UBIBLK_IOCDEL:
+		dev_info(ctrl_dev.this_device, "unproxying ubi%d:%d\n",
+			 req.ubi_num, req.vol_id);
+		err =3D ubiblk_remove(&vi);
+		break;
+
+	default:
+		err =3D -ENOTTY;
+		break;
+	}
+
+	ubi_close_volume(desc);
+
+	return err;
+}
+
+/* ubiblk control device (receives ioctls) */
+static const struct file_operations ubiblk_ctrl_ops =3D {
+	.owner =3D THIS_MODULE,
+	.unlocked_ioctl =3D ubiblk_ctrl_ioctl,
+	.llseek =3D no_llseek,
+};
+static struct miscdevice ctrl_dev =3D {
+	.minor =3D MISC_DYNAMIC_MINOR,
+	.name =3D "ubiblk_ctrl",
+	.fops =3D &ubiblk_ctrl_ops,
+};
+
+/**
+ * volume_param_parse - parse the "volume" module parameter.
+ * @ubi_num: where to store the UBI device number
+ * @vol_name: where to store the volume name (fixed lenght, at least
+ * UBI_VOL_NAME_MAX)
+ */
+static struct ubi_volume_desc __init *inittime_volume_open(void)
+{
+	char *tokens[2] =3D {NULL, NULL};
+	char buf[VOL_PARAM_MAXLEN + 1];
+	char *pbuf =3D buf;
+
+	int len =3D strlen(volume);
+
+	int ubi_num, vol_id;
+	char vol_name[UBI_VOL_NAME_MAX + 1];
+	struct ubi_volume_desc *desc;
+
+	int err;
+
+	if (len > VOL_PARAM_MAXLEN || len =3D=3D 0)
+		return ERR_PTR(-EINVAL);
+
+	strcpy(buf, volume);
+	tokens[0] =3D strsep(&pbuf, ":");
+	tokens[1] =3D strsep(&pbuf, ":");
+
+	if (pbuf)
+		return ERR_PTR(-EINVAL); /* There are surnumerous parameters */
+
+	err =3D kstrtoint(tokens[0], 10, &ubi_num);
+	if (err < 0 || ubi_num < 0)
+		return ERR_PTR(err);
+
+	len =3D strlen(tokens[1]);
+	if (len > UBI_VOL_NAME_MAX || len =3D=3D 0)
+		return ERR_PTR(-EINVAL);
+	strcpy(vol_name, tokens[1]);
+
+	/* Try to open it by its name */
+	desc =3D ubi_open_volume_nm(ubi_num, vol_name, UBI_READONLY);
+	if (!IS_ERR(desc))
+		return desc;
+
+	/* Convert the vol_name string to int and try to open it by its ID */
+	err =3D kstrtoint(tokens[1], 10, &vol_id);
+	if (err < 0)
+		return ERR_PTR(err);
+
+	return ubi_open_volume(ubi_num, vol_id, UBI_READONLY);
+}
+
+/**
+ * inittime_volume - create a volume at init time.
+ *
+ * If the user passed a "ubiblk.volume" argument, check it and create =
the said
+ * volume.
+ */
+static int __init inittime_device(void)
+{
+	int err;
+	struct ubi_volume_desc *desc;
+	struct ubi_volume_info vi;
+
+	desc =3D inittime_volume_open();
+	if (IS_ERR(desc)) {
+		pr_err("failed to open ubi%s: %ld\n", volume, PTR_ERR(desc));
+		return PTR_ERR(desc);
+	}
+
+	ubi_get_volume_info(desc, &vi);
+	err =3D ubiblk_create(&vi);
+	if (err < 0)
+		pr_err("can't create the initial device "
+		       "ubiblk%d_%d: %d\n", vi.ubi_num, vi.vol_id, err);
+	ubi_close_volume(desc);
+
+	return err;
+}
+
+/**
+ * ubiblk_init - initialize the module.
+ *
+ * Get a major number and register to UBI notifications ; register the=
 ioctl
+ * handler device.
+ */
+static int __init ubiblk_init(void)
+{
+	int ret;
+
+	ret =3D register_blkdev(0, "ubiblk");
+	if (ret < 0)
+		return ret;
+	ubiblk_major =3D ret;
+
+	ret =3D ubi_register_volume_notifier(&ubiblk_notifier, 1);
+	if (ret < 0)
+		goto out_unreg_blk;
+
+	ret =3D misc_register(&ctrl_dev);
+	if (ret < 0) {
+		pr_err("can't register control device\n");
+		goto out_unreg_notifier;
+	}
+
+	/* Check if the user wants a volume to be proxified at init time */
+	if (volume) {
+		ret =3D inittime_device();
+		if (ret < 0)
+			goto out_unreg_misc;
+	}
+
+	pr_info("major device number is %d\n", ubiblk_major);
+
+	return ret;
+
+out_unreg_misc:
+	misc_deregister(&ctrl_dev);
+out_unreg_notifier:
+	ubi_unregister_volume_notifier(&ubiblk_notifier);
+out_unreg_blk:
+	unregister_blkdev(ubiblk_major, "ubiblk");
+
+	return ret;
+}
+
+/**
+ * ubiblk_exit - end of life.
+ *
+ * Unregister the block device major, unregister from UBI notification=
s,
+ * unregister the ioctl handler device, stop the threads and free the =
memory.
+ */
+static void __exit ubiblk_exit(void)
+{
+	struct ubiblk_dev *next;
+	struct ubiblk_dev *dev;
+
+	ubi_unregister_volume_notifier(&ubiblk_notifier);
+	misc_deregister(&ctrl_dev);
+
+	list_for_each_entry_safe(dev, next, &ubiblk_devs, list) {
+		/* The module is being forcefully removed */
+		WARN_ON(dev->desc);
+
+		del_gendisk(dev->gd);
+		blk_cleanup_queue(dev->rq);
+		kthread_stop(dev->req_task);
+		put_disk(dev->gd);
+
+		kfree(dev);
+	}
+
+	unregister_blkdev(ubiblk_major, "ubiblk");
+}
+
+module_init(ubiblk_init);
+module_exit(ubiblk_exit);
+MODULE_DESCRIPTION("Read-only block transition layer on top of UBI");
+MODULE_AUTHOR("David Wagner");
+MODULE_LICENSE("GPL");
diff --git a/include/mtd/Kbuild b/include/mtd/Kbuild
index 192f8fb..d0d59d8 100644
--- a/include/mtd/Kbuild
+++ b/include/mtd/Kbuild
@@ -3,3 +3,4 @@ header-y +=3D mtd-abi.h
 header-y +=3D mtd-user.h
 header-y +=3D nftl-user.h
 header-y +=3D ubi-user.h
+header-y +=3D ubiblk-user.h
diff --git a/include/mtd/ubiblk-user.h b/include/mtd/ubiblk-user.h
new file mode 100644
index 0000000..61692d5
--- /dev/null
+++ b/include/mtd/ubiblk-user.h
@@ -0,0 +1,48 @@
+/*
+ * Copyright =C2=A9 Free Electrons, 2011
+ * Copyright =C2=A9 International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License as published b=
y
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307=
 USA
+ *
+ * Author: David Wagner
+ */
+
+#ifndef __UBIBLK_USER_H__
+#define __UBIBLK_USER_H__
+
+#include <linux/types.h>
+
+/**
+ * ubiblk_ctrl_req - additional ioctl data structure
+ * @ubi_num: UBI device number
+ * @vol_id: UBI volume identifier
+ * @padding: reserved for future, must contain zeroes
+ */
+struct ubiblk_ctrl_req {
+	__s32 ubi_num;
+	__s32 vol_id;
+	__u8 padding[8];
+} __packed;
+
+/* ioctl commands of the UBI control character device */
+#define UBIBLK_CTRL_IOC_MAGIC 'O'
+
+/* Create a ubiblk device from a UBI volume */
+#define UBIBLK_IOCADD _IOW(UBIBLK_CTRL_IOC_MAGIC, 0x10, struct ubiblk_=
ctrl_req)
+/* Delete a ubiblk device */
+#define UBIBLK_IOCDEL _IOW(UBIBLK_CTRL_IOC_MAGIC, 0x11, struct ubiblk_=
ctrl_req)
+/* If you add ioctls here, please note that UBI uses 'O'/0x00-0x06 */
+
+#endif
--=20
1.7.0.4
