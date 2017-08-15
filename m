From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 0/5] cramfs refresh for embedded usage
Date: Tue, 15 Aug 2017 11:00:49 +0000
Message-ID: <SG2PR06MB1165749BD3C8336AB0CD27618A8D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org>
 <SG2PR06MB1165840F183EADFC3265D7D98A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708141322170.17016@knanqh.ubzr>
 <SG2PR06MB116563FCF10E2615C65080F28A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708141405390.17016@knanqh.ubzr>
 <SG2PR06MB1165D300028F81087B045C8A8A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708150001380.17016@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5TuxsIIvXsyGlUskf9dk7wvGrTfopzEMM2voDVfOpmM=;
 b=kxj7sxssAqXOo9PTHXr9kdPLAbikOFh5sbyQYUXIIOAF1dn1E7+4hE7/mrO/9OKkUdVUmG2MY1uPaucIu0Lbc684GWa7VBeKCEVlS8F2TDrfQlb1DL08CanjW245fqyhN4fJ3LFC8Kw5XpJ8RPbe2kEo8ZBa+pjj/yDgpnaw0Lw=
In-Reply-To: <alpine.LFD.2.20.1708150001380.17016@knanqh.ubzr>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tuesday, August 15, 2017 1, Nicolas Pitre wrote:
> I was able to reproduce. The following patch on top should partially fix
> it.  I'm trying to figure out how to split a vma and link it properly in
> the case the vma cannot be mapped entirely. In the mean time shared libs
> won't be XIP.
>=20
>=20
> diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> index 5aedbd224e..4c7f01fcd2 100644
> --- a/fs/cramfs/inode.c
> +++ b/fs/cramfs/inode.c


Yes, now I can boot with my rootfs being a XIP cramfs.

However, like you said, libc is not XIP.

$ cat /proc/self/maps
00008000-000a1000 r-xp 1b005000 00:0c 18192      /bin/busybox
000a9000-000aa000 rw-p 00099000 00:0c 18192      /bin/busybox
000aa000-000ac000 rw-p 00000000 00:00 0          [heap]
b6ed8000-b6fb1000 r-xp 00000000 00:0c 766540     /lib/libc-2.18-2013.10.so
b6fb1000-b6fb9000 ---p 000d9000 00:0c 766540     /lib/libc-2.18-2013.10.so
b6fb9000-b6fbb000 r--p 000d9000 00:0c 766540     /lib/libc-2.18-2013.10.so
b6fbb000-b6fbc000 rw-p 000db000 00:0c 766540     /lib/libc-2.18-2013.10.so
b6fbc000-b6fbf000 rw-p 00000000 00:00 0
b6fbf000-b6fd6000 r-xp 00000000 00:0c 670372     /lib/ld-2.18-2013.10.so
b6fd9000-b6fda000 rw-p 00000000 00:00 0
b6fdb000-b6fdd000 rw-p 00000000 00:00 0
b6fdd000-b6fde000 r--p 00016000 00:0c 670372     /lib/ld-2.18-2013.10.so
b6fde000-b6fdf000 rw-p 00017000 00:0c 670372     /lib/ld-2.18-2013.10.so
be81f000-be840000 rw-p 00000000 00:00 0          [stack]
beb19000-beb1a000 r-xp 00000000 00:00 0          [sigpage]
ffff0000-ffff1000 r-xp 00000000 00:00 0          [vectors]


Chris
