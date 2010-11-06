From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: [PATCH 00/16 v2] pramfs: persistent and protected RAM Filesystem
Date: Sat, 06 Nov 2010 09:55:56 +0100
Message-ID: <4CD5181C.7040706@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:content-type
         :content-transfer-encoding;
        bh=EH/a94Y5Gfx3QpbSYvHsx1gaudXTXxL5WstbTW1PJ3s=;
        b=pi+16XgjmrE3bKbMtvksXir1cVnyoZimLKSNBTNIEMLQp4DVr07FL/RkWqUmgayB8P
         wLzpdPjK0LFveBhzmg8FMNfrc1w5TkIMuinaUWcUGRKUvnedQhdLKSa5zV1Aj/YhAczU
         ooEHYJRPEK2sYn63TVngyjCL4RHRL7YwRPmao=
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>, Andrew Morton <akpm@linux-foundation.org>, Linux Embedded <linux-embedded@vger.kernel.org>

Hi all,

I send the patch series again. I fix documentation problems reported by
Randy Dunlap and Kieran Bingham. I reworked the memory protection
functions according to the suggestions of Andi Kleen.

I ask to Andrew to evaluate to insert this fs in mainline.

Marco
