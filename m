From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: flicker free booting
Date: Fri, 31 Jul 2009 14:51:49 -0500
Message-ID: <4A734B55.7030205@billgatliff.com>
References: <20090602172941.GL3095@hansolo.jdub.homelinux.org> <1243964577.4229.49.camel@mulgrave.int.hansenpartnership.com> <20090602175244.GB10973@cuplxvomd02.corp.sa.net> <20090602185143.GA8655@zod.rchland.ibm.com> <4A257DF0.6040607@am.sony.com> <1243975064.6342.10.camel@mulgrave.site> <20090602213452.GK32630@pengutronix.de> <20090603033535.GA24291@kroah.com> <20090731152617.GW29245@pengutronix.de> <20090731155352.GA29245@pengutronix.de> <20090731180309.GA17314@cuplxvomd02.corp.sa.net> <4A733C07.3050002@billgatliff.com> <4A734A95.6060703@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A734A95.6060703@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Bird <tim.bird@am.sony.com>
Cc: David VomLehn <dvomlehn@cisco.com>, Robert Schwebel <r.schwebel@pengutronix.de>, linux-embedded@vger.kernel.org, Juergen Beisert <jbe@pengutronix.de>, Sascha Hauer <sha@pengutronix.de>, Wolfram Sang <wsa@pengutronix.de>

Tim Bird wrote:
> Bill Gatliff wrote:
>   
>> Those fractions-of-seconds boot times are beyond the reach of the 200
>> MHz-class ARM9 processors and similar, where it takes two or three
>> seconds just to load and uncompress the kernel from NOR or NAND flash.
>>     
> While I don't disagree from a practical standpoint - at Sony
> using XIP we have been able to finish kernel boot on a 192 MHZ ARM9
> in 186 milliseconds.  In the lab, anyway?
>   

Yea, that's an upside of XIP: no uncompression stage.  :)

I wonder, though, if the bandwidth limitations of NOR flash make the 
system slower overall?  I guess the bootloader could copy an 
uncompressed image from flash into RAM, and then XIP it from there to 
get the best of both worlds, if you could stand the time hit of the 
memcpy...


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
