From: Constantine Shulyupin <const@makelinux.com>
Subject: Re: Super Fast Boot of Embedded Linux: 300 ms from boot loader to shell
Date: Wed, 13 Apr 2011 17:53:45 +0300
Message-ID: <BANLkTimLGVfS=wbkmYMRkirsARwFHNYWVw@mail.gmail.com>
References: <BANLkTi=Zahmo_d1Fo7JnaD3iJHAuhSAZGQ@mail.gmail.com>
	<4DA331F9.5070902@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4DA331F9.5070902@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: linux-embedded@vger.kernel.org

Thank you Marco for your feedback. I've added summary of used
optimization method:
=95 Reduction of kernel and filesystem size
=95 Kernel features: naked boot, initrd without compression
=95 Optimization of NAND flash interface in boot loader
=95 Boot time was measured with utility tstamp
=95 You can find more detailed list of methods at http://elinux.org/Boo=
t_Time
=95 Techniques for improving embedded Linux startup time, presentation:
http://www.makelinux.com/emb/fastboot/MontaVista

Actually, detailed implementations of optimization methods are
described in numerous documents.

On Mon, Apr 11, 2011 at 7:53 PM, Marco Stornelli
<marco.stornelli@gmail.com> wrote:
> Il 11/04/2011 16:02, Constantine Shulyupin ha scritto:
>>
>> Hello all,
>>
>> Make Linux Software presents the fastest ever embedded Linux boot fo=
r
>> 720 MHz ARM and NAND flash memory. Linux boot time is 300 millisecon=
ds
>> from boot loader to shell. The first goal of the project is to achie=
ve
>> a minimal boot time of a minimal but functional Linux system on comm=
on
>> hardware. The second goal is to provide a platform for developing mo=
re
>> functional systems with an even minimized boot time.
>>
>
> Hi,
>
> is it a marketing announcement or a presentation of an innovative sol=
ution?
> In the first case don't send this kind of email to this mailing list.=
 In the
> second one, could you explain to us your "fast boot" solution or your=
 kernel
> modifications? I can't find any implementation details on the web sit=
e.
>
> Marco
>



--=20
Constantine Shulyupin
http://www.MakeLinux.com/
Embedded Linux Systems,
Device Drivers, TI DaVinci
