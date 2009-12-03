From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [ANNOUNCE] CELF open project proposal
Date: Thu, 3 Dec 2009 07:17:30 +0000 (GMT)
Message-ID: <alpine.LFD.2.00.0912030713300.10116@macbook.infradead.org>
References: <4B15AAFE.4030705@am.sony.com>  <8bd0f97a0912021336xf1ef7ebmfb502efabec187cb@mail.gmail.com>  <4B16E03D.3000202@am.sony.com> <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1688546212-537036160-1259824664=:10116"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <ed62800912021827s6f25f063ke836fe1482cec028@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Aras Vaichas <arasv@magellan-technology.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1688546212-537036160-1259824664=:10116
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Dec 2009, Aras Vaichas wrote:

> 2009/12/3 Tim Bird <tim.bird@am.sony.com>
>>
>> Mike Frysinger wrote:
>>> i know your e-mail intro states "embedded Linux" as does the wiki, but
>>> i'm gonna take a stab anyways. =A0does this apply to Linux only and not
>>> open source boot loaders (like U-Boot) ?
>>
>> It applies to anything in the "embedded Linux" ecosystem. =A0This
>> would very much include open source boot loaders like U-Boot.
>
> I've got a list of "nice to haves"
>
> Any boot time speed up work.
>
> Support for 2nd stage booting from NAND with newer filesystems such as
> UBIFS. i.e. simplified UBI/UBIFS read/write/format code in a small
> footprint.

Is it heretical to suggest a BSD licence for that too, to encourage=20
adoption into other bootloaders? Or at least LGPL or the=20
"GPL with linking exception" licence that libstdc++/eCos/JFFS2 have.

> TFTP server in a boot loader (U-boot or other). i.e. allows you to
> push a firmware upgrade image to a device. I do know of a few of these
> but they are not open sourced.

OpenFirmware copes with this quite nicely (or with http download, for that =

matter). You can even flash a whole bunch of devices at once with=20
multicast over the wireless. Somewhere there's a photo of me with a few=20
hundred OLPC laptops laid out across the floor of main hall in a Mongolian =

school, all sucking up their NAND image over the wireless.

The world needs more OpenFirmware :)

--=20
dwmw2

---1688546212-537036160-1259824664=:10116--
