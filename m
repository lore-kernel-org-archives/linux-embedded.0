From: Sascha Hauer <sha@pengutronix.de>
Subject: Re: flicker free booting
Date: Mon, 3 Aug 2009 10:19:05 +0200
Message-ID: <20090803081905.GP2714@pengutronix.de>
References: <20090602185143.GA8655@zod.rchland.ibm.com> <4A257DF0.6040607@am.sony.com> <1243975064.6342.10.camel@mulgrave.site> <20090602213452.GK32630@pengutronix.de> <20090603033535.GA24291@kroah.com> <20090731152617.GW29245@pengutronix.de> <20090731155352.GA29245@pengutronix.de> <20090731180309.GA17314@cuplxvomd02.corp.sa.net> <20090731180932.GC29245@pengutronix.de> <4A733B1B.2000009@billgatliff.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A733B1B.2000009@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Gatliff <bgat@billgatliff.com>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org, Juergen Beisert <jbe@pengutronix.de>, Wolfram Sang <wsa@pengutronix.de>

On Fri, Jul 31, 2009 at 01:42:35PM -0500, Bill Gatliff wrote:
> Robert Schwebel wrote:
>>   
>>> The question I've been looking at is: do sub-second boot times make
>>> all this a moot point? After all, if you can bring up your graphics
>>> driver in a fraction of a second and use *it* to display a splash
>>> screen, it seems like it would meet your need to give almost immediate
>>> feedback to users that the system is alive.
>>>     
>>
>> Yup, that would be cool.
>>
>> However, on flash-based systems in the ARM926 / 200...400 MHz class
>> (which is still quite common) the boot time up to the point where the
>> penguin appears is still about 3...4 s [1] which is too long. So I
>> suspect until systems become faster, we'll have no other choice than
>> such as scenario.
>>   
>
> Could your bootloader pre-initialize the graphics hardware to the same  
> mode that the Linux driver will ultimately select, and then throw up a  
> static graphic?  That would give you some output until the driver itself  
> comes online.

I implemented exactly this for the i.MX framebuffer last week. It works
by looking at the controllers physical screen start address, ioremapping
this address and copying the content to the newly allocated framebuffer.
Currently the driver still reinitilializes the controller with exactly
the same values. We could skip this initialization step depending on a
imxfb.preinitialized=1 command line parameter and read back
resolution/depth from the device in order to fill the fb_info struct.

This approach works good, I just wonder how acceptable it is for
mainline.

The downside of this approach is that we have to add
mem=${physical_mem - 1MB} to the command line.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
