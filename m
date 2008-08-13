From: David VomLehn <dvomlehn@cisco.com>
Subject: Re: [PATCH] [RFC] emit-crash-char: Allow diversion of printk output
 for crash logging
Date: Tue, 12 Aug 2008 18:30:54 -0700
Message-ID: <48A2394E.8030500@cisco.com>
References: <489BAD5C.2080009@cisco.com>	 <1218210904.19162.144.camel@localhost.localdomain>	 <48A0CC8D.3050302@cisco.com> <fa686aa40808121539pc02a645n908500844c698bca@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <fa686aa40808121539pc02a645n908500844c698bca@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=800; t=1218591058; x=1219455058;
	c=relaxed/simple; s=sjdkim3002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=dvomlehn@cisco.com;
	z=From:=20David=20VomLehn=20<dvomlehn@cisco.com>
	|Subject:=20Re=3A=20[PATCH]=20[RFC]=20emit-crash-char=3A=20
	Allow=20diversion=20of=20printk=20output=0A=20for=20crash=20
	logging
	|Sender:=20;
	bh=rrg7vx6BXPLq1yZH3CtCGdi0Uup1yXA3KlZcZWRO7/w=;
	b=USwRDG3wrsDD92X2XyhaLr4VSss1dnOIGsT+zfLLmHb/myAqf15SNIHUCl
	L5Hq1z70zaSB3MBrUIomy/rONzj60pY8qyGh6nzIrbcIjPEtcJXHo9e+qgZd
	ACt0AHXleK;
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Daniel Walker <dwalker@mvista.com>, linux-embedded@vger.kernel.org

Grant Likely wrote:

> I'm not thrilled with this patch.  It seems so much more straight
> forward in your special case, but it comes at the expense of making
> the code path more complex in every other case.
> 
> I would much rather see this be done using the existing console driver
> interface.  The only possible reason I could see wanting to do things
> this way is if you don't trust the console code to call your console
> driver, which I think is a pretty unlikely case.

I'll buy that reasoning.

Regardless of implementation, it seems to me that it could be of use for some 
other embedded platforms. Any suggestions as to where it should go in the tree? 
drivers/char? drivers/misc?

> --
> Grant Likely, B.Sc., P.Eng.
> Secret Lab Technologies Ltd.
--
David VomLehn
