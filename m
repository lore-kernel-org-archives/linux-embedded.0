Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2002E573;
	Thu, 27 Nov 2025 00:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764202647; cv=fail; b=QMWXXwcZyma3mkmpLs2XE9v1QFBFWPIUy15HraKnlhCftqiQ16AAEOiSqI4y/PKofnUDAxInFHjNMNvxWDZt3uwhsuie/EH0tV6QNSbcofy+NPASS7qaWIoBD22W88nRGAi/vPYk5oX8J/Aun2wn/yk5J2DChp/KM4RjB8fpdps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764202647; c=relaxed/simple;
	bh=DzyZi/luV0MPCqp0KzDwKTRCjsJyAQgL0dNtTH/YCaM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iL9Pv9p9VIlhF/Gsid3grE5jJLhz54kHgpEmYH9QeyGJCMdxnw6h12BM4mHTQIMZTUdG7brrNmM0g1+amtnYS1Tw4V0xAW9V9aZFLchZCBGGE5TzqnJRdGpZ2I5EPOHVs4TIOSImGYITrMggGu9A/Yyl8ZXM3I53Y1kmUiP55Z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=Vmy3UHGR; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="Vmy3UHGR"
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AQJewVI030015;
	Thu, 27 Nov 2025 00:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=DzyZi/l
	uV0MPCqp0KzDwKTRCjsJyAQgL0dNtTH/YCaM=; b=Vmy3UHGRzGlkIPPZz7f4UwA
	OfroUA7KsHqqQAHaO9MtCKNDHqWufKSk4f9hlNAzjCOaiY/eLpUUDBbGdC/1cWQo
	rFykzbv8Mqdz5Dq0gn16Ja/3Eb5SeuEeeggLWeil23qujuRLTxlphifH5NP7K/Wv
	/W1lpSoPBJPHw0h3yL7bLkcQrQbum4HmlSJAARu5RkXp/BAlC+QOc6PxDF6JasSK
	bHCzQarcvjtAk8QKkM/7mcj5QcSGdALJyuQqgMKYcITT4WLkWEAGjHTRsrhdkzBN
	dMVtCNhyK76GSqvuP19kTufR31qeMtD+yv1+A8nWE+8UwZoAR9pD6vrklvVmNHQ=
	=
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4ak3y75wpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Nov 2025 00:16:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVVoBt9dl3UtOqn2n7r+l7PHte6TDDoG/PukJpbfDssKA05LRk0JeXO3wcAdrS1ZXDaS/34uo5AebnrCTeWhBetBdsOirSkfrSL3Qnql594+ZMRjfNKBDGlbXejMSjpmLhej566HijfyXAPZ6m5E8vQt1nIf852s0xo4c9X1ma6bcL98UyJ1nyZy91iMA4dIoIgVEBc1NSHHCzfTZtINnmU9Lev6F3bG0QUaBlNGEqrEJ7P8qiFeLf7xQzsB2Kb30+/QnPp/MOzjNL/MqvhHRfGk9Sv5A30iuUILmENJn2JPRfg2oZrTis+fH6DWaY11U9yQTsg9XYLvdxmTZEbRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzyZi/luV0MPCqp0KzDwKTRCjsJyAQgL0dNtTH/YCaM=;
 b=K7cs8TCtQ7mZBPlK6NqVWAPGFbbiMNDXM6fOofq74Ets0hXUKlUSIWP1MhxCH0ohaMJZp5qCcyfJbn4Yey0I+r0dP+x0quXuQzWfEiifgUd2qcAnkSysWOh1oLYRas6PyWbmpRkjHc4rf1rcpraogRkR3PGrgsguHvRUMZr/U6gtKz/6hEnqTr3SpS+Kynrtir3pClXLGS0KIqRUdkDTIgdeI5vHOAbzZfZiS/mFfcfFbcj49P2d984dq5MtcWU8dYmUJrmUIoeDkAXc7L49MWy2oqBiRaOrLknioASBn5PmasHz8lqtGJacThJ67q+ge44shmAPc7/G+mXQCJHnwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by BY3PR13MB4913.namprd13.prod.outlook.com (2603:10b6:a03:364::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 00:16:24 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%7]) with mapi id 15.20.9343.016; Thu, 27 Nov 2025
 00:16:24 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Francesco Valla
	<francesco@valla.it>
CC: Tim Bird <tim@bird.org>, "pmladek@suse.com" <pmladek@suse.com>,
        Steve
 Rostedt <rostedt@goodmis.org>,
        "john.ogness@linutronix.de"
	<john.ogness@linutronix.de>,
        "senozhatsky@chromium.org"
	<senozhatsky@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML
	<linux-kernel@vger.kernel.org>,
        Linux Embedded
	<linux-embedded@vger.kernel.org>
Subject: RE: [PATCH] printk: add early_counter_ns routine for printk blind
 spot
Thread-Topic: [PATCH] printk: add early_counter_ns routine for printk blind
 spot
Thread-Index: AQHcXcyxlSHgESA7t0W/7OXIPht4NbUDXaIAgAE1/ACAARQNUA==
Date: Thu, 27 Nov 2025 00:16:23 +0000
Message-ID:
 <MW5PR13MB5632A34DAEDD321E9813F997FDDFA@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <aSWqWD1BQ-m-Zy9C@bywater>
 <CAMuHMdXvQtCyqSN37QYWCL2T2sz7r-S2Cy7MySn59F3qn5vsZA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXvQtCyqSN37QYWCL2T2sz7r-S2Cy7MySn59F3qn5vsZA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|BY3PR13MB4913:EE_
x-ms-office365-filtering-correlation-id: 917bf8e9-bddb-4c46-0e89-08de2d4a3306
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?YTIrT2MzaHZGOGpZWnBBUU1hTkRndnVacklVWllORk5uWldwUW5mdTdVYnk3?=
 =?utf-8?B?UDh6cUc2UWRuT1QvVzBvdTZDMkIzRU80OEFaYzljZTdHOHdFVVU4ejY3dDZs?=
 =?utf-8?B?R2Q5MnpVSGFzanFCTk1vUmNQN0Q5eUY0YmVTSlN4Zm1wODFIQ3ZmKzVGUi95?=
 =?utf-8?B?ZlhNWlZpenhVY0d6TzJpRFNNN24zUlN0d3d1SDFQR2V2MHVIY0RySThPbkN4?=
 =?utf-8?B?N0E0NzRiSWV6OVY4ZmQrTjZiT21paWtTTWhJRm9pOURTbEs1ZlRKYmtQMkhO?=
 =?utf-8?B?ZWQzcHI3VitwSTFpcFhCYjV5TnZFa3FLTFJYSjZrdDFzdXdHUGhBcEFPd2Fl?=
 =?utf-8?B?V3U1WVduODFJL2RycmVJZUttWTdXZHEvTWhNRUl4bi9MWC8wQWQ0MjV2S1BR?=
 =?utf-8?B?dEp0UDR6QkFhRnlGM3hqUG9TcVBaaXhpR1NNcG5DRFlyRVpxMGNpb0JoNm5K?=
 =?utf-8?B?L1pzc3VKWW5vOW5wa0lTb25NL3Z1blhrREdWVm9PWkhCb2FDb2Q2NWQ5ZHBZ?=
 =?utf-8?B?b3k0WEt1SitXMWkvYTdlSVFkMStTMTYybUpLclZHbkhCV25odG1RTWV6MC9u?=
 =?utf-8?B?ZFM4cHltVW5zVnJodysySUJSa1haWG5sUVNrY0oxVERFM0prb3BUZGF2VFZl?=
 =?utf-8?B?K2FLek1pOGoySFU1REZuQXVMVklUUXh3N3NpTkFrdTMxekxRYUc1VzJlVlZQ?=
 =?utf-8?B?NVJFNEFzR3duY08vbUVKTklOWGh2b09iUnNxZEp4clpOWFVCY2xvcTJhTTVh?=
 =?utf-8?B?L0EzWktWQTNXd0NBTVgxWU04ZTdIVmNWUU5pTHVWSEprcnN5SnJEclFpRFVt?=
 =?utf-8?B?aVVFMkRyUDNrY0pEc1libmVwVm1MdnR6akZwSGxXclpDMmI2TnZoaERLWnlq?=
 =?utf-8?B?UEdHVGljZ0ZaNWEwdVlSSGE1TGdJbEJpNURFQmFHTXJRUEhoK0thVlRFWFBk?=
 =?utf-8?B?dDNSYjBQdjNKUGZvZHFKQkMwblIzUUQ2UmRxcUFqeks4VlpOaGhmeDhEenBR?=
 =?utf-8?B?SUdUbXU4eHp4VG1NVkxRT0hJMzlXZ2piNEIzc2FuUlp2L3Q1eHFpcEJhMGVo?=
 =?utf-8?B?T09NSytlZEN5QUM2bnI4UTlSU0FoRGVQRHlnbUpNejFzbDREMDBVd2YvWjMv?=
 =?utf-8?B?OVYzNEpNbjZnNGtxZGVpVlJuY013akszaGt0RWR3OUdxSitYZ0ttbTZBcTJR?=
 =?utf-8?B?RDZmM05NaEQ1WWxvTzdwcmcwVGxOeXZQMjJrWkZ1WVJVYVFiTFdnbmtVWGV3?=
 =?utf-8?B?cUFjMlVTVHlMM09LRjFNNERWRGdwQmcxMld1eExXQldNSitOc0drOXNmbWw5?=
 =?utf-8?B?a0ZFdzNlK3d4UGRkVFlITTQ4ek1WMldWckdYcnhqNStYaWpySnZxNE5RanI2?=
 =?utf-8?B?UEV4cTJGc204TDJOVUxjM1U4bkZkVlhpZDZrcTFNdWlXSlpJa1liUEViOUs5?=
 =?utf-8?B?Uy96TURIdDlKUmdqcTQwWTZUcnFMS29VTjMvS0RQWHdDbU5wSVBZejRod3pY?=
 =?utf-8?B?WE0xVFA3MjlPQzhBaU5MaDVjUExwZW1hOHlFbFZTSm1LUFVRamVOSWNCZ3hz?=
 =?utf-8?B?SGVvQ0t5VFUvUHB2Unl4YVQwSGNwSGNvSzFlLzJKOHVyL1FSSXdMejFPOWg3?=
 =?utf-8?B?dUIzcUNCdHdwVDNFUk1tZ2ZKKzh2ZEFHZ3MxZzQ5RlR2Z1RQd3VIZ284QVNk?=
 =?utf-8?B?YWxjQThCUXBXSEVDT1h6NDk5WlREdU1SYkJWSkpVWnZoNnNLSmRKcjFpNFZa?=
 =?utf-8?B?ZnlRd2Ztd29SNkpFemtFSFhKakVQQko2bzl1VStkaUc2Qm9pVGNjemlPVjBH?=
 =?utf-8?B?clVFNG81dTBtaEVPUWN0eTA3K0xHUFJmNWVocDJacXhSeEV1ODAvWDFndHBJ?=
 =?utf-8?B?YjNPN21sRjZzTjJPUlNlRHU2ZWkrT2pkanB0aTVaZFY0bXZSY0RVbEpHUXVV?=
 =?utf-8?B?Y0xUcWNYOVlXL2lzUWxpWUQ5TVNxZW1ncWZENHltbWdmQ2J2M1ArWE1jblNJ?=
 =?utf-8?B?MXNuREpzaktkZ3E4YkVpaUNkbFQwNkZhUFpZR1M4RmxsSGtRMFQrazIwQVl6?=
 =?utf-8?Q?SUCXUV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTNuWGE2Q1A0dUlGYnoyMVp3Z0hLY3lFRHFrZHJhOTNkMEpTamc1THowRWJ5?=
 =?utf-8?B?R1c3Nk5vbzM4VmpyNmRMVjA4QnduUnJvc1gvcGNVdkJVZlhwR3Z2NmQyQUNy?=
 =?utf-8?B?cWZiSjFicmRNajZRdjI1S2htRVR4MkFNOEFJcFZxNmFGS09nVjJ4NkluWjFI?=
 =?utf-8?B?b0ZFZ3lTSWVBR3AzMFR1bUFBenNENmVzbXlKR21HSU5MMTdLZy9hZFF5MEZM?=
 =?utf-8?B?REVEampWWjhqUEtMU3l2UEszc21zcTJBRytDZ0tabG1JQmZGQjFReWhEbHdH?=
 =?utf-8?B?WEtyWnkyNTBmMXJ5cXVWNmp1alhLOC8yRWsrckwwUE02MW8vZW9aU1NvQlll?=
 =?utf-8?B?a0dZd0wyN0c2YXMyMWcvTTZ5Q0Y3SllrZVBuUXA0bE9xczlYU25yZ2FmSnh1?=
 =?utf-8?B?RXVLR0R5aWRFRVBjN0d5U2EwT1BodnpkbDB4aEZrUjQremJKMVdJRW5YbTdG?=
 =?utf-8?B?SXp0bU9EbDNOM0ZNQUxkQVdmR21NeE9yekNWR3FJa05CTGlOOEk3Unc4VXAz?=
 =?utf-8?B?TGRscTFWbEltbURvQzRtTWVubEVNVzFOUWdOK0JmZVFBNnV6Yy9QMDFwNWMv?=
 =?utf-8?B?MlVFV21SSlZzVmxyWUdRVWJBa09sNzFmUGkwTi9GRW93WWhNRGxneGlkR0l3?=
 =?utf-8?B?Z0UyY2F0bFI4djg3eVpPeU1VYVVvNFNMQmhqc0VOdEtVemNOZnlYeThxSU1k?=
 =?utf-8?B?VFozdyt2eTRJNGViOERMRVdxQ0E1STJXMzNSb0EwaE9OMkFSUFQzWnlmd2ll?=
 =?utf-8?B?MWQ1VkhReEl2cTAxWXVyLzZLU21XZXpnbzNmOTU2cHlJZkE2d211V1JCRDRV?=
 =?utf-8?B?Y0hOVk9mVk1qVlROc0tKZndHZ05wdHZOb0g2SjJtMXVXKzA5azFiMUJ2NG1E?=
 =?utf-8?B?Q3RsNzl4WGRkaktKZVlJZmVXNmY2WjBsU05PNURNbmpzZXNQeGlPTHhwY1dx?=
 =?utf-8?B?TDllNGpoQkZWU012c3owL3NMTWljSzNOaFJsSVlxeHZGaFdzM2JIYTFZb3ha?=
 =?utf-8?B?S3h0RTgvVjUzeWMvQzVYZS9ibkJqWUJVeDBnM0JYcHRMdzdCUjU2TW1HUEx2?=
 =?utf-8?B?elArQU1RcWhQYXB2cFlITlc5clhqTnRlaXZHWEd4Zm1oV0Viakg2Z203SEt6?=
 =?utf-8?B?SUtSdWhMV1BtbENJN3UwMHcvbDMvOXB4ZFVYUGwraFppUnEwVHBoazlQRDBZ?=
 =?utf-8?B?ekQ4d3pjZlB6akFFZVM4cklMaXVhMGZhU01uME03NlVxaTdzQUtLSGxPVkZu?=
 =?utf-8?B?RW55Ly9xV3VYZ3BFZElVbVFHZG9yRDU1bWt5eGhwMnBUTWVuUmxwSkhVazh6?=
 =?utf-8?B?bGdOQzNsVi9rYkxyT2RJQjVEVWhpakQ4RGFJLzRUL1lZZXhTN3VvSE5YTWVo?=
 =?utf-8?B?RkllNkcrNDNxWkI3WjBNWkV1MGZxOE53WFY1S25VZytpS2NYa0hJa2V6TU9w?=
 =?utf-8?B?Wkh3TEk1OGxhMmR6UUFYTTF4N0d2V3hDdE5TVE1sV0JEZXFEV1JsRU5qaVZn?=
 =?utf-8?B?blBMWHMya0ZzOUtqUHpqWGEzc1h2emRiWlRzSG5jQjhLc3lacHFKSTI1S2to?=
 =?utf-8?B?YmRVS0hhVzZuK2NxS0JlRmdhYkVYSXdtTnVkb1JvRVhZazc1djRRZXZOdmN4?=
 =?utf-8?B?ZWpVK3lxWGlVbmc2bWNHenVJQ0RtTU1meUJIakhyZXczMzNPTllxWHpuMC92?=
 =?utf-8?B?NnVNWHVRVksrdEY3ZElBNzJTSUR5MGtFUTBDdXJSN3V4WkFjU1VITlVrN3ZO?=
 =?utf-8?B?djdSNGJOb1JyWDlJbENpWVJkZzFSNGpvcDhxQ3hLQnIrRGJFNjNjQi9JVDcx?=
 =?utf-8?B?YkgrRUFMZVNEZnYrVTRPUHhzZ0RscWtRVXlmdk1LTmt6REZCSTZxS3ROUDNs?=
 =?utf-8?B?eHpISmJRYW5qOXZTc0d2U0ZJQzByaXlXSXIwc1B0eUg4L0FaWXhBTmN4ZHNr?=
 =?utf-8?B?L01tVFZHVXlOM2l5Z1RYNGVheE96Y1dvOGlSc21FbTc3WnFYZ3lWbDdCSVRs?=
 =?utf-8?B?K3pCS0tZaysxNjFJbGJGQVVoc2NrTi84NVpJUTdxRDFtUFBqdnZoYmpHYlF3?=
 =?utf-8?B?ZHVLMy8xdHoyOTNyME5WV2ZQZ0I0dkFXbkRCemFKSkJ4eWQ3bEVPOXhHMG5r?=
 =?utf-8?Q?n1l0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YUlezxmiKACMRFKawGG2QQPFwRASntuuDEB2a8WP+FS4ARtVQX//6UHR3xDI5DeM3hekpGNFYQNolJgetYxZMFoqRkuio+lxu8zxO/Z96MLSdfGeOJ+nqUfvourhH4h7HESnomo+TDHiv93mWQuDGm+TTQPVwMp4bxG+S0bKIjQyXmCV9ndXl8Vp3wYyXxMiP6GQz92G21VbIxJDRFToSkbOx1bQqV9QC3l6Uo8tZos+JOC6JjTCSWItcrWEyCtb2PKVOK319+0IcaA0ksuHIIMx2vvAirERqpwGfOeai1ZGl8ruQVhL8p+2m8rVZEdriIHkwk26sw1eG1SE+jxzDNwuepzZIMtk3jJZeBv6s26Q7jnqDE6+z/2Dhjs2rYpHdXOEYeapTUsnyd5yIvx9yW2OZYFOOnqafEzjqywrRUhuDBPqzwOwnfsXGM6fNtePp/eEsSkqbyrtIHVVoa7j6ZbfZJO5s6zjnF/0WKjKH55cOvVXOS3zDCDred3JpRWjq4QO9dZKPRBH+AKqbR+EgHN3rm5UbBIDZbHPtYuQrvNFELR9UtqbxQXiGFuCKhY2Xy5PYttvFwTpLkm2/61HMLaJJVU62O9kc36Hwz7HS8gZ9BOZ4viYLKsMIDevih53
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917bf8e9-bddb-4c46-0e89-08de2d4a3306
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 00:16:23.9525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z62lPhUwXmPLgJUHS4OfL9s72/oqPCxD75+p4JldDr/Oj7uuOEt5UeOxOz5e7nDzMQYJD21w8t2hXAg8X7kuXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR13MB4913
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAxNCBTYWx0ZWRfX9Iamec+U957U E1RX4LPnd5I1KKgjXt+426vamd3wtUu0cW5K3IvK/thdLRaHsND/KovAbPjHRv80o3Iyaiqm/F4 j59kXzUbUNGcJmE+oxPC40sWYeemUYvul22aW/4EPo4x3rdNBM3yKOtIxKbPoQvQtdBCvVgysal
 P88QyYOykO2+Q31k09FKtUjkRihdWJoin0l4h3cksyFz5s+fESOB4Ru1JbEb4ZFtRVInAGtek91 gH9rK8CrxclaG5+H4KJfZrumIhHgbVj+ldxDPlT4OrZsxGDk7ESSTf0TD/HvYvqU7WUH001D/bq 31pQeK+hoe13gq0KgyMDccl8SjCLXxfF3s8DHeVTcENhYFwZMczE9tbLSw0N5CZkSL0i0Y+6qbT
 ebABEjWQVZxzbjYvZEeRleCG4kQDDA==
X-Proofpoint-GUID: CrI8Ce-m00Bs_XfQUbnbCvzln3n6Jwur
X-Authority-Analysis: v=2.4 cv=O9g0fR9W c=1 sm=1 tr=0 ts=6927985d cx=c_pps a=9FhzUGQqNQs6ZJfz/MkW+g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tBb2bbeoAAAA:8 a=z6gsHLkEAAAA:8 a=8o7UaKuQF1UoCeEya8MA:9 a=QEXdDO2ut3YA:10 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-ORIG-GUID: CrI8Ce-m00Bs_XfQUbnbCvzln3n6Jwur
X-Sony-Outbound-GUID: CrI8Ce-m00Bs_XfQUbnbCvzln3n6Jwur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gSGkgYWxsLA0KPiANCj4gT24gV2VkLCAyNiBO
b3YgMjAyNSBhdCAwMzoyNCwgRnJhbmNlc2NvIFZhbGxhIDxmcmFuY2VzY29AdmFsbGEuaXQ+IHdy
b3RlOg0KPiA+IE9uIE1vbiwgTm92IDI0LCAyMDI1IGF0IDEwOjMwOjUyUE0gLTA3MDAsIFRpbSBC
aXJkIHdyb3RlOg0KPiA+ID4gRnJvbTogVGltIEJpcmQgPHRpbS5iaXJkQHNvbnkuY29tPg0KPiA+
ID4NCj4gPiA+IER1cmluZyBlYXJseSBib290LCBwcmludGsgdGltZXN0YW1wcyBhcmUgcmVwb3J0
ZWQgYXMgemVybywNCj4gPiA+IHdoaWNoIGNyZWF0ZXMgYSBibGluZCBzcG90IGluIGVhcmx5IGJv
b3QgdGltaW5ncy4gIFRoaXMgYmxpbmQNCj4gPiA+IHNwb3QgaGluZGVycyB0aW1pbmcgYW5kIG9w
dGltaXphdGlvbiBlZmZvcnRzIGZvciBjb2RlIHRoYXQNCj4gPiA+IGV4ZWN1dGVzIGJlZm9yZSB0
aW1lX2luaXQoKSwgd2hpY2ggaXMgd2hlbiBsb2NhbF9jbG9jaygpIGlzDQo+ID4gPiBpbml0aWFs
aXplZCBzdWZmaWNpZW50bHkgdG8gc3RhcnQgcmV0dXJuaW5nIG5vbi16ZXJvIHRpbWVzdGFtcHMu
DQo+ID4gPiBUaGlzIHBlcmlvZCBpcyBhYm91dCA0MDAgbWlsbGlzZWNvbmRzIGZvciBtYW55IGN1
cnJlbnQgZGVza3RvcA0KPiA+ID4gYW5kIGVtYmVkZGVkIG1hY2hpbmVzIHJ1bm5pbmcgTGludXgu
DQo+ID4gPg0KPiA+ID4gQWRkIGFuIGVhcmx5X2NvdW50ZXJfbnMgZnVuY3Rpb24gdGhhdCByZXR1
cm5zIG5hbm9zZWNvbmQNCj4gPiA+IHRpbWVzdGFtcHMgYmFzZWQgb24gZ2V0X2N5Y2xlcygpLiAg
Z2V0X2N5Y2xlcygpIGlzIG9wZXJhdGlvbmFsDQo+ID4gPiBvbiBhcm02NCBhbmQgeDg2XzY0IGZy
b20ga2VybmVsIHN0YXJ0LiAgQWRkIHNvbWUgY2FsaWJyYXRpb24NCj4gPiA+IHByaW50a3MgdG8g
YWxsb3cgc2V0dGluZyBjb25maWd1cmF0aW9uIHZhcmlhYmxlcyB0aGF0IGFyZSB1c2VkDQo+ID4g
PiB0byBjb252ZXJ0IGN5Y2xlIGNvdW50cyB0byBuYW5vc2Vjb25kcyAod2hpY2ggYXJlIHRoZW4g
dXNlZA0KPiA+ID4gaW4gZWFybHkgcHJpbnRrcykuICBBZGQgQ09ORklHX0VBUkxZX0NPVU5URVJf
TlMsIGFzIHdlbGwgYXMNCj4gPiA+IHNvbWUgYXNzb2NpYXRlZCBjb252ZXJzaW9uIHZhcmlhYmxl
cywgYXMgbmV3IGtlcm5lbCBjb25maWcNCj4gPiA+IHZhcmlhYmxlcy4NCj4gPiA+DQo+ID4gPiBB
ZnRlciBwcm9wZXIgY29uZmlndXJhdGlvbiwgdGhpcyB5aWVsZHMgbm9uLXplcm8gdGltZXN0YW1w
cyBmb3INCj4gPiA+IHByaW50a3MgZnJvbSB0aGUgdmVyeSBzdGFydCBvZiBrZXJuZWwgZXhlY3V0
aW9uLiAgVGhlIHRpbWVzdGFtcHMNCj4gPiA+IGFyZSByZWxhdGl2ZSB0byB0aGUgc3RhcnQgb2Yg
dGhlIGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBjb3VudGVyDQo+ID4gPiB1c2VkIGluIGdldF9jeWNs
ZXMgKGUuZy4gdGhlIFRTQyBvbiB4ODZfNjQgYW5kIGNudHZjdF9lbDAgb24gYXJtNjQpLg0KPiA+
ID4gVGhpcyBtZWFucyB0aGF0IHRoZSB0aW1lIHJlcG9ydGVkIHJlZmxlY3RzIHRpbWUtZnJvbS1w
b3dlci1vbiBmb3INCj4gPiA+IG1vc3QgZW1iZWRkZWQgcHJvZHVjdHMuICBUaGlzIGlzIGFsc28g
YSB1c2VmdWwgZGF0YSBwb2ludCBmb3INCj4gPiA+IGJvb3QtdGltZSBvcHRpbWl6YXRpb24gd29y
ay4NCj4gPiA+DQo+ID4gPiBOb3RlIHRoYXQgdGhlcmUgaXMgYSBkaXNjb250aW51aXR5IGluIHRo
ZSB0aW1lc3RhbXAgc2VxdWVuY2luZw0KPiA+ID4gd2hlbiBzdGFuZGFyZCBjbG9ja3MgYXJlIGZp
bmFsbHkgaW5pdGlhbGl6ZWQgaW4gdGltZV9pbml0KCkuDQo+ID4gPiBUaGUgcHJpbnRrIHRpbWVz
dGFtcHMgYXJlIHRodXMgbm90IG1vbm90b25pY2FsbHkgaW5jcmVhc2luZw0KPiA+ID4gdGhyb3Vn
aCB0aGUgZW50aXJlIGJvb3QuDQo+ID4NCj4gPiBUaGlzIGlzLi4uIG5vdCBnb2luZyB0byB3b3Jr
LCBJTU8sIGFuZCBtaWdodCBsZWFkIHRvIGJyZWFrYWdlcyBpbg0KPiA+IHVzZXJzcGFjZSB0b29s
cyAoYXJlIHByaW50ayB0aW1pbmdzIGEgdXNlcnNwYWNlIEFQST8pLg0KPiANCj4gSSB0aGluayB0
aGV5IGFyZS4NCj4gDQo+IEFub3RoZXIgYXBwcm9hY2ggd291bGQgYmUgdG8gZGVmZXIgdGhlIGNh
bGlicmF0aW9uL2NvbnZlcnNpb24gdG8NCj4gdXNlcnNwYWNlLCBhbmQgbWFrZSBzdXJlIHRoZSBl
YXJseSBwYXJ0IHN0YW5kcyBvdXQuDQo+IEkuZS4gd2hlbiByZWFsIHRpbWVrZWVwaW5nIGlzIGF2
YWlsYWJsZSwga2VybmVsIG1lc3NhZ2VzIGFyZSBwcmVmaXhlZCBieQ0KPiAiWyU1bHUuJTA2bHVd
Ii4gIEVhcmx5IG1lc3NhZ2VzIGNvdWxkIGJlIHByZWZpeGVkIGJ5IGEgcGxhaW4gaW50ZWdlcg0K
PiAiWyUxMnVdIiwgY29udGFpbmluZyB0aGUgcmF3IGN5Y2xlIGNvdW50ZXIgdmFsdWUuDQo+IFRo
ZSBwcmVzZW5jZSBvZiB0aGUgZGVjaW1hbCBwb2ludCB3b3VsZCBtYWtlIHRoZSBkaWZmZXJlbmNl
IG9idmlvdXMuDQoNCkkgdGhvdWdodCBhYm91dCB0aGlzIHdoaWxlIEkgd2FzIGNyZWF0aW5nIHRo
aXMuDQpJdCB3b3VsZG4ndCByZXF1aXJlIHRoZSBleHRyYSBjb25maWd1cmF0aW9uIGZvciBNVUxU
IGFuZCBTSElGVCAod2hpY2ggd291bGQgYmUgbmljZSksDQphbmQgaXQgd291bGQgYmUsIGFzIHlv
dSBzYXksIHZlcnkgb2J2aW91cyB0aGF0IHRoaXMgd2FzIG5vdCBhIHJlZ3VsYXIgdGltZXN0YW1w
LiANClRoaXMgbWVhbnMgaXQgY291bGQgYmUgZW5hYmxlZCBvbiBhIGdlbmVyaWMga2VybmVsICht
YWtpbmcgbW9yZSBsaWtlbHkgaXQgY291bGQgYmUNCmVuYWJsZWQgYnkgZGVmYXVsdCkuIEFuZCBy
ZWFsbHkgb25seSBib290LXRpbWUgb3B0aW1pemVycyB3b3VsZCBjYXJlIGVub3VnaCB0bw0KZGVj
b2RlIHRoZSBkYXRhLCBzbyB0aGUgb251cyB3b3VsZCBiZSBvbiB0aGVtIHRvIHJ1biB0aGUgdG9v
bC4gIEV2ZXJ5b25lIGVsc2UNCmNvdWxkIGlnbm9yZSB0aGVtLg0KDQpJJ20gbm90IHN1cmUgaWYg
aXQgd291bGQgYnJlYWsgZXhpc3RpbmcgcHJpbnRrLXByb2Nlc3NpbmcgdG9vbHMuICBJIHN1c3Bl
Y3QgaXQgd291bGQuDQoNCkFsc28sICBJIGZpbmQgdGhhdCBwb3N0LXByb2Nlc3NpbmcgdG9vbHMg
b2Z0ZW4gZ2V0IG92ZXJsb29rZWQuDQpJIGFza2VkIGF0IEVMQyB0aGlzIHllYXIgaG93IG1hbnkg
cGVvcGxlIGFyZSB1c2luZyBzaG93X2RlbHRhLCB3aGljaCANCmhhcyBiZWVuIHVwc3RyZWFtIGZv
ciB5ZWFycywgYW5kIGNhbiBkbyBhIGZldyBuZWF0IHRoaW5ncyB3aXRoIHByaW50ayB0aW1lc3Rh
bXBzLA0KYW5kIG5vdCBhIHNpbmdsZSBwZXJzb24gaGFkIGV2ZW4gaGVhcmQgb2YgaXQuDQoNCklu
IHRoaXMgc2NlbmFyaW8sIHlvdSB3b3VsZCBzdGlsbCBuZWVkIHRvIGhhdmUgdGhlIGNhbGlicmF0
aW9uIHByaW50a3MgaW4NCnRoZSBjb2RlIHNvIHRoYXQgdGhlIHRvb2wgY291bGQgcHVsbCB0aGVt
IG91dCB0byB0aGVuIGNvbnZlcnQgdGhlIGN5Y2xlLXZhbHVlZA0KcHJpbnRrcyBpbnRvIHByaW50
a3Mgd2l0aCByZWd1bGFyIHRpbWVzdGFtcHMuDQoNCkkgY291bGQgc2VlIGRvaW5nIHRoaXMgaWYg
cGVvcGxlIG9iamVjdCB0byB0aGUgbm9uLWdlbmVyaWNpdHkgb2YgdGhlIGN1cnJlbnQNCnNvbHV0
aW9uLg0KDQo+IA0KPiA+IEkgYWN0dWFsbHkgaGF2ZSBhIGNvdW50ZXItcHJvcG9zYWw6IHRoZSB0
aW1lIG9idGFpbmVkIHRocm91Z2ggY3ljbGUNCj4gPiBldmFsdWF0aW9uIGlzIHVzZWQgYXMgYW4g
b2Zmc2V0IHRvIGJlIGFkZGVkIHRvIHRoZSBwcmludGsgdGltZSBhZnRlcg0KPiA+IHRpbWVfaW5p
dCgpIGlzIGNhbGxlZC4gQSAod29ya2luZywgYnV0IG1heWJlIHN1Yi1vcHRpbWFsKSBwYXRjaCB0
bw0KPiA+IG9idGFpbiB0aGlzIGlzIGF0dGFjaGVkIGF0IHRoZSBlbmQuDQo+IA0KPiBPaCwgdGhh
dCdzIGEgbmljZSBpZGVhLCB0b28hDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIQ0KIC0tIFRp
bQ0KDQo=
