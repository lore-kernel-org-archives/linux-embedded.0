From: Alessio Igor Bogani <abogani@kernel.org>
Subject: Re: [PATCH 0/4] Speed up the symbols' resolution process V4
Date: Thu, 12 May 2011 11:10:24 +0200
Message-ID: <BANLkTi=fhsSP069WMNPN8BA=E1=1TZ6Zmw@mail.gmail.com>
References: <1302960373-5309-1-git-send-email-abogani@kernel.org>
	<BANLkTi=y60Jt3-OMzbxQJzGkvzCzNJfJtA@mail.gmail.com>
	<BANLkTimfFEv+vZ8dYvhG0oj2Q4g+KnG4aA@mail.gmail.com>
	<BANLkTinDiGCaKPtS+ZpKf2swJpParJ4eew@mail.gmail.com>
	<BANLkTi=JXq+V783amiJB-qLX=7PaeH-83w@mail.gmail.com>
	<BANLkTi=OXuR4iJFqUEa4pA=yO0aXaqEzyA@mail.gmail.com>
	<BANLkTikFSN-DkkPNPtv1VigCg08YoB_q2g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=nBr6CZt9yTb/c5XWEcWpgpA4vqUEF6BnGqPGjq4G5Sw=;
        b=eh1Bvnt/vNNrtuEhXJvxX/KnVkJBPUck7DvIJ3yZyWS3gwH93BihB3D9P3RgICcjrp
         swTO/JcSGM+jXMRuvGX/947YXotxSE6DapNfF2bcX5oBDOgbgOXTog1NBuRBos6rIm2j
         5rN5LKdpeK4slZNnX4k9DjSwgpPS7Qvhz2kiA=
In-Reply-To: <BANLkTikFSN-DkkPNPtv1VigCg08YoB_q2g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Jason Wessel <jason.wessel@windriver.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

Dear Mr. Frysinger,

Thank you for excellent explanation!

2011/5/11 Mike Frysinger <vapier.adi@gmail.com>:
[...]
> if you export _foo/foo, you'll get an error with the current code:
> /* EXPORT_SYMBOL(foo); */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.section =C2=A0 =C2=A0 =C2=A0 =C2=A0___ksy=
mtab__foo,"a",@progbits
> ___ksymtab_foo:
> /* EXPORT_SYMBOL(_foo); */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.section =C2=A0 =C2=A0 =C2=A0 =C2=A0___ksy=
mtab___foo,"a",@progbits
> ___ksymtab__foo:
[...]

So I can suggest two possible solutions for section names:

1) As you suggested change "__" to "+" so
i.e. ___ksymtab+foo

2) Pick a more appropriate name:
i.e. ___ksym__foo
or
i.e. ___ksymsec__foo

In fact these section names aren't a table of symbols (in ksymtab the
"tab" part stand for table, I suppose) so I think that name should be
changed accordingly (my patchset create a temporary section for every
symbol).

Which do you prefer?

Ciao,
Alessio
