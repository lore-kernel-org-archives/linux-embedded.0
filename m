From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [[RFC] 5/5] Incorporate PWM API code into KBuild
Date: Mon, 19 Oct 2009 18:30:33 -0400
Message-ID: <8bd0f97a0910191530k4b30a4a5ra115a1b528f59ebf@mail.gmail.com>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com> 
	<1255984366-26952-2-git-send-email-bgat@billgatliff.com> <1255984366-26952-3-git-send-email-bgat@billgatliff.com> 
	<1255984366-26952-4-git-send-email-bgat@billgatliff.com> <1255984366-26952-5-git-send-email-bgat@billgatliff.com> 
	<1255984366-26952-6-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=YyjQJAdIPydh8hsSg9Xl8ok4NbAiuGUi1CxLTQrrPyc=;
        b=DoNKAzM+9ME0Jt23xTcFBCDIa8XvbGdXlLPxVA1K+nZPTZ0e07Ll/PFCJDiMo5JwYd
         ChHAWlS192r6vRxz29Pj8qDNuw3ddit7WFL6bNTKZTA/B0dybSRSMDgqwAYClp7MrFxx
         /G/Z1WXmp5KbNWLS7c5jD5Srt7dAKwCne54MQ=
In-Reply-To: <1255984366-26952-6-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Mon, Oct 19, 2009 at 16:32, Bill Gatliff wrote:
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -6,6 +6,8 @@
> =C2=A0#
>
> =C2=A0obj-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D gpio/
> +obj-$(CONFIG_GENERIC_PWM) =C2=A0 =C2=A0 =C2=A0+=3D pwm/
> +
> =C2=A0obj-$(CONFIG_PCI) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0+=3D pci/

spurious new line

> --- /dev/null
> +++ b/drivers/pwm/Kconfig
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 software controlled power-efficent back=
lights on LCD

efficient

> --- /dev/null
> +++ b/drivers/pwm/Makefile
> @@ -0,0 +1,7 @@
> +#
> +# Makefile for pwm devices
> +#
> +obj-y :=3D pwm.o
> +
> +obj-$(CONFIG_ATMEL_PWM) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+=3D atmel-pwm.o
> +obj-$(CONFIG_GPIO_PWM) =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D gpio.o
> \ No newline at end of file

there should be a newline at the end of the file
-mike
