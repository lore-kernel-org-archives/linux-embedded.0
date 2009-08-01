From: "Gadiyar, Anand" <gadiyar@ti.com>
Subject: RE: [PATCH] USB:musb:fix dependency of selecting TWL4030_USB
Date: Sat, 1 Aug 2009 20:02:42 +0530
Message-ID: <5A47E75E594F054BAF48C5E4FC4B92AB0305398DC4@dbde02.ent.ti.com>
References: <1249131718-21388-1-git-send-email-tom.leiming@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1249131718-21388-1-git-send-email-tom.leiming@gmail.com>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: "tom.leiming@gmail.com" <tom.leiming@gmail.com>, "greg@kroah.com" <greg@kroah.com>, "dbrownell@users.sourceforge.net" <dbrownell@users.sourceforge.net>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

Ming Lei wrote:
> 
> From: Ming Lei <tom.leiming@gmail.com>
> 
> All machines based on OMAP34XX should select TWL_4030_USB if
> they want to support musb.

Not really. The OMAP3 EVM uses an NXP ISP1504 transceiver instead,
and so registers a NOP transceiver instead.

- Anand

> 
> Signed-off-by: Ming Lei <tom.leiming@gmail.com>
> ---
>  drivers/usb/musb/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
> index 70073b1..6ac465e 100644
> --- a/drivers/usb/musb/Kconfig
> +++ b/drivers/usb/musb/Kconfig
> @@ -11,7 +11,7 @@ config USB_MUSB_HDRC
>         depends on (USB || USB_GADGET) && HAVE_CLK
>         depends on !SUPERH
>         select NOP_USB_XCEIV if ARCH_DAVINCI
> -       select TWL4030_USB if MACH_OMAP_3430SDP
> +       select TWL4030_USB if ARCH_OMAP34XX
>         select USB_OTG_UTILS
>         tristate 'Inventra Highspeed Dual Role Controller (TI, ADI, ...)'
>         help
> --
> 1.6.0.GIT
> 
