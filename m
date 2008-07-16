From: "=?ISO-8859-1?Q?Andr=E9s_Calder=F3n?=" <andres.calderon@emqbit.com>
Subject: Re: optimal hardware design for an ARM9 based single board computer to work with existing linux drivers
Date: Tue, 15 Jul 2008 20:18:29 -0500
Message-ID: <6e36f2f00807151818g20baa79dx7dba203ebc97e298@mail.gmail.com>
References: <486F38CF.40803@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=h5o/UPbh1xmtQB7XOdcgpn8NUAJ5P+lGLRUjHEjVg8U=;
        b=lwKtivfB6Ob6W8pD/BSK3KfKxcOfclJN3vdxoDU/524mAZAMNRsZBz/ermXJzb1iUw
         rUnfRypSRqh5pdi8UW7I81IwdZC+s5zo4iOo5fc6SRB/dLa+I6J/Rgzo1rF58hvKbSVf
         orBo4M1ttWNkSN5MsngY+x9gkfWI0rkVs8VmI=
In-Reply-To: <486F38CF.40803@gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Stefan Schoenleitner <dev.c0debabe@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Sat, Jul 5, 2008 at 4:03 AM, Stefan Schoenleitner
<dev.c0debabe@gmail.com> wrote:
> Hi,
>
> for my project I would like to design an ARM9 based single board comp=
uter (SBC)
> using the cirrus logic EP9302 CPU:
>

The AT91SAM9 family is a better choice[1], the ATMEL and community
support is great [2][3].
[1] http://www.atmel.com/dyn/products/devices.asp?family_id=3D605
[2] http://www.linux4sam.org
[3] http://maxim.org.za/at91_26.html

The AT91SAM9260  and the older AT91RM9200 is available in  TQFP208 pack=
age.
Both support SD Cards, Ethernet, USB, SPI,I2C, a lot of GPIOs... ADCs
only in the AT91SAM9260.

The at91 lacks of FPU, but the cirrus maverick crunch support is very p=
oor.


> http://www.cirrus.com/en/pubs/proDatasheet/EP9302_PP3.pdf
> http://www.cirrus.com/en/pubs/manual/EP93xx_Users_Guide_UM1.pdf
>
>
> My goal is to use existing linux drivers together with attached perip=
heral
> hardware without having to patch the driver code.
> For this reason I'm looking for the best way to hook up peripheral ha=
rdware to
> the CPU so that the linux kernel can handle it.
>
>
> Among other features the CPU has a SPI bus and a total of 27 GPIO pin=
s.
> Using bit-banging on some of the available GPIO pins the CPU can also=
 do I2C
> communication.
> (AFAIK bit-banging I2C on GPIO pins is already suppored by the linux =
kernel.)
>
> Peripheral hardware (e.g. some linux-supported bluetooth chipset) can=
 be hooked
> up to the CPU in the following ways:
>
>        1) directly connect it to the CPU's GPIO pins
>        2) connect it to the CPU's GPIO pins in a multiplexed way usin=
g a bus
>           switch
>        3) hook it up to some existing serial bus (SPI or I2C)
>        4) hook it up to some existing _external_ serial bus (USB, UAR=
T)
>        5) connect it to GPIO pins of a linux-supported GPIO expander =
that can
>           be accessed over I2C
>
>
> Now I would like to review the mentioned approaches:
>
>
> 1) directly connect it to the CPU's GPIO pins:
>
> The CPU has 18 standard GPIO pins (usable for I/O) and 19 enhanched G=
PIO pins
> which also have interrupt support.
> Obviously, I do not wan't to use all of the available GPIO pins for p=
eripheral
> hardware.
> Also, if we consider chipset configuration pins, the number of availa=
ble CPU
> GPIO pins would not suffice.
> For this reason, IMHO a direct connection of peripheral hardware to t=
he CPU's
> GPIO pins is not a reasonable design decision.
>
>
> 2) connect it to the CPU's GPIO pins in a multiplexed way using a bus=
 switch
>
> This approach is similar to 1) except for the difference that the CPU=
s GPIO pins
> are multiplexed using a bus switch.
> Thus different peripheral chipsets could be accessed in the following=
 way:
>
>        1. address the according bus switch so that the CPU's required=
 GPIO are
>           routed through to the chip we want to talk to
>        2. communicate with the chip
>
> Again to save GPIO pins, the various bus switches could be addressed =
over a
> serial bus like I2C.
> While this communication is certainly suitable for high-speed devices=
, it also
> has the drawback that the CPU's GPIO lines need to be routed all over=
 the PCB
> (printed circuit board) to the different bus switches and from there =
to the
> chips we want to talk to.
> Since I plan to use low-speed devices only, I do not want to make the=
 hardware
> design too complex.
> For this reason I'd rather not take this design decision.
>
>
> 3) hook it up to some existing serial bus (SPI or I2C)
>
> If the peripheral hardware chipset has support for serial communicati=
on, this
> would be the easiest way to go.
> Since there's already linux support for SPI as well as for I2C I woul=
d like to
> use this way of talking to low-speed hardware whenever possible.
>
>
> 4) hook it up to some existing _external_ serial bus (USB, UART)
>
> The single board computer should have external connections to the "ou=
tside world".
> One serial port should be used as serial console while the other one =
will be
> used for something else.
> The USB connectors should be usable to connect arbitrary devices whic=
h are
> supported by the linux kernel (e.g. external harddisk, webcam, whatev=
er ...).
> Also, usually peripheral hardware chips do not support USB.
> For this reason this approach will not be taken for peripheral hardwa=
re access.
>
>
> 5) connect it to GPIO pins of a linux-supported GPIO expander that ca=
n be
> accessed over I2C
>
> This is IMHO a very promising approach which also has been taken in v=
arious
> other (linux-compatible) designs I found on the internet
> (e.g. the "DaVinci prototyping board",
> http://www.linuxdevices.com/news/NS2209350555.html).
>
> The idea is to connect a GPIO expander to the CPU's I2C bus which pro=
vides a
> number (i.e. 8, 16, ..) of freely usable GPIO pins.
> These GPIO pins are then connected to the peripheral hardware.
> The linux kernel already has support for various GPIO expanders like =
the PCA9539
> (16 port) or the PCF8574 (8 port) chips.
> As far as I read in the kernel documentation, the drivers transparent=
ly map
> those GPIO pins to the GPIO interface of the linux kernel.
> Thus, from a device driver perspective, it makes no difference whethe=
r a device
> is connected to the CPU's "real" GPIO pins or to a GPIO expander chip=
 which can
> be accessed over thr I2C bus.
>
> Another advantage is the simple circuit design: Instead of having to =
route a
> complete parallel bus over the PCB, only the serial I2C bus has to be=
 routed
> from the CPU to the port expander.
> >From the port expander a rather short bus then goes to the low-speed=
 chip we
> want to talk to.
>
> In my oppinion, from a hardware as well as from a software perspectiv=
e, this is
> the right way to go.
>
>
>
>
>
> As we saw, from a software perspective, it doesn't seem to make a big=
 difference
> whether peripheral hardware is directly hooked up to the CPU's GPIO p=
ins or
> it is hooked up to GPIO expanders.
>
>
> * However, if we look at existing device drivers, will it be possible=
 to use
> them with this setup without modification ?
>
> * How will the kernel find devices attached to GPIO pins ?
> (There's no way to scan the bus since the kernel doesn't know what an=
d where
> devices are attached to the GPIO pins, right ?)
>
> * What would be the best way to attach peripheral hardware from a lin=
ux-kernel
> perspective ?
>
> * Can you suggest any embedded hardware design documentation that con=
siders
> linux compatibility ?
>
>
> sincerly,
> stefan
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embed=
ded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



--=20
 Andr=E9s Calder=F3n
 Cel: +57 (300) 275 3666
 Email: andres.calderon@emqbit.com
 Web: www.emqbit.com

 "El hombre que produce mientras otros
 disponen de su producto, es un esclavo."
 -- Ayn Rand
