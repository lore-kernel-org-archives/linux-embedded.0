From: Dirk Behme <dirk.behme@gmail.com>
Subject: Boot time: Initial main memory initialization optimizations?
Date: Mon, 05 May 2014 17:40:56 +0200
Message-ID: <5367B108.8080206@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=lFwCQT+jMv3gvUxYec+HkfJ7CE63U8zBQBEKHfq7Dv0=;
        b=H2hX8PiZvdEIkw9b8tGvt0+mOSXAHGLocWLCS52iXb3L41a/mPsAf322wECknAf+Hj
         9siTHHUTfSeuH2o1vDm7c2ybVThePHyTiw2Nj8aCB4tN2472itmpATNlJVo1GH8TEWJj
         8AlQRBuyJWxmT773uO/ikObmosFFjv/L0LlhYDL2VOmfz4cT91HTaqm2Qy0yNKDjF+H+
         E78BmCcOTco7PMUulhL4tnzWoKuNs3A3KHxKEHK0aHIR5K4JRzI9rIH03hFQH/IL1vwb
         6UQRUiNjJqcBjACJo3Zx59Jq0JTQxjo8wpaN/DBoC+5R5YOprAZGE+nsMJ4rHL3qJUpE
         YGbw==
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Embedded <linux-embedded@vger.kernel.org>

Hi,

regarding boot time optimization, on an embedded ARM Cortex-A9 based 
system with 512MB or 1GB main memory, we found that initializing this 
main memory takes a somehow large amount of time.

Initializing 512MB takes <= ~100ms, the additional 512MB on the 1GB 
take <= ~100ms additionally, too. So in sum <= ~200ms for 1GB.

Having a short look to this, it looks like most of the time is spent 
in arch/arm/mm/init.c in 
bootmem_init()/arm_bootmem_init()/arm_bootmem_free().

Has anybody already looked into this if there are any optimizations 
possible? Maybe even some hacks, if the main memory size (512MB/1GB) 
is always known? Any pointers?

I'm looking for reducing (a) the overall init time and maybe (b) the 
dependency on the memory size.

Thanks

Dirk



