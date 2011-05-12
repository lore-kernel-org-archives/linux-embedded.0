From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH 0/4] Speed up the symbols' resolution process V4
Date: Thu, 12 May 2011 10:30:34 -0400
Message-ID: <BANLkTikyR7ByAgxtbz-gOHspLMFo4a+vaQ@mail.gmail.com>
References: <1302960373-5309-1-git-send-email-abogani@kernel.org>
 <BANLkTi=y60Jt3-OMzbxQJzGkvzCzNJfJtA@mail.gmail.com> <BANLkTimfFEv+vZ8dYvhG0oj2Q4g+KnG4aA@mail.gmail.com>
 <BANLkTinDiGCaKPtS+ZpKf2swJpParJ4eew@mail.gmail.com> <BANLkTi=JXq+V783amiJB-qLX=7PaeH-83w@mail.gmail.com>
 <BANLkTi=OXuR4iJFqUEa4pA=yO0aXaqEzyA@mail.gmail.com> <BANLkTikFSN-DkkPNPtv1VigCg08YoB_q2g@mail.gmail.com>
 <BANLkTi=fhsSP069WMNPN8BA=E1=1TZ6Zmw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=MrOfli0rvs5I2M4tiP6EUfsiCvt2F7pC9KXKJCZgqm0=;
        b=rhQilVU56D3QB5YCRnJR06mZ0tr0s7qyND1AC+cMv7IwRFEPm/jastW3zJolaL3/+V
         Sa7xApGBv1/Opeul7RBahyaA6oZbyiG1ESnSpbKaQ/wFy1dyapeEKYBQJbJtqZLxHpr1
         +VbCY3dTS+p7MIohdbiFcsK9TJy2jULMdl7Dc=
In-Reply-To: <BANLkTi=fhsSP069WMNPN8BA=E1=1TZ6Zmw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Alessio Igor Bogani <abogani@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Jason Wessel <jason.wessel@windriver.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

On Thu, May 12, 2011 at 05:10, Alessio Igor Bogani wrote:
> 2011/5/11 Mike Frysinger:
> [...]
>> if you export _foo/foo, you'll get an error with the current code:
>> /* EXPORT_SYMBOL(foo); */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.section =C2=A0 =C2=A0 =C2=A0 =C2=A0___ks=
ymtab__foo,"a",@progbits
>> ___ksymtab_foo:
>> /* EXPORT_SYMBOL(_foo); */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.section =C2=A0 =C2=A0 =C2=A0 =C2=A0___ks=
ymtab___foo,"a",@progbits
>> ___ksymtab__foo:
> [...]
>
> So I can suggest two possible solutions for section names:
>
> 1) As you suggested change "__" to "+" so
> i.e. ___ksymtab+foo
>
> 2) Pick a more appropriate name:
> i.e. ___ksym__foo
> or
> i.e. ___ksymsec__foo
>
> In fact these section names aren't a table of symbols (in ksymtab the
> "tab" part stand for table, I suppose) so I think that name should be
> changed accordingly (my patchset create a temporary section for every
> symbol).
>
> Which do you prefer?

i suggested the diff split char as i dont know how embedded the
"ksymtab" section name is in the rest of the tree.  but if changing
that is an option, that'd work too.  either works for me, so whichever
is less effort for you.
-mike
