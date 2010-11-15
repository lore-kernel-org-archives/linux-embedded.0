From: yidong zhang <zhangyd6@gmail.com>
Subject: Re: [PATCH 02/16 v3] pramfs: super operations
Date: Mon, 15 Nov 2010 10:27:10 +0800
Message-ID: <AANLkTiky=Vnxnav4VtX_Yd1sUtFGqHTrd=aih8qRJ7u7@mail.gmail.com>
References: <4CDEA53E.2050602@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=M7TVe3fOIZvg8w1+gujwPG2SdNRGmMZenhn1A1ehI9E=;
        b=h1Q0j7I8QEgjwLJpwQ6yxp9zhi6z/9j+lNeWuwdxDpDCATs5VjDNt0BOQBjL7+lcRQ
         STkSwOsymfr6I0udz/X9o1QwNVPaPUXCfy3F/G/UFqsiKa+hIRqPWt6+XOfE00FI+8Q4
         saiCwdvxHf7LXyNtB3DeDn2grYLzq3gks/9T8=
In-Reply-To: <4CDEA53E.2050602@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, tim.bird@am.sony.com, akpm@linux-foundation.org

hi Marco

> + =A0 =A0 =A0 retval =3D 0;
> + out:
> + =A0 =A0 =A0 if (retval && sbi->virt_addr) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(sbi->virt_addr);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 release_mem_region(sbi->phys_addr, init=
size);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(sbi);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return retval;
> +}
> +
  I think kfree(sbi) should not be put here. In case of
pram_parse_options failure, sbi should also be freed too.  How about
change it to the list below? And change some =93goto out=94   branches =
to
=93goto out_free=94.

 //=A0 =A0 retval =3D 0;
     return 0;
 out:
 =A0 =A0 =A0 if (retval && sbi->virt_addr) {
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(sbi->virt_addr);
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 release_mem_region(sbi->phys_addr, initsiz=
e);
 =A0 =A0 =A0 }
out_free:
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(sbi);
 =A0 =A0 =A0 return retval;
}
