From: Michael Opdenacker <michael-lists@free-electrons.com>
Subject: Re: Status of bzip2 and lzma kernel compression for ARM?
Date: Thu, 25 Jun 2009 17:24:59 +0200
Message-ID: <4A4396CB.9000703@free-electrons.com>
References: <4A428AFF.20307@free-electrons.com> <4A433BCD.2030506@compulab.co.il> <200906251104.02830.florian@openwrt.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200906251104.02830.florian@openwrt.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Florian Fainelli <florian@openwrt.org>
Cc: Mike Rapoport <mike@compulab.co.il>, Alain Knaff <alain@knaff.lu>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.arm.linux.org.uk, linux-embedded mailing list <linux-embedded@vger.kernel.org>

On 06/25/2009 11:04 AM, Florian Fainelli wrote:
> Le Thursday 25 June 2009 10:56:45 Mike Rapoport, vous avez =E9crit :
>> I'm not sure what exactly do you mean by "test bzip2 and lzma compre=
ssion
>> on ARM", but if you refer to internal initramfs compression, I can t=
ell
>> that I've used lzma compression on PXA270 and it works fine.
>>    =20
>
> I think Michael refers to the lzma decompressor which allows you to u=
se a=20
> lzma-compressed kernel as a (b)zImage with its architecture specific=20
> decompressor piggy-backed in the (b)zImage.
>
> Such thing would also be very useful on MIPS and PowerPC as well.
>  =20
Yes, that's what I meant: using a bzip2 or lzma compressed kernel. I
would like to know the boot time impact on an ARM board.

If I don't get any answer from Alain in the next days, I will propose a
patch update for ARM.

Cheers,

Michael.

--=20
Michael Opdenacker, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
