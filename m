From: Gilad Ben-Yossef <gilad@codefidence.com>
Subject: Re: Recommendation for activating a deferred module init in the kernel
Date: Tue, 01 Jul 2008 17:20:00 +0300
Message-ID: <486A3D10.50407@codefidence.com>
References: <48580116.9070504@am.sony.com> <4858A659.8030502@codefidence.com> <485932F0.5050108@am.sony.com> <4859ECF3.3000500@codefidence.com> <485A9E61.6060707@am.sony.com> <485DFA81.6010600@codefidence.com> <485FDFF1.7010408@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <485FDFF1.7010408@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

Tim Bird wrote:

> Gilad Ben-Yossef wrote:
>   
>> Tim Bird wrote:
>>     
>>> I agree.  When you say "have the application call modprobe directly",
>>> I'm not sure I understand what you mean.
>>>       
>> I simply meant that you can fork and exec modprobe itself (or use
>> system() but that
>> would require a working shell). This would "save" the need for a
>> separate script and a shell.
>>     
>
> Well, this would explain why I didn't follow your original
> point.  I thought you were using the word "modprobe" as a placeholder
> for some other module-installation-related concept.  

Well, modprobe could just as well be insmod, but the basic idea is still 
the same.
>   
>> The only downside I see of calling the sys_init_module syscall directly
>> is that it
>> doesn't do any of the dependency tracking that modprobe does, so it's more
>> a insmod replacement then a modprobe one, but I doubt this matters at
>> all in an
>> embedded system anyway.
>>     
> It may just be my own blind spot, but I can't think of a good
> reason to do such dependency tracking in an embedded device.
> It is a sad state of affairs if the product developers don't
> know the module dependencies for their own products.
>   
For custom built modules written in house , I agree - but think of one 
of those devices that has an OTG USB port, the kind that you can one day 
connect it to a computer to play the part of a USB storage gadget and 
the next day hook a  it to up to a serial USB connected GSM modem.

It's crazy to have all that functionality loaded into the device RAM at 
all times and the using modprobe to track the dependencies of the module 
makes just as much sense as it does for your laptop.

I guess the term "embedded" gets kind of blurry with these things, but I 
also think Linux adoption in the embedded world is driven by this trend.


Cheers,
Gilad

-- 
Gilad Ben-Yossef 
Chief Coffee Drinker

Codefidence Ltd.
The code is free, your time isn't.(TM)

Web:    http://codefidence.com
Email:  gilad@codefidence.com
Office: +972-8-9316883 ext. 201
Fax:    +972-8-9316885
Mobile: +972-52-8260388

	Q: How many NSA agents does it take to replace a lightbulb?
	A: dSva7DrYiY24yeTItKyyogFXD5gRuoRqPNQ9v6WCLLywZPINlu!

