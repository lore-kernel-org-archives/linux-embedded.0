From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 02/16 v3] pramfs: super operations
Date: Mon, 15 Nov 2010 08:45:56 +0100
Message-ID: <AANLkTimn=Yp-tzb6f-=M73+1Rjqbtp+fxWLH4bz7HEuJ@mail.gmail.com>
References: <4CDEA53E.2050602@gmail.com>
	<AANLkTiky=Vnxnav4VtX_Yd1sUtFGqHTrd=aih8qRJ7u7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=/vasv7HGimPo2uQJAKMcDt2NFj+awGQ496ir/lsxPMw=;
        b=wke/VuQcYm9nNcxwwJpxxEtRZNvwkLxpGLl58RKjvztmwtNkD9SxwkGMBqI2JmgjY2
         yBrN8zy8ZymitiPy95XXwKseOsjypef5MuRTZT1b9A6h4fGxZBU1HL0f8tKHAVUd6A11
         dLXwb8QfowoeR0tZWhOKOYR6d6cab7fwGwTtU=
In-Reply-To: <AANLkTiky=Vnxnav4VtX_Yd1sUtFGqHTrd=aih8qRJ7u7@mail.gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: yidong zhang <zhangyd6@gmail.com>
Cc: linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, tim.bird@am.sony.com, akpm@linux-foundation.org

2010/11/15 yidong zhang <zhangyd6@gmail.com>:
> hi Marco
>
>> + =A0 =A0 =A0 retval =3D 0;
>> + out:
>> + =A0 =A0 =A0 if (retval && sbi->virt_addr) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(sbi->virt_addr);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 release_mem_region(sbi->phys_addr, ini=
tsize);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(sbi);
>> + =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 return retval;
>> +}
>> +
> =A0I think kfree(sbi) should not be put here. In case of
> pram_parse_options failure, sbi should also be freed too. =A0How abou=
t
> change it to the list below? And change some =93goto out=94 =A0 branc=
hes to
> =93goto out_free=94.
>
> =A0//=A0 =A0 retval =3D 0;
> =A0 =A0 return 0;
> =A0out:
> =A0=A0 =A0 =A0 if (retval && sbi->virt_addr) {
> =A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(sbi->virt_addr);
> =A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 release_mem_region(sbi->phys_addr, ini=
tsize);
> =A0=A0 =A0 =A0 }
> out_free:
> =A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(sbi);
> =A0=A0 =A0 =A0 return retval;
> }
>

Yeah, you're right. It's not always true that virt addr is valid,
kfree should be used out of this if. I'll fix it.

Marco
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
