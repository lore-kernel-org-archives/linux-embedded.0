Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1D3229B0D
	for <linux-embedded@vger.kernel.org>; Thu, 20 Mar 2025 20:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742504217; cv=fail; b=a044wZdIQo47vg5CecqSLhuXGz68dekq1CvEL/iPfagieuUsXPMa3TlIUZRzgwAMvxKd+nKen7FI46Dv2Zo1iZ1aSByWTv+AMm2Blrmk7wKq58gLM7VaDK+fVcgsf3LStJBZ6IAKdxHKe7e4B/f4eKa30EERrBfNbeZCBfVg5zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742504217; c=relaxed/simple;
	bh=FayWvEnnqLpKk47Wdk18Myc8aRB0vVYcpCdbOYKGncE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K6arO5JJ/UJ7AuJktW/i3okJnMkhmZnBkwI/PutvaNF3n2/ylNA/XsnZLys+jOnvTPx/GJGmngkiSea2VYGfYtHNtqfz8aLAsieSi/C4NlkwkLcDjiEox6btu+2ithdCyDT55o0T1/SSRQE8iOl3kW4hIE5ajBvZb6vrxgV6RDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=X7/TnEM6; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="X7/TnEM6"
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KKnRKk012010
	for <linux-embedded@vger.kernel.org>; Thu, 20 Mar 2025 20:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=FayWvEn
	nqLpKk47Wdk18Myc8aRB0vVYcpCdbOYKGncE=; b=X7/TnEM6n5ScAAZk7vB8HgV
	LGhRmoDvGBEi1Q0ED0R7tuhUOAPMrbhncCRg2kMB1AWet3DjhFPaBcy4/6+O4NdK
	t5tKiHCWx6GfNfCUSidE9cq83lkieIocGuC80wNziJ11Za7CGG0eZpfN2zuF5sWc
	Iy5pOvdKoTKJ5cFd+WlqRxd+Yc2Inea0hmLSyeWm1W+F5h0EcPPDNUhdo4sH6N2P
	clCZJ2z6tHf26bnOnO/7t/fwsOcAtFINQrucanB9Uwti7WpyGQ72LoYga1zm2rZx
	iCtIPhCOA1US3OgtManz3DJbVM9DU8CSySPcTuHUfdih29rIq6QXyoirAQYJKDQ=
	=
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 45gtcrg050-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Thu, 20 Mar 2025 20:56:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a689B+Nqviutw0fxU9zAqssXt3PKPs4NY6cWSxc0k6m3T8q4+BQk9NUtA3eAJVvNxKfMzaOaPtANkDqC46nN+UNdSjUiv2j0qrdPYLmYod+gQUsTglfoDLexK07H3JKmkzLsGjfl8NS94MKvl3emutIoSnNYtIW5jlztn6SvS27KrGl/W6It783TkA5hSLCCWqWpz7+sOLpfZv1eaBbRhfkYp83Xa+QVVLBVM8ueln0Rk/b0sSmbn9OdMSuWCowTdS0/ZSkFIcrZoxC4RqdjJ8U5Q7VH2150/TDNMv2ObwjhKq76umM+aLG0DjfZgabRQQj6K8yXdSRmPRzNhiOtyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FayWvEnnqLpKk47Wdk18Myc8aRB0vVYcpCdbOYKGncE=;
 b=UG28D6dU84RoWdmvDbX+xeVGaTWvP2shnT9uRKNazrfG4QvMk40kpmFR8gW2LZLTdeh39/nfPymuKt0vwn9brtDB+VPYqi56r/7M5+v0NOnJR/xgPelt/y/QZm8z9iLhBbadNYbstbhG7AVqDNh5YU9aWbctI+H48EhGX/yiLiZOtpKjFPG7ldBtcxdQ5Jc7ytW93n08mhrsHvpsOPTbD8yLPmSHAJsBU9RBwbJ2SqlP9vQcotcKEs+M3ykrcJJPc8rSoBqKtowDTvfspfURMbbcgoyEVnI4AOr1BcMg3znRw5QTRyUC6+M711iGnXBCL3VEGYGIp84BKqmeAHsv4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SA1PR13MB6595.namprd13.prod.outlook.com (2603:10b6:806:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 20:56:45 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8534.031; Thu, 20 Mar 2025
 20:56:45 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "Bird, Tim" <Tim.Bird@sony.com>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>
Subject: RE: [boot-time] Reminder of boot-time SIG meeting (March 26)
Thread-Topic: [boot-time] Reminder of boot-time SIG meeting (March 26)
Thread-Index: AduZDufzIHXZnBuUQfeJJiOL+2oYHwAy1r4g
Date: Thu, 20 Mar 2025 20:56:45 +0000
Message-ID:
 <MW5PR13MB563255C6504BB3972D6881A0FDD82@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <MW5PR13MB563271D351A97BDD0170B833FDD92@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To:
 <MW5PR13MB563271D351A97BDD0170B833FDD92@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SA1PR13MB6595:EE_
x-ms-office365-filtering-correlation-id: 10ed7ba5-0b6a-4272-1add-08dd67f1b98b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/ibd1QCpnDH0J9XJsheRprtAc8PY+a7uUXM4Ffo9JqjOkOW2DAs+ixCbmFmx?=
 =?us-ascii?Q?cR48OyOJOgs73dMyvUT5LedWe/t/kPrt+J3hYTxfGy2tSxNYV84p0fm4ISb1?=
 =?us-ascii?Q?kJdiQfje/KbIQ0niiNmmo+14VS3PpZRBxAjjiCY/uTsO9CP1exxf0xhZjauj?=
 =?us-ascii?Q?iI9yCk3iNPO8TtZiCl2R0tSoJpvB8oo769zS/wF3unhOe0qUnO2rkQEVqYjH?=
 =?us-ascii?Q?KkYE/9crqeMZrPW65BwSUHq+SPPcYMNeJfW1l1FKjyMJSYPE/tH7kpy1cVfB?=
 =?us-ascii?Q?HuQYMfdrOPRDoxWfC6HR5BYdFOd6Ho7n0aor4zJkqukVq70IlmkaCX6uy8gR?=
 =?us-ascii?Q?pqtC1gquB+dLtVCodgtN4H9scQkK34nvN5cDME5A6Bwnouodsf1bUH859VQn?=
 =?us-ascii?Q?dvG7yrm1FP80Ell/5GyJeO5lP474lbriJxOkey9yqLr9P1UF5EqcXPORzByy?=
 =?us-ascii?Q?aRzEwAeBzxmI/1emeb+iUebuKygFN/ehi6vqVM2uImdxlhYYi0aeb4OBFwte?=
 =?us-ascii?Q?p88y7FWULVYlJZy4blf9gwK/1eYL3wuaNZk8HHQKsFv28ZAOxSfZA6Ruyd0l?=
 =?us-ascii?Q?lNmHUhvjAMBgAmYuuwybZ58uPERFw4Ipvr817UjujWpvB/h3uohElD5Pd8RF?=
 =?us-ascii?Q?m4bm6ZJTV+GXpvOBApMDwx4uClX7rd4CZr3RbyPxokjxoA7vcJvmNpJFfW3O?=
 =?us-ascii?Q?I87O3jpAI0xcu/VFNhKS7tawkWvq7M5SVUviEdqzjoWzH1MtdX5+kO4ErPNJ?=
 =?us-ascii?Q?KCEZuHf4YNZpNa630w3i1Z0cLag4bk+7+8yk0jPVm1TAYiYSn47Ug0MpFkYz?=
 =?us-ascii?Q?l1cgON1PuW0LNHKL75ZJc0Ptvf10W4CGUO4UXO+lt6GZXjKgYpFFYmM2j/SM?=
 =?us-ascii?Q?9XxZKZEsRSnIsyDLqMqzc3FcLMzHgnHYpzaRFeMqKNElNdsPgR8PN4yYnX7C?=
 =?us-ascii?Q?GBu8hO+1VB4Fyvi8O3RauNhJ8VVPSVFToIAPGiRsu+GKSrfSUiY7S486MXFw?=
 =?us-ascii?Q?lixP+RL3KPhXnfxbVCzN5+8m5raWj666BXktiUBoSNzf09ep83VjYIajL+5s?=
 =?us-ascii?Q?hUSjw20EiGQ+VFLLrZMIfx25rq78lFVMndipT62vPIM8/+E2najfZM34vn2h?=
 =?us-ascii?Q?/jkBxxyo7Q88z5uJfyW9MdWp0ouzpgzlWhZUVc6HNtcMjQjFZR/DYG60yfL2?=
 =?us-ascii?Q?uRdxZBxx1pbpvF0WsS2aNP3ABLIC0rKI8C54E/5gi8hUtHO5BRe+snhlSmTf?=
 =?us-ascii?Q?qnBkcFjb1IS5sLGdTuOZAdQfB6edTLmwFO29gU/R4qMPcn6N8QoKElCz4E/w?=
 =?us-ascii?Q?8qceGeB25YtIgPgeZ6n6YOvo4EuY473nEMJvEReW3YO4uRdsv9NespeBiNmu?=
 =?us-ascii?Q?qCRgMoDStgi84seIjr0EKZp3fzk3xt27UtYAyCnPOGPMFHYdPAgajZypGq0V?=
 =?us-ascii?Q?dLyQmXt4TlfoQlDPtYHfZXMXiWXd6H4D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?M6+L/apu5B67DSBN7luaD/fzZLhBsW966f8VNZNU9hMHwG2bFbOqwP2N2hnL?=
 =?us-ascii?Q?1R1QHO1ils8euJC9YrW5iAY4Dao375SA8PxUrPEfw7Bx41uE29VtTJoCgiXz?=
 =?us-ascii?Q?naib55DFT+qU/gFf86cLMQMn1Q/VkMCbJL7w6IRY+OA9YideZkVRsgxZguy6?=
 =?us-ascii?Q?2Oy4fR9BlqOhFJPsLDzbpdekLukTK+TqetCHNAkgry1UxeyyQ6YUOrYciUQp?=
 =?us-ascii?Q?X97VbnDN2feJqVa5OGc99oIEIvfAep5k+fJsDhvhThVjJitHfkzi5JVOmAIy?=
 =?us-ascii?Q?bGjiBwX1+C4DM96WpvMjJNllbIyYDg9PmY9w7LraoasSa0x4DuC8xJU1yfo8?=
 =?us-ascii?Q?qPIT5/mHKQzIf8cC2+0HM1q0RXdm3FfECxbsKFZzGFZJoByuRShdpNAnq9Jp?=
 =?us-ascii?Q?COIlP4DUJg7J0K5nI6bPJyhc10aOJ2fiaaU6EENU3FeHmTIQdK7IuO53cqgo?=
 =?us-ascii?Q?/PT4eJivatgj4ybZ705qUjxTFhyM21sIeDMn0Z0P8aF5EOnNVndnaD2K9pNd?=
 =?us-ascii?Q?DnuLdEOej0Lkf6QQskcGnLV7yQWPykJTQdMGO5GvSkyXQyxhFpFDiIiVzMcw?=
 =?us-ascii?Q?RoyQtzT8kTRcdf28MYRONi5kBEYE5PJVuQKmW7/LNzPNjQQVfKEuxMKKKY/X?=
 =?us-ascii?Q?IjGv22BAu+84lWZfi8iiGfXaotfd0/iaNAGqafbHgeh88sxjTssJGhu3cWDY?=
 =?us-ascii?Q?jIotBIDjhdkhBydGsIiWDHKOFJpZ0r10qPyZR8YTyBiehYpuIhxOgaXX9OoL?=
 =?us-ascii?Q?RZA/wBweYmI+kcu6j/kBsRt7xy5lrYyorrYV+jAq1lW3GfMRJZTviZzUyuGV?=
 =?us-ascii?Q?sZGq7kQdgzQUAMNDCU6FdJeRHQ8+ko7Vt1KPar/qbb0ENXT2G5NPDZA+qUNZ?=
 =?us-ascii?Q?5vETth68nH+9IUAx4mfE37yVmx2b4RxMmOBxAsGIjuogZdfCG4lBS98WBFNh?=
 =?us-ascii?Q?SwTJNUsmJ5A7qhQMPhg1uy/UwhKm2vUakBwsaum8+iLb2+H3zAIOZ/Zxrlsq?=
 =?us-ascii?Q?HtgS3T8xlNUa1owk47Q3VWuP1Tk//xFKHQKMsTmQWQxcKuvBrTy5VZc7AoFY?=
 =?us-ascii?Q?DUkqrxP/kSQmwClLBSdX4QvGiYdadRPoXOxIs4KUVfqkFUttLXScdSLFTFIX?=
 =?us-ascii?Q?8auuFWZv45+ZTl7nF8x5YVlWAc5+chx534bfhgmsM7sGX/XYn1bBb24VeAOl?=
 =?us-ascii?Q?37NrvD6GE/xHAwlui9rGYhIagcCVODkkgwt21BBgDEzGreOYE1wEtsKRhuw1?=
 =?us-ascii?Q?YOAyYi32cQkclXYA9MQbTNvMe94TMOotKssmN+aULR2yTizT1Vg0Eu+nBNQB?=
 =?us-ascii?Q?ENd5n9w65ojWCmQ3TB7q5m9FAXO+HHNl32oOqdbXupYh+EpulmTHYjxGHMfB?=
 =?us-ascii?Q?D7GAtJgcKJ0uAcrtjoULzwZRUJncs7o/07iubiVr/JBgk2BLQMAnNTAgiMVh?=
 =?us-ascii?Q?Xkzf/3BETtRltmzsUBqogIi7+X5WNLxd5jaim0TqSl5ljTa1merr/pI1NMGT?=
 =?us-ascii?Q?6UgnRJHCTCKFQ/T6+6IMcSla7GA60zKpQyaMw02VuPmYbDRYcYvHQRGzZoOP?=
 =?us-ascii?Q?I7pUgU68PmB5kWC9rJM=3D?=
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
	1E2buf7i1KQLf4tVovThTWwTlbVViQk+T+Z097kx+QwWiNtsGn0eBLcKSYRHVRIDMCZ/aU9GurtF4KrUxkZGfWv8NsLrvDcMbtzcZKITLj9KlIW3JXI8Jc/H2fbnvr85LBsAw/1wgFXAbCQ92nr9Tj++PF8Muus7gco1hXMYXGZWYSJFLksvfEOWOqVfA+khhLpkJuAjgqGgSocX2Cd3nZp05HbmuhsF96J7jRjB0UScsJ3/D7liIMeJp1phYSpoArKh1NtIYICJ8QoDG6D2rNzv1Kz+gsdJcXG21hs7hTueptkJqUyLz2Bhz2B+clVAwG+t9KZNFfuAyyAVYTi3zEIlgMZ6caF+Hu0JE3oTxmWHxr7WFQoBOGek+1w4qMN7bEj/0M4WN5AohM60bWaikkmUT4QVH2ZjCcxEgEH61FxmUuAxZcL2ORJoyeO0SnEwHn23u1UziX0TU2loWtyPsnYr45ynKw5Y1C02cZ5BP+2M9g01S/sEeu2KRIkKXIJ+jrTzm3SGUd17J9jmK24hCpXtum9MSX+4KGyUVNzHccUPjPEU4yJhCi7wEkLq4hluW454Rh/0ee+A/wQJBFiJbO7hNqpHpzqGwBu3ded3j9JfrjU+pkdMXiraWiXCtuBt
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ed7ba5-0b6a-4272-1add-08dd67f1b98b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 20:56:45.3873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ECAhfIdNn22/ksOeMFUXjS8vv3rWTBO4nELq0yvwagjEq9FdM2xCeXdyrSL9aBalLHmoG7OzuahFY7oN484JrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR13MB6595
X-Proofpoint-ORIG-GUID: BGcuM1rObHlOsFvJH9FwWXNU98aUQX8s
X-Proofpoint-GUID: BGcuM1rObHlOsFvJH9FwWXNU98aUQX8s
X-Sony-Outbound-GUID: BGcuM1rObHlOsFvJH9FwWXNU98aUQX8s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_07,2025-03-20_01,2024-11-22_01

> -----Original Message-----
> From: Bird, Tim <Tim.Bird@sony.com>
> Our next meeting is Wednesday 26, March 25, at 9:00 am Mountain Daylight =
Time.

Well, you think you proofread your stuff enough, and then have mistakes rep=
orted.

Just to clarify, the meeting is Wednesday, March 26, at 9:00 am MDT.
 -- Tim

