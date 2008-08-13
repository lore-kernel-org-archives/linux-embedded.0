From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: [PATCH] [RFC] emit-crash-char: Allow diversion of printk	output
 for crash logging
Date: Wed, 13 Aug 2008 13:27:10 -0700
Message-ID: <48A3439E.2060702@cisco.com>
References: <489BAD5C.2080009@cisco.com> <1218210904.19162.144.camel@localhost.localdomain> <48A0CC8D.3050302@cisco.com> <fa686aa40808121539pc02a645n908500844c698bca@mail.gmail.com> <48A2394E.8030500@cisco.com> <20080813021212.GA17587@secretlab.ca> <48A32068.3010000@cisco.com> <48A32FC4.7060006@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48A32FC4.7060006@am.sony.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1551; t=1218659237; x=1219523237;
	c=relaxed/simple; s=sjdkim3002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20[PATCH]=20[RFC]=20emit-crash-char=3A=20
	Allow=20diversion=20of=20printk=09output=0A=20for=20crash=20
	logging
	|Sender:=20;
	bh=poAjCo6MqAVxo0djTyFx8GEhE/PhdmMJXSbOGnLTHDQ=;
	b=YXvTWIbwwSJJ/whUvHTA53MEJ87YV1efkD4K0vyYLQv1GLSrPAvcNJRvJg
	PBddLN8vuKy23uTwFAt47vDeiIcYDinxqc9w5iytxvovRSiCDic3eZgupNJz
	plySb21zvI;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Daniel Walker <dwalker@mvista.com>, linux-embedded@vger.kernel.org

Tim Bird wrote:
> David VomLehn wrote:
>> Our use case is:
>> 1. We register a panic handler
>> 2. The kernel panics and calls our panic handler
>> 3. We register a function to log printk output
>> 4. We print registers, stack, memory, and various other pieces of
>>    information using standard kernel functions, which all use printk
>> 5. As printk output is generated, we store it in memory
>> 6. We unregister the printk logging function
>> 7. The panic handler exits
>> 8. The kernel does the rest of its usual panic handling
...
> 
> I'm not sure exactly what triggers the transition from step 5 to 6 in
> your steps above.  That is, how do you know when to unregister the
> printk logging function?

The printk logging function is unregistered when we are done printing everything 
we're interested in.

> But, taking a step back, instead of storing the information somewhere
> else, why not just use the log buffer as the storage medium, and transfer
> that all-at-once when you've collected the information you want?  

An interesting suggestion, but we've seen cases where the logging itself causes 
subsequent faults. In such cases, you would get nothing at all if you waited to 
store information until you've collected everything. A partial report, 
particularly if you've tried to print the most useful things first, is better 
than none at all. In addition, there is the risk that, for a particularly long 
report, you might wrap the log buffer and lose the first part of your output.
--
David VomLehn
