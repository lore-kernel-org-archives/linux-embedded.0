From: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: [PATCH 1/2] MMC Agressive clocking framework v3
Date: Sun, 21 Jun 2009 22:05:18 +0200
Message-ID: <63386a3d0906211305yd09b4e6x488ac8b572af8204@mail.gmail.com>
References: <1245308220-25069-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=qoiFDj4DRAEG0hXwelhstpTuLuDROBTOp8AF3xZhgRY=;
        b=giIwD+X6UHw9G2/Dm6d7Bm6KLJKNFxrIy8BgIFknFnfr6xBOOAtGO49LsNF/wSAld2
         xzPxevt8D/wCkqCYV/gkj+HPdl/YrmjfQxYQJfPkAtM947YUYP/G9ommlNXWlQNLmPB1
         LPp6VLY1/ZW30tBB7xm1AbewI6YMU852ba10M=
In-Reply-To: <1245308220-25069-1-git-send-email-linus.walleij@stericsson.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Ossman <pierre@ossman.eu>
Cc: Linus Walleij <linus.walleij@stericsson.com>, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org

2009/6/18 Linus Walleij <linus.walleij@stericsson.com>:

> diff --git a/drivers/mmc/core/Kconfig b/drivers/mmc/core/Kconfig
>(...)
> +         Of unsure, say N.

However the rest of the patch is as I intended. I'll send a V4 pronto
if you want that for the current merge window.

Linus Walleij
