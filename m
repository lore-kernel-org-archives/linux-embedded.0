From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: flicker free booting
Date: Fri, 31 Jul 2009 13:42:35 -0500
Message-ID: <4A733B1B.2000009@billgatliff.com>
References: <1243964577.4229.49.camel@mulgrave.int.hansenpartnership.com> <20090602175244.GB10973@cuplxvomd02.corp.sa.net> <20090602185143.GA8655@zod.rchland.ibm.com> <4A257DF0.6040607@am.sony.com> <1243975064.6342.10.camel@mulgrave.site> <20090602213452.GK32630@pengutronix.de> <20090603033535.GA24291@kroah.com> <20090731152617.GW29245@pengutronix.de> <20090731155352.GA29245@pengutronix.de> <20090731180309.GA17314@cuplxvomd02.corp.sa.net> <20090731180932.GC29245@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090731180932.GC29245@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org, Juergen Beisert <jbe@pengutronix.de>, Sascha Hauer <sha@pengutronix.de>, Wolfram Sang <wsa@pengutronix.de>

Robert Schwebel wrote:
>   
>> The question I've been looking at is: do sub-second boot times make
>> all this a moot point? After all, if you can bring up your graphics
>> driver in a fraction of a second and use *it* to display a splash
>> screen, it seems like it would meet your need to give almost immediate
>> feedback to users that the system is alive.
>>     
>
> Yup, that would be cool.
>
> However, on flash-based systems in the ARM926 / 200...400 MHz class
> (which is still quite common) the boot time up to the point where the
> penguin appears is still about 3...4 s [1] which is too long. So I
> suspect until systems become faster, we'll have no other choice than
> such as scenario.
>   

Could your bootloader pre-initialize the graphics hardware to the same 
mode that the Linux driver will ultimately select, and then throw up a 
static graphic?  That would give you some output until the driver itself 
comes online.

And if the driver was in a demand-loaded module, then the static image 
wouldn't disappear until just before the application that does the 
animation was ready to start drawing.



b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
