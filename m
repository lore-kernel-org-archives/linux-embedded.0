From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v5 0/5] cramfs refresh for embedded usage
Date: Fri, 6 Oct 2017 16:07:45 +0000
Message-ID: <SG2PR06MB11655E68C2F2BE55261F51238A710@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20171006024531.8885-1-nicolas.pitre@linaro.org>
 <20171006063919.GA16556@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=K1Fzr2Oe/9MFdP/hc9xsqsjEL6U8hT4zg1hmzUD4Qbg=;
 b=U/vHhTOtGEv96opNvq2sgklYj/IPuxwPAhrCnL0HyOqsrlHyR8LiaFXLYcpnjnXfIDyJiKEUx/UEayyouWTpciLl6F3xCxl3jfH/Ruhwtp5cHQMSrCG769Nezpv/GhmeTbzAqXDM8USoZnHtm30c/5M5+G4nZx/c848uMoDcDPU=
In-Reply-To: <20171006063919.GA16556@infradead.org>
Content-Language: en-US
Sender: owner-linux-mm@kvack.org
List-ID: <linux-embedded.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>, Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Friday, October 06, 2017, Christoph Hellwig wrote:
> This is still missing a proper API for accessing the file system,
> as said before specifying a physical address in the mount command
> line is a an absolute non-no.
>=20
> Either work with the mtd folks to get the mtd core down to an absolute
> minimum suitable for you, or figure out a way to specify fs nodes
> through DT or similar.

On my system, the QSPI Flash is memory mapped and set up by the boot=20
loader. In order to test the upstream kernel, I use a squashfs image and=20
mtd-rom.

So, 0x18000000 is the physical address of flash as it is seen by the=20
CPU.

Is there any benefit to doing something similar to this?

	/* File System */
	/* Requires CONFIG_MTD_ROM=3Dy */
	qspi@18000000 {
		compatible =3D "mtd-rom";
		probe-type =3D "map_rom";
		reg =3D <0x18000000 0x4000000>;	/* 64 MB*/
		bank-width =3D <4>;
		device-width =3D <1>;

		#address-cells =3D <1>;
		#size-cells =3D <1>;

		partition@800000 {
			label =3D"user";
			reg =3D <0x0800000 0x800000>; /* 8MB @ 0x18800000 */
			read-only;
		};
	};


Of course this basically ioremaps the entire space on probe, but I think
what you really want to do is just ioremap pages at a time (maybe..I=20
might not be following your code correctly)


Chris

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
