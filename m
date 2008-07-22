From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
Subject: Re: UIO not working on ppc405 onchip registers
Date: Tue, 22 Jul 2008 08:17:30 +0200
Message-ID: <20080722061730.GB12576@digi.com>
References: <200807212152.16080.super.firetwister@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200807212152.16080.super.firetwister@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus Brunner <super.firetwister@googlemail.com>
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Hello Markus,

Markus Brunner wrote:
> I'm unable to get UIO working on the ppc405ep onchip registers (e.g. =
gpio/iic)
> however it's working fine on peripherals.
I don't know powerpc in general nor ppc405ep in detail but IIRC arm has
problems if some memory is mapped twice.  Might this be the problem
here?

> It seems to me to be a problem with UIO on powerpc, because if I chan=
ge the
> address (and nothing more) to point to a external FPGA it's working f=
ine.
> I also tried the generic uio_pdrv which had the same problems.
> Sometimes I get a "bus error" sometimes it only produces wrong result=
s.
> The "bus error" occurred when not a full 32 bit register was read (e.=
g. only a
> byte of it), but I'm not sure if it doesn't occur for other reasons a=
s well.
Well, if this is a 32bit memory mapped device and you do a non-32 bit
access strage things can happen.

>=20
> diff -upNr linux-2.6.26/drivers/uio-orig/Kconfig linux-2.6.26/drivers=
/uio/Kconfig
> --- linux-2.6.26/drivers/uio-orig/Kconfig       2008-07-18 09:15:51.0=
00000000 +0200
> +++ linux-2.6.26/drivers/uio/Kconfig    2008-07-18 09:16:18.000000000=
 +0200
> @@ -39,4 +39,12 @@ config UIO_SMX
>=20
>           If you compile this as a module, it will be called uio_smx.
>=20
> +config UIO_GPIO
> +       tristate "Driver for PPC_4xx GPIO"
> +       depends on UIO
> +       default n
> +       help
> +         Driver for PPC_4xx GPIO Registers
> +
>  endif
This endif matches an "if UIO", so there is no need to depend on UIO
explicitly.

> diff -upNr linux-2.6.26/drivers/uio-orig/Makefile linux-2.6.26/driver=
s/uio/Makefile
> --- linux-2.6.26/drivers/uio-orig/Makefile      2008-07-18 09:27:18.0=
00000000 +0200
> +++ linux-2.6.26/drivers/uio/Makefile   2008-07-18 09:16:50.000000000=
 +0200
> @@ -1,3 +1,4 @@
>  obj-$(CONFIG_UIO)      +=3D uio.o
>  obj-$(CONFIG_UIO_CIF)  +=3D uio_cif.o
>  obj-$(CONFIG_UIO_SMX)  +=3D uio_smx.o
> +obj-$(CONFIG_UIO_GPIO) +=3D uio_ppc_4xx-gpio.o
> diff -upNr linux-2.6.26/drivers/uio-orig/uio-gpio.c linux-2.6.26/driv=
ers/uio/uio-gpio.c
> --- linux-2.6.26/drivers/uio-orig/uio-gpio.c    1970-01-01 01:00:00.0=
00000000 +0100
> +++ linux-2.6.26/drivers/uio/uio-gpio.c 2008-07-18 09:18:56.000000000=
 +0200
> @@ -0,0 +1,59 @@
> +#include <sys/types.h>
> +#include <sys/time.h>
> +#include <sys/stat.h>
> +#include <sys/mman.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +
> +const unsigned long pin_mask( unsigned int pin) { return (0x80000000=
 >> (pin));}
> +
> +const char UIO_DEV[]  =3D "/dev/uio0";
> +const unsigned int UIO_SIZE =3D   0x1000;
> +const unsigned int UIO_ADDR =3D 0xef600700;
> +
> +const int  or =3D 0;
> +const int tcr =3D 1;
> +
> +const unsigned int gpio_pin =3D 0;        /* What gpio pin do you wa=
nt to toggle? */
> +
> +volatile unsigned long *gpio_regs;
> +
> +int main(int argc, char *argv[])
> +{
> +       int uiofd =3D open(UIO_DEV,O_RDWR);
=46or debugging this is OK, in the final application you should add som=
e
tests.  Check the UIO documentation for the details.

> +       if (uiofd < 0)
> +               return uiofd;
> +
> +       unsigned long* map_addr =3D mmap(NULL,
> +                                      UIO_SIZE,
> +                                      PROT_READ | PROT_WRITE,
> +                                      MAP_SHARED,
> +                                      uiofd,
> +                                      0);
> +       if (map_addr =3D=3D ((unsigned long*) -1))
> +               return -1;
> [...]
> diff -upNr linux-2.6.26/drivers/uio-orig/uio_ppc_4xx-gpio.c linux-2.6=
=2E26/drivers/uio/uio_ppc_4xx-gpio.c
> --- linux-2.6.26/drivers/uio-orig/uio_ppc_4xx-gpio.c    1970-01-01 01=
:00:00.000000000 +0100
> +++ linux-2.6.26/drivers/uio/uio_ppc_4xx-gpio.c 2008-07-18 09:23:32.0=
00000000 +0200
> @@ -0,0 +1,74 @@
> +/*
> + * simple UIO GPIO driver.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/uio_driver.h>
> +
> +#include <asm/io.h>
> +
> +static struct uio_info info =3D {
> +       .name =3D "uio_gpio",
> +       .version =3D "0.0.0",
> +       .irq =3D UIO_IRQ_NONE,
> +       .irq_flags =3D 0,
> +        .mem[0].addr =3D 0xef600700,
> +        .mem[0].size =3D 0x1000,
> +       .mem[0].memtype =3D UIO_MEM_PHYS,
> +};
IIRC you should initialise the other mem members.

> +static int __devinit uio_gpio_probe(struct device *dev)
> +{
> +       if (uio_register_device(dev, &info)){
> +               printk(KERN_ERR "uio_gpio: uio_register_device failed=
\n");
> +               return -ENODEV;
> +       }
> +       return 0;
> +}
> +
> +static int uio_gpio_remove(struct device *dev)
> +{
> +       uio_unregister_device(&info);
> +       info.mem[0].addr =3D 0;
> +       info.mem[0].size =3D 0;
> +       return 0;
> +}
Are you sure that overwriting info.mem[0].addr is a good idea?  Then
unbinding the platform device and rebinding it fails to do the right
thing for sure.

> +static struct platform_device *uio_gpio_device;
> +
> +static struct device_driver uio_gpio_driver =3D {
> +       .name           =3D "uio_gpio",
> +       .bus            =3D &platform_bus_type,
> +       .probe          =3D uio_gpio_probe,
> +       .remove         =3D uio_gpio_remove,
> +};
> +
> +
> +static int __init uio_gpio_init(void)
> +{
> +       uio_gpio_device =3D platform_device_register_simple("uio_gpio=
", -1,
> +                                                          NULL, 0);
> +       if (IS_ERR(uio_gpio_device))
> +               return PTR_ERR(uio_gpio_device);
> +
> +       return driver_register(&uio_gpio_driver);
> +}
> +
> +static void __exit uio_gpio_exit(void)
> +{
> +       platform_device_unregister(uio_gpio_device);
> +       driver_unregister(&uio_gpio_driver);
> +}
> +
> +module_init(uio_gpio_init);
> +module_exit(uio_gpio_exit);
> +
> +MODULE_LICENSE("GPL");
The header says this is GPL v2.  So you should use "GPL v2" here, too.

Best regards
Uwe

--=20
Uwe Kleine-K=F6nig, Software Engineer
Digi International GmbH Branch Breisach, K=FCferstrasse 8, 79206 Breisa=
ch, Germany
Tax: 315/5781/0242 / VAT: DE153662976 / Reg. Amtsgericht Dortmund HRB 1=
3962
