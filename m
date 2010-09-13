From: Johannes Stezenbach <js@sig21.net>
Subject: Re: ARM target not boot after remap memory
Date: Mon, 13 Sep 2010 19:26:06 +0200
Message-ID: <20100913172606.GA14462@sig21.net>
References: <AANLkTi=tWwaFHB0DY=j0UaqbYdYJpGJpmWdGC4aMufSw@mail.gmail.com>
 <20100913121247.GA4003@sig21.net>
 <AANLkTiksacwuOwqJGZ0F3M1jhZ6Srr88wbfBQodOGOAt@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTiksacwuOwqJGZ0F3M1jhZ6Srr88wbfBQodOGOAt@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robin Theunis <robint91@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On Mon, Sep 13, 2010 at 04:30:17PM +0200, Robin Theunis wrote:
> 
> I have compiled  the kernel with early printk on and debug_LL, It still
> doesn't nothing after that line.

Please don't top-post.

Did you add "earlyprintk" to your kernel command line
like the EARLY_PRINTK menuconfig help text suggests?

arch/arm/mach-at91/include/mach/debug-macro.S also suggests
the LL debug output goes to AT91 debug unit not to normal UART
(not sure about this, I don't know much about AT91).
Did you try to dump __log_buf using JTAG?


HTH
Johannes
