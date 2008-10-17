From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Subject: [PATCH 01/16] Squashfs: inode operations
Date: Fri, 17 Oct 2008 18:53:00 +0200
Message-ID: <20081017165300.GA8076@logfs.org>
References: <E1KqrTW-0001xC-9M@dylan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1KqrTW-0001xC-9M@dylan>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: akpm@linux-foundation.org, linux-embedded@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, tim.bird@am.sony.com

None of the comments below are a reason against mainline inclusion, imo=
=2E
They should get handled, but whether that happens before or after a
merge doesn't really matter.

On Fri, 17 October 2008 16:42:50 +0100, Phillip Lougher wrote:
>=20
> +#include <linux/squashfs_fs.h>
> +#include <linux/squashfs_fs_sb.h>
> +#include <linux/squashfs_fs_i.h>

Current verdict seems to be that these files should live in fs/squashfs=
/,
not include/linux/.  No kernel code beside squashfs needs the headers
and userspace tools should have a private copy.

> +static int squashfs_new_inode(struct super_block *s, struct inode *i=
,
> +				struct squashfs_base_inode *inodeb)
> +{
> +	if (squashfs_get_id(s, le16_to_cpu(inodeb->uid), &i->i_uid) =3D=3D =
0)
> +		goto out;
> +	if (squashfs_get_id(s, le16_to_cpu(inodeb->guid), &i->i_gid) =3D=3D=
 0)
> +		goto out;
> +
> +	i->i_ino =3D le32_to_cpu(inodeb->inode_number);
> +	i->i_mtime.tv_sec =3D le32_to_cpu(inodeb->mtime);
> +	i->i_atime.tv_sec =3D i->i_mtime.tv_sec;
> +	i->i_ctime.tv_sec =3D i->i_mtime.tv_sec;
> +	i->i_mode =3D le16_to_cpu(inodeb->mode);
> +	i->i_size =3D 0;
> +
> +	return 1;
> +
> +out:
> +	return 0;
> +}

Most code uses "sb" and "inode", which I consider easier to read - if
only for consistency.

> +int squashfs_read_inode(struct inode *i, long long inode)

Is your "long long inode" what most filesystems call "inode->i_ino"?  I=
t
seems to be.

> +	if (squashfs_new_inode(s, i, inodeb) =3D=3D 0)
> +			goto failed_read;

Most linux functions return 0 on success and -ESOMETHING on error.  You
return 0 on error and 1 on success.  That makes it likely for someone
else to do something like

	err =3D squashfs_foo(bar);
	if (err)
		goto fail;

Oops.

J=C3=B6rn

--=20
Measure. Don't tune for speed until you've measured, and even then
don't unless one part of the code overwhelms the rest.
-- Rob Pike
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
