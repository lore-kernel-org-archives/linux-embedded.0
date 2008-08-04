From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [patch 2/4] Configure out file locking features
Date: Mon, 4 Aug 2008 15:52:37 +0200
Message-ID: <20080804155237.1f64892d@surf>
References: <20080731092703.661994657@free-electrons.com>
	<20080731093220.969460336@free-electrons.com>
	<20080802163848.GB30454@fieldses.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080802163848.GB30454@fieldses.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, michael@free-electrons.com, Matt Mackall <mpm@selenic.com>, matthew@wil.cx, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org

Le Sat, 2 Aug 2008 12:38:48 -0400,
"J. Bruce Fields" <bfields@fieldses.org> a =C3=A9crit :

> Out of curiosity, why does the nfs client need disabling, but not
> nfsd, gfs2, fuse, etc.?

Then also need disabling. Updated patch below.

Thanks!

Thomas

---

Configure out file locking features

This patch adds the CONFIG_FILE_LOCKING option which allows to remove
support for advisory locks. With this patch enabled, the flock()
system call, the F_GETLK, F_SETLK and F_SETLKW operations of fcntl()
and NFS support are disabled. These features are not necessarly needed
on embedded systems. It allows to save ~11 Kb of kernel code and data:

   text	   data	    bss	    dec	    hex	filename
1125436	 118764	 212992	1457192	 163c28	vmlinux.old
1114299	 118564	 212992	1445855	 160fdf	vmlinux
 -11137    -200       0  -11337   -2C49 +/-

This patch has originally been written by Matt Mackall
<mpm@selenic.com>, and is part of the Linux Tiny project.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Matt Mackall <mpm@selenic.com>
Cc: matthew@wil.cx
Cc: linux-fsdevel@vger.kernel.org
Cc: mpm@selenic.com
Cc: akpm@linux-foundation.org

---
 fs/Kconfig          |   15 ++++++++++++++-
 fs/Makefile         |    3 ++-
 fs/dlm/Kconfig      |    1 +
 fs/gfs2/Kconfig     |    1 +
 fs/proc/proc_misc.c |    4 ++++
 include/linux/fs.h  |   52 +++++++++++++++++++++++++++++++++++++++++++=
++-------
 kernel/sys_ni.c     |    1 +
 kernel/sysctl.c     |    6 +++++-
 8 files changed, 73 insertions(+), 10 deletions(-)

Index: linuxdev/fs/Kconfig
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linuxdev.orig/fs/Kconfig
+++ linuxdev/fs/Kconfig
@@ -427,12 +427,21 @@
 	bool
 	default n
=20
+config FILE_LOCKING
+	bool "Enable POSIX file locking API" if EMBEDDED
+	default y
+	help
+	  This option enables standard file locking support, required
+          for filesystems like NFS and for the flock() system
+          call. Disabling this option saves about 11k.
+
 source "fs/xfs/Kconfig"
 source "fs/gfs2/Kconfig"
=20
 config OCFS2_FS
 	tristate "OCFS2 file system support"
 	depends on NET && SYSFS
+	depends on FILE_LOCKING
 	select CONFIGFS_FS
 	select JBD
 	select CRC32
@@ -642,6 +651,7 @@
=20
 config FUSE_FS
 	tristate "Filesystem in Userspace support"
+	depends on FILE_LOCKING
 	help
 	  With FUSE it is possible to implement a fully functional filesystem
 	  in a userspace program.
@@ -1567,7 +1577,7 @@
=20
 config NFS_FS
 	tristate "NFS client support"
-	depends on INET
+	depends on INET && FILE_LOCKING
 	select LOCKD
 	select SUNRPC
 	select NFS_ACL_SUPPORT if NFS_V3_ACL
@@ -1735,6 +1745,7 @@
=20
 config LOCKD
 	tristate
+	depends on FILE_LOCKING
=20
 config LOCKD_V4
 	bool
@@ -1870,6 +1881,7 @@
 config CIFS
 	tristate "CIFS support (advanced network filesystem, SMBFS successor)=
"
 	depends on INET
+	depends on FILE_LOCKING
 	select NLS
 	help
 	  This is the client VFS module for the Common Internet File System
@@ -2059,6 +2071,7 @@
 config AFS_FS
 	tristate "Andrew File System support (AFS) (EXPERIMENTAL)"
 	depends on INET && EXPERIMENTAL
+	depends on FILE_LOCKING
 	select AF_RXRPC
 	help
 	  If you say Y here, you will get an experimental Andrew File System
Index: linuxdev/fs/Makefile
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linuxdev.orig/fs/Makefile
+++ linuxdev/fs/Makefile
@@ -7,7 +7,7 @@
=20
 obj-y :=3D	open.o read_write.o file_table.o super.o \
 		char_dev.o stat.o exec.o pipe.o namei.o fcntl.o \
-		ioctl.o readdir.o select.o fifo.o locks.o dcache.o inode.o \
+		ioctl.o readdir.o select.o fifo.o dcache.o inode.o \
 		attr.o bad_inode.o file.o filesystems.o namespace.o \
 		seq_file.o xattr.o libfs.o fs-writeback.o \
 		pnode.o drop_caches.o splice.o sync.o utimes.o \
@@ -28,6 +28,7 @@
 obj-$(CONFIG_TIMERFD)		+=3D timerfd.o
 obj-$(CONFIG_EVENTFD)		+=3D eventfd.o
 obj-$(CONFIG_AIO)               +=3D aio.o
+obj-$(CONFIG_FILE_LOCKING)      +=3D locks.o
 obj-$(CONFIG_COMPAT)		+=3D compat.o compat_ioctl.o
=20
 nfsd-$(CONFIG_NFSD)		:=3D nfsctl.o
Index: linuxdev/fs/dlm/Kconfig
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linuxdev.orig/fs/dlm/Kconfig
+++ linuxdev/fs/dlm/Kconfig
@@ -2,6 +2,7 @@
 	tristate "Distributed Lock Manager (DLM)"
 	depends on EXPERIMENTAL && INET
 	depends on SYSFS && (IPV6 || IPV6=3Dn)
+	depends on FILE_LOCKING
 	select CONFIGFS_FS
 	select IP_SCTP
 	help
Index: linuxdev/fs/gfs2/Kconfig
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linuxdev.orig/fs/gfs2/Kconfig
+++ linuxdev/fs/gfs2/Kconfig
@@ -1,6 +1,7 @@
 config GFS2_FS
 	tristate "GFS2 file system support"
 	depends on EXPERIMENTAL && (64BIT || (LSF && LBD))
+	depends on FILE_LOCKING
 	select FS_POSIX_ACL
 	select CRC32
 	help
Index: linuxdev/fs/proc/proc_misc.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linuxdev.orig/fs/proc/proc_misc.c
+++ linuxdev/fs/proc/proc_misc.c
@@ -677,6 +677,7 @@
 	return proc_calc_metrics(page, start, off, count, eof, len);
 }
=20
+#ifdef CONFIG_FILE_LOCKING
 static int locks_open(struct inode *inode, struct file *filp)
 {
 	return seq_open(filp, &locks_seq_operations);
@@ -688,6 +689,7 @@
 	.llseek		=3D seq_lseek,
 	.release	=3D seq_release,
 };
+#endif /* CONFIG_FILE_LOCKING */
=20
 static int execdomains_read_proc(char *page, char **start, off_t off,
 				 int count, int *eof, void *data)
@@ -881,7 +883,9 @@
 #ifdef CONFIG_PRINTK
 	proc_create("kmsg", S_IRUSR, NULL, &proc_kmsg_operations);
 #endif
+#ifdef CONFIG_FILE_LOCKING
 	proc_create("locks", 0, NULL, &proc_locks_operations);
+#endif
 	proc_create("devices", 0, NULL, &proc_devinfo_operations);
 	proc_create("cpuinfo", 0, NULL, &proc_cpuinfo_operations);
 #ifdef CONFIG_BLOCK
Index: linuxdev/include/linux/fs.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linuxdev.orig/include/linux/fs.h
+++ linuxdev/include/linux/fs.h
@@ -983,6 +983,13 @@
=20
 #include <linux/fcntl.h>
=20
+extern void send_sigio(struct fown_struct *fown, int fd, int band);
+
+/* fs/sync.c */
+extern int do_sync_mapping_range(struct address_space *mapping, loff_t=
 offset,
+			loff_t endbyte, unsigned int flags);
+
+#ifdef CONFIG_FILE_LOCKING
 extern int fcntl_getlk(struct file *, struct flock __user *);
 extern int fcntl_setlk(unsigned int, struct file *, unsigned int,
 			struct flock __user *);
@@ -993,14 +1000,9 @@
 			struct flock64 __user *);
 #endif
=20
-extern void send_sigio(struct fown_struct *fown, int fd, int band);
 extern int fcntl_setlease(unsigned int fd, struct file *filp, long arg=
);
 extern int fcntl_getlease(struct file *filp);
=20
-/* fs/sync.c */
-extern int do_sync_mapping_range(struct address_space *mapping, loff_t=
 offset,
-			loff_t endbyte, unsigned int flags);
-
 /* fs/locks.c */
 extern void locks_init_lock(struct file_lock *);
 extern void locks_copy_lock(struct file_lock *, struct file_lock *);
@@ -1023,6 +1025,33 @@
 extern int lock_may_read(struct inode *, loff_t start, unsigned long c=
ount);
 extern int lock_may_write(struct inode *, loff_t start, unsigned long =
count);
 extern struct seq_operations locks_seq_operations;
+#else /* !CONFIG_FILE_LOCKING */
+#define fcntl_getlk(a, b) (-EINVAL)
+#define fcntl_setlk(a, b, c, d) (-EACCES)
+#if BITS_PER_LONG =3D=3D 32
+#define fcntl_getlk64(a, b) (-EINVAL)
+#define fcntl_setlk64(a, b, c, d) (-EACCES)
+#endif
+#define fcntl_setlease(a, b, c) (0)
+#define fcntl_getlease(a) (0)
+#define locks_init_lock(a)
+#define locks_copy_lock(a, b)
+#define locks_remove_posix(a, b)
+#define locks_remove_flock(a)
+#define posix_test_lock(a, b) (0)
+#define posix_lock_file(a, b) (-ENOLCK)
+#define posix_lock_file_wait(a, b) (-ENOLCK)
+#define posix_unblock_lock(a, b) (-ENOENT)
+#define vfs_test_lock(a, b) (0)
+#define vfs_lock_file(a, b, c, d) (-ENOLCK)
+#define vfs_cancel_lock(a, b) (0)
+#define flock_lock_file_wait(a, b) (-ENOLCK)
+#define __break_lease(a, b) (0)
+#define lease_get_mtime(a, b)
+#define lock_may_read(a, b, c) (1)
+#define lock_may_write(a, b, c) (1)
+#endif /* !CONFIG_FILE_LOCKING */
+
=20
 struct fasync_struct {
 	int	magic;
@@ -1554,9 +1583,12 @@
 /* /sys/fs */
 extern struct kobject *fs_kobj;
=20
+extern int rw_verify_area(int, struct file *, loff_t *, size_t);
+
 #define FLOCK_VERIFY_READ  1
 #define FLOCK_VERIFY_WRITE 2
=20
+#ifdef CONFIG_FILE_LOCKING
 extern int locks_mandatory_locked(struct inode *);
 extern int locks_mandatory_area(int, struct inode *, struct file *, lo=
ff_t, size_t);
=20
@@ -1587,8 +1619,6 @@
 	return 0;
 }
=20
-extern int rw_verify_area(int, struct file *, loff_t *, size_t);
-
 static inline int locks_verify_truncate(struct inode *inode,
 				    struct file *filp,
 				    loff_t size)
@@ -1609,6 +1639,14 @@
 		return __break_lease(inode, mode);
 	return 0;
 }
+#else /* !CONFIG_FILE_LOCKING */
+#define locks_mandatory_locked(a) (0)
+#define locks_mandatory_area(a, b, c, d, e) (0)
+#define mandatory_lock(a) (0)
+#define locks_verify_locked(a) (0)
+#define locks_verify_truncate(a, b, c) (0)
+#define break_lease(a, b) (0)
+#endif /* CONFIG_FILE_LOCKING */
=20
 /* fs/open.c */
=20
Index: linuxdev/kernel/sys_ni.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linuxdev.orig/kernel/sys_ni.c
+++ linuxdev/kernel/sys_ni.c
@@ -130,6 +130,7 @@
 cond_syscall(sys_io_submit);
 cond_syscall(sys_io_cancel);
 cond_syscall(sys_io_getevents);
+cond_syscall(sys_flock);
=20
 /* arch-specific weak syscall entries */
 cond_syscall(sys_pciconfig_read);
Index: linuxdev/kernel/sysctl.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linuxdev.orig/kernel/sysctl.c
+++ linuxdev/kernel/sysctl.c
@@ -97,7 +97,7 @@
 static int neg_one =3D -1;
 #endif
=20
-#ifdef CONFIG_MMU
+#if defined(CONFIG_MMU) && defined(CONFIG_FILE_LOCKING)
 static int two =3D 2;
 #endif
=20
@@ -1260,6 +1260,7 @@
 		.extra1		=3D &minolduid,
 		.extra2		=3D &maxolduid,
 	},
+#ifdef CONFIG_FILE_LOCKING
 	{
 		.ctl_name	=3D FS_LEASES,
 		.procname	=3D "leases-enable",
@@ -1268,6 +1269,7 @@
 		.mode		=3D 0644,
 		.proc_handler	=3D &proc_dointvec,
 	},
+#endif
 #ifdef CONFIG_DNOTIFY
 	{
 		.ctl_name	=3D FS_DIR_NOTIFY,
@@ -1279,6 +1281,7 @@
 	},
 #endif
 #ifdef CONFIG_MMU
+#ifdef CONFIG_FILE_LOCKING
 	{
 		.ctl_name	=3D FS_LEASE_TIME,
 		.procname	=3D "lease-break-time",
@@ -1290,6 +1293,7 @@
 		.extra1		=3D &zero,
 		.extra2		=3D &two,
 	},
+#endif /* CONFIG_FILE_LOCKING */
 #ifdef CONFIG_AIO
 	{
 		.procname	=3D "aio-nr",


--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
