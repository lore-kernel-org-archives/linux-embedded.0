From: Mike Rapoport <mike@compulab.co.il>
Subject: Re: Status of bzip2 and lzma kernel compression for ARM?
Date: Mon, 29 Jun 2009 15:21:45 +0300
Message-ID: <4A48B1D9.90306@compulab.co.il>
References: <4A428AFF.20307@free-electrons.com> <4A433BCD.2030506@compulab.co.il> <200906251104.02830.florian@openwrt.org> <4A4396CB.9000703@free-electrons.com> <4A4776DD.50105@knaff.lu> <4A478286.8020908@knaff.lu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A478286.8020908@knaff.lu>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alain Knaff <alain@knaff.lu>
Cc: Michael Opdenacker <michael-lists@free-electrons.com>, Florian Fainelli <florian@openwrt.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded mailing list <linux-embedded@vger.kernel.org>



Alain Knaff wrote:
> Alain Knaff wrote:
>> Attached is a version of the ARM patch for 2.6.30
>>
>> There seems to be some issues with the include files (which did not pose
>> any problems in 2.6.28...), but hopefully somebody more experienced with
>> the ARM architecture (and with its recent development) than I can help
>> out there.
>>
>> Regards,
>>
>> Alain
> 
> Actually, the needed changes turned out to be easier than I initially
> feared. Attached a version that compiles all right.

I gave it a quick test and it hangs before "Decompressing kernel" is output.
I hope I'll have time this week to debug what's wrong there.

> Regards,
> 
> Alain
> 

-- 
Sincerely yours,
Mike.
