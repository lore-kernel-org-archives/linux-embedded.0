From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Book about embedded-type device drivers
Date: Fri, 1 Aug 2008 10:42:10 +0200
Message-ID: <20080801104210.462583ee@surf>
References: <4890724F.2020505@gmail.com>
	<20080730140113.GY8254@pengutronix.de>
	<4892AF01.7040205@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4892AF01.7040205@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-embedded@vger.kernel.org

Le Fri, 01 Aug 2008 08:36:49 +0200,
Stefan Schoenleitner <dev.c0debabe@gmail.com> a =C3=A9crit :

> I read various papers and kernel documentation, parts of it also
> being from the second edition of the book.
> However, I just saw that there's a newer (third edition) available.
> It's online under a CC license: http://lwn.net/Kernel/LDD3/

The 3rd edition is certainly newer than the second, but starts to be
quite old. It has been written against the 2.6.10/2.6.11 kernels.

> However, although the book gives a good intoduction on writing
> drivers, it seems to miss some parts like SPI, I2C, board
> implementation and such. IMHO the best way is to use the book as
> reference for driver implementation and to read the existing AT91
> kernel code.

In addition to =C2=AB Linux Device Drivers =C2=BB, a good book is =C2=AB=
 Essential
Linux Device Drivers =C2=BB, from Sreekrishnan Venkateswaran, available=
 at
Prentice Hall. This book is very recent (April 2008).

  1. Introduction
  2. A peek inside the kernel (timers, concurrency, memory, etc.)
  3. Kernel facilities (threads, helper interfaces)
  4. Laying the groundwork (IRQ, device model, memory barriers, etc.)
  5. Character drivers
  6. Serial drivers (including TTY drivers and line discipline drivers)
  7. Input drivers (evdev interface, serio, keyboard, mice, touch
     controllers, accelerometers, etc.)
  8. I2C (I2C core, EEPROM driver, RTC driver, i2c-dev, SPI, 1-wire)
  9. PCMCIA and Compact Flash
 10. PCI
 11. USB
 12. Video drivers (frame buffer, console drivers)
 13. Audio drivers
 14. Block drivers
 15. Network interface cards
 16. Linux without wires (Bluetooth, Infrared, Wifi)
 17. MTD
 18. Embedded Linux
 19. Drivers in userspace
 20. More devices and drivers
 21. Debugging device drivers
 22. Maintenance and delivery
 23. Shutting Down

I'm at the end of chapter 8, and until now, it's really good.

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
