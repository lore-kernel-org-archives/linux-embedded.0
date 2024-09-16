Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2123.outbound.protection.outlook.com [40.107.20.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8D11311A7
	for <linux-embedded@vger.kernel.org>; Mon, 16 Sep 2024 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726485760; cv=fail; b=TF23HERjTd1JVEPOOaKGKlCbs1BRAd/IIn6RfweBJeahfdr+0h/rhHJ4d0OMtGJW+W/xpi0E0h4c/bvkAfCYGMZpqDfSPIUvUaHcxxpf7rqtMokjA/ZNT77I//yWCWbVquAk3KEtaH6kbGCuIFOJqHJ9bAm6aDx/1eG15SANi0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726485760; c=relaxed/simple;
	bh=hvPRQV57dDHIptFvuPAMIhi8OdI5JAUmPbyctlaaBn8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UVBiP5FHxi3CfxVeJV/uOZo0c3+dJii2EqZCkTYDomerWlYDOvgK2KoksVoyUR7mLzJwB4rsfIEIfOvQ6wHGkfRMDg96P4SwtC3UCz8Xq8peeNNeY023k47cyJoOvRQOojdrR5rqcaPZgfJ5m/CtuWUYkah4v+Hglzrf+pSa9EQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pliops.com; spf=pass smtp.mailfrom=pliops.com; dkim=pass (1024-bit key) header.d=pliops.onmicrosoft.com header.i=@pliops.onmicrosoft.com header.b=c+ycNR6r; arc=fail smtp.client-ip=40.107.20.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pliops.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pliops.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pliops.onmicrosoft.com header.i=@pliops.onmicrosoft.com header.b="c+ycNR6r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MK4s6NrN9PpAsVCi2DIa4baCItNluPTLnQbyLyuEv4QP/9zu1ngRN/xYhhiULyamuT9XXz0mnHfODBgvcVoHSAHBSRwoQQopAhlCVnwt7Rxqyq4x9+neGbXkrIbuSxn9vAcurPgF6G3/fLnnQrvoj8SLUw08hAnxTvWTSjmh8HPakxD5or5oqXFDw5BYSDM5rNo3dtEGeYz6udkE4FePVDzB6Hxyayo3gEmocfk/apfAm4O7TvvJUCkHc0ZnTUiSUr50DPV78OOnPXFdp8ZMBDsQQh/3nHwP3+eX0D+aIylrRWaTdLOnbmp63rJvY9IVM4wBfepMRgHImhDHDQKFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvPRQV57dDHIptFvuPAMIhi8OdI5JAUmPbyctlaaBn8=;
 b=aHCsqQTPZTW+Yoc6fnhULbzrxIJRkBUPjGmVIu/xQOYJJeB4X1+5B9f78UF6ZcSFtXEwRKnYk2dzOyQiQg5OENXJ3X2s8WPGIbG9YSu+GXq27T4ifFuWQwLBW/FT9Rvuy72H5cQEmK34hPaXbSUjJjxxPJvhjgC7N1MeeVWm3rajeHvpYiQuJbIN6XO7L2e9q7P/JD6v8/JhINxAmlSDt6LJqCOoERQPYhMn5wHazO7I0ALHJm3+rS08Os4rl2DSlUcBNGP9r49Kxgu4BY4G8WDBykeJsQT0VpFSSs5eFZ4OeHi05QLM+H7sY86ea8ObgVF8o3J09PDNR9qanPiBNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pliops.com; dmarc=pass action=none header.from=pliops.com;
 dkim=pass header.d=pliops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pliops.onmicrosoft.com; s=selector2-pliops-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvPRQV57dDHIptFvuPAMIhi8OdI5JAUmPbyctlaaBn8=;
 b=c+ycNR6rChvL5FNWDVOc6YET9xjcmeGZY6SuSRPo2wrctCM9l6bU6TvI3/VkV3ESQOhwt1RVAsLJcNjSu/xL+cmrAk8y3c38MUXnkGR9+AM3jyn+WWyJUYN2IDsAf6sQ5NNaXg8PNF6cJc5MIjQW+VAaYl64sf/XVVa334wogF8=
Received: from PR3P195MB0555.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:30::14)
 by VI1P195MB0750.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:147::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Mon, 16 Sep
 2024 11:22:34 +0000
Received: from PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
 ([fe80::42fd:f7a5:52e2:430c]) by PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
 ([fe80::42fd:f7a5:52e2:430c%3]) with mapi id 15.20.7962.016; Mon, 16 Sep 2024
 11:22:34 +0000
From: Lior Weintraub <liorw@pliops.com>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: [kernel 6.10.10][aarch64] PCIe Bridge - NVMe SSD - No SMMU (or IOMMU)
Thread-Topic: [kernel 6.10.10][aarch64] PCIe Bridge - NVMe SSD - No SMMU (or
 IOMMU)
Thread-Index: AdsIKoXzmFyOW/eSRZyfDKE+IdISJw==
Date: Mon, 16 Sep 2024 11:22:33 +0000
Message-ID:
 <PR3P195MB055551DBC4A87ED666237576C3602@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=pliops.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P195MB0555:EE_|VI1P195MB0750:EE_
x-ms-office365-filtering-correlation-id: 7879ff14-cbc1-4335-f606-08dcd641dc84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R1dIRXZBQXRXM0o3L0g1K0U2eDBpMmZWS25wbXRtaE14UjQxdmJGenZRL1h0?=
 =?utf-8?B?ZVFSdi9jTGcrR1lUOC9kd1gya01zNWlYRUZ4VGt6THAwbmdjTlNSdlptMUgz?=
 =?utf-8?B?V2lZL1BYeVJTb2pTT2tjYmJvbUdBR3lLZmltZG4vWlNieGpCTm5XV1BNbVRO?=
 =?utf-8?B?Vi96THVrRW50cjBROFN0QS84bml6ZTZ1ZUxSdyt0a0VLdFhlamRjK0xsSHo4?=
 =?utf-8?B?VlV5Y0M4d0JTMUhBS2hORnpZakxmeDNaYWlCT2F0SzdGVmRHbGNYYTQyVWFI?=
 =?utf-8?B?VFdPdEYwMmtlaXAzZ0p1WVJ1Smlwclg0VFlOYlpOK1h0SmVXTnNLV0VWeTNI?=
 =?utf-8?B?b0VDQkwxVkU2MnhoaHJwMk1MblRoSnhkMzJuLzQzTCtGdlN5UzBoMzdXbHVT?=
 =?utf-8?B?ejdQakV1Yjd4SEovQnJjZDJIN0dMNm1YRmRSNy83Nm9XemFvN1o3SHhGd05H?=
 =?utf-8?B?SjcrQVl6dTFSd2FpZFJlWGN0RDIzUWE3czNPQUFRV0FObjh2eEFVbmw2V1VY?=
 =?utf-8?B?TDl6b3F3Uzl5NU9TUUhrQzJ2VXhvdzVPckdMWVc4UkN2Mzc5SFAwdmhxQzU4?=
 =?utf-8?B?ck9hY2h3TnRscitiR3IwRHZuVkZkOTgvTEMvdGtVb1NRMjVzOS82ZThXaWRm?=
 =?utf-8?B?WVJCbml5cnJWZklnV2t0Y0dOQm9QQVlUSWJvQ0dHMWx2azZCVGh1U0NUaFZ6?=
 =?utf-8?B?OEMxZGxwL3ZHK3JqY0Mvb3pVS1NZdWEvNDJzRitqUUZJT0RHOUk5Wk1rZXdT?=
 =?utf-8?B?SWpqKzVCZHViNDBZZXJoZFg0MGI4c3FpTW5OR1ROaVNTb2dMbXVwSEJweGUr?=
 =?utf-8?B?cGdCSVZwVEI1RG4wbDM2WHBaOC85RGN0REVaN3hyVit1blRoWmljdlRocDlw?=
 =?utf-8?B?aklMT2RBaTNWQmhHYnlJNDlYU1lzOElCY3RLd1pjWExNYURuemtqQnduN3Rp?=
 =?utf-8?B?cmJEcFMvekxBMENReVpNSjNTSERVcHNMeDE0YlNUZDJyczl4MSthc0VjdStp?=
 =?utf-8?B?L0tnVm5MWExiSkpEZVFob2pKVXI2clNRUmNUTTRIbE1Sa1lJVGZqcDlPQkdY?=
 =?utf-8?B?MUlnNFpkQk1EajdIRlJyMGxqM0hzV1NZV0s3Y2h5UXdlMkdydXRhQXpRZk1Z?=
 =?utf-8?B?R3JNeFByWkhiWEhwQzY2cWcvQzZ1WlVWdDd1VDUySXdFRyt0dlB5UkZFNkx6?=
 =?utf-8?B?c3B1bklCeXhRams2R0Vpb0JvV2hqR0ZSSkhqblVuTmNZTVhMc1JXTll4OTFz?=
 =?utf-8?B?NVpRWWlLZE9OMmoyM0pGbTdQZnRiOXRjV2pjbnFIZkFnbHRaZXlBVXpEaTlV?=
 =?utf-8?B?ZElUaFMvdWszQlZ3VWNkZkJPbmIyOUpNbFVZcjh3ZHpGdWFpNjBid3Y1OTRJ?=
 =?utf-8?B?UmdDRlROaEN0T1o1VnFVRDliakxUSThwVHBub21Ua1A0M1dIbGIrWkRJNzEy?=
 =?utf-8?B?MjZzSG1zeEVsaXVYV1JsL0FpR0NkTnlwK2JWVnhDaHNncUdGK0tKZ3RBSkdW?=
 =?utf-8?B?UG4rZGdKVXhrMUxYZ1U1UzdNQWJXbEJPT3RTeGYvOURCVmMxMFNESTg4eTl1?=
 =?utf-8?B?dUhGOHdNK3d1eVFzTXNqdEVYb0V6eEkzRU12NmNlb0JsSVBUdVdQM2NSaFFt?=
 =?utf-8?B?ZitjQUg3VmJESGlteGU0T1Z6aThVaUU0U29rSFROTmdzaC8xQ09JNXg3OVFJ?=
 =?utf-8?B?dWhyc3l4NVIxWHYxTU9PYjNUZzdqbUF5RStTd3l1T1R3UW5sclVvU3JoalJD?=
 =?utf-8?B?V1gybnVtQVNFc0RiS0pRSUFYZklsVGNOc2pSUDlzOVVrczFBdm9SQUw0MEJQ?=
 =?utf-8?B?TWRvb2RqL2MwZ1RLakpmQzQvYXFJaDVaWmhTaE1UZmJjZHIzTlgrdHV4OUls?=
 =?utf-8?B?eVl1M1ByNHUvbUU5bHl4dHVPSGhaeU5lZ2s2QzZCaDNyWVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P195MB0555.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ellBNG9mM1NEcEJJa2Jza2FOZForaE5maXFHd1l2anNiRGp3czdYUVJOVjdR?=
 =?utf-8?B?L1FNb1RPVVJXSEVIMXhaTUthZ1YyQlNBU1U1TUxUR1Q4ZDE4NlZCYXUzRTQx?=
 =?utf-8?B?bkVpZTUweDhsK1VaQXRaM091dmg4STNFTGtRbnBLZVNnQ3FiQ3ZPWURWVEMv?=
 =?utf-8?B?YnVaM0tVUEh6d2hNazU4UDN2WnNsY2l4OUJqd2NFaGJJSHZza2p3SFNuTk8v?=
 =?utf-8?B?Z0hxQjJvc2hJRUhlamUvbTRHS2JIcDFFczlibXFDWVJOS3VhNEtubVVjSzUx?=
 =?utf-8?B?N3Nmc2lwQ2J0VGkvS1lYZXBnYkIrYnY1a0UrM3YzaGFPK3lrR0FnRWhqdGho?=
 =?utf-8?B?djJGZnlRQ09scWRDNGt1bTJHc29kbGJxdm5wQ1pIWEpMZlJ2L0pjTDY1bk1x?=
 =?utf-8?B?Wms1Q2cwQnVmNXpCU3RJSVN4YzVqTC9ZWnhubkg3Z0dJdWxkUEdrWlNoS2Fj?=
 =?utf-8?B?aFNxQ3BDKzgzM3ZoSTFHVS9CVUNaNmRtcXdacUtLdVVuL1ZzYUxoSTN4dkJa?=
 =?utf-8?B?NzRuRFprYkFZcDBPdThpTy9lK3pUZlNMTDM3K2U3RXcvRjQxZnVldWMzZjVx?=
 =?utf-8?B?ZXFqM0swOG1sckdObVE4allqOUVWQXRadk5pcFJTQUpjOStzK1BDSUhTbHV6?=
 =?utf-8?B?RFk2MmtxQU9CSGNBSEFZYnFycmcwelZlaGppaUVibG1FK01vNFNNVmlKRWc3?=
 =?utf-8?B?dWc3RXhPT2VtMGhFTFM4bTBldW1kYVNwdnF1QllRallWb0JLK1NiSjFLY0hT?=
 =?utf-8?B?MmxEbThrYS9xUWs5ZWJ3cGl6QWNXOGlWZExvTEtSdG1rMkZGeU5PTGQ3TGVu?=
 =?utf-8?B?MHptVXdmN0MrcFBSOHlQWFdHazNlTWpvSHhiWlN6L2VCYkNDZ2UzeFgyWHZk?=
 =?utf-8?B?N2tSQ1l3MmtRWjdyUkJmZTlNeDlwUlVjZTgyc0ZHL0hJSk84N3N4UWphb0RW?=
 =?utf-8?B?NlJ3VnV3S3NiNi9CaFRLSXM4RHNIVDhQUGJXTWpUb1NHd0Z2YTBFeUxMY0x3?=
 =?utf-8?B?QmNONC8xTXVnQ1RSeUp3b0lLZ3pYRmsrRWl4UDFEdkViMjdVaEFlNE9qVE80?=
 =?utf-8?B?anJXa3ByeEI4YUh3QTVZaWhtMkg0dTJINkxSK2N2WWZRM1VwV0hKQlo4RnBx?=
 =?utf-8?B?aVJaNmlZcHIyT0ZlSDM2cGFGTG83Q0srTVhsUm5ycVJ6cEFHOWFCTS83Ny9P?=
 =?utf-8?B?K3BOcUlmQ0FpSVNSRVFFdlZ3S0FNYXVIQ2xjVm13amtVQVo3bjBRekUrVmpi?=
 =?utf-8?B?RTdWRDRMQm54bHprSjgwNFpvdkFXZVRDeDNOalJTQ2hML2lqUUtvM1FOVDZa?=
 =?utf-8?B?S2t5anNpdVdnR21qcWd4YlRxWE56eVlpYWdqZ1Z1Q0RBSWUvY3l1a0liRExE?=
 =?utf-8?B?YlVpSDFxU09YQnYvcWlCWEhveThkY3JSeHl1eVhYaWFyMWVGaXAwbjh0QkJM?=
 =?utf-8?B?eDlxN3JWSEEyT20zQ2dCbE9SLzVJVWw1cjJvVlB5YnVGR01tV2RrUCtscUtG?=
 =?utf-8?B?OVRBSWM4N2RkdEdIL01EQWY0cm5rZ1oveWpKRzM3eVR5VGZ1RDlBWTRpcG9I?=
 =?utf-8?B?RHN3OElzdFVxc2RldFR1TW9mTDd2ZHlWZ3VzTVpWL25hdGtGOHNNL0hpRnhV?=
 =?utf-8?B?amgrdWpyZ0VPZ29xUHAxaGhDUFJCR0RXWlVCOUNmeCtJTVN2dFUyTDUrVmhY?=
 =?utf-8?B?cXpZTmhsbm1iRGt3NjcxbVExVWRFWGltMENPQUptRmg1YmRBZ2ZBM25ZblBH?=
 =?utf-8?B?QW9seW8zclRyVE9ocjhPVzkvdUJsZ012YlpzM0FIQVkxbVpvSTJOaStEQTB3?=
 =?utf-8?B?b3RNWkxJMTFaSlRqcVAra1NoQkxWSkJjWU9uU3Q3MjRZZ3dGMEZUNmZmVzB5?=
 =?utf-8?B?NnpGWG9zOEZKR2ZkUlM2RW0zV1dpV0xMUHdtK3UyOWlPLzdRWGlybEZQd1U4?=
 =?utf-8?B?VjlOL29abzBxSU90WjNNRm4wVjRqcjR0V2gzWmdydkZocFJ5Q2ZuSmJCVTZO?=
 =?utf-8?B?LytEdVg4STJueUk5SjhRaGJHRnZXVDF3WjlOMHpxMDRWOTZCdVpCNDBJWlp5?=
 =?utf-8?B?djZpbXRXSkszYjN5cXAwdFBLOENBMEZ2WU8vVXVUSmlyd1ozbjc4M0RPMTA1?=
 =?utf-8?B?RG5LajJMbFllblJkYUdBTWRIc3hCU0MxODdXRzdhdGlXc1VqK0ZWa1hodDho?=
 =?utf-8?Q?CgBDUI3qL+coY59KcKC4yRw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: pliops.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7879ff14-cbc1-4335-f606-08dcd641dc84
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2024 11:22:34.0470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 40fe8f47-55ac-403a-a5ab-1be3dd209cf8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y/yH0stQSr1MgESJo172O/nYb+apOboyrO8w9QS7xF3WEH3343M53WjDEJzZN5iQflMq+RWNmfD5/N7F2ukBXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB0750

RGVhciBmcmllbmRzLCANCg0KSSBhbSBydW5uaW5nIExpbnV4IGtlcm5lbCA2LjEwLjEwIG9uIGEg
Q29ydGV4IEE1MyBzaW5nbGUgQ1BVIHJ1bm5pbmcgQCAxLjNHSHouDQpUaGUgQ1BVIGlzIHBhcnQg
b2YgYSBTb0Mgd2l0aCBhIFBDSWUgYnJpZGdlIChyb290IHBvcnQpIGZyb20gU3lub3BzaXMgKHVz
aW5nIGNvbXBhdGlibGUgPSAic25wcyxkdy1wY2llIikuDQpBIEdlbjQgU1NEIGlzIGNvbm5lY3Rl
ZCB0byB0aGUgUENJZSBSUCBzbyB3aGVuIEkgcnVuIGxzcGNpIEkgc2VlIGJvdGggdGhlIFBDSWUg
YnJpZGdlIGFuZCB0aGUgU1NEOg0KIyBsc3BjaQ0KMDA6MDAuMCBQQ0kgYnJpZGdlOiBEZXZpY2Ug
MWU3ZTphYmNkIChyZXYgMDEpDQowMTowMC4wIE5vbi1Wb2xhdGlsZSBtZW1vcnkgY29udHJvbGxl
cjogU2FuZGlzayBDb3JwIERldmljZSA1MDQwIChyZXYgMDMpDQoNClRoZSBwcm9ibGVtIEkgYW0g
ZmFjaW5nIGlzIHRoYXQgdGhlIE5WTWUgZHJpdmVyIGZhaWxzIHRvIGxvYWQ6DQpbICAgIDAuODYy
NzM3XVsgICBUMTBdIG52bWUgbnZtZTA6IDEvMC8wIGRlZmF1bHQvcmVhZC9wb2xsIHF1ZXVlcw0K
WyAgICAwLjg3NDQ1N11bICAgIEMwXSBjb3VsZCBub3QgbG9jYXRlIHJlcXVlc3QgZm9yIHRhZyAw
eGZmZg0KWyAgICAwLjg3OTk3N11bICAgIEMwXSBudm1lIG52bWUwOiBpbnZhbGlkIGlkIDY1NTM1
IGNvbXBsZXRlZCBvbiBxdWV1ZSAxDQpbICAgMzEuODIwMDU4XVsgICAgVDhdIG52bWUgbnZtZTA6
IEkvTyB0YWcgMTI4ICgwMDgwKSBvcGNvZGUgMHgyIChJL08gQ21kKSBRSUQgMSB0aW1lb3V0LCBh
Ym9ydGluZyByZXFfb3A6UkVBRCgwKSBzaXplOjQwOTYNClsgICAzMS44MzE4ODJdWyAgICBDMF0g
bnZtZSBudm1lMDogQWJvcnQgc3RhdHVzOiAweDANClsgICA2Mi41NDAwNTJdWyAgICBUOF0gbnZt
ZSBudm1lMDogSS9PIHRhZyAxMjggKDAwODApIG9wY29kZSAweDIgKEkvTyBDbWQpIFFJRCAxIHRp
bWVvdXQsIHJlc2V0IGNvbnRyb2xsZXINClsgICA2Mi41OTYwNzRdWyAgIFQyMF0gbnZtZSBudm1l
MDogMS8wLzAgZGVmYXVsdC9yZWFkL3BvbGwgcXVldWVzDQpbICAgNjIuNjAyMDU5XVsgICAgQzBd
IGNvdWxkIG5vdCBsb2NhdGUgcmVxdWVzdCBmb3IgdGFnIDB4ZmZmDQpbICAgNjIuNjA3NTY3XVsg
ICAgQzBdIG52bWUgbnZtZTA6IGludmFsaWQgaWQgNjU1MzUgY29tcGxldGVkIG9uIHF1ZXVlIDEN
ClsgICA5My4yNjAwNjZdWyAgICBUOF0gbnZtZSBudm1lMDogSS9PIHRhZyAxMjkgKDAwODEpIFFJ
RCAxIHRpbWVvdXQsIGRpc2FibGUgY29udHJvbGxlcg0KWyAgIDkzLjI3NDM5MV1bICAgIFQ4XSBJ
L08gZXJyb3IsIGRldiBudm1lMG4xLCBzZWN0b3IgMCBvcCAweDA6KFJFQUQpIGZsYWdzIDB4MCBw
aHlzX3NlZyAxIHByaW8gY2xhc3MgMA0KWyAgIDkzLjI4MzYyN11bICAgIFQ4XSBCdWZmZXIgSS9P
IGVycm9yIG9uIGRldiBudm1lMG4xLCBsb2dpY2FsIGJsb2NrIDAsIGFzeW5jIHBhZ2UgcmVhZA0K
WyAgIDkzLjI5MTY3Nl1bICAgVDIwXSBudm1lIG52bWUwOiBmYWlsZWQgdG8gbWFyayBjb250cm9s
bGVyIGxpdmUgc3RhdGUNClsgICA5My4yOTgxMTFdWyAgIFQyMF0gbnZtZSBudm1lMDogRGlzYWJs
aW5nIGRldmljZSBhZnRlciByZXNldCBmYWlsdXJlOiAtMTkNClsgICA5My4zMDUwOTRdWyAgIFQy
MF0gQnVmZmVyIEkvTyBlcnJvciBvbiBkZXYgbnZtZTBuMSwgbG9naWNhbCBibG9jayAwLCBhc3lu
YyBwYWdlIHJlYWQNClsgICA5My4zMTMxMDFdWyAgIFQyN10gIG52bWUwbjE6IHVuYWJsZSB0byBy
ZWFkIHBhcnRpdGlvbiB0YWJsZQ0KDQpJIGZvdW5kIG9uIGRyaXZlcnMvbnZtZS9ob3N0L3BjaS5j
IHRoYXQgdGhlIGFkZHJlc3Mgd3JpdHRlbiB0byB0aGUgZGV2aWNlIGlzIHRoZSBkbWEgYWRkcmVz
cyB3aGljaCBpcyBkaWZmZXJlbnQgZnJvbSB0aGUgcGh5c2ljYWwgYWRkcmVzcy4NCkFkZGluZyBz
b21lIHByaW50cyB0byBudm1lX3BjaV9jb25maWd1cmVfYWRtaW5fcXVldWU6DQpbICAgIDAuODI1
MzgzXVsgICBUMTBdIG52bWUgbnZtZTA6IC0tLS0+IHNxX2RtYV9hZGRyIDB4YTM2MDAwIGNxX2Rt
YV9hZGRyIDB4YTM1MDAwDQpbICAgIDAuODMyNzY3XVsgICBUMTBdIG52bWUgbnZtZTA6IC0tLS0+
IHBoeXMgc3EgPSAweDhhZmQwMDAgcGh5cyBjcSA9IDB4OGFmNTAwMA0KDQpBZnRlciByZWFkaW5n
IHRoZSBETUEgYXBpIGhvd3RvIHBhZ2UgKGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2NvcmUtYXBp
L2RtYS1hcGktaG93dG8uaHRtbCkgaXQgaXMgY2xlYXIgYW5kIHVuZGVyc3RhbmRhYmxlIHRoZSB1
c2Ugb2YgQnVzIEFkZHJlc3MgU3BhY2UgYW5kIElPTU1VIChvciBTTU1VKS4NCk15IFNvQyBkb2Vz
bid0IGhhdmUgU01NVSBhbmQgdGhlIG1hcHBpbmcgYmV0d2VlbiB0aGUgZGV2aWNlIGFuZCB0aGUg
cGh5c2ljYWwgYWRkcmVzcyBpcyAxOjEgbWFwcGluZy4NCg0KU28gdGhlIHF1ZXN0aW9uIGlzOg0K
SG93IHRvIGRpc2FibGUgdGhlIE1NVSBhbmQgY2F1c2UgdGhlIGtlcm5lbCBhbGxvY2F0aW5nIGRt
YSBhZGRyZXNzZXMgdGhhdCBtYXRjaCBwaHlzaWNhbCBhZGRyZXNzZXMuDQoNClRyaWVkIHRoZSBm
b2xsb3dpbmcgKGVhY2ggb25lIHNlcGFyYXRlbHkpIGFuZCBub25lIHdvcmtlZDoNCjEuIHBhc3Mg
Ym9vdCBhcmd1bWVudCAiaW9tbXUucGFzc3Rocm91Z2g9MSINCjIuIFJlbW92ZSAiSU9NTVUgSGFy
ZHdhcmUgU3VwcG9ydCIgZnJvbSBrZXJuZWwgY29uZmlndXJhdGlvbi4NCjMuIEVuYWJsZSAiSU9N
TVUgSGFyZHdhcmUgU3VwcG9ydCIgYnV0IHNldCB0aGUgQ09ORklHX0lPTU1VX0RFRkFVTFRfUEFT
U1RIUk9VR0g9eQ0KDQpUaGFua3MsDQpMaW9yLg0K
