From: Zan Lynx <zlynx@acm.org>
Subject: Re: New fast(?)-boot results on ARM
Date: Fri, 14 Aug 2009 12:19:48 -0600
Message-ID: <4A85AAC4.7050505@acm.org>
References: <20090814170228.GM13320@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755579AbZHNST5@vger.kernel.org>
In-Reply-To: <20090814170228.GM13320@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

Robert Schwebel wrote:

> - 2.4 s up from u-boot to the end of "Uncompressing Linux"
> - 300 ms until ubifs initialization starts
> - 3.7 s for ubifs, until "mounted root"
> 
> So we basically have 7 s for the kernel. The rest is userspace, which hasn't
> seen much optimization yet, other than trying to start the GUI application as
> early as possible, while doing all other init stuff in parallel. Adding "quiet"
> brings us another 300 ms.
> 
> That's factor 70 away from the 110 ms boot time Tim has talked about some days
> ago (and he measured on an ARM cpu which had almost half the speed of this
> one), and I'm wondering what we can do to improve the boot time.

2.4s in uncompression? That seems like an obvious target for improvement.

Your kernel seems awfully large. 3104K code? You should definitely find 
out what is making it that big and cut out everything you do not need. 
You might even try some of the embedded system scripts that rip out all 
the printk strings.

If you get the kernel size way down then use a uncompressed kernel and 
it should boot a lot faster if the bottleneck is CPU speed.

However, it is probably IO speed. There could be something really wrong 
and slow with your MTD. Does it DMA or is it doing something crazy like 
using the CPU to read a byte at a time?

Or maybe its cheap and slow flash. In that case I think your only hope 
is to make all the code as small as possible and/or find a different 
flash filesystem that does not have to read so much of the device to 
mount. Perhaps use a read-only compressed filesystem for the system 
binaries and reflash it for software upgrades. Only init and mount the 
writable flash for user-storable data well after system boot has finished.
-- 
Zan Lynx
zlynx@acm.org

"Knowledge is Power.  Power Corrupts.  Study Hard.  Be Evil."
