From: Stefan Schoenleitner <dev.c0debabe@gmail.com>
Subject: optimal hardware design for an ARM9 based single board computer to
 work with existing linux drivers
Date: Sat, 05 Jul 2008 11:03:11 +0200
Message-ID: <486F38CF.40803@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi,

for my project I would like to design an ARM9 based single board computer (SBC)
using the cirrus logic EP9302 CPU:

http://www.cirrus.com/en/pubs/proDatasheet/EP9302_PP3.pdf
http://www.cirrus.com/en/pubs/manual/EP93xx_Users_Guide_UM1.pdf


My goal is to use existing linux drivers together with attached peripheral
hardware without having to patch the driver code.
For this reason I'm looking for the best way to hook up peripheral hardware to
the CPU so that the linux kernel can handle it.


Among other features the CPU has a SPI bus and a total of 27 GPIO pins.
Using bit-banging on some of the available GPIO pins the CPU can also do I2C
communication.
(AFAIK bit-banging I2C on GPIO pins is already suppored by the linux kernel.)

Peripheral hardware (e.g. some linux-supported bluetooth chipset) can be hooked
up to the CPU in the following ways:

	1) directly connect it to the CPU's GPIO pins
	2) connect it to the CPU's GPIO pins in a multiplexed way using a bus
	   switch
	3) hook it up to some existing serial bus (SPI or I2C)
	4) hook it up to some existing _external_ serial bus (USB, UART)
	5) connect it to GPIO pins of a linux-supported GPIO expander that can
	   be accessed over I2C


Now I would like to review the mentioned approaches:


1) directly connect it to the CPU's GPIO pins:

The CPU has 18 standard GPIO pins (usable for I/O) and 19 enhanched GPIO pins
which also have interrupt support.
Obviously, I do not wan't to use all of the available GPIO pins for peripheral
hardware.
Also, if we consider chipset configuration pins, the number of available CPU
GPIO pins would not suffice.
For this reason, IMHO a direct connection of peripheral hardware to the CPU's
GPIO pins is not a reasonable design decision.


2) connect it to the CPU's GPIO pins in a multiplexed way using a bus switch

This approach is similar to 1) except for the difference that the CPUs GPIO pins
are multiplexed using a bus switch.
Thus different peripheral chipsets could be accessed in the following way:

	1. address the according bus switch so that the CPU's required GPIO are
	   routed through to the chip we want to talk to
	2. communicate with the chip

Again to save GPIO pins, the various bus switches could be addressed over a
serial bus like I2C.
While this communication is certainly suitable for high-speed devices, it also
has the drawback that the CPU's GPIO lines need to be routed all over the PCB
(printed circuit board) to the different bus switches and from there to the
chips we want to talk to.
Since I plan to use low-speed devices only, I do not want to make the hardware
design too complex.
For this reason I'd rather not take this design decision.


3) hook it up to some existing serial bus (SPI or I2C)

If the peripheral hardware chipset has support for serial communication, this
would be the easiest way to go.
Since there's already linux support for SPI as well as for I2C I would like to
use this way of talking to low-speed hardware whenever possible.


4) hook it up to some existing _external_ serial bus (USB, UART)

The single board computer should have external connections to the "outside world".
One serial port should be used as serial console while the other one will be
used for something else.
The USB connectors should be usable to connect arbitrary devices which are
supported by the linux kernel (e.g. external harddisk, webcam, whatever ...).
Also, usually peripheral hardware chips do not support USB.
For this reason this approach will not be taken for peripheral hardware access.


5) connect it to GPIO pins of a linux-supported GPIO expander that can be
accessed over I2C

This is IMHO a very promising approach which also has been taken in various
other (linux-compatible) designs I found on the internet
(e.g. the "DaVinci prototyping board",
http://www.linuxdevices.com/news/NS2209350555.html).

The idea is to connect a GPIO expander to the CPU's I2C bus which provides a
number (i.e. 8, 16, ..) of freely usable GPIO pins.
These GPIO pins are then connected to the peripheral hardware.
The linux kernel already has support for various GPIO expanders like the PCA9539
(16 port) or the PCF8574 (8 port) chips.
As far as I read in the kernel documentation, the drivers transparently map
those GPIO pins to the GPIO interface of the linux kernel.
Thus, from a device driver perspective, it makes no difference whether a device
is connected to the CPU's "real" GPIO pins or to a GPIO expander chip which can
be accessed over thr I2C bus.

Another advantage is the simple circuit design: Instead of having to route a
complete parallel bus over the PCB, only the serial I2C bus has to be routed
from the CPU to the port expander.
From the port expander a rather short bus then goes to the low-speed chip we
want to talk to.

In my oppinion, from a hardware as well as from a software perspective, this is
the right way to go.





As we saw, from a software perspective, it doesn't seem to make a big difference
whether peripheral hardware is directly hooked up to the CPU's GPIO pins or
it is hooked up to GPIO expanders.


* However, if we look at existing device drivers, will it be possible to use
them with this setup without modification ?

* How will the kernel find devices attached to GPIO pins ?
(There's no way to scan the bus since the kernel doesn't know what and where
devices are attached to the GPIO pins, right ?)

* What would be the best way to attach peripheral hardware from a linux-kernel
perspective ?

* Can you suggest any embedded hardware design documentation that considers
linux compatibility ?


sincerly,
stefan
