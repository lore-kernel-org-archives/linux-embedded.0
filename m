From: Jaya Kumar <jayakumar.lkml@gmail.com>
Subject: [RFC 2.6.28 3/3] mach-pxa: use batch set/get in
	am300epd
Date: Sun, 25 Jan 2009 17:54:49 +0800
Message-ID: <1232877301524-git-send-email-jayakumar.lkml@gmail.com>
References: <123287728936-git-send-email-jayakumar.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-fbdev-devel-bounces@lists.sourceforge.net>
In-Reply-To: <123287728936-git-send-email-jayakumar.lkml@gmail.com>
List-Id: <linux-embedded.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/linux-fbdev-devel>,
	<mailto:linux-fbdev-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-fbdev-devel>
List-Post: <mailto:linux-fbdev-devel@lists.sourceforge.net>
List-Help: <mailto:linux-fbdev-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-fbdev-devel>,
	<mailto:linux-fbdev-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: linux-fbdev-devel-bounces@lists.sourceforge.net
To: jayakumar.lkml@gmail.com
Cc: linux-fbdev-devel@lists.sourceforge.net, linux-embedded@vger.kernel.org, Jaya Kumar <jayakumar.lkml@gmail.com>, linux-kernel@vger.kernel.org, David Brownell <david-b@pacbell.net>, Paulius Zaleckas <paulius.zaleckas@teltonika.lt>, Geert Uytterhoeven <geert@linux-m68k.org>, Eric Miao <eric.miao@marvell.com>, Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.arm.linux.org.uk

This patch to am300epd uses the batch gpiolib set/get API in order
to significantly improve performance when transferring framebuffer
data.

Cc: David Brownell <david-b@pacbell.net>
Cc: Eric Miao <eric.miao@marvell.com>
Cc: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-arm-kernel@lists.arm.linux.org.uk
Cc: linux-fbdev-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Cc: linux-embedded@vger.kernel.org
Signed-off-by: Jaya Kumar <jayakumar.lkml@gmail.com>
---
 arch/arm/mach-pxa/am300epd.c |   23 ++++++++++++-----------
 1 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-pxa/am300epd.c b/arch/arm/mach-pxa/am300epd.c
index 4bd10a1..237e3be 100644
--- a/arch/arm/mach-pxa/am300epd.c
+++ b/arch/arm/mach-pxa/am300epd.c
@@ -187,24 +187,25 @@ static void am300_cleanup(struct broadsheetfb_par *par)
 
 static u16 am300_get_hdb(struct broadsheetfb_par *par)
 {
-	u16 res = 0;
-	int i;
-
-	for (i = 0; i <= (DB15_GPIO_PIN - DB0_GPIO_PIN) ; i++)
-		res |= (gpio_get_value(DB0_GPIO_PIN + i)) ? (1 << i) : 0;
+	int err;
+	u32 val;
 
-	return res;
+	err = gpio_get_batch(DB0_GPIO_PIN, 0xFFFF, &val);
+	if (err) {
+		dev_err(&am300_device->dev, "get failed: %d\n", err);
+		return 0;
+	}
+	return (u16) val;
 }
 
 static void am300_set_hdb(struct broadsheetfb_par *par, u16 data)
 {
-	int i;
-
-	for (i = 0; i <= (DB15_GPIO_PIN - DB0_GPIO_PIN) ; i++)
-		gpio_set_value(DB0_GPIO_PIN + i, (data >> i) & 0x01);
+	int err;
+	err = gpio_set_batch(DB0_GPIO_PIN, 0xFFFF, data);
+	if (err)
+		dev_err(&am300_device->dev, "set failed: %d\n", err);
 }
 
-
 static void am300_set_ctl(struct broadsheetfb_par *par, unsigned char bit,
 				u8 state)
 {
-- 
1.5.2.3


------------------------------------------------------------------------------
This SF.net email is sponsored by:
SourcForge Community
SourceForge wants to tell your story.
http://p.sf.net/sfu/sf-spreadtheword
