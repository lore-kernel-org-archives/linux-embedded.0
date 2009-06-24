From: Johnny Hung <johnny.hacking@gmail.com>
Subject: How the kernel printk works before do console_setup.
Date: Wed, 24 Jun 2009 11:50:06 +0800
Message-ID: <cb9ecdfa0906232050n6fcfee31ubeee4bcd9b8c0dfe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=h37afC4VrgJXpzZJDb07teaajhNXGK4CSU6yME+UAoI=;
        b=MLAaA4NdwTAwSt5rgQDD+G6LZG9/vpGdkpHRpXOSb3WbgnC7b6SwRpdzkCYz+47kPs
         4g+m/C1MaXyj07p/2LMeeQ24QYoRtMu8kyMCTTDB72QBrGb9a7Cr01pyDYfGo3CbUUft
         u3HA9NbnwrQY1FF/qub/0AYFeMa/f3jYyfZhY=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-embedded@vger.kernel.org

Hi All:
    I have a powerpc arch platform. The default console is ttyS1 not
ttyS0 in the platform. My question is how the kernel print debug
message
like DBG before parse kernel command line and do console_setup
function. The command line passed to kernel about console info is
console=ttyS1.
So kernel can not print anything before parse cmd line and initial
console but the result is against. Anyone point me or give me a clue
is appreciate.

BR, H. Johnny
