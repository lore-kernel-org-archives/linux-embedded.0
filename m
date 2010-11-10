From: Bill Gatliff <bgat@billgatliff.com>
Subject: Re: Avoiding platform-specific callbacks in drivers?
Date: Tue, 9 Nov 2010 22:11:05 -0600
Message-ID: <AANLkTi=3PwhEn4cuCGyVHDtH-zt_n17Bibg32WZrRA7c@mail.gmail.com>
References: <AANLkTinG4y_Uxes0CJYMH+uwr1TcWwjQy+4+_ftyrnML@mail.gmail.com>
	<alpine.LFD.2.00.1011091905540.13911@xanadu.home>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.1011091905540.13911@xanadu.home>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Pitre <nico@fluxnic.net>
Cc: linux-embedded@vger.kernel.org

Nicolas:

On Tue, Nov 9, 2010 at 6:10 PM, Nicolas Pitre <nico@fluxnic.net> wrote:
>
> The pseudo-device could register the
> real device and set itself as the parent.

That little tidbit there is the part I seem to have been missing
before now--- actually doing the physical device registration during
the probing of the pseudo-device.  With that, the approach actually
makes sense.

Before now, I was thinking that I would still register both devices
externally, which made things clumsy to think about.


Thanks!


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
