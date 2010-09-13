From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: ARM target not boot after remap memory
Date: Mon, 13 Sep 2010 13:53:10 +0100
Message-ID: <20100913125310.GI30787@n2100.arm.linux.org.uk>
References: <AANLkTi=tWwaFHB0DY=j0UaqbYdYJpGJpmWdGC4aMufSw@mail.gmail.com> <4C8E1417.4060204@compulab.co.il> <20100913124049.GG30787@n2100.arm.linux.org.uk> <AANLkTi=dT1uMrRctB4=Hvh35zVc-DtReWmHj-18cd9XT@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arm.linux.org.uk; s=caramon; h=Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:Sender; bh=wdP90yqWttxfpnR
	ZxGqOb5t+21a3D0ynr4TKrHe3CM0=; b=XBk3Fvjcoh1LmDHg2MscGFUm1RhxUCL
	eOFGjPW0pNsSKP6P80XBRGEl6IUyb9pJDxXg0ijDbBoq7fs9wHeH/byOibZmUYzr
	6HoOryw/5i71hI5yw/HeG8FsxSZvSYtYj5K1kNnersnJyOBFjExy5+FmUWzIn9dd
	fJfo17qd6lw4=
Content-Disposition: inline
In-Reply-To: <AANLkTi=dT1uMrRctB4=Hvh35zVc-DtReWmHj-18cd9XT@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Robin Theunis <robint91@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-embedded mailing list <linux-embedded@vger.kernel.org>

BTW, Please do not drop CCs.

On Mon, Sep 13, 2010 at 02:48:18PM +0200, Robin Theunis wrote:
> Hi Russell,
>=20
> Yes I have tested it. I made a breakpoint at 0x2008000 and viewed tha=
t
> the r1 register and there in I found the correct ID.
>=20
> Robin
>=20
> 2010/9/13 Russell King - ARM Linux <linux@arm.linux.org.uk>:
> > On Mon, Sep 13, 2010 at 02:07:51PM +0200, Mike Rapoport wrote:
> >> (add LAKLM to CC)
> >
> >>> The problem is now when linux kernel is booting, nothing happens.
> >>>
> >>> ---
> >>> U-Boot> bootm
> >>> ## Booting kernel from Legacy Image at 21000000 ...
> >>> =A0 =A0Image Name: =A0 Linux-2.6.34.1robin9200v1.0
> >>> =A0 =A0Image Type: =A0 ARM Linux Kernel Image (uncompressed)
> >>> =A0 =A0Data Size: =A0 =A01811796 Bytes =3D 1.7 MiB
> >>> =A0 =A0Load Address: 20008000
> >>> =A0 =A0Entry Point: =A020008000
> >>> =A0 =A0Verifying Checksum ... OK
> >>> =A0 =A0Loading Kernel Image ... OK
> >>> OK
> >>>
> >>> Starting kernel ...
> >>>
> >>> Uncompressing Linux... done, booting the kernel.
> >>> ---
> >>>
> >>> Here is stalls. With my jtag probe I can locate the problem.
> >>>
> >>> ---
> >>>> halt
> >>> target state: halted
> >>> target halted in ARM state due to debug-request, current mode: Su=
pervisor
> >>> cpsr: 0x600000d3 pc: 0xc000af3c
> >>> MMU: enabled, D-Cache: enabled, I-Cache: enabled
> >>>> =A0 arm disassemble 0xc000af3c
> >>> 0xc000af3c =A0 0xeafffffe =A0 =A0 =A0B 0xc000af3c
> >
> > Probably __error. =A0Either your machine isn't supported, or the ke=
rnel
> > doesn't recognise your processor.
> >
> > Is your version of uboot sufficiently recent that it passes the cor=
rect
> > machine ID in r1 ?
> >
