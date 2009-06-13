From: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: [PATCH 1/2] MMC Agressive clocking framework v2
Date: Sat, 13 Jun 2009 14:45:09 +0200
Message-ID: <63386a3d0906130545i4d2227a2h25e9b55df6954a1@mail.gmail.com>
References: <63386a3d0906020536t5a3391f9r921959ba6d6dd96e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=mYOwHyvoJdqd1LZgzfeEE2Qh+hYqhRVSHL/z1xEf78I=;
        b=U2MM2JT20KKA9jo85k2ucR3zxPBRFGLZAnoFQO8epMUGPNG5jwwpunuRGr/Z6knFra
         67HWG5KBxgnDOqMhP6RUUlwycqXALYU24ijJPntOqsovkSO9e9NMT9wOe/3Rqfrs5rdN
         lw1NJkb4j+uB8nzn7+kWwix9avFoMXeyClA28=
In-Reply-To: <63386a3d0906020536t5a3391f9r921959ba6d6dd96e@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Ossman <pierre@ossman.eu>, linux-arm-kernel@lists.arm.linux.org.uk, Pierre Ossman <drzeus-list@drzeus.cx>
Cc: linux-embedded@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>

2009/6/2 Linus Walleij <linus.ml.walleij@gmail.com>:

> This patch modified the MMC core code to optionally call the
> set_ios() operation on the driver with the clock frequency set
> to 0 to gate the hardware block clock (and thus the MCI clock)

have you had a chance to look at this for the current merge
window Pierre?

Yours,
Linus Walleij
