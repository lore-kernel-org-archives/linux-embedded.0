From: Michael Schnell <mschnell@lumino.de>
Subject: Re: AMP on an SMP system
Date: Wed, 07 Aug 2013 10:29:33 +0200
Message-ID: <5202056D.8070901@lumino.de>
References: <51FB6EE1.3090708@lumino.de> <51FEC76C.70908@televic.com> <51FF77A2.7030904@televic.com> <520203E4.3070204@lumino.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <520203E4.3070204@lumino.de>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>

On 08/07/2013 10:23 AM, Michael Schnell wrote:
>
>
> "In the Cortex-A9 MPCore Technical Reference Manual I found the 
> SMPnAMP Signal which switches between SMP or AMP for each Processor."
>
I found this:

SMPnAMP -> "Set whether the processor is part of a coherent domain."

Which does not help, because I don't know what a "coherent domain" is 
supposed to mean.

-Michael
