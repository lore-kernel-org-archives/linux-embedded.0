From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 0/5] cramfs refresh for embedded usage
Date: Wed, 16 Aug 2017 15:12:09 +0000
Message-ID: <SG2PR06MB116565941AF758C40E6145228A820@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org>
 <SG2PR06MB1165840F183EADFC3265D7D98A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708141322170.17016@knanqh.ubzr>
 <SG2PR06MB116563FCF10E2615C65080F28A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708141405390.17016@knanqh.ubzr>
 <SG2PR06MB1165D300028F81087B045C8A8A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708150001380.17016@knanqh.ubzr>
 <SG2PR06MB1165749BD3C8336AB0CD27618A8D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708160105470.17016@knanqh.ubzr>
 <SG2PR06MB1165E8DC60659449C24DD6B68A820@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708161002500.17016@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-embedded-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eHUGHZXHbd7dgJLEY0C3Oskb0KVJOsTbbfw5VUgpRcg=;
 b=ACWsk29q3vzLEpFVUhzVqoifsuyEmdOhR/jkhVguguTpZYxfHIkMowXg3fJTCijzbn9a/c/UIvk8OYqV4s52pFcPqdlADrvXKRq/lv5X5VhucjskDkJH3aUhKtcYiELi8/BcoN+iYdXE291NX0g+HcX7c5iLPeM3Fw5lcvP+0F4=
In-Reply-To: <alpine.LFD.2.20.1708161002500.17016@knanqh.ubzr>
Content-Language: en-US
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wednesday, August 16, 2017 1, Nicolas Pitre wrote:
> > Just FYI,
> > I'm running an xipImage with all the RZ/A1 upstream drivers enabled and
> > only using about 4.5MB of total system RAM.
> > That's pretty good. Of course for a real application, you would trim of=
f
> > the drivers and subsystems you don't plan on using, thus lowering your
> > RAM usage.
>=20
> On my MMU-less test target I'm going under the 1MB mark now.

Show off  ;)


> Given that I also applied the device table patch to mkcramfs (that
> allows for the creation of device nodes and arbitrary
> user/group/permission without being root) it would be possible to extend
> this mechanism to implement other XIP patterns such as for
> uncompressible media files for example.

Good, I was going to ask about that.

I made an example once were all the graphics were RAW and uncompressed=20
and marked as XIP in AXFS. The result was a large saving of RAM because=20
as the graphics framework (DirectFB) would copy directly from Flash=20
whenever it needed to do a background erase or image re-draw (button press=
=20
animations).

Same went for playing MP3 files. The MP3 files were XIP in flash, so=20
mpg123 pulled from flash directly.


Chris
