From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [[RFC] 3/5] Expunge old Atmel PWMC driver, replacing it with one 
	that conforms to the PWM API
Date: Mon, 19 Oct 2009 18:34:29 -0400
Message-ID: <8bd0f97a0910191534y12f9b6b9g1181507b20b50f80@mail.gmail.com>
References: <1255984366-26952-1-git-send-email-bgat@billgatliff.com> 
	<1255984366-26952-2-git-send-email-bgat@billgatliff.com> <1255984366-26952-3-git-send-email-bgat@billgatliff.com> 
	<1255984366-26952-4-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=ByC0becMF+A20O2FJoTWBVgT4XVPNthKtVAw3xee50E=;
        b=HzA6YgJFh9esDBBCjFxVQIeQu0RsffCKbJA7L8Hj6YxOVTwH7Ng2LKNehP1K0u5CcV
         DZnDoIA9MtIPym5iKSRqzPVcuSlfaQyFtdg622lmbmdGEjxWGaXUUSNXt7aSavT2aat6
         AS1ih4ZJ2md+Sd9HZr+eGc12y+SpqF53RvaZs=
In-Reply-To: <1255984366-26952-4-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Mon, Oct 19, 2009 at 16:32, Bill Gatliff wrote:
> --- /dev/null
> +++ b/drivers/pwm/atmel-pwm.c
> + =C2=A0 =C2=A0 =C2=A0 const struct atmel_pwm *ap
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D container_of(p=
->pwm, struct atmel_pwm, pwm);

make a helper ?

> + =C2=A0 =C2=A0 =C2=A0 pr_debug("%s:%d sync_mask %x\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p->pwm->bus_=
id, p->chan, ap->sync_mask[p->chan]);

all of the pr_* funcs in this driver should be dev_* funcs

> +static int __init
> +atmel_pwmc_probe(struct platform_device *pdev)

__devinit

> + =C2=A0 =C2=A0 =C2=A0 ap->clk =3D clk_get(&pdev->dev, "pwm_clk");
> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(ap->clk)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("%s: clk_g=
et error %ld\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ap->pwm.bus_id, PTR_ERR(ap->clk));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_clk_get;

shouldnt it be:
  ret =3D PTR_ERR(ap->clk);

> +static struct platform_driver atmel_pwm_driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 .driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D "atmel_p=
wmc",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =3D THIS_MO=
DULE,
> + =C2=A0 =C2=A0 =C2=A0 },

no need for .owner ?

> +static void atmel_pwm_exit(void)

__exit
-mike
