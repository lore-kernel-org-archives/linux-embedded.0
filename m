From: Johannes Stezenbach <js@sig21.net>
Subject: Re: New fast(?)-boot results on ARM
Date: Sat, 15 Aug 2009 12:35:32 +0200
Message-ID: <20090815103532.GA5596@sig21.net>
References: <20090814170228.GM13320@pengutronix.de>
 <1158166a0908141304y70300ab3p899b0d4609efded9@mail.gmail.com>
 <20090814204305.GA31727@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090814204305.GA31727@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Denys Vlasenko <vda.linux@googlemail.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

On Fri, Aug 14, 2009 at 10:43:05PM +0200, Robert Schwebel wrote:
> On Fri, Aug 14, 2009 at 10:04:57PM +0200, Denys Vlasenko wrote:
> > > rsc@thebe:~$ microcom | ptx_ts "U-Boot 2.0.0-rc9"

Now that microcom is in Debian sid (thanks!), where can I find ptx_ts?
It seems to be quite useful.


> > > [ =A00.874559] < =A00.003967> Hit any key to stop autoboot: =A00
> >
> > boot loader is not fast. considering its simple task, it can be mad=
e
> > faster.
>=20
> Yup, will check. Almost 1 s seems really long.


I'm working on a SoC with a 200MHz ARM926EJ-S.  We managed to get
to 1.5sec from power-on to "starting init". The main difference to
your platform seems to be that we use NOR flash.  The kernel is
not optimized, it still has some debug options turned on and
is used during development. (however, the 1.5sec is with "quiet")
The root fs is cramfs. The kernel version is 2.6.20.

=46or u-boot we enabled the D-cache which gave a decent speed up
(on ARM926EJ-S this requires one to set up page tables and enable
MMU, but it's not that difficult). I don't have the numbers here
but I think it still takes ~300ms in u-boot, and ~1.2s for the kernel b=
oot.


> > > [ =A01.326621] < =A00.452062> loaded zImage from /dev/nand0.kerne=
l.bb with size 1679656
> > > [ =A02.009996] < =A00.683375> Uncompressing Linux................=
=2E....................................................................=
=2E......................... done, booting the kernel.
> > > [ =A02.416999] < =A00.407003> Linux version 2.6.31-rc4-g056f82f-d=
irty (sha@octopus) (gcc version 4.3.2 (OSELAS.Toolchain-1.99.3) ) #1 PR=
EEMPT Thu Aug 6 08:37:19 CEST 2009
> >=20
> > Other people already commented on this (kernel is too big)
>=20
> Not sure (the kernel is already customized for the board), but I'll t=
ake
> a look again.

We are booting an uncomressed kernel (~2.8MB).  Uncompressing (running =
the uncompressor
XIP in NOR flash) took ~0.5s longer than copying 2.8MB from flash to RA=
M.
BTW, we are using uImage and set verify=3Dno in u-boot. We use u-boot-1=
=2E3.0.


> > > [ =A05.082616] < =A00.007992> RPC: Registered tcp transport modul=
e.
> > > [ =A05.605159] < =A00.522543> eth0: config: auto-negotiation on, =
100FDX, 100HDX, 10FDX, 10HDX.

What is happening here? Waiting for eth link negotiation?

> > > [ =A06.602621] < =A00.997462> IP-Config: Complete:
> > > [ =A06.606638] < =A00.004017> =A0 =A0 =A0device=3Deth0, addr=3D19=
2.168.23.197, mask=3D255.255.0.0, gw=3D192.168.23.2,
> > > [ =A06.614588] < =A00.007950> =A0 =A0 =A0host=3D192.168.23.197, d=
omain=3D, nis-domain=3D(none),
> > > [ =A06.618652] < =A00.004064> =A0 =A0 =A0bootserver=3D192.168.23.=
2, rootserver=3D192.168.23.2, rootpath=3D
> >=20
> > Well, this ~1 second is not really kernel's fault, it's DHCP delay.
> > But, do you need to do it at this moment?
> > You do not seem to be using networking filesystems.
> > You can run DHCP client in userspace.
>=20
> The board has ip autoconfig configured in, because we also use tftp/n=
fs
> boot for development. But it had been disabled on the commandline:
>=20
> ip=3D192.168.23.197:192.168.23.2:192.168.23.2:255.255.0.0:::
>=20
> That shouldn't do dhcp, right?

Try to boot with eth cable unplugged, see if it hangs in IP-config.
If it were doing static configuration it would be faster.

However, unless you need ethernet to boot (NFS root) I'd suggest
doing eth config in userspace.


> > > [ =A07.137924] < =A00.059316> starting udev
> > > [ =A07.147925] < =A00.010001> mounting tmpfs at /dev
> > > [ =A07.182299] < =A00.034374> creating static nodes
> > > [ =A07.410613] < =A00.228314> starting udevd...done
> > > [ =A08.811097] < =A01.400484> waiting for devices...done

And suddenly devtmpfs sounds like a good idea ;-)

We use static device nodes during boot, and later
setup busybox mdev for hotplug.


Johannes
