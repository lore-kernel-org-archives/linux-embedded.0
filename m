From: Michael Schnell <mschnell@lumino.de>
Subject: Re: AMP on an SMP system
Date: Wed, 07 Aug 2013 10:23:00 +0200
Message-ID: <520203E4.3070204@lumino.de>
References: <51FB6EE1.3090708@lumino.de> <51FEC76C.70908@televic.com> <51FF77A2.7030904@televic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <51FF77A2.7030904@televic.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: 
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On 08/05/2013 12:00 PM, Lambrecht J=FCrgen wrote:
> "Actually, you can check on ARM community web site, where you will se=
e that the CortexA9/GIC infrastructure enables AMP implementation.
> http://forums.arm.com/index.php?/topic/15656-cortex-a9-amp/
>
Here I see:

"In the Cortex-A9 MPCore Technical Reference Manual I found the SMPnAMP=
=20
Signal which switches between SMP or AMP for each Processor."

While it  is encouraging to see that AMP _is_  a supported feature with=
=20
A9, I fail to understand what the use of making this known to the=20
hardware might be.

I supposed AMP vs SMP would be just a matter of software.

-Michael
