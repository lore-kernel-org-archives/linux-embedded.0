From: "Linus Walleij" <linus.ml.walleij@gmail.com>
Subject: Re: conceptual map of the kernel source (Interactive Linux kernel map)
Date: Sat, 2 Aug 2008 00:07:20 +0200
Message-ID: <63386a3d0808011507h28aa213mb27d32b2f855b9ac@mail.gmail.com>
References: <8aa6b0650807310644g10b8ce3dvd634d482cab659ea@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=GOfHC8TGFYB3SEpVhHTwAJ8azurOWby2vge4798knMc=;
        b=f9B98fzsyo9DWsJRoM7bnemgIxH4Gi4O22twSnHFt7lygUj880PG2jxaCZb+enj3oe
         iqMayhcq7dSuHYfBjVoNEpvApFMvHoWezs8PofiQMcLc3HL5OigttsiJZ5WWNTeHT6BU
         A6udjfaErr3Ptv7G4eMNq1i0CkXdk64GfaN+s=
In-Reply-To: <8aa6b0650807310644g10b8ce3dvd634d482cab659ea@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Constantine Shulyupin <const@linuxdriver.co.il>, linux-embedded@vger.kernel.org

2008/7/31 Constantine Shulyupin <const@linuxdriver.co.il>:

> I am updating the kernel map: http://www.makelinux.net/kernel_map
> It is conceptual map consisting of more than 200 most important kernel
> functions.

I was very impressed once I saw this map first, which was through
your (?) contributions to the Linux entries in Wikipedia. Keep up the
good work!

> Could you please have a look and suggest fixes and updates.

The embedded systems will be interested in most things not
asm-i386 and arch-i386. For example you show a lot of PCI
and such things in the lowest layers, I wonder if it'd be worth
the effort to make arch-specific views of the lowermost parts
(but probably not).

Another this is that flash drivers MTD, doesn't fit into the picture,
instead harddisk is uses as example.

Linus
