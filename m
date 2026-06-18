Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE877345CD3
	for <linux-embedded@vger.kernel.org>; Thu, 18 Jun 2026 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781808025; cv=fail; b=Kb1nBSKf3HlwZyvTKFeFG41HkbrXVpvN1PLuPdutk12ca+d/haOT98yHWH661U1tJDavxWPDbYEyzO/Nkv3sy1ggl7+0iVA6bsl9boNrKs2/e/XJy6ommU4nBU9Row4vPSLR7UJhDvQVYUlZpz6Fmjx2qB7XxRgerqO0CmK+mIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781808025; c=relaxed/simple;
	bh=Z6+8jZdKgi8Ffserpf8+8wceZjI3pzbgPZqQUG8y8Vk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LAn/1/ggQRLJC8NRQjXe+7GXUOj4JQHTRc6u9bUkQiSRVGNh8Imq5IPJtjw/BDSfsIMF61y+psG1taq1Pwx8Mz50VMfajxf+kK3y7IK0zhaRf14vK39BaUD+P770OC0cwc11HcMaspsOxgqxDNVSSEmVLQuBb2oCAh3um7vFGAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=fFlVmeA8; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="fFlVmeA8"
Received: from pps.filterd (m0209321.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65II0GsV1624594;
	Thu, 18 Jun 2026 18:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=Z6+8jZd
	Kgi8Ffserpf8+8wceZjI3pzbgPZqQUG8y8Vk=; b=fFlVmeA88BytPeUFV5ZLTOu
	RV2ryqW8kxlqEezlaN9dl7I6ci86A7VI8Ef6vOQTiqVFyq6jY5DCTbadeXADYXgp
	R2teWHQlkKrlIqbq2bzGDG0EdE+9lp6uVXSLFGr/cqVrHs9UGsEFzur/uDgQLWup
	yYhVZHEHrziMn15jzV7GNPdOu3v/iTKw0scsdKnFeW6+2p3cfud1MCtkPRDrF2Vs
	KBQdtQmNV5rWFNcJGQBWwpdVRyI+T4dWwuNXDAMJeaeiVqqSkmtYUx/4ix9dM7PL
	szew9fuN1zHwG1HJduqqPqO0jUiZCCpPo8O9uQAF+EQfjCKB69Dnq4EHl+v4p/Q=
	=
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013011.outbound.protection.outlook.com [40.93.201.11])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4eueebtjwa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 18 Jun 2026 18:40:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttm3OCPBTyoV1kMBZ96BemaNTBXxGGIs/poNbQg6RxxgqpuYXYPDSXL4niuyVRHSh0vgPnh9Y1gFMN50HSlsUpKmMuLhvLAnptJ+HYWIKGiEcC96MVzRqgse1QuwvWIjrEThIxa+/4QcNrLBxOSVwE8z69PHxvLe3wqWXaRLlkCOw1k3HhPIlIKFBcl/+2gMvbYPMRMbcOeafBaF85uVN4t2eWLEWoY1cC6WbFf6+jHkzSZ/ZYGnG6vFrZ7nSok4pIEX6TCQXRnd7HdWxo/3eBD0lZwaPm/ZoUZe6Ruj6DRw8MqM1R4O+a13kliUamffCwc1c/ki1g1GOgd4kk5OQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6+8jZdKgi8Ffserpf8+8wceZjI3pzbgPZqQUG8y8Vk=;
 b=eK+EXRfdxfWJb8ejRpczDWtGXGO1GN2k/+OrYJkLlSISI/22pvR9oZqdaGbse9LrDaAMgAPN0m+WRHP/3KLGkZzGmdIqzYCP378VeF4LKE3t6DN+VHaLBsPT6Y7eoCA/FqNU9IE8ZWvXCoRAq397pWCS6oTzG6v5wjGSqNi3IOc7YorNnqm699lLwzldGc//K3mydi0U11xRlYAPgP52cwuh0pASW2+ij83vK/0AMq3ndwE34KlZzRLhriJ+Id4jlSCq7uuB4PeWRoBZIMI7Xjyg2DPXXvqsr6/ZSQmuzSTzBjMwiW5JH+CrSZHTH+dj93br8ptPyZLjEs/mnYsDog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SA1PR13MB6568.namprd13.prod.outlook.com (2603:10b6:806:3e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 18 Jun
 2026 18:40:15 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%3]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 18:40:14 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Rob Landley <rob@landley.net>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>
Subject: grab-boot-data.sh fails on mkroot (zombies abound)
Thread-Topic: grab-boot-data.sh fails on mkroot (zombies abound)
Thread-Index: AQHc/1HmcgxURBYvS06afRVyPqILig==
Date: Thu, 18 Jun 2026 18:40:13 +0000
Message-ID:
 <MW5PR13MB5632865579893156ABF6BC75FDE32@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <f35774f8-4194-4715-8321-dc2fdfc7fc88@landley.net>
 <MW5PR13MB5632F0D9C8E8A12F2C24B64AFD012@MW5PR13MB5632.namprd13.prod.outlook.com>
 <81e4aefd-f052-4a52-94b5-36030b26c358@landley.net>
 <MW5PR13MB5632FDD1833ABA105437D02AFD162@MW5PR13MB5632.namprd13.prod.outlook.com>
 <9e3f48db-c827-4892-8e41-656e9c60ff89@landley.net>
 <MW5PR13MB563232D40A099D798E698272FD152@MW5PR13MB5632.namprd13.prod.outlook.com>
 <064b8c64-ebd7-4210-ac28-8be27773c8bf@landley.net>
In-Reply-To: <064b8c64-ebd7-4210-ac28-8be27773c8bf@landley.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SA1PR13MB6568:EE_
x-ms-office365-filtering-correlation-id: 560aa824-42c3-45bd-a4a4-08decd690914
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|10070799003|23010399003|366016|3023799007|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 OguA6JmIoI7E0Yyu9AhUKNPe0ru/tle1dmqVVHOb32IFr8oETkE8ksihsgEwsSUJbNOXhJ4stCFuJO9CgmeWvWzJ0nE74kcX1lHQEtug8KM7Drpanme0HYvjDqwgYMv3/8jT9DpcR6L6/bUWsrnu1WdE3ipjVlsb5SOGF6wha7+lNSJ0OM84MUB+EWkSaNyHLFiLKAjLdZGdwgfKdQQp+L4RSiVVOVysB1PTzwZ8/1Q1b0QoY4SlXsTJFcHC12+Qe79zAtSKxdGbxXplyX7IeCseBa5n1yzwJC0mJdcNQIp5wm0RXRs2y70v+ssF8LzeXUenGTCCv+wAsCbeo/39OsuYJEWYR9lS9IXhT73cF6KA/SpyhTThJ4uBWRiDe3cy0w1A3UUrc70uDSKOLQsK8KEcJmkaO9xF4mPldJ2RQ3Naa86RoU3chCoPtSQpBr878rt3V4+/b7LRh/XqD+u4Xl5gPcyqoKrI5lxolx2yo9z2ygU5MvG4fvMnpFxvD3rB+o8WbNG2QdBGowL0y11EwOAgfT2KWuG0D5I4QyLkXlPSZZXpqt1Mfe3eJeXDSDavDmPYn94y8RrdK4wo3oyIUgwc6Ot97NBN2awHIKG6SWEIMTHA5ScXTRxZElE3y5F8nA7wLIbEobjyNytY9vdR6esl1S3HAeOSRPJnfniiQgJP20HrVKDfDJFpeYZ2sPHauQJDH3XIO6e8owOn9oL5GtAP797OByxxkXIBvMZPFOk3WQrR1CdzR1Yas7RkXklp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(23010399003)(366016)(3023799007)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WXNPWDBSdTlaa2Q0NHErSHFEM3d6OWdQRWNJSGd1QjJNa2V4TkxOZVFnNHFw?=
 =?utf-8?B?QjlFS1JSNWZhNmVDdDUwV2NKV0hVeFBxZnV2ZysrMXJYbHRmVmRQTnR4M0hL?=
 =?utf-8?B?TndGWlE4d1RsNDlINk0yelpIT3hrUFhaNHNsRU9nOUZOQTlKNDBlNG00Smxq?=
 =?utf-8?B?OEsxbzY4d09rNkoxRVZ6TlBEUGtsUGFrQnYwUi8yWllmMW5MeFozakVMODVP?=
 =?utf-8?B?di93RWRNL0tKTnIwZ29ERU9HQnQvUFBxNWgvZXl1Y29SdmQzb0FYTDlHL2F5?=
 =?utf-8?B?UHB6a0NOcUdtZDArdDREdjhncnIzeVQrajRkZXRSbmlHNVJNcHRmaklRUHlR?=
 =?utf-8?B?R0JsUkJlQis5OGVndUJOUUxpci80ZDF1blVQQUc2ejNVOWdwdjhialplakJp?=
 =?utf-8?B?Y2YrVDA2Sk5rYnc5SUtGTGFKdmtPallUeVdYcnNwSW81ZUZURUpGOGdhNCsy?=
 =?utf-8?B?R2pwZXlTQUN6Z2E3cFBUL0FlTVBqQkNXY3pJNDJJZlVDWEo0aUdjWVIybkc0?=
 =?utf-8?B?ZDY3SHpEOFhyaE1oTUcrcXl1VWsrdXBmRVMwUWNiaitXTnAwbFhDL3ljbkRY?=
 =?utf-8?B?VWlCVmlwemQ1dmVlYVp3bUN0bGtldmFHeG5iVy94dHYwQjNiajd6bElaMlo1?=
 =?utf-8?B?VVlZVW41OXBjRDVpWEljQVY4OEQzUXRMOGJ5V2FWQ1FaK1JTQXpzU0JIYWJC?=
 =?utf-8?B?Ym9mNU1qVjRRMSt5L0VrK2hvZGdEeVNUNGRQN3FJc3FQZVlZZ2VqL2F1TjBW?=
 =?utf-8?B?VjhNRXdFSk54bWFFclJaTTFwM2RyRGUrUzlyZTdkT1o2TmdrbzB2ZzlpTHo0?=
 =?utf-8?B?Qm5JRHJHRzgrclY4RDRWM0gwOXh5SWtNam96S3ZMR3NGeWlSLzFPeEpKMUNP?=
 =?utf-8?B?aFFLYkhGVmpOcHdDcmVSL0RueVFyREh4bzRYM2Rwc1RXNXRZc1dnWW1ZRUFP?=
 =?utf-8?B?bE96K1JDNG0wZlBRMkFoK0pxWXA5WkoyNDd3bWVOTFBseElKNlhZRVNrM0pO?=
 =?utf-8?B?UHdpOU5uMXBxUHlmUldMNithWGlsZnJNWDdvWThHV0NlSkppVys5L1VYdStr?=
 =?utf-8?B?NTNDc3N1bUZUMEF1Yzg5T3NiZkt6S0lPNU80ZlBEc2J5TnNJSGxQUUU1OHVl?=
 =?utf-8?B?U204NWxMZzd5Z2g4eGxYUzBDRnhDRXByaklZTFBaQU8rOEQ3VzQ5Y0hBTGJn?=
 =?utf-8?B?K1pPMVZHSmNJbU5JVGswcWcwdU8wSlVXcFlCVG0xZytXK0xiUDVMbS9MNjZZ?=
 =?utf-8?B?Y05qMFVrb3FiQUxvMkU2OEx0TXNMOU8vRzFKWU95cXFJTWtDWDNqbmlYZmpo?=
 =?utf-8?B?MnpWN3JmbGR1ZzVSb1JlSitCU0FZdSszY1VXMkVra0piS3R0WmZFUHhPOElt?=
 =?utf-8?B?S0lUdU9vcElYNUYzdGxZWHNKY2VhVzhPb0dvN0FrajN2bUIxeFliVHZXQm5x?=
 =?utf-8?B?Q3dWZFNSVSsvR2VMNDlRa0VTSzhjdjNybHNIeUFVekQ4ZmNnak9HeCtsUUpx?=
 =?utf-8?B?V3g2NzNaOUw3K2hqM1p1QnFJQzVPNzNmNnBtNkhNTFhYSnh1ZHZkbGVMc3FU?=
 =?utf-8?B?UEplUHZFN24yVWIwVTVkTFprMExzSnlsUFlwUFV2WEx3WEwxLzZMZCtqbzhQ?=
 =?utf-8?B?aWlHNVRuQlM4b1JUbmJDRStEWTdnYWp3SnFTUk5kWTdndnZGWEZmUWtyTENZ?=
 =?utf-8?B?RFFiRFNQeVFhSkVBbDdoNTNhUW1vbTVIRVBlQmhSMjhnZnk5TzBmQ1p3dXBB?=
 =?utf-8?B?dXZPTkpWdFpFdk5BaXBTZWI4SEduUURaNG12aUpZRm1sV0h2cWJEU1daL0RU?=
 =?utf-8?B?eFc2Q3hHSHM1dExEbjRTRHZKZWl5ak14MWVIQ3V4T3FHd3dpUlJwNXZvcnB1?=
 =?utf-8?B?NDZ3ZEZkU0J0TmtqSHpRTmtUdFgyNVhiQVhlVXlyZEYxRHd3MXFaMWE3anVW?=
 =?utf-8?B?dG92U3N2d1VITzgrTFJ4ZVcyMWdKQmtDQ21GbGUyZFFmM2x5UDVTN2J1UFJW?=
 =?utf-8?B?Wms0WDJzS1NzT2J4YjFxTEdYN3pDVExaMDZneHZuVzZiUmdkVVVncWZJeTFB?=
 =?utf-8?B?NkV0YllsZTBTdzNJWHZKclh2Q3p1M0hzVGZaSlU3VTJEWTN6OCtrRmszQ2RT?=
 =?utf-8?B?OHVRWjVDUHhUUVlQZkVvSjZtRURDTjIvRzNpQW01M3hYWTdrOXZieTNPc3lL?=
 =?utf-8?B?WmRaMTFKWldud1B0ZVl5YlFEVnBtVHE1c25ubWFNY2hKRVRCMGVKWktVU2c3?=
 =?utf-8?B?c2VlMkYwZy9hUnhNM0ZkZlpEc250Y2tuZmRWSlJVOUdZdlZXbWNjN0xKUG53?=
 =?utf-8?B?amZrdUdJMFczWktLYkp3aU40bEpUV1FQOW0xRWc0L3hGaDVLcFNUYmxKYWdG?=
 =?utf-8?Q?JfehZZYSAK2qHMm2DYOJZtj0rtCpQQLqVKKQY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	BG0jHyPK3e3USN92oSCZKT8B7V/uV4PjMLhJAE/LITCBuWls87awQAi381lq7HwYiHBFu1RACciIstlS2oVgHHjXAsNis2s1h85rOkRmN+2lDq13dvQfozczp0MrgYV5tNojW7pnivDO6jZRL/YHclV/GLy7gM0maJS2jutbV0i+C3TDNR5JdUsmXfgohVdr1Ebol0ek6P/xvsrCK+Xq4wsVZXnQ6vOMj858BJZT4yWmGiOYPkOD3i6CYqd6nJexWwWVqsAaVu+alB2vkOdeMQ1iElxwhl/zLjHc7ew1AWoj6Yej0NQanvEyQ/10ib1nqziGKuFkXvBFO6o2xTZAXg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZzdXIYYVlcr4llcG9b3d5I6MhyL37P6zgpf1LjYQ2oyHaAGtZI/alzT6W9Fz1z/dKFuhiiwvi8e/pud0un21PB2CA1WOaf//eiRmk38L0mfATuetcx2jqoc6h3uYS6BgSf6hqjcJNTRQy4ipQllyHL2bL+7PF9sFLLci3WNwRVnfiyjMAuIZX9GKdL+wrC8/+IRyPvBZRp/o90XVL0F85bF8iOQoOCNzzJpxj2yUPgO57ItVz9A5P8ZaT/fTJOVYmd+JkGahWIHP0PQDbCvx3D0LnK8erdRqHCVN4Qok0OBADm3wUOZQKVERVBxtCNvgKFLzs4TXQGogph5fK8xx8wuhI4ipGZMXj94CsFqUAHzIn911dnbdN4WWcvqLEwR3yWoHTCHJ+uF1b2qT5KpxEN0fkhnV7EhqX6ZpFR4kSYsc0xo4eWEn9JBQQm4DrHPtUHd0P5w/6nA0ZFUW6cLi1tYPux0w9pXKHqeIQmI7fPX9JkByD7pWCs/edNffD/uUMBfepF/XlR/+YTstS35Zb0dBi5YYnJoS9VdmTeq1W0/QSq7QutCOKEQfh6SYsh9UE1F1Odgym4Aykfyd2mKH/laNMCthGwoXZ0zwZphDn+KSj+YlAUz+54FMAAXsIRx+
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 560aa824-42c3-45bd-a4a4-08decd690914
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2026 18:40:13.9355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u1amEpp5Y4CDpcuX6kxhmbEE45+f5F2hebSFdAD7Qb5T7gLW5lefOsHk1pVZ9xP/gT8+fYyvVTGk5n6kI6AAvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR13MB6568
X-Authority-Analysis: v=2.4 cv=Oq1/DS/t c=1 sm=1 tr=0 ts=6a343b92 cx=c_pps
 a=NzAOMTrFL2nmaFUJOsdohw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=M2bq-ooH9SiLYa4vvubY:22 a=9EyUPMKwfLapjTb-gKAA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: iAs2UNKwlFpmOzS0s6d5bErG3woPzwql
X-Proofpoint-GUID: iAs2UNKwlFpmOzS0s6d5bErG3woPzwql
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE3MyBTYWx0ZWRfX2YLjcZCQasri
 92AboMACd9uhPb2JyENh3OSuRaR4rzSSSh+9vu9hV743ERIbOtGO8M/bIYUlewjLZCEHLjHFv4R
 5F12iqLQtoDbiZ9ev96eh700Jd0TAZOMm/vCNMptVUCE3QliqdyQrDKe3E0uOT4qArVBM3jHMym
 xPoQKtTrvf23B418YwsjvZYMUDNH9zVDhxKpFCNzgx2CQ8JUB9hA3Vf23k42wW4Jc65npmqcXdp
 XBMScmLBsj8jlpMYq7w4qqOVuyTn/u5aV8Ux6Wx1R8Xjt88VXybwkDvDMOoXHRr+YU+7gaC5pqm
 cgMltm3ghGw3zv3FD9WAeWuK4uc3ofXW0B8nOZP9pCrvDADT15NcQhFCAsnUnDYCPsSR6AD3iF3
 2wV8AwzjgtYdBcgmoYY/D6+WoAo0cqMdQiOXD3aPT3IeArwJyFB+QKA38UWEa7ecXMXpbQYv5qa
 qMdjTRj5EyNOuWnTDCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE3MyBTYWx0ZWRfX/+2c9jCm5k0m
 RQVk3X7DnjipdjQVwyzHPEmYLfqZyjBN+gyB37v0Fq3DOSbWU1hKvvAouRgioiKXQ/zBjBUrhjK
 sFpFITIoDRgMGown9o7Mka5uGNBF/gG1loM/0/fZG/H40S5BBqot
X-Sony-Outbound-GUID: iAs2UNKwlFpmOzS0s6d5bErG3woPzwql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_03,2026-06-18_03,2025-10-01_01

SGV5IFJvYiwNCg0KSSB0cmllZCBncmFiLWJvb3QtZGF0YS5zaCBvbiBta3Jvb3QsIHVzaW5nICd0
b3lib3ggc2gnIGFzIGludGVycHJldGVyLg0KSSBnb3Qgc29tZSB3ZWlyZCBiZWhhdmlvciB0aGF0
IEknZCBsaWtlIHRvIHJlcG9ydC4gIChJIHdhcyBwbGFubmluZyBvbiBleHBlcmltZW50aW5nDQpt
b3JlIHRvIHNlZSBpZiBJIGNvdWxkIGRldGVybWluZSB0aGUgaXNzdWUsIGJ1dCBJJ20gZ29pbmcg
b24gdmFjYXRpb24gbmV4dCB3ZWVrLikNCk1heWJlIHlvdSBoYXZlIGFuIGlkZWEgb2ZmIHRoZSB0
b3Agb2YgeW91IGhlYWQgd2hhdCBtaWdodCBiZSB0aGUgcHJvYmxlbS4uLg0KDQpXaGVuIEkgdXNl
IGluaXQ9L2Jpbi9zaCwgYW5kIHRoZW4gdHJ5IHRvIHJ1biBncmFiLWJvb3QtZGF0YS5zaCwgaXQg
YWx3YXlzDQpnb2VzIHpvbWJpZSBhZnRlciBleGVjdXRpb24uDQoNCiQgZ3JhYi1ib290LWRhdGEu
c2ggLWgNClVzYWdlOiAuLi4NCi4uLg0KDQokIHBzIC1sDQpGIFMgICBVSUQgICBQSUQgIFBQSUQg
QyBQUkkgIE5JIEJJVCAgICBTWiBXQ0hBTiAgVFRZICAgICAgICAgIFRJTUUgQ01EICAgICAgICAg
IA0KMCBTICAgICAwICAgIDU2ICAgICAxIDAgIDE5ICAgMCAgMzIgICAyNDQgZG9fd2FpdCB0dHlT
MCAgIDAwOjAwOjAwIHNoDQoxIFogICAgIDAgICAgNTggICAgIDEgMCAgMTkgICAwICAgLSAgICAg
MCAwICAgICAgNDo2NCAgICAgMDA6MDA6MDAgZ3JhYi1ib290LWRhLg0KNSBSICAgICAwICAgIDY1
ICAgIDU2IDEgIDE5ICAgMCAgMzIgICAyNDYgMCAgICAgIHR0eVMwICAgIDAwOjAwOjAwIHNoDQoN
CkFsc28sIHRoZSBwcm9ncmFtIGRvZXMgbm90IGV4ZWN1dGUgZnVsbHksIGFuZCBwcm9kdWNlcyBu
byBvdXRwdXQNCndoZW4gcnVuIGluIG9wZXJhdGlvbmFsIG1vZGU6DQokIGdyYWItYm9vdC1kYXRh
LnNoIC1sIHRpbXNsYWIgLW0gbWtyb290LXFlbXUteDg2LTY0DQokDQoNCihhbmQgaXQgbGVhdmVz
IGFub3RoZXIgem9tYmllKQ0KDQpJIGFkZGVkICd2aScgdG8gdG95Ym94LCBhbmQgdHJpZWQgdG8g
ZWRpdCBncmFiLWJvb3QtZGF0YS5zaCB0byBhZGQNCnNvbWUgZWNob3MgdG8gc2VlIHdoZXJlIGl0
J3MgZXhpdGluZywgYnV0IHdoZW4gSSB0cnkgdG8gc2F2ZQ0KdGhlIGZpbGUsIHRoZSBxZW11IHNl
c3Npb24gaGFuZ3MuICAoSSB0aGluayB0aGlzIGlzIGEgc2VwYXJhdGUgcHJvYmxlbSwNCndpdGgg
dG95Ym94IHZpKS4NCg0KV2hlbiBydW5uaW5nIHRveWJveCBzaCBhcyB0aGUgJ2luaXQnIHByb2Nl
c3MsIGRvZXMgaXQgbmVlZCB0byANCmRvIGEgJ3dhaXQnIG9uIGl0J3MgY2hpbGRyZW4gYXQgc29t
ZSBwb2ludCwgaW4gb3JkZXIgdG8gcmVhcCB0aGVtPw0KDQpSZWdhcmRzLA0KIC0tIFRpbQ0KDQo=
