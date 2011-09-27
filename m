From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: dma_unmap_single() lacking cache sync on some archs?
Date: Tue, 27 Sep 2011 20:27:28 +0200
Message-ID: <2071463.ueDZJJtM1L@wuerfel>
References: <4E81BDEE.2080601@enea.com> <CAF8ieYUPcer2ZwaOi6YbiZQPeDBFukT2_dPStH10G_15Rh1fpw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAF8ieYUPcer2ZwaOi6YbiZQPeDBFukT2_dPStH10G_15Rh1fpw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?H=E5vard?= Skinnemoen <hskinnemoen@gmail.com>
Cc: Arvid Brodin <arvid.brodin@enea.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Hans-Christian Egtvedt <egtvedt@samfundet.no>

On Tuesday 27 September 2011 09:55:02 H=E5vard Skinnemoen wrote:
>=20
> On Tue, Sep 27, 2011 at 5:13 AM, Arvid Brodin <arvid.brodin@enea.com>=
 wrote:
> > [Resending with CC to affected parties]
> >
> > Hi,
> >
> > I would expect cache synchronization for DMA_TO_DEVICE and DMA_BIDI=
RECTIONAL
> > when dma_map_single() is called, and for DMA_FROM_DEVICE and DMA_BI=
DIRECTIONAL
> > when dma_unmap_single() is called.
> >
> > However, on some architechtures (at least avr32, blackfin, ...), ca=
che
> > synchronization only happens when dma_map_single() is called (and t=
hen
> > irrespective of DMA direction). dma_unmap_single() is a no-op for t=
hese archs.
> >
> > See e.g. http://lxr.linux.no/#linux+v3.0.4/arch/avr32/include/asm/d=
ma-mapping.h#L117
> >
> > Isn't this a bug?
>=20
> I don't think so. What do other architectures do?
>=20
> We always need to sync before the transfer because if there is dirty
> data in the cache, it might get written to RAM during the transfer,
> which would be bad. Then, since the relevant cache lines are already
> clean and invalid, and the CPU is not allowed to access the buffer
> during the transfer, there's no need to sync again when the transfer
> is complete.

On some architectures, e.g. ARMv6 and higher, a speculative prefetch mi=
ght
cause cache lines to be read again while an inbound DMA is on its way.
On those architectures you need to discard cache lines before reading f=
rom
the buffer. In fact also for DMA_FROM_DEVICE you need to flush or inval=
idate
the cache for the buffer before the transfer and invalidate the cache a=
gain
after the transfer.

Most architectures however do not require this.

	Arnd
