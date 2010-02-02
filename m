From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: [PWM PATCH 3/5] Expunge old Atmel PWMC driver, replacing it with
 one that conforms to the PWM API
Date: Tue, 02 Feb 2010 01:16:28 -0600
Message-ID: <4B67D14C.1020807@billgatliff.com>
References: <cover.1265094517.git.bgat@billgatliff.com> <c5873aa7c5d20254a9e54fc1ff179345b77c16b5.1265094517.git.bgat@billgatliff.com> <2d73f9b2fd175fd3e482920baebcd3028206f02e.1265094517.git.bgat@billgatliff.com> <f5be82a3ae501709e8568e9fa06ab036fd363567.1265094517.git.bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <f5be82a3ae501709e8568e9fa06ab036fd363567.1265094517.git.bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Bill Gatliff wrote:
>
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 049ff24..8cf48cf 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -5,7 +5,11 @@
>  obj-$(CONFIG_IBM_ASM)		+= ibmasm/
>  obj-$(CONFIG_HDPU_FEATURES)	+= hdpuftrs/
>  obj-$(CONFIG_AD525X_DPOT)	+= ad525x_dpot.o
> -obj-$(CONFIG_ATMEL_PWM)		+= atmel_pwm.o
> +obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
> +obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
> +obj-$(CONFIG_MSI_LAPTOP)	+= msi-laptop.o
> +obj-$(CONFIG_COMPAL_LAPTOP)	+= compal-laptop.o
> +obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
>   

Darn it!!  I'll clean this one up in the final post.


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com

