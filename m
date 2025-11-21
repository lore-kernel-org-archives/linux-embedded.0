Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0932248AE
	for <linux-embedded@vger.kernel.org>; Fri, 21 Nov 2025 02:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763693942; cv=fail; b=W86J88Ic9vx8zt1DeDdekLOTqa0eQmkixUB/RdyKR1/k7uRCpJofAzLJWDfUJQ/wkLE6N/RKwl0fW18Txrpb75pgvunnojgYd7qkyKUKOSIGzu2LHL10Xtx76KCl+N1TOPx4GNEaEcJTvRoPNd6udu7ibAk5OZI/OC18WwdNOio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763693942; c=relaxed/simple;
	bh=mApGqNZXfau5yC002kDVTAmRt97X+WgPIuHDFUQQaU8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XeRSdGpJzzRAI7WoJ+3kjnC8VAgNJGo7Re97WRMOrg1rwY3dc4eonekjKJbiJVO+HjV7lfBH//O4J3ruFcZC0pY50VB5M7w2gDBOAm9w0LUQzxuyoWTMz/eV+nl02Vg1AjxUjQw9c/Rv7YBbFP6kXRrEtvF6Z0pD1U6+xTHSJWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=X6U+ohjg; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="X6U+ohjg"
Received: from pps.filterd (m0209326.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKMXiNf018844
	for <linux-embedded@vger.kernel.org>; Fri, 21 Nov 2025 02:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=AgA74cD/5hns6VEWwm84fcFwgAzSs
	ztMigpCmHabMRc=; b=X6U+ohjgrNmOl8XOk+bAxJ+BlyoOLtEpMYdZ7twOSC7Vd
	sa0o9kTpCLvHuYfljmPx6CO0YnZ9gPcT7EU/j1Qm7agpExWpAn1pnqiS1e/fV3po
	UVO4bcpbcM4fntupNEtabUdn4GeHPBurHHQZaEF5IR7oDqiFNo2RWpoyBQYB7wQ9
	IcHCd5MIe9qR7giilpeMiyieZ4e7M+YovB9vnFcXUMr5tosOD2W+zLh28ARyFvMv
	znQ+ExRm0uCBKS2BLEQoq+OqWQGqawcKtPRrDl8uwznm7TpynhwTDB5vjgKlLWn7
	dFlBcvW31sRFV6txOtitKnd9G3hSYebKlCyi7rqTQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013038.outbound.protection.outlook.com [40.93.201.38])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4aefqe0brp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Fri, 21 Nov 2025 02:34:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1M5TZ0vyr0N+bU5PMj+3J8Ji2cvK+nwCFH7N75IF91dOGGww6Z63+0wuQaRRK0rniHEKvVHgZg2aKEhvGd9zeaLQnmAaZmnqHAGOoFesW6edW5nz2DZiAKAGpnvG8eNXhqv59DGwptSI+RPQWN+5EmlxOYaQCJR40L3P4OTA310ssJwxbd5swjmshfQusCI7wvO6HI/co1LobKe2z5fbUYAjKbT11kPMq3yAYruLx+A730k4cJkWQAbyJCkKzUTjv2LYU+0j9C69hDUeMlFwghqstoC6WQpJgvWB/vwpP4YliLAQf9G5Zgy6PvJXZDsGZC79uUVAs5VGf+PwSELeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgA74cD/5hns6VEWwm84fcFwgAzSsztMigpCmHabMRc=;
 b=P4dIG4w4OCGrmfNxyic/UWOj0XasjYdKHmKROwuZt2QAWYfcAUB4R08RhfLAv56MParn80Sxsp4NYFAjO/LJrMuYNzvqSC8JIb5Nz0HyZT6J/mNPohvCwpt7esk1GnmN91X70X3I4H5TRTRjWlZjXCobTnjQbq8AvLrYto3TJ0rn8kgrNBpiHP+jXbbCzl9eN09HohXI1gEqxm3w5IiESB6OZ07rIbcEa0zcMEhMNIITkrhHuyc8jUzTMfdfOaGPWbChU4dNlX03QsK16WAvdxmu/wd92+fACEhqJ5wt7JuNThNjP0ClRcAAJkVtnncikxPz0VAVD2OiE5790T9/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SA6PR13MB6828.namprd13.prod.outlook.com (2603:10b6:806:41f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 02:34:33 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%7]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 02:34:33 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: [boot-time] Reminder of Boot-Time SIG meeting (Nov 25)
Thread-Topic: [boot-time] Reminder of Boot-Time SIG meeting (Nov 25)
Thread-Index: AdxajYY8gjqYK32gSKytrCAkRhKXHQ==
Date: Fri, 21 Nov 2025 02:34:33 +0000
Message-ID:
 <MW5PR13MB5632E0103356DB6C0B330FCCFDD5A@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SA6PR13MB6828:EE_
x-ms-office365-filtering-correlation-id: 119ce267-0986-4ccc-1908-08de28a68157
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?YTgDUFAAyXil8z9lvuvKoYbXrT9Xj9UQ2QmT6p9MokXIuIeAjr5hSEZdVY/L?=
 =?us-ascii?Q?dXLjTFlViuvkQXSReIZphc64KAGh9BVVR7wQf/pMHC6Ro30D7gjew3aEDJN5?=
 =?us-ascii?Q?KQH795gWlwRmLu4yGY44CeT2lV+mJFSkfbhW3Uhhc43WxRP3/xspp7jd7Ool?=
 =?us-ascii?Q?B8acaOrLYiwVM9803nQ9Nw7yA6Wmg+sihgqUAhjS0ppSNiotfHEcTCqCZKsQ?=
 =?us-ascii?Q?29eBzS1VSHcV2B9LaRrrgkSsSqj9rxl2Vin9uogy6mIbF8Adr0UW93n4yLh0?=
 =?us-ascii?Q?RHYUPXGU/K8xfZIPMBokOPxVXpf12ANAn7yBxZvqbxSMQkA8mPlZhQiCgnZf?=
 =?us-ascii?Q?pySw+RaWbxkbcckWoy6curjQqPV8Ed37k0dd1gmGPTgfw8/lz3xp1fWP2az/?=
 =?us-ascii?Q?4/aUSUNpQRrgAvoC9llquCUK39NLwDJ+e6UWHp3V9mNpB+oTSccpGb6yHnjj?=
 =?us-ascii?Q?VzRMCfmrFjzRXg2AlAMJQTYQjI9tk49NhJ1yOiaN4ti3ePcg/AKlZh3oROzJ?=
 =?us-ascii?Q?yySBzEMbalSZo8oAWgaCRxYy5vrTT4jQ7gu6ZDlLo4ZC+03OoTFQaiXEMOlm?=
 =?us-ascii?Q?mj8jEk1VLMHMNvbs+77/VDmjFyZp6KD+BCWyKJgsjC3bI9pXqs0jFN9p6QOF?=
 =?us-ascii?Q?xCDCu9w8g++/YLiQ/3zkTF+m/w5ZXo0qWCWIvxXeXm91Knnq1nCJuu2koCK4?=
 =?us-ascii?Q?PD9BK8cYve1+bsURZ+eXauRnqLPpd9xSEnha5dnZGnRkDvcCMxwld7S3Jxv9?=
 =?us-ascii?Q?AKGFgQPKgJufzEGh+0ywHoZPqcf2XwFC5z25v9yE9dSHsNe0eZq2jtkMsL22?=
 =?us-ascii?Q?eqG0P1rVm+nkisewCNOL/Fv/mkRevfr9v6L+K36IRs0CaJLs4uJ3zxsw04K6?=
 =?us-ascii?Q?dgioYDuTvK8K9RaWTmctb5DoLyyajVVnp5yvF/4ZkFQ1jPpzyZokfaJUG0Zy?=
 =?us-ascii?Q?8t6pRATZsc3vabp1G4Fz5MESyVr1mB9XobbqM2Lk2rT3dbghaoJBbd0DuUJw?=
 =?us-ascii?Q?Qc5hamB3OxGDTCCXwHdnJPKsIJF5Cx29d7Psc9hOH+InI8V4+diP/zI2hZQb?=
 =?us-ascii?Q?nid0UjAPihPH2W3QZJXztHNIy8q+2Keo5HqYp7PQRCdipwBqTyX0mH88Uzdd?=
 =?us-ascii?Q?A2/JQF7qi36/fWLAUL43eX0cHipbLVuaY/i0EYU9C+uphI0ryK/y011CXZ6V?=
 =?us-ascii?Q?IvrgzMsbIVctF2d/7dRJM3b0nBOAYqMKG5G2RHlFJrkAnlmd/NQ34+le6y6w?=
 =?us-ascii?Q?8LOj4+VUUbd1Hgm1nOFGCBv16gum9J54gFtOfLWu7w+QA5P6xfGhWSS751Fs?=
 =?us-ascii?Q?oawUJz3Ri1SU/k45YiyFhMLQeNmIURhTYUZ4kZczwx5H5gA78iH1GIieYQeG?=
 =?us-ascii?Q?QnWLJDmC02BQ1J5TKwbI0MCv3RPn7ff1MSRUCwsM1NuDqJ5H9ZFATVyD6n6S?=
 =?us-ascii?Q?K7C8lPzEPUaCp9CtlnQkf+89BmgHn3gUpGUqidvweh58hFzrJGo9BQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0r4+kOr/oZTEw/zJ/yLXmhiOyS9L0dV6NKASgsoAOe1vBnNIAnpXMBgROBoH?=
 =?us-ascii?Q?eO/0vYDwcEczVs+4eMB43HOYoWIBzMd2vlkPs5df3YB3XDak/iuEfIaMDJH/?=
 =?us-ascii?Q?F0soa7xXZByOsTPG77V70h6X3xO/oKLwUVJHKfWCEtCKIUw31lEOUHiqUAj0?=
 =?us-ascii?Q?G/x+yxP9NdquCA5zMV4lVt/5xdP8TDPDHtu+dE9GX1BaYUuRKkLOn8OV1H0C?=
 =?us-ascii?Q?mjKKxntLqbPU82QLWBSG/xNf0fyIvv611CG1TP8j2mKC5XtydDRvdYj/2obd?=
 =?us-ascii?Q?KifBl/CfxyxATBqpPndwP6YOi2y8QKW3q69ASx9nQx3Sp1tMfofEqkAcKv3u?=
 =?us-ascii?Q?VNDn3Uz0k8QShK/WA0HfdkrBIapsHc8195nabWUBYOVgwZVRxwnbxCuZYv7S?=
 =?us-ascii?Q?0wBo2gExKeyuN/H+U4nlCCDsxqlLRrP9Gdd9epsTqJ9XSzB7up4LRMYDIEO1?=
 =?us-ascii?Q?0FuxbUw2T4vfduMfRlRhg2aUNfwDQs5PS4alZ67zQmJiSXqOjfVg5kY+inOY?=
 =?us-ascii?Q?xP1NDz9QiX/O+zvy15EG0G5p2AYfxECFTv0j10hnFg2FA6TQNOk2EVAStTIC?=
 =?us-ascii?Q?9JEy1a9/9PFkfhnMnvxY9gNYdG/tMNtqC+AyBm1nExrxhhMiqE9grelQJ1B1?=
 =?us-ascii?Q?Y52R96gK36TcK98UyRIulGcO6HjFLKxOp5UcX5CYHmH3VekIveqi+cfT8gHv?=
 =?us-ascii?Q?EJR6PayhR/qDuprZaO/m7CwhlwL4Lsp2EIpkOpDFz5Hg1seDRjYyF1A6bD+A?=
 =?us-ascii?Q?FVg9SEuLgZB6x2t7Ikk2Teg1XcdlpESMJ9Z488ytt+DzE42WU7oEoBgQmYLx?=
 =?us-ascii?Q?3NujA0Fnit0OnPShEPwCZJR1/YbAsWZt5/cl6UFOM+VhKEZWYwyJ4/8Y54sm?=
 =?us-ascii?Q?JPgb+9eEAa8GiuNI0cJLTY/kkpB0Shs84sPp7jmYfxcllZppKSprwqAwCCby?=
 =?us-ascii?Q?0YwnEB5ZhOr/Av5Ie5Mtvicx3E3OvLj4bofT5BbCxnjBfLoE0pDJyhZbmgdf?=
 =?us-ascii?Q?WEoDg/MMDUFgUJCkKcp7a5ugX90TA85d/HHa48U3F4NXiPUk01YBvDQR4YwJ?=
 =?us-ascii?Q?5Pra7DitwD249Anwi0f6Hd4BM2wYCk7C7+vUjcyYTy9nHdNo8SRkCECkp4+T?=
 =?us-ascii?Q?XSbI8+jFu9iuh70Ew0SLwZHe+d/fBj/GXqEkMN/qDGuhBeZdJPPp8+k/Uh6S?=
 =?us-ascii?Q?f9+c1QyS3S6LA9UZWM4QXu3W2nY5erUjqkAjeW4G8BsYzVzP8YwCI7IdEfm0?=
 =?us-ascii?Q?+c+zX6cNpJKCO4rZ0REePSRfb7i3X4dICT2ctgYCysBID9lKu8MR+LYU0ug/?=
 =?us-ascii?Q?vguVB+wi7QpMJ9EXvn6TqMFojlmTW0DwMI6mclXpEe5hRHfzGbFN1q9QMBBw?=
 =?us-ascii?Q?Uedi9PYu5xw6NdT0uEsKy/6dKD7BIUB+UxiidoLNPvx4RUbIRHAai9wuhI1i?=
 =?us-ascii?Q?CRYnVcC7pZnblzX1ZibnF8cq8kTq7tKZfWZyenfQ3seczcep3wokpbvYsmTs?=
 =?us-ascii?Q?olSCJYLKuxbveozRl84u0zwhz09awgzQjgKq3gIHULY1zRP3Xl4X9xTQiHn0?=
 =?us-ascii?Q?93ClzD5kPRaRjiEVE/4=3D?=
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
	5VVxXahEWx4HXn1TuArG+tbnAN5iCZuy4BEDUbqAT1GB0FQensjAg4Rog1JkP7vaMqVInBxl/6bE5Dlmar6ZBhlJqnNk4HZLvccVGVoNptT/S8YpWk+xKHNCy4PCZ1ji/EOE24ks+aP+vrEQGosh5prBjaCGkyEtYRme8LQS8taR0U9tZi6DaB3OAo0EuZUe2q7+69AlGAbgge75Ddrqpn8OvFc5/0/pMrte0Rdi10srIrm/yAvw1Z5cIma+3aEg5AQi4czf1LMQ11nCmXp8x+M8Oh7iOwcO1HiFpE0Nymwb5BCuYlt+/ZQYj6KKnotUw1DOujXw+Z4IQpenrtCQHJst42uNuO/RXQf3Mba5lJeYWgj9Xk9bMwSd6ESEUokVvt1zWrIYab3eXWsGRJDjxiZFv7XEaLP/CbYqyKdDw0lkupn+XRYE7CVoO2qTa6CPMWwvUAqEUu1SuSiGFVRm1X+Q0zU0Ln1588IkJ5n3euQTlm4lmzsSs8M/N1PMy39TXTv5TPNduSidKDKzl8I3zmmDXKb9yu2vh0xQGE3HmgmZyXPZvZImDUrjUa7PRRrLwYWld+PY1lNSrLfe9b818NUAklX+OMBotjtvfrJ8U/IYSGgwbTO9N2g4bdZSmhG1
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119ce267-0986-4ccc-1908-08de28a68157
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 02:34:33.2522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hyy18WU8K/+E0bVqJL+deL6Kxrv3QSzMSs+vuqlwfrd/FLssEoibuSYbLHKR58yhMlGFwzMRzMvze80d46nPYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR13MB6828
X-Authority-Analysis: v=2.4 cv=FOUWBuos c=1 sm=1 tr=0 ts=691fcfbd cx=c_pps a=n9MmWVbgKLYxIbvHr99TLw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=nXA5WNwiAAAA:8 a=NiL0GWOVAAAA:8 a=2iSxh-PlAAAA:20 a=Xu_aML22AAAA:8 a=OGjWj8McAAAA:8 a=whcOiXKLV-7GuLo5N54A:9 a=CjuIK1q_8ugA:10 a=-wH59cBETLoA:10 a=U_XVwcaHIQkA:10 a=fGr-7aqQv4RST94IA8XU:22 a=o_LaMfWX3WolavuFUIfu:22
 a=UYjydHh6ynBBc6_pBLvz:22
X-Proofpoint-GUID: DOm_jkcDVuY7p5YW50T9fKUm090huwSD
X-Proofpoint-ORIG-GUID: DOm_jkcDVuY7p5YW50T9fKUm090huwSD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAwNyBTYWx0ZWRfX1oui1ovvmdsV M96hwibXtc7H6g6sr8xWldoE5kZ+cwmegIEDlDmxNHZREjT8INzK/KhBJG5huS0xDISbrNTfTo4 jbhi34PTWnys6SLoEk9IJFeCOsEczf4FMn/ZjupLN4wujuCgbnOZw2fKokWuoJ3jnltic6m/YMT
 SXo7w8ICYxGvbtLS2jsKfWdhGF4VnyVKfbGtXHC97McK4zBiwCY9+1Qqhr1NQf42aTh5MTgtcXh yXcHPNayA07NWf0OAAgwXV/xT1VcHYLG5QCiY6oZh+L2K+X+S6lxiOYvCrlMEE32y4QgWOjUfIq LfTmh2BSI1GXgK2HyycmF6oTfn823EfiVD5a7V7sOLiNERqSOdBigDvOlTkBuBaK5+uIukB2ni2
 s2rcP6qU65EnYlYt81RXGYqkBcdlpQ==
X-Sony-Outbound-GUID: DOm_jkcDVuY7p5YW50T9fKUm090huwSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01

Hey Linux Boot-Time SIG interested parties (and other interested Linux kern=
el developers),

Here is the information for the next Linux Boot-Time SIG conference call.

The meeting will be held via the Jitsi online meeting platform.
To Join the meeting via web, click on:
https://meet.jit.si/LinuxBootTimeSIG

----
Our next meeting is Tuesday, November 25, at 9:00 am Mountain Standard Time=
.
See this link for other time zones:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2025&mont=
h=3D11&day=3D25&hour=3D16&min=3D0&sec=3D0&p1=3D220&p2=3D137&p3=3D195&p4=3D7=
71
(That makes it 8:00 am Pacific, 16:00 UTC, 17:00 CET, and 21:30 IST)

I'm planning on 1 hour for this meeting.

The agenda for the meeting (and where we'll keep the minutes) is here:
https://docs.google.com/document/d/1XAufoTT6VVJOTMzKMoz8SyOss-JA9H4J1_yVXQq=
5mN0/edit?usp=3Dsharing

The full  agenda for the October 28 meeting will be available in the above =
document before the call.
Below is what I've got so far.

I look forward to talking with you on Tuesday,
 -- Tim


Preliminary agenda:
  - items in flight status update:
    - bootcache - Ideas on Board
    - early_counter (printk 0-timestamp fix) - Sony/Tim
    - Unified Boot Log (UBL) - Texas Instruments

- testing/tools
   - status of boot time regression test?

- want to start:
   - boot-time tuning tool (wizard)

- elinux wiki
   - updated https://elinux.org/Boot_Time_Presentations with talks from ELC=
 2025
      - still need to add talks from ELC Europe 2025
   - added https://elinux.org/ELC_2025_Boot_Time_Presentations
      - was produced by Sidharth Seela using AI (Tim converted to MediaWiki=
 markdown)
      - please check for accuracy
   - I still want to work on a boot delay taxonomy document, but it will ha=
ve to wait until January

- Conferences:
  - Linux Plumbers Conference (Dec 11-13, Tokyo)
     - 3 topics at Embedded micro-conference
       - Reducing Android Boot Times: Evaluating Proactive File Prefetching
       - Boot time optimization for embedded devices
       - Fixing clock tree Propagation in the common clk framework?
     - see https://lpc.events/event/19/sessions/232/#20251211

Next call: January 20 (No call in December)
