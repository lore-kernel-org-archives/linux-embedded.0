From: Hugo Villeneuve <hugo@hugovil.com>
Subject: Re: FPGA programming driver architecture
Date: Thu, 8 Jan 2009 15:18:27 -0500
Message-ID: <20090108151827.72f50cee.hugo@hugovil.com>
References: <20081212150314.6ea24996.hugo@hugovil.com>
	<200812131358.03010.florian@openwrt.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200812131358.03010.florian@openwrt.org>
Sender: linux-embedded-owner@vger.kernel.org
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
> ...
> What about something like that :
>=20
> - fpgaload-core which contains all the code that can be shared
> between the drivers like requesting firmware, providing sysfs
> attributes,=20
> - fpgaload-spi would handle the low-level SPI connection
> - fpgaload-par would handle the low-level parallel connection
>=20
> fpgaload-ser and par would register with fpgaload-core and they could
> register a fpga loading callback which is low-level specific for
> instance. Platform code would instantiate the core driver. That way,
> adding support for other loading protocols like slave serial or
> master serial can be done easily.

Yes, but how I actually implement fpgaload_core, fpgaload_ser and
fpgaload_par?

Bus driver?
class driver?
platform driver?

I am not sure how I should implement things and how each low-level
specific driver should register with the fpgaload_core driver...

Hugo V.

---------------
Hugo Villeneuve
www.hugovil.com
---------------
