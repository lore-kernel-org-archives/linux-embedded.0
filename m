From: "Dan Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 4/6] dmaengine: Make DMA Engine menu visible for AVR32 users
Date: Fri, 27 Jun 2008 11:31:49 -0700
Message-ID: <e9c3a7c20806271131i5a4f5afg94fd21a89923ffbb@mail.gmail.com>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com>
	 <200806270937.21850.david-b@pacbell.net>
	 <20080627174441.GB4306@cs181140183.pp.htv.fi>
	 <200806271124.42783.david-b@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=JLdQEIcB7vIdRH8zDNe1zLmPoo9olCkFuUGMp7clxUA=;
        b=ZoNVmWXHOMDgRN3Sb2sA2P9tHphL+qeUvl5+datQ+WC3CkkLHnQldT0LyWts7cJpym
         ukGdnRGAVQe/7ZcrcxCIWsuZD1c7yyk++uV5R2Pk89N3pMgjSGPIxAGCuVozWnhksxZc
         VBlGDCdJchBl7HT0MaqjdAxAlKtC/lmcfz9Ys=
In-Reply-To: <200806271124.42783.david-b@pacbell.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Brownell <david-b@pacbell.net>
Cc: Adrian Bunk <bunk@kernel.org>, Haavard Skinnemoen <haavard.skinnemoen@atmel.com>, Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, "Nelson, Shannon" <shannon.nelson@intel.com>

On Fri, Jun 27, 2008 at 11:24 AM, David Brownell <david-b@pacbell.net> wrote:
> On Friday 27 June 2008, Adrian Bunk wrote:
>> The only effect of the HAVE_DMA_ENGINE would be to not show an empty
>> kconfig menu.
>
> Well, no.  It would also make the network layer memcpy "acceleration"
> option unavailable when there was no underlying engine ... similarly
> with other pointless "we don't have that subsystem here" options.
>

Take another look.  NET_DMA depends on DMA_ENGINE which only gets
selected when a dma device driver is selected.  Each driver has its
architecture specific dependency, so the DMADEVICES arch dependency
was completely redundant.

> Plus it would help ensure that the arch dependencies are comprehenible,
> unlike that highmem thing.

The highmem dependency can go away its only purpose is to prevent
hitting the BUILD_BUG_ON in async_xor.c.

--
Dan
