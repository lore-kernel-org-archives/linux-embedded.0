From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH 2/2] phylib: make mdio-gpio work without OF
Date: Fri, 31 Oct 2008 18:07:55 -0400
Message-ID: <8bd0f97a0810311507o1c5a371dn57ea813275f11e6b@mail.gmail.com>
References: <20081031164132.20490.27608.stgit@Programuotojas.82-135-208-232.ip.zebra.lt>
	 <20081031164934.20490.67539.stgit@Programuotojas.82-135-208-232.ip.zebra.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=uV7rznCunZ6ZZhhtPnLUP6BL8og/z7lFWU4boz5AaMo=;
        b=v7afUkdThROBBW1CdiHxFySQ9U1rd2ztmKigrl80dxp1uzofQhCCtqNR1adBs5hpfI
         ui434VcJXiLFjg7vLxa5dZuns05d6vfkFIghFo7dXSBK3Q97Cjsn4IN2kuRSM/Amv3vw
         UwIAX6DVz0ZAyib0ELnGcSNX/xhTUwY14ZdRc=
In-Reply-To: <20081031164934.20490.67539.stgit@Programuotojas.82-135-208-232.ip.zebra.lt>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org, Laurent Pinchart <laurentp@cse-semaphore.com>, Grant Likely <grant.likely@secretlab.ca>

On Fri, Oct 31, 2008 at 12:49, Paulius Zaleckas wrote:
> +#ifndef NO_IRQ
> +#define NO_IRQ  0
> +#endif

discussions elsewhere indicate this should die.
-if (irq != NO_IRQ)
+if (irq)
-mike
