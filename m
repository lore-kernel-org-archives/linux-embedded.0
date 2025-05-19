Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F4526E164
	for <linux-embedded@vger.kernel.org>; Mon, 19 May 2025 16:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671610; cv=fail; b=OnGSWIHVFEZELzdFJ1ywNd5aWMmKgl9jLPPx8LA1IY1cbGaIJhcuRMi3BhfhUWxAtWMAFYJnlTzkzgCJdtkPpENYQnhG45LuTjzhhnByFjcrUgi6MT8So4ZTmhZ/wVhKesyXq2MmSLxCuXLZ5z61afKzm8mzvgdgM6xCMqSswRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671610; c=relaxed/simple;
	bh=+AojPd2tURJt9VzzRx1zsFHP2PZxWHlbzo3r5mAYnqQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Nx7B+b/mDXZ3zA8p8GQk3nwdY6+z6LWvL+TKAr/5gYao5luYqWDx5iCb13XqxHgLtjoDYhiidbcoHhxVMaVyyQNnJKDCeOGx+4BMMLnjFfr/IhLz0Ux+4zBrlzHVyvMuYS+NGCf5dfFg+1hhNWKgmtqduxWckhknW2OWGiNoJ2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=NVBxmIUl; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="NVBxmIUl"
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JDvRNu006504
	for <linux-embedded@vger.kernel.org>; Mon, 19 May 2025 15:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=pV1RQok9mYEC5IkKhvdMnmyr9orGl
	F13S9KmOSjpzLg=; b=NVBxmIUl1n0fH8QI3mDrSigmWFizaEw5H0XSmTAt49CRL
	JHbCfQxWVoGgYufix9UcxtQZsnFdCmCb9Zsn7l+8KNvYCJimWOfO3Ral5Q30VwFv
	bncML/QF31VOCCyAZ7GanHvYG+kqGm+f2PheeRlMoTFk88iHdBH7LyeGnxaPRUqO
	CAp+XffBVo/2dpNX3Hse+wD0QNOKnLmyvsxvVlrXYauelOQ5dQm7/z6vVW2eqrmy
	zZ0+ziR5RlQFOe1K6E0fmb+4eZki/G8k4IaPl0PdXQGt8jJ64ytMBHaPqsXa3KT4
	NuMEw6zrMVO2mNaw8DPaFoABf7AKqvV8yuqCyip7w==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 46ph851nkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Mon, 19 May 2025 15:58:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otgvegH/7OBAiTT8Ih9/CnQu5t14ZgYjXXXfV6KbOcnf6PGVeXy+VUUpDdiz3j8j8nY3Dz8HJk/V/7FS6/3YxyQudGab9yzyz/5/VxmvjfSFg5/jttVYyWqpOLnmb2grg8gSjiAIn+1jIOk3YzmcAF64pB7BUifOWWPeymBQWJBXfKUsvNVFTM1h339zfQymyJOTyUYDJfu1DAkXQyU7BZe5QA+pDT9Vpkhr4b+u5BaL4gNCyy7MLETHJmM9GOKK4xS7aUeGmXlQsgO4hx9dM6Hy+MyaWEmRTS5MFSabGDu4ZyhRV87RzRETinHQVRgKx18fNCxacsW0vcoiIpnvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pV1RQok9mYEC5IkKhvdMnmyr9orGlF13S9KmOSjpzLg=;
 b=iyFF2D80TvM7cWkbN3mqlCboM9cHjHuNhwtOhr/e4BkWMFBvcpv5qpbB66XsKWJJ8YjKM+qgkLfgsbfrJ46ixs4cuuRVabqwxRGJcTzMaKCRq5e9C1m+Q5yiliOVhLGxUOYgiuqo19EAIPhiN7+WDD2Aqd5TgL/8bPfr5DV9H+9iqTG1YNK1xlpHt9U54wf1UDXec/mSp1kJGPz6O/MYdmlcS5Fd4UrhoZUMvLyeO7tV4lyvFOuXqpwYIh+Y+3W5NbJALw0YWi7LbDGZcN6s0j6P6LDEleWnCTe3QNOKIfEngPS2EOWY+KBMDUYxH729cGnj/Qghgmkgamf2MduaZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by BL0PR13MB4466.namprd13.prod.outlook.com (2603:10b6:208:1c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 15:58:22 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 15:58:22 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: [boot-time] Unified Boot Log - special topic call for Boot-Time SIG
 (meeting announcement)
Thread-Topic: [boot-time] Unified Boot Log - special topic call for Boot-Time
 SIG (meeting announcement)
Thread-Index: AdvI1ps725/tFCwOTFW4FBYefrI1Ag==
Date: Mon, 19 May 2025 15:58:22 +0000
Message-ID:
 <MW5PR13MB5632B8FA3279D77F2F9217BBFD9CA@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|BL0PR13MB4466:EE_
x-ms-office365-filtering-correlation-id: 81dcac09-f539-428a-5621-08dd96edfb70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KLbx81bWchp9ZH6+uhk1ukl3joScGm3F1jH7+Z9P3fWH/psDwHr7uKtBIUUu?=
 =?us-ascii?Q?vey8ALVFDiAL4p76cojR6ifgm55wHv0jJuilmhHOMbooZmsFu1PEOK79oFFG?=
 =?us-ascii?Q?Oc9RK7W7hJBR6EpDux1CnKQu/RApYPsffn2nvJm0AFZDfHV0BxdMeHOaBS5n?=
 =?us-ascii?Q?/yKynLjFWM6DWjzBvIWERcGYF+sRRiWEXHA2l0ixtAyUaHoF6q9a/2xRZ+45?=
 =?us-ascii?Q?STOWFFpdc01cpRDxCVUUs3yf76yXRXhQ16r2on/5ISkykN5/uPh4C8QNNbme?=
 =?us-ascii?Q?qjIu1gOvKAU9sniNNDIbOtLFBFlt+kVeAa7OZjMa9Z/fmLnHleZvR+4Xbe3V?=
 =?us-ascii?Q?R7BspuoUwCvbaz6sK68BYBy+miHUAYnoo93n1y9TPgqP+BnzPljZUnwq59O2?=
 =?us-ascii?Q?TWUatzMrsOhEefp8hVlGKpP4Zh1NcXAN0fi7DWo3+eFRt/qb7s2eLq40PbIk?=
 =?us-ascii?Q?qtDAievvUTgmUcBuLANXWPnaknH8Xl1SxphQKaYAp9GTPuo1cHVrfBkcFZfh?=
 =?us-ascii?Q?81FepZLxWP/k8+uxUjsBfXC3Lzzgitq/2VX0D5W7olrtVzhgWOIiYFMBw5YB?=
 =?us-ascii?Q?fTPuu5bqRSjQSQfK7JXJ4p1IsfhExC0z/ZM095LZGs2xLEgbk8ek5iKFvoZ+?=
 =?us-ascii?Q?lhDGWXxAUjfNOkbZ6tJ2TbqSGR84nYAgxh5HIPmay5YbnLxwPyvYiakZf8mT?=
 =?us-ascii?Q?GxL07GtL+sqnGj0KsJRx8MGCgRzEk5GzHBU/tx+EXjA2p+AP8ASQAAstARwc?=
 =?us-ascii?Q?HxnqHXvmDpwBOOYQjHkLUV9+jyrMluvO711xMU3M9oh9KTNQYTVVTkin31X1?=
 =?us-ascii?Q?WUoFnGx4+fbcOTXABLsdCWXckxwOA87eBTMjEv7vqMTpr6iskyMg87eRKc8T?=
 =?us-ascii?Q?5pkbUzV+7yMukpeFMobkdS9pfjhMwIu7gjje3zAJKxWqg4kjwpiOEqdRjSXp?=
 =?us-ascii?Q?CwwqbsULam6wfuQu+/bpIWArpGh//gWVfG3zjNE0XwXlkUuuTXi6yACSk7W2?=
 =?us-ascii?Q?a+D1WtZpFF0KduEFE1CN+hfXfql2ab61jGwq6dY+WjOndN21/KIE6Pwnilnp?=
 =?us-ascii?Q?/s7d8+B7TLZw9RoNx0zOp0LtQw00szyxFgTh/9iU+DcoxvTakazSLLnBOCAS?=
 =?us-ascii?Q?+ynN3ozCwAjorAyQ4pa299N8Su1lLm1wr4EzxUwRy+/j0jpHUkVoDIJKlrp+?=
 =?us-ascii?Q?kKfXnrcUWPJmNHHJn3A4s7WazqPW9dYxAFlkhzkFyESj2B813zxxGW1l+YKl?=
 =?us-ascii?Q?5HOLtCjWnyD0Dr4hz8yxckyE3bB8aaETltbKVXS4EX/q3UgAOywaZGeS0eXh?=
 =?us-ascii?Q?/Mz9qcAjOaaYMzwio2LCepGzkJPKE4ocZ4v+de4qrvdSiVt+dX8JMeGjLmle?=
 =?us-ascii?Q?BNabeG7j9ezQ53hFQCyn2CDsaLV7D7whH2Fcbhl42h3pGtbLHW+VKTNXHh1h?=
 =?us-ascii?Q?TAeE3JOzM+s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YHNcTJdXfUjl0N6AALJc9AqQeyxGQDvnV5vXKovloWOGM+l7asc9b8sTT3hc?=
 =?us-ascii?Q?LOEakLAhB8HyLiGjaArLSysJxnIF3Z8NIGRWefuUDzj48TJiQDHv3t0iAi+4?=
 =?us-ascii?Q?KRp7O64wHXc1NV/LCMbwTbjKqoCxBW6FKfMRUQ5kmzEikXaVtz3TiW3ItY0O?=
 =?us-ascii?Q?YYGJpfUL2I85mAveaNlqukK5+OmBMVFeUUMdkO5nRAhYJDwBYzGV5HVs4BSp?=
 =?us-ascii?Q?0Sg5COrBmD7Q8JUh6bgbjA1aGc5S/NkKXtYJu8MH7wIgXOFduyV5szawrYsf?=
 =?us-ascii?Q?VFnwO99JZ7rx4IOUbuPAZ1R4qOaOcenQZGY5fly4x9vDR7rZ/oSh4YjMKsAr?=
 =?us-ascii?Q?8bkzQaD67nyyOyimx2YXJ4ok8RwtGZrBl93e14p+kkQWNsefn7b5AMeDaO7v?=
 =?us-ascii?Q?T04CU/nNkbTpHfVGJlnzEUV50haVCitY9YlZqtIfLU8VO6+Qwr+fGZnSZbEY?=
 =?us-ascii?Q?HFdMgawrQKWHz4EUx4aV9aXhTonTdcjOToC6hox2HoWUJWSlx8oa3yATUD/u?=
 =?us-ascii?Q?2l8dREu0GbhFIQrAWTuXuJW8bx6mctcVkA9mLCEYn+TpF8HgZhnGsu0ISjQQ?=
 =?us-ascii?Q?16ZtXynaJTsXlHb/PEviNGQD8BFwhduLmzdzd8sDFKrCMhFaYnLwEZZgX0/U?=
 =?us-ascii?Q?eNjsgmdZZkDFlynxYIO2lbJoyOHgkjpZ9VtVvjIKz7Qy0RZFluBGiC+JoNiH?=
 =?us-ascii?Q?T7iV2s1Bm7/a2AxDWFg+JyurOZs2cuiV/uiPXqPnGKq+5ZtdXouvJCU5zp4P?=
 =?us-ascii?Q?HCs70SsA/Chs+/ITs8keCB735+vyFjdwRsEbY92dEbIuB0zRwGtJllUI5NBg?=
 =?us-ascii?Q?uDlRNvZExRlcDZ99zYm0490nRlzCFaQWN5s29M+RLvUX1/QjCw+OEqwb5ibo?=
 =?us-ascii?Q?A/zifvkCAUWDU2HapYIuPjVwm5SetmD4/L1Y7bVZJu/0jlOu0RWeA7g/EFzM?=
 =?us-ascii?Q?ASLVRFcxIHwsjZztCW8PCg85lPIASwu1UDz4HBT7vZru4DlhD+xSI2DRmLLz?=
 =?us-ascii?Q?p32YkHO/rdweekwRnMVz8q7Srs4QMe+fxbfqm5HlUK0ji0mwFoXwwkQRi1vL?=
 =?us-ascii?Q?63mgF6CPXHuYQRVFVOAqTCsfWMdDCQyrfvM5TlsQUYo1SEFJ1JQGkl6zYOdg?=
 =?us-ascii?Q?7ZlwTTPOcofwVIKI4uZ27iXe3DVLTxoBaiDz8jlo8CYZXbmb4upNV9VVyN/v?=
 =?us-ascii?Q?s8Ggieo4zcMYmqNdRZnr1sq89AdMRwq5cDtptmaQg5SrI6S54f6RhHMfe0qa?=
 =?us-ascii?Q?42aCbMrpkhzEw1DXTlcfsGQ2ANmRt5ydb8MqzGvqbUBzgMLq/NDRgk6dfIpn?=
 =?us-ascii?Q?PVK3b2AA5YdULqbEXbk9M+h3FFQX5yVDKuFaV9s6Xy1CVsLoMDFM+NLWuM0g?=
 =?us-ascii?Q?w4eYyh7ucXfJZOyI5kU9zrLlP8pfiVt5AoYmad9vY/3z0T5TG90ITB+Zgp+C?=
 =?us-ascii?Q?TGZlnhDp3iKc28umCnFtTgFOCDYYfGrSME6B+QLFS+hxVVNzIg+KoNxTiCqI?=
 =?us-ascii?Q?18te/uG6JGvA2BeAJZcOlA+NG7sJK8MSNKcmhZz2gtJox3tQ/uWUXtNEhrnN?=
 =?us-ascii?Q?rm4XV/wMPn4k6TZ5/y4=3D?=
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
	N3DF6sl/j30bt+Rsjz+Ny9PpsxnXyT0VKnhuxLhGTL373mjcb3MetRVKeuJSUMfTsyobosBTjZ6dwzLRunbibHJxbkx8C6LfDdHhRP4G9YE93I41nftnEOiypmDfyZHHeR9t6EdEB9X9dpBWdmNSgtVz3i+WWiRLF428lv8JRnFNLiaSEsgWyEHaFdmwP2R5GenMAzXpVDYpveiENekhibb4fffooX5Theh0Nlbb1R19ritMeYy46LmuMvlGQS9qKo8D5ANCitYXmGdJnLpBFUaUz0S4ffTX6E+WFG07GqQiwh1OkvdXcR+iL1fP6jEbaO0l2KOnplmIaG+ew6KAAM4dxMzQ3k+rOUKH84z6aIc6zDjL6HR767QknbXsA39Ogr1y782Q8X+4SjCvRniMmISvilVWw6XfX5b5E0iV2e0ViSYAZjfsOVaYJErzsFmK4wPmo/StWTxZBav7NuAhEFgpAHu3eCgnAh2vidJpddAx9XUZKl9BHbVft4TKtFfN+fZJkH+ulwoLfwk9l3evVBMTuu7Iv4KvhXFU/heYPfqDM64lPdDiU4SqrYoYrneeLqIM5tEM8LsW1PNfLpD6II5f6LSvkKApuc3c7a1oLvX0lN8n2Cu2Ubnii4Xw6bbV
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81dcac09-f539-428a-5621-08dd96edfb70
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 15:58:22.6032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bt7SAzJZGLpoFl3mDsNPjQmlxXpCm7yFJyLX+YdB06wmTkZJ1W0ca0+eL0iJYNj/Hpkc1Hoq6b2M/3DEUeTUlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR13MB4466
X-Proofpoint-GUID: qulrE9rRxppFTXjIX__mu0nI_AGTonh6
X-Authority-Analysis: v=2.4 cv=cpibk04i c=1 sm=1 tr=0 ts=682b5524 cx=c_pps a=KSl2iKJTvN9PEcZNCff+AA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=xR56lInIT_wA:10 a=Xu_aML22AAAA:8 a=nXA5WNwiAAAA:8 a=NiL0GWOVAAAA:8 a=2iSxh-PlAAAA:20 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=VEvEtr8h6n5yc-JoG-UA:9 a=CjuIK1q_8ugA:10 a=-wH59cBETLoA:10 a=U_XVwcaHIQkA:10 a=o_LaMfWX3WolavuFUIfu:22
 a=fGr-7aqQv4RST94IA8XU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE0OSBTYWx0ZWRfX0aVeQtfAMOVO Uf0bqqPaHkMiTOZoH/J6dciWg0UBhmnDoCbdZ7Xlg5I9SUVaWCRDGb0fKpJ8aWO/DKSDXiodnc/ yuBhltMobPXZ1k2OlIVSlMojTD4VvYjdQHkhDptWu3hkSsGgtQiZd/gWXEnhAvd4shhi4KjHXDC
 pnqM9+FrWNSyUt4suc5fbnR29tUPmA6P6CHCEPAr/ZlmaDzNKvDbaBNeBIkB6W76D1zppCVvEiD rLA4ktXvEKalq+PlFoWMMZTaQCrdR2aoMiSlqrUidsnf8EKvz397ToYbUtap/Uxsfqji+W2q7Yn NPptb+APQPEuiPVun27UHOIGqhwxhGxU4fYiaWkYqAwybtNT1vsSSB863JBNjMw3aGciL8vU9uD
 q5KY9ZB0PtoQexDkuPCqkA2RmwZzGFPQsoLi7/zLEsf5GWVkrvccJ88T7FP3Td2h6/2Vv3Rw
X-Proofpoint-ORIG-GUID: qulrE9rRxppFTXjIX__mu0nI_AGTonh6
X-Sony-Outbound-GUID: qulrE9rRxppFTXjIX__mu0nI_AGTonh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01

Hey Linux Boot-Time SIG interested parties (and other interested Linux kern=
el developers),

Here is the information for the next Linux Boot-Time SIG conference call.

This call is a "special topic" call, on the subject of Unified Boot Log.
See https://elinux.org/Unified_Boot_Log

The meeting will be held via the Jitsi online meeting platform.
To Join the meeting via web, click on:
https://meet.jit.si/LinuxBootTimeSIG

----
The meeting is Tuesday, May 20, at 9:00 am Mountain Daylight Time.
See this link for other time zones:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2025&mont=
h=3D05&day=3D20&hour=3D15&min=3D0&sec=3D0&p1=3D220&p2=3D137&p3=3D195&p4=3D7=
71
(That makes it 8:00 am Pacific, 15:00 UTC, 17:00 CEST, and 20:30 IST)

Please note that this is NOT our regularly scheduled monthly SIG call, whic=
h is next week.

I'm planning on 30 minutes for this meeting, but I can go longer if the dis=
cussion warrants.

The agenda for the meeting (and where we'll keep the minutes) is here:
https://docs.google.com/document/d/1XAufoTT6VVJOTMzKMoz8SyOss-JA9H4J1_yVXQq=
5mN0/edit?usp=3Dsharing

The agenda for this meeting is:
 - Discuss issues with the Unified Boot Log
    - review elinux page: https://elinux.org/Unified_Boot_Log
    - discuss existing/related efforts:
       - U-Boot's boot-stage: https://github.com/u-boot/u-boot/blob/master/=
include/bootstage.h
       - RedHat's boot-time-analysis tools: (cntvct and boot-time)
          - https://gitlab.com/CentOS/automotive/src/boot-time-analysis-too=
ls

I look forward to talking with you in the meeting.
 -- Tim
