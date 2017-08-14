From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 0/5] cramfs refresh for embedded usage
Date: Mon, 14 Aug 2017 17:11:53 +0000
Message-ID: <SG2PR06MB1165840F183EADFC3265D7D98A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nXr5S1y3dCKlpAmdcZm3dRe2cSvRoXLcRHhgNYSB9jA=;
 b=Nt9Wxa2a6v9s01T5kG+haBQhy7+MZNGmtvS8PoB6w2lSwC53OhJ/V5hfXmK8LLoK2UnTgzsLXEFhIdvoZLjAHGQqe0DmhQie8Sla4mzLQDSBgE951VhmpiHF6USp8QdVJAaWrDutb6SpQkBfbakFyST9CWDzzW19yQoFRab8QAA=
In-Reply-To: <20170811192252.19062-1-nicolas.pitre@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Alexander Viro <viro@zeniv.linux.org.uk>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Friday, August 11, 2017, Nicolas Pitre wrote:
> This series brings a nice refresh to the cramfs filesystem, adding the
> following capabilities:
>=20
> - Direct memory access, bypassing the block and/or MTD layers entirely.
>=20
> - Ability to store individual data blocks uncompressed.
>=20
> - Ability to locate individual data blocks anywhere in the filesystem.
>=20
> The end result is a very tight filesystem that can be accessed directly
> from ROM without any other subsystem underneath. Also this allows for
> user space XIP which is a very important feature for tiny embedded
> systems.



I just applied the patches tried this simple test:
 - tested with a Renesas RZ/A1 (Cortex-A9...so it has an MMU).
 - I set the sticky bit for busybox before using mkcramfs
 - booted (with squashfs) and mounted the cramfs image
 - confirmed that the sticky bit was still set on busybox
 - was able to execute busybox in the cramfs image


However, at this point I'm not sure how I can confirm that the XIP=20
busybox actually executed as XIP or not.


Chris

