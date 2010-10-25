From: Pawel Suchanecki <subdcc@gmail.com>
Subject: How to spin down the SATA hard drive on ARM target (Open-RD)?
Date: Mon, 25 Oct 2010 12:47:31 +0200
Message-ID: <AANLkTim6xmfWSF92GzenqfYOgzjj73TF6wS7QM06T=Ps@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=UelDOmsxEjRFcL+LBmaX8j7vl6O7Q8F3Ohsep4gq//k=;
        b=qjG3JYl6J2JkLeqWd3USUvNWg6Gb0nqfFYcHE+PlDj4FFLVC4kuwY57Q4WbGm4C9Tr
         ZUtAYF+LVZnNCr9/LgNMg4ClQoW2j/PevajxIMl16mTg4lc2OdigIwftOlFjrWeMkxX2
         k0hAv4Wz7BVTfZV0L3HSyCJDBZi0jNHxMN4cE=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org

Dear list,

I am trying to achieve the HDD _simple_ power saving function on
Open-RD Client device, running Linux 2.6.22 / 2.6.36.

The simplification is that I just need to spin the disk down and then
sit quietly waiting for IC2 port expander's IRQ (button press) to
reboot the system.

Is the `sg_stat --stop' command from sg3_utils package capable of
performing the disk spin down for SATA device (WD) on this armish
platform?
If not, please direct me to proper solution.

Is it feasible running full power saving mode (i.e. using spindown
daemon [1]) to be able to wake the hard disk and resume normal system
operation?

Thank you in advance,
Pawel.

[1] http://code.google.com/p/spindown/

--
Robotics engineer * GNU generation member
Linux reg. user # 145057 * Open BSD secured
Perl programmer * C coder * Firmware engineer
