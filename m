From: Alessio Igor Bogani <abogani@kernel.org>
Subject: Re: [PATCH 0/4] Speed up the symbols' resolution process V4
Date: Sun, 15 May 2011 10:28:25 +0200
Message-ID: <BANLkTinr5xw8wDrZ6P1d5BYLRMmj-i3w4g@mail.gmail.com>
References: <1302960373-5309-1-git-send-email-abogani@kernel.org>
	<BANLkTi=y60Jt3-OMzbxQJzGkvzCzNJfJtA@mail.gmail.com>
	<BANLkTimfFEv+vZ8dYvhG0oj2Q4g+KnG4aA@mail.gmail.com>
	<BANLkTinDiGCaKPtS+ZpKf2swJpParJ4eew@mail.gmail.com>
	<BANLkTi=JXq+V783amiJB-qLX=7PaeH-83w@mail.gmail.com>
	<BANLkTi=OXuR4iJFqUEa4pA=yO0aXaqEzyA@mail.gmail.com>
	<BANLkTikFSN-DkkPNPtv1VigCg08YoB_q2g@mail.gmail.com>
	<BANLkTi=fhsSP069WMNPN8BA=E1=1TZ6Zmw@mail.gmail.com>
	<BANLkTikyR7ByAgxtbz-gOHspLMFo4a+vaQ@mail.gmail.com>
	<BANLkTinQx+8T3Hv0T5yPEAtxtU87CcOJVw@mail.gmail.com>
	<BANLkTiktnQyEnNiQdTr_p=PG66rzVkr9ig@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=dBJ87iSZ0qFyhcjJ0zR3jBT+bP77SB3ufZdk2OXU0Fs=;
        b=yGM9L5pqERMiqFrlvsHoNzSgVE8PaBlnpGBKD2GxIONZxHO9jQlCy/t2GGH6uoVaRc
         V6AUx6xKU7j6/yMBQ/XREpAy6EMoXGflUIb/hkGZ0bZ3bEUPRsy+X7MQGwmsLtFYOKtl
         SW9haydFRGZyiBVVeIUkP4nGLolNjlywcgq5U=
In-Reply-To: <BANLkTiktnQyEnNiQdTr_p=PG66rzVkr9ig@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Jason Wessel <jason.wessel@windriver.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

Dear Mr. Frysinger,

2011/5/14 Mike Frysinger <vapier.adi@gmail.com>:
> On Fri, May 13, 2011 at 03:01, Alessio Igor Bogani wrote:
>> I changed the "__" in "+". Could you test this, please?
>> http://git.kernel.org/?p=3Dlinux/kernel/git/abogani/linux-2.6.git;a=3D=
shortlog;h=3Drefs/heads/ksym-sorted-v6
>> Thanks a lot!
>
> seems to build & boot ok for me. =C2=A0cheers.
> -mike

Thank you very much!

Ciao,
Alessio
