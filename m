From: Samo Pogacnik <samo_pogacnik@t-2.net>
Subject: [PATCH] mlock_everything
Date: Fri, 21 Aug 2009 01:50:09 +0200
Message-ID: <1250812209.2479.220.camel@itpsd6lap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi,

This patch tries to provide the functionality for locking of all used
memory of all living processes/threads into RAM. It creates an
additional proc file named "/proc/sys/vm/mlock_everything". Every write
to this file calls the do_mlock_everything() function, which scans all
processes and threads and their VMAs. For each task (process or thread),
locking is performed almost like mlockall(MCL_CURRENT | MCL_FUTURE)
would have been called by each process but without checking the limits.
Reads from this proc file return two numbers. The first number tells how
many writes (do_mlock_everything() requests) have been already performed
since the system startup. The second number shows how many VM_LOCKED
flags had been set to different VMAs during the last locking request.

So, why all this? Maybe this is not the best idea but enabling the
do_mlock_everything() after the initialization phase of the system
startup prevents system trashing in the OOM situation before the
oom_killer does its job on an embedded system (typically without swap,
running a fixed set of processes with maybe some RT requirements, ...).

Is there another way to prevent unloading of any existing process'es
memory segment backed up by a file on a filesystem (i.e. from a dynamic
loadable shared object), when the system approaches the OOM situation?

I am not sure about the correctness of the do_mlock_everything()
implementation in the patch. Are there any strange implications of such
functionality? Would it be sensible to have the possibility for a global
lock flag, which would automatically set lock flags to all future
processes as they would have been created?

Any comments and suggestions would be very much appreciated, thank you. 

The patch is below.

regards, Samo

diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index e76d3b2..91b21be 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -205,6 +205,7 @@ enum
 	VM_PANIC_ON_OOM=33,	/* panic at out-of-memory */
 	VM_VDSO_ENABLED=34,	/* map VDSO into new processes? */
 	VM_MIN_SLAB=35,		 /* Percent pages ignored by zone reclaim */
+	VM_MLOCK_EVERYTHING=36,	/* Lock all memory currently mapped by tasks
*/
 };
 
 
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index e5bfcc7..cfe8de2 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -77,6 +77,8 @@ extern int suid_dumpable;
 extern char core_pattern[];
 extern int pid_max;
 extern int min_free_kbytes;
+extern int sysctl_mlock_everything[2];
+extern int mlock_everything_sysctl_handler(ctl_table *, int, struct
file *, void __user *, size_t *, loff_t *);
 extern int pid_max_min, pid_max_max;
 extern int sysctl_drop_caches;
 extern int percpu_pagelist_fraction;
@@ -1109,6 +1111,15 @@ static struct ctl_table vm_table[] = {
 		.extra1		= &zero,
 	},
 	{
+		.ctl_name	= VM_MLOCK_EVERYTHING,
+		.procname	= "mlock_everything",
+		.data		= &sysctl_mlock_everything,
+		.maxlen		= sizeof(sysctl_mlock_everything),
+		.mode		= 0644,
+		.proc_handler	= mlock_everything_sysctl_handler,
+		.strategy	= &sysctl_intvec,
+	},
+	{
 		.ctl_name	= VM_PERCPU_PAGELIST_FRACTION,
 		.procname	= "percpu_pagelist_fraction",
 		.data		= &percpu_pagelist_fraction,
diff --git a/kernel/sysctl_check.c b/kernel/sysctl_check.c
index b38423c..019d788 100644
--- a/kernel/sysctl_check.c
+++ b/kernel/sysctl_check.c
@@ -135,6 +135,7 @@ static const struct trans_ctl_table trans_vm_table[]
= {
 	{ VM_PANIC_ON_OOM,		"panic_on_oom" },
 	{ VM_VDSO_ENABLED,		"vdso_enabled" },
 	{ VM_MIN_SLAB,			"min_slab_ratio" },
+	{ VM_MLOCK_EVERYTHING,		"mlock_everything" },
 
 	{}
 };
diff --git a/mm/mlock.c b/mm/mlock.c
index cbe9e05..2baace7 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -678,3 +678,56 @@ void free_locked_buffer(void *buffer, size_t size)
 
 	kfree(buffer);
 }
+
+/*
+ * This function scans all mapped vma-s of all existing tasks and sets
their
+ * default (future mapped areas) and already mapped areas flags to
VM_LOCKED.
+ */ 
+int do_mlock_everything(void)
+{
+	struct task_struct *g, *p;
+	struct vm_area_struct * vma;
+	int count = 0;
+
+	do_each_thread(g, p)
+		if (p->pid && p->mm) {
+			down_write(&p->mm->mmap_sem);
+			read_lock(&tasklist_lock);
+			task_lock(p);
+			p->mm->def_flags = VM_LOCKED;
+
+			for (vma = p->mm->mmap; vma ; vma = vma->vm_next) {
+				if (vma->vm_flags & VM_LOCKED)
+					continue;
+				vma->vm_flags |= VM_LOCKED;
+				count++;
+			}
+
+			task_unlock(p);
+			read_unlock(&tasklist_lock);
+			up_write(&p->mm->mmap_sem);
+		}
+	while_each_thread(g, p);
+	return count;
+}
+
+/*
+ * Syctl handler for do_mlock_everything().
+ */
+int sysctl_mlock_everything[2] = {
+	0, /* subsequent request for mlock everything */
+	0  /* number of VMAs locked in the last mlock everything request */
+};
+static int mlock_everything_count = 0;
+
+int mlock_everything_sysctl_handler(ctl_table *table, int write, 
+	struct file *file, void __user *buffer, size_t *length, loff_t *ppos)
+{
+	proc_dointvec(table, write, file, buffer, length, ppos);
+	if (write) {
+		sysctl_mlock_everything[0] = ++mlock_everything_count;
+		sysctl_mlock_everything[1] = do_mlock_everything();
+	}
+	return 0;
+}
+

