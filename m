Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863BB1DFE16
	for <linux-embedded@vger.kernel.org>; Wed, 30 Oct 2024 08:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730276544; cv=fail; b=C6Iaw6FRqB2ckY1EiNu21JdmEymbHa6ffhbOZQKQQoro0GtgDSdl1aMfXW0IQy9hokRXjFSzr/w61kD8tPYZLFTTedJERbOXowyqnUmYHgRttQ5qvbCRTCASDu1ii0qPwGB/ZuZqoGOOD+8OQvFf82t2yYmUSa5qfB9mX08hqks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730276544; c=relaxed/simple;
	bh=K3CtKdpQVp2Hk1JtPS7iGwBuOLLTPAeWZ31+yUoQqXU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FrnVXZs3YzST7uv08CUsO2L23bfjnBp8f35o2/Dj1sUkP3a+s2C0lqICTVsn57Zv3UWVzDkOL/uMzz+DQ9QpziSyV2KbNhViLnmD3a+WnbqkSHTpBGvBlZp+qujiojcC+bHl0mUzy4fOIYya7ES197/arTyY9daoPwNVpc2vqkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=ImBodPim; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="ImBodPim"
Received: from pps.filterd (m0209320.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U83nfX027854
	for <linux-embedded@vger.kernel.org>; Wed, 30 Oct 2024 08:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=pn0r5wawt0i5xhmZ7dfhAn3LzPMsW
	2q3NrNs8rPSzy4=; b=ImBodPimFoX1jaRU1LJFyUnZ0iRChhAsARz6gAT2XEVOw
	Hjj/oN8kPfFTZFLaJqCFMEqchmlsyUVlHgANJymUG89hJ32suQaL3utjsSGX+2QE
	Ok1V2pGDs28rUqjnoH3DPx/s9KjwBiGP2g6Qx0Cs7Ct1I9v5REZjXgefOWf0hDCA
	n/rpZA/Ibkw/nSqEbuMldfB/qqVnUPbRyYai/CeQenCwdF1BpGlt0nHkM24+m5Ze
	F7ViBBk0mvlQWF2BV0hd6XfVxh4yLtNWikzzF3YwZeGLf/QHIo+938oKoHwuENQY
	kQn/2eM0cePARbxqx+FOmUF09TAzNuYdDsX/fEDRw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 42k2yqgn25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Wed, 30 Oct 2024 08:22:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYESlnZTFGIX7g1khvDNoTuqzTfZtmwJVKqzA2hADcG7YDckN3yU2M50qssUMVR7lVbNAM2K1Vly/8qFu4qJ43jKZAHskefIOtLH8CbJZLiLr+R6X4+CwlUHASAoVnwLxATIkpOsRsrvYJ9bY/9OkCdS7xo+2FDXdSdUFxpyIeuMJUdcImMhpoitZCcG13PjDPEtxuNHofAqf23Yyxx1NLAvIh0vzFDnHHdmqa6ZQHgEEXVZhucFjmjDWb6VaeTYlZDJknx6m9pLbFWROkzyeTgk/W5JJpmkfSnoyWGC5QTwUqO8yuzadvE1ct+VijZXQ32ZUPgkISr9zo/M+e5poA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pn0r5wawt0i5xhmZ7dfhAn3LzPMsW2q3NrNs8rPSzy4=;
 b=uwPTCdIBSCVYWetNg5gI8nv0GS9l//EuZY7tcR0UXH67y65bmedjNTc758UIi68QKAqCPo11R5OSfqzMfUt+Z+Lcr/QcJ3hsbV78xOfbgkMLicB09riF2jTypXMAyCl/Dez9sNaUcJ9l7qGulfKtr1ekRLNptsKxsvS70emK2F0fIVOWzfhBuFqSGxdonXwjtggtXg67tOGWCTvPXDr0pTKekVNebDQ0I+PfNw75NnPQVAWN9ViWPg/+EbOJJhxSqLqzC3uam2zFpRJeYgndsynUMvJss7Cf7GiQZty0xtjeovcXCG8JCTcglrdAWSRq794eKF8WIizDAw9/7KKjkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by LV3PR13MB6900.namprd13.prod.outlook.com (2603:10b6:408:275::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 08:22:09 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%6]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 08:22:09 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: [boot-time] RFC: proposal for boot-time tools github repository
Thread-Topic: [boot-time] RFC: proposal for boot-time tools github repository
Thread-Index: AdsqoTd6NBTHlURFRUuz6jBESPbDUg==
Date: Wed, 30 Oct 2024 08:22:09 +0000
Message-ID:
 <MW5PR13MB5632D76A85C2DCE48B5AA2B4FD542@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|LV3PR13MB6900:EE_
x-ms-office365-filtering-correlation-id: 57b588b8-677c-4d92-4aa7-08dcf8bbf27b
x-proofpoint-id: d8690225-876f-412f-87c6-a7cb45557a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|3613699012|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ELdhRICjDW4EUSGyZBSAv2Q7vf3SXTGAYlAlJIbH4UrRZsbr4Mu3+LAFpS71?=
 =?us-ascii?Q?9y8yoTy/JIxRLjfX8rfBUnYzoT6I++XabXRUqr6sVg3pi+7Eydof2jIqY1kW?=
 =?us-ascii?Q?EpXksjYPt0WMOFvY5Xjk14Rk6w4o8RfpwHtN+i3pLGxHeN9yz4464CZKEXBD?=
 =?us-ascii?Q?8LXT8Ng3pBny5wsntL//AS7Ogs1OYWSYd4SExS/fH/ZCWGgrOHRaywx/vmeY?=
 =?us-ascii?Q?JbkG0/D2i37ltahuaUpwrdVZQDsceS4B6MEDDLWoAikx5lQRc+IjTJF43OYP?=
 =?us-ascii?Q?zRPMV57hDeLStXMCGqH8aKibmSO15Cw7mr1AVP5PGEdsfOdvDIrRUXmfqvBe?=
 =?us-ascii?Q?M0V3FFbZ2dJPwzYUoNv9WtIq2o3mnEqeLTsc8tnT8V1oCUbctidcjzSM5PV8?=
 =?us-ascii?Q?SSvYxwN4ve9aCfmTifcqYrVDdyk1Yyz6ccX8XGezNfXTcXd32J2iXIwThPMP?=
 =?us-ascii?Q?j+8qb2XAJsrYpKJx3c4sMfbtdA7ZLImNWx9ZXqwI9wnadNw1UjZHgXoN7GQL?=
 =?us-ascii?Q?wh0B8XT9dg8zILazFZXuIuRnwjmBuc7/N3PtKgtGzQrvBaq80WHODIH8H+KF?=
 =?us-ascii?Q?YGqBGEBkOt8pSkDD/gWUTeDAJxt/ABR1lK6Vfn4IOJZZJgkj/6lJoeVlSPc9?=
 =?us-ascii?Q?hDY+HFD5IKIaGgi+BpwloJsBxUpKqI/a9qDKgD4ByqBPMRODuoCTNMq3J3o1?=
 =?us-ascii?Q?XelSW9Bw2OeiqvDs/hX7DaizQRsuaYfUlI8WXsYYoVLnRTUwFinB3x+oH1oN?=
 =?us-ascii?Q?1ka8OX0qY3FugAOsMfPSiuH7EKUQmM0sMjdcJ06DxPhagOtAF4jDyjGB2S+4?=
 =?us-ascii?Q?9FCi3Ujs2AvKleB5skG3vA4NOxp9ejeE+1QM2RvQ79EQ7w86lg3pUTSExBGS?=
 =?us-ascii?Q?2WD2X03IQLmHCroX+7s//+XIzkMUPAnjMlZuzs3X4n3essLj6Uy7hca1HU1v?=
 =?us-ascii?Q?nWL4tOWGkLJrXEkFOmWCSuC32rcMIo0BOMiH9aw37pXT9dwIDjIm2eYqCY1u?=
 =?us-ascii?Q?hBzESHOc602OAAHAbbyKSW6MGO7PfZNAp+75Q+4Y5ujTawGzBUS0IAy+m2SR?=
 =?us-ascii?Q?YmIjxLg99P3XElK8aSykvJHHSKrGMiovyR9ZBNrvJID4TNyhssTmMyttg3Nm?=
 =?us-ascii?Q?691udn+IncnVpQWdg/R6vuWrx8wmVfV53zsGCgOS2ULlgLtj4uzIYN18NqR7?=
 =?us-ascii?Q?bNyMmlaFxbFLIweOl6Pd3oQ31PAsldBmk1ANEwGJ/BXGwy1LU0ZWPmvzDbiU?=
 =?us-ascii?Q?ynAAfrAJHRvgdZqqDiUlY/guv2SlCtAcvlNeO5Wj10XEfU/n7uo/6AEKolJP?=
 =?us-ascii?Q?yVE1WM8mP0sUCHiFKfW5pAGTt5pCmd7bktYKKRy0+ZOBH24xMKEkWDjooP6C?=
 =?us-ascii?Q?6/69y0eTQKAinFk4zCbB1t23aldk2n3nEj5vPcu+ii94op8OcQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(3613699012)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BXl6kPeLd3NTDoWfB0Px3aD82byM9vkGAKbaerTP/BPDnTQIsM7mkU2lvOBb?=
 =?us-ascii?Q?BM8P3Hw8gp8UGe61rkxaGRFW+KxWZ40GwVvIR5oeKsEdd8bwEoh574FIWFXr?=
 =?us-ascii?Q?12D9+JvzuFoWnVofuvLoxn0FA4qpZTwyFMg2xb67ACj56S8WRYODM8ZeLWil?=
 =?us-ascii?Q?kugXKmDgUO1+AFkToD1hMoJetua/9IUzciRn9Y+ohis2qr8IQNaeacC6uykM?=
 =?us-ascii?Q?VCy6L4vQIrUmbhN/T4WiM7a4wMH+m0+uCFcUQewYJPi6QYCOR+lGIBI0sKh0?=
 =?us-ascii?Q?DPzNSE5OuJ/LlvahpmZLssEL/K4fO+bDy460R06KaifkKl+Cfsp/7yF/e7dB?=
 =?us-ascii?Q?7r2saGCKluBBuQnzCxZFmPrE9/zVb/yPY5xJmFsj06O6EpDO9PNfDroaHM+2?=
 =?us-ascii?Q?jnCmlD7+oV1QooD87ly/xg94ykRbANlXUTUeLI26xgSbi6I5IY32/D+0GRsL?=
 =?us-ascii?Q?lsjRQX+7nevYkC6agUMPeNfFVYeg51hKSgRCPdcx1sQcYY1gjQmbfbxjFo/f?=
 =?us-ascii?Q?FPKHgHg531Nr2dAEMFnjzEYSNyVVlV/asUCCNOBDHNdGKBi6BOa49yGEnzek?=
 =?us-ascii?Q?LggRijdek4gjybjWFQPgCqlq1RIJKJzuhHPZxlDXpQBd1YTrBe4+/nb5wMlB?=
 =?us-ascii?Q?DJbl3CH8lUg+Bj6ENv58es1BxFsRYs54ZoOZLtWy3GyCvg8toIjvOEhL4IZS?=
 =?us-ascii?Q?PW83JaO3iaBIkidKNhY6eJcs4Bbcak/vvMCp+qHxsIf7vHzLoiVbnoBV16o4?=
 =?us-ascii?Q?xE8/NC3G+oGx1YdBeWBOPgfhMceOsaEkyuCmWNEA5kMiKSSqkbAEDQNvzjAK?=
 =?us-ascii?Q?vwa2+Y5nZBGSr5mp74pQfoYGqgIpYQB+KljKq57B2s2gFFcYuwtDm+1bHx1Q?=
 =?us-ascii?Q?st3yDz7bEceRX/tYZHDRoJNshEg0RjTwkJnCh0bIpkdIQ0N/ldj1DYIpECI2?=
 =?us-ascii?Q?iRC2lNMR7k+ALNBEA10gMd56KTenlCsqVLT4Z+Qv33K6SqYAOFzHssos62pq?=
 =?us-ascii?Q?paLrDKsXK0Dmc9P2tSF0DpVpeKLIsoexzhjhaVSf+9Z20Q1LMGJee8HAEt5E?=
 =?us-ascii?Q?CHywySk6m41WQ0jlHI1XwzQSZtxbeTFfQbtVeTTp8QgKASRuSnHVCeJPvU9t?=
 =?us-ascii?Q?jKq8sxkUvKquTKmhaVf5kPRhDrC/7EbDazr54tpf4/rjM6xOIsVTW2up1EWN?=
 =?us-ascii?Q?mwELVrQOioH8LSzElaG3GdX+TGgjrM+IBGKzWXjG9WfSx5S9FwlfnAdQHug6?=
 =?us-ascii?Q?XvbZXoEA4Q0XHy17DL87OnNuJArogcqiidGmqbkZkmwdWvfHqao9yJI6Xqz+?=
 =?us-ascii?Q?1qIaE9DO/PWCbVpaWzmOhe9FFToFfYvma7wSA7sgM2P14DeA7MOGlxfAnvet?=
 =?us-ascii?Q?1oMao0v8uOfjjBF6fd7dLRBHnEP+jDs0+e1pWVLTlgNnjPN6MIJU3+Js3o7O?=
 =?us-ascii?Q?+G14Fwmc0Wck2qWZIMF/PxxKcY7F4B0tw1yR5U/VOcajfdyfezni6PQBlZz9?=
 =?us-ascii?Q?4QNtdGgaxiY8f5t3LFGMvvCYQRO9df1crLySfqFCm4bT2UQBzMpGAN4FrmpP?=
 =?us-ascii?Q?q+4zJ5BcGbnSBkLDQLcthK36Qm5gFVeNruIBiXsgREGo+A95bdpyxzfm4LWF?=
 =?us-ascii?Q?7jRn1iDLEca7Wrc43gfjTe8=3D?=
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
	M1a1oLP750MOhysvLpZKGQFMeRK5CZuxEy40QMqPvJqiUo1VXficqZRjT/2Ky5kFEv9urxD3UwGtT0KfQadwCUrKUrM2F+VV3Ahx+DDDpnJYkn9PeJwvmWsonkKwX9SwGmFcWCYMnzSIkKCUBS28WqrrBC1YZI3B5U//UiAbkpAgEV1zoRj5dm7TotiMSnLn1Tr+1HMRJUbczmUIa05RapDm9+YMkV4UJh7szrF1LZS8E4BVeZXF5geH9r22fepQaY+jwlh+sKW5mM6/MZMz8JB83fZugU8NpYNdquvW29r7RmWIS/wosp+k9HGmZvet+4YJWcJJnyVSYdiS6qCVKLu5Jdnlpf1a+A3N2n3OLmBC/flJgLM2zUjRiUXsavhLJyj3yjgB88EFuCByfWEC2Yk0vCelqdRLz8ah5ycRD1LSX9jpX1gNOAun15lEr3XxW6FH+a2J12Zihjo/W61tTCzLsD3X3Z8wPQvjd2bY5UkZc39XI9622eEZNNmZDVaMIDgBmGv+DR++nUWGMHP7V3zFltSPybCXf+ayvfj8aLe94ZCa9d71XsT3+xhkcHPtZFL6C3/NbzbPGLMJ12QaCX7iLdUg22i5r3V+aTvPL6zLU3mnay5qkkD3XlFYUJvR
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b588b8-677c-4d92-4aa7-08dcf8bbf27b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 08:22:09.0328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mn/9nnsTk4VMh6+Qw85XbAmAV8kdRGwSObZT2N+UjVIj9TdF76JWW3QwUwfWJvSvTbQq9N0KSiJDsbE4q+CnPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR13MB6900
X-Proofpoint-GUID: AdNJpPawjWM6b6OcoWAm-vYs2jfR7vYB
X-Proofpoint-ORIG-GUID: AdNJpPawjWM6b6OcoWAm-vYs2jfR7vYB
X-Sony-Outbound-GUID: AdNJpPawjWM6b6OcoWAm-vYs2jfR7vYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_06,2024-10-30_01,2024-09-30_01

I have a few tools that I plan to publish over the next little while.

Some of these might make their way into the kernel 'scripts' directory, but=
 some
others of these might not be appropriate to add there.

So I'm  thinking of putting together a repository of boot-time related tool=
s
for people to play with.  Here's a sample of one tool that I find handy:
----
#!/bin/sh
# sort-initcalls.sh - sort the initcalls by duration

if [ -z "$1" -o "$1" =3D "-h" ] ; then
    echo "Usage: sort-initcalls.sh <dmesg file>"
    exit 1
fi

grep "initcall.*after" $1 | sed "s/\(.*\)after\(.*\)/\2 \1/g" | sed "s/\r//=
" | sort -n
----
See https://elinux.org/Initcall_Debug for details.

For tools on their way upstream, this would serve as a development reposito=
ry
where different ideas and techniques can get hashed out.

So, does anyone have alternative ideas for hosting such tools, or comments =
on
this approach?

Eventually, I expect to make a yocto recipe that would make installing
boot-time instrumentation, testing, research and tuning tools easily availa=
ble.=20

 -- Tim
