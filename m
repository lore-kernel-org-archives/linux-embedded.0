From: Dirk Behme <dirk.behme@gmail.com>
Subject: Why is the deferred initcall patch not mainline?
Date: Sat, 18 Oct 2014 07:07:30 +0200
Message-ID: <5441F592.6090807@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-type:content-transfer-encoding;
        bh=PhYJeh0v5Mpi9IHm+wAKuieS6TA/kcM50eJopp1ZAUE=;
        b=tfGimCCgz96H4ZDyISxFa0pIMItqFLBOUS1V64gUCduU2kexqdQLc+HDFdYC4YfS1r
         57YiOrAZXKTBaDgtr7jBGTwwfmLscbEYCDRtzHMiQ2bDEjQ91Gpy4jb2xKhS/5oB0DQC
         imU787DOn55P4c96EHOZjjtOLo4ta44h7Ae1odACI2oTknRNc98bZKS5r8m+BSsFqlKS
         cKKBVgG8jtDIkZ/dYxKVBxwVokZKnCoLE3lnXixAC/mkMHbABPvjuunv5sTx6300u4L/
         j+iKPKsVLnyjqhRfpt774gbo5g1Zb2x6yweAtQ5R1JUI3EoPYO9xJJChUEEv4xI0khtp
         CzIQ==
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-embedded@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Tim Bird <tim.bird@am.sony.com>, Christopher_Hallinan@mentor.com

Hi,

During the ELCE 2014 in Duesseldorf in Chris Hallinan's talk [1] there 
has been the unanswered question why the deferred initcall patch [2] 
isn't mainline, yet.

Anybody remembers?

Best regards

Dirk


[1] http://sched.co/1yG5fmY

[2] http://elinux.org/Deferred_Initcalls
