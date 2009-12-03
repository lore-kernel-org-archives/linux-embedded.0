From: Aras Vaichas <arasv@magellan-technology.com>
Subject: Re: [ANNOUNCE] CELF open project proposal
Date: Thu, 3 Dec 2009 13:27:57 +1100
Message-ID: <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com>
References: <4B15AAFE.4030705@am.sony.com>
	 <8bd0f97a0912021336xf1ef7ebmfb502efabec187cb@mail.gmail.com>
	 <4B16E03D.3000202@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4B16E03D.3000202@am.sony.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-embedded <linux-embedded@vger.kernel.org>

2009/12/3 Tim Bird <tim.bird@am.sony.com>
>
> Mike Frysinger wrote:
> > i know your e-mail intro states "embedded Linux" as does the wiki, =
but
> > i'm gonna take a stab anyways. =A0does this apply to Linux only and=
 not
> > open source boot loaders (like U-Boot) ?
>
> It applies to anything in the "embedded Linux" ecosystem. =A0This
> would very much include open source boot loaders like U-Boot.

I've got a list of "nice to haves"

Any boot time speed up work.

Support for 2nd stage booting from NAND with newer filesystems such as
UBIFS. i.e. simplified UBI/UBIFS read/write/format code in a small
footprint.

TFTP server in a boot loader (U-boot or other). i.e. allows you to
push a firmware upgrade image to a device. I do know of a few of these
but they are not open sourced.

Just my 2 cents.

Aras
