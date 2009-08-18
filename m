From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: New fast(?)-boot results on ARM
Date: Tue, 18 Aug 2009 12:53:28 +0200
Message-ID: <20090818105328.GP29655@pengutronix.de>
References: <20090814170228.GM13320@pengutronix.de> <1158166a0908141304y70300ab3p899b0d4609efded9@mail.gmail.com> <20090814204305.GA31727@pengutronix.de> <20090815103532.GA5596@sig21.net> <4A8A7D38.5020201@gmail.com> <20090818102136.GN29655@pengutronix.de> <81b0412b0908180334u51fd957dh36f2a4946dffbb0b@mail.gmail.com> <20090818104410.GO29655@pengutronix.de> <81b0412b0908180348n75af1113wb380919eaeaaf29b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758681AbZHRKyY@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <81b0412b0908180348n75af1113wb380919eaeaaf29b@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Riesen <raa.lkml@gmail.com>
Cc: Marco Stornelli <marco.stornelli@gmail.com>, Johannes Stezenbach <js@sig21.net>, Denys Vlasenko <vda.linux@googlemail.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, Tim Bird <tim.bird@am.sony.com>, kernel@pengutronix.de

On Tue, Aug 18, 2009 at 12:48:50PM +0200, Alex Riesen wrote:
> But many of the problems you described and suggested solutions
> point at userspace, right? (like pre-defined static /dev, mdev script,
> or using of specially designed rootfs)

Yes, right. But even there, mdev is more in the "embedded special"
league than udev, for example, and highly specialized read-only root
filesystems as well.

rsc 
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
