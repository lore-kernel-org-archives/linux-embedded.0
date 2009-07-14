From: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: [PATCH 1/2] MMC Agressive clocking framework v4
Date: Tue, 14 Jul 2009 17:12:19 +0200
Message-ID: <63386a3d0907140812q20b5e0bbl63c2906dea6af5e9@mail.gmail.com>
References: <1245617982-5007-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=BszoeEsOpPL/HKjxIGli9vC82iXHbTP7BE3gh6QbRGM=;
        b=gVoAgXo2I1ZjmIB/TA+OmdOQbnUKit8AapogedMtC7vt4BBWsSUlB8FlQQs4b3poPE
         +R9DWPQbjwsH5ntEw3JvIPQHDbKLKlqX3pj7qjjWfCt8ojPxVlOzd464ig1LCgGwHgic
         WZm7ApgBERr8lorE0g/UnL/p3iTkAYmZpExM8=
In-Reply-To: <1245617982-5007-1-git-send-email-linus.walleij@stericsson.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Ossman <pierre@ossman.eu>
Cc: Linus Walleij <linus.walleij@stericsson.com>, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org

2009/6/21 Linus Walleij <linus.walleij@stericsson.com>:

> This patch modified the MMC core code to optionally call the
> set_ios() operation on the driver with the clock frequency set
> to 0

Ping on this. It's soon been a month since the last version and
I know we're in vacation times but...

Linus Walleij
