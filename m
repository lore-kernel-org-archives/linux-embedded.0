From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH v2 2/2] init/Kconfig: Increase default log buffer size
 from 128 KB to 512 KB
Date: Thu, 29 Oct 2020 23:16:01 +0100
Message-ID: <92a13465-d133-0b39-f64b-7074dbbb3fcc@molgen.mpg.de>
References: <20200811092924.6256-1-pmenzel@molgen.mpg.de>
 <20200811092924.6256-2-pmenzel@molgen.mpg.de> <20200811105352.GG6215@alley>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200811105352.GG6215@alley>
Content-Language: en-US
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, linux-kernel@vger.kernel.org, John Ogness <john.ogness@linutronix.de>, Linus Torvalds <torvalds@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-embedded@vger.kernel.org

Dear Petr,


Am 11.08.20 um 12:53 schrieb Petr Mladek:
> On Tue 2020-08-11 11:29:24, Paul Menzel wrote:
>> Commit f17a32e97e (let LOG_BUF_SHIFT default to 17) from 2008 was the
>> last time, the the default log buffer size bump was increased.
>>
>> Machines have evolved, and on current hardware, enough memory is
>> present, and some devices have over 200 PCI devices, like a two socket
>> Skylake-E server, resulting a lot of lines.
>>
>> Therefore, increase the default from 128 KB to 512 KB. Anyone, with
>> limited memory, can still lower it.
>>
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -681,9 +681,9 @@ config IKHEADERS
>>   	  kheaders.ko is built which can be loaded on-demand to get access to headers.
>>   
>>   config LOG_BUF_SHIFT
>> -	int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
>> +	int "Kernel log buffer size (17 => 128KB, 19 => 512KB)"
>>   	range 12 25
>> -	default 17
>> +	default 19
>>   	depends on PRINTK
>>   	help
>>   	  Select the minimal kernel log buffer size as a power of 2.
> 
> Honestly, I do not have experience with changing the defaults. People
> hacking small devices might complain. Well, this can be solved
> by increasing the default only when BASE_FULL is set.
> 
> I am personally fine with increasing the default when BASE_FULL
> is set. The amount of messages is growing over time because of
> increasing complexity of both the hardware and software.
> Fortunately also the amount of available memory is growing.
> 
> Well, this should get discussed in wider audience. Adding some
> people into CC.
> 
> JFYI, it started with report of lost messages, see
> https://lore.kernel.org/lkml/264bfbae-122d-9c41-59ea-6413f91bd866@molgen.mpg.de/

As there was no objection, is it possible to apply the two patches, and 
maybe even get them into Linux 5.10?


Kind regards,

Paul
