From: Johnny Hung <johnny.hacking@gmail.com>
Subject: Freescale MPC8313 TSEC SGMII problem.
Date: Fri, 29 Jan 2010 14:29:04 +0800
Message-ID: <cb9ecdfa1001282229n21a11aa9sf15ebf279990862a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=VgA9C5uCqDVs/7WRJfly2eaWJQXXyjlrt9JZJhReGIk=;
        b=yDSJTfdgGBIh8tse/Xc6PgL2nTEZVMYqVvBE8KZNfz5vpA3k3U7ZzDx/ul8IQoEENe
         Yihft3WSSenPPjzzBOH6x1GX1QuEB2VXtjcEyaX5PJ7nGXbGujF3UD4lsnr7umviP8RC
         MjL0ssT3f+gjL932JP3HUJiKzVh3heLL5Ha7U=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Hi All,

I have a Freescale MPC8313 customized board and want to confiugre
TSEC1 to SGMII. Would you please help me for this question,

1). Is it possible for MPC8313 TSEC1 connect to Ethernet Switch by
SGMII (without phy), like below diagram.

[MPC8313 TSEC1]  <====SGMII====> [Ethernet Switch]

2). If yes in 1), how to configure it in MPC8313, as I know it can set
TSEC1 to SGMII in LTIB uboot setting. How about in Linux Kernel driver
? Is it need extra setting or patch?

BRs, H. Johnny
