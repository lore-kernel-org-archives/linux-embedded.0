From: Ohad Ben-Cohen <ohad@bencohen.org>
Subject: Re: [PATCH] sdio: add CD disable support
Date: Fri, 31 Jul 2009 14:16:12 +0300
Message-ID: <bd5b16740907310416u635df504raa4b6308d361a614@mail.gmail.com>
References: <1248954848.5396.6.camel@localhost> <20090730124543.GF3058@console-pimps.org> 
	<bd5b16740907300855y2ee0f76fv5886606fcee241b7@mail.gmail.com> 
	<20090730185044.GH3058@console-pimps.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090730185044.GH3058@console-pimps.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Fleming <matt@console-pimps.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Philip Langdale <philipl@overt.org>, ian@mnementh.co.uk, pierre@ossman.eu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, nico@cam.org, nicolas.ferre@rfo.atmel.com, hskinnemoen@atmel.com, tony@atomide.com, david-b@pacbell.net, manuel.lauss@gmail.com, mirq-l@jasper.es, Adrian Hunter <adrian.hunter@nokia.com>, Madhusudhan <madhu.cr@ti.com>

Hi Matt,

On Thu, Jul 30, 2009 at 9:50 PM, Matt Fleming<matt@console-pimps.org> wrote:
> As David has already said, both comments need fixing up. It is the host
> controller driver that decides whether to disable the DAT[3] pull-up,
> not the card. If you make those changes then you can add my Acked-by.

I'm posting a follow-up patch with the fixes and your Ack,

will appreciate your second review.

Thanks,
Ohad.
