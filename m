From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH/RFC] Add Alternative Log Buffer Support for printk Messages
Date: Tue, 25 Nov 2008 20:23:33 -0500
Message-ID: <8bd0f97a0811251723j7bac6964u237aa6c1228a7d89@mail.gmail.com>
References: <1227638045-12862-1-git-send-email-gerickson@nuovations.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=WvHta/HyO6l7+NiwzMlnRAz3oVneAaor8Jt0q0A5lcg=;
        b=g91ta7CLUOeCmp+hQW+xvKEzjwkdS6BVJosZjEqy/wux4mgGa8Gy2pLtAgJeTdVAYL
         bxzUdrMwHhkYtSUf8RPs2MYfiOClFDn8UnW8E3aDAqhCjY/DFMsBDvxIoQvQuFTTeJ6K
         WFAvPRDISfrANafFV1wBiTSpZzmJAEuZIrWGY=
In-Reply-To: <1227638045-12862-1-git-send-email-gerickson@nuovations.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Erickson <gerickson@nuovations.com>
Cc: linuxppc-dev@ozlabs.org, linux-embedded@vger.kernel.org, Wolfgang Denx <wd@denx.de>, Stefan Roese <sr@denx.de>

On Tue, Nov 25, 2008 at 13:34, Grant Erickson wrote:
> This merges support for the previously DENX-only kernel feature of
> specifying an alternative, "external" buffer for kernel printk
> messages and their associated metadata. In addition, this ports
> architecture support for this feature from arch/ppc to arch/powerpc.
>
> Signed-off-by: Grant Erickson <gerickson@nuovations.com>
> ---
>
> When this option is enabled, an architecture- or machine-specific log
> buffer is used for all printk messages. This allows entities such as
> boot loaders (e.g. U-Boot) to place printk-compatible messages into
> this buffer and for the kernel to coalesce them with its normal
> messages.
> <snip>

this extended info should be part of the changelog and thus above the
--- marker ...
-mike
