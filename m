From: Stefan Schoenleitner <dev.c0debabe@gmail.com>
Subject: Re: AT91 kernel programming documentation ?
Date: Fri, 01 Aug 2008 08:36:49 +0200
Message-ID: <4892AF01.7040205@gmail.com>
References: <4890724F.2020505@gmail.com> <20080730140113.GY8254@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080730140113.GY8254@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: linux-embedded@vger.kernel.org

Hi,

Robert Schwebel wrote:
> [...]
> 
>> Now I would like to add different hardware to the board and write some
>> kernel code for it.
> 
> What kind of hardware?

An audio codec (TLV320AIC23B) connected to the I2C and I2S (over Atmel SSC) bus.
There seems to be a codec driver already (drivers/media/video/tlv320aic23b.c)
though it looks like I'll have to modify the driver a bit to support other
sampling rates as well.
Currently my first goal is to get the audio codec up and running so that it
works with ALSA.

Then I would like to add two SPI devices as well.
Since most of the chipselect lines are already used I was thinking of using a
demultiplexer which is supported by the AT91SAM9260.

Due to the fact that the board will be a custom design, I guess I will also have
to write a board implementation (i.e. arch/arm/mach-at91/board-<myboardname>.c)
so that the kernel for example knows which ports are used for communication
buses on the pins.

Reading the source code already shed a little light on how things are done.


> 
>> Unfortunately, there doesn't seem to be a lot of documentation. At
>> the moment I'm reading mach-at91 related source code and trying to
>> find out how things work.
> 
> I assume you've already bought a copy of the Rubini Device Driver book?

I read various papers and kernel documentation, parts of it also being from the
second edition of the book.
However, I just saw that there's a newer (third edition) available.
It's online under a CC license: http://lwn.net/Kernel/LDD3/

However, although the book gives a good intoduction on writing drivers, it seems
to miss some parts like SPI, I2C, board implementation and such.
IMHO the best way is to use the book as reference for driver implementation and
to read the existing AT91 kernel code.

>> Specificly, I would like to know how the different SoC devices can be
>> accessed and used, how I can do port multiplexing, how I can tell the
>> kernel which hardware is attached to where and so on.
> 
> Check arch/arm/mach-at91/*. It very much depends on what you want to do.
> Documentation/drivermodel/ might also be worth a look.

arch/arm/mach-at91 is where I looked at the source most of the time.
However, I didn't notice Documentation/drivermodel until now.
Thank you for mentioning it.
