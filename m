From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
Date: Fri, 22 Aug 2008 14:07:29 +0200
Message-ID: <20080822120729.GA319@mx.loc>
References: <48AD0101.4020505@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=Ah0bo6z4YSxLGRZg5v8zjd3hF59UigeSooGxlWPkMXI=;
        b=LqLe4/xcx11bII5ARlZCwxantcZLPpC+RV1sDp+b6pmLAfRHouTIv2OPhdFEGn1Bra
         PKtQVP3NCmFhZgrlutFz+eNZc7PnWGzzsiCAbPPe2bed27i5DwlIsJBbUgJaMQjhMbBD
         nmAghanhqZXoeXCRNZkVr2olQpm1ZoibF+ZLY=
Content-Disposition: inline
In-Reply-To: <48AD0101.4020505@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jared Hulbert <jaredeh@gmail.com>
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>, tim.bird@AM.SONY.COM, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Wed, Aug 20, 2008 at 10:45:37PM -0700, Jared Hulbert wrote:
>+static int axfs_get_onmedia_super(struct super_block *sb)
>+{
>+	int err;
>+	struct axfs_super *sbi = AXFS_SB(sb);
>+	struct axfs_super_onmedia *sbo;
>+
>+	sbo = kmalloc(sizeof(*sbo), GFP_KERNEL);
>+	if (!sbo)
>+		return -ENOMEM;
>+
>+	axfs_copy_metadata(sb, (void *)sbo, 0, sizeof(*sbo));
>+
>+	/* Do sanity checks on the superblock */
>+	if (be32_to_cpu(sbo->magic) != AXFS_MAGIC) {
>+		printk(KERN_ERR "axfs: wrong magic\n");
>+		err = -EINVAL;
>+		goto out;
>+	}
>+
>+	/* verify the signiture is correct */
>+	if (strncmp(sbo->signature, AXFS_SIGNATURE, sizeof(AXFS_SIGNATURE))) {
>+		printk(KERN_ERR "axfs: wrong axfs signature,"
>+		       " read %s, expected %s\n",
>+		       sbo->signature, AXFS_SIGNATURE);
>+		err = -EINVAL;
>+		goto out;
>+	}

As Phillip mentioned for some other cases, just initialize err to
EINVAL.
>+
>+	sbi->magic = be32_to_cpu(sbo->magic);
>+	sbi->version_major = sbo->version_major;
>+	sbi->version_minor = sbo->version_minor;
>+	sbi->version_sub = sbo->version_sub;
>+	sbi->files = be64_to_cpu(sbo->files);
>+	sbi->size = be64_to_cpu(sbo->size);
>+	sbi->blocks = be64_to_cpu(sbo->blocks);
>+	sbi->mmap_size = be64_to_cpu(sbo->mmap_size);
>+	sbi->cblock_size = be32_to_cpu(sbo->cblock_size);
>+	sbi->timestamp.tv_sec = be64_to_cpu(sbo->timestamp);
>+	sbi->timestamp.tv_nsec = 0;
>+	sbi->compression_type = sbo->compression_type;
>+
>+	err = axfs_set_compression_type(sbi);
>+	if (err)
>+		goto out;
>+
>+	/* If no block or MTD device, adjust mmapable to cover all image */
>+	if (AXFS_NODEV(sb))
>+		sbi->mmap_size = sbi->size;
>+
>+	err = axfs_fill_region_descriptors(sb, sbo);
[as already mentioned the clipped snippet here is unneeded]
>+out:
>+	kfree(sbo);
>+	return err;
>+}

>+int axfs_verify_device_sizes(struct super_block *sb)
>+{
>+	struct axfs_super *sbi = AXFS_SB(sb);
>+	struct mtd_info *mtd0 = AXFS_MTD(sb);
>+	struct mtd_info *mtd1 = AXFS_MTD1(sb);
>+	int sndsize = sbi->size - sbi->mmap_size;
>+
>+	/* Whole FS on one device */
>+	if (mtd0 && !mtd1 && (mtd0->size < sbi->size)) {
>+		printk(KERN_ERR "axfs: ERROR: Filesystem extends beyond end of"
>+		       "MTD! Filesystem cannot be safely mounted!\n");

missing space in "end ofMTD"
You're mixing the style of where you put such a space, so potential
errors are not easy to spot (manually).
e.g.:

>+			printk(KERN_ERR "axfs: ERROR: Mmap segment extends"
>+			       " beyond end of MTD!");
>+			printk(KERN_ERR "mtd name: %s, mtd size: 0x%x, mmap "
>+			       "size: 0x%llx",
>+			       mtd0->name, mtd0->size, sbi->mmap_size);

>+static int axfs_check_options(char *options, struct axfs_super *sbi)
>+{
>+	unsigned long address = 0;
>+	char *iomem = NULL;
>+	unsigned long length = 0;
>+	char *p;
>+	int err = -EINVAL;
>+	substring_t args[MAX_OPT_ARGS];
>+
>+	if (!options)
>+		return 0;
>+
>+	if (!*options)
>+		return 0;
>+
>+	while ((p = strsep(&options, ",")) != NULL) {
>+		int token;
>+		if (!*p)
>+			continue;
>+
>+		token = match_token(p, tokens, args);
>+		switch (token) {
>+		case OPTION_SECOND_DEV:
>+			sbi->second_dev = match_strdup(&args[0]);
>+			if (!(sbi->second_dev)) {
>+				err = -ENOMEM;
>+				goto out;
>+			}
>+			if (!*(sbi->second_dev))
>+				goto bad_value;
>+			break;
>+		case OPTION_IOMEM:
>+			iomem = match_strdup(&args[0]);
>+			if (!(iomem)) {
>+				err = -ENOMEM;
>+				goto out;
>+			}
>+			if (!*iomem)
>+				goto bad_value;
>+			break;
>+		case OPTION_PHYSICAL_ADDRESS_LOWER_X:
>+		case OPTION_PHYSICAL_ADDRESS_UPPER_X:
>+			if (match_hex(&args[0], (int *)&address))
>+				goto out;
>+			if (!address)
>+				goto bad_value;
>+			break;
>+		default:

just:
			goto bad_value;

>+			printk(KERN_ERR
>+			       "axfs: unrecognized mount option \"%s\" "
>+			       "or missing value\n", p);
>+			goto out;
>+		}
>+	}
>+
>+	if (iomem) {
>+		if (address)
>+			goto out;
>+		err = axfs_get_uml_address(iomem, &address, &length);

missing:
		if (err)
			goto out;

>+		kfree(iomem);
>+		sbi->iomem_size = length;
>+		sbi->virt_start_addr = address;
>+	}
>+
>+	sbi->phys_start_addr = address;
>+	return 0;
>+
>+bad_value:
>+	printk(KERN_ERR
>+	       "axfs: unrecognized mount option \"%s\" "
>+	       "or missing value\n", p);
>+out:
>+	if (iomem)
>+		kfree(iomem);

just kfree(iomem);

>+	return err;
>+}
>+

>+static int axfs_statfs(struct dentry *dentry, struct kstatfs *buf)
>+{
>+	struct axfs_super *sbi = AXFS_SB(dentry->d_sb);
>+
>+	buf->f_type = AXFS_MAGIC;
>+	buf->f_bsize = AXFS_PAGE_SIZE;

What will happen if i transfer the filesystem to a box with a different
pagesize?

>+	buf->f_blocks = sbi->blocks;
>+	buf->f_bfree = 0;
>+	buf->f_bavail = 0;
>+	buf->f_files = sbi->files;
>+	buf->f_ffree = 0;
>+	buf->f_namelen = AXFS_MAXPATHLEN;
>+	return 0;
>+}

I think i have seen the string "compessed" in one of your patches,
should be "compressed".
