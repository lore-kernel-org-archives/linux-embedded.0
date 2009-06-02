From: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: [PATCH 0/2] MMC Agressive clocking framework v2
Date: Tue, 2 Jun 2009 14:35:00 +0200
Message-ID: <63386a3d0906020535j723e5b92y4f5a122db06553f0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=nvn/i3IzK3tT11fy7XBpsuF0cQIwyglollgAliGCeV4=;
        b=WIv9GZEe4zPugOpu3+DlvEuRrYiLADce9X2Kzx+rKnH7H49cuc4sdR6LqCsCfLWuLT
         km5OJi2hYLYoDsgo4u+rlROut/FEl8i76+i+UstsTrK5Oi2Q4isl5/SPUi/ptYIo/2Zc
         VTtbv49ZdX/mvmqbXTbp+aNVtZWAAwxCne4SQ=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Ossman <pierre@ossman.eu>, linux-arm-kernel@lists.arm.linux.org.uk
Cc: linux-embedded@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>

ChangeLog v1->v2:

* Switch the gating mechanism from using an additional callback
  to setting the "clock" field in the ios structure to 0 and
  storing away the current value to ungate the clock later on.

* Remove the mmc_clk_enable/disable around the ios() operations
  as a result, if you use clock gating you have to take the
  gating into account in your set_ios() code.

* Keep the nesting code (use count) this is used so that quick
  bursts of requests can be handled properly while the disable
  work is idling in the background and appears quite solid.
  Tried my best to clarify why this code look as it does.

* Removed unnecessary depend on MMC!=n in the Kconfig, explicit
  (EXPERIMENTAL) in option description.

* Updates MMCI reference implementation to reflect the new use
  of the clock field.

* Remove unnecessary #include <clk.h>

* Added a debugfs file appearing in /mmcN/clk_delay that can
  be used to trim the delay cycle count to test what happens
  with different values.

* Works fine on my system.

Yours,
Linus Walleij
