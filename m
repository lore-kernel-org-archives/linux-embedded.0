From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Subject: [PATCH 0/2] phylib: mdio-ofgpio ---> mdio-gpio (v3)
Date: Fri, 14 Nov 2008 12:24:22 +0200
Message-ID: <20081114102336.11513.67767.stgit@Programuotojas.82-135-208-232.ip.zebra.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org

I think these patches are ready for merging to netdev-next.
If there is need I can merge these two patches to single.

Changes since v2:
- finished with rework patch

Changes since v1:
- broken to rename patch and mdio-gpio rework

---

Paulius Zaleckas (2):
      phylib: make mdio-gpio work without OF (v4)
      phylib: rename mdio-ofgpio to mdio-gpio


 drivers/net/phy/Kconfig       |    7 +
 drivers/net/phy/Makefile      |    2 
 drivers/net/phy/mdio-gpio.c   |  296 +++++++++++++++++++++++++++++++++++++++++
 drivers/net/phy/mdio-ofgpio.c |  204 ----------------------------
 include/linux/mdio-gpio.h     |   25 +++
 5 files changed, 327 insertions(+), 207 deletions(-)
 create mode 100644 drivers/net/phy/mdio-gpio.c
 delete mode 100644 drivers/net/phy/mdio-ofgpio.c
 create mode 100644 include/linux/mdio-gpio.h
