From: Marco <marco.stornelli@gmail.com>
Subject: Re: Saving the kernel log accross boots
Date: Thu, 25 Jun 2009 19:02:43 +0200
Message-ID: <4A43ADB3.20808@gmail.com>
References: <op.uv238aaxq25ece@thur.netmodule.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=i9M7B+M7s33qsUSmMv47Rd4lyoD11kExBNCaIVukuOg=;
        b=YQZMr5UN/28kHuVYkMOaHYVcAhibMX5a43MPYHFNZRad92jMYrY07u1MVMhMe9Ekgf
         wHC42VDQb4giHsykyZUCEYlKGODvnkWCcOlG5RDDLwoAAH+/iDi0Ytsf6erJqfm3fv3f
         bCuNhaq2FwcpNbu884703kY9TkP3vUMFCU3e4=
In-Reply-To: <op.uv238aaxq25ece@thur.netmodule.intranet>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin Meuli <Martin.Meuli@gmx.ch>
Cc: linux-embedded@vger.kernel.org

Martin Meuli wrote:
> Hi All
> 
> In case of a crash we would like to save the kernel log and retrieve it
> in the next boot.
> There are already several suggestions on how to do it on this and other
> lists.
> (Kernel crashing and log buffers: Robin Getz)
> Unfortunately we don't have extra SRAM to use for it. We need to do it
> in the 'normal' RAM.
> 
> ARCH=ARM
> 
> What we did:
> - modify kernel/printk.c: use
> __attribute__((__section__(".bss.kringbuf"... to put the log related
> stuf into a separate section
> - modify the linker script to link .bss.kringbuf at the start of the
> .bss section
> - modify arch/arm/kernel/head-common.S to exclude the new section from
> being nulled (if it was a watchdog restart)
> - modify kernel/printk.c to use cach_flush after prink
> - make sure the bootloader does not overwrite that memory
> 
> This seems to work.
> After a crash we get the messages from the new boot and the last crash.
> It seems that the decompress code is using memory at the end of the
> kernel and destroys the log. So we have to use the bootloader to
> decompress the image into RAM.
> 
> Before digging any deeper I would like to know if someone as a better
> (more general) idea.
> 
> Regards, Martin

I submitted for a review a new filesystem for 2.6.30 called pramfs that
it can be useful for your case. You could use a little piece of ram to
store the log.

Marco
