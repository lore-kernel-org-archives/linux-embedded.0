From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH RFC 4/5] MIPS:  Select BUILDTIME_EXTABLE_SORT
Date: Fri, 18 Nov 2011 11:37:47 -0800
Message-ID: <1321645068-20475-5-git-send-email-ddaney.cavm@gmail.com>
References: <1321645068-20475-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
        bh=NNp2WWMB6TPLoXfP2DLUu9TIuxy8zY9y1tjlPZUeH0s=;
        b=h1CkD+oKmwh5Fj2UgSmEN8x0ABFbJiyQe+Yl3tXUDwAIXfGfx4XDOzgve02j5qkFoN
         nsn7wCAeYtP7ci/i6sgCBS+zH5eJ76zKYrfYOwT7USx6XEj1JViJAxckpXD3L0eiz3v2
         Bz3CyIuFL/Gr8omFBV8IDDrFw/ZvP2zcmSC+o=
In-Reply-To: <1321645068-20475-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-embedded@vger.kernel.org, x86@kernel.org
Cc: David Daney <david.daney@cavium.com>

From: David Daney <david.daney@cavium.com>

We can sort the exeception table at build time for MIPS, so let's do
it.

Signed-off-by: David Daney <david.daney@cavium.com>
---
 arch/mips/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0c55582..adfe083 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -25,6 +25,7 @@ config MIPS
 	select GENERIC_IRQ_SHOW
 	select HAVE_ARCH_JUMP_LABEL
 	select IRQ_FORCED_THREADING
+	select BUILDTIME_EXTABLE_SORT
 
 menu "Machine selection"
 
-- 
1.7.2.3
