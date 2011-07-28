From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: new module ubiblk: block layer on top of UBI
Date: Thu, 28 Jul 2011 09:14:18 +0300
Message-ID: <1311833667.2169.1.camel@koala>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	 <1311683250-7921-1-git-send-email-david.wagner@free-electrons.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:from:reply-to:to:cc:date:in-reply-to:references
         :content-type:x-mailer:content-transfer-encoding:message-id
         :mime-version;
        bh=CJKrODez7Fc8LBQ/1A4FWmfPr8LpyNdDm1m09UrBc1o=;
        b=xgVmxSQU/bnrAm/ywFhhLDz/g5vI1035zjXT4SbfUDyPYt2YnjyP5GM+LeFR4VfH6Q
         3ssbYy+9kkiprm2Bp/SkqWGeUw7Cf1RcFsImiWRANd+owRNa1HLM+VB55bNNyjPSOFR/
         1S7/hFOpjpYAoM9oZuymVivQNVnWb/4NXni30=
In-Reply-To: <1311683250-7921-1-git-send-email-david.wagner@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Wagner <david.wagner@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, tim.bird@am.sony.com

On Tue, 2011-07-26 at 14:27 +0200, David Wagner wrote:
>  * The numbering of devices is much easier with ubiblk than with
>    gluebi+mtdblock_ro. With gluebi+mtdblock_ro, you get one additiona=
l
>    MTD device for each UBI volume, so the number of MTD devices grows
>    quite a lot and is a bit difficult to understand. For example,
>    mtdblock[0-4] might be your real MTD partitions, while mtdblock[5-=
9]
>    might be your UBI volumes.
>    It also means that if a new real MTD
>    partition is added, the number of all the MTD devices exposing UBI
>    volumes will be incremented by one, which is a bit
>    confusing/annoying.
>    As well, if you add an UBI volume, the mtdblock devices that are
>    emulated on top of volumes that come after this new one will have
>    their ID incremented.
>=20
>  * The performance appears to be slightly better with ubiblk than
>    gluebi+mtdblock_ro, according to our benchmarks (see
>    http://elinux.org/Flash_Filesystem_Benchmarks_2.6.39)

Hi, I am having vacation till the middle of August and I do not have a
possibility to look at UBI/UBIFS/MTD stuff now, sorry. When I come back=
,
I'll go through my e-mails and respond. Apologies again.

--=20
Best Regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
