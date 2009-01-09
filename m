From: Hugo Villeneuve <hugo@hugovil.com>
Subject: Re: FPGA programming driver architecture
Date: Fri, 9 Jan 2009 10:07:25 -0500
Message-ID: <20090109100725.77a07e74.hugo@hugovil.com>
References: <20081212150314.6ea24996.hugo@hugovil.com>
	<200812131358.03010.florian@openwrt.org>
	<20090108151827.72f50cee.hugo@hugovil.com>
	<82ecf08e0901081414u15af3c2dy9c88a242db024dc7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <82ecf08e0901081414u15af3c2dy9c88a242db024dc7@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thiago Galesi <thiagogalesi@gmail.com>
Cc: Florian Fainelli <florian@openwrt.org>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Thu, 8 Jan 2009 20:14:36 -0200
"Thiago Galesi" <thiagogalesi@gmail.com> wrote:

> > > > Hi,
> > > > I have written some code to program a FPGA in Linux, for two
> > > > different types of boards: one uses a serial interface (SPI) an=
d
> > > > the second a parallel interface. I have been able to sucessfull=
y
> > > > program both boards. I'm now trying to clean my code and make i=
t
> > > > more generic, as well as better in line with the Linux driver
> > > > model.
>=20
> Considering the several FPGA models available and ways to program it,
> I guess the important thing to consider is what can be made generic.
> (that is what will become fpgaload)

I have a pretty good idea of what goes into the core and
what goes into the specific interface modules (spi, parallel, etc).

> Also, there may be cases where after FPGA is programmed it "becomes a
> device" (PCI or whatever)

This is exactly the case for my board, but it doesn=B4t change anything
to the programming side of things, apart for the fact that the FPGA
must be configured before using any in-FPGA PCI bus for example.

> > > - fpgaload-core which contains all the code that can be shared
> > > between the drivers like requesting firmware, providing sysfs
> > > attributes,
> > > - fpgaload-spi would handle the low-level SPI connection
> > > - fpgaload-par would handle the low-level parallel connection
>=20
> I think this maybe split into three layers (maybe)
>=20
> 1 - low level connection: paralell / spi / i2c / whatever
> 2 - vendor: xylinx, altera, etc
> 3 - generic stuff
>=20
> Take a look at the MTD and SPI drivers and how they split things

I think that for the moment, I will focus on implementing the core
module and the parallel/SPI interfaces only. Later we may want to add
more fonctionality (vendors, JTAG, etc).

But for now, my main problem is that I need to have some insight on how
I actually implement the different modules:

Bus driver?
class driver?
platform driver?

Can anybody give some advice on that?

Thank-you, Hugo.

---------------
Hugo Villeneuve
www.hugovil.com
---------------
