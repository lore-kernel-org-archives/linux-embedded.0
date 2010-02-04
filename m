From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: xilinx_spi in linux-next
Date: Thu, 4 Feb 2010 07:36:05 -0700
Message-ID: <fa686aa41002040636ubb0e156ybae9774b27bfe4f1@mail.gmail.com>
References: <20100203201451.7e8368f7.akpm@linux-foundation.org> 
	<4B6A8E4A.5020204@pelagicore.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4B6A8E4A.5020204@pelagicore.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Richard_R=F6jfors?= <richard.rojfors@pelagicore.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paul Mundt <lethal@linux-sh.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-embedded@vger.kernel.org

[cc'ing linux-kernel & linux-embedded]

On Thu, Feb 4, 2010 at 2:07 AM, Richard R=F6jfors
<richard.rojfors@pelagicore.com> wrote:
> On 02/04/2010 05:14 AM, Andrew Morton wrote:
>>
>> Breaks sparc64 allmodconfig:
>>
>>
>> drivers/spi/xilinx_spi.c: In function `xspi_write32_be':
>> drivers/spi/xilinx_spi.c:108: error: implicit declaration of functio=
n
>> `iowrite32be'
>> drivers/spi/xilinx_spi.c: In function `xspi_read32_be':
>> drivers/spi/xilinx_spi.c:113: error: implicit declaration of functio=
n
>> `ioread32be'
>
> I did a quick grep in the sparc's arch tree and the big endian versio=
ns of
> io(read/write) are not implemented. So the driver can not be compiled=
 on
> sparc,
> I think we have to put harder limits in the Kconfig. The driver has n=
ot
> worked on sparc
> before anyway.

I can easily tighten up the Kconfig limits (ARM has the same problem),
but I'd like to know what the right thing to do here is to write a
portable driver.  This device is implemented on a Xilinx FPGA, so it
is totally feasable it to be wired up to any architecture, especially
on embedded stuff.  So far it works with PowerPC, Microblaze and x86,
and it will most likely show up on ARM in the near future.

The most likely deviation is byte lane ordering either being big or
little endian, hence the driver using both io{read,write}32() and
io{read,write}32be(), but the 'be' variants aren't implemented on all
architectures.  What's a driver author to do when trying to write
portable code?

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
