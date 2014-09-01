From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: EP93XX/EDB9315A Audio Issue
Date: Mon, 1 Sep 2014 11:38:37 +0200
Message-ID: <20140901113837.0cdfe833@free-electrons.com>
References: <53FD15DC.3040301@emperorlinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <53FD15DC.3040301@emperorlinux.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Moles <jeremy@emperorlinux.com>
Cc: linux-embedded@vger.kernel.org

Dear Jeremy Moles,

On Tue, 26 Aug 2014 19:18:52 -0400, Jeremy Moles wrote:
> I have what I believe to be a stock/demo EDB9315A board here, and am in 
> the process of upgrading a client from their 2.6.21.5 kernel to 3.15 (or 
> thereabouts).
> 
> So far, everything has gone fantastic, with 95% of the SoC on its 
> peripherals working without any issues. However, I _AM_ having an issue 
> with sound. At the most basic level, attempting to use sound in any way 
> generates the following messages:
> 
>      ep93xx-dma ep93xx-dma-m2p: coherent DMA mask is unset
>      ep93xx-i2s ep93xx-i2s: ASoC: ep93xx-i2s hw params failed: -12
> 
> Again, as far as I know (and the client insists) this machine is a stock 
> EDB9315A board (part of EP93XX mach). I've spent a good deal of time 
> looking through some of the DMA, SPI, I2S, and ASoC code, but have had 
> no luck. The previous 2.6.21.5 used a single monolithic patch that 
> managed to enable this device, but in the newer kernel it does not work.
> 
> I know I'm not providing a great deal of information, but i wanted to 
> ask the lists in conjunction with my own debugging, hoping to possibly 
> solicit a vector of attack from someone experienced with the 
> architecture. :)

Instead of linux-embedded@, you probably want to ask this question to
the Linux ARM Kernel Mailing list (LAKML), plus the alsa-devel mailing
list, plus the maintainers of the EP93xx platform in the kernel.

This will make sure your question reaches the right persons.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
