From: Marco Stornelli <marco.stornelli@gmail.com>
Subject: Re: AMP on an SMP system
Date: Fri, 02 Aug 2013 17:37:07 +0200
Message-ID: <51FBD223.9020809@gmail.com>
References: <51FB6EE1.3090708@lumino.de> <20130802114225.GR3880@pengutronix.de> <51FBA261.10301@lumino.de> <51FBC7FE.4000403@gmail.com> <51FBCF46.4080700@lumino.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=In6u6pZm6Yypnp24fvczbAWK0rN0wA/gjtafSB4M0fE=;
        b=sQ7uc7F1gBJU//VFX9n64EXQmNRRinZlGXIarQB5R7i8kXpN/4W7p7l4A82jnztbq4
         mUzRGuXhpee9JMLUyHEVpV3oUVLlk9Q3ewUgNhrsResYSoW0vXD8lICTUSKGTsmwaryy
         G/g4CQwbQrASvWRVw3Q3OqauKnOoPL9wnznjaHLuBW6yIjLabJOi448M2AUn8sl4oNhA
         Jd/DSy3VPvKgIkPXe0UvxOA+6D3KgT/OGALWlEQq5zmrf2iMFxIKUS4ubyxKKihcfQhC
         lS3iZq2ifjGiNCdalPqhQeMlPD5KP3mTmM008nlfgmPqYDEhDW3yiBFa53OFdsRiwMMI
         2ZHA==
In-Reply-To: <51FBCF46.4080700@lumino.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Schnell <mschnell@lumino.de>
Cc: linux-embedded@vger.kernel.org

Il 02/08/2013 17:24, Michael Schnell ha scritto:
> On 08/02/2013 04:53 PM, Marco Stornelli wrote:
>>
>>>   - how to assign an interrupt (e.g. a dedicated timer) to the
>>> subsystem ?
>>
>> Interrupt handler are kernel thread, so you can schedule your kernel
>> thread on your "normal" cpu.
> Sorry. I don't understand.
>
> The point I'd like to make is, that for really low latency stuff the ISR
> needs to take place immediately when the hardware fires an interrupt.
>
> As the Linux kernel will (for the SMP CPUs it handles) need to disable
> interrupt in certain cases, it is essential that the "really low
> latency" interrupt is assigned to the AMP cpu (that the Kernel will
> never touch).
>
>> AFAIC, no latency for cpu "under affinity".
> That would be great but it need the stuff described above.
> In fact the interrupt would need to be assigned to the AMP cpu by some
> hardware means (that I don't know anything about yet), and not be
> "forwarded" in any way from some other cpu (which is managed by the
> Kernel) and thus might be in a "interrupt disable state at some point in
> time.
>

I don't know your hw so my consideration are really general. ISRs in rt 
kernel doesn't exist or at least the only work is to wake up the kernel 
thread for the management. The thing you can do is to move the kernel 
thread for interrupt X where you want to manage it, or you can set a 
specific scheduler policy. For example you can set a SCHED_FIFO with a 
very high priority for your "really low latency" tasks. RT kernel does 
the work for you :) You can see here: http://lwn.net/Articles/146861/

Marco
