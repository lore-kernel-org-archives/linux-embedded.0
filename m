From: Michelle Konzack <linux4michelle@tamay-dogan.net>
Subject: Re: optimal hardware design for an ARM9 based single board computer to work with existing linux drivers
Date: Wed, 9 Jul 2008 01:14:50 +0200
Message-ID: <20080708231450.GC2066@freenet.de>
References: <486F38CF.40803@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <486F38CF.40803@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: linux-embedded@vger.kernel.org


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hallo Stefan,

Ich habe ein =E4hnliches project / I have a similar project.

Am 2008-07-05 11:03:11, schrieb Stefan Schoenleitner:
> Hi,
>=20
> for my project I would like to design an ARM9 based single board computer=
 (SBC)
> using the cirrus logic EP9302 CPU:
>=20
> http://www.cirrus.com/en/pubs/proDatasheet/EP9302_PP3.pdf
> http://www.cirrus.com/en/pubs/manual/EP93xx_Users_Guide_UM1.pdf

Simpy forget it...  discontinued.
Cirrus does not recommend it for new designs.
Maybe you schould go with a Freescale.  (Me too)

> For this reason I'm looking for the best way to hook up peripheral hardwa=
re to
> the CPU so that the linux kernel can handle it.

Hehe me too

> Among other features the CPU has a SPI bus and a total of 27 GPIO pins.
> Using bit-banging on some of the available GPIO pins the CPU can also do =
I2C
> communication.
> (AFAIK bit-banging I2C on GPIO pins is already suppored by the linux kern=
el.)

I have tested bit-banging on a LH7A411 bit it eat up  CPU  time  as  the
hell.  I have attached an I=B2C-Master which do the stuff...  3.48=A4  and
the problem is history...

> 	1) directly connect it to the CPU's GPIO pins

This would be the fastestes method.

> 	2) connect it to the CPU's GPIO pins in a multiplexed way using a bus
> 	   switch
> 	3) hook it up to some existing serial bus (SPI or I2C)

Bluetooth over I2C? - Good luck.

> 	4) hook it up to some existing _external_ serial bus (USB, UART)

I am using for some devices the USB port on the CPU and  connected  a  7
port USB2.0 hub to it...  Not the best solution, but it works perfectly.

and of course, the the whole USB-Tree is  Linux-Supported.  No  need  to
reinvent the weel

> 4) hook it up to some existing _external_ serial bus (USB, UART)
>=20
> The single board computer should have external connections to the "outsid=
e world".
> One serial port should be used as serial console while the other one will=
 be
> used for something else.
> The USB connectors should be usable to connect arbitrary devices which are
> supported by the linux kernel (e.g. external harddisk, webcam, whatever .=
=2E.).
> Also, usually peripheral hardware chips do not support USB.
> For this reason this approach will not be taken for peripheral hardware a=
ccess.

How many USB Hosts does the Chip has exactly?

Maybe you could do the same as me with a 7-port USB 2.0 hub.

One of my Meto-Stations need MANY USB-Ports so I have connected a 4-port
hub to the LH7A411 and on the 4 ports of the 4-port hub again 4 USB Hubs
with 7 ports...

Now my Meto-Station has 28 USB ports availlable, supporting (in theorie)
version 2.0...  I have not found a solution less expensive as this one.

Now I can connect ANY hardware, like Bluetooth, WiFi, IR or what else to
it

> 5) connect it to GPIO pins of a linux-supported GPIO expander that can be
> accessed over I2C
>=20
> This is IMHO a very promising approach which also has been taken in vario=
us
> other (linux-compatible) designs I found on the internet
> (e.g. the "DaVinci prototyping board",
> http://www.linuxdevices.com/news/NS2209350555.html).
>=20
> The idea is to connect a GPIO expander to the CPU's I2C bus which provide=
s a
> number (i.e. 8, 16, ..) of freely usable GPIO pins.

I have gotten some differenttypes from Philips/NXP, but currently I have
not found support in the Kernel except one (since 6 weeks?).

AFAIK there are some peoples working on it.

> These GPIO pins are then connected to the peripheral hardware.
> The linux kernel already has support for various GPIO expanders like the =
PCA9539
> (16 port) or the PCF8574 (8 port) chips.

This is the one I am currently using...  and it works very nice.

> As far as I read in the kernel documentation, the drivers transparently m=
ap
> those GPIO pins to the GPIO interface of the linux kernel.
> Thus, from a device driver perspective, it makes no difference whether a =
device
> is connected to the CPU's "real" GPIO pins or to a GPIO expander chip whi=
ch can
> be accessed over thr I2C bus.

Right.

> Another advantage is the simple circuit design: Instead of having to rout=
e a
> complete parallel bus over the PCB, only the serial I2C bus has to be rou=
ted
> from the CPU to the port expander.

Be careful with the speed of the I=B2C bus.  If you use bit-banging,  you
can run into trouble.  bit-banging is realy only for very-cheep hardware
where you not realy care about timings...

> As we saw, from a software perspective, it doesn't seem to make a big dif=
ference
> whether peripheral hardware is directly hooked up to the CPU's GPIO pins =
or
> it is hooked up to GPIO expanders.

This is a good question.  Since I am beginning to go into this  business
(studied electronic for more then 13 years and was working  only  french
@army and have no experience in it)  your  questions  fit  100%  my  own
questions

> * However, if we look at existing device drivers, will it be possible to =
use
> them with this setup without modification ?
>=20
> * How will the kernel find devices attached to GPIO pins ?
> (There's no way to scan the bus since the kernel doesn't know what and wh=
ere
> devices are attached to the GPIO pins, right ?)

This is what I am asking me too...
I have tried to read the Kernel-Sources but...  HELL!!!

I am not a Kernel-Geek!

> * What would be the best way to attach peripheral hardware from a linux-k=
ernel
> perspective ?

USB  ;-)

> * Can you suggest any embedded hardware design documentation that conside=
rs
> linux compatibility ?

Thanks, Greetings and nice Day/Evening
    Michelle Konzack
    Systemadministrator
    24V Electronic Engineer
    Tamay Dogan Network
    Debian GNU/Linux Consultant


--=20
Linux-User #280138 with the Linux Counter, http://counter.li.org/
##################### Debian GNU/Linux Consultant #####################
Michelle Konzack   Apt. 917                  ICQ #328449886
+49/177/9351947    50, rue de Soultz         MSN LinuxMichi
+33/6/61925193     67100 Strasbourg/France   IRC #Debian (irc.icq.com)

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.pgp"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFIc/TpC0FPBMSS+BIRAnoUAKCX1C9NLDYh+ZKPsZ1fyrxkn3UK1ACcDz/k
FhAgwWgiywR+nm19zhwlGdM=
=GsUi
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
