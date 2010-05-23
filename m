From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RESEND PATCH] ARM: fix 'unannotated irqs-on' lockdep warning
Date: Sun, 23 May 2010 13:38:01 +0100
Message-ID: <20100523123801.GC950@n2100.arm.linux.org.uk>
References: <1274615328-27953-1-git-send-email-tom.leiming@gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=caramon; h=Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:In-Reply-To:
	Sender; bh=QPZlz3jzRUVozEW1UC9UslVSN+d6rClrZ1BsFf9MfrE=; b=mLBAz
	RVHRzl0WoNCXIJdLPxb5tdNP40O7MRNzpekhL6yQvl+JTSfZN4OrnJquoHx2rYYH
	iAdkEmb/mrdMtUFmjs0zlIi+LK08jed37pUUXJRA07hJlWpIAoF8vbTnZ34bTaqo
	Ul+lreZqMCnUWS0HGVj2giu9RvO8rlS2c/0b4s=
Content-Disposition: inline
In-Reply-To: <1274615328-27953-1-git-send-email-tom.leiming@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tom.leiming@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-embedded@vger.kernel.org, a.p.zijlstra@chello.nl, linux-kernel@vger.kernel.org

On Sun, May 23, 2010 at 07:48:48PM +0800, tom.leiming@gmail.com wrote:
> diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
> index 2c1db77..ed471a7 100644
> --- a/arch/arm/kernel/entry-common.S
> +++ b/arch/arm/kernel/entry-common.S
> @@ -58,7 +58,7 @@ work_resched:
>   */
>  ENTRY(ret_to_user)
>  ret_slow_syscall:
> -	disable_irq				@ disable interrupts
> +	disable_irq_notrace				@ disable interrupts

I think this one does need to be traced - the pending work functions are
all C code which could call back into lockdep.

Also, I'm nervious about applying this patch without seeing more people
test it.
