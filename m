From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PWM v5 2/3] PWM: GPIO+hrtimer device emulation
Date: Sun, 20 Feb 2011 17:35:02 -0500
Message-ID: <AANLkTikAGOtWkOiG_s+fUiYEVfewg4pzLdaW7S=iciWA@mail.gmail.com>
References: <1298175043-31727-1-git-send-email-bgat@billgatliff.com> <1298175043-31727-3-git-send-email-bgat@billgatliff.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=SVkSTdpsYy58eBGRRoCmH4Y0izwxlB4bXUofYxThptA=;
        b=eJE8C+zgsgneLZRBtGfADoAOy1UN6EHxokS7eO+uZ30Ir4r/hc4NGUP8L0zsnhqnBp
         stSoWOCNEi91bGjnoxPeA6yj/94BJX/g7uNMJtqn/PiyiSjDVD9RTPyb7Hkj91Ji/5bZ
         /19Bi8JJ4xsv3AHUWQohGaC1wpfNI5Vx+dYGg=
In-Reply-To: <1298175043-31727-3-git-send-email-bgat@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

On Sat, Feb 19, 2011 at 23:10, Bill Gatliff wrote:
> +config ATMEL_PWMC
> + =C2=A0 =C2=A0 =C2=A0 tristate "Atmel AT32/AT91 PWMC support"
> + =C2=A0 =C2=A0 =C2=A0 depends on GENERIC_PWM && (AVR32 || ARCH_AT91S=
AM9263 || ARCH_AT91SAM9RL || ARCH_AT91CAP9)
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 This option enables support under the g=
eneric PWM
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0framework for PWMC peripheral channels f=
ound on
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0certain Atmel microcontrollers. =C2=A0If=
 unsure, say N.

doesnt this belong in the atmel pwmc patch ?
-mike
