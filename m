From: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: Super Fast Boot of Embedded Linux: 300 ms from boot loader to
 shell
Date: Thu, 14 Apr 2011 09:43:35 +0200
Message-ID: <4DA6A5A7.2060701@parrot.com>
References: <BANLkTi=Zahmo_d1Fo7JnaD3iJHAuhSAZGQ@mail.gmail.com>	<4DA331F9.5070902@gmail.com> <BANLkTimLGVfS=wbkmYMRkirsARwFHNYWVw@mail.gmail.com> <4DA5DD10.6030305@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4DA5DD10.6030305@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Constantine Shulyupin <const@makelinux.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Hi,

Marco Stornelli a =E9crit :
> Il 13/04/2011 16:53, Constantine Shulyupin ha scritto:
>> Thank you Marco for your feedback. I've added summary of used
>> optimization method:
>> =95 Reduction of kernel and filesystem size
>> =95 Kernel features: naked boot, initrd without compression
>> =95 Optimization of NAND flash interface in boot loader
>> =95 Boot time was measured with utility tstamp
>> =95 You can find more detailed list of methods at http://elinux.org/=
Boot_Time
>> =95 Techniques for improving embedded Linux startup time, presentati=
on:
>> http://www.makelinux.com/emb/fastboot/MontaVista
>>
>> Actually, detailed implementations of optimization methods are
>> described in numerous documents.
>=20
> I really know. I was talking about *your* optimization method, but if=
 I=20
> well understand you've just applied a list of well known methods.

Not to say such case are not interesting : loading a linux kernel with =
only a
serial driver, a ramdisk and a shell as init doesn't reflect reality.

In real product what you want if fast user interaction (sound, mounting=
 big
filesystem with user data, lcd display, ...)


Matthieu
