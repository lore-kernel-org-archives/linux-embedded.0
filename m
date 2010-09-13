From: Johannes Stezenbach <js@sig21.net>
Subject: Re: ARM target not boot after remap memory
Date: Mon, 13 Sep 2010 14:12:47 +0200
Message-ID: <20100913121247.GA4003@sig21.net>
References: <AANLkTi=tWwaFHB0DY=j0UaqbYdYJpGJpmWdGC4aMufSw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=tWwaFHB0DY=j0UaqbYdYJpGJpmWdGC4aMufSw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robin Theunis <robint91@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-embedded@vger.kernel.org

On Mon, Sep 13, 2010 at 01:25:26PM +0200, Robin Theunis wrote:
> 
> Uncompressing Linux... done, booting the kernel.
> ---
> 
> Here is stalls. With my jtag probe I can locate the problem.
> 
> ---
> > halt
> target state: halted
> target halted in ARM state due to debug-request, current mode: Supervisor
> cpsr: 0x600000d3 pc: 0xc000af3c
> MMU: enabled, D-Cache: enabled, I-Cache: enabled
> >   arm disassemble 0xc000af3c
> 0xc000af3c	0xeafffffe	B 0xc000af3c
> ---
> 
> This just loops at that address. Why does it that?

Maybe it panicked but you can't see the message since
you have not enabled EARLY_PRINTK.

Since you have JTAG, you could also dump the printk
buffer __log_buf to see the message.


HTH
Johannes
