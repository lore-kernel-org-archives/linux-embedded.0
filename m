From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] PM: Hide CONFIG_PM from users
Date: Mon,  7 Feb 2011 12:22:15 +0000
Message-ID: <1297081335-13631-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>, Len Brown <len.brown@intel.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-pm@lists.linux-foundation.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-embedded@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

It is very rare to find a current system which is both sufficiently
resource constrained to want to compile out power management support
and sufficiently power insensitive to be able to tolerate doing so.
Since having the configuration option requires non-zero effort to
maintain, with ifdefery in most drivers, but it is used with vanishing
rarity it is simpler to just remove the option.

Begin doing so by hiding it from users - this should attract complaints
from any active users. The option is left disabled for the IA64 Ski
simulator which is a partial simulator for IA64 systems mostly missing
device support. This is a very limited use case which is unlikely to
ever want to enable most drivers.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 kernel/power/Kconfig |   21 ++-------------------
 1 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
index 2657299..99e3c52 100644
--- a/kernel/power/Kconfig
+++ b/kernel/power/Kconfig
@@ -1,23 +1,6 @@
 config PM
-	bool "Power Management support"
-	depends on !IA64_HP_SIM
-	---help---
-	  "Power Management" means that parts of your computer are shut
-	  off or put into a power conserving "sleep" mode if they are not
-	  being used.  There are two competing standards for doing this: APM
-	  and ACPI.  If you want to use either one, say Y here and then also
-	  to the requisite support below.
-
-	  Power Management is most important for battery powered laptop
-	  computers; if you have a laptop, check out the Linux Laptop home
-	  page on the WWW at <http://www.linux-on-laptops.com/> or
-	  Tuxmobil - Linux on Mobile Computers at <http://www.tuxmobil.org/>
-	  and the Battery Powered Linux mini-HOWTO, available from
-	  <http://www.tldp.org/docs.html#howto>.
-
-	  Note that, even if you say N here, Linux on the x86 architecture
-	  will issue the hlt instruction if nothing is to be done, thereby
-	  sending the processor to sleep and saving power.
+	bool
+	default y if !IA64_HP_SIM
 
 config PM_DEBUG
 	bool "Power Management Debug Support"
-- 
1.7.2.3
