From: Arvid Brodin <arvid.brodin@enea.com>
Subject: Re: dma_unmap_single() lacking cache sync on some archs?
Date: Thu, 29 Sep 2011 20:56:28 +0200
Message-ID: <4E84BF5C.4020601@enea.com>
References: <4E81BDEE.2080601@enea.com> <CAF8ieYUPcer2ZwaOi6YbiZQPeDBFukT2_dPStH10G_15Rh1fpw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAF8ieYUPcer2ZwaOi6YbiZQPeDBFukT2_dPStH10G_15Rh1fpw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?H=E5vard_Skinnemoen?= <hskinnemoen@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Hans-Christian Egtvedt <egtvedt@samfundet.no>, arnd@arndb.de

H=E5vard Skinnemoen wrote:
> Hi,
>=20
> On Tue, Sep 27, 2011 at 5:13 AM, Arvid Brodin <arvid.brodin@enea.com>=
 wrote:
>> [Resending with CC to affected parties]
>>
>> Hi,
>>
>> I would expect cache synchronization for DMA_TO_DEVICE and DMA_BIDIR=
ECTIONAL
>> when dma_map_single() is called, and for DMA_FROM_DEVICE and DMA_BID=
IRECTIONAL
>> when dma_unmap_single() is called.
>>
>> However, on some architechtures (at least avr32, blackfin, ...), cac=
he
>> synchronization only happens when dma_map_single() is called (and th=
en
>> irrespective of DMA direction). dma_unmap_single() is a no-op for th=
ese archs.
>>
>> See e.g. http://lxr.linux.no/#linux+v3.0.4/arch/avr32/include/asm/dm=
a-mapping.h#L117
>>
>> Isn't this a bug?
>=20
> I don't think so. What do other architectures do?
>=20
> We always need to sync before the transfer because if there is dirty
> data in the cache, it might get written to RAM during the transfer,
> which would be bad. Then, since the relevant cache lines are already
> clean and invalid, and the CPU is not allowed to access the buffer
> during the transfer, there's no need to sync again when the transfer
> is complete.

I see. Thanks for the explanation!

>=20
> Havard

--=20
Arvid Brodin
Enea Services Stockholm AB
