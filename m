From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: [PATCH 08/16 v4] pramfs: headers
Date: Thu, 25 Nov 2010 13:20:37 +0100
Message-ID: <AANLkTimWtBkoXfr6d4ujsfeJiMEvtLV2EgMzowv4LvDv@mail.gmail.com>
References: <4CE79C2F.5090001@gmail.com>
	<20101124080658.GC2212@linux-sh.org>
	<AANLkTikXxzcr+Ybru9vCt0+w6s-UYVNEudxvecF-0Xse@mail.gmail.com>
	<20101124083519.GF2212@linux-sh.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=hcOW2rcNYq9nXC6NckAaN3LYuMD51Q9vmwLrsu9v7bM=;
        b=YEAa1lqU4JO1FCxda/D4tAsnFQgmEX1XNFoUEoBKKITq4JIFwDjuJy8l8SyiNvYcbS
         JoXTXPhi9njdndWzkZSljYqiQvqUhp7Jp8OUWaVHJh40H7VtUFf0JqIVhmlFWar8vwfe
         u1o/k0HYFez9mxsK51NhPYu7E2IwbMcT0U3Gw=
In-Reply-To: <20101124083519.GF2212@linux-sh.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mundt <lethal@linux-sh.org>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@suse.de>, Tim Bird <tim.bird@am.sony.com>

2010/11/24 Paul Mundt <lethal@linux-sh.org>:
> On Wed, Nov 24, 2010 at 09:23:02AM +0100, Marco Stornelli wrote:
>> 2010/11/24 Paul Mundt <lethal@linux-sh.org>:
>> >
>> >> +#ifdef CONFIG_PRAMFS_WRITE_PROTECT
>> >> +static inline void pram_memunlock_range(void *p, unsigned long len)
>> >> +{
>> >> +#ifndef CONFIG_X86
>> >> + ? ? local_irq_disable();
>> >> +#endif
>> >> + ? ? preempt_disable();
>> >> + ? ? pram_writeable(p, len, 1);
>> >> +}
>> >> +
>> > This needs some explaining, or killing. While the latter is preferable,
>> > we can also work with the former.
>> >
>>
>> Maybe I didn't understand, you mean preemt_disable() without disabling
>> the interrupt?
>
> I mean what exactly is this supposed to be doing? It looks pretty
> questionable for SMP for starters, it doesn't explain why x86 is special,
> etc. It looks like you wanted a spinlock with IRQs disabled but probably
> opted not to use it because you were throwing this around interfaces that
> could sleep, which looks like a really scary thing for latency. It's also
> making architecture assumptions without any explanation of why. This
> needs to be explained, and in some amount of detail, as it's not entirely
> obvious.
>

Ok, it's not clear, I'll try to explain. My idea here is avoid "open
windows" with the memory not locked (lock here means not protected).
The problem here is that if you call set_memory_rw/set_memory_ro with
interrupt disabled (for x86) you'll fall in a bug_on() condition. I
can add that the use of these functions has been discussed in the v1
patch series with Andi Kleen.

Marco
