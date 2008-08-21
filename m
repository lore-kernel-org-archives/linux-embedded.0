From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 03/10] AXFS: axfs.h
Date: Thu, 21 Aug 2008 14:24:31 +0200
Message-ID: <200808211424.31966.arnd@arndb.de>
References: <48AD00E6.2070505@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48AD00E6.2070505@gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: jaredeh@gmail.com
Cc: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, =?iso-8859-1?q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@am.sony.com, cotte@de.ibm.com, nickpiggin@yahoo.com.au

On Thursday 21 August 2008, Jared Hulbert wrote:
> +static inline u64 axfs_bytetable_stitch(u8 depth, u8 *table, u64 ind=
ex)
> +{
> +=A0=A0=A0=A0=A0=A0=A0u64 i;
> +=A0=A0=A0=A0=A0=A0=A0u64 output =3D 0;
> +=A0=A0=A0=A0=A0=A0=A0u64 byte =3D 0;
> +=A0=A0=A0=A0=A0=A0=A0u64 j;
> +=A0=A0=A0=A0=A0=A0=A0u64 bits;
> +
> +=A0=A0=A0=A0=A0=A0=A0for (i =3D 0; i < depth; i++) {
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0j =3D index * depth + i=
;
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0bits =3D 8 * (depth - i=
 - 1);
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0byte =3D table[j];
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0output +=3D byte << bit=
s;
> +=A0=A0=A0=A0=A0=A0=A0}
> +=A0=A0=A0=A0=A0=A0=A0return output;
> +}
> +
> +#define AXFS_GET_BYTETABLE_VAL(desc,index) \
> + =A0axfs_bytetable_stitch(((struct axfs_region_desc)(desc)).table_by=
te_depth,\
> + =A0(u8 *)((struct axfs_region_desc)(desc)).virt_addr, index)
> +

This bytetable stuff looks overly complicated, both the data structure =
and
the access method. It seems like you are implementing your own custom H=
uffman
compression with this.

Is the reasonn for the bytetable just to pack numbers efficiently, or d=
o you
have a different intention?

Did you see a significant size benefit over simply storing all metadata=
 as
uncompressed data structures like in cramfs?

Have you considered storing simple dentry/inode data in node_type=3D=3D=
Compressed
nodes?

	Arnd <><
