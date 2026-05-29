Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6B93E8321
	for <linux-embedded@vger.kernel.org>; Fri, 29 May 2026 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780070070; cv=fail; b=BLv8ArMUDKp+Oym64oWlqhpGa0n1aCXkIekB2A12sDyg1kK7BIBN8FFGcYiI2MDS3jfOFg6UBgjMmW9JHD+5LRqJLlUA2HA/3t/ovlf/th74QncAWzUHirVNg3qkQw4Al08SxfVT4Q3JzlmEhJj4dOvigGkJHXZI5m+R9F88Hc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780070070; c=relaxed/simple;
	bh=YsVdsGbPE8Ei1ntx20csrXXKM2rCdq//TJ9DysNk/Nc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=fdRL2RXMhgiQxDth4o1tJ10NR6LUepKR6yx24Dbp9V2su49cZLhqsLs25Ck9v9W8RfgA5PfMl5RBeR+ozNgwPYVS0bAmKMTfqM4Li8heURri2ruUnKtsdkLkVXCG4s0ztVirSEwIdDQJ7Hi+cEDN0Qfkb3C2efjhITRvLrWJm8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=pIPQmGwK; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="pIPQmGwK"
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TFqs5r3866274;
	Fri, 29 May 2026 15:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=OQtpxCQ
	wfdPz215HcEM31y/4KeE4uUyRiap0SgsVqkg=; b=pIPQmGwKQxQpj5FBI3KuCUC
	PnGq7bLzcsDOCn6LymJEqTFci1l/9yb9VqqdbEooQUkygAiUyCt7fQ60iR/FdJ9j
	3a/XYHQa5ooYluXa05wsI8A1hviKJh1CNDsxLGbCRgePDDBGd7ctkjgniHaZnLJ2
	MxRNo1P0l4rI/m/nqVTwG7UPu3dSFj6OYB5tgpK0Wg3rKMfzp5f2b2PRuD0I5J4u
	ixff6nKbo+acSO+rO7ylx1/p/VLnyEDwuCAcEpeYny7au6k+tZbFiovb2ZU3Ynz6
	PjivCiqvvlDxxuZEtVAWgh50Nfga76PmIfmsowd3dfs+YbVTh2hF9MjvC/ZjXOw=
	=
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013028.outbound.protection.outlook.com [40.107.201.28])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4ee7wtjd0r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 29 May 2026 15:54:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y71cdOkelacVHjsj0u1tPZBlbM1TXqSVS6ZZ0zIykBhSJQVnoArQXDdF9xK3vYrsDn59ob9u/6viWUOO0pJZvYfNkjOR86n7kszHVoeYcBvJkU+mHxQZbFTyzkLSvF9DZnAS2WA/f5UnDpkLOZ3Yg860C4ijl8RuPsLGmG1h4qyIz+l6gTZKp3lX6lmkXpmdQziBcLXRu7IcsmJNY+qQfLB750w3dCU+9SCoJEYiv337BE6i9IqD6Yq6U9zDU9ih2z7LoIMJ15CtCc8IXJmXv34BGyvJwQfJaF0RSqg5n9tpeyFLbLqbH5/9vG8U/MxFJ5+SVscFBzv6gwGVTTlKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUgw+xReJ98P9Gzgldv/vvo1IZCD6bIDaFQDJ8Tkhjs=;
 b=BU2Axz7iE81aT1WHqSQ76VbVTthDYvsKoRIP0hK6hC0bWmuRE9r9Cv2I+lcRyk+znVRkdeXsf2TmZNfWjYXqr5BGztTBCGe1XKgBjLCFykJRYT97ZLJaRBVdt6k+ZA95LV79cCye4mvAf1m5n3OrGUM8EECBIOrgOa8e1Dv6p6jy4hflGXnoaBFB19dm4LCqMH0KzMjt0hjnDy5//LJaglJwsWcm1ViTVTVSAiqCMAmueIHStZ7YadZCQhrp1mak7C5cnDM4wjV5oBQEaEZNjY8eeyjz43ZoUp5Npq+yVdbkpwGd8G3IGcRTKYfTc7g478A62TpqRmgsImSt2BvwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SA1PR13MB5054.namprd13.prod.outlook.com (2603:10b6:806:184::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.5; Fri, 29 May 2026
 15:54:11 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%3]) with mapi id 15.21.0092.004; Fri, 29 May 2026
 15:54:10 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Rob Landley <rob@landley.net>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>
Subject: mkroot quickstart (was RE: Testing on lots of architecture targets
 with mkroot.)
Thread-Topic: mkroot quickstart (was RE: Testing on lots of architecture
 targets with mkroot.)
Thread-Index: AQHc74NjJg12AYhEcEarJG3Xfa25Tw==
Date: Fri, 29 May 2026 15:54:10 +0000
Message-ID:
 <MW5PR13MB5632FDD1833ABA105437D02AFD162@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <f35774f8-4194-4715-8321-dc2fdfc7fc88@landley.net>
 <MW5PR13MB5632F0D9C8E8A12F2C24B64AFD012@MW5PR13MB5632.namprd13.prod.outlook.com>
 <81e4aefd-f052-4a52-94b5-36030b26c358@landley.net>
In-Reply-To: <81e4aefd-f052-4a52-94b5-36030b26c358@landley.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SA1PR13MB5054:EE_
x-ms-office365-filtering-correlation-id: 9bfac643-7de1-4751-d7ac-08debd9a8633
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|22082099003|18002099003|6133799003|56012099006|3023799007|11063799006|5023799004|4143699003|38070700021;
x-microsoft-antispam-message-info:
 bE5QDPNf7llrj34Sx4c2FMY+ihWgXNd0rejxKx1tWr1FWy+VydZV24qnByMN4bXG0cHhwlbUj2+g+xfbtnLW/Rk4+z+s7I3SfbgS8vtN45GX0mQ2OJiXfUKkMwbcUl3VzulR/TuTsb4Bf24ZuwiKrRkLhU6wFS4wvsh2Wmc/eCTYyvhApRlHRteGBruW2CeMkgYGAW+mdf9PGAmR2rBgeYDzZ5O1dQIg5OKZ/nkY+1s48IqPXJgoP3a+5yb0yu3kRB5plRtRC6Dr2je8gpz0qK3dC2RSUf0lJmnCUYqy81OkJDjSAtU8VA3tkX7NFjlRSvOL2lbY/rN+BVnyExlB4cX7ARlbjXlPNKXhXEVPJmqixeohzQqkUWGrg2g9Oyur5HOgs+b3tOTCducwyZjcYVfmnmWqqomhWJKg/HScZguA2ab6+fPGvh9/1vG3FpZr3WWTvHVSM9iKNw/gym+Sv+5EmxMZRL8huoXD/zSrFV3m+ecNsM+zHDYF457ppUyO9k9qjuiSwBjGmsuKxaTagEsv0IJuiKQ6yvx4NKTWESSnaIkGY3WPecoyhwplVfT3H2L+j/hFzfN5FVIj9GcWNOPR1Eac66ezas+WJADWyRndf/cS1xg2g9O0nMDD9psmeVPM0stSBPsMxfD65Zv4ydfy0kVJ1+ZnQS9aoaAfd4fzOJPE3ASVyNluVWnbPOxwj68H/fVGk+wyGjafT4wFNQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(3023799007)(11063799006)(5023799004)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2t4WWJGN1UxbnFzZ1hDblRCOFcxSy9qeXFzcmZBSGFPSUVBejJpS2FtRk5K?=
 =?utf-8?B?ZGh0NVROQzNXQXRlb2lNSDIyZ3pSMXVlNkVmbzlhUFZ5SHpidExpMmNiVmRB?=
 =?utf-8?B?MElWUkhXOHdrWmlkK2tEM1Q5c09idVhmSmMzcnhHTW5STVhtV29XdGc2bEs5?=
 =?utf-8?B?Sm1lQkN3UHdQaTFEL2Z0MjZhVzBIcEJSUXJGVzNEczFFaDdOeVBHVkhML3Uv?=
 =?utf-8?B?R1cybWRaZUxRV2pJSVBXRzNpWE1OSk4wWnNPZFBLR0EvUHZvOWNxQU80Z3RX?=
 =?utf-8?B?V0VlckIyTWlxVXJEbVJmKzNoRTFzbGZka3JKS2VqUFN2bzJXMTVDVDhHM3pP?=
 =?utf-8?B?Uno3dG4vR0JyWXlPNkY0T3lUTGc0ZWVLdDBSZ2I3WG5PTWZNOGFyZHI4bG9u?=
 =?utf-8?B?eHV4cnRwQjVaSHFiNVcwSC90WmU0ay94aVpidk42bXpxbVQyYVpidlRQNXZC?=
 =?utf-8?B?MU1wdWRhRDd1dE5jdGpVanhXMVQyQlAyN1ZzcGxiZEhtZWFyRWNqaTZBWDg0?=
 =?utf-8?B?M3pvbFdZVnI4M04rVkZSNk5PZGQ1MU5JMHhPejQrelNJeEN5ZWl0bm1LVFdN?=
 =?utf-8?B?Q1NWekZUclVyNG1Zc01OZ2g5SzhudS8zUWpxTGVaaXFwTno1dFBURnNQN3hu?=
 =?utf-8?B?UzFnK3Uwb2JKQ3BWZUlOYXdCZzNRMURNdFdFbnZMQ3BXcytzU2pPaDhQcTlC?=
 =?utf-8?B?bDNneUhNd2dCekNkSkJCZG93NW5Jdlk5K29Lc2Z4cGlXeERtSWxWRkpTWTFE?=
 =?utf-8?B?ZHZZMWRERXdpdHhRRFJwUXJGUlpOb1IxT3FWVkNkc3lmUG9PTEFoU0hKRWpr?=
 =?utf-8?B?M1AzZXZEcHBhUXMrU3ZOSzJjbUdjNDBsOU1CT3NNdllZZG1lZ2pHaFllS29U?=
 =?utf-8?B?M3A3RTdwekJrVkkzc2p3YlE4a0FnbFFFR0JCQXc1aWJpbi9Vck5ZdjVNYTlv?=
 =?utf-8?B?SldWMDU2VisrUXJLWjNoRGFRN1VGOFBadW16OGZXN3cyZGkydjg3TUxNdFN0?=
 =?utf-8?B?YWFCNHNRVkhpd0p4ZW9JM2t5VXc0NlZLenA4TEtieWlhdXY3RWlqd09uNFRx?=
 =?utf-8?B?dVVuc1lPZFVTRDdRYWY4eTl2bCt0WmM5cGlOUWMyb3RLOVVOOGdjbkNsbUw0?=
 =?utf-8?B?WExyVmlrWEtVTHhDVTBxWHMzVS90S3VXb1JtcGxYRnlJb2t2NUtwM0ZpLzds?=
 =?utf-8?B?a0ZOZWNrOS9iS1owRG9UaGRVNW9mYlR4K29RUy9ZQTM0eDZIaXVBaXdxOTIz?=
 =?utf-8?B?YlhkUUZWS1pGWUt0M1BnRjFpSHBIWnoyKzViK21PNEJoVlE2RXkvMHJsVzli?=
 =?utf-8?B?TWVGL2tlQjdPWTV0dGxLWi9EellKQlFPRkpSSW5JUXQ3RjNrRFBhbWozQU55?=
 =?utf-8?B?MXJnUzIvOXlpamxZN1dKR1RGZTJ5bjJLckl4d0RzOGZGbERlbzJjTnlrT2NS?=
 =?utf-8?B?RWhPRTFzYVowVjFmdk5rWmR4Y252VWdyVENGc1Q3WXV6QW52YUlObmU1Njdi?=
 =?utf-8?B?eXl6bUZFcmprK0R3RS82Nzh6N1NPLzZQdWV0bndnamxOM0pITDNrRzBFbXVZ?=
 =?utf-8?B?LzNyV1dNblhJS0VaYkt0d0NPUHo5WjZBcXNTTFVXZGZnR3dLSVFUZWxWVW1V?=
 =?utf-8?B?d0ZKWXJuNEdNVHZEM0E1NjFsNUk4UWdDYnRJNjMyOTNIK3VGTHJnVGhTNjRh?=
 =?utf-8?B?ZUtJZTZia0MyYyt1dFVjYmlsWFd3bmdRRlFCbmJoQUQ1ZzgxWjEwWkFOak5F?=
 =?utf-8?B?NVlNbnhGT09oYmphdXlPRVNRUTFZYmdBTk5RRm1ieDRYOUF0dmgzOVZOaURE?=
 =?utf-8?B?QjJTNWh0OE5yREhOL281TU5YM2RmU3hKY0NJYWc1S1IwM3Y1Y3d0ZjdHekRL?=
 =?utf-8?B?N3BvN1J3Um5PVHFPd1VzVDZQa0xzbEIxWjZ3U0dYR1haNTB5VE13OXFrSHNI?=
 =?utf-8?B?RWVSVFRUQURpMzVYNVVYQ2ROazZzcWoyWUh0MExtMDl5TTExR3lvVDRXT2N6?=
 =?utf-8?B?TkJFOFhpYi9xTms2aGRaY1RWdWtSVXhsU1ZETlFTTDhTRzEvb2RxaFoxaG5R?=
 =?utf-8?B?Zk81Y2JVZXpaUHZ2Yi9SanJhMGwrN1FLSzFYNzlMaVRyNVBWaGhMVitmcDhP?=
 =?utf-8?B?L1A2MjJveUErZ09WK0dnSS9EVnVEcTlEbk4vc1ZyRjl3N0V0aGtuV2lwcVV6?=
 =?utf-8?B?Q3JrZ2FWN0IvYis1WFlNMGdUc2ZiN1o0dkRPcjYvWTE0Tmt6WC9JZUo4NCtU?=
 =?utf-8?B?c3lDQ2JiaTJDdDBEc0wrL0NjdmlrRVlOcFE5RW9ONGlPdEk3WnRHMUJ2SFJT?=
 =?utf-8?B?dTF0TkJVSldHcFlSZllieE5sa1FObDZMdGZaVHBIamgwY1ZQeVorNDcvLzVX?=
 =?utf-8?Q?JBRyk10lZp4hOSO2ToHHR9BPEtQ2g5Jd6gzkN?=
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	BdcO9IRNvWtDvrnabOxpPaSqLx7Mx1lg267x0eoVXpZb40T4rph8joPntGanT1a6ax7GKpKg/bgj2tE82JlS6nZvUXaLT2ccLGO/5kvuuFw1fwGQkPDI+2grEx0jyfMmzgT2Mbz8yF/ksdOb035NdQy6jmpY3XrZ24ud27yuVRUzXNLZzP9SZTz17um2bnNQzDRYZIqiEWdch+P+vHQ8owTZs2RfEVCBonjPww66VDvHTuvXL+fl73W9anfhh9UBDuQjn0nVONIyUJwt9PP1VfgoY3jU4Uw2+wgUY38YpDv95eZVDkhfwyF85OpT1XoY0L7uFRVuj67imf6HetRYMQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gqU6s35gHdCQhmJdmB6ulU/FRJXQPdcrgmdjA3fdqmRi0a4skPsjMcMZv4CPdNjwkmIUZ1k+y6qi0oLWlOg10RvVg2fKt3zmXSPs8gV9GRBFaQ/yHUkqORPKhZIEg2SyYIWuW00T0h+7ykvTyzoyDSVT7sBti9qR8SU4hI8HsaPHfhPGKwxnHY4N7TTln+Kz6KZw6ZfXKUhJ3l6/qN4CVet2egW79gc8CfmpSLyaOHjPgOwJkLnYP0QFGeJ+ICGxc0pykNh0eQa8CKyFoVJr++gV6ls7QDyZs0MPYlNlq6zMHtMCLjRdRgwOkaQWFTaki1faKCReSwylCxE6JVS29WVDbZRBQz0IclLjCiwLzq0anzjbHUBNBj1vcWr8GuIMR77gmQHSZs16GjH9ATkSIQtOSPPzuZmLCIRkoHLFoy1mJ7pl23okJHvFtv9qETS53aCzDrskla++ov8WNqFjKuS0Ocfei8EfWYcReVuJMcrGiG3BdO67+diHBxClMLn0a9dPHc6SIVqD6p486dYjUcPKykGqpRss7LOJbEvDGdOr1af7rYzy/gCdLtUX6GoOz5X113RH8r+uTRSDxDtGAtRxDcoNqykvX5VR+B1C8UpBhyBVR9eJkTYDiRw8snUw
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfac643-7de1-4751-d7ac-08debd9a8633
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 15:54:10.6726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: //8xm1UDeNr70yZv+15lBgnpFW+9rcS7RzFNOQfvR/RR5PzqK4w+QdiMM2Ja2d25mm/5t7HrHiR1XwAKw5oYuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR13MB5054
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Ppqq_RZ1DwwlydCrX1xA6WNE3fmqzzOc
X-Authority-Analysis: v=2.4 cv=BfboFLt2 c=1 sm=1 tr=0 ts=6a19b6a7 cx=c_pps
 a=bKR93RD0qenpecP8xHJc8w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=fIyWl1o40DOTyIs-:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=jHItnBwsj8f3cr25iGAb:22
 a=SXzkmgPmAAAA:8 a=y5Yq1ZyPAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=k2cuey-yFjFYvp3EGp4A:9 a=Frm_rXdTczlL4VRa:21 a=QEXdDO2ut3YA:10
 a=EWLf6cg6Bh5aS0AxDgDu:22 a=PoVUXeey_BepnEeCpHdp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE1OSBTYWx0ZWRfXz8xWJgfrJnUD
 jVrFEfPVSn8qPPQrbafrbZ2anEJPCAouW5Oo9HXx5sOX4o6UkbuFcw/i+3G6CK8VWU5Dbkp8sUh
 p/kotCHfvypdaPWrBhbCshW11WI+bpP7SwuoIHBWtI7gUfJjKdbSYszcWf9nJGVnWf3r5tUOK+N
 ntSU/hH/RoCmsMjB8jX4sAS3UCveGsZD6Er0xwebteQvyZ+lm/i6zH/+w4q+/ubXm+tPQ9VKEHJ
 D3+t0vYdvQwfzEoYZECvydmlboH19Ob1DS7GsoH/MD2upBVU4ZzTcQFOV/fPJdCfxdN4CJ2fURF
 NYuo56r4hC1kyWjY3pgPEOhcwZ/ivFba1LOU+N8YNBMRLbIwnBu2B15+AF26NOpAV1S7Ffep4Qc
 F9Vq+y6sdH4MPp3kSFfjW1iFIPJlb1RbrLv/WngtzrKfRpZfSh/G8oU6Z8U+rns3X+gGMMtuq4X
 6iPysxl93oK8sp+dfVg==
X-Proofpoint-GUID: Ppqq_RZ1DwwlydCrX1xA6WNE3fmqzzOc
X-Sony-Outbound-GUID: Ppqq_RZ1DwwlydCrX1xA6WNE3fmqzzOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01

Hey Rob,

I just tried the mkroot quickstart instructions in toybox/mkroot/README, an=
d the image failed
to start, due to missing init program.

Maybe I missed something.  What is the appropriate mailing list to use for =
mkroot
discussion?  It is on the toybox list or somewhere else?

I'm thinking a mkroot environment might make a good baseline test system fo=
r short
boot-times (kind of an extreme case to establish a minimum boot time value,
at least for the kernel).

Below was the output.

I checked the root filesystem in toybox/root/i686/fs/bin and there's no 'in=
it' or 'sh' link or program
present.  Does toybox use the same configuration in mkroot as the base toyb=
ox build?
I modified the configuration for toybox to include the 'sh' toy, rebuilt it=
, and verified that the
x86_64 toybox had a working 'sh' toy.

Then I rebuilt the mkroot environment with:
$ mkroot/mkroot.sh CROSS=3Di686 LINUX=3Dlinux
and ran it with:
$ root/i686/run-qemu.sh

I got the same error (missing 'init') on running qemu.
bin/init and bin/sh are still not in root/i686/fs.

Also, the build rebuilt the entire kernel, even though I had just built it =
a few minutes earlier.
Not sure what's going on there.

I note that the mkroot.sh script has 'make clean defconfig toybox install_a=
irlock ...'
which I'm not sure includes 'sh'.  Note that root/build/airlock has 'sh', b=
ut
root/i686/fs/bin does not have 'sh'.

Anyways, thanks for any tips you can provide to help me get this working...
 -- Tim

--------- output from run-qemu.sh
Linux version 7.1.0-rc5 (tbird@timdesk) (i686-linux-musl-gcc (GCC) 11.2.0, =
GNU 6
x86/CPU: Model not found in latest microcode list
BIOS-provided physical RAM map:
BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff]  System RAM
BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff]  device reserved
BIOS-e820: [gap 0x00000000000a0000-0x00000000000effff]
BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff]  device reserved
BIOS-e820: [mem 0x0000000000100000-0x000000000ffdffff]  System RAM
BIOS-e820: [mem 0x000000000ffe0000-0x000000000fffffff]  device reserved
BIOS-e820: [gap 0x0000000010000000-0x00000000fffbffff]
BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff]  device reserved
Notice: NX (Execute Disable) protection missing in CPU!
DMI: SMBIOS 3.0.0 present.
DMI: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.1=
6.3-4
DMI: Memory slots populated: 1/1
tsc: Fast TSC calibration using PIT
tsc: Detected 2095.043 MHz processor
last_pfn =3D 0xffe0 max_arch_pfn =3D 0x100000
MTRR map: 4 entries (3 fixed + 1 variable; max 19), built from 8 variable M=
TRRs
x86/PAT: PAT not supported by the CPU.
x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- UC =20
RAMDISK: [mem 0x0ff6b000-0x0ffdffff]
255MB LOWMEM available.
  mapped low ram: 0 - 0ffe0000
  low ram: 0 - 0ffe0000
[gap 0x10000000-0xfffbffff] available for PCI devices
clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_=
idles
Zone ranges:
  DMA      [mem 0x0000000000001000-0x0000000000ffffff]
  Normal   [mem 0x0000000001000000-0x000000000ffdffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000001000-0x000000000009efff]
  node   0: [mem 0x0000000000100000-0x000000000ffdffff]
Initmem setup node 0 [mem 0x0000000000001000-0x000000000ffdffff]
On node 0, zone DMA: 1 pages in unavailable ranges
On node 0, zone DMA: 97 pages in unavailable ranges
On node 0, zone Normal: 32 pages in unavailable ranges
Kernel command line: HOST=3Di686 console=3DttyS0=20
Unknown kernel command line parameters "HOST=3Di686", will be passed to use=
r spac.
printk: log buffer data + meta data: 131072 + 409600 =3D 540672 bytes
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes, linear)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
Built 1 zonelists, mobility grouping on.  Total pages: 65406
mem auto-init: stack:off, heap alloc:off, heap free:off
Checking if this processor honours the WP bit even in supervisor mode...Ok.
SLUB: HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1
NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
Console: colour VGA+ 80x25
printk: legacy console [ttyS0] enabled
clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x1e32e5fed37,=
 maxs
Calibrating delay loop (skipped), value calculated using timer frequency.. =
4190)
Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
CPU: Intel Pentium III (Katmai) (family: 0x6, model: 0x7, stepping: 0x3)
mitigations: Enabled attack vectors: SMT mitigations: off
Speculative Store Bypass: Vulnerable
Spectre V2 : Vulnerable
ITS: Vulnerable
MDS: Vulnerable
Spectre V1 : Vulnerable: __user pointer sanitization and usercopy barriers =
onlys
L1TF: Kernel not compiled for PAE. No mitigation for L1TF
x86/fpu: x87 FPU will use FXSAVE
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
VFS: Finished mounting rootfs on nullfs
Performance Events: PMU not available due to virtualization, using software=
 eve.
signal: max sigframe size: 1440
Memory: 250396K/261624K available (4793K kernel code, 608K rwdata, 968K rod=
ata,)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:=
 764s
posixtimers hash table entries: 512 (order: 0, 2048 bytes, linear)
futex hash table entries: 256 (4096 bytes on 1 NUMA nodes, total 4 KiB, lin=
ear).
NET: Registered PF_NETLINK/PF_ROUTE protocol family
clocksource: pit: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 160=
1818s
PCI: PCI BIOS revision 2.10 entry at 0xfd1d9, last bus=3D0
PCI: Using configuration type 1 for base access
SCSI subsystem initialized
PCI: Probing PCI hardware
PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
pci_bus 0000:00: root bus resource [mem 0x00000000-0xffffffff]
pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
pci 0000:00:00.0: [8086:1237] type 00 class 0x060000 conventional PCI endpo=
int
pci 0000:00:01.0: [8086:7000] type 00 class 0x060100 conventional PCI endpo=
int
pci 0000:00:01.1: [8086:7010] type 00 class 0x010180 conventional PCI endpo=
int
pci 0000:00:01.1: BAR 4 [io  0xc040-0xc04f]
pci 0000:00:01.1: BAR 0 [io  0x01f0-0x01f7]: legacy IDE quirk
pci 0000:00:01.1: BAR 1 [io  0x03f6]: legacy IDE quirk
pci 0000:00:01.1: BAR 2 [io  0x0170-0x0177]: legacy IDE quirk
pci 0000:00:01.1: BAR 3 [io  0x0376]: legacy IDE quirk
pci 0000:00:01.3: [8086:7113] type 00 class 0x068000 conventional PCI endpo=
int
pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PIIX4 ACPI
pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PIIX4 SMB
pci 0000:00:02.0: [1234:1111] type 00 class 0x030000 conventional PCI endpo=
int
pci 0000:00:02.0: BAR 0 [mem 0xfd000000-0xfdffffff pref]
pci 0000:00:02.0: BAR 2 [mem 0xfebb0000-0xfebb0fff]
pci 0000:00:02.0: ROM [mem 0xfeba0000-0xfebaffff pref]
pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000df=
fff]
pci 0000:00:03.0: [8086:100e] type 00 class 0x020000 conventional PCI endpo=
int
pci 0000:00:03.0: BAR 0 [mem 0xfeb80000-0xfeb9ffff]
pci 0000:00:03.0: BAR 1 [io  0xc000-0xc03f]
pci 0000:00:03.0: ROM [mem 0xfeb00000-0xfeb7ffff pref]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
pci 0000:00:01.0: PIIX/ICH IRQ router [8086:7000]
e820: register RAM buffer resource [mem 0x0009fc00-0x0009ffff]
e820: register RAM buffer resource [mem 0x0ffe0000-0x0fffffff]
pci 0000:00:02.0: vgaarb: setting as boot VGA device
pci 0000:00:02.0: vgaarb: bridge control possible
pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem,owns=3Dio+mem,=
locks=3Dnoe
vgaarb: loaded
clocksource: Switched to clocksource tsc-early
NET: Registered PF_INET protocol family
IP idents hash table entries: 4096 (order: 3, 32768 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 1024 (order: 0, 4096 bytes, li=
near)
Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
TCP established hash table entries: 2048 (order: 1, 8192 bytes, linear)
TCP bind hash table entries: 2048 (order: 2, 16384 bytes, linear)
TCP: Hash tables configured (established 2048 bind 2048)
UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
pci_bus 0000:00: resource 5 [mem 0x00000000-0xffffffff]
pci 0000:00:01.0: PIIX3: Enabling Passive Release
pci 0000:00:00.0: Limiting direct PCI/PCI transfers
pci 0000:00:01.0: Activating ISA DMA hang workarounds
PCI: CLS 0 bytes, default 32
platform rtc_cmos: registered fallback platform RTC device
workingset: timestamp_bits=3D30 (anon: 26) max_order=3D16 bucket_order=3D0 =
(anon: 0)
squashfs: version 4.0 (2009/01/31) Phillip Lougher
Unpacking initramfs...
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial8250: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) is a 16550A
loop: module loaded
scsi host0: ata_piix
scsi host1: ata_piix
ata1: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0xc040 irq 14 lpm-pol 0
ata2: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0xc048 irq 15 lpm-pol 0
e1000: Intel(R) PRO/1000 Network Driver
e1000: Copyright (c) 1999-2006 Intel Corporation.
e1000 0000:00:03.0: found PCI INT A -> IRQ 11
Freeing initrd memory: 468K
ata2: found unknown device (class 0)
ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
scsi 1:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM     2.5+ PQ: 0 ANSI: 5
e1000 0000:00:03.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Connection
NET: Registered PF_INET6 protocol family
Segment Routing with IPv6
In-situ OAM (IOAM) with IPv6
NET: Registered PF_PACKET protocol family
sched_clock: Marking stable (958101015, 36815557)->(1006698485, -11781913)
netconsole: network logging started
Freeing unused kernel image (initmem) memory: 412K
Write protecting kernel text and read-only data: 5764k
Run /init as init process
Failed to execute /init (error -2)
Run /sbin/init as init process
Run /etc/init as init process
Run /bin/init as init process
Run /bin/sh as init process
Kernel panic - not syncing: No working init found.  Try passing init=3D opt=
ion to.
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.1.0-rc5 #1 PREEMPTLAZY=20
Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996)=
, BI4
Call Trace:
 dump_stack_lvl+0x52/0x5c
 dump_stack+0x12/0x18
 vpanic+0x284/0x28c
 ? rest_init+0xa8/0xa8
 panic+0xe/0x10
 kernel_init+0x15b/0x1b8
 ret_from_fork+0x1c1/0x1fc
 ? rest_init+0xa8/0xa8
 ret_from_fork_asm+0x12/0x18
 entry_INT80_32+0xef/0xef
Kernel Offset: disabled
Rebooting in 1 seconds..

> -----Original Message-----
> From: Rob Landley <rob@landley.net>
> Sent: Tuesday, May 26, 2026 12:52 PM
> To: linux-embedded@vger.kernel.org
> Subject: Testing on lots of architecture targets with mkroot.
>=20
> I promised Tim I'd explain to him how I regression test on s390x and sh4 =
and mips and powerpc and so on in parallel, and he was in the
> audience for my wednesday talk at ELC, but I'm not sure that gave him eve=
rything he needed to do proper automated
>=20
> I promised Tim I'd explain to him how I regression test on s390x and sh4
> and mips and powerpc and so on in parallel, and he was in the audience
> for my wednesday talk at ELC, but I'm not sure that gave him everything
> he needed to do proper automated regression testing under qemu on lots
> of architectures in parallel.
>=20
> The source repo I used was: https://codeberg.org/landley/toybox
>=20
> Prebuilt binaries of all the outputs are at https://landley.net/bin/
> with several releases worth of history. (Although it'll probably go down
> at the end of the year to avoid Gavin Newsom's $7500/download fines.)
>=20
> There's a README in the toybox/mkroot directory, but also instructions
> at https://landley.net/toybox/faq.html#mkroot and
> https://landley.net/talks/mkroot-2023.txt (which was the previous time I
> gave a mkroot talk).
>=20
> You'll need cross compilers: my musl+gcc cross (and native) compilers
> are built with Rich Felker's
> https://github.com/richfelker/musl-cross-make using a wrapper script in
> scripts/mcm-buildall.sh in the toybox source. The binary tarballs are in
> https://landley.net/bin/toolchains but you'll probably want to build
> them from source.
>=20
> If you run that mcm-buildall.sh script in a fresh musl-cross-make
> checkout directory with no arguments it builds toolchains for all the
> targets I've managed to get working so far.
>=20
> If you want to rebuild just one, you can feed it any of the strings from
> https://codeberg.org/landley/toybox/src/branch/master/scripts/mcm-buildal=
l.sh#L18
> as an argument, ala:
>=20
> $ ~/toybox/mcm-buildall.sh m68k::
>=20
> Note that these toolchains are statically linked with a host compiler to
> be portable, so the script will first build a musl host compiler (see
> line 38 in the buildall script) because glibc is incompetent at static
> linking.
>=20
> In theory this means you can just grab a tarball and extract it
> somewhere and add it to your $PATH and it should just work. There's also
> a https://landley.net/bin/toolchains/25-03-2024/musl-cross-make.tar.xz
> with everything (all the source and all the targets it built) to shut
> Bradley Stallman up.
>=20
> The test harness script is mkroot/testroot.sh again in the toybox
> source. Run it from the top level (toybox source) directory and it'll
> iterate through all the images under root/ and try to run them under
> qemu (you need qemu-system-* and mksquashfs in your $PATH, it'll
> complain if either is missing). It provides a squashfs filesystem with
> controls scripts and test data, so instead of booting to a shell prompt
> the qemu instance runs a test script and then exits on its own. It
> prints out various "=3D=3D=3D thingy" lines for successful tests, and the
> pass/fail thing at the end says whether it got enough =3D=3D=3D lines of
> output. If not, look at root/build/log/*-test.txt to see what output it
> DID get.
>=20
> I did the start of a busybox-based version at
> https://codeberg.org/landley/toybox/src/branch/master/mkroot/packages/bus=
ybox
> a while back but unfortunately building busybox defconfig is INSANE
> these days. You'll notice rather extensive patching with sed to remove
> build dependencies toybox doesn't have, and even then it was mad about
> something (I forget what).
>=20
> That said, you can also just do:
>=20
> mkroot/mkroot.sh NOAIRLOCK=3D1 LINUX=3D~/linux CROSS=3Dallnonstop mybusyb=
ox
>=20
> To skip the airlock step and run your own much simpler busybox build
> script (just stick it in mkroot/packages), and as long as your script
> sets NOTOYBOX=3D1 before it exits you should get the directory layout, the
> init script, the kernel build and packaging, and the run-qemu.sh for the
> target, with whatever additional files YOU installed (under $ROOT/). So
> a busybox based filesystem instead of toybox shouldn't be a big lift,
> just wasn't a priority for me.
>=20
> But since you're not testing _toybox_, and toybox isn't 1.0 yet, that
> would probably give you an environment much closer to what you want. :)
>=20
> Note that mkroot.sh is almost entirely self-contained, merging it into
> toybox and having LINUX=3D be specified on the command line was just so I
> didn't have to download any packages in the default build. (There's
> download plumbing in scripts/plumbing, I think I went over that in the
> talk. The "dropbear" package is another one to read to see how that
> stuff works.)
>=20
> Rob

