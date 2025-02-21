Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212C5B65C
	for <linux-embedded@vger.kernel.org>; Fri, 21 Feb 2025 00:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740098328; cv=fail; b=bo7Lr7Rm4OSjR+5B45k+gtthvR5AfpS6vdniGzh+ZUy13Jg2CMZzwhpM3PifFv2xjwSKqSRjig4jXnjsTKugUc4C1jhYQFUq2BuQ+qweZsHvadOvxGQEiM2X0YQCbUNc/C/r3mh5AXzrmsCDpv8zh0hc8V2ogv9sLlxxgwXel3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740098328; c=relaxed/simple;
	bh=cKPcK7X/EUsDMjnVbJmQGiB1zUzjQYSkzRTf+X93G8Y=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a8Ixl87JMiF+lIZ140umHCes+fIkGwQ7qdcoxVu71NNQqhgJuNUHMOjuHZRLHWkf5uG1bmRW8cM0eVO6slZeJzyGeYcj2J/jeWZ212BSg4p24DAPs15IltB8N7O0yPpiAOfgR3bzJOr4yXTEPY+BtTLTWPh3wX3NKamGT+1TTo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=D6PGwbLg; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="D6PGwbLg"
Received: from pps.filterd (m0209320.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KMJ3jl017535
	for <linux-embedded@vger.kernel.org>; Fri, 21 Feb 2025 00:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=cKPcK7X
	/EUsDMjnVbJmQGiB1zUzjQYSkzRTf+X93G8Y=; b=D6PGwbLgMXjZ/WUQ1r91T7i
	uYpKZlh2zmof1W0ms5UWwm1qMA7W1ipqLM9xrGCbZLFFt/8SMy1ZOXJ587x12N/4
	ZdFaqf9kaoiuF3ib+8q8OtuCEWJGIGhHsLLDrPYmbGfcVYqa5Y/jE4UYkCvRrMsY
	JbOXpxEvuqPvV/j4aC/EiOxHUMprvuWUSkyDaYpu1A8NPdKDr+RA/ppS9HMIQr/O
	3JGnrUYDjfNVSQ6P8QpR0jh66KpZz3+yxmxcp82f2siNlJC0U1/5KDzW47R9NcBn
	KmB+GAbvhrrPsklNrq/MXLH228S7+EDend5wJPRUY22SvQ2vVD53HlDahqzZZMA=
	=
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 44vyyfa802-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Fri, 21 Feb 2025 00:38:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmkySYGkSLSltfB9posaNL652g+sg6gda1jA1yJ/htra8VMdGDh4b45YeVRYFW+uPAilycuGZo/axnq6WtZEwZq/RUH7tL2Yke5hheY6hc8lWSlvlYUQkl1P2cAnOyLa/sKHvWHUXICHmrpm1pVxdkcmh11KZ3ivuiMCBV+KsU/3D02A6d33mgdoudetSE47rqa6HdsIv6gICF0fpsjPLwa/eK4xhl7g/p1TtQhmBbs/GKRhATGZZoz3f5PFU/I28hsvE98i1G6TmuFx/v9lORS41opHaocVOTvrGP6USLe2YNFf0Vfv66ojhsPJpCCXHnKVLOj8v+iwdEAmwuSv5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKPcK7X/EUsDMjnVbJmQGiB1zUzjQYSkzRTf+X93G8Y=;
 b=NsyfUFsvpnEx8aouMVWdfgFYXHrnGv8ToJ7r3fOU+unk4eE8Mc0C37lzQnefYzC8tm3XvWfmM53X+c/29MwUWxmaSFEy4gPvSQOtymuSb8RmCOVIPVSanXvViH8CKc1djtjWBt5F6kgXi0HczbyaydVQ4iacmwInwTtm4ai4ObWg6ORkSmbPQLpVlBIpIxf76p6e1x03q/qQCT23CjpiaFnuW1CEdKkiRowivZcWT2jcMvAS8fETeyPTNGHRxWwbXbUkABAjHwMzwJwuTd+HpbEMPRA+TX1HZ21g8OqNK+ShmOLjzp8hrvXAoRGKN97mnEEkPxxBiyqyTPR3cT4HPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by BY1PR13MB7017.namprd13.prod.outlook.com (2603:10b6:a03:5ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 00:38:39 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 00:38:39 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "Bird, Tim" <Tim.Bird@sony.com>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>
Subject: RE: [boot-time] Call for boot time data!!
Thread-Topic: [boot-time] Call for boot time data!!
Thread-Index: AduD9jqxViFaMwFRQFeCiePIOCb6aAAAm+Og
Date: Fri, 21 Feb 2025 00:38:39 +0000
Message-ID:
 <MW5PR13MB56321B6744D8AA7D9222454FFDC72@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <MW5PR13MB563253EE423EFC1A71F058CAFDC72@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To:
 <MW5PR13MB563253EE423EFC1A71F058CAFDC72@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|BY1PR13MB7017:EE_
x-ms-office365-filtering-correlation-id: 975a731a-fa60-4144-4d0c-08dd521015bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MnJhTFQwblNFZGdiUFJEempGbkFHN3QrVG1MK3lpRHdJS2xUdlJ5OGpJNGdQ?=
 =?utf-8?B?OEFkUmpFYWlIMGEzTUhRdmpTK3dTblJBcHZ0ZEgvQkdGWWdDbVljQ0NLQmx6?=
 =?utf-8?B?SHJlSEJxOTRPWWM3YndXVDdlWFgvWWlibVI2VE9hcUVCT29yVU5lMnhkUFkv?=
 =?utf-8?B?a0pQeE9IbDJORXRjT2NuWUFqcUFqUDl0OVY2RmRUR2dUQ2hwS3ByT0M4dE9q?=
 =?utf-8?B?SGc4WERDNkVCYnNwaVpRRjRPRmtoUEgvei9iZkJaQTU0Vm44MkFaak5qTS9v?=
 =?utf-8?B?M2o5Y01HWWRZQUdsbVRPYlRubVVPUkFJQjFEaXZidVQvbkFIbXEzYnRGb2JJ?=
 =?utf-8?B?WGltL3lOVmhLclpuOWhCY1Z0QlNRWHRBS2FWZUFhUGJXTldQR1RuWGFuMlZO?=
 =?utf-8?B?ekJxK1ZJd0VVQWhnNnNTTW4ybmRrQXAvcktBU2orcUJQYk1WYnhZWG0zQTBz?=
 =?utf-8?B?djlnSFBKTVd6QjExeFdUcyt3YUs1QnFVeHY4SFBTem1uZkNDZnZ4c0Q5ckhY?=
 =?utf-8?B?U0lUUW91WXBSVXpOU3dGc1ppTnlJdEdBUUVHaXpTVkxicGowN2JXTERhbmRZ?=
 =?utf-8?B?Yk9xVzZtYWJadnpNZjZJdkVyZW8xVkRrUEFjQWxXZkJ3NFhLT2RidU5CTG9O?=
 =?utf-8?B?bnI0YTNLT0lnNHZDWlczVnJOdExCcm5YZnZ0QXM1S3RBdlppZi9BRFJ0Si9q?=
 =?utf-8?B?MXhlRWRCTGVPbXJzSHNsb2RDNmQyTWxVVk5KRDVCWEkvVkt1MTZ5VjAyWmo4?=
 =?utf-8?B?K1VoclFKdC9iK0t1MzZsL1ltZ2ZCRk1iNldzV3V2c29uWmhodC84U3RRTm5y?=
 =?utf-8?B?N3k2emJpYlM1MUluS0NSVi9neVZEVW02SzMrR0hwemNrRlB4SXQzTzdkeEZi?=
 =?utf-8?B?bVpzWExQUExob25BdDNVbVZMZXRnQkU0VXhhM2k3a3czb2ZSYVA2ZVdHOTRm?=
 =?utf-8?B?Uyt1QXVodUVwVmkrOXNnOUwxUDIzZ2hmSlVSU0hoeUFxN21UT3pLVkhWNmhT?=
 =?utf-8?B?dzdrZ2JUaCtab3pDaFFlb3RId1N2ZjZUR3pkS0ZnK2NsRmlZSG1UTlFwcGt1?=
 =?utf-8?B?V1c1NUF2eXplV1VXOXBYbnl2WFgyelRuK25uSkRNbVd2TnhoTnZvckVtOHl2?=
 =?utf-8?B?OFh6aEs0cWh0bitiM1lRRmI1dlRLY1lEajh1dnlYL1hRQWk3VFlGTXhYR0dk?=
 =?utf-8?B?QnZVOWF2a0tHMXFnVThXMmNmRHpiSE8xNEVTN2tzY0twenNlcUlBaWxrWkg1?=
 =?utf-8?B?b2FIOFU3MExxTXRNVXZqNHFMbHVzbU5QU1pWNmlKTXo1UUg5S2VQLzhuU0xh?=
 =?utf-8?B?ZWNEc25kWlZXaUNweEVkcFZCVzhoblZsTWk0bmxaMnpURWk5RHRDRm1Ja29D?=
 =?utf-8?B?QXlMa0UvS0N0dU5RMVVibDJ6UXFQRUFjRE9uSENDbmEwRHFubjcxKzlQc01U?=
 =?utf-8?B?ZkJtMGh6N29abGlqMy9yRVBoZnNoR1lVWHRKcjR1bGNCN0RvN0xSVUo1WkZK?=
 =?utf-8?B?aVRmb2hTUVdQZjR5dFpJdzNKRUdLTk01UEsvZ0VIZUt3bVFMejZGeFZGdFkv?=
 =?utf-8?B?Qmg1c3V5R0VqREI3dFBER0p5UkI2QzNNSFJiTU4reHBFaVFVdjdpZnRyUU9T?=
 =?utf-8?B?WmNSekw5QllwbzdJUmdpbGdJcmlUNzJnZE5BYlVreTBnRVJQRXpDbVU1VlA5?=
 =?utf-8?B?QWJXYXFBdFZ6aTAxMXI0NjFIaitvVEJZQjBrcHFJSzR2cU15RnNOcGRIeU9a?=
 =?utf-8?B?WWVUTkh5WktsWnUxVkNxN3JsNlA2cjFPNTJxVWFFNUhOV2ZvSEtWbTVyZUFT?=
 =?utf-8?B?Mi9KcjZORmQ5U1BoYTlmMGY2TXdnSWcvUkVva0tWMlRNWSthY3dlRnc0aVcv?=
 =?utf-8?B?WVhCVlVDZEVQaHhDS0xrZ2pSZUdiaWs5ZnhCTWFyTnN3bWc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zy9YVVpKamUwaWNGK0Zjcnd2RHN4dE02SEM2cDMvM2RSUmhObnlNaU5mZHJ4?=
 =?utf-8?B?NzBJZDVsenJsVk9ma1Q5RE5mVGVjTVN6U0t2c1lsVUlUdXBVTTlBQXRnRTJK?=
 =?utf-8?B?azBQcFMyZU1nQjBSaDA4VDE2Q0JtRDhOVlY5bHd1dUd4OThBRlU2MTk0S1lp?=
 =?utf-8?B?enhQU0s5RGlaN1luaktzN1ptM0drSm54N1FTak0vamxJMEZqekx0bi93ZkVZ?=
 =?utf-8?B?d0xlSE1oaDY4UHB6UjJxbjJPekhqVG5qRmJ2ekJlMVo3REh2Z1hmUmdUUjVT?=
 =?utf-8?B?VTRXUWFyOFlMcUdGVThzTCt6UHhpVW5TMkFjZDdoaTRnSzgvTXRzYmpocmJi?=
 =?utf-8?B?c3gyWm1TQWhLYnRRTmZUOXBaVjAvVmRVOExmcndsM0JoWU9LNjNTT1lSQUdI?=
 =?utf-8?B?dzVoSHlITnkxeXpxMU8zOTdEQy9ETDJBZFZEa0k5TjA4WGJGRURTUWs2S3pj?=
 =?utf-8?B?VTBJNjBjK2w5Y2hOQkF5YnYzOXNTU0JhdGZVUzdWOXN2bHdHK0dDYmtYZFRF?=
 =?utf-8?B?bVMwL254M2pGVFFDSmRvMFRqVUdZRDllZXFHT3JLb2QyRG8yMURIUnRlZWtU?=
 =?utf-8?B?V0dVdlg3UWM4a2Z0RG1oUitscEJiZC8wb0p3WDlyd2Evb3ZwMFdSVHJqUmR5?=
 =?utf-8?B?dVJxdkZxTkovTStNcnlwV3QvS2UvdnZUMnBJYWVEeU1aekRoSW5qOFEwdE9E?=
 =?utf-8?B?UmRHVk85M3AzQWxtelRwbGFxTi95cXpsL0t6bC9pU2hoZjlsQ2ZCTDV2OE1q?=
 =?utf-8?B?VC9PRTU2VXk4UVdPUnZ0TFNrZzlTTFE3UjZpRmpRbHJrOE8vMjFvVktuNUZl?=
 =?utf-8?B?Wis0R2IydTBRWnRyTWpGWXZaSVUwNlR2eHp3L1cyWnI2Yll0WUhIRHJlYlBt?=
 =?utf-8?B?OC9ZSEVpTkkzaUZoWFJraGdJT0hQUGU0MjdoSm94ekNsWFlHaitLMDJDMk9I?=
 =?utf-8?B?Zmc0MVBtcDI0S0VXR1JlQ01tTUVwZjlsTzJvNG0yVjFOZ1o0WVIwV3ExNGVu?=
 =?utf-8?B?cEFLZUlMVDZpM3dBdVR0bTdDZmh1VWxORFJEMkFQeElkaFlkV2RYajVCaUZa?=
 =?utf-8?B?T3c5amh3djhKMkdQaktweGR5bHprbGRZOXBxZU1HVGZUM1I0YlM5VTByNW1t?=
 =?utf-8?B?emZjdzc3WVFzRWliOHFtYjJxOTJ3Vy9ocDN1NlNtVjY5R1I1M3U5eHVrVjJn?=
 =?utf-8?B?NHhrdytuZUQ4T0hQR2NvMFl6L3ErR2Uvb3NYNk9LeGVGc3VZTlYzUEhyRGtH?=
 =?utf-8?B?c3NKREViYmM5K1BmY3lhS3JBL0w1R3VxUjB0UlY1RmNCYzF4Z2pHV3B0SXZT?=
 =?utf-8?B?cTFnTVUweVBmU1RMTSs3cHBIYnZCOCtGQjM4OGlnSFdaaHh0RG9DRmlkb1FI?=
 =?utf-8?B?MFhqZ1EwT2xBUE5hanF5dHJWRS9MdUxtYm1hamxOeHZwalZrdjdFS3JSSm9G?=
 =?utf-8?B?V2RvbWpzSjcwcHZhVUtTVjI4ZVdDTERTdlJjQVllWmxxRm13ZEx6UWZReW5k?=
 =?utf-8?B?eGRaajRwa040ZlJRV3RQSDNnNEdLS1VYVGJtazVOdzF1TnhtcDdjamdFZXJk?=
 =?utf-8?B?NW5HSDA1Z0Jub0ZPdUZCNDh4dGR1Z3ZMK1dZTE5PUkE5RWpuVGFtWkVkYmF5?=
 =?utf-8?B?bCtoTUNDU1NoRTlhRkJaT05RVjFpNG01eDcvOTAyb0pZYmczL0dLeEN6aW5m?=
 =?utf-8?B?SVZYMU1WajdrV1NqZWlKcm43M2NFTXZNZEgvek44UGpRMEUyT0RNaG9aUWZp?=
 =?utf-8?B?bmFvYlN0MTM4MEtyblpZUlV3T2srSFJaRmtBN2hBY2M3L2lSZEdqdnVNSU15?=
 =?utf-8?B?M2hGS1pkczhYYk1jYU5RQTBHaENLWWJxQzJhcE1Yc2wzc2JLZGZ5TUQwYVJ3?=
 =?utf-8?B?d0VwMXNtbmtIR3pOdVpUOEd2SWJOTUlaanlFMlpoM0VxbGl6WTZ2T1N2eW5u?=
 =?utf-8?B?aFE3V2tnb3pYSWhBa0Erd29ZZktKa04xUEx4TFdOMXpZUnBUdUJoUEF4MlNO?=
 =?utf-8?B?TGVhZzBGTmp3dFRRQlRLVmptVjBDWUdjQUxjYUtKWUhMK2RxTzM5VUV3SmJO?=
 =?utf-8?B?OGdKUUsxRmtWZWdkSnNKVjVLZ0ZSNG9wT3kvdHgxRStLVlNNUGxtOXhqWGwz?=
 =?utf-8?Q?xwKeiZA3ZlI8gtxFV+0fLchW6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	164gNUW4sWkfhbZ/8x5MjvqRMrWbSeSm4XYN+JyFm4wFE6Pltas0Qo1/KcAbQU1xKtdZMF0AwEs6HVo3GNAjxgaKVRmf8iEFclk0fnsfo0QxOJ9tT6tqRyCPcYzcVb+RYJxksanNH9xDdBMi6Eq5ZD6CjkicKe2XvaF+6tr10b/GOpm9KC5oadXJf78oGOQ299+cr1W0ZLsIrx7eu/W9U+c//N6k8yS641c8Ysz7F2SnS1zb6xVIzdUgCqX9F++w6oOSH3NFL9HfCirHHUaMMzITfIG0OTNZn6oYWrLrrl0ns0qztTDoR1fJfl/Xzn/QjDHphEWhYvuwoddQaeAAu1MMt4HOedlXm+UwhyyCSLUupyg3FD+MgrTzQXpSsXenjK2ihYisEPPhzKkRF4Vl4uOuDvlv8VTyWZ1m3Tq1AqvDpCHptYqud9SJqHDzM8iAE+5myxrOgccFDCyYJPhDxG/v6RFYGp2lRZsOPvUczh0472YqDgt2/DZZYcfNRHlfuXolaWgB3Ym+k6j0uYRd8dvNSUyD4acviJjT0bek0FA2Io0RHmnMMPLIZU7A+vl1vj9Acm7KO+eoGOAoZxNJBHirNnHHR9H6PTQCQhIrvXIN+w4ILi5n0AqcH2roAe6x
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 975a731a-fa60-4144-4d0c-08dd521015bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 00:38:39.3975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p68o7+OpqJ0zuyLaKPGKXkZcYheJRSuI/6tku4Toz6xvIm+aMQcTLCbAOtC8qxqL/7Uiw3EhYsIGfD3e0IL/fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR13MB7017
X-Proofpoint-GUID: 4GpVQkm5LTbyWqSTUebVbe-7BjWwCY38
X-Proofpoint-ORIG-GUID: 4GpVQkm5LTbyWqSTUebVbe-7BjWwCY38
X-Sony-Outbound-GUID: 4GpVQkm5LTbyWqSTUebVbe-7BjWwCY38
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01

T29wcy4gIEkgcHJvYmFibHkgc2hvdWxkIGhhdmUgdG9sZCB5b3Ugd2hlcmUgeW91IGNhbiBnZXQg
dGhlIHRvb2wuDQpBIGxpbmsgdG8gaXQsIGFuZCBpbnN0cnVjdGlvbnMsIGFyZSBhdDogaHR0cHM6
Ly9iaXJkY2xvdWQub3JnL2Jvb3QtdGltZS9Cb290LXRpbWVfVG9vbHMNCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCaXJkLCBUaW0gPFRpbS5CaXJkQHNvbnkuY29tPg0K
PiBFbWJlZGRlZCBMaW51eCBkZXZlbG9wZXJzLA0KPiANCj4gSSBjb3VsZCByZWFsbHkgdXNlIG1v
cmUgYm9vdCBkYXRhIGZvciB0aGUgaW5pdGNhbGwgYW5kIGJvb3QgcmVnaW9uIGFuYWx5c2lzIEkg
YW0gZG9pbmcuIChJJ20gdHJ5aW5nIHRvIGJ1aWxkDQo+IGEgc3lzdGVtIG9mIHJlZmVyZW5jZSB2
YWx1ZSBmaWxlcyBmb3IgYW4gaW5pdGNhbGwgZHVyYXRpb24gcmVncmVzc2lvbiB0ZXN0IEknbSB3
cml0aW5nIGZvciB0aGUgTGludXgga2VybmVsKS4NCj4gDQo+IElmIHlvdSBoYXZlIGEgbWFjaGlu
ZSwgb3IgcGFydGljdWxhcmx5IGFueSBlbWJlZGRlZCBkZXYgYm9hcmRzIChsaWtlIGEgYmVhZ2xl
cGxheSwgYmVhZ2xlYm9uZSAoKiksIHJhc3BiZXJyeSBwaSwgZXRjLiksIGl0DQo+IHdvdWxkIGhl
bHAgbWUgb3V0IGEgbG90IG9mIHlvdSBjb3VsZCBydW4gdGhpcyB0b29sOiBncmFiLWJvb3QtZGF0
YS5zaA0KPiANCj4gT3B0aW1hbGx5LCBJIGNhbiBnZXQgdGhlIGJlc3QgaW5mb3JtYXRpb24gaWYg
eW91IHJ1biB0aGUgdG9vbCB3aXRoICdxdWlldCcgYW5kICdpbml0Y2FsbF9kZWJ1Zycgb3B0aW9u
cw0KPiBvbiB0aGUga2VybmVsIGNvbW1hbmQgbGluZSwgYnV0IGlmIHRoYXQncyB0b28gaGFyZCB0
byBjb25maWd1cmUsIHlvdSBjYW4ganVzdCBydW4gZ3JhYi1ib290LWRhdGEuc2ggd2l0aCB0aGUg
Jy1zJyBvcHRpb24uDQo+IFBsZWFzZSBydW4gdGhlIHNjcmlwdCBzb21ldGltZSBzaG9ydGx5IGFm
dGVyIGJvb3Qgb2YgeW91ciBtYWNoaW5lLg0KPiANCj4gRGF0YSBmb3IgYW55IG1hY2hpbmUsIHJ1
bm5pbmcgYW55IHJlY2VudCBrZXJuZWwgdmVyc2lvbiwgaXMgZmluZSAoYW55IGtlcm5lbHMgcHJl
IDQuMCBhcmUgbm90IHRoYXQgdXNlZnVsKS4NCj4gDQo+IFlvdSB3aWxsIG5lZWQgdG8gbWFrZSB1
cCBhIGxhYiBuYW1lIGFuZCBhIG1hY2hpbmUgbmFtZSBmb3IgdGhlIG1hY2hpbmUgb3IgYm9hcmQg
eW91IGFyZSByZXBvcnRpbmcgb24uDQo+IEkgdXNlICd0aW1zX2xhYicgYW5kICdicDEnIGZvciBh
IGJlYWdsZXBsYXkgaW4gbXkgcG9zc2Vzc2lvbi4NCj4gDQo+IFRoZSB0b29sIHdpbGwgc2VuZCBk
YXRhIHRvIGh0dHBzOi8vYmlyZGNsb3VkLm9yZy9ib290LXRpbWUvQm9vdF9EYXRhDQo+IA0KPiBJ
ZiB5b3UgY2FuIHNlbmQgZGF0YSBmb3IganVzdCBvbmUgbWFjaGluZSwgdGhhdCdzIGdyZWF0LiAg
SWYgZm9yIG11bHRpcGxlIG1hY2hpbmVzLCB0aGF0J3MgZXZlbiBiZXR0ZXIuDQo+IA0KPiBJJ2xs
IGJlIHJlcG9ydGluZyBvbiB0aGUgYm9vdC10aW1lIHJlZ3Jlc3Npb24gdGVzdCBhdCBFTEMgaW4g
SnVuZSwgYW5kIGFueSBkYXRhIEkgY2FuIGdhdGhlciBpbiB0aGUgbmV4dA0KPiBmZXcgd2Vla3Mg
d2lsbCByZWFsbHkgaGVscCBtZSB3aXRoIHByb2dyZXNzIHRvd2FyZHMgdGhlIHRlc3QgYW5kIG15
IHRhbGsuDQo+IA0KPiBUaGFua3MuDQo+ICAtLSBUaW0NCj4gDQo+IFAuUy4gSWYgeW91IHNlZSBh
bnkgcHJvYmxlbXMgcnVubmluZyBncmFiLWJvb3QtZGF0YS5zaCwgcGxlYXNlIHJlcG9ydCB0aGVt
IHRvIG1lLiAgVGhhbmtzLg0KDQo=
