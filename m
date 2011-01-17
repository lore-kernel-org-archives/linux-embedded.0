From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: Boot time: Kernel start parallelization issue?
Date: Sun, 16 Jan 2011 16:13:49 -0800
Message-ID: <4D3389BD.3080602@linux.intel.com>
References: <4D315D86.40401@googlemail.com> <4D31C034.8040105@linux.intel.com> <4D31C8C5.6010306@googlemail.com> <4D329F62.1010505@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4D329F62.1010505@googlemail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dirk Behme <dirk.behme@googlemail.com>
Cc: linux-embedded@vger.kernel.org, Greg KH <gregkh@suse.de>, Martin Mueller <martin@pfump.org>

On 1/15/2011 11:33 PM, Dirk Behme wrote:
>
> Do you talk about
>
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=22a9d645677feefd402befd02edd59b122289ef1 
>
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=4ace92fc112c6069b4fcb95a31d3142d4a43ff2a 
>
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=793180570ff2530d133343ceea85648de5f01b02 
>
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=f29d3b23238e1955a8094e038c72546e99308e61 
>
>
> http://lwn.net/Articles/314808/
>
> merged with 2.6.29?
>
> With a recent .37 kernel the usage of async_schedule() seems to be 
> implemented for

yep
>
> ./drivers/acpi/battery.c
> ./drivers/s390/block/dasd.c
> ./drivers/base/power/main.c
> ./drivers/ata/libata-core.c
> ./drivers/scsi/sd.c
> ./drivers/md/raid5.c
>
> With this, on an embedded system using none of this, the completely 
> single-threaded start up reported in [2] seems to be reasonable, then?

quite likely.

>
> This would mean that to improve the issues reported in [2], 
> async_schedule() has to be implemented for the sub systems used, 
> there, too? I.e. the USB init?

USB init is asynchronous internal to USB; this was one of the outcomes 
of a side discussion at the Kernel Summit a year and a half ago or so 
where Alan Stern visualized the problem... and solved it internal to USB.

Now, there is one 100 msec delay that is inherent to USB (mandatory 
delay required by the spec for voltage to stabilize) but that shouldn't 
be in the synchronous path anymore

>
>>> what kernel are you seeing issues on?
>>
>> [1] talks about 2.6.28, [2] talks about 2.6.34.

yeah 2.6.28 is a lost cause ;-)  2.6.34 should be not too bad.

Now, the one thing that's critical for all of this is that we need to do 
this data driven. Using async init is not always as easy as it sounds; 
there are device ordering things that need to be dealt with, and failure 
cases get much more complex as well.

So the first order of business ALWAYS is to get a bootgraph (from 
scripts/bootgraph.pl)... to see which things are big on the one hand, 
but also to see if there is gains to be had. There is absolutely no gain 
possible (in terms of making something async) if it is pretty much the 
last big thing in the boot that you are making asynchronous (since the 
end of kernel boot has to wait for it all anyway); there is only gains 
for async if the expensive operation, when made async, can run in 
parallel with something else expensive that comes later in the kernel init.

The bootgraph will show this opportunity / pitfall very clearly......
