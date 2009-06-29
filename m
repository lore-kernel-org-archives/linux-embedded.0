From: Michael Opdenacker <michael-lists@free-electrons.com>
Subject: Re: Status of bzip2 and lzma kernel compression for ARM?
Date: Mon, 29 Jun 2009 18:39:57 +0200
Message-ID: <4A48EE5D.10600@free-electrons.com>
References: <4A428AFF.20307@free-electrons.com> <4A433BCD.2030506@compulab.co.il> <200906251104.02830.florian@openwrt.org> <4A4396CB.9000703@free-electrons.com> <4A4776DD.50105@knaff.lu> <4A478286.8020908@knaff.lu> <4A48B1D9.90306@compulab.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755091AbZF2QkV@vger.kernel.org>
In-Reply-To: <4A48B1D9.90306@compulab.co.il>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Rapoport <mike@compulab.co.il>
Cc: Alain Knaff <alain@knaff.lu>, Florian Fainelli <florian@openwrt.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded mailing list <linux-embedded@vger.kernel.org>

On 06/29/2009 02:21 PM, Mike Rapoport wrote:
> Alain Knaff wrote:
>   
>> Alain Knaff wrote:
>>     
>>> Attached is a version of the ARM patch for 2.6.30
>>>
>>> There seems to be some issues with the include files (which did not pose
>>> any problems in 2.6.28...), but hopefully somebody more experienced with
>>> the ARM architecture (and with its recent development) than I can help
>>> out there.
>>>
>>> Regards,
>>>
>>> Alain
>>>       
>> Actually, the needed changes turned out to be easier than I initially
>> feared. Attached a version that compiles all right.
>>     
>
> I gave it a quick test and it hangs before "Decompressing kernel" is output.
> I hope I'll have time this week to debug what's wrong there.
>   
Same here. I compiled 3 kernels with each option with no problem, but
none goes beyond the "Uncompressing Linux.." message. I am using a CALAO
USB-A9263 board with the AT91SAM9263 chip.

This means that even zlib compression is broken with this patch.

I hope I can work on this too.

Thanks anyway!

Cheers,

Michael.

-- 
Michael Opdenacker, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
