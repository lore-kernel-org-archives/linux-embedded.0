Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580A02C325C
	for <linux-embedded@vger.kernel.org>; Thu, 18 Jun 2026 18:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806712; cv=fail; b=DEJBJcCN8zWTz6YqrtyZGuGCKbUPiraMkCZ5ceRQGD3DX6coNQrXMM7TxViCi+bAyxwC22IVKB9DOaNykS2gu1W1Q+XDDlrjA+/13snPaHqYmDg+iGAcBVa7tZBp6EXlcXcpJABYhO244HQZ6Mw3GtgaV5VJccau44rL8olUvOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806712; c=relaxed/simple;
	bh=2tpJ9xP29/jBRWgvJ21xvbMOE0a3RRtBM5p2GNqR49I=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Z+H2LSZ2eUTJ/6aLD5tnMEOBMamBUVfFMTCvSLf/TR/Q1E+v4FjDKKDF265oBX7SoDEmwhuE2tbMl0e1lf2qTriWRl1ADiO2CR68AY3CvNVvf1a6scV60ZdXQp1Pu0+s9YMj45axNFd0s3umzz5TqTxlPqIYzTswiuxtRapX4ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=ZOqAcTmo; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="ZOqAcTmo"
Received: from pps.filterd (m0209323.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IHr4tl1667950
	for <linux-embedded@vger.kernel.org>; Thu, 18 Jun 2026 17:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=p1; bh=2tpJ9xP29/jBRWgvJ21xvbMOE0a3R
	RtBM5p2GNqR49I=; b=ZOqAcTmoiMCdwOGLPSZPQls2/R9jfB1iIJWtnCJFZnt9s
	CwydToUW6hvwLK99BhEq1geoJjsZyRTk5BUVN3w4n81Da8d+OIRzGzDhyxJanIG/
	EWOG+LlcCQnHK/wcHG0gDxZXjDwjN4xFkaBH4WWaafN7T5y5/R0tjqWtcv92GrgA
	+hd6CoqVLSXIjoOIFUlbcRcGPcFsltfgIBCfkM/VAmXT8YWHQHxBg9CnhB1GHHq7
	u9BpyPEwD8cVO++xZvGW3QoDMJ4KB6AFe32fogW0Sy/nuYKOloTBUuztpdVSAG2X
	eZIBBwADxeTKuxFGHzLIin0MHABB9ozXVQPbBWbxA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013068.outbound.protection.outlook.com [40.107.201.68])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4euee7thsf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Thu, 18 Jun 2026 17:57:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKcWgEAAnii8aIhXjNkqBYpbW1Oh3iMjnVgU87o2naN7ScI+KpBl8H/1P8PFcvnIHNLWQDU6l7rgLkPd2PH5LBJFe4RbhPCZiacBnuxEDOpMIP6ftpdr2CdD7o1oVtAYQS+kNqtfAlRm17QHIFCOvyIR5BjJtDey3C9tsxOKtydQko5zs69RsMD0FlKA1/zh+j5lLzaEy0t4hdr7zjHd5oJYOKbITi0cHQ9F+KYDWWM1BApSvf0nq2prIoITnTuji414i3CCHmCPRw0/BfHlpN9odwkrB4x1Jk6JFpwshdV1eUNpmm23V5eR2MUMqQk+QIkjML1/9pPzglFQCG8K+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tpJ9xP29/jBRWgvJ21xvbMOE0a3RRtBM5p2GNqR49I=;
 b=WZmvr3XVlw0UY7e+a9y4UxOJ4LAcQpswtPVRBatKDLizNW7f4DfUpvv7/TjlJICeC2RRuenaMWT0dEDxKlLnw9Lo/daI6gaw96WaCk2iVeC4rBYYkgVv3GJvcFTn7Lr7eGJ9sslSLKmhXkpZvLClSQvgsCCVQo4ot6NkI2mc2acYtwi3tGeL0AFH00A6EDw8xUpQbuTS2WZchF1Bkev1wXxsMK/Hn6ARUc2Mi9nnqGcPJZgZlvV5D79WhwGDRVe+AwTgF1yEJwcYjYSvb0Di8PKS18S4lWdKUY/uauMafxLj+2W8YuRrLyPaOtwPapq3nsuQYkLKaCG4y1A2yD9qOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by LV8PR13MB6352.namprd13.prod.outlook.com (2603:10b6:408:18e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 17:57:01 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%3]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 17:56:59 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Embedded Linux mailing list <linux-embedded@vger.kernel.org>
Subject: Reminder of Boot-Time SIG meeting (June 30, 2026)
Thread-Topic: Reminder of Boot-Time SIG meeting (June 30, 2026)
Thread-Index: Adz/SZ/96nGywoRlTbecyG0UGmueqg==
Date: Thu, 18 Jun 2026 17:56:59 +0000
Message-ID:
 <MW5PR13MB563294337A346C20F42DFC7DFDE32@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|LV8PR13MB6352:EE_
x-ms-office365-filtering-correlation-id: ba20932f-253e-4163-656a-08decd62fe76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|23010399003|376014|366016|38070700021|18002099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 UoMwLJojKMBdoRPmItSkk6qqoWwMm/rOcGyiYZZKy2NTKwHhh4gwkvFvkwJa0ubzqXyRl8YTYAMdCa6qaNlCsym2L75IqRmCxtDmH1KTgyWHNXgAFkrCjPoY+96WYVa5JWBei6tXc2WgB1RU/l4kptoFLYFehINzQX9kUmrYht+ABUSndb46ampN4m1NgzoCiqPdIZ3grniTNftnekkEHLpnmnRzPf7dbjTcaQA1XCYeLgldgS0n8TZXvjqQAyGA0nf1hg/8NePFoIG0tgrWW6MGLvaZ0xzsdL536T9WHP9Y5yIl0eCvNFM/x8bFs/A+Usy1dBMQAYb5PbQP7mzMfxmpD9u+xCV1nv8TdllTzexBcWB8tj0fhQ3PhnyDHgxZbCCfwBS8E/KwMuet8ZNGOJWShbuho/YtS5vgPb6scfez2V92eSSVWYO2TZOsUwN6FdRZzcPJVNyEN8DlzF5Its4AngYREHpiG42ibcU/Hk/+0HAAgABRN2WLxW7h1IV5w8c0FgdMIqgjybcbp3FONK0FReIsSIcRFiEIqWIYuXakpliARO0hFza2BaspPfU6UmgRKrUvk3IaG/wRswjehteffwjGg6MT/M/TQMBOelE2BUhai9oB3ejFDdyZKWuePGyHYnZaN5fpoZasNl6c+cNN92cizEpasVqSZ0tkcAoevtPCfUsU5TLJodgLBTZH
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(23010399003)(376014)(366016)(38070700021)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RmJLbzVYN3o3S1Azb2tIeUZpemZzOG5ZZkhRRFZWL1FnSlFHMjdFYjdMTnNu?=
 =?utf-8?B?cVVPQTBuaUl6TmV6ZDVDblVjNDdzTUJLL1hLT0Z0WjZySzdTYlJ5UTE1VUlG?=
 =?utf-8?B?Mnl4YThiNnV0OGVFMUVISnZERURoWDRxSThkNE1Ic21RQkpvYmQwQkpWYmVB?=
 =?utf-8?B?M0V5MHhaQ3ZNem04TnNjcTQ4a3IrcVYzclkwT2VBYVUyTVlCUU9kbXIxVWNv?=
 =?utf-8?B?RXlHYXJGbWJVQmU5SFdpNjlILzkyZ3RCU1VuOVVzTkxmS1BGeVlRSGV2c1pN?=
 =?utf-8?B?S1gwZUErMjJpM3VINUNnTG5RZFpUOERBV3lKWXJWZzNHelByVmM2cGxhUnhU?=
 =?utf-8?B?UmJnK2huVGJ0Mko4RUtSZWY0dWRYUGFocFFxQ2VMYWY4TlZCNDhsZnNPemlP?=
 =?utf-8?B?d01lVzVDYys1aDlURVIySFZmbVEzQ1ZVRnljeXQvT09rcW55NlNOMVNkVmtO?=
 =?utf-8?B?cldKT2NtWWlVOTBnTVdXU0pqU2g1WUhRTUc0UGluMmVUOFN5U004SXVqT1dV?=
 =?utf-8?B?bWFRejRCYVJJemxhc1BScDRyZzU5VWtvSnZLanBRNTl5VUNJZlRROVkwUWsx?=
 =?utf-8?B?OERlcVhZS3dJZWwzRXZ3MDArb2J2bU5CR3V3MEQrSWtqOThtRTV2MXNVVnc2?=
 =?utf-8?B?Ulc3MnpreTd4bnR6MTVTRFgwNy9HNnVvb0FYQlQxMVEyTUZPZllSTFhoZ2VP?=
 =?utf-8?B?bEVqNlVQVGJNWS9OZkpIVVgxKzd6bTBQQkxOaFdxTC93Y2V1ZXNyc1RzSVBn?=
 =?utf-8?B?WUVBQXdTUmp4QlBndlBpUjgyanB0dDUxbDU5NmFvY3VYS3dPWVNQZnpUcG9X?=
 =?utf-8?B?R0lvYVMzY2ZrNkZrMDBQVnV0bVJkcGc4VTR6MndteHpNTFp0SUFZRTlZZ0hv?=
 =?utf-8?B?bHU4OXBqVVpVaCs2T1lvbFRyVldTQlVpM2hEVUdsYnlYQXlPQlpnYnp4ZEhP?=
 =?utf-8?B?Q25QbitsRTJzS3RsKy9jYUsxOElIdENQdVNEcTVwaEp6MUI4R3YwczFad0FK?=
 =?utf-8?B?UEQrcHZCb0IxL1djOGNhZFRJUDY4N0pCaDZoclB0ZzFOSHE1RTVwY1R4RkdU?=
 =?utf-8?B?MUNSSVlhL0NYVkxRb1I0dytKNzlzc05vcWd4VysxSXRQMkpHTFlXTEVEUVNR?=
 =?utf-8?B?WW9rU25hWllRdVhOb1l0bmFkSmpEVXliYUZCdFhOZ3RkbkZaY2ZRNUU3S0hk?=
 =?utf-8?B?VVM1NmJvL2pSdklMMEJxQk96WjRDMVpuRU9FSXpVaU0vbXhyUWdsdDlySEVh?=
 =?utf-8?B?UGtmV1RJa0FET0JiNGVSMldqZmF5d21Ya0ljWXFpYk5nYUZMT3A2dERPdy84?=
 =?utf-8?B?TEU2U2liMldRR2ZKdFd0K1RxVy9XUjZhOFlhb2Z6Q3IweitzZUJETnJidVVU?=
 =?utf-8?B?RlkrK1dqTzhvSm8wY2NIUkZPSGJzVml1TXpyRXR4SEhHVGk1UEx2elNXeUdY?=
 =?utf-8?B?SmFnd1lDcWt1bktncy9xbEdoSzlXUnNTZVlRMzdoZktNS2tjYTduY2d3MHk4?=
 =?utf-8?B?SWtpbE5zVS9mQXhhdll2eUdLMWtCM2psK29EOFJsUVN5WlBnRjRLWkJBZXgv?=
 =?utf-8?B?UkFjQkhiOWUvc1FMOGxNNk11Y2Z6WnFTNWZQeGFsS1d1aHhOQU5JV2tIaFl5?=
 =?utf-8?B?N1orVXRMa1k3OEgwTlZJWW1CZWtJTFM4SUpjenpiLys1ZG5kMTdqOFJwTHVR?=
 =?utf-8?B?U1piZEFtYVJ2Z0dNd1hDN2ppVUViUEFGTXFZMUQ0bVR3SXA4YWJuNkdEOVdk?=
 =?utf-8?B?SzAvb29zM1lrTm81ZkhaOEo5eDdoUEpDRm9nS0xBb0owcXlhNXhRMUZnV3c4?=
 =?utf-8?B?WjBvR0owZjlOVXVjRE9pakVMRTRpeU01bmR0a1BZUGthWW1hazNreEw1cXhr?=
 =?utf-8?B?V3hYdFk2K0g3L0xIWDA2cmNXSUNkaVVGM2E5VEJtdDVxMFRWd2NBOVY5UWdj?=
 =?utf-8?B?NkFqb2lsMHM0RGsyRzc3OVhKcHhGUmpnbHcxSXJDVkxLTGlUK2lLYjBvYnNq?=
 =?utf-8?B?OFR2MkJ6eGRTM1hlbFdQekpvTTduVHFNSDVoa3k1Sm05aW9XVytwelB0UVN3?=
 =?utf-8?B?ZDB6S1NxU3VmTlY2UjBHYnFIcXlYUVR0Z24zUFBBc0o3VHhiaytmbUVEaGJk?=
 =?utf-8?B?TmtvNXYvZm1ncEFTblUwVjBFMTBaVFR0NUV5L0ZRNG1nM09oN2EvcnN0eXZ4?=
 =?utf-8?B?cUJOK255Z0tPeVRta0RiamdEMVJDMXh5OHpkcEhSTk1jWnVHbGFwUDg0RmFB?=
 =?utf-8?B?T0VoZ3hIRW90VHBvN21mOFUxODE3VU5aWUsxVWVsSnNKaUV3MmsyOC9waitD?=
 =?utf-8?B?UFBpUWdMQmwzU0RiR2Q2cjNndENjd0VIQklicHFIU2NLOGNPTWF3S1RGQzVs?=
 =?utf-8?Q?U05Ybft9TmUVEFjijoVd7ArEkkA4o1lBdkNZe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	kAOx2YUKRZdgk0FSGajVkatJRsyqQy8QbdQoMXa2tmsdvfnOhE3SIJiEzgTwAV4okE7W33Vt07sTBtA9YgQ+2/dcpyZDl3b+bgKPMrAaOz4E27h59FvEijU7ktzVLh1kQi+3SmVKx0exxc+OKffX7+XtNuy6I8fC/EFv/bOWyM3UnXISXqcRp2OdjGzoFcq4HwtBRFuwPKCd15d0w8QgF8T42ldFPbCAmu5dL4lNx6K1N4ji7LBUQ0RkkrPuswljZjdcHongA9aTGMrggdSLQIGTtgtHDva/zg0ffY4BxFoNMnSTlqUJN0HZbYQJr/8TRRrZMfUVRaWjF8bqGVx06A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c2uUGS/m8AJwCHlpOPWstSwBLwLov1vsHuRF+hbYwBdmlZg20SO9VEeZD9EICihzF5+QKxtnLVcaRsuznxnns7eXc3YTgrBzUD3CrtqQjCR87s+Q9YUp9EB+RbjPrJ+Z1FiMXhn+lT9Kt4ABe4n+qZ2Sl1N144utfMRBK+4zV5voQfdVJIVV1b5YyjX+nmA5E1FmpB89Vq0mpu6gTToRoAk+nGW4RUCMrtnKSPDeWk5xbZc4/xIETD0nRhJ9byp0oFvS1Vatk/+ctB3hxQ/9NEtBhrbqwgWr+/o6YERx9E9gjmhrK+2oS9Dpf8i//VMO/+qH2a3GXFMocFV9ZCA5n/bcmWalpBiJBSgqKuzQyZpguJTffwOwOWvWRFCWSN+lbayaw9qmkp3lyMNlj6HpYjumulXYb74F7xSGWm55cde6D8TdnBazacb4Eahii76Xen9J0yhGrz9vPqQS5hAg8XHUIbK9Z9Nxeh4uQszEPUHce0fHM3jDk1FnKzXDWAAtUgRgYACzIz+ipBgBfnK3gvGF6oqEy5LeXqnzkxnJA800rvhpSB8w7a4CwhaVWEMxWTQ385zrp9pZa7BfJ/pyzwfnUyZ3RRacOVtceZW4iIUpInA4hLNUgQJRs9UrK/jg
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba20932f-253e-4163-656a-08decd62fe76
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2026 17:56:59.1382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ha79iIbFq/FKjYJeexO0Ked0bAUQOjpxpJBbFncggyIGlJUHTY9KAY+Xx/gqdOGeRgvCU2S47Z5PQSZUnOYM9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR13MB6352
X-Proofpoint-ORIG-GUID: c6Guwg5c5RV9vZUErY2Qo2nug-8QaH1d
X-Authority-Analysis: v=2.4 cv=DY4nbPtW c=1 sm=1 tr=0 ts=6a343172 cx=c_pps
 a=QwCZ9Ep3279coiJ7nb8JBQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=dNm3KQjjYUbhztXjLiFs:22 a=nXA5WNwiAAAA:8
 a=NiL0GWOVAAAA:8 a=2iSxh-PlAAAA:20 a=HKpqHJgo1hXEP8o92W4A:9 a=QEXdDO2ut3YA:10
 a=fGr-7aqQv4RST94IA8XU:22
X-Proofpoint-GUID: c6Guwg5c5RV9vZUErY2Qo2nug-8QaH1d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2NiBTYWx0ZWRfX36riGOOxO1zv
 WbCdNbe4mVYgKMXC/VbPnHoS/y4ThKpfHr11ERjV9NTUCNsgSEdKrsWLI5maHHu1NmUYcdZ8wkL
 pCKMtnqm2iDNcxNN8fhXCKmJAYpGUbaZ88WocsJLD6v9kSvH8HaKdvuQGOjoc6+Ky6caOwx0Fj0
 Ob72KFBJSUO/sSK7d04zXDsrtkx4pgXFHYwMN78XFZ+ZtaFOOYhqMJuyGRi71ZbgQIdsQva775c
 7G/kTzP92wIxDgX2hr4dj34Kg7MiukQm2jL2QWpiNXGSR2jZDX22VBZlV4qZbzwLggY2XrGfVXN
 0FeoXdX7gcvMiB+7mpiUFegbcd+nnqtnkBfrQVgQZJTMpKO6iM/26srRSMiN9qiEn9eVEmDlR/D
 v4bHGvbCMEne/L/3391nz5O1PcaaazQbZPLU/VbhwQvtmbyW6PaFjNcfKIka1rKhcelnAb/x5Cw
 cr/m7RdsMuOdGjIVpRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2NiBTYWx0ZWRfX8RHv66SSOuOp
 BZZOKCeuRyvPDvomRABXNrOvz4dIvNgNdvBmGzzdCZfcTRrWOznZU4KOPZ5roQZN1e/EmFbOtzZ
 AETSzQn3IOVWi6CFdCHOrH6jYZtmjw3NHnWoaCIovc+RgSn0r3zs
X-Sony-Outbound-GUID: c6Guwg5c5RV9vZUErY2Qo2nug-8QaH1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_03,2026-06-18_03,2025-10-01_01

SGV5IExpbnV4IEJvb3QtVGltZSBTSUcgaW50ZXJlc3RlZCBwYXJ0aWVzIChhbmQgb3RoZXIgaW50
ZXJlc3RlZCBMaW51eCBrZXJuZWwgZGV2ZWxvcGVycyksDQoNCkhlcmUgaXMgdGhlIGluZm9ybWF0
aW9uIGZvciB0aGUgbmV4dCBMaW51eCBCb290LVRpbWUgU0lHIGNvbmZlcmVuY2UgY2FsbC4NCg0K
VGhlIG1lZXRpbmcgd2lsbCBiZSBoZWxkIHZpYSB0aGUgSml0c2kgb25saW5lIG1lZXRpbmcgcGxh
dGZvcm0uDQpUbyBKb2luIHRoZSBtZWV0aW5nIHZpYSB3ZWIsIGNsaWNrIG9uOg0KaHR0cHM6Ly9t
ZWV0LmppdC5zaS9MaW51eEJvb3RUaW1lU0lHDQoNCi0tLS0NCk91ciBuZXh0IG1lZXRpbmcgaXMg
VHVlc2RheSwgSnVuZSAzMCwgYXQgOTowMCBhbSBNb3VudGFpbiBEYXlsaWdodCBUaW1lLg0KU2Vl
IHRoaXMgbGluayBmb3Igb3RoZXIgdGltZSB6b25lczoNCmh0dHBzOi8vd3d3LnRpbWVhbmRkYXRl
LmNvbS93b3JsZGNsb2NrL21lZXRpbmdkZXRhaWxzLmh0bWw/eWVhcj0yMDI2Jm1vbnRoPTA2JmRh
eT0zMCZob3VyPTE1Jm1pbj0wJnNlYz0wJnAxPTIyMCZwMj0xMzcmcDM9MTk1JnA0PTc3MQ0KDQoo
VGhhdCBtYWtlcyBpdCA4OjAwIGFtIFBhY2lmaWMsIDE1OjAwIFVUQywgMTc6MDAgQ0VTVCwgYW5k
IDIwOjMwIElTVCkNCg0KSSdtIHBsYW5uaW5nIG9uIDEgaG91ciBmb3IgdGhpcyBtZWV0aW5nLg0K
DQpUaGUgYWdlbmRhIGZvciB0aGUgbWVldGluZyAoYW5kIHdoZXJlIHdlJ2xsIGtlZXAgdGhlIG1p
bnV0ZXMpIGlzIGhlcmU6DQpodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVudC9kLzFYQXVm
b1RUNlZWSk9UTXpLTW96OFN5T3NzLUpBOUg0SjFfeVZYUXE1bU4wL2VkaXQ/dXNwPXNoYXJpbmcN
Cg0KVGhlIGFnZW5kYSBmb3IgdGhlIEp1bmUgbWVldGluZyB3aWxsIGJlIGF2YWlsYWJsZSBpbiB0
aGUgYWJvdmUgZG9jdW1lbnQgYmVmb3JlIHRoZSBjYWxsLg0KLg0KQXMgdXN1YWwsIHdlJ2xsIGRv
IGEgcmV2aWV3IG9mIHBhdGNoZXMgaW4gcHJvZ3Jlc3MsIGFzIHdlbGwgYXMgZGlzY3VzcyB0aGUg
Zm9sbG93aW5nIHRvcGljczoNCiAtIFJldmlldyBvZiB0YWxrcyBhdCBFbWJlZGRlZCBMaW51eCBD
b25mZXJlbmNlIGFuZCBFbWJlZGRlZCBSZWNpcGVzDQogLSBib290cGggd29yayBieSBUSQ0KIC0g
bWtyb290IGV4cGVyaW1lbnRhdGlvbiAoZ3JhYi1ib290LWRhdGEuc2ggZG9lcyBub3QgcnVuKQ0K
IC0gbmV4dCBzdGVwcyBmb3IgYm9vdC10aW1lLXdpemFyZA0KDQpJZiB5b3Ugd291bGQgbGlrZSB0
byBhZGQgc29tZXRoaW5nIHRvIHRoZSBhZ2VuZGEsIHBsZWFzZSByZXNwb25kIHRvIHRoaXMgZW1h
aWwNCm9yIGNvbnRhY3QgbWUgZGlyZWN0bHkuDQoNCkkgbG9vayBmb3J3YXJkIHRvIHRhbGtpbmcg
dG8geW91IGluIHRoZSBtZWV0aW5nLg0KDQpUaGFua3MsDQogLS0gVGltDQoNClAuUy4gVGhpcyBh
bm5vdW5jZW1lbnQgaXMgZWFybGllciB0aGFuIHVzdWFsIGJlY2F1c2UgSSdtIG9uIHZhY2F0aW9u
IG5leHQgd2Vlay4NCg==
