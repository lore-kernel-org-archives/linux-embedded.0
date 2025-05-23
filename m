Received: from mail-108-mta231.mxroute.com (mail-108-mta231.mxroute.com [136.175.108.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079171A76BB
	for <linux-embedded@vger.kernel.org>; Fri, 23 May 2025 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747985969; cv=none; b=iEux6RVXckq7gluGqjArD2nVXL//BpA62ONOFCGoA3g1yhdKwZJaQRkRZ3bzNTq0m+X4xmJoB522dHUnEM4UYXnA/PiWMqCLF47yU4Uk1gzhAGK0x9XvbfoFCswYAzBNBBBY7rAK7+HYar6Ve93LhjCq2SQZ/VcfBDMUIonkEhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747985969; c=relaxed/simple;
	bh=97FKYRdejTFbXtj1KzYTwZLrQtCY29hmxg5uJoOl/Q0=;
	h=MIME-Version:Date:From:To:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ZMct7s40eFkAOpuncV71R/qpeTd8j49R/M7ZNaN8X3+E/RgwpPAxeR+QCHifsH2ydmLt+nhXkOAXQWA31w1AhC+GajKB6sB2QL4SNleutcHLUni691/y82ob/m9Es/B0eCdx3SKS0fiu1qYpQLyk+GH0l33HtfJ7VSnROTTho0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=giovanardi.dev; spf=pass smtp.mailfrom=giovanardi.dev; dkim=fail (0-bit key) header.d=anymxrelay.com header.i=@anymxrelay.com header.b=SjKzrQ2m reason="key not found in DNS"; dkim=pass (2048-bit key) header.d=giovanardi.dev header.i=@giovanardi.dev header.b=QWYUaTPD; arc=none smtp.client-ip=136.175.108.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=giovanardi.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=giovanardi.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=anymxrelay.com header.i=@anymxrelay.com header.b="SjKzrQ2m";
	dkim=pass (2048-bit key) header.d=giovanardi.dev header.i=@giovanardi.dev header.b="QWYUaTPD"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta231.mxroute.com (ZoneMTA) with ESMTPSA id 196fc105c420008631.001
 for <linux-embedded@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 23 May 2025 07:34:12 +0000
X-Zone-Loop: 290d9483c655cfac20e14a6983023261beb0cd8c6478
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=anymxrelay.com; s=x; h=Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1/GfOl3SuKkjWs0JLX5XxrbCSgYoB7R+Y4C0ppeyTSA=; b=SjKzrQ2mMXVvWKBdfxlnSJU2Ze
	rgAhAmg7ly1eKESYb1Kzmu4YbxYhx1mUnyqiy3pQuu0QIXeY56dNv5GAygdBZC5eP8ZYmFr21Bxhe
	RVK+clUdS+zSZDiLtk/u/KwC5BqPd2Zmfr52TVE2otX4YKV9JCKL15wk/iej2Xo0WVC7cSI2NoFj+
	/QWsptWNV/2KY2336cVjI5M5Jv931nWSJism2qv/H5IWNADefbRqzbsrbqdFx6c3R622dxhPBwXd2
	Q02KYkoyLD0qFok8eqFtdC7Po7QJ/K7BbwCQX0XU/vqrHBOem5ndzvK0uzrS8z2T8hDdj0zDOffAY
	0IouQOtg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=giovanardi.dev;
	s=mail; t=1747985649;
	bh=97FKYRdejTFbXtj1KzYTwZLrQtCY29hmxg5uJoOl/Q0=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=QWYUaTPDA/BoLnan3UdUsp6+SIoN3nPRNoF+0FnrdH/VmKWGQWSIe8g6LXLjTAa2o
	 UHULUY2mdvB9fvjrnPG0mh0EQNQG5DRqFJbCU5RsqiN6c+ovb1LU7j9f2lvdTxtwUp
	 dJrQ/FA20jCXIFK7J+B1s8An7I2nocIiLe5t3cdW2og+2eiJlf5ywgLBKWnxz37BIl
	 ShS0qkknL+FJcIlNWJy/TozDidxtL4P3qR++wHvnjWWyt2S6vLIptJGmYwp7dglmbL
	 Pq7tdqStXVoL4sIYovf9hlNALQNjGpJ/JeHcNttwNK0e5Bthyd0phiv2WLRgvFHRtQ
	 IytR+RdFHjqTQ==
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 May 2025 09:34:09 +0200
From: Federico Giovanardi <fede.dev@giovanardi.dev>
To: linux-embedded@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] Add driver for bootstage stash
In-Reply-To: <PA4PR08MB604681FF6392B25A19926A11ED98A@PA4PR08MB6046.eurprd08.prod.outlook.com>
References: <20250522224223.358881-2-francesco@valla.it>
 <PA4PR08MB604681FF6392B25A19926A11ED98A@PA4PR08MB6046.eurprd08.prod.outlook.com>
Message-ID: <473a062e4f939bc58a5c0e636569b826@giovanardi.dev>
X-Sender: fede.dev@giovanardi.dev
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-DKIM: signer='giovanardi.dev' status='pass' reason=''
DKIMCheck: Server passes DKIM test, 0 Spam score
X-Authenticated-Id: giovanardi@anymxrelay.com

Hello,

The note about the data format also was my initial thought, by just 
copying a C structure we might have issues as soon one party changes it, 
and they might not be perfectly aligned.

To avoid inventing yet-another-data-format I've used msgpack in the past 
for that (the format 
https://github.com/msgpack/msgpack/blob/master/spec.md, not the library  
); because the specs are so simple they can be implemented in a few 
lines, and it's something with a reference. But I don't have a lot of 
experience in upstreaming stuff on the kernel, so I don't know if it 
might cause someone to don't be happy. Anyway, I can contribute the 
implementation if needed.

Something as simple as an array of fixarray will give extensibility with 
only a few bytes of overhead.

Which gets encoded as:

0xdc # lenght 16 bit << array header
      # 0xB << 4 | ( array_size & 0xF) << fixarray header ( 3 elements, 
simplest case)
            # 0xce # time_us
            # 0xce # start_us
            # 0xc << 4 | strlen(name) # name
            /*no flags, no id*/
      # 0xB << 4 | ( array_size & 0xF) << fixarray header ( 5 elements 
bigger case)
            # 0xce # time_us
            # 0xce # start_us
            # 0xc << 4 | strlen(name) # name
            # 0xcc # flags
            # 0xcc # id
      .. repeat ...


Since the goal is to use that in many different contexts, defining the 
fields that we need early is important.

Bye
Federico

> -------------------------
> 
> Da: Francesco Valla <francesco@valla.it>
> Inviato: venerdì 23 maggio 2025 00:42
> A: linux-embedded@vger.kernel.org <linux-embedded@vger.kernel.org>
> Oggetto: [RFC PATCH 0/1] Add driver for bootstage stash
> 
> Questo messaggio proviene da un mittente esterno: fai attenzione ad
> allegati e link.
> 
> Hello,
> 
> after the discussion on the "Unified Boot Log" topic during the latest
> Boot Time SIG special meeting [1], I tried to mock up a driver that
> reads a bootstage stash saved by the U-Boot bootloader in a given
> memory
> area and exposes the data in a user- and machine- friendly through
> both
> sysfs and debugfs attributes. Details on the interfaces, as well as
> example output for the debugfs interfaces, can be found on the
> documentation that is part of the patchset.
> 
> To use this driver, a memory area shall be reserved inside the Linux
> kernel devicetree as follows (possibly changing the address and the
> size
> of the memory area):
> 
>     bootstage@a4300000 {
>         compatible = "bootstage";
>         reg = <0 0xa4300000 0 0x1000>;
>         no-map;
>     };
> 
> At U-Boot side, following configuration shall then be set:
> 
>     CONFIG_BOOTSTAGE=y
>     CONFIG_BOOTSTAGE_STASH_ADDR=0xa4300000
>     CONFIG_BOOTSTAGE_STASH_SIZE=0x1000
> 
> Once booted, the bootstage data can will be found at:
> 
>     - /sys/devices/platform/a4300000.bootstage/
>     - /sys/kernel/debug/bootstage/a4300000.bootstage/
> 
> The device name is purposely part of the sysfs and debugfs paths to
> support multiple bootstage areas, as this _might_ then be used for
> multiple bootstage sources, e.g. bootloaders running on different
> cores inside a SoC with different architectures.
> 
> Note that this is not really meant to be integrated as-is, not only
> because it's a single patch including code, documentation and
> devicetree
> bindings, but also because the bootstage stash format itself may need
> to
> be touched up a bit. In particular, fixed data type should probably be
> evaluated for the bootstage record, in order to increase compatibility
> with different data sources.
> 
> Comments are of course welcome.
> 
> Regards,
> 
> Francesco
> 
> [1]
> https://eur02.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-embedded%2FMW5PR13MB5632B8FA3279D77F2F9217BBFD9CA%40MW5PR13MB5632.namprd13.prod.outlook.com%2F&data=05%7C02%7Cfederico.giovanardi%40cnh.com%7C68aacb29d80340fc5d3208dd99904415%7C79310fb0d39b486bb77b25f3e0c82a0e%7C0%7C0%7C638835567100175385%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Hrd3rjtJ7sLciUzkFymL7y2agCAMZSAKKF7evt20LQU%3D&reserved=0
> [1]
> 
> Francesco Valla (1):
>   drivers: misc: add driver for bootstage stash
> 
>  .../bindings/reserved-memory/bootstage.yaml   |  44 +++
>  Documentation/misc-devices/bootstage.rst      |  53 ++++
>  Documentation/misc-devices/index.rst          |   1 +
>  MAINTAINERS                                   |   7 +
>  drivers/misc/Kconfig                          |  10 +
>  drivers/misc/Makefile                         |   1 +
>  drivers/misc/bootstage.c                      | 292
> ++++++++++++++++++
>  drivers/of/platform.c                         |   1 +
>  8 files changed, 409 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/reserved-memory/bootstage.yaml
>  create mode 100644 Documentation/misc-devices/bootstage.rst
>  create mode 100644 drivers/misc/bootstage.c
> 
> --
> 2.49.0
> 
> 
> 
> Links:
> ------
> [1] 
> https://lore.kernel.org/linux-embedded/MW5PR13MB5632B8FA3279D77F2F9217BBFD9CA@MW5PR13MB5632.namprd13.prod.outlook.com/
