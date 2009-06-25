From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: Status of bzip2 and lzma kernel compression for ARM?
Date: Fri, 26 Jun 2009 02:08:07 +0900
Message-ID: <20090625170806.GA22326@linux-sh.org>
References: <4A428AFF.20307@free-electrons.com> <4A433BCD.2030506@compulab.co.il> <200906251104.02830.florian@openwrt.org> <4A4396CB.9000703@free-electrons.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A4396CB.9000703@free-electrons.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Opdenacker <michael-lists@free-electrons.com>
Cc: Florian Fainelli <florian@openwrt.org>, Mike Rapoport <mike@compulab.co.il>, Alain Knaff <alain@knaff.lu>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded mailing list <linux-embedded@vger.kernel.org>

On Thu, Jun 25, 2009 at 05:24:59PM +0200, Michael Opdenacker wrote:
> On 06/25/2009 11:04 AM, Florian Fainelli wrote:
> > Le Thursday 25 June 2009 10:56:45 Mike Rapoport, vous avez ?crit :
> >> I'm not sure what exactly do you mean by "test bzip2 and lzma compression
> >> on ARM", but if you refer to internal initramfs compression, I can tell
> >> that I've used lzma compression on PXA270 and it works fine.
> >>     
> >
> > I think Michael refers to the lzma decompressor which allows you to use a 
> > lzma-compressed kernel as a (b)zImage with its architecture specific 
> > decompressor piggy-backed in the (b)zImage.
> >
> > Such thing would also be very useful on MIPS and PowerPC as well.
> >   
> Yes, that's what I meant: using a bzip2 or lzma compressed kernel. I
> would like to know the boot time impact on an ARM board.
> 
> If I don't get any answer from Alain in the next days, I will propose a
> patch update for ARM.
> 
It's possible to use this generically now, yes. Anything building uImages
today can basically wire it up in a similar fashion to how blackfin has
and support it out of the box.
