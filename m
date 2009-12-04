From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [ANNOUNCE] CELF open project proposal
Date: Fri, 4 Dec 2009 23:22:20 +0900
Message-ID: <9c9fda240912040622r470d4d0ar385966608cb5384e@mail.gmail.com>
References: <4B15AAFE.4030705@am.sony.com>
	 <8bd0f97a0912021336xf1ef7ebmfb502efabec187cb@mail.gmail.com>
	 <4B16E03D.3000202@am.sony.com>
	 <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com>
	 <20091203062503.4300CE6D391@gemini.denx.de>
	 <9c9fda240912030538j14ea07bdr7fa2f4c1b902405c@mail.gmail.com>
	 <8bd0f97a0912030550q5ea22b17w695318e8cd536abc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=PE+C/vTQWvZ48xfC5j6PjuJ+VkMiwIeGf34I4IDp/RA=;
        b=U2zfM8+N+wgd3jEmkCWCLqRoX5/ex4teHPHgQqZjGYsBK0+qTfMmQBDPRZ2pA0hAH/
         iyYoaM9VhA/K6MnliHKB3LVrTHPNfP2KU7oRgaIWdxeyI1isUtRMC6M2TTNBXY0spkVs
         KxN60OQKS1UhZRW1ky0AqkZ12ioyyK5m1ZOno=
In-Reply-To: <8bd0f97a0912030550q5ea22b17w695318e8cd536abc@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Wolfgang Denk <wd@denx.de>, Aras Vaichas <arasv@magellan-technology.com>, linux-embedded <linux-embedded@vger.kernel.org>

On Thu, Dec 3, 2009 at 10:50 PM, Mike Frysinger <vapier.adi@gmail.com> =
wrote:
> On Thu, Dec 3, 2009 at 08:38, Kyungmin Park wrote:
>> On Thu, Dec 3, 2009 at 3:25 PM, Wolfgang Denk wrote:
>>> Aras Vaichas wrote:
>>>> Support for 2nd stage booting from NAND with newer filesystems suc=
h as
>>>> UBIFS. i.e. simplified UBI/UBIFS read/write/format code in a small
>>>> footprint.
>>>>
>>>> TFTP server in a boot loader (U-boot or other). i.e. allows you to
>>>> push a firmware upgrade image to a device. I do know of a few of t=
hese
>>>> but they are not open sourced.
>>>
>>> U-Boot supports both TFTP (and NFS) downlod, and UBI/UBIFS.
>>
>> How about the TFTP over USB? It's required feature for no ethernet d=
evices
>
> you'll have to be more specific if you want a real answer. =A0U-Boot =
has
> USB Ethernet gadget support already.

Yes I see the u-boot-usb cdc branch, but it doesn't support the RNDIS
feature. The real or wanted use case is that I receive the kernel and
system image from tftp over USB from tftpserver via windows.

Thank you,
Kyungmin Park
