From: Wolfgang Denk <wd@denx.de>
Subject: Re: [ANNOUNCE] CELF open project proposal
Date: Thu, 03 Dec 2009 07:25:03 +0100
Message-ID: <20091203062503.4300CE6D391@gemini.denx.de>
References: <4B15AAFE.4030705@am.sony.com> <8bd0f97a0912021336xf1ef7ebmfb502efabec187cb@mail.gmail.com> <4B16E03D.3000202@am.sony.com> <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
In-reply-to: <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Aras Vaichas <arasv@magellan-technology.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

Dear Aras Vaichas,

In message <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com> you wrote:
>
> Support for 2nd stage booting from NAND with newer filesystems such as
> UBIFS. i.e. simplified UBI/UBIFS read/write/format code in a small
> footprint.
> 
> TFTP server in a boot loader (U-boot or other). i.e. allows you to
> push a firmware upgrade image to a device. I do know of a few of these
> but they are not open sourced.

U-Boot supports both TFTP (and NFS) downlod, and UBI/UBIFS.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
[Braddock:] Mr. Churchill, you are drunk.
[Churchill:] And you madam, are ugly.  But I shall be sober tomorrow.
