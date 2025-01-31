Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C248136351
	for <linux-embedded@vger.kernel.org>; Fri, 31 Jan 2025 17:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738344554; cv=fail; b=Oyaaw/KQusfEJnt4x9t+KX7spIfpUYspSFHRy/MeuzQrJPJeB7BC68Vor7h1EFl41d3HhkqEZBeqrtgGndsoL2VDHfVyuO2GFe2UnD07wOyeJUaT8qvCRlnp+Hjzdypvq/Y3AWRPaFWaFWqlXtaq4yAulh7lLMzTdZirPcLquyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738344554; c=relaxed/simple;
	bh=khJfqb0BxVptyyABdQ0mUlllD0o292nut5A1H9tksy8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=M28Mk0wt3KchyHkROr3s149meH2cljaQOH+L45m/N3tjciOOcQURibLeZW9TXdUZgM7EFEBj/ZcIgVRZQcIJWyFCY3o1TD1JwOET/a1uMZuAdfsq9IuIcsXPeZfM5s/SckyKI2w5TL2vYPgGaAiltptMxYkvW0rAF8/NRsPU/mY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=UMkoh5MP; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="UMkoh5MP"
Received: from pps.filterd (m0209327.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VGLJYR005066
	for <linux-embedded@vger.kernel.org>; Fri, 31 Jan 2025 17:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=E7lVhjmZuQB2tPYbNPRgwjsm/CaLh
	sBjQ35c5/hhuyA=; b=UMkoh5MPQshLnEVBeGnGOFWx1nL4k5b4WtY+a6PB115xw
	HKD3oHHIzpHytQ4NmWeEmwTxKpGFlKmW7EYQucQQwJdWj7oL4TpcR3iqth31uLHO
	dvZ9ORDOsZfEU73wEpQHnYL/WA6L1xCFilleztJt6+Nh/7gRm6hBEkw0mdK0Id3P
	ps+jyDcPnbVsWH1WjR5aO6C/BDrSMGZIB2qFLZffzKa3GDLyT4HoBDeuL3/yHUeT
	zTyT8Gw3Ypoc5XUVhYcMEE78mC1E9ajk0eFiq+cUWliiujh5iugZa0ZZPeyG8k9A
	9uwQvinsaeYuxk84PGhL1bvqwHXxFwFt4vdWMwNGw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 44gf91gw1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Fri, 31 Jan 2025 17:29:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W96q+8Wrqr2tRSpuRxppboKiJct2l16FC428vptHWO3Xot4o2bxCPvDAgJU7g0ZBjD4GDx+Qlgt0tw+2LBNUipIZt4bGoKAYKaV3kgIdH4mtxqvKJ4LJQnROS4cceT2e7/hCY+NRKAPwZIAn0nld7w31zfpcvGs4Q4egF8J4uzqugcAdqUd5tYc39NxG9NadyQ1zJ6IG7yBvJgBLwWQFxYU9t6jchyZYdLeHc+5dPyPtM26lMx5+4gn2e6E2ApQlJODVH7puQQFiYcX18+l55JHbzPewRBo6gXCz2vmi2ztPBJkvbdVCNM+lin2xXlK8F/7931sODRQBaA0lXeV/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7lVhjmZuQB2tPYbNPRgwjsm/CaLhsBjQ35c5/hhuyA=;
 b=dSZT40xRNIexv+o/q2bxMyjUtZVxEkvPgld4xJEPt6XHaWsAy7/vs2sHYp7z7MKpHcSnP6tTTIlLunyvXa/Rn8Qf6/7O1n/7KSoCjA0JUG7ij+7NY/Vr0U2QICWRWbCJHJn9+AT11/ykncKmAfTjcF2NPZpov7LeIwlHrSjVmbxzkhaImSziK2b44eAWRUGGG07Rh1+kBnc95KpUZ1neo80bRZFerT/kI3lhvtECPpOwy+20rM/OkLmcD3Kt0hLyXxkO1BCeVwCV7A6VY4GWug1UmYD6gJSVtCe+OEnJ6ST1nL1mQSyqyiCmVjcptLDVy+SkWhJXtYwBDt16yazwaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by MWHPR13MB6953.namprd13.prod.outlook.com (2603:10b6:303:285::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 17:28:55 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 17:28:55 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: Reminder for Call for Proposals for Embedded Linux Conference 2025
Thread-Topic: Reminder for Call for Proposals for Embedded Linux Conference
 2025
Thread-Index: Adt0BX8S+K5Ne4b1Qya9iyXZpwa1FA==
Date: Fri, 31 Jan 2025 17:28:55 +0000
Message-ID:
 <MW5PR13MB5632E8941EAED02D0CC4C3CFFDE82@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|MWHPR13MB6953:EE_
x-ms-office365-filtering-correlation-id: 4061019a-cb2f-4ec3-8a67-08dd421cbccf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018|3613699012;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dREfOIjqymfSA/4YCd1xbqjPgOfCNuKR0bA9/mrvAOzEyNDnZLvjRCT/GMsr?=
 =?us-ascii?Q?j1b511Ct9eW+0BHolTJa3Ak4nFxHbIWOOjf/KcExozYjN+OxAsBO9YlVmsKy?=
 =?us-ascii?Q?B/WpMkiQbx0sMq/lBuTHlT2nGzroMwn1M7JSZ2ZDQqXrGbROctPjRnScxAgi?=
 =?us-ascii?Q?Za64BL3V9I4p7XHiy1A8kCNXlxyS2nML56VXPB+d2IMxjTlsy3LCbMdACDnf?=
 =?us-ascii?Q?C2NYoDvsRa6e8GvDrlPc+BQHv/n8rVkLLAC8zxhU3bRUuhpKEToLNXiCbUcA?=
 =?us-ascii?Q?qV7qzoa62lr+MqNtZP4VFLGoV2ApIWnI0+03/9pGgkYSZmGMUfkBYHa4baSm?=
 =?us-ascii?Q?tvZjI96Z4nzpCyq+1+L/Q1x51tp2L2iXXnxXEdpdJrkLLfmRz8cX/8Hc974K?=
 =?us-ascii?Q?l1kINRsv/mWeTb78LlbMLqWkCeRAsRKdx/IXImlKXPz5LP2yX0pvsVvI0vx8?=
 =?us-ascii?Q?fYzRm7+y9lJ0pb7MWb5+XyZE30flDb+OIF4kQeLTlwopZ+Fi+3Yd0frj1MLE?=
 =?us-ascii?Q?5P03cMW0nEpoyezllz50U+ylUAoOvlYpDDzgO4k3dvSdwuHq8OyZhrG34uF/?=
 =?us-ascii?Q?hwqtVmwAcbeYUFAQh4+ted3XD4Z9TFS/l4oLr/cnIHCNGG44htwHjLK0zPmV?=
 =?us-ascii?Q?9XIdv6FEcmZirHXohz9T3EvmTyG7vAVsS6wmBE2ME7dkMRqSPeDJDW2zpd+L?=
 =?us-ascii?Q?bohgXCYRe0XRabBDOe23vHKYRDq7oU1L4l9/ljUV0cNnbg6yorsOhbu9OUtB?=
 =?us-ascii?Q?lEPOn3nzDHnAC3ZsgtGDA0Gfa9umJpPUX58/OfRWBjw/loIetu+xWXoFcfyJ?=
 =?us-ascii?Q?xcARmHGlxLRNh1DJ4c3ho3zJH3eRDlPkTmHkm50O1WDOtURKXWfN1LSOYir7?=
 =?us-ascii?Q?9pOld98EYRA/1atxdBBgDX3q1rKPjJUii3NcWDAh8ozDZ6zJgTao4b8gWWXL?=
 =?us-ascii?Q?0R9SDLfANMRenh5QJjNM5GFHjgWUj5OR5MR/TrH5P/7zxc3OdNd/5MFYnAuL?=
 =?us-ascii?Q?APUWJZEvlCFlelT/F8xnKZAuB2EvbQedCzHf36tL2yDeeHUGr7NvnqXW6aIe?=
 =?us-ascii?Q?EfaTMLOM41m0R4dgm7Eg6nXa1OKtfS8fLqVXzFOw/ssNT8CQoenHBywQjNQJ?=
 =?us-ascii?Q?w1EsT/Ku0hHiykHA+uK5OfFEpabDJRMVxkT1HyHVtMUC4ZVRjk/ubk+lG/8S?=
 =?us-ascii?Q?0tGA1ppwIg6Z72VRTPi1CgONkXpnl+Au3cS8ihdIXPaiO9PtlDfFN0XEs+pK?=
 =?us-ascii?Q?RCojMMiWKwVRO4qCCWUKXoGV7B0GRCl7ZDq31LBeVEEt3aIVGe3HpHi2PYXs?=
 =?us-ascii?Q?RGTfV3rqwjLKz89o3rx2vX1N4vqwx1SLqGw7FG3d+GI8UI/WbCAdLK206RRw?=
 =?us-ascii?Q?+jXGMv1uHoiR5+aSyF/oW5VSt0kA6mjbt4QVGFcr5VAlybCoWg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(3613699012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?77qMtHwfekR44KBh/oYqg5s2JiMoqN7XCbhVaWNdwAJoVkA/gSLPinhstmFQ?=
 =?us-ascii?Q?kQZcdfTNzdiQGZVj5oMC2W0GBZ/+HK67xXJ8+RsEcBMRyYOwwbaD8/xIspaV?=
 =?us-ascii?Q?W0sLp+POHc9Cyt73mLZEQyAV34cT1kYuU7uglhBot2ZbXnAeXH7QuEf7/0wW?=
 =?us-ascii?Q?Ty/AfjvY2wZvZiXZ4y9KoSfm9UkNQdWv9WCl7334bWkR2Y4WXmhMX+JAQ/Wj?=
 =?us-ascii?Q?HO6h8Qag95jWtPSLfjubZ/d1avi5TUkkrWwYgI/POTL2AeoaJk/ak8we1ZuO?=
 =?us-ascii?Q?j1JmxuLRBSKkL1x5ilLEJzRgCdXkQvWWOMxWSLLCVoPbM+SW8TJwOSYMJmV3?=
 =?us-ascii?Q?l8m84LUK4ZnzQo7Ra4AXsu85hXegME07nNViUntJAvoQsVhp6MOVi9o4JqEO?=
 =?us-ascii?Q?4SGBz9/RFFLJZ0WwsUQvBW8rBVphhtJA9Q+U5FYkLSJ2vciEgzq64xQAqtLh?=
 =?us-ascii?Q?DJ/B01ChYCX68+aOudR1HbszM1MHv+/5DCjgN+MpSV5i+UjGK5Qc/aRUhra7?=
 =?us-ascii?Q?OuyKoy4OjBmKpKk9emGv1tMSvvVgNreRj+d/Etfunq4+M1cti1bhQ7QXrBG9?=
 =?us-ascii?Q?Ah5BPyu35f8/JJWzoH9DPIhGAo7l3xGx6XxWp4gP7mQ1E72QKN+0axGVpgO1?=
 =?us-ascii?Q?q2sih1D5aXRtALJff2rWL2WFIKPrmNsGjBFKmLc0dFfpPmRnJRzuQL0HeXnv?=
 =?us-ascii?Q?zejJCnNmoJTK2WIyah2BV9RHsTd0Bjm5YG/qrBYYK7UXY2kM20KgJVIHE6GC?=
 =?us-ascii?Q?u5q76bKwZaKZW5J9/9GPY4hT3asGaZznhCDBfmmThNFj2v4Qif08VCAqQzc+?=
 =?us-ascii?Q?SHrkBUJ3eOjM5j4KPRkOZXppO1ngT6i9U3rAZZbLPPavauSOKPgDp/9N/5HH?=
 =?us-ascii?Q?/7+q8c4oPQafVeSKOpIag0JJvIzLGYOU+QjU0GKvogOT7maLvqvjIR5L8Zm/?=
 =?us-ascii?Q?sDqLQQD1DD+2UcLlJkHLTaujtURO41Ljic4d/vOKGxf10qX83wb+S3bMJU0J?=
 =?us-ascii?Q?cQa6+65QcGUL/LB3T7QdyuY3S0zE8eaT6DJf67IHriqJ5KaBotAdGCwutJRa?=
 =?us-ascii?Q?kEgPGfMLBbsXrCeKCSl36wC7qEBViqFVfaOFyyLsHjjF+Y/rdaQaKD5gaTeW?=
 =?us-ascii?Q?/Q7Jr+dj4jRlUdQMwi5vtBJhdd52/Qf+bvzuTqni3/f6nmmLsRIQx9rW1kCD?=
 =?us-ascii?Q?9TuLjFhBun4vc2C4l5QNSDPQrpoFabQnSghPXH9mGzwSbJPkZciU/48Bco7M?=
 =?us-ascii?Q?VcwwkAMuh08gZW/h5gRjNSkrgkMHqWMDamHpiaR3SfBfWxq+1I4m/GWHTZvT?=
 =?us-ascii?Q?2PsfkCwggc4pG99IlsN0759U7mwUbRqw4HudJlgUSgqzT4pY6awYi1MUTKrd?=
 =?us-ascii?Q?+s0rDns1/x7qTVQ66ADscLYITR/z8Wd4bd9bOO+CHQPzDU8ZyAmxYX8MHrz5?=
 =?us-ascii?Q?FBNteiG4CWWOZfnu06fzlvd3zdBv+I7z6WFOHj7EwQedoW1MmJSeHgLgDYkE?=
 =?us-ascii?Q?uOhSeO8gxThYbuJOrheE7+JbNh22OX2+M+8nWZJNzxFvuoqUBYDJ+zV3lWTv?=
 =?us-ascii?Q?twBgM4Vr/W9DRwghMnA=3D?=
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
	GT/LeocLzieIlaaNCRqur2Ttc42Z4NvXFgzRgT12PfprNW5nKVvlUHI15oCC/OYBRpDOtP11PhOj6MVHjukj02GNsR3UR5fnc115IIBMQQLTqBhdubGpf1+A7IwxbP4sT60FTszt+bOUmFIObqp1PO7Jh/lY1FvUPxirqc8RTITfOBYuJpfKhOnQaaApYo/robmPZWbI+PmB5gHfrKUlXMQBQ42rqKfzlYEKL1GPSZNvF8mjhvYI2CnOpiBA91YwcGcVeAUtsPUHvhEmbGojE7xyzjxLssCaZ78zBKX3Dw2glK+67T9VYVIXMPk9+cp1OheqRU5Bo0RHI6n84qnVtveKcfIx/wD/MbKdw+wlA/SHxbaOZWuM4CSUYi+o9T1XaSc40iqSmJyDvHqw41q/XoTGBTbyH+x5mFjV/pkdX95fV8AVXx23Xl5bJIawzmAc+u2PNNvTP3O3pByTw4mLiQaKKloHw2TD1Prrvvcs6XjTu91zEaolD7YmPywzQILqRaune6U/9HdjcNOvVp4ChS+ooZadOUrIxH5dfsQ2NzegpH/4qKiyS61Kuabj7+84r5H7WTC4jq8IFsC3vqGaI33hvl4pdCDJ4Y2NdMG910gCgT6HscGlKOAdZUVirf2t
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4061019a-cb2f-4ec3-8a67-08dd421cbccf
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 17:28:55.0157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqrPYMbI6O0gcw2FCPwDsPFajMkOM83OtLMv0iyLgSpp2etPMpcd6Ym06JMjhW0FjZTTXynLCMCXy+PFJ4W7wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR13MB6953
X-Proofpoint-GUID: w4vdxFNfAZiJuz9sEuZvcdjtIgy110s6
X-Proofpoint-ORIG-GUID: w4vdxFNfAZiJuz9sEuZvcdjtIgy110s6
X-Sony-Outbound-GUID: w4vdxFNfAZiJuz9sEuZvcdjtIgy110s6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01

Hello embedded Linux developers,

This is a reminder about the deadline for submitting proposals for
Embedded Linux Conference 2025.  The deadline is:

     Sunday,  February 16 at 11:59 pm Pacific Daylight Time (UTC-7)

The conference will be held on June 23-25  in Denver, Colorado, USA.

This year, ELC is "embedded" in Open Source Summit North America.  (See wha=
t
I did there?)

For general information about the conference, see
https://events.linuxfoundation.org/open-source-summit-north-america/

The CFP ends shortly (Feb 16), so please consider making a session
proposal soon!  We are looking for presentations on a wide variety
of topics related to embedded Linux, ranging from boot-time to security,
from distributions and build systems, to hands-on experiences, and from
aerospace to robotics to consumer electronics, to name just a few.
I'm personally very interested in topics around boot-time this year.

The CFP has a more comprehensive list of suggested topics.   Please see:
https://events.linuxfoundation.org/open-source-summit-north-america/program=
/cfp/
for details.

Please note that we have available some tips for proposal authors.
See https://elinux.org/Tips_for_ELC_presentation_proposals for details.
Following these tips will help improve the chances of your proposal being
accepted.

I look forward to seeing your proposals, and seeing you in Denver later thi=
s year!

Thanks,
 -- Tim Bird - ELC Program Committee Chair

P.S. A lot of our European developer friends are currently focused on FOSDE=
M.
I apologize for the overlap in event attention.  When you're done with FOSD=
EM,
please consider what you might want to talk about at ELC, and submit a prop=
osal.

P.P.S. Please note that the CFP for ELC North America says it is also the C=
FP for
ELC Europe.  However, we have decided that we will issue a second CFP for
ELC Europe, despite what the current CFP says.

