From: sugumar <sugumar@ti.com>
Subject: [PATCH 0/4] Add eCAP driver support for PWM based backlight control.
Date: Fri,  8 Oct 2010 18:46:42 +0530
Message-ID: <1286543802-32023-1-git-send-email-sugumar@ti.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: davinci-linux-open-source@linux.davincidsp.com, sugumar <sugumar@ti.com>

The following set of patches adds support for eCAP driver for PWM
generation. It also adds platform support for back light device.
The patch as a whole adds support for back light control through eCAP module.

The patch has been tested on Bill Gatliff's tree.
	
sugumar (4):
  davinci: da8xx: eCAP driver for PWM signal generation
  davinci: da850: Add platform specific support for eCAP driver
  Modify the back light driver to support the new PWM framework
  davinci: da850/omap-l138 evm: Platform support for backlight driver

 arch/arm/mach-davinci/board-da850-evm.c    |   37 +++
 arch/arm/mach-davinci/da850.c              |   69 ++++++
 arch/arm/mach-davinci/include/mach/da8xx.h |    1 +
 arch/arm/mach-davinci/include/mach/mux.h   |    3 +
 drivers/pwm/Kconfig                        |   11 +
 drivers/pwm/Makefile                       |    1 +
 drivers/pwm/ecap.c                         |  330 ++++++++++++++++++++++++++++
 drivers/video/backlight/pwm_bl.c           |   28 ++-
 include/linux/pwm_backlight.h              |    3 +-
 9 files changed, 469 insertions(+), 14 deletions(-)
 create mode 100644 drivers/pwm/ecap.c
