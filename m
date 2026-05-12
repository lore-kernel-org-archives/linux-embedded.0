Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E064230B50D
	for <linux-embedded@vger.kernel.org>; Tue, 12 May 2026 04:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778559145; cv=pass; b=NSkW8ET9Uc6+4H+WhzMbahAyilgyA4te0pLnAmyUjP7frJgq95B0fJ99mdiKqZY7ncY9T7MpiEoDP/oYMC8RDOqSErQV6r6Mk1ErGSjbUb7AiEPH1g/qTVS4ywO/vI3IbHDqjVqloPIZr1Ire14YBwlMrQbbNfjSVnfCy3gewRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778559145; c=relaxed/simple;
	bh=yHt5BVbPfFwh4hIxsPIeeDRHNboavy175zOrgWL6zmE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LLwGOvy79oPKzX+Tzbr3wDpH6ltQ9JkMmQUve1CjMCN3MVyJWmQJ81HoUFNUAMvjXw+7MMfSsA+RLi/xrvqBXBjhS7bZBx2JiyIeU8wMRvjqR/xr6TwBtlTLjl7Lzrg7DwUT+6GHTkXlmUk03/ARrEijq1xRlXqUKseqXYrbCCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJSKTYAg; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJSKTYAg"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7bd9f61458eso37962807b3.0
        for <linux-embedded@vger.kernel.org>; Mon, 11 May 2026 21:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778559143; cv=none;
        d=google.com; s=arc-20240605;
        b=X6fQr/8siXnalFTUNRz9nQ1vEi5nGdzt2E1e/VQO2dD6YMfSTeJSoED0pm2lNjQnp7
         rur3DpR8Y/bpoFyzgWw55PEpZPcuw9ZE8F6E8FqwJgh6kzfSx3mBWjvda9S8nT0UK+kB
         Y/lI/fRFXX7zQByo2oktDdrfKbW+oETktsXDBMgbDo0MnhDMGJoOzIGxK/uear5BvFAw
         CZT8W5YM6TsfVP5chV/vxGXW2bFZM1b4W+/ZxiQPM9be/xTwXtllfFkUvgFSWv/MW2RT
         eJDZdVY5ESe70/tgdrHO6PK+WRYPv7RCBlLUIsdrsM1QZYgFF18aL9waKZPingnd3LSP
         dOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=y8hciIA8JRIW9qx9gfVAR+t0j1dEC0+f38AE0AsofWQ=;
        fh=91MEEa9/QJ/R3MYdNPA7HZUulpipspghgLGXKdzSzE0=;
        b=cRA4cAKW5M3f7971/FkwxhwU1xE4kL/6KPV9t3v1BgQFepQQ52ErN7EXvkOj86Dugf
         +ClNZ/a//hukrZnRKcH8eInTn9aWtwPwEWkJHzieAMf0xVV/ASQcS2HRhlVndsxD+oKV
         uywaXSCKYIDrSfsD7ZCTwjb0hPehA4cjUX9poAZNHUV0/h7GDCPLpOmN7tZ0vBiCdyAS
         pMzxu2z/hs63s86S988HaLY+kUgAaIOR1Trzns1NBxYA3xuXFA/Sve+4GrwKISl+bsut
         X6RFB5huoqQ/EvIKAZrYI6VmkObPn6aFuNCHd8O9ahL2KYjMG4tvOn0Uz5WUBN3/IYNd
         MtlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778559143; x=1779163943; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y8hciIA8JRIW9qx9gfVAR+t0j1dEC0+f38AE0AsofWQ=;
        b=TJSKTYAg+b3kxxCRTmzcLvRd8kxrvYQ1pwBAzD7lsWRm8Za7I12/bCK5Tv9orKjv1f
         oeRdo3fEZExtLNzv+uDC2iJ8bMPjO41rU4x71GQebtTBfTtJdiMQ9WvgMqfufJNBRiEi
         953F6FTIE2B24UmVHFfvUU68Ez88D6TEyKffhnAgspuvwhUvtSR8wyb5dM1A5dK3SRyv
         qTODalEFbJIPvpXHO7N0FABP283naXioUaY7vuPjJY40fUIlpBEqdsnouzrqXg+b+xKy
         T2373OgqxwQjhqq80Ibkrg63xAuB4nydSwkM+vkvdYLigefGW8GN78mfPzjIqDIf2379
         ryeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778559143; x=1779163943;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8hciIA8JRIW9qx9gfVAR+t0j1dEC0+f38AE0AsofWQ=;
        b=jYZHd8FB5Ko9vUoEAJk3SNRpAgBf1i3ODGoS5ubT+caVtS5j08xUh8/lg4O5BoWtqp
         VLcVqjQhrmimNYDRC9PkL8OOO4MtXmqMTRGuAU0foVsjrfUdLDhKZY8enC9YTOvmwEYT
         BA3tN1t+eI1WHNGBbvbmBaqgpWLbDzXWsNsn8bxQ+5g/bFMSWFvH+yk6PIvQqlFo5RwS
         seMsw6++EOol9Nc3LCxOzugiw2lwxVG2qsOFI2AFrCSBgwbHMcTF6xMx2PQpd8lRju4/
         cq5vtQc29K7Q9X8+n7EPSz96DN/q2pqXA+k19X9twmO5M6q0uf/RxwZ7JLRyADxfo8hi
         yvyg==
X-Gm-Message-State: AOJu0YyxwtHPTPRjJ9IffXEc+VWMS4UCEOe3av0SD48TZIPDpEy17hI9
	331+J02VnBCHT/lNgXtnyl0duM4iEyNR5S53rBox0/K1oq7WoPux3O332FFj0S43ifZ6DpsoD2Y
	hwz8Y6BoJP6HBIp/MOSQf14it1y+dqzw1VvUsLA==
X-Gm-Gg: Acq92OH+KWvDYrtLd+cujCCcPXak7gKjUNF+5J/WQ4L74m63OrU1tSvSmqL9Top1IHP
	82B6HgAy+SPcT9nWQYqI8Vdny5nDlzmUFrr4ubFGVgFS8IlrWYs0YEcDqRnswqtiguUXZbqxvGG
	Y4wgySrPZ6NZ33D4LO/4pwpy60jdq3RRHH/0W0EY2b6T9O7LaDYavk/SlCT5gMq44YcKfPx0OYO
	BAidzUN7q9ScRnm0Eprz97CcgWoxPCyPeGEFn0TqercosmgXOH24SpZJYqROKXFb4Ic9RWmpiuu
	UuFC2f50Z2xa7yzf03MRsob0lrHmb/VU8MfE8HFJDNfx22Z3tsqTIHkwYBUIos8ylsCY17i3Tui
	aiCy3DATVdQMe1S19zGOm
X-Received: by 2002:a05:690c:885:b0:79a:3e8d:9bd8 with SMTP id
 00721157ae682-7c1025640dbmr121574337b3.2.1778559142685; Mon, 11 May 2026
 21:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Tue, 12 May 2026 06:11:45 +0200
X-Gm-Features: AVHnY4IuMfJZPaOZO7jII0ZNJA_xDBZ2_WCe0ehBQSvMnGQVBF7zfm58B0VrRjU
Message-ID: <CAJGKYO4BZQd9sCsgnrSJ-wG5aDjM2P5nXJOyhDn=nU1O3+2T8w@mail.gmail.com>
Subject: [PATCH] unseeded cnrg warning flooding dmesg fix, v2
To: Embedded Linux mailing list <linux-embedded@vger.kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Hardik Garg <hargar@linux.microsoft.com>, 
	Vijayendra Suman <vijayendra.suman@oracle.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Ron Economos <re@w6rz.net>, Brett A C Sheffield <bacs@librecast.net>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Mark Brown <broonie@kernel.org>
Content-Type: multipart/mixed; boundary="000000000000e9c6f00651971102"

--000000000000e9c6f00651971102
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

A patch based on 5.15.202, in-line for comments + attachment as patch

Public patch by url / commit for future reference:

https://raw.githubusercontent.com/robang74/uchaosys/
4ddd9859582441afe0faf43a227124d8cf579c5c/
cnfg/bothering-warn_unseeded_randomness-fix.patch

Best regards,
Roberto A. Foglietta

From df61514c6e07ae722c87b2727999bdc49a08bcaa Mon Sep 17 00:00:00 2001
From: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>
Date: Tue, 12 May 2026 05:39:41 +0200
Subject: [PATCH] unseeded cnrg warning flooding dmesg fix, v2
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Better than hiding the warning, there is a third approach compared
print_ratelimited() and printk_once(), printk one over N=3D256 which
is fitting this specific case: at boot time too much warnings for
a few seconds but still printing something in case the problem
persists without clogging the log.

On a SMP system the counter might face a race condition due to non
atomic increment and this can lead to skipping a scheduled print or
print two of them when just one was expected. No harm in both cases,
anyway.

To be honest, complaining that a suppression counter might be subject
to a race condition on an SMP system - when, if it weren=E2=80=99t there, a=
n
alarm would be triggered stating that the system is initialising
cryptographic directives without adequate entropy support - seems
a bit surreal to me.

Patch based on Linux kernel 5.15.202 LTS master branch.

v1 -> v2: a bit better English and "git am" format

Signed-off-by: Roberto A. Foglietta <roberto.foglietta@gmail.com>
---
 drivers/char/random.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 8642326de6e1..eeec336b10fa 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -182,7 +182,8 @@ static void __cold process_random_ready_list(void)
 }

 #define warn_unseeded_randomness() \
- if (IS_ENABLED(CONFIG_WARN_ALL_UNSEEDED_RANDOM) && !crng_ready()) \
+ if (IS_ENABLED(CONFIG_WARN_ALL_UNSEEDED_RANDOM) && !crng_ready() \
+ && !({ static u8 x=3D-1; ++x; })) \
  printk_deferred(KERN_NOTICE "random: %s called from %pS with
crng_init=3D%d\n", \
  __func__, (void *)_RET_IP_, crng_init)

--=20
2.34.1

--000000000000e9c6f00651971102
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0001-unseeded-cnrg-warning-flooding-dmesg-fix-v2.patch"
Content-Disposition: attachment; 
	filename="0001-unseeded-cnrg-warning-flooding-dmesg-fix-v2.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mp242k450>
X-Attachment-Id: f_mp242k450

RnJvbSBkZjYxNTE0YzZlMDdhZTcyMmM4N2IyNzI3OTk5YmRjNDlhMDhiY2FhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiUm9iZXJ0byBBLiBGb2dsaWV0dGEiIDxyb2JlcnRvLmZvZ2xp
ZXR0YUBnbWFpbC5jb20+CkRhdGU6IFR1ZSwgMTIgTWF5IDIwMjYgMDU6Mzk6NDEgKzAyMDAKU3Vi
amVjdDogW1BBVENIXSB1bnNlZWRlZCBjbnJnIHdhcm5pbmcgZmxvb2RpbmcgZG1lc2cgZml4LCB2
MgpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRG
LTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKQmV0dGVyIHRoYW4gaGlkaW5nIHRo
ZSB3YXJuaW5nLCB0aGVyZSBpcyBhIHRoaXJkIGFwcHJvYWNoIGNvbXBhcmVkCnByaW50X3JhdGVs
aW1pdGVkKCkgYW5kIHByaW50a19vbmNlKCksIHByaW50ayBvbmUgb3ZlciBOPTI1NiB3aGljaApp
cyBmaXR0aW5nIHRoaXMgc3BlY2lmaWMgY2FzZTogYXQgYm9vdCB0aW1lIHRvbyBtdWNoIHdhcm5p
bmdzIGZvcgphIGZldyBzZWNvbmRzIGJ1dCBzdGlsbCBwcmludGluZyBzb21ldGhpbmcgaW4gY2Fz
ZSB0aGUgcHJvYmxlbQpwZXJzaXN0cyB3aXRob3V0IGNsb2dnaW5nIHRoZSBsb2cuCgpPbiBhIFNN
UCBzeXN0ZW0gdGhlIGNvdW50ZXIgbWlnaHQgZmFjZSBhIHJhY2UgY29uZGl0aW9uIGR1ZSB0byBu
b24KYXRvbWljIGluY3JlbWVudCBhbmQgdGhpcyBjYW4gbGVhZCB0byBza2lwcGluZyBhIHNjaGVk
dWxlZCBwcmludCBvcgpwcmludCB0d28gb2YgdGhlbSB3aGVuIGp1c3Qgb25lIHdhcyBleHBlY3Rl
ZC4gTm8gaGFybSBpbiBib3RoIGNhc2VzLAphbnl3YXkuCgpUbyBiZSBob25lc3QsIGNvbXBsYWlu
aW5nIHRoYXQgYSBzdXBwcmVzc2lvbiBjb3VudGVyIG1pZ2h0IGJlIHN1YmplY3QKdG8gYSByYWNl
IGNvbmRpdGlvbiBvbiBhbiBTTVAgc3lzdGVtIC0gd2hlbiwgaWYgaXQgd2VyZW7igJl0IHRoZXJl
LCBhbgphbGFybSB3b3VsZCBiZSB0cmlnZ2VyZWQgc3RhdGluZyB0aGF0IHRoZSBzeXN0ZW0gaXMg
aW5pdGlhbGlzaW5nCmNyeXB0b2dyYXBoaWMgZGlyZWN0aXZlcyB3aXRob3V0IGFkZXF1YXRlIGVu
dHJvcHkgc3VwcG9ydCAtIHNlZW1zCmEgYml0IHN1cnJlYWwgdG8gbWUuCgpQYXRjaCBiYXNlZCBv
biBMaW51eCBrZXJuZWwgNS4xNS4yMDIgTFRTIG1hc3RlciBicmFuY2guCgp2MSAtPiB2MjogYSBi
aXQgYmV0dGVyIEVuZ2xpc2ggYW5kICJnaXQgYW0iIGZvcm1hdAoKU2lnbmVkLW9mZi1ieTogUm9i
ZXJ0byBBLiBGb2dsaWV0dGEgPHJvYmVydG8uZm9nbGlldHRhQGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL2NoYXIvcmFuZG9tLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2hhci9yYW5kb20uYyBiL2Ry
aXZlcnMvY2hhci9yYW5kb20uYwppbmRleCA4NjQyMzI2ZGU2ZTEuLmVlZWMzMzZiMTBmYSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9jaGFyL3JhbmRvbS5jCisrKyBiL2RyaXZlcnMvY2hhci9yYW5kb20u
YwpAQCAtMTgyLDcgKzE4Miw4IEBAIHN0YXRpYyB2b2lkIF9fY29sZCBwcm9jZXNzX3JhbmRvbV9y
ZWFkeV9saXN0KHZvaWQpCiB9CiAKICNkZWZpbmUgd2Fybl91bnNlZWRlZF9yYW5kb21uZXNzKCkg
XAotCWlmIChJU19FTkFCTEVEKENPTkZJR19XQVJOX0FMTF9VTlNFRURFRF9SQU5ET00pICYmICFj
cm5nX3JlYWR5KCkpIFwKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfV0FSTl9BTExfVU5TRUVERURf
UkFORE9NKSAmJiAhY3JuZ19yZWFkeSgpIFwKKwkmJiAhKHsgc3RhdGljIHU4IHg9LTE7ICsreDsg
fSkpIFwKIAkJcHJpbnRrX2RlZmVycmVkKEtFUk5fTk9USUNFICJyYW5kb206ICVzIGNhbGxlZCBm
cm9tICVwUyB3aXRoIGNybmdfaW5pdD0lZFxuIiwgXAogCQkJCV9fZnVuY19fLCAodm9pZCAqKV9S
RVRfSVBfLCBjcm5nX2luaXQpCiAKLS0gCjIuMzQuMQoK
--000000000000e9c6f00651971102--
