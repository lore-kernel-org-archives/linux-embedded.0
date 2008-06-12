From: Shaz <shazalive@gmail.com>
Subject: Cross Compiler and loads of issues
Date: Thu, 12 Jun 2008 22:52:44 +0500
Message-ID: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=SNEJgnl3QwnLLZ3z8SmLtT9JmuQMq/fn24D9n4v8TxU=;
        b=Wbx6/PXH2AzxibD1EBHiWczymJo2xEpQYwfVzQaXEmbEHWcC+EvRx/L6rC1He9+5cX
         mDS/oQGtgstpr0LejEzwD/OQiG/+XAbcbQ6BLX/0Ge7ylJETrJexiOT7ciWsE9sGn8Mn
         kK8otafQHVgbWnPbb5WPGYEb6W99wLxASyFBY=
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded <linux-embedded@vger.kernel.org>

Hi,

I have been following "Re: [PATCH 0/1] Embedded Maintainer(s)" and
felt like asking that is there one good way to get a cross compiler
work. I tried buildroot, scratchbox and even openMoko with
openEmbedded but all of them had lots of issues and don't know which
will be the best alternative.

I also went through the material provided freely by Free Electron but
still I am not successful to build a custom kernel. Next I am trying
MontaVista's kit. I just wish I don't get lost.

Anyways, I liked the idea of Qemu based cross compiler. Is it possible
for the inexperienced to get it working and emulate the exact model
and devices.

--

Shaz
