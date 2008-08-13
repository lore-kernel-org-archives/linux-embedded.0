From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: [PATCH] [RFC] emit-crash-char: Allow diversion of printk	output
 for crash logging
Date: Wed, 13 Aug 2008 10:56:56 -0700
Message-ID: <48A32068.3010000@cisco.com>
References: <489BAD5C.2080009@cisco.com> <1218210904.19162.144.camel@localhost.localdomain> <48A0CC8D.3050302@cisco.com> <fa686aa40808121539pc02a645n908500844c698bca@mail.gmail.com> <48A2394E.8030500@cisco.com> <20080813021212.GA17587@secretlab.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080813021212.GA17587@secretlab.ca>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1924; t=1218650224; x=1219514224;
	c=relaxed/simple; s=sjdkim3002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20[PATCH]=20[RFC]=20emit-crash-char=3A=20
	Allow=20diversion=20of=20printk=09output=0A=20for=20crash=20
	logging
	|Sender:=20;
	bh=JFvLQDNx6fo2sCMZDDOfDvE8LDmanek1JuNJnxHLbeU=;
	b=qzOklrU3gNnK2aoA9KVGBwPuDAXE8qVt43FILEMWyjkp1OqO1U9UZ7plR0
	WwpgsOxXyCx69MWAnOjALFpANyn82tPHKL0AZZBVSc0GSYARDB4k8DGv48ca
	DtYSdz8tZR;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Daniel Walker <dwalker@mvista.com>, linux-embedded@vger.kernel.org

Grant Likely wrote:
> On Tue, Aug 12, 2008 at 06:30:54PM -0700, David VomLehn wrote:
>>
>> Regardless of implementation, it seems to me that it could be of use for 
>> some other embedded platforms. Any suggestions as to where it should go 
>> in the tree? drivers/char? drivers/misc?
> 
> Depends on what you're storing to.  Can you send more details about the
> specific use case that you will use this interface for?

The system I'm working on is a settop box. It is in an environment where it is 
connected to a central server. The settop box doesn't have enough space to hold 
core dumps and the upstream connection to the server has too little bandwidth to 
upload them if we did store them. We have found that we can usually diagnose and 
fix problems with much less information than a core dump however, so we want to 
be able to capture that information and send it upstream.

Our use case is:
1. We register a panic handler
2. The kernel panics and calls our panic handler
3. We register a function to log printk output
4. We print registers, stack, memory, and various other pieces of
    information using standard kernel functions, which all use printk
5. As printk output is generated, we store it in memory
6. We unregister the printk logging function
7. The panic handler exits
8. The kernel does the rest of its usual panic handling

I'm not proposing storing the data in a specific place; that will be up to the 
platform. We will be storing in a piece of memory set aside for this purpose, but 
storing it in NOR flash makes a lot of sense, too, or using NAND flash or 
possibly even disk. All I'm proposing is a small framework that will allow 
plugging in a logging function when needed and removing it when done. I'll do the 
common piece that looks like a fake console and we, and other people, can use the 
simpler interface it provides.

> g.
--
David VomLehn

