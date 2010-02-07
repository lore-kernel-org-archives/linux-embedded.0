From: hmthalib <h.thalib@gmail.com>
Subject: Re: Freescale MPC8313 TSEC SGMII problem.
Date: Sun, 07 Feb 2010 11:46:14 +0530
Message-ID: <4B6E5AAE.8020504@gmail.com>
References: <cb9ecdfa1001282229n21a11aa9sf15ebf279990862a@mail.gmail.com>
Reply-To: hmthalib@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:reply-to
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=tJSYDwQf8K30YOQOU6u4VB9cuqI17WpxRMcYp8LPXTc=;
        b=XbQ/+Eu7tZOMkg9feG0HK3+meX6xX3V1P9FRQGDPj842gi8d9ujiD3gqU6jU3J+3zU
         LdK9wgEnfv2o023MJ9ibvDlkel50xdJyd+7el15O53Fgt4N6mP+G64FeHclyyHwIxZyP
         SetVynFbABmzSTgNEJHOVfFpnxlUI7H+cYjB0=
In-Reply-To: <cb9ecdfa1001282229n21a11aa9sf15ebf279990862a@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Johnny Hung <johnny.hacking@gmail.com>
Cc: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Hi Johnny Hung,

Please find the reply inliend
Johnny Hung wrote:
> Hi All,
> 
> I have a Freescale MPC8313 customized board and want to confiugre
> TSEC1 to SGMII. Would you please help me for this question,
> 
> 1). Is it possible for MPC8313 TSEC1 connect to Ethernet Switch by
> SGMII (without phy), like below diagram.
> 
> [MPC8313 TSEC1]  <====SGMII====> [Ethernet Switch]
> 

Not possible

> 2). If yes in 1), how to configure it in MPC8313, as I know it can set
> TSEC1 to SGMII in LTIB uboot setting. How about in Linux Kernel driver
> ? Is it need extra setting or patch?
> 
> BRs, H. Johnny
> --
> To unsubscribe from this list: send the line "unsubscribe linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
Regards,
Mohamed Thalib H
