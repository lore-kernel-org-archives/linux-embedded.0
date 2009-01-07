From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH/RFC] Add Alternative Log Buffer Support for printk
 Messages
Date: Wed, 07 Jan 2009 11:04:02 +1100
Message-ID: <1231286642.14860.35.camel@pasglop>
References: <1227638045-12862-1-git-send-email-gerickson@nuovations.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1227638045-12862-1-git-send-email-gerickson@nuovations.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Erickson <gerickson@nuovations.com>
Cc: linuxppc-dev@ozlabs.org, Stefan Roese <sr@denx.de>, Wolfgang Denx <wd@denx.de>, linux-embedded@vger.kernel.org

On Tue, 2008-11-25 at 10:34 -0800, Grant Erickson wrote:
> This merges support for the previously DENX-only kernel feature of
> specifying an alternative, "external" buffer for kernel printk
> messages and their associated metadata. In addition, this ports
> architecture support for this feature from arch/ppc to arch/powerpc.
> 
> Signed-off-by: Grant Erickson <gerickson@nuovations.com>

Considering the extensive changes to generic code, this patch will
have to be submitted via the linux-kernel mailing list.

I suggest you split the generic core change from the powerpc specific
implementation.

I'm not sure whether I like the idea myself or not there, so you'll have
to convince the powers that be to take it.

Cheers,
Ben.

