From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: A better way to sequence driver initialization?
Date: Fri, 09 Apr 2010 23:19:52 -0500
Message-ID: <4BBFFC68.8000801@billgatliff.com>
References: <4BBF7E9C.80604@billgatliff.com> <4BBFF66D.7020206@billgatliff.com> <4BBFF789.3030201@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4BBFF789.3030201@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux-embedded <linux-embedded@vger.kernel.org>

Bill Gatliff wrote:
>
> ... and kset_register() might be the only place that calls
> wake_up_interruptible().  Wow.
>   

Wow, indeed.  With just the attached patch, I get exactly one OOPS
now--- in ssc_free(), which I think is getting called because
atmel_ssc_modinit() is racing with something.

I wasn't able to get all the way to mounting my NFS rootfs, I think
because I'm getting to ip_auto_config() before my ethernet controller
has registered!  :)


$ git diff lib/kobject.c
diff --git a/lib/kobject.c b/lib/kobject.c
index b512b74..e75556c 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -18,6 +18,10 @@
 #include <linux/stat.h>
 #include <linux/slab.h>

+#include <linux/sched.h>
+#include <linux/wait.h>
+DECLARE_WAIT_QUEUE_HEAD(kset_wait);
+
 /*
  * populate_dir - populate directory with attributes.
  * @kobj: object we're working on.
@@ -721,6 +725,7 @@ int kset_register(struct kset *k)
        if (err)
                return err;
        kobject_uevent(&k->kobj, KOBJ_ADD);
+       wake_up_interruptible(&kset_wait);
        return 0;
 }

@@ -744,7 +749,7 @@ void kset_unregister(struct kset *k)
  * looking for a matching kobject. If matching object is found
  * take a reference and return the object.
  */
-struct kobject *kset_find_obj(struct kset *kset, const char *name)
+struct kobject *__kset_find_obj(struct kset *kset, const char *name)
 {
        struct kobject *k;
        struct kobject *ret = NULL;
@@ -760,6 +765,14 @@ struct kobject *kset_find_obj(struct kset *kset,
const char *name)
        return ret;
 }

+struct kobject *kset_find_obj(struct kset *kset, const char *name)
+{
+       struct kobject *ret = NULL;
+       wait_event_interruptible(kset_wait, (ret = __kset_find_obj(kset,
name)));
+       return ret;
+}
+
 static void kset_release(struct kobject *kobj)
 {
        struct kset *kset = container_of(kobj, struct kset, kobj);


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
