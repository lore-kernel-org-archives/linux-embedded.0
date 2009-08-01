From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: flicker free booting
Date: Fri, 31 Jul 2009 18:26:54 -0700
Message-ID: <4A7399DE.3000904@am.sony.com>
References: <20090602185143.GA8655@zod.rchland.ibm.com> <4A257DF0.6040607@am.sony.com> <1243975064.6342.10.camel@mulgrave.site> <20090602213452.GK32630@pengutronix.de> <20090603033535.GA24291@kroah.com> <20090731152617.GW29245@pengutronix.de> <20090731155352.GA29245@pengutronix.de> <20090731180309.GA17314@cuplxvomd02.corp.sa.net> <4A733C07.3050002@billgatliff.com> <4A734A95.6060703@am.sony.com> <20090731200555.GF29245@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090731200555.GF29245@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Bill Gatliff <bgat@billgatliff.com>, David VomLehn <dvomlehn@cisco.com>, linux-embedded@vger.kernel.org, Juergen Beisert <jbe@pengutronix.de>, Sascha Hauer <sha@pengutronix.de>, Wolfram Sang <wsa@pengutronix.de>

Robert Schwebel wrote:
> On Fri, Jul 31, 2009 at 12:48:37PM -0700, Tim Bird wrote:
>>> Those fractions-of-seconds boot times are beyond the reach of the
>>> 200 MHz-class ARM9 processors and similar, where it takes two or
>>> three seconds just to load and uncompress the kernel from NOR or
>>> NAND flash.
>> While I don't disagree from a practical standpoint - at Sony using XIP
>> we have been able to finish kernel boot on a 192 MHZ ARM9 in 186
>> milliseconds. In the lab, anyway?
> 
> Wow, that's pretty fast; if that would be possible for standard
> scenarios, it would indeed be better to do everything on the kernel
> side.
> 
> Can you elaborate about the details of that experiment? Was that normal
> XIP from NOR? What size has this kernel been?

This was done quite some time ago, and it looks like my memory was
not too good.  According to slides I did at the time, it was
actually 110 milliseconds.  I'm sure this was a 2.4 kernel (likely
2.4.20).  I couldn't find the size of the kernel used in the test, but
I think it was about 800k, uncompressed.  (I'm not positive, though.)
It was normal XIP from NOR flash.

See slides 21 and 22 in the following:
http://elinux.org/images/7/78/ReducingStartupTime_v0.8.pdf

Here is some salient data:

                  With Compression   W/ O Compression      XIP
Copy              56 msec          120 msec             0 msec
Decompression    545 msec            0 msec             0 msec
Kernel execution  88 msec           88 msec           110 msec
Total:           689 msec          208 msec           110 msec

Note that copy time went up when going from a compressed to an
uncompressed kernel.  Decompression time went down (to 0, no
surpise).  When XIP was used, both copy time and decompression
time were eliminated, but kernel execution time for the boot
went from 88 msec to 110 msec.  So XIP did incur a pretty
hefty runtime penalty.

Aaahhh, 2.4.  The kernel was simpler in those days... :-)

 -- Tim


=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================
