From: Michael Schnell <mschnell@lumino.de>
Subject: Re: AMP on an SMP system
Date: Fri, 02 Aug 2013 18:00:02 +0200
Message-ID: <51FBD782.9070309@lumino.de>
References: <51FB6EE1.3090708@lumino.de> <20130802114225.GR3880@pengutronix.de> <51FBA261.10301@lumino.de> <51FBC7FE.4000403@gmail.com> <51FBCF46.4080700@lumino.de> <51FBD223.9020809@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <51FBD223.9020809@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-embedded@vger.kernel.org

On 08/02/2013 05:37 PM, Marco Stornelli wrote:
>
> I don't know your hw so my consideration are really general. 
The hardware is not decided yet (it will be some A9 thingy). So for me 
"really general" is just fine.

> ISRs in rt kernel doesn't exist or at least the only work is to wake 
> up the kernel thread for the management. 
I see.

But how to determine the max latency for this ?

> The thing you can do is to move the kernel thread for interrupt X 
> where you want to manage it, or you can set a specific scheduler 
> policy. For example you can set a SCHED_FIFO with a very high priority 
> for your "really low latency" tasks. RT kernel does the work for you 
> :) You can see here: http://lwn.net/Articles/146861/

This seems be rather easy to do. If this is "good enough" latency wise, 
it seems  to be the way to go.

-Michael
