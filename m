From: Chris Ball <cjb@laptop.org>
Subject: Re: [PATCH 1/2] mmc: block: mmcblkN: use slot index instead of dynamic name index
Date: Mon, 06 Aug 2012 11:31:17 -0400
Message-ID: <8739402g1m.fsf@octavius.laptop.org>
References: <1344237900-14815-1-git-send-email-dirk.behme@de.bosch.com>
Mime-Version: 1.0
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1344237900-14815-1-git-send-email-dirk.behme@de.bosch.com> (Dirk
	Behme's message of "Mon, 6 Aug 2012 09:24:59 +0200")
Sender: linux-mmc-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-mmc@vger.kernel.org, linaro-dev@lists.linaro.org, linux-embedded@vger.kernel.org, Jassi Brar <jaswinder.singh@linaro.org>

Hi,

On Mon, Aug 06 2012, Dirk Behme wrote:
> On embedded devices, often there is a combination of removable mmc
> devices (e.g. MMC/SD cards) and hard wired ones (e.g. eMMC).
> Depending on the hardware configuration, the 'mmcblkN' node might
> change if the removable device is available or not at boot time.
>
> E.g. if the removable device is attached at boot time, it might
> become mmxblk0. And the hard wired one mmcblk1. But if the removable
> device isn't there at boot time, the hard wired one will become
> mmcblk0. This makes it somehow difficult to hard code the root device
> to the non-removable device and boot fast.
>
> This change does simply associate 'N' of 'mmcblkN' with the slot index
> instead of the dynamic name index. The slot index is always the same,
> ensuring that the non-removable mmc device is associated always
> with the same mmcblkN. Independent of the availability of the removable
> one.

I like this change in principle, but doesn't it break boot for everyone
currently using e.g. root=/dev/mmcblk0p1 on slot index 2?  That doesn't
sound like an acceptable regression.

Thanks,

- Chris.
-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
One Laptop Per Child
