Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938341853
	for <linux-embedded@vger.kernel.org>; Thu,  9 Jan 2025 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429244; cv=none; b=ejgixHDj67QPfKxFUZ9HqArOdvw3sm36OcercBWuH3a+Weei6BabVduZWIK1KKI901ByRNJ7jyzUFkebbhM5GUxM50DGlovAfmkcd2waQqwdYRPypwiN1Cs0LrxFZpBn+IqamvxYmLKHpicTtLxCzkEuXcVnpl2rLpwEAy04mGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429244; c=relaxed/simple;
	bh=NVUnrX0SeyyiovZNL50HUSIYWg8VNr0AF2PnnNYGswU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bj4NpTzx6Dkv94WuIZqj0HJJUcWJFRMqai3+6bnDKVrO4Li0kyEXWzVhtAYUzaELpAFzShZHOfvsfSA9LguoprjYowdDYmzzZ/TOuGslOOiKAdMmp+0NI5aDbDewApTjLcJhndmJ8bTIf8MbAoGK24RO7eClC3mwRFJSTYd/dxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85ba8b1c7b9so553661241.1
        for <linux-embedded@vger.kernel.org>; Thu, 09 Jan 2025 05:27:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429239; x=1737034039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DktX7SY6Iny5OtE0IHmxp+KLeWeCobXfCk5l8Pm7/WA=;
        b=nrQpo9s61LwkQc0YytB3UrecNfl9s+TMAwMWxP9a2PzROJEf4+MPOimRFODnEGxrop
         3A0jbq/4FWaP6iV3GlBt1PPWUd/ZG8bteGzhqxYwM9b38P7rDHui+dhkw1cY7+ubetq6
         EzThPV0j9GWAaZGZkH/plva//LTmXdNZ0TUIGy4RfArWhhbTx1Z9yupNQkmIFIuasmcq
         iVd299YLwGYKFl0/lKer0eY3AVOr5GsKk02mF6jyrCkQ06BCVHGcGg0P8vU8cATImL+T
         gl1UTd2C1lnS+Iw9GcnvKTC6+szv3Y5pOZtFUz1iVPJxK295BF//UYutqsuyFdhsDv2H
         c3HA==
X-Forwarded-Encrypted: i=1; AJvYcCWLD5BQ3Y6pq19tK0xWsP6Eo399AsIFoOWd0lc36sks6jVCgw8emK67aE0ZtzVUlicGqZPhhB1XA8XnI4Q02g==@vger.kernel.org
X-Gm-Message-State: AOJu0YycWfJ8rdQiNOc7kFaJ3C5dFaVFeKNgfGqrs32+3y3H3rEtsaRm
	nWwYk0SMOQSXtMvR4TnQ/IIO83n4gBjy8GLwAfeP1J4tRMhvYsYSFU9R0r75
X-Gm-Gg: ASbGncufAEp619c/xeBp+6y4lT8D7SNQiknRCDnJFrkONbHFYu/R1Wt61PaQOwhE82K
	FdkeinPHX9lVhRJxaiJBkHs3L1mC35kl6tNzPc/kXACOdR9EH+DPayOWdtv8bEkowDvhYezL11N
	J6LsE7C/gye/KxwU9suhfEHAmEMTZl2knGjwKshac+xLhdlQUGhikLPtiXdiSYukuBzBXbcdCYA
	ucue9BVs5BiLPygs+g9goeU/4CuNevWcOaAG9sAN0ieICKimfJE6XR3bFmMOUTMfFPbV3R+6Gn1
	VaDAH7Oym2CLNnvMOlwIMWo=
X-Google-Smtp-Source: AGHT+IFmKR+5IwEuT4tZdfH9hTVp29hgTPwwqad+NJriFlGnAuRdbYDxNcKHgUrqUT8D6cqZk8oYQQ==
X-Received: by 2002:a05:6122:2388:b0:516:1ab3:700e with SMTP id 71dfb90a1353d-51c7c780ddbmr2227702e0c.3.1736429239420;
        Thu, 09 Jan 2025 05:27:19 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51c7fbd3095sm712118e0c.17.2025.01.09.05.27.18
        for <linux-embedded@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 05:27:19 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5174db4e34eso1263932e0c.0
        for <linux-embedded@vger.kernel.org>; Thu, 09 Jan 2025 05:27:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+xrVKfkHFrPHxUq7cXb5My3qrCCACtSx0iMwJQAXtBtDoJncGW+U/PYFWcYO6YSEpOZle/MuXp3BXgUSRAg==@vger.kernel.org
X-Received: by 2002:a05:6122:a0e:b0:515:d230:f2c6 with SMTP id
 71dfb90a1353d-51c7c872ae5mr2590565e0c.7.1736429238678; Thu, 09 Jan 2025
 05:27:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAORPcfVRobA+u5q7aPboC=3iY8dibDUB0920Z=Z0VgpQEupKJw@mail.gmail.com>
 <MW5PR13MB5632841906910ED152E7AE3CFD122@MW5PR13MB5632.namprd13.prod.outlook.com>
 <b0dd83c8-eb23-494b-8f23-ea8c084405a6@freenet.de> <MW5PR13MB5632E7FD9A5E76949625BA54FD122@MW5PR13MB5632.namprd13.prod.outlook.com>
 <7f8a09dd-3d99-4028-bb70-77464eb0cf77@freenet.de>
In-Reply-To: <7f8a09dd-3d99-4028-bb70-77464eb0cf77@freenet.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jan 2025 14:27:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXChDD5BQXFQGZ8fWKZ9QQaYKEisaHdMrxWZUn=p7CDfg@mail.gmail.com>
X-Gm-Features: AbW1kvZVnRTN5a01-Zi9sOhRIiUAjix7nUobgnqCRQki8sKTF6aUmgx35pmaHuA
Message-ID: <CAMuHMdXChDD5BQXFQGZ8fWKZ9QQaYKEisaHdMrxWZUn=p7CDfg@mail.gmail.com>
Subject: Re: [boot-time]
To: Marko Hoyer <Marko.Hoyer@freenet.de>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, Marko Hoyer <mhoyer.oss-devel@freenet.de>, 
	Shankari <beingcap11@gmail.com>, 
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marko,

On Thu, Jan 9, 2025 at 1:49=E2=80=AFPM Marko Hoyer <Marko.Hoyer@freenet.de>=
 wrote:
> Take a look into the kmesg logs. Looks like there is a 8s delay at a
> certain point:
>
> [    5.897018] input: C-Media Electronics Inc. USB Audio Device as
> /devices/platform/soc/20980000.usb/usb1/1-1/1-1:1.3/0003:0D8C:0014.0001/i=
nput/input1
> [    6.016086] hid-generic 0003:0D8C:0014.0001: input,hidraw0: USB HID
> v1.00 Device [C-Media Electronics Inc. USB Audio Device] on
> usb-20980000.usb-1/input3[   14.012174] printk: console [ttyS0] enabled
> [   14.064965] bcm2835-wdt bcm2835-wdt: Broadcom BCM2835 watchdog timer
> [   14.142795] bcm2835-power bcm2835-power: Broadcom BCM2835 power
> domains driver
> [   14.232013] mmc-bcm2835 20300000.mmcnr: mmc_debug:0 mmc_debug2:0

Those eight seconds are the time needed for printing all
previously-collected and time-stamped kernel log lines to the serial
console.

BTW, only slightly related, but I have no better place to vent ;-)
On OrangeCrab running a 64 MHz VexRiscv softcore, I noticed another
big delay. With initcall_debug:

    initcall pty_init+0x0/0x3c8 returned 0 after 185427581 usecs

Apparently this is due to:

    CONFIG_LEGACY_PTYS=3Dy
    CONFIG_LEGACY_PTY_COUNT=3D256

So yes, almost one one second to set up one legacy pty, ugh...
Disabling CONFIG_LEGACY_PTYS fixed the issue.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
