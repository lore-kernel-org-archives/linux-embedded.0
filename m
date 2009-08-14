From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: New fast(?)-boot results on ARM
Date: Fri, 14 Aug 2009 22:43:05 +0200
Message-ID: <20090814204305.GA31727@pengutronix.de>
References: <20090814170228.GM13320@pengutronix.de> <1158166a0908141304y70300ab3p899b0d4609efded9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1158166a0908141304y70300ab3p899b0d4609efded9@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Denys Vlasenko <vda.linux@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

On Fri, Aug 14, 2009 at 10:04:57PM +0200, Denys Vlasenko wrote:
> > rsc@thebe:~$ microcom | ptx_ts "U-Boot 2.0.0-rc9"
> > [ =A02.395740] < =A02.395740>
> > [ =A02.395860] < =A00.000120>
> > [ =A00.000011] < =A00.000011> U-Boot 2.0.0-rc9 (Aug =A05 2009 - 10:=
05:58)
> > [ =A00.000059] < =A00.000048>
> > [ =A00.003823] < =A00.003764> Board: Phytec phyCORE-i.MX27
> > [ =A00.010753] < =A00.006930> cfi_probe: cfi_flash base: 0xc0000000=
 size: 0x02000000
> > [ =A00.018711] < =A00.007958> NAND device: Manufacturer ID: 0x20, C=
hip ID: 0x36 (ST Micro NAND 64MiB 1,8V 8-bit)
> > [ =A00.026592] < =A00.007881> imxfb@imxfb0: i.MX Framebuffer driver
> > [ =A00.178655] < =A00.152063> dev_protect: currently broken
> > [ =A00.178736] < =A00.000081> Using environment in NOR Flash
> > [ =A00.182577] < =A00.003841> initialising PLLs
> > [ =A00.367142] < =A00.184565> Malloc space: 0xa3f00000 -> 0xa7f0000=
0 (size 64 MB)
> > [ =A00.370568] < =A00.003426> Stack space : 0xa3ef8000 -> 0xa3f0000=
0 (size 32 kB)
> > [ =A00.445993] < =A00.075425> running /env/bin/init...
> > [ =A00.870592] < =A00.424599>
> > [ =A00.874559] < =A00.003967> Hit any key to stop autoboot: =A00
>
> boot loader is not fast. considering its simple task, it can be made
> faster.

Yup, will check. Almost 1 s seems really long.

> > [ =A01.326621] < =A00.452062> loaded zImage from /dev/nand0.kernel.=
bb with size 1679656
> > [ =A02.009996] < =A00.683375> Uncompressing Linux..................=
=2E....................................................................=
=2E....................... done, booting the kernel.
> > [ =A02.416999] < =A00.407003> Linux version 2.6.31-rc4-g056f82f-dir=
ty (sha@octopus) (gcc version 4.3.2 (OSELAS.Toolchain-1.99.3) ) #1 PREE=
MPT Thu Aug 6 08:37:19 CEST 2009
>=20
> Other people already commented on this (kernel is too big)

Not sure (the kernel is already customized for the board), but I'll tak=
e
a look again.

> > [ =A02.418729] < =A00.001730> CPU: ARM926EJ-S [41069264] revision 4=
 (ARMv5TEJ), cr=3D00053177
> > [ =A02.423081] < =A00.004352> CPU: VIVT data cache, VIVT instructio=
n cache
> > [ =A02.426592] < =A00.003511> Machine: phyCORE-i.MX27
> ...
> > [ =A02.742628] < =A00.016050> 0x000000360000-0x000004000000 : "root=
"
> > [ =A03.058610] < =A00.315982> UBI: attaching mtd7 to ubi0
> > [ =A03.062878] < =A00.004268> UBI: physical eraseblock size: =A0 16=
384 bytes (16 KiB)
> > [ =A03.070601] < =A00.007723> UBI: logical eraseblock size: =A0 =A0=
15360 bytes
> > [ =A03.070665] < =A00.000064> UBI: smallest flash I/O unit: =A0 =A0=
512
> > [ =A03.078564] < =A00.007899> UBI: VID header offset: =A0 =A0 =A0 =A0=
 =A0512 (aligned 512)
> > [ =A03.078609] < =A00.000045> UBI: data offset: =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A01024
> > [ =A05.006609] < =A01.928000> UBI: attached mtd7 to ubi0
> > [ =A05.013157] < =A00.006548> UBI: MTD device name: =A0 =A0 =A0 =A0=
 =A0 =A0"root"
>=20
> As others commented, ubi looks slow and you probably need to find out=
 why.

So it seems like our UBS is much slower than usual?

> > [ =A05.014566] < =A00.001409> UBI: MTD device size: =A0 =A0 =A0 =A0=
 =A0 =A060 MiB
> > [ =A05.018660] < =A00.004094> UBI: number of good PEBs: =A0 =A0 =A0=
 =A03880
> > [ =A05.022585] < =A00.003925> UBI: number of bad PEBs: =A0 =A0 =A0 =
=A0 0
> > [ =A05.026797] < =A00.004212> UBI: max. allowed volumes: =A0 =A0 =A0=
 89
> > [ =A05.026849] < =A00.000052> UBI: wear-leveling threshold: =A0 =A0=
4096
> > [ =A05.030779] < =A00.003930> UBI: number of internal volumes: 1
> > [ =A05.034583] < =A00.003804> UBI: number of user volumes: =A0 =A0 =
1
> > [ =A05.046572] < =A00.011989> UBI: available PEBs: =A0 =A0 =A0 =A0 =
=A0 =A0 0
> > [ =A05.046622] < =A00.000050> UBI: total number of reserved PEBs: 3=
880
> > [ =A05.046657] < =A00.000035> UBI: number of PEBs reserved for bad =
PEB handling: 38
> > [ =A05.050606] < =A00.003949> UBI: max/mean erase counter: 2/0
> > [ =A05.050668] < =A00.000062> UBI: image sequence number: 0
> > [ =A05.058619] < =A00.007951> UBI: background thread "ubi_bgt0d" st=
arted, PID 215
> > [ =A05.062620] < =A00.004001> oprofile: using timer interrupt.
> > [ =A05.070584] < =A00.007964> TCP cubic registered
> > [ =A05.070637] < =A00.000053> NET: Registered protocol family 17
> > [ =A05.074624] < =A00.003987> RPC: Registered udp transport module.
> > [ =A05.082616] < =A00.007992> RPC: Registered tcp transport module.
> > [ =A05.605159] < =A00.522543> eth0: config: auto-negotiation on, 10=
0FDX, 100HDX, 10FDX, 10HDX.
> > [ =A06.602621] < =A00.997462> IP-Config: Complete:
> > [ =A06.606638] < =A00.004017> =A0 =A0 =A0device=3Deth0, addr=3D192.=
168.23.197, mask=3D255.255.0.0, gw=3D192.168.23.2,
> > [ =A06.614588] < =A00.007950> =A0 =A0 =A0host=3D192.168.23.197, dom=
ain=3D, nis-domain=3D(none),
> > [ =A06.618652] < =A00.004064> =A0 =A0 =A0bootserver=3D192.168.23.2,=
 rootserver=3D192.168.23.2, rootpath=3D
>=20
> Well, this ~1 second is not really kernel's fault, it's DHCP delay.
> But, do you need to do it at this moment?
> You do not seem to be using networking filesystems.
> You can run DHCP client in userspace.

The board has ip autoconfig configured in, because we also use tftp/nfs
boot for development. But it had been disabled on the commandline:

ip=3D192.168.23.197:192.168.23.2:192.168.23.2:255.255.0.0:::

That shouldn't do dhcp, right?

> So, about 4 seconds for kernel init (I subtracted DHCP and boot loade=
r times).
>=20
> And now userspace takes 7 seconds, mostly because it does not
> parallelize boot process:
>=20
> > init started: BusyBox v1.13.4 (2009-08-06 08:30:14 CEST)
> > [ =A07.050625] < =A00.187504> mounting filesystems...done.
> > [ =A07.078608] < =A00.027983> running rc.d services...
>=20
> these services seem to start one by one:
>=20
> > [ =A07.137924] < =A00.059316> starting udev
> > [ =A07.147925] < =A00.010001> mounting tmpfs at /dev
> > [ =A07.182299] < =A00.034374> creating static nodes
> > [ =A07.410613] < =A00.228314> starting udevd...done
> > [ =A08.811097] < =A01.400484> waiting for devices...done
> > [ =A08.918710] < =A00.107613> syslogd starting
> > [ =A09.050585] < =A00.131875> tweaking ondemand scaling governor
> > [ 10.010600] < =A00.960015> Starting system message bus: dbus.
> ...
> > [ 13.546627] < =A00.024002> OSELAS(R)-phyCORE-trunk (PTXdist-1.99.s=
vn/2009-08-06T08:37:25+0200)

Well, the application is started in the very beginning, so all the
services should start while the app is already gaining speed.

Thanks,

rsc
--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
