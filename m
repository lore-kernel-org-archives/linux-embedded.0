From: Arvid Brodin <arvid.brodin@enea.com>
Subject: Re: dma_unmap_single() lacking cache sync on some archs?
Date: Tue, 27 Sep 2011 14:13:34 +0200
Message-ID: <4E81BDEE.2080601@enea.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: linux-embedded@vger.kernel.org, Hans-Christian Egtvedt <egtvedt@samfundet.no>, Haavard Skinnemoen <hskinnemoen@gmail.com>, arnd@arndb.de

[Resending with CC to affected parties]

Hi,

I would expect cache synchronization for DMA_TO_DEVICE and DMA_BIDIRECTIONAL
when dma_map_single() is called, and for DMA_FROM_DEVICE and DMA_BIDIRECTIONAL
when dma_unmap_single() is called.

However, on some architechtures (at least avr32, blackfin, ...), cache
synchronization only happens when dma_map_single() is called (and then
irrespective of DMA direction). dma_unmap_single() is a no-op for these archs.

See e.g. http://lxr.linux.no/#linux+v3.0.4/arch/avr32/include/asm/dma-mapping.h#L117

Isn't this a bug?

(Please CC me in responses.)

-- 
Arvid Brodin
Enea Services Stockholm AB
