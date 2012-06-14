From: Christophe Aeschlimann <c.aeschlimann@acn-group.ch>
Subject: Re: Q: file system for embedded
Date: Thu, 14 Jun 2012 10:34:51 +0200
Message-ID: <4FD9A22B.7060207@acn-group.ch>
References: <CAJ2oMh++ji7YBrx6UcLdhPVDmLuTZCr8kGQR8aEAYWyob_ccBQ@mail.gmail.com> <CAJ2oMhLpMJZ_UT1Z+12s7=5hGjRbA9WNvv3CU4m9B2rDp9yr3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <CAJ2oMhLpMJZ_UT1Z+12s7=5hGjRbA9WNvv3CU4m9B2rDp9yr3Q@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ran Shalit <ranshalit@gmail.com>
Cc: linux-embedded@vger.kernel.org

Hi,

Le 13.06.2012 23:31, Ran Shalit a =E9crit :

> Hello,
>=20
> I hope you can help main understand issue of file system for embedded=
 linux.
> I read free-electrons "Embedded Linux system development training" an=
d
> some of the files recommended there such as cramfs, are aceesing the
> flash during execution of apllications. As far as I understand
> accessing the flash after initilization is not good in embedded
> system.


Define not good... some applications requires write accesses to the
flash. (how would you program music in your MP3 player ? Where do you
store crash dumps so they are persistent across reboot ? Where do you
store your user configurable options, etc.)

There are different kinds of flash memory but each have a limited numbe=
r
of program/erase cycle so you have to use them sparingly. (e.g. make
sure the write accesses are distributed across the chip that's called
"wear levelling", detect when bits have toggled and correct the error
using some extra redundancy stored in the out-of-band area of each bloc=
k
(e.g. ECC). If the error cannot be repaired mark the block as unusable.

When you access the bare memory chips then these issues are solved in
the different layers of MTD [1] and the specific flash file system [2] =
:
JFFS2, UBIFS, etc.

If you don't access the bare memory chips e.g. you use eMMC or an SSD
these problems are left to a dedicated controller/firmware.

[1] http://www.linux-mtd.infradead.org/index.html
[2] http://elinux.org/File_Systems

Best regards,

--=20
Christophe Aeschlimann

Embedded Software Engineer & IT Manager
ACN Advanced Communications Networks S.A.
2000 - Neuch=E2tel, Switzerland
Tel. +41 32 724 74 31
