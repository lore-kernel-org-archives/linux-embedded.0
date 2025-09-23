Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DF725D1E6
	for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637429; cv=none; b=IAy+wm12AykBFpNMgoo2jVdz8T8Bqbw4UeXLXssajd7G+DdI5ziFlOxAv4E8RXe7FqzywM7kIoFFCoqLhFerf7ek38oJAET44nfF+xg05weJjMd6oAuMPJAKUYi9b6PMUbph98qPiIOCebG+IFahypqLWoBJc9Zvz0g1/+P6Pks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637429; c=relaxed/simple;
	bh=lVm2m5B1DNrUQ73LE1eeHqcvBnqUICdND0Cl00LUVMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=pxAqCikBBEEYHvcD1ZOdvW8cVa/yGzf7BoWvFdfZuDSEf7/GdP2fKjVD3+I3sevbM44h3EQQeDZAZd4J/kr6QTjw+nUSFEfiPwi8UXbmjErXBuAg7eEQEO6MMJtZ7tq882euuft/s1ZKWjf5/RsDUo6Ms3TXoLjnvuSywdhTSHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=VbQ+jQzT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="VbQ+jQzT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45f2c9799a3so42701095e9.0
        for <linux-embedded@vger.kernel.org>; Tue, 23 Sep 2025 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1758637425; x=1759242225; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRH7Bip1GS5kZdBAqzu98VDCEjICHQoOmy9oTXTa7iQ=;
        b=VbQ+jQzTJg0nkiYaKNfJ5QltDf+eyb+mCGzHyCuLMkCD/+yOnj6VmfS/RcbN2QR4My
         l/R3Kyrw1jc8ZMKylOZQx+ZwpwBEnrSUKEu7xJLmcuTbiIvNDShUpgQeElU9XeSBS2i9
         pKCWwTfT+og0OJjmaiNGJihw5bvCzmjjCyAyKvBwGR0/2iGB0jPxrcTrKGZ+Vc8SloAg
         /YGE84cnDvH2hQpI4p2vOHneZ4ROzBNyfjaLtv7rKurMbwtA724pYath37QpL1ODLJqP
         IaOokm4duR+JjFevzFU2r/YT/S1DjqI5M38TKxL11KHDCw6qQdntJ0ZrUYhoe7xUdnNY
         oASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637425; x=1759242225;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRH7Bip1GS5kZdBAqzu98VDCEjICHQoOmy9oTXTa7iQ=;
        b=pKjGCaiT0c5iXeIzzPIWmKqEGY84/sg/WHi+tvwuKneYy5mESxM1iJ0mkR+xmpkGZM
         vgc3XfjW2kyWGyjIxh4Hf1ifK3s2tEMLXMhxqETnE2YBareqno9ZM1qvjwBl8TWtJmSR
         lu7yndRJbe7XAZUz4f3djj/6WXa4ZsB6cIrmMRYUUMNpQ8T/gH84rk9+OsBMqUdzCYrP
         2JAYTA/kTwJW93NDVEbWWd94rcPC34HZuWmDV/zaG73GPYQHY7aTGYnRni4YUaiO/zeJ
         dXCbYYT5LVzgd3AfQnALEtA0Fmpp88+AecSEybHIBWmnqdGhE0TpAaKChdc3DMSvwvEu
         Eg0g==
X-Gm-Message-State: AOJu0YxsObJe2W0NvTb9BSyfNs4NOlkRqtsbNRJ83J9qM3FvGV95eOO9
	NBYYKMSuK5O0PAnpauiv9JtM628Eje0kxnp9TRxXqz6rDVHXyW+PCzhkvXtLQSlaHK7errXGwBW
	tcwEhobI=
X-Gm-Gg: ASbGncsmRiDiG37E0YZUB+dPngZUQXytK/47iiYKIN9Gnfr1bP5lI3Q9g8fxCOU6KaG
	iMuei5JWjZUNKxlV/9gANg/FQxjFegrhZjZqRI6zUHF2Z0GYtg3BYU0ijPL2Pu8H5PwQsgyXGr5
	ljDlsecsKUovg6QY+7OVXLe3Q3npYqqCnmd+VImFjVRtTiqqH6HCkqQYqsBMjjqwOdMojSCdeu4
	PcHZKaRjbdbiMZjKku80bVTEA2e46Uk3g4mtrgthMwjhIegUTliuxHd0ID2NhEytAeuv4LZgyH1
	Z1naYiD8SOME4E2aH+IOfp1OY19y3PDLsJugcOLcbriSft98bitK2Wzd6ihWK8G+LlrU2Ce/oBs
	9odnUO7gfkwHAKcrmAKNyFtAkJCuyfgNvoJcS5MEvDMX6eeaYso+4z8iXP9HEvGZMvUahlG/uTu
	uvcq1kp+BlwIj2il0wW90=
X-Google-Smtp-Source: AGHT+IESjAwFuAHCsDwSRPh51VZbLsOi6YzP8LDBuQYtNKO+LPXUUG+PsbxyuBfDOXRU/XkJhFhtiw==
X-Received: by 2002:a05:600c:198f:b0:456:13b6:4b18 with SMTP id 5b1f17b1804b1-46e1dae28cbmr30383115e9.31.1758637425430;
        Tue, 23 Sep 2025 07:23:45 -0700 (PDT)
Received: from [127.0.1.1] (cpc145676-lewi19-2-0-cust696.2-4.cable.virginm.net. [82.0.238.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f64ad1b0sm278986535e9.21.2025.09.23.07.23.44
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:23:45 -0700 (PDT)
From: acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>
Date: Tue, 23 Sep 2025 15:23:40 +0100
Subject: [PATCH PREVIEW RFC 3/6] crypto: use bootcache to cache fastest
 algorithm
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-bootcache-v1-3-4f86fdc38b4e@thegoodpenguin.co.uk>
References: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
In-Reply-To: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
To: linux-embedded@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758637422; l=2594;
 i=acampanella@thegoodpenguin.co.uk; s=20250829; h=from:subject:message-id;
 bh=R4ZGnddC+p3vfwDE/a+DVY7BX4ue2EUoTbRBVzqPfXo=;
 b=dgNIH0uMvNNYlDEGigh1KX8KCcUBpvjFOB6eQZuTE8C0UTYHIyjUxR4H39T4yfkuM68PXhxUO
 FFh3aUx40YzBkrfZmffM+ADGEhbiAvGyqKGQQkd931/tUIqOuKZQbvM
X-Developer-Key: i=acampanella@thegoodpenguin.co.uk; a=ed25519;
 pk=qruBFipuvuZJTNm9XzFhMz42Q9F+xwyW1On3NgZHwzg=

From: Andrew Murray <amurray@thegoodpenguin.co.uk>

During boot xor_blocks may determine the fastest xor algorithm
by using do_xor_speed to perform a speed test on available
algorithms. This process can increase the overall boot time.

Let's make use of bootcache to cache the result of the speed
test for subsequent boots.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 crypto/xor.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/crypto/xor.c b/crypto/xor.c
index f39621a57bb33c4015c06dff00e03a07716618f6..3457df0414064758a1923752e91642d2237af7b3 100644
--- a/crypto/xor.c
+++ b/crypto/xor.c
@@ -14,6 +14,7 @@
 #include <linux/raid/xor.h>
 #include <linux/jiffies.h>
 #include <linux/preempt.h>
+#include <linux/bootcache.h>
 #include <asm/xor.h>
 
 #ifndef XOR_SELECT_TEMPLATE
@@ -54,13 +55,13 @@ EXPORT_SYMBOL(xor_blocks);
 /* Set of all registered templates.  */
 static struct xor_block_template *__initdata template_list;
 
-#ifndef MODULE
 static void __init do_xor_register(struct xor_block_template *tmpl)
 {
 	tmpl->next = template_list;
 	template_list = tmpl;
 }
 
+#ifndef MODULE
 static int __init register_xor_blocks(void)
 {
 	active_template = XOR_SELECT_TEMPLATE(NULL);
@@ -79,6 +80,21 @@ static int __init register_xor_blocks(void)
 #define BENCH_SIZE	4096
 #define REPS		800U
 
+static struct xor_block_template * __init
+xor_get_template_by_name(char *fastest_name)
+{
+	struct xor_block_template *f;
+
+#define xor_speed	do_xor_register
+	// build a list of templates
+	XOR_TRY_TEMPLATES;
+#undef xor_speed
+	for (f = template_list; f; f = f->next)
+		if (!strcmp(f->name, fastest_name))
+			return f;
+	return NULL;
+}
+
 static void __init
 do_xor_speed(struct xor_block_template *tmpl, void *b1, void *b2)
 {
@@ -117,9 +133,18 @@ calibrate_xor_blocks(void)
 {
 	void *b1, *b2;
 	struct xor_block_template *f, *fastest;
+	char cached_name[32];
+	int ret;
 
 	fastest = XOR_SELECT_TEMPLATE(NULL);
 
+	if (!fastest) {
+		ret = bootcache_get_string("xor_blocks_fastest",
+				cached_name, sizeof(cached_name));
+		if (!ret)
+			fastest = xor_get_template_by_name(cached_name);
+	}
+
 	if (fastest) {
 		printk(KERN_INFO "xor: automatically using best "
 				 "checksumming function   %-10s\n",
@@ -149,6 +174,8 @@ calibrate_xor_blocks(void)
 		if (f->speed > fastest->speed)
 			fastest = f;
 
+	bootcache_set_string("xor_blocks_fastest", fastest->name);
+
 	pr_info("xor: using function: %s (%d MB/sec)\n",
 	       fastest->name, fastest->speed);
 

-- 
2.48.1

