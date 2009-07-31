From: Ohad Ben-Cohen <ohad@bencohen.org>
Subject: Re: [PATCH] sdio: add CD disable support
Date: Fri, 31 Jul 2009 14:10:24 +0300
Message-ID: <bd5b16740907310410q6860eba1m58e5cf2b771d157b@mail.gmail.com>
References: <1248954848.5396.6.camel@localhost> <4A719811.4060904@csr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752537AbZGaLKq@vger.kernel.org>
In-Reply-To: <4A719811.4060904@csr.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Vrabel <david.vrabel@csr.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Philip Langdale <philipl@overt.org>, Matt Fleming <matt@console-pimps.org>, ian@mnementh.co.uk, pierre@ossman.eu, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org, nico@cam.org, nicolas.ferre@rfo.atmel.com, hskinnemoen@atmel.com, tony@atomide.com, david-b@pacbell.net, manuel.lauss@gmail.com, mirq-l@jasper.es, Adrian Hunter <adrian.hunter@nokia.com>, Madhusudhan <madhu.cr@ti.com>

Hi David,

Thank you for your comments.

On Thu, Jul 30, 2009 at 3:54 PM, David Vrabel<david.vrabel@csr.com> wro=
te:
> Platforms may rely on the card's pull-up and not fit/configure an
> external one. =A0There may need to be a way for host controller drive=
rs to
> =A0say this and prevent the disabling of the card's DAT3 pull-up.

Currently the only way to really disable the CD using this patch is by
setting the disable_cd bit on for a specific controller. We are doing s=
o
for a specific controller to which an embedded sdio device is wired,
on certain boards. This is done using the embedded_sdio's .cccr field,
which is used instead of reading the card's cccr.
So as you correctly noted, card has no say here.

> The first sentence of this comment doesn't make sense.

=46ixed;

I'll follow-up with a correction of the patch and will appreciate your =
review.

Thanks,
Ohad.
