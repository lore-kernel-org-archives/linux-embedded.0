From: Mike Rapoport <mike@compulab.co.il>
Subject: Re: Status of bzip2 and lzma kernel compression for ARM?
Date: Thu, 25 Jun 2009 11:56:45 +0300
Message-ID: <4A433BCD.2030506@compulab.co.il>
References: <4A428AFF.20307@free-electrons.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4A428AFF.20307@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Opdenacker <michael-lists@free-electrons.com>
Cc: Alain Knaff <alain@knaff.lu>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded mailing list <linux-embedded@vger.kernel.org>

Hi Michael,

Michael Opdenacker wrote:
> Hi Alain,
> 
> I would like to test bzip2 and lzma compression on ARM.
> 
> Would you mind telling me what the status of your patches on ARM is, now
> that the x86  and architecture independent code has been merged? Have
> you or has anyone already updated them for 2.6.30, or shall I update
> them by myself?

I'm not sure what exactly do you mean by "test bzip2 and lzma compression on
ARM", but if you refer to internal initramfs compression, I can tell that I've
used lzma compression on PXA270 and it works fine.

> Thank you in advance,
> 
> Cheers,
> 
> Michael.
> 

-- 
Sincerely yours,
Mike.
