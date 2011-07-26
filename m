From: David Wagner <david.wagner@free-electrons.com>
Subject: [PATCH] UBI: new module ubiblk: block layer on top of UBI
Date: Tue, 26 Jul 2011 14:27:30 +0200
Message-ID: <1311683250-7921-1-git-send-email-david.wagner@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: linux-mtd@lists.infradead.org
Cc: dedekind1@gmail.com, dwmw2@infradead.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, tim.bird@am.sony.com, David Wagner <david.wagner@free-electrons.com>

ubiblk is a read-only block layer on top of UBI.  It presents UBI volum=
es as
read-only block devices.

It is used by putting a block filesystem image on a UBI volume and then=
 mounting
the corresponding device (/dev/ubiblkX_Y where X is the UBI device numb=
er and Y
the volume ID).

It uses the UBI API to register to UBI notifications (to dynamically cr=
eate and
delete devices as volumes are added or removed) and to read from the vo=
lumes.

Some code is taken from mtd_blkdevs and gluebi

TODO:
 * the modules keeps a table of the devices which length is the maximum=
 number
   of UBI volumes.  It should make use of a linked list.

Signed-off-by: David Wagner <david.wagner@free-electrons.com>
---

updates from v2:

 * Added copyright information
 * Simplify the do_ubiblk_request loop
 * Fix a crash at module exit

Advantages of ubiblk over gluebi+mtdblock_ro:

 * Simpler architecture

 * The numbering of devices is much easier with ubiblk than with
   gluebi+mtdblock_ro. With gluebi+mtdblock_ro, you get one additional
   MTD device for each UBI volume, so the number of MTD devices grows
   quite a lot and is a bit difficult to understand. For example,
   mtdblock[0-4] might be your real MTD partitions, while mtdblock[5-9]
   might be your UBI volumes.
   It also means that if a new real MTD
   partition is added, the number of all the MTD devices exposing UBI
   volumes will be incremented by one, which is a bit
   confusing/annoying.
   As well, if you add an UBI volume, the mtdblock devices that are
   emulated on top of volumes that come after this new one will have
   their ID incremented.

 * The performance appears to be slightly better with ubiblk than
   gluebi+mtdblock_ro, according to our benchmarks (see
   http://elinux.org/Flash_Filesystem_Benchmarks_2.6.39)



 drivers/mtd/ubi/Kconfig  |   12 +
 drivers/mtd/ubi/Makefile |    1 +
 drivers/mtd/ubi/ubiblk.c |  556 ++++++++++++++++++++++++++++++++++++++=
++++++++
 3 files changed, 569 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/ubi/ubiblk.c

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 4dcc752..d19508b 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -60,4 +60,16 @@ config MTD_UBI_DEBUG
 	help
 	  This option enables UBI debugging.
=20
+config MTD_UBI_UBIBLK
+	tristate "Read-only block transition layer on top of UBI"
+	help
+	   Read-only block interface on top of UBI.
+
+	   This option adds ubiblk, which creates a read-ony block device for
+	   each UBI volume.  It makes it possible to use block filesystems on
+	   top of UBI (and thus, on top of MTDs while avoiding bad blocks).
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
index 0000000..bbf5b84
--- /dev/null
+++ b/drivers/mtd/ubi/ubiblk.c
@@ -0,0 +1,556 @@
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
+ * Some code taken from gluebi.c (Artem Bityutskiy (=D0=91=D0=B8=D1=82=
=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=D1=80=D1=82=D1=91=D0=BC),
+ *                                Joern Engel)
+ * Some code taken from mtd_blkdevs.c (David Woodhouse)
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/vmalloc.h>
+#include <linux/mtd/ubi.h>
+#include <linux/blkdev.h>
+#include <linux/kthread.h>
+#include <linux/mutex.h>
+#include "ubi.h"
+
+#define BLK_SIZE 512
+
+#define UBIBLK_MAX_DEVS (UBI_MAX_DEVICES * UBI_MAX_VOLUMES)
+
+/*
+ * Structure representing a ubiblk device, proxying a UBI volume
+ */
+struct ubiblk_dev {
+	struct ubi_volume_desc *vol_desc;
+	struct ubi_volume_info *vol_info;
+	int ubi_num;
+	int vol_id;
+
+	/* Block stuff */
+	struct gendisk *gd;
+	struct request_queue *rq;
+	struct task_struct *thread;
+
+	/* Protects the access to the UBI volume */
+	struct mutex lock;
+
+	/* Avoids concurrent accesses to the request queue */
+	spinlock_t queue_lock;
+};
+
+/*
+ * Contains the pointers to all ubiblk_dev instances
+ * TODO: use a linked list
+ */
+static struct ubiblk_dev *ubiblk_devs[UBIBLK_MAX_DEVS];
+static struct mutex devtable_lock;
+
+int major;
+static const struct block_device_operations ubiblk_ops;
+
+static struct ubiblk_dev *ubiblk_find_dev(struct ubi_volume_info *vol_=
info)
+{
+	int i;
+	struct ubiblk_dev *dev;
+
+	mutex_lock(&devtable_lock);
+	for (i =3D 0; i < UBIBLK_MAX_DEVS; i++) {
+		dev =3D ubiblk_devs[i];
+		if (dev && dev->ubi_num =3D=3D vol_info->ubi_num &&
+		    dev->vol_id =3D=3D vol_info->vol_id)
+			break;
+	}
+	mutex_unlock(&devtable_lock);
+	if (i =3D=3D UBIBLK_MAX_DEVS)
+		return NULL;
+	return dev;
+}
+
+/*
+ * Read a LEB and fill the request buffer with the requested sector
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
+	leb =3D start / dev->vol_info->usable_leb_size;
+	offset =3D start % dev->vol_info->usable_leb_size;
+
+	do {
+		if (offset + len > dev->vol_info->usable_leb_size)
+			len =3D dev->vol_info->usable_leb_size - offset;
+
+		if (unlikely(blk_rq_pos(req) + blk_rq_cur_sectors(req) >
+		    get_capacity(req->rq_disk))) {
+			pr_err("UBIBLK: attempting to read too far\n");
+			return -EIO;
+		}
+
+		pr_debug("%s(%s) of sector %llu (LEB %d). offset=3D%d, len=3D%lu\n",
+			 __func__, rq_data_dir(req) ? "Write" : "Read",
+			 blk_rq_pos(req), leb, offset, len);
+
+		/* Read (len) bytes of LEB (leb) from (offset) and put the
+		 * result in the buffer given by the request.
+		 * If the request is overlapping on several lebs, (read_bytes)
+		 * will be > 0 and the data will be put in the buffer at
+		 * offset (read_bytes)
+		 */
+		ret =3D ubi_read(dev->vol_desc, leb, req->buffer + read_bytes,
+			       offset, len);
+
+		if (ret) {
+			pr_err("ubi_read error\n");
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
+	pr_debug("ubi_read done.\n");
+
+	return 0;
+}
+
+static void ubi_ubiblk_request(struct request_queue *rq)
+{
+	struct ubiblk_dev *dev;
+	struct request *req =3D NULL;
+
+	dev =3D rq->queuedata;
+
+	if (!dev)
+		while ((req =3D blk_fetch_request(rq)) !=3D NULL)
+			__blk_end_request_all(req, -ENODEV);
+	else
+		wake_up_process(dev->thread);
+}
+
+/*
+ * Open a UBI volume (get the volume descriptor)
+ */
+static int ubiblk_open(struct block_device *bdev, fmode_t mode)
+{
+	struct ubiblk_dev *dev =3D bdev->bd_disk->private_data;
+	pr_debug("%s() disk_name=3D%s, mode=3D%d\n", __func__,
+		 bdev->bd_disk->disk_name, mode);
+
+	dev->vol_desc =3D ubi_open_volume(dev->ubi_num, dev->vol_id,
+					UBI_READONLY);
+	if (!dev->vol_desc) {
+		pr_err("open_volume failed");
+		return -EINVAL;
+	}
+
+	dev->vol_info =3D kzalloc(sizeof(struct ubi_volume_info), GFP_KERNEL)=
;
+	if (!dev->vol_info) {
+		ubi_close_volume(dev->vol_desc);
+		dev->vol_desc =3D NULL;
+		return -ENOMEM;
+	}
+	ubi_get_volume_info(dev->vol_desc, dev->vol_info);
+
+	return 0;
+}
+
+/*
+ * Close a UBI volume (close the volume descriptor)
+ */
+static int ubiblk_release(struct gendisk *gd, fmode_t mode)
+{
+	struct ubiblk_dev *dev =3D gd->private_data;
+	pr_debug("%s() disk_name=3D%s, mode=3D%d\n", __func__, gd->disk_name,=
 mode);
+
+	kfree(dev->vol_info);
+	dev->vol_info =3D NULL;
+	if (dev->vol_desc) {
+		ubi_close_volume(dev->vol_desc);
+		dev->vol_desc =3D NULL;
+	}
+
+	return 0;
+}
+
+/*
+ * Loop on the block request queue and wait for new requests ; run the=
m with
+ * do_ubiblk_request()
+ *
+ * Mostly copied from mtd_blkdevs.c
+ */
+static int ubi_ubiblk_thread(void *arg)
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
+		if (!req && !(req =3D blk_fetch_request(rq))) {
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
+		mutex_lock(&dev->lock);
+		res =3D do_ubiblk_request(req, dev);
+		pr_debug("return from request: %d\n", res);
+		mutex_unlock(&dev->lock);
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
+/*
+ * An UBI volume has been created ; create a corresponding ubiblk devi=
ce:
+ * Initialize the locks, the structure, the block layer infos and star=
t a
+ * thread.
+ */
+static int ubiblk_create(struct ubi_device_info *dev_info,
+			 struct ubi_volume_info *vol_info)
+{
+	struct ubiblk_dev *dev;
+	struct gendisk *gd;
+	int i;
+	int ret =3D 0;
+
+	mutex_lock(&devtable_lock);
+	for (i =3D 0; i < UBIBLK_MAX_DEVS; i++)
+		if (!ubiblk_devs[i])
+			break;
+
+	if (i =3D=3D UBIBLK_MAX_DEVS) {
+		/* Shouldn't happen: UBI can't make more volumes than that */
+		pr_err("no slot left for a new ubiblk device.\n");
+		mutex_unlock(&devtable_lock);
+		return -ENOMEM;
+	}
+
+	dev =3D kzalloc(sizeof(struct ubiblk_dev), GFP_KERNEL);
+	if (!dev) {
+		pr_err("UBIBLK: ENOMEM when trying to create a new"
+		       "ubiblk dev\n");
+		mutex_unlock(&devtable_lock);
+		return -ENOMEM;
+	}
+	ubiblk_devs[i] =3D dev;
+	mutex_unlock(&devtable_lock);
+
+	mutex_init(&dev->lock);
+	mutex_lock(&dev->lock);
+
+	dev->ubi_num =3D vol_info->ubi_num;
+	dev->vol_id =3D vol_info->vol_id;
+
+	dev->vol_desc =3D ubi_open_volume(dev->ubi_num, dev->vol_id,
+					UBI_READONLY);
+	if (IS_ERR(dev->vol_desc)) {
+		pr_err("open_volume failed\n");
+		ret =3D PTR_ERR(dev->vol_desc);
+		goto out_vol;
+	}
+
+	dev->vol_info =3D kzalloc(sizeof(struct ubi_volume_info), GFP_KERNEL)=
;
+	if (!dev->vol_info) {
+		ret =3D -ENOMEM;
+		goto out_info;
+	}
+	ubi_get_volume_info(dev->vol_desc, dev->vol_info);
+
+	pr_info("Got volume %s: device %d/volume %d of size %d\n",
+		dev->vol_info->name, dev->ubi_num, dev->vol_id,
+		dev->vol_info->size);
+
+	/* Initialize the gendisk of this ubiblk device */
+	gd =3D alloc_disk(1);
+	if (!gd) {
+		pr_err("alloc_disk failed\n");
+		ret =3D -ENODEV;
+		goto out_disk;
+	}
+
+	gd->fops =3D &ubiblk_ops;
+	gd->major =3D major;
+	gd->first_minor =3D dev->ubi_num * UBI_MAX_VOLUMES + dev->vol_id;
+	gd->private_data =3D dev;
+	sprintf(gd->disk_name, "ubiblk%d_%d", dev->ubi_num, dev->vol_id);
+	pr_debug("creating a gd '%s'\n", gd->disk_name);
+	set_capacity(gd,
+		     (dev->vol_info->size *
+		      dev->vol_info->usable_leb_size) >> 9);
+	set_disk_ro(gd, 1);
+	dev->gd =3D gd;
+
+	spin_lock_init(&dev->queue_lock);
+	dev->rq =3D blk_init_queue(ubi_ubiblk_request, &dev->queue_lock);
+	if (!dev->rq) {
+		pr_err("init_queue failed\n");
+		ret =3D -ENODEV;
+		goto out_queue;
+	}
+	dev->rq->queuedata =3D dev;
+	blk_queue_logical_block_size(dev->rq, BLK_SIZE);
+	dev->gd->queue =3D dev->rq;
+
+	/* Stolen from mtd_blkdevs.c */
+	/* Create processing thread
+	 *
+	 * The processing of the request has to be done in process context (i=
t
+	 * might sleep) but blk_run_queue can't block ; so we need to separat=
e
+	 * the event of a request being added to the queue (which triggers th=
e
+	 * callback ubi_ubiblk_request - that is set with blk_init_queue())
+	 * and the processing of that request.
+	 *
+	 * Thus, the sole purpose of ubi_ubiblk_reuqest is to wake the kthrea=
d
+	 * up so that it will process the request queue
+	 */
+	dev->thread =3D kthread_run(ubi_ubiblk_thread, dev, "%s%d_%d",
+				  "kubiblk", dev->ubi_num, dev->vol_id);
+	if (IS_ERR(dev->thread)) {
+		ret =3D PTR_ERR(dev->thread);
+		goto out_thread;
+	}
+
+	add_disk(dev->gd);
+	kfree(dev->vol_info);
+	dev->vol_info =3D NULL;
+	ubi_close_volume(dev->vol_desc);
+	dev->vol_desc =3D NULL;
+	mutex_unlock(&dev->lock);
+
+	return 0;
+
+out_thread:
+	blk_cleanup_queue(dev->rq);
+out_queue:
+	put_disk(dev->gd);
+out_disk:
+	kfree(dev->vol_info);
+	dev->vol_info =3D NULL;
+out_info:
+	ubi_close_volume(dev->vol_desc);
+	dev->vol_desc =3D NULL;
+out_vol:
+	mutex_unlock(&dev->lock);
+
+	return ret;
+}
+
+/*
+ * A UBI has been removed ; destroy the corresponding ubiblk device
+ */
+static int ubiblk_remove(struct ubi_volume_info *vol_info)
+{
+	int i;
+	struct ubiblk_dev *dev;
+
+	mutex_lock(&devtable_lock);
+	for (i =3D 0; i < UBIBLK_MAX_DEVS; i++) {
+		dev =3D ubiblk_devs[i];
+		if (dev && dev->ubi_num =3D=3D vol_info->ubi_num &&
+		    dev->vol_id =3D=3D vol_info->vol_id)
+			break;
+	}
+	if (i =3D=3D UBIBLK_MAX_DEVS) {
+		pr_warn("Trying to remove %s, which is unknown from ubiblk\n",
+			vol_info->name);
+		return -ENODEV;
+	}
+
+	pr_info("ubiblk: Removing %s\n", vol_info->name);
+
+	if (dev->vol_desc) {
+		ubi_close_volume(dev->vol_desc);
+		dev->vol_desc =3D NULL;
+	}
+
+	del_gendisk(dev->gd);
+	blk_cleanup_queue(dev->rq);
+	kthread_stop(dev->thread);
+	put_disk(dev->gd);
+
+	kfree(dev->vol_info);
+
+	kfree(ubiblk_devs[i]);
+	ubiblk_devs[i] =3D NULL;
+
+	mutex_unlock(&devtable_lock);
+	return 0;
+}
+
+static int ubiblk_resized(struct ubi_volume_info *vol_info)
+{
+	struct ubiblk_dev *dev;
+
+	dev =3D ubiblk_find_dev(vol_info);
+	if (!dev) {
+		pr_warn("Trying to resize %s, which is unknown from ubiblk\n",
+			vol_info->name);
+		return -ENODEV;
+	}
+
+	mutex_lock(&dev->lock);
+	set_capacity(dev->gd,
+		     (vol_info->size * vol_info->usable_leb_size) >> 9);
+	mutex_unlock(&dev->lock);
+	pr_debug("Resized ubiblk%d_%d to %d LEBs\n", vol_info->ubi_num,
+		 vol_info->vol_id, vol_info->size);
+	return 0;
+}
+
+/*
+ * Dispatches the UBI notifications
+ * copied from gluebi.c
+ */
+static int ubiblk_notify(struct notifier_block *nb,
+			 unsigned long notification_type, void *ns_ptr)
+{
+	struct ubi_notification *nt =3D ns_ptr;
+
+	switch (notification_type) {
+	case UBI_VOLUME_ADDED:
+		ubiblk_create(&nt->di, &nt->vi);
+		break;
+	case UBI_VOLUME_REMOVED:
+		ubiblk_remove(&nt->vi);
+		break;
+	case UBI_VOLUME_RESIZED:
+		ubiblk_resized(&nt->vi);
+		break;
+	case UBI_VOLUME_UPDATED:
+		break;
+	case UBI_VOLUME_RENAMED:
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
+/*
+ * Initialize the module
+ * (Get a major number and register to UBI notifications)
+ */
+static int __init ubi_ubiblk_init(void)
+{
+	int ret =3D 0;
+
+	pr_info("UBIBLK starting\n");
+
+	ret =3D register_blkdev(0, "ubiblk");
+	if (ret <=3D 0) {
+		pr_err("UBIBLK: could not register_blkdev\n");
+		return -ENODEV;
+	}
+	major =3D ret;
+	pr_info("UBIBLK: device's major: %d\n", major);
+
+	mutex_init(&devtable_lock);
+	ret =3D ubi_register_volume_notifier(&ubiblk_notifier, 0);
+	if (ret < 0)
+		unregister_blkdev(major, "ubiblk");
+
+	return ret;
+}
+
+/*
+ * End of life
+ * unregister the block device major, unregister from UBI notification=
s,
+ * stop the threads and free the memory.
+ */
+static void __exit ubi_ubiblk_exit(void)
+{
+	int i;
+
+	pr_info("UBIBLK: going to exit\n");
+
+	ubi_unregister_volume_notifier(&ubiblk_notifier);
+
+	for (i =3D 0; i < UBIBLK_MAX_DEVS; i++) {
+		struct ubiblk_dev *dev =3D ubiblk_devs[i];
+		if (!dev)
+			continue;
+
+		if (dev->vol_desc)
+			ubi_close_volume(dev->vol_desc);
+
+		del_gendisk(dev->gd);
+		blk_cleanup_queue(dev->rq);
+		kthread_stop(dev->thread);
+		put_disk(dev->gd);
+
+		kfree(dev->vol_info);
+		kfree(ubiblk_devs[i]);
+	}
+
+	unregister_blkdev(major, "ubiblk");
+	pr_info("UBIBLK: The End\n");
+}
+
+module_init(ubi_ubiblk_init);
+module_exit(ubi_ubiblk_exit);
+MODULE_DESCRIPTION("Read-only block transition layer on top of UBI");
+MODULE_AUTHOR("David Wagner");
+MODULE_LICENSE("GPL");
--=20
1.7.0.4
