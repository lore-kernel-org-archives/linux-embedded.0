From: Phillip Lougher <phillip.lougher@gmail.com>
Subject: Re: RFC: direct MTD support for SquashFS
Date: Thu, 18 Mar 2010 21:40:45 +0000
Message-ID: <bffbecbb1003181440kc78f4dbvd25d4e2ea17b52e5@mail.gmail.com>
References: <87vdcwv139.fsf@tac.ki.iif.hu> <87ljdsibqe.fsf@macbook.be.48ers.dk>
	 <87r5nhziss.fsf@tac.ki.iif.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=iRYiw9y4KkIluUL8OMqD9Th3+Isaq+0rJL6Y83BkjRw=;
        b=fOZ9o8bQyFY5fksBtmJdYNHxRcyeoy+FlfEfZ4iZNgGYri5HvyPuM5s6MuRSdkiBzt
         MUMkqDY/el2HBFjfa6PlV/EYcPLSzhByEGE/BnmL3dN+pdJrccId+5cgqJM+PHyApY33
         zuJb9s3boxW6AcIScsSf8OmXRThY0FPBPmDGk=
In-Reply-To: <87r5nhziss.fsf@tac.ki.iif.hu>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ferenc Wagner <wferi@niif.hu>
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>, Peter Korsgaard <jacmet@sunsite.dk>, linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Thu, Mar 18, 2010 at 4:38 PM, Ferenc Wagner <wferi@niif.hu> wrote:
>
> I could only compare apples to oranges before porting the patch to th=
e
> LZMA variant. =A0So I refrain from that for a couple of days yet. =A0=
But
> meanwhile I started adding a pluggable backend framework to SquashFS,
> and would much appreciate some comments about the applicability of th=
is
> idea. =A0The patch is (intended to be) a no-op, applies on top of cur=
rent
> git (a3d3203e4bb40f253b1541e310dc0f9305be7c84).

This looks promising, making the backend pluggable (like the new
compressor framework) is far better and cleaner than scattering the
code full of #ifdef's.  Far better than the previous patch :-)

A couple of specific comments...

+/* A backend is initialized for each SquashFS block read operation,
+ * making further sequential reads possible from the block.
+ */
+static void *bdev_init(struct squashfs_sb_info *msblk, u64 index,
size_t length)
+{
+	struct squashfs_bdev *bdev =3D msblk->backend_data;
+	struct buffer_head *bh;
+
+	bh =3D kcalloc((msblk->block_size >> bdev->devblksize_log2) + 1,
+			sizeof(*bh), GFP_KERNEL);

You should alloc against the larger of msblk->block_size and
METADATA_SIZE (8 Kbytes).  Block_size could be 4 Kbytes only.

+static int fill_bdev_super(struct super_block *sb, void *data, int sil=
ent)
+{
+	struct squashfs_sb_info *msblk;
+	struct squashfs_bdev *bdev;
+	int err =3D squashfs_fill_super2(sb, data, silent, &squashfs_bdev_ops=
);
+	if (err)
+		return err;
+
+	bdev =3D kzalloc(sizeof(*bdev), GFP_KERNEL);
+	if (!bdev)
+		return -ENOMEM;
+
+	bdev->devblksize =3D sb_min_blocksize(sb, BLOCK_SIZE);
+	bdev->devblksize_log2 =3D ffz(~bdev->devblksize);
+
+	msblk =3D sb->s_fs_info;
+	msblk->backend_data =3D bdev;
+	return 0;
+}

This function looks rather 'back-to-front' to me.  I'm assuming that
squashfs_fill_super2() will be the current fill superblock function?
This function wants to read data off the filesystem through the
backend, and yet the backend (bdev, mblk->backend_data) hasn't been
initialised when it's called...

Phillip
