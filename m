From: tom.leiming@gmail.com
Subject: [PATCH] ARM:omap3:board-omap3beagle.c:support twl4030_usb transceiver
	device
Date: Sat,  1 Aug 2009 20:42:28 +0800
Message-ID: <1249130548-21001-1-git-send-email-tom.leiming@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.arm.linux.org.uk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=lists; h=From:To:Cc:Subject:Date:
	Message-Id:List-Id:List-Unsubscribe:List-Archive:List-Post:
	List-Help:List-Subscribe:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=Ngdj3itxNlqxzKU73VJ+GHdjXTcis8rjxq
	JHf42AqKM=; b=lBEc8pa25k2qbEWALoRQCMbzcslskEeHzIb7sLuVLbei6ilRmB
	GokoECwuqJRAQ+QgiGkz6pJ7huiWgVhyn1SM/1YlvunLGf9jBePaSE04eZMaXYz1
	iNNHuPvsoNcFCZ3f+5YK8GnJTF0cm/52kwclTNK2vQkcEcAOEEtzVhSB0=
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.arm.linux.org.uk/lurker/list/linux-arm-kernel.html>
List-Post: <mailto:linux-arm-kernel@lists.arm.linux.org.uk>
List-Help: <mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=help>
List-Subscribe: <http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=subscribe>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.arm.linux.org.uk
To: linux@arm.linux.org.uk, dbrownell@users.sourceforge.net
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>

From: Ming Lei <tom.leiming@gmail.com>

This patch defines twl4030_usb_data as platform_data, which can be
passed to twl4030 mfd driver to build twl4030_usb device. Without
twl4030_usb device, we can not use musb on beagle board.

Signed-off-by: Ming Lei <tom.leiming@gmail.com>
---
 arch/arm/mach-omap2/board-omap3beagle.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-omap2/board-omap3beagle.c b/arch/arm/mach-omap2/board-omap3beagle.c
index 991ac9c..b8c1ae9 100644
--- a/arch/arm/mach-omap2/board-omap3beagle.c
+++ b/arch/arm/mach-omap2/board-omap3beagle.c
@@ -249,6 +249,9 @@ static struct regulator_init_data beagle_vpll2 = {
 	.consumer_supplies	= &beagle_vdvi_supply,
 };
 
+static struct twl4030_usb_data beagle_usb = {
+	.usb_mode	= T2_USB_MODE_ULPI,
+};
 static struct twl4030_platform_data beagle_twldata = {
 	.irq_base	= TWL4030_IRQ_BASE,
 	.irq_end	= TWL4030_IRQ_END,
@@ -259,6 +262,7 @@ static struct twl4030_platform_data beagle_twldata = {
 	.vsim		= &beagle_vsim,
 	.vdac		= &beagle_vdac,
 	.vpll2		= &beagle_vpll2,
+	.usb		= &beagle_usb,
 };
 
 static struct i2c_board_info __initdata beagle_i2c_boardinfo[] = {
-- 
1.6.0.GIT


-------------------------------------------------------------------
List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel
FAQ:        http://www.arm.linux.org.uk/mailinglists/faq.php
Etiquette:  http://www.arm.linux.org.uk/mailinglists/etiquette.php
