Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DA4A59
	for <linux-embedded@vger.kernel.org>; Sat, 23 Nov 2024 23:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732405082; cv=fail; b=VuaEBRfK7r7/lXDisLs9PXCucv7x1/E9WKpQFiZdyjN7dGM0AnPjIWuV/V7KPrLi6g3ZWzaS1SCr3refqNnZwydG4rAUWkUje/qJZO31mIEU2BsSr/ssYa2p0R54sjUxY56kqLciSTLhLAomgv1wyMxzXECxNwSQX6BqFrldwfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732405082; c=relaxed/simple;
	bh=XmEm660ftRLkzKENR7tOWK1o5HHORs6G/18j52pAXMw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PrAhDm81ySwxCFGfkLFpU6XmKA3RhwRW4kAM8F/tGz5Acsk6eyMrM7gIUMJq8tOgPkkOmDccjDMrg3AdLDwIY7RxaFLgGVW/UgiI/DIQt3yVX7q3Wpq3gcdBOxIegD7n8Xs9xq4CvilMpG8f8dkkg22ZYi5n0bQHAPZvDUeGmjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=YfJix79C; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="YfJix79C"
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ANNZ2PS029510
	for <linux-embedded@vger.kernel.org>; Sat, 23 Nov 2024 23:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=PHi7OkJ
	6wgAD/mLo8ANVbpXdDUxiyzXZRxXM547Hvfw=; b=YfJix79CTcIVm6Nu2Y3eUvE
	JJQV7xHY9duT/x43IkkW8xpCbSbv44UWYYuQrkQ5fe1prDzyyzzO56GDiRyGAAPM
	M+Cx6MGXz5hFx7NjFB2dsSnHHdXlKMzfEgnNqr5knueB047723bg6CzK87AeZ89b
	w+3wsnZWIbt9j6fOoxTWd19TD4h4WVbM9CaaecZAd3dMORKWLIpkP/KU5KwEaZoS
	ZZHQ4ol6R7T/SeHQgm2neH0ZZY+Ko8SxXYPTzrmhcOmb7U3z23LVPBr6WbChr7UG
	7JQ5XbSspD0jHC/GuLijHUU8rqFzXbKbVQngScOoz+yM8tsrneCwQRrgLFNot/w=
	=
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 43387hgegd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Sat, 23 Nov 2024 23:37:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhQzapi48JOHQmeeH/fMl4JANVqXOrO/8KDq422JC65tKvEis4r6sFkfbIQbuiI7qptYCkT/MVwjHRST+S6+DnmC45zjoUJULzGvg3Ts14BNg4p2C0KcdanFcpK8d68bu6YXo1irNjjKMjqQglrrjHrFMhcGH07BP9nCMLauLuHbjFHsRtG9JCCeH0gwwT2HOnJyEZCzwuYoMpHOmSzmxSBqw1hVYRvURt8Df4q8BBcbJ/B9HgDFSZ+iPi16hehEXTSrGVkE0TSo2ZbgXCb5g02jiSsj8UbUBwBX5X8ACJCY6p9EVJRWms5RpHFjCL7yNm5xqB6NH9hI+w3sGOLW4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHi7OkJ6wgAD/mLo8ANVbpXdDUxiyzXZRxXM547Hvfw=;
 b=GsXOBMa6/eUYWsN9Lw1kd5+CPRKniX+NecN9m9mq1d/g/iCB3IUUH4xsZ2n3cLOCA7H0pfHxb1CKNKGz4lPq9l1b2E1ikcPckcVrSIsCBRzjGUg7z8vMo3BZ0cGfx5M5IGuYTAYVewb1zReVr2d0KeXzi8X92rdEim5iKjQR7wE1cXzDbudwdVsm1oXWQAsoF65kGXg2FEGfNT82uzcbyi1kEjtB5+kpZ/k+15uNXIJHhkFlc8/PyIqnAYb+kBbS7Qf9SNHlIuo9HmfGgHYZx6ODPuvppg0o1jscjYlf65ptJfD9G++I6EkOiuZLoMtgIkHqIySv3np2EMT3ESEkgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by LV8PR13MB6744.namprd13.prod.outlook.com (2603:10b6:408:221::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Sat, 23 Nov
 2024 23:37:47 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%6]) with mapi id 15.20.8182.018; Sat, 23 Nov 2024
 23:37:47 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "Bird, Tim" <Tim.Bird@sony.com>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>
Subject: RE: [boot-time] SIG organizing meeting
Thread-Topic: [boot-time] SIG organizing meeting
Thread-Index: AdsyNUUDzZQ/3++gT1+/YcIfOX+G7QLyQIqQAACOcxA=
Date: Sat, 23 Nov 2024 23:37:47 +0000
Message-ID:
 <MW5PR13MB5632A3D7519F856A98739CB9FD2C2@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <MW5PR13MB5632D59CC8D54682BE6EA092FD5D2@MW5PR13MB5632.namprd13.prod.outlook.com>
 <MW5PR13MB5632E7C5AEDF8AAC82EF8192FD2C2@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To:
 <MW5PR13MB5632E7C5AEDF8AAC82EF8192FD2C2@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|LV8PR13MB6744:EE_
x-ms-office365-filtering-correlation-id: 981c9736-20a7-439d-335d-08dd0c17d619
x-proofpoint-id: d8690225-876f-412f-87c6-a7cb45557a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tq8+AhXQxD//OzGwwtewO/I5cdPB0VjNHi5ivMBgnYWOu/HRwzYaweWXwcCb?=
 =?us-ascii?Q?RgPTciUwtz4zyNccZ2eRVFWoa82Hu67QARWcgBxaaA/ghO7PPPZ4yjIWYLc+?=
 =?us-ascii?Q?VzcZ4vWvvwBeB3hUl5e0j+Iho7EKy59CZFZzjPhUsxEkUwtSeC0o5S35S68x?=
 =?us-ascii?Q?n9XyCwUcZE2puaUruIWbrc0Or8hkVe06teBy+HTqz+SrDXRknooDKPJPP36d?=
 =?us-ascii?Q?uhqTIVcYIcHnccVc2yQAAfwWTlJM5h+JakX9sPDZa2L0/B0c0gYv0zl2rRfb?=
 =?us-ascii?Q?wRxD2TtsW6OkxlhCX2WNQCy3DZHJhLxac3n66iFXeRjRrWxED4YrgXU6nhGw?=
 =?us-ascii?Q?Myc5peFmgu6qMXL7SWGV/+FYs7v82af5hkaa8qwCZOwL6aRjkSEBmruo04VH?=
 =?us-ascii?Q?RoOmWtJug7RyQ51LiVE9hXd3kLOPeTN5zFpchFbpg3Nwmhxzq2p9w2EGATDQ?=
 =?us-ascii?Q?R1Iz+1dHD2m/W71ZZ1fZwYPRm667UOOfcWaDLzAT+I2H+RFNjkTbRH4pqDk8?=
 =?us-ascii?Q?RWH7qOO9LELTKs619hDwfOiC1I2e2cmy+Fagvq4O5I+RUNT5yI9wgsBBWbo8?=
 =?us-ascii?Q?hehm8VuW046pHxDJcF/RC7gtZ5hUtm6Qvvy8nY2ALSoqMnJ0SeIM5NTvf40m?=
 =?us-ascii?Q?8xU1M+3kuZ8wjL2+T0TK92v04GsBlIxUqObdZL7MCsqs7qyJRm2MJ1De9Npe?=
 =?us-ascii?Q?qv90mKsVSOvbOFe5XVc8dBckQPOAS+30Qzi5frNncQtau2gvXmzAY13vaNfb?=
 =?us-ascii?Q?M8B8NdxhEyv8BSc5X+ApYI6xn+qhNtZ6TBV1lY1+Ho054mCfde7whEx+ad2k?=
 =?us-ascii?Q?ghMUICJpf+JVRlkfOj+H9wGvJY9mAaB+Ojifhm57uQGiyBArzTeiPAlHrX/q?=
 =?us-ascii?Q?rmKC16I6Ji4P9CTIadFqR7CUHt/ou8ak8bc3YwaWMWlzlvYfcRzUgRXk8iZP?=
 =?us-ascii?Q?oNWwAGoueVbZRu2ZFDCNyIOs4kbafwT6QhNGNQsm1w1246guijcc5Gz2OhQz?=
 =?us-ascii?Q?Zdtfm1CLjjcjiRZmXejrUds7W/h+YAejt1zIdPu7jh3xBlwXeSaVs1w2h1J3?=
 =?us-ascii?Q?4dlm61swFdqhSY+/GJFgtjrFq7roaVk7Bt8wPfKg/nn8C5X6AXbRJhGaDrL+?=
 =?us-ascii?Q?mo1IxroZGVK+Gb6uN5U0eZjAkZp7T+785FscjO9aIufV+39yiLHrYLscyo7W?=
 =?us-ascii?Q?XTiG/X97B4jUXmtOtLkbfaHnNCZY+ECMH/EYkfaagIeOoChH/7gFaMI+wGRJ?=
 =?us-ascii?Q?ni9+liSfUC13L8VA5Y8in2xOdD3gyQeXCuoAGWX7zJFGSuf/Ke4S7C+nqIge?=
 =?us-ascii?Q?FhgOGzVuYrni9D1IjPKfU2q6Y6FNjOcCnPbnMNxMSNDgvHmmO1+tOWlRThCF?=
 =?us-ascii?Q?h6sed+E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4XOnNVsT1xujEHrJ6xBwjXy+lRKvH7K/vDF0HRILsMCsEFE9wQATu44ZwwZr?=
 =?us-ascii?Q?nlHWW9P3LsNhWQ/V7Ir3ftP8CgvGYX1V6ioeraTQhV6B0OMopPAQ/nBkEw16?=
 =?us-ascii?Q?2Swfy2utUkoRh3u6IIQP6TEZJcGjvW3it3UvPlqefgHa8QT1cQKFBurjRk71?=
 =?us-ascii?Q?TnpVop5qhjBr7pHFZHk7RphghzWi4CXmwksDyQ08Anj/JQBfAkxbBY2l7TCk?=
 =?us-ascii?Q?B5XBdrmEqgfC+v1zkYqciT0lgYkBQkqibe6jiWBUnCHjMC5Zd0YGD68bzTnu?=
 =?us-ascii?Q?iPG8EP35XWejKW5eeNnPJ+CMTHKEkTZEoObceRaaXI+BlR5n8fHURnTy+3g0?=
 =?us-ascii?Q?VotSOrEmzKvyFGxkzclKTxpdkMM4uzzCvIlruiQyUPVv4XHBvbI28Ol94ctq?=
 =?us-ascii?Q?xXik4tZ81Cq0es7zih5vjohk7xajPjk0ZC6myrefQ+HTmZlXUB63j3xIjKL2?=
 =?us-ascii?Q?W6/SXcKxeDkGidorkFwvgGXvQOiDepzmBQWeBOrerlpNMBmzNC1GZm3re8aB?=
 =?us-ascii?Q?wkkYY9JtDpseO4W/TEJYMzafADCD331LuGd1hZrqvGqIKlny39MJyYbBStj/?=
 =?us-ascii?Q?X7pzJS7CY0hUBYqwDpBowLc8E6+5xOy2L78cfFAh9asLEf/3Zess2aUUZZnB?=
 =?us-ascii?Q?m0X8XPMdFcwIgQ55Fjb1X6xYNYV74X7PvC7jN/c/iKG9EMX5wfi1DXEgL7C0?=
 =?us-ascii?Q?ofB2fBwYeHAaez8D+zV0sLYqDKlXeo+X5uxvVzc2DwQNEH8CCGZTfDuErT3+?=
 =?us-ascii?Q?FezJUQTaIyFVmHllFcCh4QOkCpBzpGcuPGT6sru46KG9rppIFU7yvGEPc0AP?=
 =?us-ascii?Q?EIndp0ffSAyN5EGtaXTS/VO8H571nz0lxevRsqjWjFRkIjxSdSPc06cyPevc?=
 =?us-ascii?Q?RzO6kUoUnIEwqSsziB1iFRqpMfgHgRHISJTY/97a+Oxqn8UBxekac1SoRax4?=
 =?us-ascii?Q?uu/OP7Z3UZFXVISfhzB9PiW5jNOwdn+JtVIpGMmVZq2luDZy9dy7zTcdwBr+?=
 =?us-ascii?Q?geQcaqll1nCInw6ITB+32LJYYNEM3w1pH11qmuYgRmuTRaLT0/0eCkd8q9p2?=
 =?us-ascii?Q?0ukQVxLtEEP82B4SueUA6qq+S5P2qPYAaQ4FnvGyv7xsCC4sC08goVed1Th8?=
 =?us-ascii?Q?0X8abNvcjntpBs7yp7cwovNWltLDVl2BaYVxN72uZYCunUgQMs8zC4wMeZnO?=
 =?us-ascii?Q?1xe6rGEYh1ijEuWgaLGnH7L2iRll6avr6URCfb7zDdpZ0UlVk6p20mj43Z+v?=
 =?us-ascii?Q?JqED4dJQMVSrZhiQ7aisWjm64FoG1k5kRg/BtKGm70aJTfIgFMS321E5oEZp?=
 =?us-ascii?Q?0VNCDj+mJAIkHdf/VhPB72IDXhMcyajMCWuFHAtaNOvX4hQiiUd3x0idYCEG?=
 =?us-ascii?Q?dRXxKCk4WHOm999Wdzx/ImJd+rtgSyruvVAeF90b7hwub2TBJ6uKqQtjS9cg?=
 =?us-ascii?Q?to3bq1jzvu1VY10+Eim0qUKwNdOpznHlxGfdep9vGjeSNt0fPcAo1i7xMAK5?=
 =?us-ascii?Q?2Rx8Mxb3IX3EkMCemet5GRCr6+I4cKqIOOOMcB8hbgjrgXQkKJ5rL9SFo8u+?=
 =?us-ascii?Q?cCwf0zGtpQEKTaNYhso=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0EVUZ/2cFSkrlCtd/tihQLp7D3U8bKdrKZCv/Kx0HnrtssayZJ4K2/BIBlYUFzL99GYcbSW3VlTerjrn6vUoF6AsWdAuwiWn3GH9aV9zkeyw0aSRPk2TtWqP3Qgj5+A2MdWP5CIxxJL+UQ9th1fma4tOSHR8oUhuB4Lny9WXN49VEURuu1x0yT5B0cWEVKd/T9MUSKkcqH3LkBGxnBLYTgEH3FU2V32fzA1CqPkl7B22+2HVAqUaziaNbo3xh626G3SXRk0gNmnrT0vcuZl4B+QAfekSDnfUC5M9dTyio/tooYIBHOcJ/t9aKcENhTeOQN93WlG6ifhHAJI4XWbD263tTYIDXaY1PTTE8JZHTby7OgQ/V4IFR0hL+Xld4EWA+jnPiEtiIK9R/WxapT3omAQ5Nk7NttZTnyYV7Q48mVzkN2tufSrqArgsHyhexoV6EltMiberj73J+3QykNXEgLCJpQs8ex5ZY4uZckj//YyfLCBbJf+dF7y8jGds/mHAdzIuA1s0mlyPl0K3CrBU+GMUGfExWxiksLZ+8Y6T46aU2XkffQrTLFmO8v9IfbVCsxDWXcsnktjM1rY1zwy7k2B3A6eaanY18TQoZ4Kuml+PWkuvuExc0RBQYDcxrFhJ
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981c9736-20a7-439d-335d-08dd0c17d619
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2024 23:37:47.1699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xus/XzEv/xoCilMa2WZr+QzEcbNdkB92NNfACiRT7YXTEQWyiyFo0sIkllPB7EDgLHGCWuFYZESAPAGKHUwxkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR13MB6744
X-Proofpoint-GUID: 2EOceE-gbgyRYFv1JBcC2s-NlArMU7hz
X-Proofpoint-ORIG-GUID: 2EOceE-gbgyRYFv1JBcC2s-NlArMU7hz
X-Sony-Outbound-GUID: 2EOceE-gbgyRYFv1JBcC2s-NlArMU7hz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-23_19,2024-11-21_01,2024-09-30_01

I swear I proofread this multiple times.  This video/conference call is
planned for Tuesday, November 26th.

> -----Original Message-----
> From: Bird, Tim <Tim.Bird@sony.com>
> > -----Original Message-----
> > From: Bird, Tim
> > It's about time to plan our first meeting of the Linux boot-time SIG (S=
pecial Interest Group).
>=20
> Hey Linux Boot-Time SIG interested parties,
>=20
> Here is the information for the first Linux Boot-Time SIG conference call=
.
>=20
> The meeting will be held via the Jitsi online meeting platform.
> Here is the connection/call-in information:
> ----
> To Join the meeting via web, click on:
> https://meet.jit.si/LinuxBootTimeSIG
>=20
> To join by phone instead (in the U.S.), tap this: +1.512.647.1431,,333758=
4763#
>=20
> Looking for a different dial-in number?
> See meeting dial-in numbers: https://meet.jit.si/static/dialInInfo.html?r=
oom=3DLinuxBootTimeSIG
>=20
> If also dialing-in through a room phone, join without connecting to audio=
: https://meet.jit.si/LinuxBootTimeSIG#config.startSilent=3Dtrue
> ----
> I will start the meeting at 9:00 am Mountain Time, see this link for othe=
r time zones:
> https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2024&mo=
nth=3D11&day=3D26&hour=3D16&min=3D0&sec=3D0&p1=3D220&p2=3D
> 137&p3=3D195&p4=3D771
>=20
> (That makes it 8:00 am Pacific, 16:00 UTC, 17:00 CET, and 21:30 IST)
>=20
> We'll plan for a 1-hour meeting.
>=20
> The initial agenda will be:
>  - governance of the SIG
>  - projects to pursue?
>  - frequency of meetings?
>  - what resources to use?
>  - where to put things (besides (obviously) upstream)?
>  - how to collaborate?
>=20
> The meeting is open to anyone.
>=20
> I look forward to talking with you then.
>  -- Tim
>=20
>=20
>=20

