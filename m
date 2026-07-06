Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406E741C307
	for <linux-embedded@vger.kernel.org>; Mon,  6 Jul 2026 16:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356931; cv=fail; b=ajYY00GkBzIUBV0Y32ffUIts5gM3GXoRIzm01pN1VMtVaqqNOsQhUzou/pgTrxl6lYBmodWtEn8mNwm/q9MojW99gpUp2zlhVdO7rdLDxAa5kSepMhtNd1sjUAHOujqcnwkHMrPC50toxLqobI9DHMz+twZE6Zi2naAao6hhA+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356931; c=relaxed/simple;
	bh=JK+D5xyhNrHjMcW+U1bwKlESjgKBf/6JaXg0SEQvzho=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=KbhJ6JYqics5iLSUJsVSwZDECQAsX0ygtG7R3NC/lTh45UNQxpckygrHDA5DIKmtVydUOBWqX+IuhPmVaGgI5CMHACK8sr44VaMaQigGIQncdFmH1ToPRFOCnUr4KVHowY8T5kK5p3qX5nWZtVuRbLc306iacFj2zbgjrPyQIwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=Jw+Vpyxl; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="Jw+Vpyxl"
Received: from pps.filterd (m0209319.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666GUNVo3265460;
	Mon, 6 Jul 2026 16:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=1ecnFzW
	IojSWQTiE1x95971sPLvCzB5J34yKRWsTlhE=; b=Jw+VpyxlnFsGmCVw46Ai/Ve
	e1CdQ3CwXCY8jKJ+K724dDIzt+k1eW9em0XYxohCQ2zN+ogpp1F+gEXtaO90+kfX
	PuvpwzCnVPffwwJb6V+gYjTNWZLnfrDUIglFB5Wjy8aYpdDrUPNBaUycj2heI6k5
	zjd1Y6+Xgsryma11095HWxUMtZ4lWoelt9hrH2u0jUixfHZ2jkE7C9iTzr1YgFOM
	cEUD58k//I1DKGIySzGjLprMnGMuSHizle3ohxMx0KVFqOSl3T56/wJoFQtxUQJ4
	+o7aSsbDtiQazng2nwKV4c7SHlFNvx4AWxY7ChiIsGDhwBnlHK0KjVWgehBxNDw=
	=
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010070.outbound.protection.outlook.com [52.101.56.70])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4f6tjp26yc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 06 Jul 2026 16:55:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peTvO5joGFsvViEUhj2sOVgm5bsL5KgtFk/huqD48CSoKpZfKEC2Kqwm95uL+lVZZzJMqyeDpmHvvIxHHHrhmH0d29ZuiD2ou1aZk76RZ1ZeTIkPBU0084NFRMoGXPndGlo/8PNWg7RwkPpklUniOIYwCDo7OGcU2ZvGI3OXaH2aEXR46aeaMw8CWupbra375GrL1x02X7/BM0jZCHn0/EiakGPd0dH2zB9F2W+KgHI0s54KsAbLyF49CbZKPt3UTI6wfIiPq7gsCJ7ikKC3ob/fhpjxpgauMuO7oafVeNQ0dpGfEkd1l/2xTmFB3CUilO0U6AZzmBWQSVrl9Qe7uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmaezhhDq44p4Sj/AgsbOUlRQczu+Eq7WXoJCurPeZA=;
 b=C1BbBJptEQIaT02GN21L95BKJeNl/S+zXw7nBqMfj1w1SEUqUQ3JO9AtDiXbAR71m5482/tk4EtxIKiiOwPIt/AFeoBiv5aGS0DFBjtOZwq2Tn2YdF3TAsq0tPcDN/Pf+UFQAWPz4jAmLBacrUNLjRkyZREbDh+d01Gazrnm+6xtA41V+hG4wOCTuz+HNvcKSwKOEGs58dU8ljoUmtlUjTCOm9UPUeiRxR1H4yn2o3tQlzKHyJxFpSOY9ZFx0RZmVCYXFGx8+DrGH/zuNMNoxu9BNJ8wBRGp6lSO5i56/55/lhNTPjJyF1OBnnaBcTaoHCDfTn5L9ktVC969OkxIpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by PH0PR13MB5614.namprd13.prod.outlook.com (2603:10b6:510:128::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 16:55:03 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%3]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 16:55:03 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
CC: Embedded Linux mailing list <linux-embedded@vger.kernel.org>
Subject: RE: [PATCH v2 2/5] software node: add fw_devlink support
Thread-Topic: [PATCH v2 2/5] software node: add fw_devlink support
Thread-Index: AQHdDUgvQmR6Zb5DT0iYVJ0qCGRB8bZgtUyA
Date: Mon, 6 Jul 2026 16:55:03 +0000
Message-ID:
 <MW5PR13MB5632A162A56D546F43DE7F79FDF12@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
 <20260706-swnode-fw-devlink-v2-2-f39b09d50112@oss.qualcomm.com>
In-Reply-To: <20260706-swnode-fw-devlink-v2-2-f39b09d50112@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|PH0PR13MB5614:EE_
x-ms-office365-filtering-correlation-id: 505ddc87-0ddd-4b05-249c-08dedb7f52f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|10070799003|1800799024|366016|4143699003|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 48YCpjy7l+0M85ry07sfyge9rQlLLooVjRKXJR+DnM0+5vAN9WnsrSgqgtQmfApGjYDJDoL7A2BUeTVs9TdRsDCDW+8JLo9eij7Omc1XPOOfNeRF7E3gRKpsZ+m6wEXCKGhwAD9/GTdmXBHegJXjkdZQlR4K7jIyU6fKLLBkH25JKIdlMO31u4d4YlnqYXQHZzXa3cLY1SqmQkbBf/UyRcckhbFml2rMHtdCouNnWRW+pJZ0fAJC4TDUS0DUgpSfo/+iDKOyxFxL2XvwJCo1c9ODPAihb1Wq8XwBH2rilQpsVLiRUm+JaS4U/agAbDJV0Aj5CyoSEh/0CqiW49NTCQ4VTEtt/a+lfTokuBpN6LwUU9/DwmZ/UeMgT4grx3F1r/SjEFW6sHNNrgzQA/Jlh/XncJWTd9gX0JgS9wc/cv2AmEJYsn1wuhm8QgBHucWLnRmIxwCXF3FWEZVnF+rjf8yVTK6emUqZBOBHXMVCx1M5G500r9DlaaAksMvpkZ5c5CPHewd/bzk2LEn0HOLd+JC0gcKerVMyNyl1atMbUCKF1n5iHIl2p1CWCbnSorCaK/2jv0VDnUDg/Otq1jkWUDBJue9SX1VEHsYfxmngn29C5uEMbIIvQooeInVIwVIxXRTwO7d/gfddIcsq/Pf2xIDi1kPNzTErt60xYbp3RgY7z6wWV0HfoZWKhAf+N8KQBy0bUpm3sLJQ5tj0Di/AdggNMbChWlvuAY8fe7lda3M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(10070799003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cjVxN0FMQkdNZnBKeUhzUmNGNytoYmxMWjd6eTg2WDlMZWNkT3ZFS0RpcTBp?=
 =?utf-8?B?STdrajl3TXErSlpNblFFZFRrekN0VkR0b1hCVU1mK0hPY2wvODhhTFBFdVJO?=
 =?utf-8?B?MFk5dzFCbDRmVWJiWEVkbWpUSlM0cG9kV2xVbUVXdEdiVVlsODk5V2tBRFQ4?=
 =?utf-8?B?Z1kxNXdickZSVjVJc3puTk5MNm5maEJQNnlXaS9EcGgrenZxR2dvSkhQTUt2?=
 =?utf-8?B?akZXTm1iTit2UG1RcHRCbHVMZUdIM1BRSFFxclZ5NmtWSG1sQVl3RkhRQm5R?=
 =?utf-8?B?YU52dHNFZno3MjZ1enZ3Z2pYMWhROXpUc2NCQ0IyLzkxQ1RyUC9vOVBRRFps?=
 =?utf-8?B?OVh1T1BGWW9Idi9pSGNESjNGU21KOGp0cE1SOXlpa0ZteEtqUXc4UysvNlVq?=
 =?utf-8?B?ai96bUpKaElpV2hXVTRJWkdsTzlTVGRXOFg4SHVydXdIczVWSDRTckxLeThH?=
 =?utf-8?B?RWJjcUFLbDBCSDl3cG44TjNmMXNZUlZKYzhDRTdCT3A4T3V6TUhFMTZZbVNm?=
 =?utf-8?B?VEhjTnFER2s1VmowSEg2eWJRdmY2SGxQZklwWFBWOG1PY1FWaUJ3SDhKZkc2?=
 =?utf-8?B?Rnp5YnNuaEpsNDhpMWkwbDl3MXdQSFZ2RUIrZmpoTVpDSWRBcjNwNm90a0tM?=
 =?utf-8?B?R28xSEt5cGF1YzhuRERpQzRZKzhmUWo0cmJXRFNFOFhNQjNiQ2RVS2lsS3NT?=
 =?utf-8?B?c1BDMFM4ZzF5V2x1bFlOUk1LZ2krODgzdWFSRkZ2bHlZbVMyZXRLZmtEOG04?=
 =?utf-8?B?WW5sWVZWVWJ2RzJGWUNZdjJoNldTb0RnS0JabWNOUk93YkcydWR2TUxqVmQ0?=
 =?utf-8?B?S0MzYjkxb0hEcWtnWkhoWFlidjNrNzNudWIvNjVpd015RTJGb0gvRjdVRHYr?=
 =?utf-8?B?QlZhQjNnaCsyTlZVL0FYOUp2SDJ1OUlqV3BXV0I2RW9tYVhmSkZVN1Z4MGQr?=
 =?utf-8?B?YTEzSGEyUjZvRWZUQ0c3RW5QMks3d3dtSUJKeS84cFRiRUhRUFJJWVBQMUg4?=
 =?utf-8?B?a05qV3JCNnBBTmpxa0t1SFZLSlJXSUh6Z0NQSDAxNzNrSVNlRElxSGhNY2Vk?=
 =?utf-8?B?SnBuSkFSQnkrKzhTakhzNXBUMHdWZ1lsc3VINThYYWd1WTJaSHlFMytKZzZp?=
 =?utf-8?B?RXVuSEdqMytEK09lTmVYeGNmL1NGVnppa0phK1FCRXc2S1VlOHhiNS9Relpu?=
 =?utf-8?B?YXpyQTA5NEIrNEZ0TXJNRWtEeEFndUd1TWVzTGVIV3FYYkxiRll4MkM4M0FY?=
 =?utf-8?B?bWl1L2lqTkJmdElqY0NjTUlJRzdHWVNOVUZTczlkeHNMVEhhajVhWjJzdUpU?=
 =?utf-8?B?TTJyQnR1STZwRDZCU2c4REozK2hadmFlUitOckV1YTRLNTJWNWwxUmNyZUVD?=
 =?utf-8?B?amthd2tjbTRKOU5vVDJJVncwcjMrT2RPR2d3QUNNZlVBSFFXa3pCSTc3dmNy?=
 =?utf-8?B?dVltWkt0UjNFNysyUUxGSlRkVG4xRUNZL2ZTUS9oQzdWYjhBZzZyd016ZVNN?=
 =?utf-8?B?OEc1V3Eyem5XTDJOcHFRckJEcjJoSW0zZWVHMm5sV0pDOUNraWdHNEUrcVBZ?=
 =?utf-8?B?M2V2aHJEM1VGcU1TaHNMbktYTWZHdFZrOEtHMGMxbmVDSDM2a05VMmdRc3FY?=
 =?utf-8?B?QlBOOFU0Y0QyMHpsZGhSYXpqa2xPZHFaR3V2U1ZwZ3ErcXdhM0ExUkZ2Ly83?=
 =?utf-8?B?eWtOb20xTThnUEw4M00yY1FDSTdWbWFTeDloMVhNYk5SZWtmTGFmeS9FK1J1?=
 =?utf-8?B?K3FLcG9rUnJ2a0FER2RSdnZ1dUVRY2RvUmtZTTV2WGdjbkF4ZS9rdnJkY01C?=
 =?utf-8?B?QzQ3aXRpV0ttVUxnYUpxWFZEdlNBSzJ6VGs0aldvRVoxQUtEaVkxNHZKWGxP?=
 =?utf-8?B?WFdFWkx3UkgvdEdaTnVySWdpdWVLWmtuTXBkTVh5eWJST3YxTFMxYUFKNFJk?=
 =?utf-8?B?ci9VbzhodlhSU0xtZDZvZ1pWbTErbm5iN2twY2M0SWNOQ2tPdVNBNkZ3VkZn?=
 =?utf-8?B?bVVQNzM3cmpMSm5jK05tbkVVRXpVWTY5ZVZQOUNRQXhvc3IzVXduc1pGRm5Y?=
 =?utf-8?B?enVHK3JYcUVPTVRNRk5RaHhIdVZyN0RoN250Z3Z4L3I3VDdheSs0V3p2ZDNL?=
 =?utf-8?B?eDdETzhlMnlLZk1yMnlSSmQwRUpNWUkrY01EUU8wblpYZzFUL2QvYzdTYnU0?=
 =?utf-8?B?ZENhOGZHbjNRWlV2MWlHNnA3WXlMZlZPajR2RndpdXFHVE5zZTcrTUhQMUIx?=
 =?utf-8?B?NWlFcWdSVlV1M1dITEZZT0lqRVVzTTRqenlDYThnVFJiajJZaXlseXozbXha?=
 =?utf-8?B?aVVGZWZ3aHV1QVFuRUhDMDVGTENURDVqeUtTOTNJbkRtelFINUx1ZGJBVG5M?=
 =?utf-8?Q?H6/jajL0eQdGs+8LMYtFibQUQrpLU5XxNpL1f?=
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	iAzknUx3HtagUWqUkw/F+CgGmFpkrfjfSScLpsqi91BAKxNOk8cx9zA0yOO9AFTP65l01oSxGKLl1V46glUSzg2aWJQb/cFuzKm5WdYixohsymOtIuuuvPajs2YRLPTu3E8fUdtNZXnADV7Q0CMgnxQfvTRQmE3c6PRoOZ8NXtFlIvhxxr/siCx413vcTRmd9b61XODOkFw+s4mv9hdch87hY+OxxuNeWvduqvINR0UYVAxlrCS2aqWtojr80lhESyPkakkynD+KFo9rF7yYPtxlLKcL/2JRelNHvQQxhg6Le+S9Ksqx00HzFZiD/lWBJfV0NDaSnLWtavZThO0l7A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kBc9aTNYcCSyUwP7wa6om6+A4PsCU6JlVjfszH2CrvVGkXF9/DDFyY7dzJZjPkqcWFILFmiGhOI7VXM0oax4Z2RLOJdtDXPgyo6tcXOUaAIzHQk3NILtrI2JftQO4o3uXoDK1XCFLNSyRot8Rz4gVwZVwAzJwR1ql6pb0B+/n+kSljiQEEzVk24FJGsBBvuVCAiSVlWREjI0Bwur7LAAm5qb6H1dnyq7XSEEBqiUE9xfj8pJnpKf5fii7S7dI67BVtN8XWXN7kHqYZiX6PGbrEORNWeH1rOQGksl0NzeFpjB+U6D5+OYBam1p5/kGciKUBUy+12ZgdxpDxDIsp2d5HcW6dDPUTyNibz47WSKXYbnD7S99Pl8evZNILQZpYkXT6QzUbQOJmgtJIuSiSjr5j4PPTxTmz5ipIm9g2zrPKqWuIiIQS28w6JRFG1DgqRomp5US7gXYDjoPHEzz2vOkj59TDfyiTkvFsHRbMzJUdFHRt9HlWPn3eFGNx3BYfvj19X7ZLLxfOvvYXCTHXvgVqx/4CDLk0h8j3QZgWwm+PN8KqTG7xM4RBTW1ePWuoQtJTtvvzavxCW2vw4/60ZFZFwtd4gfqFMxSoxXjzSVkJqJ9D6FpMh88QOKeXNcg0ec
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505ddc87-0ddd-4b05-249c-08dedb7f52f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 16:55:03.1924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iPWdOTuQWb3EgccIfjg/WlGJ3z8d9SfyjIIgcPN7V8BGi0Gi9x8grdLhKYmJyv22TPZ6UBPZFeS4eK03PEofGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR13MB5614
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX6H3AoWkCZFXE
 asA0Ru6zyiFSjlFZ8FrxUBrd9ABFxFp1D0xUgg4ESTnTtL/DGf9/t1I0ZBoyq8hbbwjC1ndtdRk
 mSTO3L3Trb+zGhzAqKMhjBejz07qjGt2PN3afoupomhUy5AjBESs
X-Proofpoint-ORIG-GUID: XtVfEoo_dbSJ-uVSmu-y3p7sEAqqhYQN
X-Authority-Analysis: v=2.4 cv=M5597Sws c=1 sm=1 tr=0 ts=6a4bddf5 cx=c_pps
 a=P6W5axN73kUBBlOjEPV+4Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=6Vn1QVPt8UGdu3r8PAnt:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nzuXsxulAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8
 a=ag1SF4gXAAAA:8 a=4RBUngkUAAAA:8 a=9yFmIu8hXOOK60S-n_cA:9 a=QEXdDO2ut3YA:10
 a=Jn5cl5okm61iLnyvC_SE:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=_sbA2Q-Kp09kWB8D3iXc:22
X-Proofpoint-GUID: XtVfEoo_dbSJ-uVSmu-y3p7sEAqqhYQN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfXxjY0jUAPQcMR
 Gjapx0xovAILbmlHuyvBB0HPU9x/Grplf/Q/+gA6MXP2CNCNFSC2bqq7tZeD+pJB8pYO9u6RoEH
 /DIzFokkGEmNP6eFu6PCXPx5I/2LbGo85Yl/t9L2sKgHjEKYw9eE05pLtYRHo6i5TESzZDzy+1p
 fmURFhNc70gK46bUwB63IUd+3CqvhymoRSwX8dAa4Ft2/vlMqcM3a89z2lHQUDsPgftEQjU/uFL
 nCpK4lfU1pMD7sR62QVO4Zcgv6xt7p9/XTTmltfDz6nPUZIuOR7OCBNtv8XhX2HEdUyA72vQw+E
 RjDVhqYgGibNK3s2Eg3qU9xk4Egbue5WJmoitKU9E7Lw4mv4JEmtrNapEQeDxfNe++xbQJdnLft
 dAu72loPfhHm/40u3qARw3cpkLwgUJCacPaAoaEwfGZRbvfHsY4Urb9769fUSksJg23rkwsoaak
 9wsiB+nkUO4cghOKNDg==
X-Sony-Outbound-GUID: XtVfEoo_dbSJ-uVSmu-y3p7sEAqqhYQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01

Hey Bartosz,

Can you also please CC: linux-embedded@vger.kernel.org on this patch set, i=
n the future?
There are a few embedded Linux developers working on boot-time for the Linu=
x kernel,
who are interested in this work.

Thanks,
 -- Tim

> -----Original Message-----
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Sent: Monday, July 6, 2026 6:54 AM
> To: Brendan Higgins <brendan.higgins@linux.dev>; David Gow <david@davidgo=
w.net>; Rae Moar <raemoar63@gmail.com>; Andy
> Shevchenko <andriy.shevchenko@linux.intel.com>; Daniel Scally <djrscally@=
gmail.com>; Heikki Krogerus <heikki.krogerus@linux.intel.com>;
> Sakari Ailus <sakari.ailus@linux.intel.com>; Bartosz Golaszewski <brgl@ke=
rnel.org>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>;
> Rafael J. Wysocki <rafael@kernel.org>; Danilo Krummrich <dakr@kernel.org>=
; Linus Walleij <linusw@kernel.org>; Dmitry Torokhov
> <dmitry.torokhov@gmail.com>
> Cc: linux-kernel@vger.kernel.org; linux-kselftest@vger.kernel.org; kunit-=
dev@googlegroups.com; linux-acpi@vger.kernel.org; driver-
> core@lists.linux.dev; linux-gpio@vger.kernel.org; Bartosz Golaszewski <ba=
rtosz.golaszewski@oss.qualcomm.com>
> Subject: [PATCH v2 2/5] software node: add fw_devlink support
>=20
> Software nodes can be used to describe supplier-consumer relationships be=
tween devices they represent using reference property entries.
> Unlike for OF-nodes, driver core cannot yet use these references to creat=
e a probe order that avoids needless
>=20
> Software nodes can be used to describe supplier-consumer relationships
> between devices they represent using reference property entries. Unlike
> for OF-nodes, driver core cannot yet use these references to create a
> probe order that avoids needless probe deferrals on missing providers.
>=20
> Implement software_node_add_links() modelled on of_fwnode_add_links().
> For every DEV_PROP_REF property we resolve each referenced supplier and
> create an fwnode link from the node to it. The driver core later promotes
> these to device links and defers the consumer until the suppliers are
> ready.
>=20
> There's no allowlist like the one DT needs - devicetree phandles appear
> in plenty of non-supplier contexts, but a software node only carries a
> reference property when its author explicitly points at another node, so
> we treat every reference as an intentional supplier dependency and link
> all of them. Graph "remote-endpoint" references are skipped for now: they
> go 2-ways between endpoint nodes and would create graph cycles without
> the port-parent lifting DT does via get_con_dev(). References to
> suppliers that aren't registered yet and self-references are ignored.
>=20
> fw_devlink resolves the supplier device through fwnode->dev but the core
> only records the owning device on the primary fwnode. When the software
> node is a device's secondary fwnode, mirror the device pointer onto it in
> software_node_notify() so the consumer can actually find the supplier
> instead of deferring forever.
>=20
> While at it: purge the fwnode links in software_node_release() now that
> software nodes can own them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/base/swnode.c | 79 +++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 79 insertions(+)
>=20
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 869228a65cb365567ddac7db6ad7b8743e0dbca9..e6e2d6926fef2db82eb1f2bf4=
39e80aacf48668a 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -699,6 +699,62 @@ software_node_graph_parse_endpoint(const struct fwno=
de_handle *fwnode,
>  	return 0;
>  }
>=20
> +static int software_node_add_links(struct fwnode_handle *fwnode)
> +{
> +	const struct software_node_ref_args *ref, *ref_array;
> +	struct swnode *swnode =3D to_swnode(fwnode);
> +	const struct property_entry *prop;
> +	struct fwnode_handle *refnode;
> +	unsigned int count;
> +
> +	if (!swnode || !swnode->node->properties)
> +		return 0;
> +
> +	/*
> +	 * Unlike Device Tree, where phandles appear in many non-supplier
> +	 * contexts and a curated allowlist is required, a software node only
> +	 * carries a DEV_PROP_REF property when the author explicitly describes
> +	 * a reference to another node. Every such reference is therefore an
> +	 * intentional supplier dependency, so we create fwnode links for all
> +	 * of them.
> +	 */
> +	for (prop =3D swnode->node->properties; prop->name; prop++) {
> +		if (prop->type !=3D DEV_PROP_REF || prop->is_inline)
> +			continue;
> +
> +		/*
> +		 * TODO: Graph "remote-endpoint" references go both ways
> +		 * between endpoint child nodes and would create endpoint
> +		 * cycles. Let's leave it out for now until we have potential
> +		 * users.
> +		 */
> +		if (!strcmp(prop->name, "remote-endpoint"))
> +			continue;
> +
> +		ref_array =3D prop->pointer;
> +		count =3D prop->length / sizeof(*ref_array);
> +
> +		for (unsigned int i =3D 0; i < count; i++) {
> +			ref =3D &ref_array[i];
> +
> +			if (ref->swnode)
> +				refnode =3D software_node_fwnode(ref->swnode);
> +			else if (ref->fwnode)
> +				refnode =3D ref->fwnode;
> +			else
> +				continue;
> +
> +			/* Supplier not registered yet, or self-reference. */
> +			if (!refnode || refnode =3D=3D &swnode->fwnode)
> +				continue;
> +
> +			fwnode_link_add(&swnode->fwnode, refnode, 0);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct fwnode_operations software_node_ops =3D {
>  	.get =3D software_node_get,
>  	.put =3D software_node_put,
> @@ -716,6 +772,7 @@ static const struct fwnode_operations software_node_o=
ps =3D {
>  	.graph_get_remote_endpoint =3D software_node_graph_get_remote_endpoint,
>  	.graph_get_port_parent =3D software_node_graph_get_port_parent,
>  	.graph_parse_endpoint =3D software_node_graph_parse_endpoint,
> +	.add_links =3D software_node_add_links,
>  };
>=20
>  /* ---------------------------------------------------------------------=
----- */
> @@ -787,6 +844,8 @@ static void software_node_release(struct kobject *kob=
j)
>  {
>  	struct swnode *swnode =3D kobj_to_swnode(kobj);
>=20
> +	fwnode_links_purge(&swnode->fwnode);
> +
>  	if (swnode->parent) {
>  		ida_free(&swnode->parent->child_ids, swnode->id);
>  		list_del(&swnode->entry);
> @@ -1105,6 +1164,17 @@ void software_node_notify(struct device *dev)
>  	if (!swnode)
>  		return;
>=20
> +	/*
> +	 * When the software node is the device's secondary firmware node,
> +	 * the core only records the owning device on the primary fwnode
> +	 * (see device_add()). fw_devlink resolves a supplier device through
> +	 * fwnode->dev, so without this a consumer referencing the software
> +	 * node could never find the supplier device and would defer forever.
> +	 * Make fwnode.dev point to its owner in that case.
> +	 */
> +	if (dev_fwnode(dev) !=3D &swnode->fwnode && !swnode->fwnode.dev)
> +		swnode->fwnode.dev =3D dev;
> +
>  	swnode_get(swnode);
>  	ret =3D sysfs_create_link(&dev->kobj, &swnode->kobj, "software_node");
>  	if (ret)
> @@ -1127,6 +1197,15 @@ void software_node_notify_remove(struct device *de=
v)
>=20
>  	sysfs_remove_link(&swnode->kobj, dev_name(dev));
>  	sysfs_remove_link(&dev->kobj, "software_node");
> +
> +	/*
> +	 * Drop the device pointer mirrored onto a secondary software node in
> +	 * software_node_notify(). For a primary software node the core owns
> +	 * fwnode->dev and clears it in device_del().
> +	 */
> +	if (dev_fwnode(dev) !=3D &swnode->fwnode && swnode->fwnode.dev =3D=3D d=
ev)
> +		swnode->fwnode.dev =3D NULL;
> +
>  	swnode_put(swnode);
>=20
>  	if (swnode->managed) {
>=20
> --
> 2.47.3
>=20

