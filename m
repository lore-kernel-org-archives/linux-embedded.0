From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 0/5] cramfs refresh for embedded usage
Date: Mon, 14 Aug 2017 18:01:54 +0000
Message-ID: <SG2PR06MB116563FCF10E2615C65080F28A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org>
 <SG2PR06MB1165840F183EADFC3265D7D98A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708141322170.17016@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Bsjk/0jbGi9CggYbf1u8rsJuS+aHtWPhWkmr1syIhgw=;
 b=F0I20H8Y2tHblR3V/usXFcTLix0tAPbcyT8O5Vs3D1EDknimBXvf0y6A5VniVnP8K3Vz+BdhxdY71yLQiOajbFqOiMTpNv2KehDP0Srh+s+TKydswlhu+MnSlEsflZWDTW8orvw5gYnVdOVvhkgbrj046sVd4pUdChP4riO5/SI=
In-Reply-To: <alpine.LFD.2.20.1708141322170.17016@knanqh.ubzr>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Monday, August 14, 2017, Nicolas Pitre wrote:
> > I just applied the patches tried this simple test:
> >  - tested with a Renesas RZ/A1 (Cortex-A9...so it has an MMU).
> >  - I set the sticky bit for busybox before using mkcramfs
>=20
> You need the newer mkcramfs I linked to in the documentation. With it
> you don't need to play tricks with the sticky bit anymore. However you
> need to specify -X twice (or just once for no-MMU targets) and it will
> make every ELF files XIPable automatically.

OK. Now I am getting bigger images that makes me think all the ELF files
are uncompressed.


> > However, at this point I'm not sure how I can confirm that the XIP
> > busybox actually executed as XIP or not.
>=20
> Just use busybox's built-in cat command and dump the content of
> /proc/self/maps. You should see an offset that refers to a physical
> address within your cramfs image for those segments marked read-only and
> executable.

It works! Pretty cool.

$ /mnt/bin/busybox cat /proc/self/maps
00008000-000a1000 r-xp 1b005000 00:10 18192      /mnt/bin/busybox

  (my cramfs flash image is at physical address 0x1B000000)




However, now with your mkcramfs tool, I can no longer mount my cramfs=20
image as the rootfs on boot. I was able to do that before (ie, 30 minutes=20
ago) when using the community mkcramfs (ie, 30 minutes ago).

I get this:

[    1.712425] cramfs: checking physical address 0x1b000000 for linear cram=
fs image
[    1.720531] cramfs: linear cramfs image appears to be 15744 KB in size
[    1.728656] VFS: Mounted root (cramfs_physmem filesystem) readonly on de=
vice 0:12.
[    1.737062] devtmpfs: mounted
[    1.741139] Freeing unused kernel memory: 48K
[    1.745545] This architecture does not have kernel memory protection.
[    1.760381] Starting init: /sbin/init exists but couldn't execute it (er=
ror -22)
[    1.769685] Starting init: /bin/sh exists but couldn't execute it (error=
 -14)
[    1.776956] Kernel panic - not syncing: No working init found.  Try pass=
ing init=3D option to kernel. See Linux Documentation/admin-guide/init.rst =
for guidance.
[    1.791192] CPU: 0 PID: 1 Comm: init Not tainted 4.13.0-rc1-00014-g53182=
a0b7245 #667
[    1.798959] Hardware name: Generic R7S72100 (Flattened Device Tree)
[    1.805519] [<bf809261>] (unwind_backtrace) from [<bf807aa3>] (show_stac=
k+0xb/0xc)
[    1.813228] [<bf807aa3>] (show_stack) from [<bf810a1b>] (panic+0x6f/0x18=
c)
[    1.820163] [<bf810a1b>] (panic) from [<bfa9f067>] (kernel_init+0x6b/0x9=
8)
[    1.827078] [<bfa9f067>] (kernel_init) from [<bf805011>] (ret_from_fork+=
0x11/0x20)
[    1.834747] ---[ end Kernel panic - not syncing: No working init found. =
 Try passing init=3D option to kernel. See Linux Documentation/admin-guide/=
init.rst for guidance.


Chris

