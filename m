From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: Re: 3.15.4 runs *significantly* slower than 3.15.3 on iMX233 CPU
Date: Tue, 08 Jul 2014 09:01:47 -0300
Message-ID: <53BBDDAB.9010204@gmail.com>
References: <lpeo05$sc8$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=20BAevlAH101cm4iTonvdnXOdJtxQ7I1/GBa+EcfCkc=;
        b=p/hKQRSqnp+XspuGogJE7sC7RALZOp//5XyiSXv87Gclk6DDmEJOjKatD45lnQ36kg
         PEmk9bYZ1p+Fo2HkTDDARtL+xuUa7Zv6WuhMqTRO7glYagGntSIcJl8q7VC7VXfSpIWP
         GEDsts9d10WnuD6Jd0ZvELom0o2Ze88V5Xcs5RUlers01AJZ+bxz/cUTRYeFArI/2GVJ
         NkCAjsH1mdNHIjnn8kszHi0z/MP3Q4KDvimmoGkQatkaUyq5/xzUFXFYlwBAgqJ0cL8h
         M+U6zcpLpIGcE7bCrFtYiA3XG3nhFI2Ovs6uoPj75MtfsO5TaQiB7LYjy+Ml7e8LlzMN
         Hw2w==
In-Reply-To: <lpeo05$sc8$1@ger.gmane.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Manuel Reimer <Manuel.Spam@nurfuerspam.de>, linux-embedded@vger.kernel.org

Em 07-07-2014 15:13, Manuel Reimer escreveu:
> Hello,

Hi,

> maybe someone can help me to find the reason for this problem:
>
> If I run my iMX233 development board with an 3.15.3 kernel, then the
> performance is much better as with an 3.15.4 kernel.
>
> I have the first significant "hanging" here:
>
> [    7.910000] sd 0:0:0:0: [sda] Attached SCSI removable disk
> [   10.810000] random: nonblocking pool is initialized
> [   24.310000] systemd[1]: systemd 214 running in system mode. (+PAM
> -AUDIT -SELINUX -IMA -SYSVINIT +LIBCRYPTSETUP +GCRYPT +ACL +XZ +SECCOMP
> -APPARMOR)
>
> After booting up it takes several seconds between entering the username
> and the password while with version 3.15.3 the password prompt appears
> almost immediately after entering the username.
>
> Please tell me if some additional information is needed.

Did you try some git bisecting between these two versions, right? It's 
only 67 commits to go and it will probably give you the culprit right away.

Marcelo

> Thank you very much in advance.
>
> Greetings,
>
> Manuel
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-embedded" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
