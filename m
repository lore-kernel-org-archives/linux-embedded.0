From: "Chan Jeong" <chan.jeong-Hm3cg6mZ9cc@public.gmane.org>
Subject: Re: [PATCH 1/2] Squashfs: add LZO decompression
	support
Date: Mon, 24 May 2010 15:53:03 +0900
Message-ID: <21896.8588313603$1274684021@news.gmane.org>
References: <001a01caf63e$0280ef50$0782cdf0$@jeong@lge.com>
	<4BF9E921.6090609@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <squashfs-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <4BF9E921.6090609-cnXvMjJKhjYG2Il/BtU0GPXRex20P6io@public.gmane.org>
Content-Language: ko
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
	<mailto:squashfs-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:squashfs-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
	<mailto:squashfs-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: squashfs-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: 'Phillip Lougher' <phillip-cnXvMjJKhjYG2Il/BtU0GPXRex20P6io@public.gmane.org>
Cc: 'Hyo Jun Im' <hyojun.im-Hm3cg6mZ9cc@public.gmane.org>, squashfs-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, 'Tim Bird' <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, linux-embedded-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Gunho Lee' <gunho.lee-Hm3cg6mZ9cc@public.gmane.org>

> Chan Jeong wrote:
> > Hi,
> >
> > This patch series adds LZO decompression support to Squashfs,
> > using in-kernel LZO decompression library and Squashfs
> > decompressor entries.
> >
> > The patch series also includes LZO support for Squashfs tools.
> >
> > Signed-off-by: Chan Jeong <chan.jeong-Hm3cg6mZ9cc@public.gmane.org>
> 
> Hi Chan
> 
> Thanks for the patches.  How much testing have these patches had?
>  From an eyeball of the code (and a check of the LZO decompressor
> code in the kernel) they look OK.
> 
> I'm currently considering whether to push these for mainline in
> the current 2.6.35 merge window.  I'd like to push them in this
> merge window, however, pushing them now is definitely cutting things
> fine because they were only posted for review after the merge window
> opened (and the established etiquette is the merge window is to push
> things that were posted for review and ideally in linux-next well
> before the merge window opened).
> 
> So, some idea of how much testing these patches have had would
> increase my confidence about pushing them in this merge window.
> 
> Thanks
> 
> Phillip

Hi Phillip,

Thank you for your feedback. I have done much testing with those
patches on X86 PCs and a MIPS-based TV product.

Actually the TV product has been working fine with Squashfs-zlib
filesystem images, and after replacement with lzo images, it is
running good for long-run test and all TV functions such as video,
audio, UI and networking are working fine as well.

And Here is just clean-up for the first patch. The kcalloc() is
safer for lzo workspace pointer array, because it returns zeroed
memory.

Thanks,
Chan Jeong

--
diff --git a/fs/squashfs/lzo_wrapper.c b/fs/squashfs/lzo_wrapper.c
index 6577cfa..02a767a 100644
--- a/fs/squashfs/lzo_wrapper.c
+++ b/fs/squashfs/lzo_wrapper.c
@@ -38,7 +38,7 @@ static void *lzo_init(struct squashfs_sb_info *msblk)
 {
 	void **streams;
 
-	streams = (void **)kmalloc(sizeof(void *) * 2, GFP_KERNEL);
+	streams = (void **)kcalloc(2, sizeof(void *), GFP_KERNEL);
 	if (streams == NULL)
 		goto failed;
 
@@ -56,11 +56,9 @@ static void *lzo_init(struct squashfs_sb_info *msblk)
 
 failed:
 	ERROR("Failed to allocate lzo workspace\n");
-	if (streams) {
-		if (streams[0])
-			vfree(streams[0]);
-		kfree(streams);
-	}
+	if (streams)
+		vfree(streams[0]);
+	kfree(streams);
 	return NULL;
 }
 
@@ -68,8 +66,11 @@ failed:
 static void lzo_free(void *stream)
 {
 	void **streams = (void **)stream;
-	vfree(streams[1]);
-	vfree(streams[0]);
+
+	if (streams) {
+		vfree(streams[1]);
+		vfree(streams[0]);
+	}
 	kfree(streams);
 }
 


------------------------------------------------------------------------------
