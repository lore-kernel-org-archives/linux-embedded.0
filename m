From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH] phylib: add mdio-gpio bus driver (v2)
Date: Mon, 27 Oct 2008 10:53:30 -0400
Message-ID: <8bd0f97a0810270753m740a2295i492532f055f13b17@mail.gmail.com>
References: <20081027105318.21923.24436.stgit@Programuotojas.82-135-208-232.ip.zebra.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=S/PnX4iQWInlht9oynOH4cUOPiQ3Kfw4zl4iqrYBxjI=;
        b=vBxHFEhjsqKW28u2wzh3k4g+9KoEHz36k2QTZocQiI3xTdByJLs3HEe0yf6ZpvjUyT
         uwAELHZEiychW1DhEPwqWYwUEmSnReOmbRbDbNirANs32VVJpvQCz3L0VgbHLoPjWDhX
         7CMSDu1QXLHyfux7H2tMGq7zW4qlSe0X6FxUs=
In-Reply-To: <20081027105318.21923.24436.stgit@Programuotojas.82-135-208-232.ip.zebra.lt>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded@vger.kernel.org

On Mon, Oct 27, 2008 at 06:53, Paulius Zaleckas wrote:
> +       new_bus->irq = kmalloc(sizeof(int) * PHY_MAX_ADDR, GFP_KERNEL);

oh, and this should be kcalloc()
-mike
