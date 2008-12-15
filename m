From: Hugo Villeneuve <hugo@hugovil.com>
Subject: Re: FPGA programming driver architecture
Date: Mon, 15 Dec 2008 13:16:44 -0500
Message-ID: <20081215131644.8671abeb.hugo@hugovil.com>
References: <20081212150314.6ea24996.hugo@hugovil.com>
	<200812131358.03010.florian@openwrt.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756209AbYLOSQ6@vger.kernel.org>
In-Reply-To: <200812131358.03010.florian@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Florian Fainelli <florian@openwrt.org>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Sat, 13 Dec 2008 13:58:01 +0100
=46lorian Fainelli <florian@openwrt.org> wrote:

> (CC'ing linux-embedded)
>=20
> Salut Hugo,
>=20
> Le Friday 12 December 2008 21:03:14 Hugo Villeneuve, vous avez =E9cri=
t=A0:
> > Hi,
> > I have written some code to program a FPGA in Linux, for two
> > different types of boards: one uses a serial interface (SPI) and
> > the second a parallel interface. I have been able to sucessfully
> > program both boards. I'm now trying to clean my code and make it
> > more generic, as well as better in line with the Linux driver
> > model. I would also like to include it in the mainline kernel if
> > there is interest.
>=20
> Is it a platform-driver ? What do you provide in platform_data ?

Hi Florian,
Yes, currently it is a platform driver. Here is my platform data:

static struct fpgaload_pdata_t fpgaload_pdata =3D {
        .fpga_family            =3D FPGA_FAMILY_XILINX_XC3S,
        .payload_full_size      =3D XC3S1400A_PAYLOAD_SIZE,
        .program_b              =3D GPIO(21),
        .done                   =3D GPIO(19),
        .init_b                 =3D GPIO(20),
        .swapbits               =3D 0,
        .interface              =3D FPGALOAD_INTERFACE_SERIAL,
        .bitstream_name         =3D "fpga.bit",
};

> > Here is a description of the current architecture (refer to diagram=
s
> > below): The fpgaload module controls one output GPIOs (PROG), and
> > two input GPIOs (INIT and DONE). These GPIOs are specified in board
> > setup code. Both fpgaload_ser and fpgaload_par modules export a
> > single function to write a byte. The fpgaload driver is a char
> > device to which we can write (/dev/fpgaload) to program a bitstream
> > (FPGA firmware) inside the FPGA.=20
>=20
> You should probably consider using request_firmware to load the
> bitstream from the userspace and possibly add a /sys interface to
> export some attributes like :

This is already the case with request_firmware :) The bitstream_name fi=
eld in platform data is used to specify the name of the file.
=20
> - GPIOs being used between the host and the FPGA
> - status (i.e : programmed, not programmed ...)
> - FPGA vendor, type ...
>=20
> > The=20
> > fpgaload driver will toggle the GPIOs to initiate programming and
> > the then call the corresponding write_byte function based on the
> > interface type specified in board setup code (serial or parallel,
> > or any future interface desired).
>=20
> > The problem with that approach is that when loading the fpgaload
> > module with modprobe, it will automatically try to load the
> > fpgaload_ser and fpgaload_par modules, even if only serial
> > interface was specified in board setup code for example. This is
> > not good when building a kernel for similar but different boards.
>=20
> What about something like that :
>=20
> - fpgaload-core which contains all the code that can be shared
> between the drivers like requesting firmware, providing sysfs
> attributes,=20
> - fpgaload-spi would handle the low-level SPI connection
> - fpgaload-par would handle the low-level parallel connection

This is pretty much like that right now, exceptfor sysfs attributes.

> fpgaload-ser and par would register with fpgaload-core and they could
> register a fpga loading callback which is low-level specific for
> instance. Platform code would instantiate the core driver. That way,
> adding support for other loading protocols like slave serial or
> master serial can be done easily.

Yes, I think this could work, but I would like to know what kind of dri=
ver fpgaload-core would be. Currently it is a platform driver and a cha=
rdev (to support open and write methods for programming). How shall I i=
mplement it? Bus driver, platform driver?

Ciao, Hugo V.
