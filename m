From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: New fast(?)-boot results on ARM
Date: Thu, 20 Aug 2009 10:57:24 +0200
Message-ID: <20090820085724.GG23444@pengutronix.de>
References: <20090814170228.GM13320@pengutronix.de> <20090818140605.GB9943@pengutronix.de> <4A8AC95E.2040907@googlemail.com> <20090819072100.GA23444@pengutronix.de> <4A8C263D.9000009@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A8C263D.9000009@googlemail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Behme <dirk.behme@googlemail.com>
Cc: Robert Schwebel <r.schwebel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

On Wed, Aug 19, 2009 at 06:20:13PM +0200, Dirk Behme wrote:
>>
>> Yes, correct. The copying itself is between 'copy' and 'done' so it
>> takes about 0.4s.
>>
>>> What's the size of the uncompressed kernel copied here?
>>
>> The image is about 2.8MB, but I copied the whole partition of 3MB
>> because with raw images you can't detect the image size.
>
> With 3MB copied in ~0.4s you get ~8MB/s. This really depends on your HW, 
> but I would think with standard NOR flashes you should be able to do at 
> least two (three?) times better. Have you already checked the memory (NOR 
> flash) timings configured in your SoC?

It's NAND flash, so there's not much timing to optimize. What's
interesting about this is that the kernel NAND driver is much slower
than the one in U-Boot. Looking at it it turned out that the kernel
driver uses interrupts to wait for the controller to get ready.
Switching this to polling nearly doubles the NAND performance. UBI
mounts much faster now and this cuts off another few seconds from the
boot process :)

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
