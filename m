Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2CF367292
	for <linux-embedded@vger.kernel.org>; Fri, 22 May 2026 17:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470532; cv=fail; b=GkRT4OmH6HwdIZLjZ+f16VcxA7tB3hXZtJJCwmdZOA46Jt7AZySXB2Z+uvJhSA0Ab5cu2m6Wtuaj1UFccIq+kCm/XzP+VRF7U7PcEXduWt85KfKo36MQhgNqxvvTtTNpjnqzGJpP1TNQXs/AclD4raaxlh5/n7sxqBk2mxEsM9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470532; c=relaxed/simple;
	bh=FkChPCRMwOB92a4G23nWuk+LEaeKwL60iZP0lSHVoX0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Q3a4payUDvcAfB5B83/hn7p5Zbhv3eXzpJNSbo+6DGk4Iklo+65LbROp44SAlRZDehAxsWKKFbdNb0In/KZeshPIYWybMNQQ+9SnhD87OIlqirtTuOZ6hrz5bVBv6INSk46trDqq2KwKcjmGWFkk0EffbAOds9F/xxWnnC81bog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=VhuhIL/Z; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="VhuhIL/Z"
Received: from pps.filterd (m0209329.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MGe3Lj1012563
	for <linux-embedded@vger.kernel.org>; Fri, 22 May 2026 16:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=p1; bh=FkChPCRMwOB92a4G23nWuk+LEaeKw
	L60iZP0lSHVoX0=; b=VhuhIL/ZYAvWniRRo5vN1P+o01i/pBcQb0fII6340pzIq
	abl/ZfckgqNJQzq2xgmei6T5nfPJWGF6Dt9DTxYPqYdcHzahyNIyXdjo0DhYpS2Q
	17Wf+7wX1roXQ5nDcAGMVABn4JDfup/uCXchnQOd3DAgLtLSa8sPkMO3ozfD5MLI
	SCO1Roke1dTFzznVAmoR9/8A5Y7G7/ljEPBbVZEyqQED4RFBpfEYqjDeQWjd45Tc
	M7+CQ13ja6XhUzV4aXiq99eo5vI1RjfXg/7ZVtFCpf4ulTU4d1lIBhUUiiOXYKFk
	hHK2vjaI4QTZ16mt0RhtZahB3CFOpWTumWXcvTxlA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012071.outbound.protection.outlook.com [52.101.48.71])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4e9kytjff4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Fri, 22 May 2026 16:55:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHnAbTKhCtXtqwcoSOJt3FM22+shamQRdZ++cYwNSybaO224jdhgmOfCgUwe3tUpmi8paYDCJ6tuhFikXFZTNB0Qzc9CQT7lP+d2GRxnRUEzRC+MdfIcVbLg2gmyz77tJdmiyYOKnLG0nrljRGz+j/AGBNZwwO+IdWY5nbMosZQc/ocuvQtvAOeZTTybD5JzPpSUXhGjvJ0SeGHOrieSMyMjmWvQ/2OLN2j4lKP8g0pEMiO6Dl63VJF2YP5igEttGGAze+e8ApbCmZjnnWYzT3Qbd57LwnOjNxZF134tzup24DToRYDAI21BPzO91Xg9xK+meLRoer1VJzVmingPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkChPCRMwOB92a4G23nWuk+LEaeKwL60iZP0lSHVoX0=;
 b=Fz65IIh9hNTkRNwJzBQMwyLxoAWgpi3m2+7G0Q+TizBLhgzaHtQIlFM6H+pwjAXPfpLh9px8KIXoa9F5BhVUYiblh5G/ITm3Df8Doz0/Iw9eqtKT1ySCPSCN5C/8V+TLxnyQIpS0fPYGRdpKePqn1PlBmyLul5eWL60qMW7uIskdhuEzL5yIyzEpYMhYhESjAX3pOy4tWo56zgGaUoUxarmk6X0Ix3/mfSXIe9RzUqmrayzFhzD47t/spa8ZOydTEzCwH6zAcYa7/KRlQRUd4yWmxoAMjYii9qshls657zxWjN4/gVMqol4BoZJxIFrXjJAkku0obDCecN+Kv49vcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SJ2PR13MB6356.namprd13.prod.outlook.com (2603:10b6:a03:55f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.7; Fri, 22 May 2026
 16:55:14 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%3]) with mapi id 15.21.0071.007; Fri, 22 May 2026
 16:55:13 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Embedded Linux mailing list <linux-embedded@vger.kernel.org>
Subject: No Boot-Time SIG meeting in May
Thread-Topic: No Boot-Time SIG meeting in May
Thread-Index: AdzqC1uU/RraTOiRRcymIreeGgXMxA==
Date: Fri, 22 May 2026 16:55:13 +0000
Message-ID:
 <MW5PR13MB5632C2310B4F88479D54AA02FD0F2@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SJ2PR13MB6356:EE_
x-ms-office365-filtering-correlation-id: 21daa3dd-f61d-4654-3e68-08deb822e4a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|38070700021|11063799006|18002099003|56012099003;
x-microsoft-antispam-message-info:
 DbVzZZHaRgHglhZtMao7l3O7//dD49Hznr2C3BWlocBOsVTE7IPkxEiYzvztjhTmd/W9lpltm+MEkSKp1NBdYhdyqkgQlLHfuomlNMuBVFBF0/0ecxu0bc0Ila1OvhEWGQEVZBeNz9XdzQWQ5iyJ7OhbZXpBDTIBxcNRN2o5ntO5y/rbroHa10FZ5Se3Zhd/KUovriEl7Rkw5ogZhk5vO5FVRxdp08ZT//U3aYFAhciz1tXpJraYxnwZ8zriC5Nx7bGLtVSUSWarEu4XvF0RXX3w5HpZxLpTkaVFDeTmgHqYtp16pdxYYdXm9lDecogzoMx/omewkZ0zsD3hdhvDy1+xIjlvLo63z9HXJMmsUmYlmYSS6GzI/uylSKnw33uxcCKIF3K+5ZC021CjAAhd3en2xuLNvK9IkpGazSrHqNODh0Bx4+IhF6Q+0aXriYMYZHZIBrdBhtajb8EeJOJoLv94iG6siwkwTLds6tzORduQe2gXwDcuKhdwwFPZgtKfssZuc0bKWnohyVjJKmVAvqCgp3OEvuYeO0Mm5edZ1zNTD4r/yvHaJvXLCqTWsc0udeV9bYutIAnjZr3UVIVfuLrWS0MnPSA6wAazv4MQY8DhBlorR9o7V8z+8us1Af3AaBz6fpjHbEJcDiH2E8yM3qCDKFmYgiJsa3wFgFt1xn2sMw/eqAaqIoWJ3mHmp56+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021)(11063799006)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QXZra3FQcjlFa3Y5WXAzRkdjWUZFZmV5RFA3TWFxRVFuZG9rekFRcE54dWsz?=
 =?utf-8?B?eWo3OWc0UGhteTNjZHd3c1JxYm45WVRJZ3diaTZvKzlZMkliUE1kcFByQURn?=
 =?utf-8?B?MkVKQ0xGR2YzdEdYa3ozL1BNYVhmVG1pdHl0TUhzOFZRTjYvMm9IOERWVXhI?=
 =?utf-8?B?dnhOVUZPOGdlSCtUdkQ0WXQ1aDBCaWsyNzdwSWUxZ3FQNk1iUTA3akFPZFNv?=
 =?utf-8?B?b21VZk5SdjcvbVV1eWU1eHIzL2JhV2c5TU02WWg2eUlBTHZRR0dpYWtiMEZX?=
 =?utf-8?B?UENGWG00UXdmS1ZFQW1kYlY4UGZKbXRkRDQrTHM0ZmpseWduWFErMUEwWEpH?=
 =?utf-8?B?WmFMc2F0VVNVcEpZbWVERGE5OGszcVBia29icjN0US9YTWZwRWZPVWcxL3U1?=
 =?utf-8?B?ZkZrYzJqUVVTaW1weDFmNC9YSE9lSWdhT3FrblkwTlRvNnE4YjByNDFhekg0?=
 =?utf-8?B?bVRkeGlBSVltRmdoSTFOUzVhU29sa0FaV2VYQ1hzSm1rd0d4djhxQUx1cjk2?=
 =?utf-8?B?QnlxOWFLallmbkFaajlOM2k5RC9nb1A2QmJSdGhJSVl3bENiYkJ6b1NOTkNp?=
 =?utf-8?B?Y04yN3RheVliRzFGZHZnNnJmSlh6c0lRSDVqOE1rQ0pvZ0c0bjBFcjduTWN6?=
 =?utf-8?B?Zk1yWFkzNmVhcW9hNXdjU0FJUlhIQVZiVmpkNGlnak9iWlkwNnNyYXlERnNh?=
 =?utf-8?B?SmpTN2p5cFNBN1lscDhaNDVLNVc1NDBJbW1YTFNYdGU4Z21KQUhrNWtmSWVy?=
 =?utf-8?B?MUJnQXdCZnFoUVAwRm0xb1M3bHM1TW9tZTg4L2tGbC9TT211RmdrZiswSDFP?=
 =?utf-8?B?MzlCR2hwWXJJZUFNdEtHajhBM0NKeUdEcVdVZHFsRkcraW5Ud3h3aEkvZUlC?=
 =?utf-8?B?dEhrcDZha3ZuQ3Nacm9NcE44SmNNVFAvMEg2S0I3VWIzV0Fub3IwUm9KSXJJ?=
 =?utf-8?B?azZWSHhzMHlUWi80QlQwV01LNlhtaXdmd0oyOEMvZFo0QzAvK1o4R0JocWY5?=
 =?utf-8?B?UE1TeVJHTkd0M3FZNUJwTXkzb2hmWWc5ZStGbXE2ZXlSQXRTZmI3ZEJqcGRi?=
 =?utf-8?B?Witkc3p1d25FNnFkODZIWHcwMTNHWG85SXRxZnRmVkIxUmpMa1M3cWhRbVZn?=
 =?utf-8?B?Q1A4bmlpSERkSlFoQTFyeXhqbnBBMEl1bUpqT3J4L0IxWFZhLzFWdXlvNnpZ?=
 =?utf-8?B?dXhOb25UTGxxOHZTWkJkNEQ4ZSs0bjRxRXF5S2J4ZDlqYm05dlp5RjZMK2Rm?=
 =?utf-8?B?UWFoK1RnL0x3NDVpRk93VUNOR2VFSHQ1U0xncEd5aTd4OWZ4bnhWYUlyeVFX?=
 =?utf-8?B?Q1g0MzlCTEsxMEZCNHk5ZGFWR3lWVEVseUNwOENsS2FQcHJRYlFZejNVcFVr?=
 =?utf-8?B?VkFHU2hDUVA4ZVE5NTZwUmIzbFBtMHMyS25lVm9HUEVuTHg3TzRxMjdFcnAx?=
 =?utf-8?B?TXBVamVxVSt1ZHRrdzhoVW1mczZOR2VSMDJvaXl6ZER2NzRMSmtreVRSVGdN?=
 =?utf-8?B?Y0RQc3FrbXFYNEtRNElJRFJ2M3JLMDBxZzlmbnlYQTliVkFsckczTTBOcFBr?=
 =?utf-8?B?dlMwZFNReEM2UUhQdEUzbVp4RHF5NHF3TVpQbXF5ZDY2RDYzbXk2TXg1MXNS?=
 =?utf-8?B?UERXakVjSDdaMVlWWERjdXJocENra21kVnNuMFBtcjR1cnFSYjdjRkZmZmR0?=
 =?utf-8?B?RG1zVVRVY003c1JMb2thSCtDdy9ZeWJBdDhBZWVHVGJMOGhzTlZJOWgyVlFV?=
 =?utf-8?B?VzRncGNWSFcxV254bTlWRWlwdnRsRmZTZ0phZjRHRWFoZ0IvN2ZBK0hlOTR1?=
 =?utf-8?B?Tkl1UFZmWTgreVdMdjM2OERxcXZnYTlPK0p6V2xFWXM4RjR4ZmFEcTFUQlUv?=
 =?utf-8?B?djAvVHMwcTdFT3BsTDlibitZK1lZbDZoSWRLRjBKOEN1aEFsRlBJSkFXVk5C?=
 =?utf-8?B?OTRJeDRSSmVvS1FVSXc1TndGY1A0czVicVZ4OEYxbkp6RkpIS2E0QU5NcE1E?=
 =?utf-8?B?YUg3VDlnVFJTakdtUmRxazlXajhCMVBaYnFPMlpyaHVWZXh1TlBvNDlSbHJ1?=
 =?utf-8?B?WWlndnVKNFZEc09OMG1qcVppVEZVWXBWdXFwRWJWNmJUNlBBK0ZHMVlNL3NY?=
 =?utf-8?B?ci9BODloNmg2bVlrTEI2OGtCL1A1R0V1SzNtbnlpU1pmMkg0VWpvSFR3Z1N3?=
 =?utf-8?B?SEFRZWFTb3FCK1dVcU8xZFNKNStMK29rdXJSa1lkeUs5RjFldHlLLzl2UlRw?=
 =?utf-8?B?ZUFGaW4zcHVYbUNjNGx4YnR3UmdzYWcvbFRzUkFMbnhNbWFzMDFZczQ4RzBS?=
 =?utf-8?B?cldvYkpvTVRKZnFTWGUxNWlBZE5EVWR5SXRyZVRkTDk4elNzNHg1VzhQbHdJ?=
 =?utf-8?Q?LhAlLXc9SDqRhDSrf4A0CMBvizfut6MKL66yR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	pBfKUyFRdWAUxItiOnOGY82SNtjeGOp1ZGhCHgZbLFZXf3gJcfJUTdGfvDShs8lwv2/RufTcz1O3cudBFQ2l8+aTQAeMg44dPy1YkosfmkdqYB11+4nX5CMPbLE8fA4qCICNGPJw4GeeKCru0F0iBpdNRPzzNsHv4+EJKDPtvJgUmAHLKoB5DMkwk5FFtmyS+RFPG4KrN1GgUYLuAB7ktggbiXyg5fceLa+3IBRgqQhl/kPnQHVqe+Sny7C+ySaH5bHp9Dn2qrnIPBXKCE18SNsEbSlLa/kP05+ZyStf6J7TM+NEuIaoJxllpVj9TNKXdFg7NHYKAy20ErjbEM42XA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FZn3OFvAzTUwtYi/b0z66dORSorXZhNUzWkc6ZMcyLbedvDMWqF/P9NGm7hVi+N+wbn3L5PEaJKEdNBoPA94hP7bGM6FSAzRhGH9Fot70/HYa7hXCFIMaaybY3VEFWYxxeUw256IowCFIQz+7gIlQ2WP+gE9fcU//Ki+nudqYC+xKmJAiPUdNhthljlLaObm4QQ7/7ll2JGpRHhodKi0cLGPM42zwm2GnvaIv5Z4b6DU8+9ezkTw+5Fj4kKhK16Dt4Aww88rPOGeOuYnD4C7LOstyvrf7XYZ6gXlV3bjuWKog3vIM18S2Q25wUNpA9pWeNtEo0w8cVyuFJWZqNxdoi9Ji1Uh3tDRRKFyUttftrnKnR7H5vKDvt9dozI/5Su+AS0gp9u5XZ1iLW2PzRrQvzRp9+bSUJc99WHtuHktIJRjpcxypeXE1TJUnWCk+NBrdfnBoaOppZoNREO8vtTnUBF9kE/sB2TbEuMhOSS2tM3Pnan2kSWk53cXa3xsZhKMky1gBI7l/JB+x2j3m9QYgx0XbwRAHA0NVSYGLbXD8B/QBKjzFOa9Ba7aY8AmfSG6FP4DGMh7yL2yOZmAzw22iR5x0m6/dwl40AFVQK6T2Y5DiB4Psqh22+HtdiZ6e3kC
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21daa3dd-f61d-4654-3e68-08deb822e4a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 16:55:13.7303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AUE0VBHJHZuoyXJKfzacNrIC6u9kO708ye5TJANJNMmMZqgiN/f8KI3R61VGK5c9c41vjbiLIhWGEESV8X8QFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR13MB6356
X-Authority-Analysis: v=2.4 cv=aZ9RWxot c=1 sm=1 tr=0 ts=6a108a7d cx=c_pps
 a=3vo4EN8bzuoLd/SmvO3peg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=pQehfwC0D4oxWvs5GOjV:22 a=Xu_aML22AAAA:8
 a=nK8l0n7AEafx72n_Y1EA:9 a=QEXdDO2ut3YA:10 a=o_LaMfWX3WolavuFUIfu:22
X-Proofpoint-GUID: YxE1oaLv5_ToDTuKb00-QPwKo07qng5E
X-Proofpoint-ORIG-GUID: YxE1oaLv5_ToDTuKb00-QPwKo07qng5E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE2OCBTYWx0ZWRfX3E/ZJCe54Vqh
 8SQhWkvxvTOcifnBrIYj1yugT4V1xJB1CvqyKxbRjF5c21pCbN6xbzvLLa7InG6v/CNCtoM0jvI
 WraBvn8VV0rlqH2jZHqMWmO0wR1yA9Bm/wfQ4Uvyx06kQSW4HxDdXylmU8SO2SUCeCR5PUJj939
 +OFEgKUqhx27oNf2N/1wnLeYcvcug5PSjZfE1DBGHgwI6wXuzAYi0HA6fkRRttOF6uxiew5PBS7
 aGRuwtvXa6/BNqwxziUZRkfMFzl2sNzEoLL3Gt9rOevD2b6DwQq0UHoEMIb9IOf4MvdBIaYFvvh
 Q94QqVRUWISZdKJ4QrVZLhvku25JCxiiTbX5VZ9Swk7t2S4U6heOZYqu/7jN+TsaNOrBKtq5sha
 hQruOwP5u21RebsrMKSf/PvLYhmvIbfOOuXxLgXWWKR5XaHoJchS2Xr4GrPQyL4cajvxvZpf7GL
 XgqtKJaKvY1D3tI5SzA==
X-Sony-Outbound-GUID: YxE1oaLv5_ToDTuKb00-QPwKo07qng5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01

SGVsbG8gZXZlcnlvbmUsDQoNCkdpdmVuIHRoYXQgRUxDIGp1c3QgaGFwcGVuZWQgYW5kIEkgaGF2
ZW4ndCBoYWQgdGltZSB0byBwcmVwYXJlIHRoZSBhZ2VuZGEsIGFuZA0KTWVtb3JpYWwgRGF5IGFu
ZCBFbWJlZGRlZCBSZWNpcGVzIGFyZSBuZXh0IHdlZWssIEkgaGF2ZSBkZWNpZGVkIHRvIGNhbmNl
bA0Kb3VyIG1vbnRobHkgQm9vdC1UaW1lIFNwZWNpYWwgSW50ZXJlc3QgR3JvdXAgbWVldGluZyBm
b3IgTWF5Lg0KSXQgd291bGQgaGF2ZSBiZWVuIE1heSAyNiwgbmV4dCBUdWVzZGF5Lg0KDQpUaGVy
ZSB3YXMgc29tZSBnb29kIG1hdGVyaWFsIChJTUhPKSBwcmVzZW50ZWQgYXQgRW1iZWRkZWQgTGlu
dXggQ29uZmVyZW5jZQ0Kb24gdGhlIHN1YmplY3Qgb2YgTGludXggYm9vdCB0aW1lLCBpbmNsdWRp
bmcgbXkgQm9vdC1UaW1lIHN0YXR1cyBvdmVydmlldyB0YWxrIGFuZA0KYSB0YWxrIGJ5IEdva3Vs
IFByYXZlZW4gYW5kIEJlbGVzd2FyIFByYXNhZCBQYWRoaSBvZiBUSSBvbiAnQm9vdHBoJyBtYXJr
ZXJzIGZvciBkZXZpY2UNCnRyZWUgZm9yIG9wdGltaXppbmcgdS1ib290IGRldmljZSBoYW5kbGlu
ZyBkdXJpbmcgYm9vdHVwLiAgVGhlIHNsaWRlcyBmb3IgdGhlc2UNCnRhbGtzIGFyZSBhdmFpbGFi
bGUgbm93LCBhbmQgaG9wZWZ1bGx5IHZpZGVvcyB3aWxsIGJlIGF2YWlsYWJsZSBzaG9ydGx5Lg0K
DQpMZXQncyBwbGFuIHRvIHJlZ3JvdXAgZm9yIGEgU0lHIGNhbGwgaW4gSnVuZS4gIEknbSBjdXJy
ZW50bHkgbG9va2luZyBhdCBKdW5lIDMwICh0aGUgbGFzdCBUdWVzZGF5DQppbiBKdW5lKSBmb3Ig
dGhlIG5leHQgU0lHIGNhbGwuICBTZWUgdGhlIEJvb3QtVGltZSBwYWdlIG9uIHRoZSBlbGludXgg
d2lraSBmb3IgZGV0YWlsczoNCmh0dHBzOi8vZWxpbnV4Lm9yZy9Cb290X1RpbWUjTW9udGhseV9N
ZWV0aW5nDQoNCiAgIC0tIFRpbQ0K
