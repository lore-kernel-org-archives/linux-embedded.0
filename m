From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH RFC 5/5] x86: Select BUILDTIME_EXTABLE_SORT
Date: Fri, 18 Nov 2011 11:37:48 -0800
Message-ID: <1321645068-20475-6-git-send-email-ddaney.cavm@gmail.com>
References: <1321645068-20475-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
        bh=5nwa3lYYDjtq67+5lileIlaaaLGqDuLODTZJqzHVNbs=;
        b=AlD7eVd5x6ojZWu+CD6GMNQf5G/wwZ+kj/kGRY8jmEJV5Lj2r7Vk3O4swA4HXr88wj
         dzKX7U+As1/qeTaz5UHH2FnByHg+afIoWaRzOgPcHEcZzPMLxH777xtm8NdrryoeAU0N
         NxnXfApZEuPTzaZYgI2J0MSq3kD+ZJSqEWlqI=
In-Reply-To: <1321645068-20475-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-embedded@vger.kernel.org, x86@kernel.org
Cc: David Daney <david.daney@cavium.com>

From: David Daney <david.daney@cavium.com>

We can sort the exeception table at build time for x86, so let's do
it.

Signed-off-by: David Daney <david.daney@cavium.com>
---
 arch/x86/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index cb9a104..c6b52a6 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -75,6 +75,7 @@ config X86
 	select HAVE_BPF_JIT if (X86_64 && NET)
 	select CLKEVT_I8253
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
+	select BUILDTIME_EXTABLE_SORT
 
 config INSTRUCTION_DECODER
 	def_bool (KPROBES || PERF_EVENTS)
-- 
1.7.2.3
