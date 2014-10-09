From: Ran Shalit <ranshalit@gmail.com>
Subject: cpuidle - minimum time for sleep
Date: Thu, 9 Oct 2014 21:28:23 +0300
Message-ID: <CAJ2oMhJXi-wxZJFcmm3LsTQOC35tAVKwr1PihUc0CmbnNtfPVQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-omap-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=77B0AC3DmeMgNfPnLblp8LnKtifKXwhIBFyzvNUFFWU=;
        b=d52uR2YgrLEerqPlWYRbrZsXz5wZmAhOB1OC656/gWAsAR3lHIIWX3Aa36S3fYzaJC
         NdfMx4kXv+NVUkbCs5eoJFsUzjoEliSkKMUeezXEsqJBb6ATziCoHNQh1LgifPTzvc8S
         zWernFzs9cJ9yMlW1EkKR3hc+BxrTqx35qYbYi6MbA7lPZBAXb13AFhEWuVcwO4u4ifk
         QOZdG1wla6F7Tqk9RKd9waJRz5nLuQSfgCp0NdTd+BVifze1eq69cvhEV270Au7pyWan
         7yvsAm8Uf6maHbMwfgkY1yKBUhg0iVw9KmFNP7IZmWOtA9Xco6Tj5sPZnwgBDYLNVNtk
         APQg==
Sender: linux-omap-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-pm@vger.kernel.org, linux-omap@vger.kernel.org, linux-embedded@vger.kernel.org

Hello,

Does anybody know what is the minimum expected time for sleep period
with the cpuidle ?

I intend t use the menu governer, and I try to estimate the sleep time.

Thanks,
Ran
