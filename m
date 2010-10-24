From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: Embedded Linux Boot Time Poll
Date: Sun, 24 Oct 2010 12:17:50 +0200
Message-ID: <20101024101750.GF32583@pengutronix.de>
References: <AANLkTi=YBzPDG6nOmQfegGOT+8nXm_6EKJE_L2uswxeu@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=YBzPDG6nOmQfegGOT+8nXm_6EKJE_L2uswxeu@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Murray <amurray@mpcdata.com>
Cc: linux-embedded@vger.kernel.org

Hello Andrew,

On Fri, Oct 22, 2010 at 12:20:50AM +0100, Andrew Murray wrote:
> I'm performing some research [for a CELF presentation] into reducing
> boot time on embedded systems and would like to see if the embedded
> community agree with the following statement as to why Linux
> [arguably] takes so long in the first place for an unoptimised system:
>
> "Linux is general purpose, convenient and flexible. As it's general
> purpose it's likely to contain un-required functionality which results
> in more initialisation and a larger image size. As it's convenient and
> flexible it will spent time discovering devices and verifying their
> existence."
>
> Do you largely agree or disagree?  Also do you believe that boot time
> isn't the highest priority when it comes to improving the kernel?

I second what the others have already written. With a resonably tuned
system it is possible to gain boot times of < 0.5 s into the Linux
userspace on a 532 MHz MX35 (ARM1136).

What highly matters if the use case, which in turn influences what can
be done to decrease the boot time.

- If a distribution is tuned to "run everywhere", it has to do a lot of
  probing, which needs time (i.e. a general purpose distribution on an
  ARM or PowerPC). In turn, you can easily install almost everything on
  such a system

- If a system can be optimized for a special scenario (i.e. a machine
  operator terminal), you can configure away almost all unrequired
  functionality. In turn, it may be difficult to install random software
  parts on such a system.

It's more a matter of paradigms.

I assume we'll have nice boot time discussons at ELC-E, I also have a
talk there concering this topic :-)

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
