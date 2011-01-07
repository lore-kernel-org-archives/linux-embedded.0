From: Rob Landley <rlandley@parallels.com>
Subject: Re: [PATCH] Move an assert under DEBUG_KERNEL.
Date: Fri, 7 Jan 2011 03:44:56 -0600
Message-ID: <4D26E098.7050803@parallels.com>
References: <4D2579B2.7060704@parallels.com> <20110106154120.b69118c9.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110106154120.b69118c9.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: trivial@kernel.org, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

On 01/06/2011 05:41 PM, Andrew Morton wrote:
>> +#ifdef CONFIG_DEBUG_KERNEL
>>    #define ASSERT_RTNL() do { \
>>    	if (unlikely(!rtnl_is_locked())) { \
>>    		printk(KERN_ERR "RTNL: assertion failed at %s (%d)\n", \
>> @@ -789,6 +790,9 @@ extern void __rtnl_unlock(void);
>>    		dump_stack(); \
>>    	} \
>>    } while(0)
>> +#else
>> +#define ASSERT_RTNL()
>> +#endif
>>
>>    static inline u32 rtm_get_table(struct rtattr **rta, u8 table)
>>    {
>
> Probably a worthwhile thing to do, IMO.  If there's some net-specific
> CONFIG_DEBUG_ setting then that wold be a better thing to use.

I looked and didn't find one.  lib/Kconfig.debug has DEBUG_OBJECTS and 
PROVE_LOCKING and such but nothing quite on topic.  The only "DEBUG" in 
net/Kconfig is NETFLITER_DEBUG.  Nothing relevant in 
drivers/net/Kconfig, there isn't a Kconfig in net/core...

I thought about adding a new symbol, but CONFIG_DEBUG_KERNEL is already 
used in a few existing places:

   arch/powerpc/kernel/sysfs.c
   arch/parisc/mm/init.c
   arch/blackfin/include/asm/entry.h

So this isn't the first instance of it, but that doesn't mean those uses 
are correct. :)

> However the patch was a) wordwrapped, b) space-stuffed and c) not cc'ed
> to the networking list.  So its prospects are dim.

Sorry, finally gave up on kmail and set up thunderbird.  Still trying to 
beat the darn thing into submission.  (It looked right before I hit 
send.  And I cursored over the tabs to make sure. :)

I'll work out my email issues and then cc: the networking list on the 
resubmit.

Thanks,

Rob
