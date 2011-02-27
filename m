From: Tony Ibbs <tibs@tonyibbs.co.uk>
Subject: [PATCH 3/5] Kconfig files and Makefile for KBUS
Date: Sun, 27 Feb 2011 18:11:46 +0000
Message-ID: <97f70d8d0a9026658bb08d8bb4b054124553a0cb.1298829754.git.tibs@tonyibbs.co.uk>
References: <cover.1298829754.git.tibs@tonyibbs.co.uk>
 <ab146dd857b6cfa607b0ea426e1c99ddcebb756a.1298829754.git.tibs@tonyibbs.co.uk>
 <9d2ffc1567208d8890d7ef28f93f7a8914d753af.1298829754.git.tibs@tonyibbs.co.uk>
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <9d2ffc1567208d8890d7ef28f93f7a8914d753af.1298829754.git.tibs@tonyibbs.co.uk>
In-Reply-To: <cover.1298829754.git.tibs@tonyibbs.co.uk>
References: <cover.1298829754.git.tibs@tonyibbs.co.uk>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-embedded <linux-embedded@vger.kernel.org>
Cc: Tibs at Kynesim <tibs@kynesim.co.uk>, Richard Watts <rrw@kynesim.co.uk>, Grant Likely <grant.likely@secretlab.ca>

From: Tibs <tibs@tonyibbs.co.uk>

Amend the ipc Makefile.
Add an ipc Kconfig for KBUS.
Amend the init Kconfig appropriately.

Signed-off-by: Tony Ibbs <tibs@tonyibbs.co.uk>
---
 init/Kconfig |    3 ++
 ipc/Kconfig  |   99 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 ipc/Makefile |    5 +++
 3 files changed, 107 insertions(+), 0 deletions(-)
 create mode 100644 ipc/Kconfig

diff --git a/init/Kconfig b/init/Kconfig
index c972899..a31a6fe 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -339,6 +339,8 @@ config AUDIT_TREE
 	depends on AUDITSYSCALL
 	select FSNOTIFY
 
+source "ipc/Kconfig"
+
 source "kernel/irq/Kconfig"
 
 menu "RCU Subsystem"
@@ -1305,3 +1307,4 @@ config PADATA
 	bool
 
 source "kernel/Kconfig.locks"
+
diff --git a/ipc/Kconfig b/ipc/Kconfig
new file mode 100644
index 0000000..46ebcda
--- /dev/null
+++ b/ipc/Kconfig
@@ -0,0 +1,99 @@
+config KBUS
+        tristate "KBUS messaging system"
+        default m
+        ---help---
+	KBUS is a lightweight messaging system, particularly aimed
+	at embedded platforms. This option provides the kernel support
+	for mediating messages between client processes.
+
+	If you want KBUS support, you should say Y here.
+
+	This support can also be built as a module. If so, the module
+	will be called kbus.
+
+if KBUS
+
+config KBUS_DEBUG
+	bool "Make KBUS debugging messages available"
+	default y
+	---help---
+	This is the master switch for KBUS debug kernel messages -
+	if turned off, all debug messages will be compiled out.
+
+	In order for debugging messages to be emitted, they must
+	be enabled per-device with the KBUS_IOC_VERBOSE ioctl,
+	or by default by CONFIG_KBUS_DEBUG_DEFAULT_VERBOSE.
+
+	If unsure, say Y.
+
+config KBUS_DEBUG_DEFAULT_VERBOSE
+	bool "Output KBUS debug messages by default"
+	depends on KBUS_DEBUG
+	default n
+	---help---
+	This switch is the default setting for whether KBUS devices will
+	emit debugging messages. Note that debug messages may be turned
+	on and off per-device at runtime with the KBUS_IOC_VERBOSE ioctl.
+
+	If unsure, say N.
+
+config KBUS_DEF_NUM_DEVICES
+	int "Number of KBUS devices to auto-create"
+	default 1
+	range 1 KBUS_MAX_NUM_DEVICES
+	---help---
+	This specifies the number of KBUS devices that will be automatically
+	created when the kbus subsystem initialises (when the module is
+	is loaded or the kernel booted, as appropriate).
+
+	If kbus is built as a module, this number may also be given as a
+	parameter, for example kbus_num_devices=5.
+
+config KBUS_MAX_NUM_DEVICES
+	int "Maximum number of KBUS devices"
+	default 256
+	range 1 2147483647
+	# We don't impose a limit on the max, so if you've got enough
+	# RAM the only practical limit will be the (int) minor count
+	# passed to __register_chrdev_region.
+	---help---
+	Specify the maximum number of KBUS devices to support.
+	Note that this setting controls the size of an array of pointers
+	to in-kernel kbus structs; reducing it only saves a tiny amount
+	of RAM.
+
+config KBUS_DEF_MAX_MESSAGES
+	int "Default KBUS message queue size limit"
+	default 100
+	range 1 2147483647
+	---help---
+	Specify the default recipient message queue size limit.
+	This default is applied to all recipients (clients) whenever they
+	open or reopen a KBUS device node.
+
+	Clients sending messages may specify their desired behaviour in
+	the event that any of the recipient(s)' message queues is full;
+	if a sender's own queue is full, it may not send a message
+	flagged as a Request.  Refer to the documentation ("Queues filling
+	up") for details.
+
+	Clients may change their own queue size limits at any time with the
+	KBUS_IOC_MAXMSGS ioctl.
+
+config KBUS_MAX_UNSENT_UNBIND_MESSAGES
+	int "Maximum number of unsent KBUS unbind event messages"
+	default 1000
+	range 1 2147483647
+	---help---
+	KBUS devices may request (by ioctl) that they want to receive
+	notifications when listeners unbind. If such a notification happens
+	at a time when the device's message queue is full, it is instead
+	saved internally and delivered later. This setting limits the number
+	of messages which may be queued internally in that way; if the
+	limit is reached, a special "there were more unbind events than
+	we were able to deliver" message is queued for that listener,
+	and no more internal events are sent to them until that message
+	has been delivered.
+
+endif # KBUS
+
diff --git a/ipc/Makefile b/ipc/Makefile
index 9075e17..3b330eb 100644
--- a/ipc/Makefile
+++ b/ipc/Makefile
@@ -2,6 +2,10 @@
 # Makefile for the linux ipc.
 #
 
+ifeq ($(CONFIG_KBUS_DEBUG),y)
+	CFLAGS_kbus.o	= -DDEBUG
+endif
+
 obj-$(CONFIG_SYSVIPC_COMPAT) += compat.o
 obj-$(CONFIG_SYSVIPC) += util.o msgutil.o msg.o sem.o shm.o ipcns_notifier.o syscall.o
 obj-$(CONFIG_SYSVIPC_SYSCTL) += ipc_sysctl.o
@@ -9,4 +13,5 @@ obj_mq-$(CONFIG_COMPAT) += compat_mq.o
 obj-$(CONFIG_POSIX_MQUEUE) += mqueue.o msgutil.o $(obj_mq-y)
 obj-$(CONFIG_IPC_NS) += namespace.o
 obj-$(CONFIG_POSIX_MQUEUE_SYSCTL) += mq_sysctl.o
+obj-$(CONFIG_KBUS) += kbus.o
 
-- 
1.7.1
