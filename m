From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 4/5] cramfs: add mmap support
Date: Tue, 29 Aug 2017 19:38:03 +0000
Message-ID: <SG2PR06MB1165FE414425AFD1C64E7CD78A9F0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170816173536.1879-1-nicolas.pitre@linaro.org>
 <20170816173536.1879-5-nicolas.pitre@linaro.org>
 <20170828064632.GA26136@ZenIV.linux.org.uk>
 <nycvar.YSQ.7.76.1708280914260.2606@knanqh.ubzr>
 <20170828142306.GJ5426@ZenIV.linux.org.uk>
 <nycvar.YSQ.7.76.1708281058590.2606@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0Ib8j/IvOc2ZlQV74P+RaHMe5PD+73zKA3oFcOPEmu8=;
 b=Ea7Z4PehMja1zMIPlgYrr3TWTkneliNvk0lDJjQAu1DKA5iexQ92hlDTC93a4cnhs7eRlt/Geg1mthVU1DXFmquPuFhPokfFUnfzH4Sw8whVu/FmVc32eRftrweyBr2F8wW9QTsfHwT84zn05RP5shmndvpEFC39UvhNkgDlnR8=
In-Reply-To: <nycvar.YSQ.7.76.1708281058590.2606@knanqh.ubzr>
Content-Language: en-US
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Monday, August 28, 2017, Nicolas Pitre wrote:
> OK I moved the lock promotion right at the beginning _before_ validating
> the split point. Also got a reference on the file to make sure that
> hasn't changed too.
>=20
> > While we are at it, what happens if you mmap 120Kb, then munmap() the
> middle
> > 40Kb.  Leaving two 40Kb VMAs with 40Kb gap between them, that is.  Will
> your
> > ->vm_private_data be correct for both?
>=20
> It wouldn't, but I now changed it to contain absolute values so now it
> will. And if the split point lands in the hole then the code just
> readjusts the pgoff at the beginning of the remaining part.
>=20
> Here's the revised patch:


For whatever it's worth, as soon as I moved to 4.13-rc7,
CONFIG_CRAMFS_PHYSMEM=3Dy crashes my XIP_KERNEL system before it can even=20
get to any console output.

(both the old patch and the new patch)

If CONFIG_CRAMFS_PHYSMEM is not set, my XIP system boots fine.

However, if I boot -rc7 as a uImage, the new patch works just as good as
the old patch.

(mounting after boot, or booting with rootfstype=3Dcramfs_physmem)


I guess I'll have to figure out what happened between -rc4 and -rc7.
Damn!


Chris

