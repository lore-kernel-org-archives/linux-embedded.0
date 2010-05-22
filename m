From: kirk w <kirkpuppy@yahoo.com>
Subject: Re: [Squashfs-devel] [PATCH 2/2] Squashfs-tools: add LZO support
Date: Fri, 21 May 2010 20:53:33 -0700 (PDT)
Message-ID: <649098.60021.qm@web114011.mail.gq1.yahoo.com>
References: <001b01caf63f$4c5fcdc0$e51f6940$@jeong@lge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1274500413; bh=D+C4c9QlvWiYo3xXsZPn/EjjuRNvuyhpbzx66A1VA5U=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=2gOd9BkSZ0KMrS6apolopexEG4yCjVw0qZEHN3LxzPArobZ6v0L030yr85RIRvi+eS3BlnhFgayk+S5pxjRQq84LjbQFNw1SrtD/NDFBftAkGFa70jWOob5UbjlZrL8MvWd6CzNtmBZLAfXIljlXsKXFyune9ILZ96J/BlZlwp8=
In-Reply-To: <001b01caf63f$4c5fcdc0$e51f6940$@jeong@lge.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: squashfs-devel@lists.sourceforge.net, Chan Jeong <chan.jeong@lge.com>
Cc: 'Phillip Lougher' <phillip@lougher.demon.co.uk>, 'Gunho Lee' <gunho.lee@lge.com>, 'Tim Bird' <tim.bird@am.sony.com>, linux-embedded@vger.kernel.org, 'Hyo Jun Im' <hyojun.im@lge.com>

Hi,

Thanks for the patches. Is there a way to increase the compression leve=
l? Right now my file system compressed with zlib is 176MB and with this=
 patch using lzo it's 232MB. I've read that lzo's compression level can=
 be increased to near zlib levels, but compression times suffer. Compre=
ssion times don't matter to me, but increased decompression speed is in=
triguing.  =20

Thanks again,

Kirk

--- On Tue, 5/18/10, Chan Jeong <chan.jeong@lge.com> wrote:

> From: Chan Jeong <chan.jeong@lge.com>
> Subject: [Squashfs-devel] [PATCH 2/2] Squashfs-tools: add LZO support
> To: squashfs-devel@lists.sourceforge.net
> Cc: "'Phillip Lougher'" <phillip@lougher.demon.co.uk>, "'Gunho Lee'" =
<gunho.lee@lge.com>, "'Tim Bird'" <tim.bird@am.sony.com>, linux-embedde=
d@vger.kernel.org, "'Hyo Jun Im'" <hyojun.im@lge.com>
> Date: Tuesday, May 18, 2010, 12:05 AM
> This patch adds LZO compression and
> decompression to Squashfs tools.
>=20
> The patch is against the latest cvs version and requires
> the LZO library
> from http://www.oberhumer.com/opensource/lzo.
>=20
> Signed-off-by: Chan Jeong <chan.jeong@lge.com>
> ---
>  Makefile=A0 =A0 =A0 |=A0=A0=A020
> +++++++++++
>  compressor.c=A0 |=A0 =A0 7 ++++
>  lzo_wrapper.c |=A0=A0=A099
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  squashfs_fs.h |=A0 =A0 1=20
>  4 files changed, 127 insertions(+)
>=20
> diff -uprN -x .cvs squashfs-tools.cvs.orig/Makefile
> squashfs-tools.cvs/Makefile
> --- squashfs-tools.cvs.orig/Makefile=A0=A0=A0
> 2010-05-13 02:17:06.000000000 +0900
> +++ squashfs-tools.cvs/Makefile=A0=A0=A0
> 2010-05-18 11:36:58.000000000 +0900
> @@ -15,6 +15,18 @@
>  #LZMA_SUPPORT =3D 1
>  #LZMA_DIR =3D ../../../LZMA/lzma465
> =20
> +#
> +# Building LZO support
> +#
> +# The LZO library (http://www.oberhumer.com/opensource/lzo/)
> is supported.
> +#
> +# To build using the LZO library (2.0.3 used in
> development, other versions may
> +# work) - download, unpack, build and install it,
> uncomment and set LZO_DIR to
> +# installed directory prefix, and uncomment the
> LZO_SUPPORT line below.
> +
> +#LZO_SUPPORT =3D 1
> +#LZO_DIR =3D /usr/local
> +
>  #Compression default.
>  COMP_DEFAULT =3D gzip
> =20
> @@ -47,6 +59,14 @@ UNSQUASHFS_OBJS +=3D xz_wrapper.o
>  LIBS +=3D -llzma
>  endif
> =20
> +ifdef LZO_SUPPORT
> +CFLAGS +=3D -DLZO_SUPPORT
> +INCLUDEDIR +=3D -I$(LZO_DIR)/include
> +MKSQUASHFS_OBJS +=3D lzo_wrapper.o
> +UNSQUASHFS_OBJS +=3D lzo_wrapper.o
> +LIBS +=3D -L$(LZO_DIR)/lib -llzo2
> +endif
> +
>  .PHONY: all
>  all: mksquashfs unsquashfs
> =20
> diff -uprN -x .cvs squashfs-tools.cvs.orig/compressor.c
> squashfs-tools.cvs/compressor.c
> --- squashfs-tools.cvs.orig/compressor.c=A0=A0=A0
> 2009-08-29 10:05:34.000000000 +0900
> +++ squashfs-tools.cvs/compressor.c=A0=A0=A0
> 2010-05-18 11:37:46.000000000 +0900
> @@ -29,6 +29,8 @@ extern int gzip_compress(void **, char *
>  extern int gzip_uncompress(char *, char *, int, int, int
> *);
>  extern int lzma_compress(void **, char *, char *, int,
> int, int *);
>  extern int lzma_uncompress(char *, char *, int, int, int
> *);
> +extern int lzo_compress(void **, char *, char *, int, int,
> int *);
> +extern int lzo_uncompress(char *, char *, int, int, int
> *);
> =20
>  struct compressor compressor[] =3D {
>  =A0=A0=A0 { gzip_compress, gzip_uncompress,
> ZLIB_COMPRESSION, "gzip", 1 },
> @@ -37,6 +39,11 @@ struct compressor compressor[] =3D {
>  #else
>  =A0=A0=A0 { NULL, NULL, LZMA_COMPRESSION, "lzma",
> 0 },
>  #endif
> +#ifdef LZO_SUPPORT
> +=A0=A0=A0 { lzo_compress, lzo_uncompress,
> LZO_COMPRESSION, "lzo", 1 },
> +#else
> +=A0=A0=A0 { NULL, NULL, LZO_COMPRESSION, "lzo", 0
> },
> +#endif
>  =A0=A0=A0 { NULL, NULL , 0, "unknown", 0}
>  };
> =20
> diff -uprN -x .cvs squashfs-tools.cvs.orig/lzo_wrapper.c
> squashfs-tools.cvs/lzo_wrapper.c
> --- squashfs-tools.cvs.orig/lzo_wrapper.c=A0=A0=A0
> 1970-01-01 09:00:00.000000000 +0900
> +++ squashfs-tools.cvs/lzo_wrapper.c=A0=A0=A0
> 2010-05-18 11:59:30.000000000 +0900
> @@ -0,0 +1,99 @@
> +/*
> + * Copyright (c) 2010 LG Electronics
> + * Chan Jeong <chan.jeong@lge.com>
> + *
> + * This program is free software; you can redistribute it
> and/or
> + * modify it under the terms of the GNU General Public
> License
> + * as published by the Free Software Foundation; either
> version 2,
> + * or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be
> useful,
> + * but WITHOUT ANY WARRANTY; without even the implied
> warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR
> PURPOSE.=A0 See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General
> Public License
> + * along with this program; if not, write to the Free
> Software
> + * Foundation, 59 Temple Place - Suite 330, Boston, MA
> 02111-1307, USA.
> + *
> + * lzo_wrapper.c
> + */
> +
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include <lzo/lzoconf.h>
> +#include <lzo/lzo1x.h>
> +
> +/* worst-case expansion calculation during compression,
> +=A0=A0=A0see LZO FAQ for more information */
> +#define LZO_OUTPUT_BUFFER_SIZE(size)=A0=A0=A0
> (size + (size/16) + 64 + 3)
> +
> +int lzo_compress(void **strm, char *d, char *s, int size,
> int block_size,
> +=A0=A0=A0 =A0=A0=A0 int *error)
> +{
> +=A0=A0=A0 int res =3D 0;
> +=A0=A0=A0 lzo_bytep out;
> +=A0=A0=A0 lzo_uint outlen;
> +=A0=A0=A0 lzo_voidp wrkmem;
> +=A0=A0=A0 void **buffers =3D (void **)*strm;
> +
> +=A0=A0=A0 if(buffers =3D=3D NULL) {
> +=A0=A0=A0 =A0=A0=A0 if((buffers =3D *strm
> =3D calloc(2, sizeof(void *))) =3D=3D NULL)
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> goto malloc_failed;
> +
> +=A0=A0=A0 =A0=A0=A0 /* work memory */
> +=A0=A0=A0 =A0=A0=A0 if((buffers[0] =3D
> malloc(LZO1X_1_MEM_COMPRESS)) =3D=3D NULL)
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> goto malloc_failed;
> +
> +=A0=A0=A0 =A0=A0=A0 /* temporal output
> buffer */
> +=A0=A0=A0 =A0=A0=A0 if((buffers[1] =3D
> malloc(LZO_OUTPUT_BUFFER_SIZE(block_size))) =3D=3D NULL)
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> goto malloc_failed;
> +=A0=A0=A0 }
> +
> +=A0=A0=A0 wrkmem =3D buffers[0];
> +=A0=A0=A0 out =3D buffers[1];
> +=A0=A0=A0 res =3D lzo1x_1_compress((lzo_bytep)s,
> size, out, &outlen, wrkmem);
> +=A0=A0=A0 if(res !=3D LZO_E_OK) {
> +=A0=A0=A0 =A0=A0=A0 /*
> +=A0=A0=A0 =A0=A0=A0=A0=A0* All
> other errors return failure, with the compressor
> +=A0=A0=A0 =A0=A0=A0=A0=A0*
> specific error code in *error
> +=A0=A0=A0 =A0=A0=A0=A0=A0*/
> +=A0=A0=A0 =A0=A0=A0 *error =3D res;
> +=A0=A0=A0 =A0=A0=A0 return -1;
> +=A0=A0=A0 }
> +
> +=A0=A0=A0 if(outlen >=3D size) {
> +=A0=A0=A0 =A0=A0=A0 /*
> +=A0=A0=A0 =A0=A0=A0=A0=A0* Output
> buffer overflow. Return out of buffer space
> +=A0=A0=A0 =A0=A0=A0=A0=A0*/
> +=A0=A0=A0 =A0=A0=A0 return 0;
> +=A0=A0=A0 }
> +
> +=A0=A0=A0 /*
> +=A0=A0=A0=A0=A0* Success, return the
> compressed size.
> +=A0=A0=A0=A0=A0*/
> +=A0=A0=A0 memcpy(d, out, outlen);
> +=A0=A0=A0 return outlen;
> +
> +malloc_failed:
> +=A0=A0=A0 if(buffers) {
> +=A0=A0=A0 =A0=A0=A0 if(buffers[0]) {
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> free(buffers[0]);
> +=A0=A0=A0 =A0=A0=A0 }
> +=A0=A0=A0 =A0=A0=A0 free(buffers);
> +=A0=A0=A0 }
> +=A0=A0=A0 return -1;
> +}
> +
> +
> +int lzo_uncompress(char *d, char *s, int size, int
> block_size, int *error)
> +{
> +=A0=A0=A0 int res;
> +=A0=A0=A0 lzo_uint bytes =3D block_size;
> +=A0=A0=A0=20
> +=A0=A0=A0 res =3D lzo1x_decompress((lzo_bytep)s,
> size, (lzo_bytep)d, &bytes, NULL);
> +
> +=A0=A0=A0 *error =3D res;
> +=A0=A0=A0 return res =3D=3D LZO_E_OK ? bytes : -1;
> +}
> diff -uprN -x .cvs squashfs-tools.cvs.orig/squashfs_fs.h
> squashfs-tools.cvs/squashfs_fs.h
> --- squashfs-tools.cvs.orig/squashfs_fs.h=A0=A0=A0
> 2010-05-13 04:28:38.000000000 +0900
> +++ squashfs-tools.cvs/squashfs_fs.h=A0=A0=A0
> 2010-05-18 11:43:22.000000000 +0900
> @@ -238,6 +238,7 @@ typedef long long=A0=A0=A0
> =A0=A0=A0 squashfs_inode_t;
> =20
>  #define ZLIB_COMPRESSION=A0=A0=A0 1
>  #define LZMA_COMPRESSION=A0=A0=A0 2
> +#define LZO_COMPRESSION=A0=A0=A0
> =A0=A0=A0 3
> =20
>  struct squashfs_super_block {
>  =A0=A0=A0 unsigned int=A0=A0=A0
> =A0=A0=A0 s_magic;
>=20
>=20
> ---------------------------------------------------------------------=
---------
>=20
> _______________________________________________
> Squashfs-devel mailing list
> Squashfs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/squashfs-devel
>=20


     =20
