From: sugumar <sugumar@ti.com>
Subject: [PATCH 2/4] davinci: da850: Add platform specific support for eCAP driver
Date: Fri,  8 Oct 2010 18:47:23 +0530
Message-ID: <1286543843-32088-1-git-send-email-sugumar@ti.com>
Return-path: <linux-embedded-owner@vger.kernel.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-embedded@vger.kernel.org
Cc: davinci-linux-open-source@linux.davincidsp.com, sugumar <sugumar@ti.com>

This patch registers the eCAP driver as a platform device

Signed-off-by: sugumar <sugumar@ti.com>
---
 arch/arm/mach-davinci/da850.c              |   69 ++++++++++++++++++++++++++++
 arch/arm/mach-davinci/include/mach/da8xx.h |    1 +
 arch/arm/mach-davinci/include/mach/mux.h   |    3 +
 3 files changed, 73 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-davinci/da850.c b/arch/arm/mach-davinci/da850.c
index 6b8331b..2adfb08 100644
--- a/arch/arm/mach-davinci/da850.c
+++ b/arch/arm/mach-davinci/da850.c
@@ -336,6 +336,13 @@ static struct clk aemif_clk = {
 	.flags		= ALWAYS_ENABLED,
 };
 
+static struct clk ecap_clk = {
+	.name	= "ecap",
+	.parent	= &pll0_sysclk2,
+	.lpsc	= DA8XX_LPSC1_ECAP,
+	.gpsc	= 1,
+};
+
 static struct clk_lookup da850_clks[] = {
 	CLK(NULL,		"ref",		&ref_clk),
 	CLK(NULL,		"pll0",		&pll0_clk),
@@ -377,6 +384,7 @@ static struct clk_lookup da850_clks[] = {
 	CLK("da8xx_lcdc.0",	NULL,		&lcdc_clk),
 	CLK("davinci_mmc.0",	NULL,		&mmcsd_clk),
 	CLK(NULL,		"aemif",	&aemif_clk),
+	 CLK(NULL,               "ecap",         &ecap_clk),
 	CLK(NULL,		NULL,		NULL),
 };
 
@@ -539,6 +547,9 @@ static const struct mux_config da850_pins[] = {
 	MUX_CFG(DA850, GPIO4_0,		10,	28,	15,	8,	false)
 	MUX_CFG(DA850, GPIO4_1,		10,	24,	15,	8,	false)
 	MUX_CFG(DA850, RTC_ALARM,	0,	28,	15,	2,	false)
+	MUX_CFG(DA850, ECAP0_APWM0,     2,      28,     15,     2,	false)
+	MUX_CFG(DA850, ECAP1_APWM1,     1,      28,     15,     4,	false)
+	MUX_CFG(DA850, ECAP2_APWM2,     1,      0,      15,     4,	false)
 #endif
 };
 
@@ -1029,6 +1040,64 @@ static int da850_round_armrate(struct clk *clk, unsigned long rate)
 }
 #endif
 
+
+#define DA8XX_ECAP0_BASE        0x01F06000
+
+static struct resource da850_ecap0_resource[] = {
+	{
+	.start	= DA8XX_ECAP0_BASE,
+	.end	= DA8XX_ECAP0_BASE + 0xfff,
+	.flags	= IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device da850_ecap0_dev = {
+	.name	= "ecap",
+	.id	= 0,
+	.resource	= da850_ecap0_resource,
+	.num_resources	= ARRAY_SIZE(da850_ecap0_resource),
+};
+
+#define DA8XX_ECAP1_BASE        0x01F07000
+
+static struct resource da850_ecap1_resource[] = {
+	{
+	.start	= DA8XX_ECAP1_BASE,
+	.end	= DA8XX_ECAP1_BASE + 0xfff,
+	.flags	= IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device da850_ecap1_dev = {
+	.name	= "ecap",
+	.id	= 1,
+	.resource	= da850_ecap1_resource,
+	.num_resources	= ARRAY_SIZE(da850_ecap1_resource),
+};
+
+#define DA8XX_ECAP2_BASE        0x01F08000
+
+static struct resource da850_ecap2_resource[] = {
+	{
+	.start	= DA8XX_ECAP2_BASE,
+	.end	= DA8XX_ECAP2_BASE + 0xfff,
+	.flags	= IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device da850_ecap2_dev = {
+	.name	= "ecap",
+	.id	= 2,
+	.resource	= da850_ecap2_resource,
+	.num_resources	= ARRAY_SIZE(da850_ecap2_resource),
+};
+
+int __init da850_register_ecap(void)
+{
+	return platform_device_register(&da850_ecap2_dev);
+}
+
+
 int da850_register_pm(struct platform_device *pdev)
 {
 	int ret;
diff --git a/arch/arm/mach-davinci/include/mach/da8xx.h b/arch/arm/mach-davinci/include/mach/da8xx.h
index 1b31a9a..63e36d5 100644
--- a/arch/arm/mach-davinci/include/mach/da8xx.h
+++ b/arch/arm/mach-davinci/include/mach/da8xx.h
@@ -81,6 +81,7 @@ int da850_register_cpufreq(void);
 int da8xx_register_cpuidle(void);
 void __iomem * __init da8xx_get_mem_ctlr(void);
 int da850_register_pm(struct platform_device *pdev);
+int da850_register_ecap(void);
 
 extern struct platform_device da8xx_serial_device;
 extern struct emac_platform_data da8xx_emac_pdata;
diff --git a/arch/arm/mach-davinci/include/mach/mux.h b/arch/arm/mach-davinci/include/mach/mux.h
index de11aac..c82cb49 100644
--- a/arch/arm/mach-davinci/include/mach/mux.h
+++ b/arch/arm/mach-davinci/include/mach/mux.h
@@ -914,6 +914,9 @@ enum davinci_da850_index {
 	DA850_GPIO4_0,
 	DA850_GPIO4_1,
 	DA850_RTC_ALARM,
+	DA850_ECAP0_APWM0,
+	DA850_ECAP1_APWM1,
+	DA850_ECAP2_APWM2,
 };
 
 enum davinci_tnetv107x_index {
-- 
1.5.6
