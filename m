From: Stefan Schoenleitner <dev.c0debabe@gmail.com>
Subject: Re: optimal hardware design for an ARM9 based single board	computer
 to work with existing linux drivers
Date: Sat, 05 Jul 2008 13:05:33 +0200
Message-ID: <486F557D.3090209@gmail.com>
References: <486F38CF.40803@gmail.com> <20080705103509.GN4319@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080705103509.GN4319@pengutronix.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: linux-embedded@vger.kernel.org


Robert Schwebel wrote:
> As far as I know, Cirrus has discontinued the EP93 processors. I
> wouldn't base a new design on it any more.
> 
> rsc

Where did you get your information from ?
As far as I know cirrus discontinued direct software support for the ARM line in
favour of third party software.
(It seems that they even had their own linux distribution which is now
discontinued.)

The chips are still produced and even new product lines seem to be released.

To quote one of the cirrus guys:
----------------------------------------------------------------------------------------
"It is not being discontinued. We just will not be supporting the OS's like
Wince and Linux anymore. The linux part is supported mostly by this forum and
OE, and the cirrus-linux mailing list.

We will not be moving the kernel port forward from the Cirrus side, however,
Lennert has a kernel port in the mainstream. someone could take up our patch and
add the final set of periferals.

So yes, you can still buy EP93XX and EP73XX chips. Dont worry, they aint going
anywhere anytime soon."
----------------------------------------------------------------------------------------
[http://arm.cirrus.com/forum/viewtopic.php?t=3442]


Currently I bought a EP9302 evaluation board from olimex
(http://www.olimex.com/dev/cs-e930x.html).

Since I havn't started designing the prototype yet, moving to another CPU won't
be much of a problem.

stefan
