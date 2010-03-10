From: Yuasa Yoichi <yuasa@linux-mips.org>
Subject: Re: [PATCH v2] char drivers: Ram oops/panic logger
Date: Wed, 10 Mar 2010 11:08:04 +0900
Message-ID: <21eaeb5a1003091808s2d7638cxd524952a7d84b378@mail.gmail.com>
References: <4B968834.3040609@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type;
        bh=8l7u+VULAl7TtLXCWy5H1IQIUnwf8Yzd8wX3kmeUJLQ=;
        b=Dr7l1P0S/DGElQGrlYkg8Aa3UEg/pQOLKMEMYiLyWhacYk5LZubLt66cEdgsu3Bm5R
         Sp47poOn4mlMfe0DsXAOwGh3DYipEiU00oYS3qTbb+s2kL/JnCdxb3kjXN9bebnL09qB
         VscMG6MAY3akqOIeEeKh4NcJ3NRXEftBE41Go=
In-Reply-To: <4B968834.3040609@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

Hi,

2010/3/10 Marco Stornelli <marco.stornelli@gmail.com>:
> Ramoops, like mtdoops, can log oops/panic information but in RAM.

What is different from mtdoops + mtd-ram?

Yoichi
