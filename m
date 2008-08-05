From: "Mihaela Grigore" <grigore.mihaela@gmail.com>
Subject: linux under emulator
Date: Tue, 5 Aug 2008 18:28:04 +0100
Message-ID: <78ef7ce10808051028r14aa7973t3aaa3bc92132cbba@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=agXAV7VyrVqPIhjmowP3DR26ee2JGZS3A/JGlLTpS2g=;
        b=hmmC1GRLVPRvcKtrqW7DSkoq/+1IAM336kod2Di8oDqxeqsca2WxGb9h7ZJPwPAy+l
         jtomi+q0A4LIpUXg1qpyyupaJs5/vdJU0BE85JalMP4ZBqxB2Wr5Z/jiLXK0mg9Tq1jW
         7z27usqmZBU71bdeuf8x+CoFdE/HdZryy00V0=
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

If I intend to run a 2.6 linux kernel under a powerpc emulator, what
is needed to make a minimal bootable system? I mean, apart from the
kernel itself and busybox, do I need a bootloader ? If no actual
hardware is used and the kernel can reside directly in ram from the
emulator's point of view (so no relocation is needed), what else is to
be done before the kernel can start running ?

Thank you,
Mihaela Grigore
