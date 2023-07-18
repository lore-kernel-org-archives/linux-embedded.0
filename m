From: "Alan C. Assis" <acassis@gmail.com>
Subject: Re: File system robustness
Date: Tue, 18 Jul 2023 10:04:55 -0300
Message-ID: <CAG4Y6eTN1XbZ_jAdX+t2mkEN=KoNOqprrCqtX0BVfaH6AxkdtQ@mail.gmail.com>
References: <20230717075035.GA9549@tomerius.de> <CAG4Y6eTU=WsTaSowjkKT-snuvZwqWqnH3cdgGoCkToH02qEkgg@mail.gmail.com>
 <20230718053017.GB6042@tomerius.de> <CAEYzJUGC8Yj1dQGsLADT+pB-mkac0TAC-typAORtX7SQ1kVt+g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689685496; x=1692277496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUFE4zZGrAvUM/BoEy+41CZw289243/LNIISiR4wdq4=;
        b=c/hmyYLN8hFspbmTr+69BFqsukonbOs7QK36df1zO/AGKEQwl9VCwiFs8UmiZmGvVL
         J0vBCTE1MVfYxq3VlYndM0Gvz1dsC3uqzowgw+mKFBjlosgFm1iagBtDoDGoH2TTAEmb
         t0lb+iO0UZmgnOauI3mePNhFXktmA6zoBEX3JO9sXN0IkwpGAIEKtBgMoWSxo9WdDzme
         GKjP2U10tSl6M50l6e1+M4oltqHb++IPJ4Um/K/felvpCuDcOBngEWeufUg2QCF/EqfH
         I8ZwoR7BuOrvh7S0WcFTxoDZN8pFbVpttteKEuilhiZKyVX3KzNm0abJPRUSUrxhYCvE
         kiuw==
In-Reply-To: <CAEYzJUGC8Yj1dQGsLADT+pB-mkac0TAC-typAORtX7SQ1kVt+g@mail.gmail.com>
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Cc: Kai Tomerius <kai@tomerius.de>, linux-embedded@vger.kernel.org, Ext4 Developers List <linux-ext4@vger.kernel.org>, dm-devel@redhat.com

Hi Bj=C3=B8rn,

On 7/18/23, Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com> wrote:
> On Tue, 18 Jul 2023 at 08:03, Kai Tomerius <kai@tomerius.de> wrote:
>> I should have mentioned that I'll have a large NAND flash, so ext4
>> might still be the file system of choice. The other ones you mentioned
>> are interesting to consider, but seem to be more fitting for a smaller
>> NOR flash.
>
> If you mean raw NAND flash I would think UBIFS is still the way to go?
> (It's been several years since I was into embedded Linux systems.)
>
> https://elinux.org/images/0/02/Filesystem_Considerations_for_Embedded_Dev=
ices.pdf
> is focused on eMMC/SD Cards, which have built-in controllers that
> enable them to present a block device interface, which is very unlike
> what raw NAND devices have.
>
> Please see https://www.kernel.org/doc/html/latest/filesystems/ubifs.html
> for more info.
>

You are right, for NAND there is an old (but gold) presentation here:

https://elinux.org/images/7/7e/ELC2009-FlashFS-Toshiba.pdf

UBIFS and YAFFS2 are the way to go.

But please note that YAFFS2 needs license payment for commercial
application (something that I only discovered recently when Xiaomi
integrated it into NuttX mainline, bad surprise).

BR,

Alan
