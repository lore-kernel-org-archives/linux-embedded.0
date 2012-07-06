From: Li Yang-R58472 <r58472@freescale.com>
Subject: RE: rionet driver with MMIO DMA capability
Date: Fri, 6 Jul 2012 02:51:41 +0000
Message-ID: <94F013E7935FF44C83EBE7784D62AD3F0934AA59@039-SN2MPN1-022.039d.mgd.msft.net>
References: <CAFbQSaDWXTg429q-tTRvcgAEsA1OmHzFVhPNOmSRnWjMpSZfpA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <CAFbQSaDWXTg429q-tTRvcgAEsA1OmHzFVhPNOmSRnWjMpSZfpA@mail.gmail.com>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vineeth <vneethv@gmail.com>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linuxppc-embedded@ozlabs.org" <linuxppc-embedded@ozlabs.org>, Wood Scott-B07421 <B07421@freescale.com>, "mporter@kernel.crashing.org" <mporter@kernel.crashing.org>
Cc: "ranenikhil19@gmail.com" <ranenikhil19@gmail.com>, Alexandre Bounine <alexandre.bounine@idt.com>



> -----Original Message-----
> From: Linuxppc-dev [mailto:linuxppc-dev-
> bounces+leoli=3Dfreescale.com@lists.ozlabs.org] On Behalf Of Vineeth
> Sent: Wednesday, July 04, 2012 1:16 AM
> To: linux-embedded@vger.kernel.org; linuxppc-dev@lists.ozlabs.org;
> linuxppc-embedded@ozlabs.org; Wood Scott-B07421;
> mporter@kernel.crashing.org
> Cc: ranenikhil19@gmail.com
> Subject: rionet driver with MMIO DMA capability
>=20
>=20
> Hi,
>=20
> With kernel mainstream version 3.5.rc-5 there's SRIO low level driver
> with DMA support for MMIO. But the rionet driver in the same kernel
> version doesnt support MMIO.
>=20
> We are trying to find the maximum bandwidth that we can achieve using=
 our
> custom board's(quad MPC8641 )=A0 4-lane SRIO.
> Now we are worried how to use this SRIO low level driver effectively =
?
>=20
> The RIOnet driver (with 3.5.-rc5) uses message based communication. T=
his
> doesnt use the DMA capability of low level driver. with this we are
> getting a bandwidth of nearly 900Mbps, which is very less.
>=20
> Is there any example code or modified middle ware driver for rionet/ =
or
> any code which uses the low level driver apis with MMIO DMA??

We provided the support for DMA in the old BSPs but didn't got the luck=
 to make it upstream.  I heard Alex (CCed) is working on an upstream-ab=
le version of the feature.  Probably he can help to provide some code.

Leo
