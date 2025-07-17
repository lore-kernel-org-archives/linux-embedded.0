Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1E92AEF5
	for <linux-embedded@vger.kernel.org>; Thu, 17 Jul 2025 23:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752796584; cv=fail; b=Wmd04YNVQU+ifzwIrgm3Wkk6vr5IKg0Gid+mxZKGtOgND3i4JJwbmG8KMHLfk/QXgQ+p83raYBUM/6hgSSMIsqGvdsq9QtnEAIb4kLfzTUNrofEOgRrV9+dxVc/WuXsEtFvnb1ulYx03mpfhI5tYMy3CZmKVGTrYd3f0mAcvfeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752796584; c=relaxed/simple;
	bh=DfSPxQJDzwCCdrN4UkeRcX+gfufssQHJQGDC0EGX2cc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uFJaS+rdh+UXfpt/FGjrisLkNcLZivjpmew0tHUYjG3LYJu3yh5wcYk5wvZN4eqgqLZLx/ZWf8YXEIrSMcPt388IMTdRCQLtVJGvJ1RLJBEkSaPletwY1sYtXP45Gb99aUn2h0RnBdxKxoLK4mtJViUmw8y4e0TJnursuZA2HIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=D/RYUvnL; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="D/RYUvnL"
Received: from pps.filterd (m0209326.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HMo2Vi021628
	for <linux-embedded@vger.kernel.org>; Thu, 17 Jul 2025 22:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=XTNZ32619UpTob3K8PLBbVSIxPr0j
	J+opXQNagzwlO8=; b=D/RYUvnLplf0m7pUJdZlrk/yTLDjFZU0dzLCVynkV6sQE
	YWmnDgVZEfV+eeDiy1WCr/sQbjrUtdP4IgoZZA8Kr/ONzzQxgw5bZGvK0Lj8PQ0d
	iEEN1gFdb8YAuDfminM+ISMa/ZVTuqBsnZLGZzpeFHTwgUrpdIIOvlpweXwQgivw
	URn3cHl55VByooW4JkuJdTGXFRU15Gfzr0YXK9+JVRIe5A/2iEy+/D0N3PAkD6VP
	d3u+C4eqzgluGaIcojHQPw+n1vf4BgAONAg1+HywFv8eKOQ0nozxfkmkwwAKEzYp
	Ps9c9EjhpaETQ3WvMcwGcEUuCApabXLOlxxobVmbw==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2046.outbound.protection.outlook.com [40.107.100.46])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 47udwjdhv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Thu, 17 Jul 2025 22:57:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Byh8+Y6phBwBYfBmrho5rFliGoqcjHDQK6xG4dkde7JvaMMm/2xB1X2Sd/D9Qs/wUSpaUFFW++Yx7afDKY3BwsaxjO3iWhUbfyxyNKSlAzKcXDvucXgvbQoVWQUtwuMKmbdozcuBeFpEPKT2Vk7KtTQ9h7sLCa+wpeT6n541O3pxNRPMs2KfCmoEzcTaGjqNPVvXBoNv8gqp8y18zexnEvHErn5csq9uG2HTHnVSHt7uZIm37E2XLBlB0pm0Uk9Kw4O2YLoLT+xwiJ/YEhLAu+c2h9dkRtVUPzQxJiKvrD787/qZwIX3J5ULwbUrvsmSqhTjfAF76NxGUZY9idGRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTNZ32619UpTob3K8PLBbVSIxPr0jJ+opXQNagzwlO8=;
 b=s2/T/wwr9DdoQMUMRJqnZ6rMBz75AlghvCvoCQU5R4GTnmZ4fe4+n42WdEaHEjbG4K6G6wCwS6E5iMP+8PB2L4X73naQhEYtHnRo7xONUy+qWZ6Tmcj15F+CizvXrB5cN3QZr9OPVSn2yKstVUfyB6pSVxn/MmteMiBHfdoB2yTBOUb6+kv8QiHE4r7jYLoBjCEW+/5mOHXQ0TNBvV7zqb1pi2HAaqwTqI5jyleC3lmk9/sYhhOxz/CKsmpJrknGg33u231aTX2G/ph/YG8QEQnEvvQVlBGGvfadyUu3p79FvwFAkuPSX6VYgXCHhBp6LugaBB3/Y1FI8ioRLTXqcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by CO1PR13MB4903.namprd13.prod.outlook.com (2603:10b6:303:d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 22:56:58 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%5]) with mapi id 15.20.8901.021; Thu, 17 Jul 2025
 22:56:58 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: [boot-time] Reminder of Boot-Time SIG meeting (July 22)
Thread-Topic: [boot-time] Reminder of Boot-Time SIG meeting (July 22)
Thread-Index: Adv3bfp4iTftijnpQdS9cQDrZzgcHQ==
Date: Thu, 17 Jul 2025 22:56:58 +0000
Message-ID:
 <MW5PR13MB563270DA8DEAA70ED3DD5D55FD51A@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|CO1PR13MB4903:EE_
x-ms-office365-filtering-correlation-id: 97b767ba-bbbe-4d84-59ad-08ddc5853bd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fk2t4T9kX4mDnkv5zTvpz87sgQBXc7IDAj6JF3v/sgOBzTphLv3+SlwtSWtJ?=
 =?us-ascii?Q?MKj0f2mScwVeCbxYBCwV6SRCDgNJxca3DUjPdO4exJv8UfyfGSMcHnAfkw4t?=
 =?us-ascii?Q?bpfEHRGuKZjAit0JbXjKHcs2k18wSN4r138gUJ0Q9cq9MVjn6wh10DMcMioO?=
 =?us-ascii?Q?xd9LFhVpcndhsB0FeHz8kcyerCbDixk9gJe5bD4biJ5gpCR52M6RR/Zv9AwW?=
 =?us-ascii?Q?ASAz0BwWdy33uHChF2b0RX5g+eRR/ijTpd9RN8p6hvidprWt8fAv/hdkeycR?=
 =?us-ascii?Q?jQmrpajEAh0N15J3GdKi/zz5lYoapncmRHWA6OndZTRhGnX0AIihpu0s9YCq?=
 =?us-ascii?Q?SeIIgTesL0FWsOm2njBX4gMjvVvVdf9fA16zfOYdUFs7tl+6ZEICOFopMcpD?=
 =?us-ascii?Q?upsHKasN1057AevXDt/cNz+CVy4hOKyTEIOQv+12G4IGvHY6DDWU6XQ03nit?=
 =?us-ascii?Q?KuOxQy48xHh0nXDrZZTDTCL91MaFd7ve/DWGfubqvU5b4H6xho5rXo8i4HPc?=
 =?us-ascii?Q?Bev/3jnN5RXzsfJynYYmz6iF6MGUHPvhPkaQyoxTSJAXQK0+rC5oWAB9L1E9?=
 =?us-ascii?Q?MNAcn81+YOgyCtFQao7rX+86oNrWx0oGAk9MwFcOGf0C8Hu1daG6LhFyo3tm?=
 =?us-ascii?Q?Wp4HBi2qIUb7NaicN/f2+Wj2h//xomkfqrg/cHpAbZiHOS/R1ifPQArLWj1f?=
 =?us-ascii?Q?wvhk5/Znoxsyt/EYiAaNiswXuamIRlefgmRjdtiwSov550mlGAJ+OabR9Fp4?=
 =?us-ascii?Q?Yi20c4VsEAemoVeS9TeKUrEO8vmThIpq6XztA+pbqXNVoRe+iOSSEyryO0Fl?=
 =?us-ascii?Q?1xZRKzN8zFmleZWJySHa9q6A1sV44aukIeNsiL+BbjMOvaqQejW18Fr+QOCx?=
 =?us-ascii?Q?rdM52oh3nlR/OuRdMRcUK/urbVl1FUMlgjp3Ynaz2N8HeHleZCWh3WLEMZOa?=
 =?us-ascii?Q?tansGlVWpxtr/arQpvBZrsDgwwEsBmWhDXh1n7EJ+lVBewUzajrKcoGnvicl?=
 =?us-ascii?Q?nnF7pmMO/QmbwxpSAJKRVmrmiD4PBcj7MfqVCc2HZj0J5D8x3ECVNuXJLpU+?=
 =?us-ascii?Q?DamU+M8D7Z9EeDkL5w2wFyEe5ZUYoym8hnO2HJrr0TaT29OWoiLiDbuHjGG3?=
 =?us-ascii?Q?QJv7pv5obWHIpOMH9cwWNIP+DHr5aoDpzbXMllZTwQxA24yi4ESErSmkSBrV?=
 =?us-ascii?Q?S4OXKWX+uFcLsuta3vuC6kK0QSkSHYop5TbajrXbAy0aBPkM6YGg2BnBfWCQ?=
 =?us-ascii?Q?cimin1NpZbcv6xgLFSnXJNn3bjAQ0BbRXaXC3ZF3XiiFQrFPiYWxGDWf7t+p?=
 =?us-ascii?Q?eI4LTdfUyBaXIIm9IH8pPbTPQpe+U9nGSjhK+r6BE/qfdQbtFGhz5bv//Jpn?=
 =?us-ascii?Q?AegFDxZJPt9gs+TAy0Efm8jgVDQ1vN4RgwArVsDAK0medJW2CIT/0p+MR7Od?=
 =?us-ascii?Q?w0caHVTSYgA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VXZt+SSkU5c9bYeHFo+5Q+XgMPh4gVClPsO5JCFNpwYgcnRYWrEprXkh5xKm?=
 =?us-ascii?Q?uvge1HojU8VywuUb2FIXUG4iia0UohNkSVk5hEChm0mbH9XLarjySF0yZQB8?=
 =?us-ascii?Q?RrAhaH5ukCPyYbwELjobtcJfQVUc7ArsHX9J5fZW2JvgqsA857S9++ez/vaW?=
 =?us-ascii?Q?+0+naC3pEBvsoJFoUp6h9ASfJYZWZ0A6s0uhLkNwQZYTyJGxdKwIUbbB//IX?=
 =?us-ascii?Q?7MYAjT2uHqvPYOuYmw0GxgPBAU/y0VeUiwJDxsfyrV8cN+bTHWpJ9jvfYm/e?=
 =?us-ascii?Q?CCiCN4PF9pGSUkjJ7aKb/QvjNcqUI2XyFO3GkGoqYgGMyL2PHT4880ezDSUf?=
 =?us-ascii?Q?EbeOla5Ep5yuINumJl3a+upMWMLfjWqONxwf4bNuW2ECCPCi95/jm7m+8+fj?=
 =?us-ascii?Q?k2xgO/wuF5Rm+4bu+NNvLuEVMKfHalMGBD2o06WS6OQwHCvkrFbjyMVfbint?=
 =?us-ascii?Q?zyj//Rg+ZtyiuszPOS/UIT4jsHDVg2QXLPcj9NGXAp3KTE/CYdCi4U5wVNrm?=
 =?us-ascii?Q?1pAyCCskz9CUGI2xIxj7YudsMNjxRdNa9m94/2ZZqL2885fBQ8nMiKNk8PKk?=
 =?us-ascii?Q?GpEAjbmXUhwJk48jFtPinp6vgcrJ9axUb8unHl9wO87qFNKnV7Qocqt4dtPa?=
 =?us-ascii?Q?dLC2jGRtbvPVgVEEfLhovoCUWMop/dvmw4x74j5NfMUe+8Z5EQKU5ptZLxDs?=
 =?us-ascii?Q?oauskDPVdmxozv9ZF5UOs5uA9LtaDbmvoAG2uU3oZRntOTcglhv4D7iDpSuq?=
 =?us-ascii?Q?GuqutwGJn15TNkyq6eyDbErB/ds2G/iVptJl/1dgZCp3atQAOwIDwfOsFd4l?=
 =?us-ascii?Q?CS639pmmQFY24J0h21MLdjUQ9Wuijvm4vUoLKpGWix9p2N7mq3hduNEjKeNn?=
 =?us-ascii?Q?CuLFd+j+Y4OFQ5g/shLJJ+nmKt7Q9XyTXbiLsFRlmi0FUoPaKOuqYq1iKdrz?=
 =?us-ascii?Q?Wskb/oA/NxdPl0K/2ex8c0NpSwiYuqWFQXU6q1rmrqXfJstUxZBanpMREblk?=
 =?us-ascii?Q?VIk/TApimeopyprjBBMnpk1lqbX6F70TADHiK9LLS8kGoBxZwMK4MfuFU+vv?=
 =?us-ascii?Q?X5k+WGR1SRbW7kt2nJyXAkYXv/uAPNtso7n0ndGH6Cjuf8ZDAkdcMP0W2LWR?=
 =?us-ascii?Q?//3teNwgE5IaaWMgImND14y7hvMh4SCRL4B/i3CWU/OeHEXHkjCh7R7GOrFF?=
 =?us-ascii?Q?fKSj/l/sr8l8MemiWqDzfNB3kgqWOcgzoJAdEfH9U08bBrI2vwjCIyC/e6Ec?=
 =?us-ascii?Q?30+cZ8O6mAxsuh9Xr5qNkyTh9X3wuHhAWwNKJkycDGTgjv7/m8oLjhIrFiwh?=
 =?us-ascii?Q?DpcWfu0mAsjUlGANfGFFNdEmO3Dj6OzdirYcoH0iwcoi/14NF9obH+hACzjt?=
 =?us-ascii?Q?jE9c/o3nmQ3AeZA+etjeXyPKGzxl3Vdky7Y6pTtqCCxYIQUAbVZaVtXNN284?=
 =?us-ascii?Q?Cc6g6nK0726Ti594dch9DHbp9QSQvRFDNVTvStYzugNSYMLeNM9y7oDI7qYM?=
 =?us-ascii?Q?FNmeLnuIC0Wti/PnFMherdpCgzikUiAj/C1S6hoiwrRa2gobX0LIS8vM3nsS?=
 =?us-ascii?Q?68p3mRMq3jpd0BX27NA=3D?=
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
	7knArOJK15r4Hm32NXciDobIlSZXe7JtT9atIMSa29eCHbjjbgzvApUzXS+puWHBN8EOART+rPZgob1UPqwK8q+2O7fp8zLEIMj/gFAJg7QrgAKrzAFMGPqxSanN1+n1BZjxsdFHn8pdTb+q+/paxPQh3hyqg5NPYl6/mTKPfhRrd+8WMQCODg0kC3jlXkscrvO8ZsJo+NyIBjGgnRBLRj6p/r20KlnvfEsWQk64dUZEkz/F1CkR4l9lxhcHHNXPJnNdT3KpWZ0jf8CBFKjUyUQQCn/W3BfDZUoWyv78f5XWXEjMk+jPLIJ10K5vvNSv9vHBmnuO4z1zJmvPJYuqSAXcKaagSsD7kw4R8Ycd+nVPv9tBESljuTmkkD7v61khUhpYvt1Umt16YqWUBKtscw2DuCA4oKW0wMQ42gB9gumqNEMUNOTiOrR51LBSaiUETe085+rUklEXUUUpQB/ec6K9v0Rl/HnAVHlTaGXQJyjP4UG3MYX6XnUTReJNjgXijrdAqY800PDAC76kxQ8nhS/qmlxT0URcOu6GDCOJ531HixhgHDJWRz69xMZTsNVNey/p9o3RVc4rWcu05coh8diOTay35zJ6ykosFYKY14FTHcGrdq1Pb3jZScalQ+vW
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b767ba-bbbe-4d84-59ad-08ddc5853bd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 22:56:58.1206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rO4Ozsh9yxYj/ZbSV9tV9dq0SeDqdbBJ9oI1s/6GQz3DfmIB5DFbTTAqZGFuuy2Qx/rP3M/wQ+ljiR3v8sDacA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR13MB4903
X-Authority-Analysis: v=2.4 cv=JpnxrN4C c=1 sm=1 tr=0 ts=68797fc0 cx=c_pps a=goyIOV2bt6J9IcaSbUmyVw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=xR56lInIT_wA:10 a=nXA5WNwiAAAA:8 a=NiL0GWOVAAAA:8 a=2iSxh-PlAAAA:20 a=Xu_aML22AAAA:8 a=HGZllEGjY_LiwHQy2_cA:9 a=CjuIK1q_8ugA:10 a=-wH59cBETLoA:10 a=U_XVwcaHIQkA:10 a=fGr-7aqQv4RST94IA8XU:22 a=o_LaMfWX3WolavuFUIfu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDIwMiBTYWx0ZWRfX4xKTmYqxA3DX 9KwanekIFOJxJU+7kno8Q0AuU49qbYRcOTULteExWMdalSbACDzXuJBhTNt0xu/sLkJ4bwqhvm8 jBD3mR+ETWSmTQ3QrGeRnaJAb5sWV4r5b5jg3D8kxpRtQo1/+Q/1/THBTDFoDaNPKgPoxPVdZK4
 wrVHFrN2Hbn+EWe9Af7Mm2bXr3ePqHfMcmw0yreLySUqiIwbvY0wJAbjALNZtC6kHE7IBwmTuf2 RxLw2zbLAsS0y2fCU/RcT1aAekHyMcgvogihJgTnQN2foRAdN73dtndnYpdEXtm77xyTlVVMSrd EBqWlsZA3LW3M32WETNqHLnnlfQcZzCf0Vr5s0e340VvRz1Yx+zBn16tr6IP/1V7iT+KUOSueny
 BSloppNQja9yeeBwEqFLuFvPvS8i5InfhqLYChAEEGRRpaoCpfyDQWDgqTfYcQb4Dm19u50i
X-Proofpoint-GUID: 7-BT_cbaA4bVhZpIVsTxknK7M0cTK3Gm
X-Proofpoint-ORIG-GUID: 7-BT_cbaA4bVhZpIVsTxknK7M0cTK3Gm
X-Sony-Outbound-GUID: 7-BT_cbaA4bVhZpIVsTxknK7M0cTK3Gm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01

Hey Linux Boot-Time SIG interested parties (and other interested Linux kern=
el developers),

Here is the information for the next Linux Boot-Time SIG conference call.

The meeting will be held via the Jitsi online meeting platform.
To Join the meeting via web, click on:
https://meet.jit.si/LinuxBootTimeSIG

----
Our next meeting is Tuesday, July 22, at 9:00 am Mountain Daylight Time.
See this link for other time zones:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2025&mont=
h=3D07&day=3D22&hour=3D15&min=3D0&sec=3D0&p1=3D220&p2=3D137&p3=3D195&p4=3D7=
71
(That makes it 8:00 am Pacific, 15:00 UTC, 17:00 CET, and 20:30 IST)

I'm planning on 1 hour for this meeting.

The agenda for the meeting (and where we'll keep the minutes) is here:
https://docs.google.com/document/d/1XAufoTT6VVJOTMzKMoz8SyOss-JA9H4J1_yVXQq=
5mN0/edit?usp=3Dsharing

The agenda for the July 22 meeting will be available in the above document =
before the call.
This is what I've got so far:

- ELC boot-time post-mortem
   - What ideas should we follow up on to advance upstream?

  - Status of patches or docs being considered for upstream
    - print initlevel
    - bootstage stash driver
    - show_delta 2.0
    - deferred initcalls
    - better probe details (function name, to map to source line)
    - pre-timer init cycle count durations (and tool)
    - anything outstanding for deferred memory init?
    - documentation or tuning guide?

- Round-table of on-going work
     - Tim currently working on:
         - boot time early cycle counts (Tim)
         - boot-time regression test
         - mapping printks and initcalls to source lines, to accumulate boo=
t time per Linux sub-system
   - boot caching (The Good Penguin work)
   - boot-time data wiki (Tim)
   - Unified Boot Log (Vishnu, TI)
   - elinux wiki Boot-Time pages
      - https://elinux.org/Boot_Time_Project_Ideas
    - Automatically reducing kernel configuration (Michael)
    - Android working on parallelized module loading (Saravana)
    - some udev integration with systemd (Federico)
    =20
 - Conference and meetups:
   - ELC 2025 - June 23-25, Denver, USA - pretty good lineup of boot-time t=
opics
     - presentations and videos are now available: https://elinux.org/ELC_2=
025_Presentations
   - ELCE 2025 - August 25-27, Amsterdam, The Netherlands
   - LPC 2026 - December 11-13, 2025, Tokyo, Japan

Next meeting: August 26th falls during Embedded Linux Conference Europe 202=
5,
so we'll skip that as a call.  If there's enough interest, we might be able=
 to schedule an unconference
session for boot-time discussions in Amsterdam, for those present.
Our next call will likely be September 23rd.

--------

If you have items you'd like to cover, please e-mail me or put them in the =
document.

Thanks,
 -- Tim

