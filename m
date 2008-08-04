From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
Subject: Re: is it worth separating initrd from initramfs support?
Date: Mon, 4 Aug 2008 22:16:03 +0200
Message-ID: <c384c5ea0808041316v26ead859se5e778b074c735f4@mail.gmail.com>
References: <alpine.LFD.1.10.0808041449420.9561@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=waxXbOzkdRZEQjgbp36BRQzMrZNqi3rLKqZ8hOcAYV4=;
        b=KyJb6RBLfLQL9QwYzAzgY9AqdCLHrV9YuJ3kffP0euPsP5MUxj+LiCo8aDepRaRTVd
         LDiVOt0+Mx5z2T2fNLUbDqPnGSquKM0yHAtkEzxxnO5KFRyNLH75vREHTUEjCjsBiKAF
         LcPl3g2KeFlOymbpw+M/sT71nGDpno/NIFrPE=
In-Reply-To: <alpine.LFD.1.10.0808041449420.9561@localhost.localdomain>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Embedded Linux mailing list <linux-embedded@vger.kernel.org>

Robert,

On Mon, Aug 4, 2008 at 8:53 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>  not sure if i asked this here once upon a time but, in the current
> kernel, you get to select support for *both* initrd and initramfs with
> a single selection (CONFIG_BLK_DEV_INITRD).
>
> ...
>
>  in the context of embedded linux, is there any value in separating
> these features and letting one select them individually?  isn't it
>
Makes sense to me to seperate them, especially if this reduces code size.

Small kernels and initramfs's are used in memory constrained systems,
we run it on FPGA SoC cores.

Does disabling initrd alone reduce code size? Is the dependency on
some subsystem removed (block i/o layer?)

Regards,
-- 
Leon
