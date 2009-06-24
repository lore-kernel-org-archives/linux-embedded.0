From: Stefan Schoenleitner <dev.c0debabe@gmail.com>
Subject: Using UART in kernel driver code on AT91SAM9260
Date: Wed, 24 Jun 2009 10:57:55 +0200
Message-ID: <4A41EA93.2070904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

Hi,

I have a speech codec chip which uses SPI for high-speed PCM data and
UART for control/compressed speech packet transfer.
While I could write a userland device driver that just uses the ttySn
serial device, I would prefer to do that in kernel space since this is
where device drivers belong.
This way a device could be created where compressed speech packets can
be read and written.
Possible device setup functions could be done with IOCTLs.

Now what is the best way to implement this ?

There is the linux/drivers/char/atmel_serial.c driver which I could
modify, so that it also includes the driver code for the speech codec.
However, obviously that would be a really bad idea since it would
duplicate code and completely bypass the linux serial port abstraction
layer.

It would be better to somehow write a speech codec driver that depends
on the UART driver.
Thus on the speech codec serial port no ttySn device should be created
by the UART driver, but instead the speech codec driver should create
the device (e.g. /dev/speechcodec0).
Since the speech codec driver should only do speech codec specific
tasks, it should use the UART driver to send and receive data over the
serial port.

I suppose this it is a common problem that higher level kernel driver
code would like to use lower level driver code.
For example there is the GPIO driver which enables high level kernel
code to use GPIO pins.
It's the same for other communication interfaces like I2C or SPI.
However, these drivers usually do not create a device, but they rather
export kernel symbols which can then be used by higher level kernel code.
Unfortunately, it doesn't seem like the relevant serial port function
symbols are exported ?

On mach-at91 it seems like the UART can be registered by calling the
relevant setup function in
linux/arch/arm/mach-at91/at91sam9260_devices.c which is
at91_register_uart().
However, once I register an uart port, also a ttySn device is created
(which I do not want).

By looking at linux/documentation/serial/driver it seems like bypassing
linux/drivers/serial/serial_core.c seems to be the right way since the
low level linux/drivers/serial/atmel_serial.c already provides the
necessary UART ops in struct uart_ops.
However, these uart_ops are not exported, so I don't know how to access
them.

Is this the right way to go ?
How could I use the low level driver but bypass serial_core ?


It would be great if you could provide some links to documentation and
example code.


cheers,
Stefan
