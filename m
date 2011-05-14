From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH 0/4] Speed up the symbols' resolution process V4
Date: Sat, 14 May 2011 13:32:50 -0400
Message-ID: <BANLkTiktnQyEnNiQdTr_p=PG66rzVkr9ig@mail.gmail.com>
References: <1302960373-5309-1-git-send-email-abogani@kernel.org>
 <BANLkTi=y60Jt3-OMzbxQJzGkvzCzNJfJtA@mail.gmail.com> <BANLkTimfFEv+vZ8dYvhG0oj2Q4g+KnG4aA@mail.gmail.com>
 <BANLkTinDiGCaKPtS+ZpKf2swJpParJ4eew@mail.gmail.com> <BANLkTi=JXq+V783amiJB-qLX=7PaeH-83w@mail.gmail.com>
 <BANLkTi=OXuR4iJFqUEa4pA=yO0aXaqEzyA@mail.gmail.com> <BANLkTikFSN-DkkPNPtv1VigCg08YoB_q2g@mail.gmail.com>
 <BANLkTi=fhsSP069WMNPN8BA=E1=1TZ6Zmw@mail.gmail.com> <BANLkTikyR7ByAgxtbz-gOHspLMFo4a+vaQ@mail.gmail.com>
 <BANLkTinQx+8T3Hv0T5yPEAtxtU87CcOJVw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=FEivcWbcDVqKHcCOFUpEEu4UM0OP3WUPLAN3bbM3OpY=;
        b=CHdUL6a5/Tjzz4XzeWkn/ZTyhslxjcUef94WI2XfdL9RNNBSOIGCQi270urzohpjwy
         QxH9ADLWHx3w6xNHEtDgB+1lzhVp1IMwGn6bMoi8V6uGYNPIy356IAjVbQynWTFzkD8l
         Iken71b8bSiGvmpgJW9/7C12Jn1ttidtNJaSI=
In-Reply-To: <BANLkTinQx+8T3Hv0T5yPEAtxtU87CcOJVw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessio Igor Bogani <abogani@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Jason Wessel <jason.wessel@windriver.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

On Fri, May 13, 2011 at 03:01, Alessio Igor Bogani wrote:
> I changed the "__" in "+". Could you test this, please?
> http://git.kernel.org/?p=linux/kernel/git/abogani/linux-2.6.git;a=shortlog;h=refs/heads/ksym-sorted-v6
> Thanks a lot!

seems to build & boot ok for me.  cheers.
-mike
