From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH v4 4/6] dmaengine: Make DMA Engine menu visible for AVR32 users
Date: Thu, 26 Jun 2008 13:04:00 -0700
Message-ID: <200806261304.00695.david-b@pacbell.net>
References: <1214486603-23655-1-git-send-email-haavard.skinnemoen@atmel.com> <1214486603-23655-4-git-send-email-haavard.skinnemoen@atmel.com> <1214486603-23655-5-git-send-email-haavard.skinnemoen@atmel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758159AbYFZUEZ@vger.kernel.org>
In-Reply-To: <1214486603-23655-5-git-send-email-haavard.skinnemoen@atmel.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Pierre Ossman <drzeus-list@drzeus.cx>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, kernel@avr32linux.org, shannon.nelson@intel.com, Adrian Bunk <bunk@stusta.de>

On Thursday 26 June 2008, Haavard Skinnemoen wrote:
> So, while this patch solves my immediate problem of making DMA Engine=
s
> available on AVR32, I'd much rather remove the whole arch dependency
> list because I think it's bogus. Comments?

Alternatively, "depends on HAVE_DMA_ENGINE" which arch code selects.

> -=A0=A0=A0=A0=A0=A0=A0depends on (PCI && X86) || ARCH_IOP32X || ARCH_=
IOP33X || ARCH_IOP13XX || PPC
> +=A0=A0=A0=A0=A0=A0=A0depends on (PCI && X86) || ARCH_IOP32X || ARCH_=
IOP33X || ARCH_IOP13XX || PPC || AVR32
