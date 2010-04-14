From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: [PATCH] Pseudo-console for capture and redirection of console
 	output
Date: Wed, 14 Apr 2010 16:30:25 -0400
Message-ID: <4BC625E1.8030206@cisco.com>
References: <20100412063545.GA28646@dvomlehn-lnx2.corp.sa.net> <p2g8bd0f97a1004112340u547f244bpe0e4f1c9880f0c35@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <p2g8bd0f97a1004112340u547f244bpe0e4f1c9880f0c35@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: dvomlehn@dvomlehn-lnx2.corp.sa.net, linux-embedded@vger.kernel.org, akpm@linux-foundation.org, dwm2@infradead.org, mpm@selenic.com, paul.gortmaker@windriver.com

Mike Frysinger wrote:
> On Mon, Apr 12, 2010 at 02:35, David VomLehn wrote:
>   
>> Provide functions for capturing console output for storage. The primary user
>> is likely to be embedded systems that don't have the storage for core dumps
>> but do have a need to log kernel panic information for later evaluation. It
>> offers two main areas of functionality:
>>
>> o       It can maintain a circular log of console output so that kernel log
>>        messages written before panic() was called can be retrieved to be
>>        added to the failure log.
>> o       A function can be registered to store output from printk() in a
>>        persistent location, such as a reserved location in RAM.  Then,
>>        printk() can be used either directly, to print state information, or
>>        indirectly, through standard functions like dump_stack() and
>>        show_regs().
>>     
>
> how is this any different from the already existing mtdoops driver ?
> -mike
>   
It's a smaller connection piece. It could be used in mtdoops or any 
other printk-capture
cheme. That being said, I'd rather consider this as an RFC. I've had a 
number of interesting
and useful conversations that suggest other ways to procede.
