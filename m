From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 0/5] cramfs refresh for embedded usage
Date: Mon, 14 Aug 2017 18:37:37 +0000
Message-ID: <SG2PR06MB1165D300028F81087B045C8A8A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170811192252.19062-1-nicolas.pitre@linaro.org>
 <SG2PR06MB1165840F183EADFC3265D7D98A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708141322170.17016@knanqh.ubzr>
 <SG2PR06MB116563FCF10E2615C65080F28A8C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <alpine.LFD.2.20.1708141405390.17016@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hHjXuC8EBUqrnG+maSOJLkk/XmlpZIw6OmyYJ9DNqyw=;
 b=A8S890IJMU1bXbeZ4FdXrdvZI3mW0gz6cT1JYDUoo2SO0T5TwbDGQEREpqKff64iH93My5ApQBbxZ6jkOXXerQ11Feog0/T0rpR4LxC4w1rQz+Si2NQsJzxMG/j5/VtddfkkQFfbA2JMMSRl/p9uVrBk7uRRSImqouy42fTXJm8=
In-Reply-To: <alpine.LFD.2.20.1708141405390.17016@knanqh.ubzr>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Monday, August 14, 2017, Nicolas Pitre wrote:
> > However, now with your mkcramfs tool, I can no longer mount my cramfs
> > image as the rootfs on boot. I was able to do that before (ie, 30
> minutes
> > ago) when using the community mkcramfs (ie, 30 minutes ago).
> >
> > I get this:
> >
> > [    1.712425] cramfs: checking physical address 0x1b000000 for linear
> cramfs image
> > [    1.720531] cramfs: linear cramfs image appears to be 15744 KB in
> size
> > [    1.728656] VFS: Mounted root (cramfs_physmem filesystem) readonly o=
n
> device 0:12.
> > [    1.737062] devtmpfs: mounted
> > [    1.741139] Freeing unused kernel memory: 48K
> > [    1.745545] This architecture does not have kernel memory protection=
.
> > [    1.760381] Starting init: /sbin/init exists but couldn't execute it
> (error -22)
> > [    1.769685] Starting init: /bin/sh exists but couldn't execute it
> (error -14)
>=20
> Is /sbin/init a link to busybox?

Yes.


> I suppose it just boots if you do mkcramfs without -X?

Correct. I just created another image and removed the "-X -X" when=20
creating it. Now I can boot that image as my rootfs.
  (I'm using -X -X because I'm using a Cortex-A9 with MMU).


> If so could you share your non-working cramfs image with me?

I will send it (in a separate email)



Chris


