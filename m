From: Alessio Igor Bogani <abogani@kernel.org>
Subject: Re: [PATCH 0/4] Speed up the symbols' resolution process V4
Date: Fri, 13 May 2011 09:01:43 +0200
Message-ID: <BANLkTinQx+8T3Hv0T5yPEAtxtU87CcOJVw@mail.gmail.com>
References: <1302960373-5309-1-git-send-email-abogani@kernel.org>
	<BANLkTi=y60Jt3-OMzbxQJzGkvzCzNJfJtA@mail.gmail.com>
	<BANLkTimfFEv+vZ8dYvhG0oj2Q4g+KnG4aA@mail.gmail.com>
	<BANLkTinDiGCaKPtS+ZpKf2swJpParJ4eew@mail.gmail.com>
	<BANLkTi=JXq+V783amiJB-qLX=7PaeH-83w@mail.gmail.com>
	<BANLkTi=OXuR4iJFqUEa4pA=yO0aXaqEzyA@mail.gmail.com>
	<BANLkTikFSN-DkkPNPtv1VigCg08YoB_q2g@mail.gmail.com>
	<BANLkTi=fhsSP069WMNPN8BA=E1=1TZ6Zmw@mail.gmail.com>
	<BANLkTikyR7ByAgxtbz-gOHspLMFo4a+vaQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=wNG2hleaEEf9iplqHKcln1adFSreIN/whM5MV3HFR0k=;
        b=jjlyLa87mqY9VatnbcUbNl3VzTaMR/2F1Yezww2muxRe3tyElTvAaBsjGyDDhY/7vr
         E9acqet5thsrLcydTjrJEQbX6NPuqMgq2idSZWxISRelhuJsdBRdIKXuC96NB9ywHpxl
         H6ZmYMQwOlRj+fItVYiZ9P250i5uDZ9MwM4VU=
In-Reply-To: <BANLkTikyR7ByAgxtbz-gOHspLMFo4a+vaQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Jason Wessel <jason.wessel@windriver.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

Dear Mr. Frysinger,

I changed the "__" in "+". Could you test this, please?
http://git.kernel.org/?p=linux/kernel/git/abogani/linux-2.6.git;a=shortlog;h=refs/heads/ksym-sorted-v6
Thanks a lot!

Ciao,
Alessio
