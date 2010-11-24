From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 09/16 v4] pramfs: dir operations
Date: Wed, 24 Nov 2010 09:30:13 +0100
Message-ID: <AANLkTinsnEd-QMcjRCaj-crKzOrj2oZe3C4RA2i5KqCP@mail.gmail.com>
References: <4CE79C4D.6000104@gmail.com>
	<20101124081755.GD2212@linux-sh.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Z9IfhrRk+v2Tkmovoj1ZYbhfsrEp9x6QTkrZ0/wA/RY=;
        b=fBnMvz7Y31B9raCnOuzxMvEas8SRGQnJr12EBVaqv0x6tccuLdzsdaH30OjGCEgHPz
         lFPfghyvFyigJTUW/QswXztdglLRKfIcvrWFC4pQfzCEYaPeohGjxqz5LFFqdjWA41/e
         wJVB1LZCx1dGhMc1UdeO5eo60a+VgZrqCEkh0=
In-Reply-To: <20101124081755.GD2212@linux-sh.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Paul Mundt <lethal@linux-sh.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Tim Bird <tim.bird@am.sony.com>, Greg Kroah-Hartman <gregkh@suse.de>

2010/11/24 Paul Mundt <lethal@linux-sh.org>:
> On Sat, Nov 20, 2010 at 11:00:45AM +0100, Marco Stornelli wrote:
>> +int pram_add_link(struct dentry *dentry, struct inode *inode)
>> +{
>> + =A0 =A0 struct inode *dir =3D dentry->d_parent->d_inode;
>> + =A0 =A0 struct pram_inode *pidir, *pi, *pitail =3D NULL;
>> + =A0 =A0 u64 tail_ino, prev_ino;
>> +
>> + =A0 =A0 const char *name =3D dentry->d_name.name;
>> +
>> + =A0 =A0 int namelen =3D dentry->d_name.len > PRAM_NAME_LEN ?
>> + =A0 =A0 =A0 =A0 =A0 =A0 PRAM_NAME_LEN : dentry->d_name.len;
>> +
>
> =A0 =A0 =A0 =A0namelen =3D min_t(unsigned int, dentry->d_name.len, PR=
AM_NAME_LEN);
>
> ?

Ok, I can use it, I have to check the type.

>
>> +#define S_SHIFT 12
>> +static unsigned int dtype_by_mode[S_IFMT >> S_SHIFT] =3D {
>> + =A0 =A0 [S_IFREG >> S_SHIFT] =A0 =A0DT_REG,
>> + =A0 =A0 [S_IFDIR >> S_SHIFT] =A0 =A0DT_DIR,
>> + =A0 =A0 [S_IFCHR >> S_SHIFT] =A0 =A0DT_CHR,
>> + =A0 =A0 [S_IFBLK >> S_SHIFT] =A0 =A0DT_BLK,
>> + =A0 =A0 [S_IFIFO >> S_SHIFT] =A0 =A0DT_FIFO,
>> + =A0 =A0 [S_IFSOCK >> S_SHIFT] =A0 DT_SOCK,
>> + =A0 =A0 [S_IFLNK >> S_SHIFT] =A0 =A0DT_LNK,
>> +};
>> +
>> +static int pram_readdir(struct file *filp, void *dirent, filldir_t =
filldir)
>> +{
> ...
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D filldir(dirent, name, namelen,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 filp->f_pos, i=
no,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dtype_by_mode[=
(be16_to_cpu(pi->i_mode) & S_IFMT)>>S_SHIFT]);
>> + =A0 =A0 =A0 =A0 =A0 =A0 filp->f_pos =3D pi->i_d.d_next ? be64_to_c=
pu(pi->i_d.d_next) : 3;
>
> You might try to provide some generic helpers for this, at least GFS2
> also does the same thing:
>
> include/linux/gfs2_ondisk.h:#define DT2IF(dt) (((dt) << 12) & S_IFMT)
> include/linux/gfs2_ondisk.h:#define IF2DT(sif) (((sif) & S_IFMT) >> 1=
2)
>

I'll look at it.

Marco
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
