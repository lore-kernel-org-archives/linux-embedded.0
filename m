Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928AB28EBF2
	for <linux-embedded@vger.kernel.org>; Thu, 22 May 2025 23:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747956836; cv=fail; b=h0YfX+cGMYqnfTJ+xKVSAF0mBQ7S+zWrGPxrH0WeuTRWo0LarW24Uk3mOSOePgwZe25Psup8VVm8JV41cWk8yqcsBXo4rc2QHobqmrDV1WI5gCdnKIU6+NrFjtkkE/Y/vKXoqO47pZVD32AMrjDLgdqX2l1nvfMs6oks6UzQf7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747956836; c=relaxed/simple;
	bh=CscQ+1YtyIeZluoLfMkgLVg/fLpuKbZPt+taHBAHK0E=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rPPV6aV+BqigLiVa/J3O00mVeoD25+Btp6iWBrV2uaxzsTYa0adSS7u7tevSeTcQTQ1EQKHD9WWZjWnJQ7z9NkaFkZdezK7cXFZ23Fb/of1XVvG+Ozk33WvQ/PR0nUED76DbopdBz9A6W7N+0jfFXsvGxLbIi1luhbKR+HccbrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=VmMl0pAi; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="VmMl0pAi"
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MMuMGS018078
	for <linux-embedded@vger.kernel.org>; Thu, 22 May 2025 23:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=YKGNY5Qdfby0iBPWua7w9307dAqq+
	sUWDWTT523FUng=; b=VmMl0pAiw5ha4pB0MRJGk3Z/00HKeH6dyBt1lIS5xAlXp
	o2ui5ITQyp95lwK8ijKwCYy2xZLihE4AWLEY5UWqCA4FLNV0Vm0ceJLr6/Q1gYj2
	emXHxGFeqqfj/f/+sFmdbN64lEBRhq0OSmRHnqczRYgvzyRao/Ipl4B5PjF/BzCf
	L1WWKvLwZqN4fo3MP1WziHduuietqOxkUTnOErCrj+optP3VgOgLU3Yn7aHyqGE2
	XxBuR97CcM5hUeAQrstAC/tUpHLrmE+CyPQi+FTSHcEv/HylNLmDY5gKmUnBiYGt
	ProkCim1Ts+VNM4vmEgLz08FLBa0HIpDx8yGYMAyg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 46rwgy2cnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Thu, 22 May 2025 23:33:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tY+JbVuZjyDPKweSHpnnSsoNWymGS2hzvIZvDL23wH9BUkCcodpQM7TpR1DcmpqLLe/umsdmFMHDdkD3fIA12PVYhiNaG6gh9qrosMcad5WI5eJF4iMsG2wSk0dDuZ3HfmyMRw8SwyMZ6TTlkoYNLeRje/AH+JraovrHIQ3zKcgoi/V7SYvdf5X0VNiWBxv0FOEniVstJthj1wxYGPC9MTwtPBtBKZc47xKq6JpYVDBF+kRSERqFwnOGQy0MwdyjBixt43/D9Jh1FFUoFph1elw87EsFotODLS5e/tIltf6AdUhKzDwH6cWi7b5LIp50UOSSB8GudkycK4rOkLEZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKGNY5Qdfby0iBPWua7w9307dAqq+sUWDWTT523FUng=;
 b=J4AsNN9b3wFiOvWwWFcHwi9Psqc8HhQO3t4dtcW7TN2dnGX7k0CKnxke4Ia2xOLyp98NFCz4BQ/j4gA8UXff/2Ha4b3vEqcGLTXGKoMkAN/B2qJF6GvOQaEUKGgHgOJh19J6FSh1Iz1iRVPdhrKz+m9aNWsiQZBxDQsAe9e/ngs2AgyGX11bJaOIoeKufatyLlyhUoP6fX2iFPwVcMN2xu94N5YDA2o+7wecn9v+YpMvM1XqBaO65s8dHOx00XpwQwMfewC/nG1VFi0cr2EGSUukBKtWKY81jzdd1pLEKkflJmnAKNN8RZtOKJhaD1aK14l/Tu7DilL96b+4ILlDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SJ2PR13MB6355.namprd13.prod.outlook.com (2603:10b6:a03:564::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.36; Thu, 22 May
 2025 23:33:40 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%5]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 23:33:40 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: Reminder of Boot-Time SIG meeting - May 27
Thread-Topic: Reminder of Boot-Time SIG meeting - May 27
Thread-Index: AdvLbXQDMtdZfESJSIOca+BoPWO6sw==
Date: Thu, 22 May 2025 23:33:39 +0000
Message-ID:
 <MW5PR13MB5632B8EE9EC410B617304A3BFD99A@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SJ2PR13MB6355:EE_
x-ms-office365-filtering-correlation-id: dd039669-5371-48d0-ce0b-08dd99891512
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dLaAFdtbf6UKaVCmZE/dQVci9XQ+tR0LEe8CutqWG85Ar33yQyi1jsunTcJI?=
 =?us-ascii?Q?xpBjdeepkm8BNXzu+8KRXIjB9XHVsaNKg8nqAUyAaOVmqOdG78b37DGfkFIo?=
 =?us-ascii?Q?sAV9R6hzkSXZZXBHAXqzVnfJYHIlp3tqlxczuOOL8PmPXuvA5z+Cl4gkxhA/?=
 =?us-ascii?Q?u+Dbg8q/tGAUkrloAnjKA2nCXD/fyU1nNKdDUVKQWMnQqHzY6r7BSEknRj4i?=
 =?us-ascii?Q?RgmjBV/sOd7BE14jzSeTUxZFJanpuab4Qv1kA9VjBLeVe8MwoW+nyUrMA68Z?=
 =?us-ascii?Q?4b0AlbRoq227bNeLaoOKPDaZduS9jW7AaEmouPLq5dzJu5xhZuCQGgPgFckM?=
 =?us-ascii?Q?AbLYTHBTCPs+R6X4L3UBbtDtdnb2D23XEu7L4dzXexrAfb7acWqBvX0q6tFq?=
 =?us-ascii?Q?XqQjPxJ/UAdoo0ukqcBAW1rpWdwSnfRRipWk8W5Ejw+CPuIhKvqhWkAxWCzP?=
 =?us-ascii?Q?43j0L4Gg35uKV+ejM/kmBAYjNH5XVUwP3r9PFXhjwlnlkBK62yMDrnQXw1Ve?=
 =?us-ascii?Q?yvYW3xwxFGOMAFv5F35FoQPVgRvvgzBnInlxI5b2xiWgji+UiwAUMRSTNBA+?=
 =?us-ascii?Q?jLDjuVjp1WENE02TEbjL8PMASkn4GMZTGfpPHm1lney9eMa7gDbVSmVlptSI?=
 =?us-ascii?Q?fZZd0B4E7YAmT6tO6HQDOUbKSflbIaJO/fIQWAhSBmV3L1aafgUoqdkSEIwW?=
 =?us-ascii?Q?bLL8q/0SrPrU/eQxsYd/TWKQMzwLEBiBDK0jiIparazEqo8yZCHSG4mSjQ5D?=
 =?us-ascii?Q?s2n4YGOVRuG9YEoK7Hm85K3rPp25kNTLNTe8m+qo5aIDPF0MgolD8x7zf077?=
 =?us-ascii?Q?0OZDkByPeYVRIcGkPYB1wcTn3z7JHiVU9r5cxZrOvBBj8NokfHEDNp9MZiQv?=
 =?us-ascii?Q?ZSTfT101V6/IFHzw/LE/5I6MLM0toiRfqnWOb+k8KJsytZLcFb8r4lVUiI4R?=
 =?us-ascii?Q?hk5Kinu+scl7rL8RppfatUfGUzpLU6lMwKPZlfuBk+dijXnpDYOhllLDmBgk?=
 =?us-ascii?Q?iOt9AD+nAogv7jZqPZCPJa2VFnzqzsnKaiSFbV/O6ZSe3Z9FCCC1b2z/s8jO?=
 =?us-ascii?Q?4SQGk8RtUW/dlNGVTuyWuMRa/jXUbKI+Yv3fnTjLogS8fziFpezFHhKb15g8?=
 =?us-ascii?Q?WWMFamautJXjCdtpRtevKcVnAcR2GtQ3a8hoXSlO9DVsnAp8TDEjhJeEiKSj?=
 =?us-ascii?Q?8i9c9uVaqspMpjDvJKuKfsgXihHYL1Mw+X/IrPnfWrsD0mvKm2rFBFsCmjqy?=
 =?us-ascii?Q?WHKW1Uxx+CXkqEmWBbbF8ZlhoYDr217wY1aK/EH6oa+Q3xOAAwEg+yFTTlQF?=
 =?us-ascii?Q?yJTvyV/lLeSfRA6xCqdQQnQsSgK7+1H6rwAwkbIlSDmGXB7F2PlbXWtf5S8S?=
 =?us-ascii?Q?V22BmPYhzGoq76ndbGsTECWoQhBL0CHYPNlsnKYSp8duB1WfapIFAHeW241l?=
 =?us-ascii?Q?sV+mJghOPUY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lkJKrI0sVbiRBtZpk6FJob6ZX6GeGL4DrRL6ugT3YQyoS8B3kIi7I3vttc3c?=
 =?us-ascii?Q?2TStiDmA8216fsyB/oGuw0SNECUpWK3M9l8bfaRLh5hWTdYClkd+XUczzi0+?=
 =?us-ascii?Q?9mvyvpvwX5exMovRL295nWhU5TDMaN8j21qDRNZ+XQPk9FCyJq5a2uSy8DIl?=
 =?us-ascii?Q?thDcoLXTo/dAKD9VeZ+TgSWOutDpBe0ID1D1+O8SPtFCcq+x8QqGh2+GZWxJ?=
 =?us-ascii?Q?N4aBsmp+NadtkXtPM5sMH4FlGKF/7NRNo/2n5I3yx2/oxnTZLwnoazwr5gvW?=
 =?us-ascii?Q?hoKCd0gSqNb6+9JoNHuwYIsy3Yk9FYISZgqT6CfjFxj4lU68rhNvSGjOQaUW?=
 =?us-ascii?Q?BbtIbk63ttcTWIkFrK2pA7aTSISQA6M4EMXtsbGWerRW2aU+LtQQMIDxuYs3?=
 =?us-ascii?Q?hLTtfDROaSA1ySI+bREwYsEgRtW297qoQH3LyLe8766OkTL4BdLsoRTJRnps?=
 =?us-ascii?Q?v2cZQ8HQv7jQPEur4YAYQw5l0QU1ICX5UFXAGVNh7M4SAGt8GhXo3p9OwfLd?=
 =?us-ascii?Q?PI0CAqdmPO2WUJaJeCElS3vd1ABJfpmRHz2ZEVxcFX6Q/qtFa8dCLnDqVfkZ?=
 =?us-ascii?Q?4fkmDhdb9QoZxwc5oBuK/waIDB6+lYs2mOxnSm78FJOHQ/5gDZ+s59JVCuLw?=
 =?us-ascii?Q?Ejn4Qe8BNmspgx4xeyw5k+4oBVI+RR2AX0hB+nUH6WY5DDjgSMZ9rYc3U7sz?=
 =?us-ascii?Q?WGORKKmBX/cPtYdBx+5SRBC+tk91CXoLAP7/xsSgtzz6YoUXYKk0aQc9zXbe?=
 =?us-ascii?Q?Fr49Mv1rG6kAXYeD2dZQD+zepR5NKWf9dtGBtXADMGrbDOQuMuNKfWNikNXd?=
 =?us-ascii?Q?hxRw8DzWrEnfn5/v7R3IJBicZOajymilv2RxHDEusac4PY/qHmjPua8DLkxJ?=
 =?us-ascii?Q?DDdeVSrwUVrw/SEELolM6KDMS66eiMKiOqbhSWIkSm60DXaC8EfZsDwjFpwW?=
 =?us-ascii?Q?iMxneg1Lrb38XFBeBFNYvjrhvWpTsYOrPemR7JSnGI2F0i41tfltCa29Qr/v?=
 =?us-ascii?Q?cjLVqxAmAu78wceuAltYPf7WdWluLGdXuWiQ+gDBLe9M/2y9QYm+hWUgxP83?=
 =?us-ascii?Q?tAP6ir5vYtlDdZwE3Gv/igowrNzsl8mGsdoaXsV4nVhuE+kHM6e7q+QL+QDN?=
 =?us-ascii?Q?vaEDSQCKAcUY4jPUd4HW2OVvA014JPGnzJZvRr13DTwq0q3A0D3cTFVIBTro?=
 =?us-ascii?Q?Lqi5crcS4hz4k1Tkp6Y8/zs9Goq7I3JNALJd1mFTidYb+Cow/FnCZ7i8jt/z?=
 =?us-ascii?Q?g3FiZXk6a8RP79sFnZN+av8jN9Il0Ite8DaG00lFOXYabINP9w/vwkc3ZJJu?=
 =?us-ascii?Q?ixHbjx05oDauxQNpSSxg7x0cYsqMBjGnBDqYf+jozz90bcuQOxkHia2DTrgi?=
 =?us-ascii?Q?DtwRoBscJA5a8GczIbH8O62uaQYjCvIZQkPCUiayXUuHvIZUXOG7FvIJAmDn?=
 =?us-ascii?Q?dW9Ix0Z5Js8pfS5o9fn9sAoqQr8b9Zs8g0q5hQ0riCyFdG9797wNPXku3nl7?=
 =?us-ascii?Q?IDxL4a/t52jwff3d32lSgkdXMKyTNqCI86q8pDlfspUy3vSekO0WdEShgkGF?=
 =?us-ascii?Q?T+5DEftCIwKHMdoDXCA=3D?=
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
	7BUzcgSBoGxTXTc8+PCMMtzpNBKw3kaC7jUgkGLATOC+2LRBtIWQt1wE7lxw5Ves4kmaBtYNBYNXgMx9XEGs0iRbs+92MqqLldsvRAKX8bESRE7UAryqeUzFtQZc/xEp58r7lWLY3XlEWRbxyIVILz/784MzEVEnyLfvUrYVsyMszs9U27IGSM1c3XRjp86ij9cZovHGgEkoQKg/HCuV8tTeIpJaFXknZCoWX4eoGuaYmuMEkk+K25eNVQojHT88qmh9cyUqMQyUTFc0Wuk5qGjJC+/H1pVtJs3IbZKr/+n/w9e3ZxCFi3hofYMUAR6OYkbe3l6yzpqTqEbK121Uv14QtC4DLh+x0Uj2LgqPE0N97hIIk5KZLUzwB9t19F6+VVv0R9iUNltrDw9IwH1zQo9H+SlyvBta6+YggFGbp7ODH06hrAlMjxOrZZ2OHT/dBnk0svUvXAWXy2p22uNhAk9WCY1Y5pmoxBn5Mp6wRzDQWXSSx+qlJiacraLrwS5GRs9eidiS1xCrVJ5iHiFfVTIp/zYO7FQA0GtGquvSeEaNYq7d+ifwVqAW2SudsD6bMWrjdDY7Vo4aZPY5ClVVdms4EuO2rROoNv2obkI3+jq1TlGT5WRYZPBgRIplfoMW
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd039669-5371-48d0-ce0b-08dd99891512
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 23:33:39.9286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jJpBuIcNg7pEHbn9VC0hctFqw/Ermh29nuuLS7Fmv2Ec3AjvTyquJbXX2Frjhy3Fc7uO8n5H7I6AiMnEzlJoyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR13MB6355
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDIzNSBTYWx0ZWRfX+fd3AQ9RefRS vgwTNiKHgJY2aF13U6PPAV0QKt/hYePXrgKy11F4rTljyJOoJHCAjstqvtZq2gOfveoYMtunJzu hoFCrg9dOTtGsFQaXzpC2mNrpCQWmAe7NENxlmqlHiJDoynyelShbVcciFlPToBZI72h8mQbx4A
 5D8a3n9ejeAG7e7L5cADuq2CN/r/jlMHEqakRDw1qFASAJNwRYDnGe1CpDK67hqJ6tU4kxklNvt 7cymBmuLfMw8x4CbjlWWWgntL23ecpU2ilGvYeoIxokODuoIDyo/yRztmvkl0VksUYweeolqCo6 lWUcijjaw0GUXPqIqiYIBxJ7ircBXx77AGPHTZ50yZqrM/CYdQSo/zpcHbfsK8KJC48Z/9pwegx
 /SdsYbuLeHLvluCUNHOKD6c6h4MEjcm5bqF1dGKSG9WlOO0B7Fm1JRnNt4XKqesiaxN2VM7B
X-Proofpoint-ORIG-GUID: sLkmmCOJ-faGALKGQZxP62GCup4j8m0z
X-Authority-Analysis: v=2.4 cv=CPMqXQrD c=1 sm=1 tr=0 ts=682fb459 cx=c_pps a=4IGGKwhCMA6ph+0beaNuyw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=xR56lInIT_wA:10 a=nXA5WNwiAAAA:8 a=NiL0GWOVAAAA:8 a=2iSxh-PlAAAA:20 a=Xu_aML22AAAA:8 a=JUtHJ5RBT23cD9_e1k0A:9 a=CjuIK1q_8ugA:10 a=-wH59cBETLoA:10 a=U_XVwcaHIQkA:10 a=fGr-7aqQv4RST94IA8XU:22 a=o_LaMfWX3WolavuFUIfu:22
X-Proofpoint-GUID: sLkmmCOJ-faGALKGQZxP62GCup4j8m0z
X-Sony-Outbound-GUID: sLkmmCOJ-faGALKGQZxP62GCup4j8m0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_10,2025-05-22_01,2025-03-28_01

Hey Linux Boot-Time SIG interested parties (and other interested Linux kern=
el developers),

Here is the information for the next Linux Boot-Time SIG conference call.

The meeting will be held via the Jitsi online meeting platform.
To Join the meeting via web, click on:
https://meet.jit.si/LinuxBootTimeSIG

----
Our next meeting is Tuesday, May 27, at 9:00 am Mountain Daylight Time.
See this link for other time zones:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2025&mont=
h=3D05&day=3D27&hour=3D15&min=3D0&sec=3D0&p1=3D220&p2=3D137&p3=3D195&p4=3D7=
71
(That makes it 8:00 am Pacific, 15:00 UTC, 17:00 CET, and 20:30 IST)

I'm planning on 1 hour for this meeting.

The agenda for the meeting (and where we'll keep the minutes) is here:
https://docs.google.com/document/d/1XAufoTT6VVJOTMzKMoz8SyOss-JA9H4J1_yVXQq=
5mN0/edit?usp=3Dsharing

The agenda for the May 27 meeting will be available in the above document b=
efore the call.
This is what I've got so far:
- Round-table of on-going work
  - Report on Unified Boot Log discussion
  - boot time regression test
    - Tim currently working on:
      - finding common printks (to define kernel boot markers
       with adding additional code upstream)
      - reference value file meta-data matching
  - Status of patches being considered for upstream
    - print initlevel
    - show_delta 2.0
    - deferred initcalls
    - anything outstanding for deferred memory init?
  - documentation or tuning guide?
- Things to follow up on:
   - boot caching (The Good Penguin work)
   - boot-time data wiki
   - elinux wiki Boot-Time pages
      - https://elinux.org/Boot_Time_Project_Ideas



If you have items you'd like to cover, please e-mail me or put them in the =
document.

Thanks,
 -- Tim

