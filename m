Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7066F7482
	for <linux-embedded@vger.kernel.org>; Sat, 24 May 2025 00:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748045831; cv=fail; b=TFhXGDn86b1PNnlTf2/jOqz0rvTnKRrIJzmQwX6ZX/yhmwXRbfx6ZyCW1qjJLFj7evQi9QSdZFwRmSPONox5Py6ksEX2AhXJwQ6KsHGBUyXSp1fpjEKqsJKUrpyczbpjWqyU4EyYYOp49DSw55jpuC/pdX2zgOwu7JN9/+zdUJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748045831; c=relaxed/simple;
	bh=9Hkd0QcS8kJbnPmjmYreMw2a/tXZn+ohUY0esr/2DPg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BFM86TXxga0jx9Bl9rgCQS7TkkKNn20upr+gVIfmeVYbE3rvZJUwNXohi9CqlJ0rYnegOdKTRB6ARSCWbMz3t/o36mtfZinl3/PSRHKXBPMiZRyx1qjle1kcO95mEJqnooUPRv4Ze1OoSJBUCBqB4/JlKcg4WDltCg2zb8tJjJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=fMLX7dN1; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="fMLX7dN1"
Received: from pps.filterd (m0209319.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NNt1el011198;
	Sat, 24 May 2025 00:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=9Hkd0Qc
	S8kJbnPmjmYreMw2a/tXZn+ohUY0esr/2DPg=; b=fMLX7dN1/+BVDKJ4yAd1AZt
	W5EyiEJPmu1mXdLRTD/gDBE7hqs5ZcYJfm6o5wfuFMvy3Ba0AQwa5K03QfVhf+yq
	wAT0XNJFsS/bYBK2F8UD7RE6kOTU0By4cMIlCYHYDhTjsD7msSY43auXjd/aFODn
	B1i5GqrFJor+SwQnS2g3DakpoBZXFeJaMb9qRRNUWk9w1afiaA9hg6cq+sFwjCIn
	OzHH7LIMC9X3/unJVgqjF3Tq4wd55pBwadlX0zWPVLsJJGZhQAVxv4gcc+2Eylv6
	UIo40z+cNMnH7D1cqU9vpJVX5MxoqZaAXNpe38DyD+shL6xjwR/4aQGgC6ap3EQ=
	=
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2085.outbound.protection.outlook.com [40.107.102.85])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 46rwh6b4b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 May 2025 00:17:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytyNmUJTZJsuY/YmgAsnZEc220ljfIv4JjXu1FmdF2YVDNn6s+jXForEzQ49SeVWfo4KmH4cG0vpg2/wzCuQNhjBTkggAGTHhRgCB8PgwB/9cyshwHVSgZRwy5TmxWCqk9Tezq/4p55kHhFDxGbYR4WaQAyvGsXXy1HU8KYsb31j7qhxfwMNa5k+hiU5Y3uRdpjP+jvdczu4QTb1P4KwJpKU6XvcdDqiRRI9X8ClcgPz2L+omrYRb2lwinaHKmQiqTycfzNnhUY44C/rS9ABurp1LuzNjD0v7Cqj5+k+f8mUBL01h0RKIuS3IAKfDrdpmuEHM+k/zN8Zmfw03kgTxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Hkd0QcS8kJbnPmjmYreMw2a/tXZn+ohUY0esr/2DPg=;
 b=t+fzPQFj1xdX2XQz05ln1a+MGMBnfopHxNwfH5Ob+OFMEn/7XbhsfEdG5rnajkRi+BDp3USqw1qRIBRruK+KVrMfsBh+gvdSNCNltVoVgWKiPKIc7chV6vTZx9pHCBoCSeibMuACzzIwGngXfo/aWDHUrcGcMM8Wymdm5kwRxVw7QqpD8s7+GU9dEHyRakwIJadAPhdwqr1E+PYBjTQ6MXqFdw+C4cAaCoTiJFF+TXSKGqQXaMhkTvTOamDU1NMLET64wc/zauNnvusMdOnQRuMwBfk6Dhj2KuluYKm7w8iLfQScT78MXKSX1nqW0Nm5LXIhBL/cZDHgfADNF7SM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by MW4PR13MB6012.namprd13.prod.outlook.com (2603:10b6:303:132::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Sat, 24 May
 2025 00:16:58 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%5]) with mapi id 15.20.8769.019; Sat, 24 May 2025
 00:16:58 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Federico Giovanardi <federico@giovanardi.dev>,
        Linux Embedded
	<linux-embedded@vger.kernel.org>
Subject: RE: Deferred probe times
Thread-Topic: Deferred probe times
Thread-Index: AQHby7jteeCT71fHYkORXa6rPp/6gbPg6CsA
Date: Sat, 24 May 2025 00:16:58 +0000
Message-ID:
 <MW5PR13MB56324F6600F6844DB8A6FCD5FD9BA@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <cd10fd7ee9a3b0ce61cf3c1ea3805fbd@giovanardi.dev>
In-Reply-To: <cd10fd7ee9a3b0ce61cf3c1ea3805fbd@giovanardi.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|MW4PR13MB6012:EE_
x-ms-office365-filtering-correlation-id: 0aefcbc9-9ee5-4638-5890-08dd9a584c89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UFJnV1J5U3VsMjMra0RDMjJ6cmxnRDUzWVhVem1ibjVJcTVmRnNjb1dkZ2lx?=
 =?utf-8?B?RzNHRnVKN204bThUY3cxQmtTaGpnYU1xN1Npdjd2RHAzKzhobHpBSWVXaVp5?=
 =?utf-8?B?TVBwRUZyMUcxUlc0VEJmRU52NTFjblAzcGZ5eFRKeW1adC9uLzVXTGFEV1Vi?=
 =?utf-8?B?U29aL0ZOZkp3U3hycmdzLzFrM29MNHpyOVBxOEJWT3ExbnYra2h0VFRaRzJx?=
 =?utf-8?B?QXJPalVEWXhwczI2VUhTbFdETTFXVm9ydWIzbnhCTzRLRkRVYWl0NndWUTJX?=
 =?utf-8?B?TC92K01CNFpiNTB3MHNYWFpYVGpzSWdrbE0wdTBVY054ZW1EUURRUzA5Z2VY?=
 =?utf-8?B?ejk3NkdYMlgyZzRFMFBKK0JTZWkxUVpSc3NMYzIwcDFRcGN2Nkk2Znk5dmxG?=
 =?utf-8?B?Sk9BODIxcXZmVjdka3Y1K29nSW5qakxqaGI2VVErd09reW80VEFsZXNmK3RS?=
 =?utf-8?B?MjYybkhsZXBtMkpucWduM25DTzU1QW9hZjdqV3BKNmtuYVZaODJpZkQ3b2ph?=
 =?utf-8?B?ZUoxQTNuM01IcStLalFTeFZtbWRiTWd5cGUyUEVJV1l2OWhVR0FMMVdQVlAz?=
 =?utf-8?B?ZEZhY2VNbXNIb2UyQ1p1c1JkaW9ESHdFSzBGOFFJUU1pWVEyeWFkeFVNV3pw?=
 =?utf-8?B?d3JhOUwvcGlZdGNZR1lkcmdSbkd4MHlENjhDNmpXWFZ6MlhJTUxhL2JOUHJm?=
 =?utf-8?B?cjR5NzJhd2dialRFa1BHS1FrWTl4NEpJT0ZNcVF5dEk3V05ZSmdJemxIZ05V?=
 =?utf-8?B?Ynp4QUw5aXF0M25aa21aS2IzUzJtYU41YldHS2hoT0hwY3E0alV4Rm9IK3Ja?=
 =?utf-8?B?amNMWVM2c0w1UXRqbzRpMDA3enpmS2ZlV2hYb2xQTll3Tks3OGFFbHpmMFlm?=
 =?utf-8?B?aEJNaXFmTFA3ai93WnE4NGxERlVsVlRScHFidnhsQWQxTkg1RWp0WC9BZ0tS?=
 =?utf-8?B?NVU3c3BVYWN4RGVaR2ZQZml3a0hwWC9aa3JYS3g3anZKZmpwRFExRUdKU1BZ?=
 =?utf-8?B?Z3FEaXl4bXdDSjRaK1Z3bEhROXNnK3F2ekZoVGY0Y3RadStJSTZIT25WYWxX?=
 =?utf-8?B?dTVHQkp6MG9FbWdjR29WZFU3L3NNRURaZU5lOHBYS3EwTXAvU0hZbW12SFNp?=
 =?utf-8?B?TnZWbjUrWlE0YSt5cWlYZVJyS0c3bzRPMzNNOThrVzVyQnQzSUZIS0plZFdW?=
 =?utf-8?B?aHpDMTBhckNVM2YrUWp3Y2ZjUExmZ1dGTWVMSEdtUlRldFFGUkZlWERsUVNW?=
 =?utf-8?B?MlVhQ1hpNEhKOWFZZ0lTLzRTdDVmeEpwSUhqWTdmdzYwVm05K1NBM25RS2FS?=
 =?utf-8?B?UzRLVmhRL0NMMFR3b0FjS1lSbFVQcW4vZ3hFK0x1cW5sdkZnU0hjRWxmVFJO?=
 =?utf-8?B?YVdVbWQyaFhVVGZPS0ViN2c0ZFVOeXErNHQ3ejFVaHhnem9MRUlLc05EaWNy?=
 =?utf-8?B?ZjNScXVYQlJiRHRNTmxYU1RCbnE5RDQxUUJRNXF5S2FSZWNWZWxHellZTTRJ?=
 =?utf-8?B?dlFlLzZTQUhhdzg5NEh0ZTlPMEZjamZ6bW5PQThndFhyOUlyWnhxUnVBNmFT?=
 =?utf-8?B?RzdVZlQwMlIwNzJ5NzYxZ1FFZFo2RzRiWFUvdU1KZDlKOFphM0ZOQWVmN3BC?=
 =?utf-8?B?S2YrdGVvUVRQYlg3TzJNbDJGMWZ5S0x3YitTa3JWTFFScWVsdW1ialJpVit0?=
 =?utf-8?B?N0VtbWZCZHJISGh6bGR1emdveHE5S2w5S3FORE9BdjYvY3RPWERMS2gxZXYw?=
 =?utf-8?B?czFUQzZyK2o2U0xNZWtwb1Q1Qk9EREVCRld2b3RxRjdWVS9QSDdneXJBYWxk?=
 =?utf-8?B?am9EenJCWld2U1VJcXZhUmpuVHV4VXFpaEdDNnMzZEhDK3J4NzJkcnRZdWRj?=
 =?utf-8?B?Q1RHTWdFWmxicDFKb0hqdTBRaGhMZVFiRVdleFBzY0dEN205eTdpcUFYMlBh?=
 =?utf-8?Q?2WMe9petw04=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0l0eWw4UEQwUXFSSXMxWHJ2VWtlWFZVVzdKaEc3Tjl0akJrNGhUQ1ZoN3JG?=
 =?utf-8?B?VkdDcTRWdm9WVitGQ2tCVVRGOFBxOTY2UEIxZWp0R3U5NFA4UUZvWEpPdEhV?=
 =?utf-8?B?NHV0U0QyVDhybDZHUGJmMExPVmdrTDVEb3J0WkZqS2dWdGkzL0k3R0tjZ2VZ?=
 =?utf-8?B?UVQ2Z2Z6ZlVZYmZlczFzWWJ5VVE4TlJ1NXBmV0g5Q243UlRidlArYTdCWXQ4?=
 =?utf-8?B?cWVKVnZscFZkcHh6ZlVXOUpqMjNQamFSeHVqWVhIQmtsZlN2ZVUzcTNwWXdn?=
 =?utf-8?B?a3NqditRY1l6Njg3eTdFRUxwcExkYnVyV3k2aXpZa3lqL2xDZXVNN3NNNVh5?=
 =?utf-8?B?dTRaaCtUb3RSQUo0MTMyU2RNVzlzdEl6d3pTU2E0QktHRlFmOUdOWmtwUHVD?=
 =?utf-8?B?REpOZnRlbVJvTUxlTVFzUjRvR0R6RTk0c0hxQW0yWFVxd2lhdlIvZlk4MHhq?=
 =?utf-8?B?bGl0ZXVWZStEUzZueERuZ2NkMm9Wd0Q1SEN0SHFVdDhvVFN6bmhOZFZPM3U4?=
 =?utf-8?B?dkVtdDVEb3llL2NUTjBJZStLRTNaeUJXbitKZ1BVUHdzV2thMlBhb3RMM2lw?=
 =?utf-8?B?WjBYYlNrYS9kV0ppbGorL05QWDRGM0F1T0dWdlhYSnJXTXRrbitWdmY2bDVa?=
 =?utf-8?B?UGpoeCtvRmkwaElOaGZxaUJ5cVZCcDN6ZzYrMXYrSDlrUkgrRklITWlVUEdl?=
 =?utf-8?B?OGI5cmc0YVJHUnBXZkFpVmxTV3NEVXlIYnpnQ21vQzVzb2VtQi93Q3cwVkRj?=
 =?utf-8?B?MFE3aHF5K2M2WWVzMmRBNHBGSS9vK3ZTYWxPZ0IxUEhRNm00L24ycU1PbVYr?=
 =?utf-8?B?dHFuenorcStUaWNCcE5DMGIra1lncm9Helh3V3RRa0oyd3BweXpVZXMrT2c1?=
 =?utf-8?B?K1g2S2sweWxlbWZZSml0Q3B0SjJ3NHRCKzEvQnh2N29QeFUxN21NcnFKZmRE?=
 =?utf-8?B?dUcxZFFqcEk0ekpVZ1FOYUZCSzVPVHUvZjE5OHNza1ZPTEdPRGROa2x5NFNh?=
 =?utf-8?B?SHlZT3NFMUpNY0Z2cWsveW95MSt0S1lJZ0FKaHV3ZGJxd0txVm1YM2VmVTFE?=
 =?utf-8?B?U1k3eUxudkdkZGxQd2xVL1FUTVlCVXMrL2c0VU95bWNqbk12WW8wZTNDTDUy?=
 =?utf-8?B?bUJGb0NBQ1JOUE5kRVUyRzFPZjBsODVMa01DUFowekdHTmlFaE93eDI5UUFr?=
 =?utf-8?B?Q1RrR3d4eFBJbUQ4eWx1MzVtUmJVZTJXSGlHWUhjdTVUL1ZWRThaNjhVaHVX?=
 =?utf-8?B?ZjgyL1lZbjNES2tQbXVHcjJUUU1SQ1ZwZTMrT1dmMlFJb0ZGVUw3QjArb1Fi?=
 =?utf-8?B?eWF2TFlwY29JNmhXTWRFdWhLaW4yMldMUTIwUlEwbW1aN1p2YVdML210c243?=
 =?utf-8?B?L0d6OGNqNzlhd2pYeU81eFpBQzk2em5OOVkyT2ZHdkJ2b1JoODk3aElWUGgr?=
 =?utf-8?B?cnhGSzd1MEdVVWlicGhTYXVVV25FSEtJenlGdVlIaGREVE44LzBnTHUxSDJ1?=
 =?utf-8?B?YmRNaDVVelFZN2tlYStVaE9wQmZtRFJYcWlXbXFUQWE1VU9rd0hKTmtCYXZH?=
 =?utf-8?B?d2JPam8yRm4xb0E4N3ZlQXNBL2pmTmhXN0xtNlFzcWM0V0svMmlqWTVYTHhq?=
 =?utf-8?B?UjdseG14TTVhZVNEUytTTHZGcU8zS2lETklmMERLZ25pVUEramR1V25yZmUv?=
 =?utf-8?B?RTJmOGJXVzRnUmNhVXkyVTZGM2wrU3I4OU9mZUp6VkVRazZzU0RZcVFwMlAz?=
 =?utf-8?B?RWVKTi9KZWUrKzh5M2ZnYWcyZDNIaUJmMEJhU0ZaRSt3VjBTRUNPOVhIcmpJ?=
 =?utf-8?B?WUFoWmdJVFpYNjVjbDg3Q24veGF0TEYxb2tmRjMvWTJZOHFnVjZvY2cvZmZ0?=
 =?utf-8?B?eWE0RFlPU1FBNE9aZmZYbmlhNndVRC9JcHFkRStRN3RDNzI4eUlHYUdRWmVt?=
 =?utf-8?B?VUg3emlVeHBpRGRhSWRFTExlaEl2dzEvRFRSK0xHUXBRT1I0WjlVbjRkVXZO?=
 =?utf-8?B?M29MNHN6SnVpWjdFeHp4VUduN0pHd2hkSjh6T1ZlOUpPcmV2d2piWFQyeDFM?=
 =?utf-8?B?dkVNVFpDOHhkTVFiUW00bjhQQUdWSk12U00zRjVTOEdiTU1sZVhhczBBNS9M?=
 =?utf-8?Q?BqVs=3D?=
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
	Fo+NKVsaNEiASRoXaSg6pt/Gqzl67JxWFWk7b6iFR50GYf5ydpoQd7NB6vdYtzOQaNQbduxq7V4SxzOgpoYGfWRULpIUBdvnseS9CmBNlBAeRsnTwvX2BCmCyKiKaQ54KV8FeAEQHHDXEyHVEIqFExwWgZsG/QhAfDZZPn6SGPEOjsirAVrQiVaSq+Yj1586cJ4yPTNxfhXFfqDDocmnqHd/GQgvGYygKRNB16TAb3p4NJOClkdfenrWL/yamyvc9Gz9xMMVEzqSFbzOclAPTN1gcnRgUhl5VcpWAB8F5N6XAOFBghwpzVnbMXzKcfsDIXRNDYZ11ngMf25LGQZP9JNmZSVbuj4l4hmxZpSn3ILG5ReAB8XehqMSaHYrx/fXZn/yQISVuY7yAnh49HvxGisjLgSfEtrlnonM1iehS28NFSbITFL9ZNYwR+djcnQyySvAN5h62sxIWhbKmz3TAWTya6XCJOQZoaW+dno9UyGvKw7m+MeaVATXRfParZZQXYbU99l9GDeO2nP1iarPXhWOrEmUdp4KE1U6HTcEkK6DXyxTRNjZ4WvthU/RWqBxB/eJ+S6/eg32uDtPOC2Z/O6PJjyF1Gy1Rb56cix88qtwcZpt/8hzzoXRsidpweaO
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aefcbc9-9ee5-4638-5890-08dd9a584c89
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2025 00:16:58.8303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1XRlHzVscF0v0dFNwy2RQW1+ECCgZGGSRSMzzvsPqAGh4b61Pv3L7zsdB2Ub5aK5DodRSz7bqU1CH2SlKcC2nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR13MB6012
X-Proofpoint-GUID: SDtomWc2nTVKa83IerWgT1eZ_Z9g6cQh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDAwMSBTYWx0ZWRfX027/EHHeqQK+ gvzNLGzPHm7cUBP9Kj9QXOE5ZEdvFxBqF8tVg8G/QZe8qiUFzsC/pOZIg4vzZ5skmyV9Z6Wo1bg TuQIz34Y7ozQ5p9S+dt5ZYazBVbQYYQt6G28xqoDW9xoDXXfzchgWZX1RJ+G1knslVGScVTf8Yl
 okSfJX9V6T5Ri7AZN5xJY9Uvx+cWO8/nV0vzHPf5pACsg4vOQgdLxaKAf+Cw7JjmqXKMt8O1JKm b6fav2yYKDl5XM6K2yem/yQ8RURJHU9OdjlGk7WbnX4hq1FQuyntFXa2BibWvPRRLH8JmXJSphP cCuylBpSU6x/gjmYvqt39MjtyGBTSqtz1K1wAHoI+oTCZHsuxMdyICOOa+Oh0p1GExLcYJK5Qwy
 GdBxV3yMHgTdB5tgp94VLoboE3IQkMkpNgx/fkA8Z8Vobl7SiuQ+lwMr9Jid+Yvxkhnod9sU
X-Authority-Analysis: v=2.4 cv=YYi95xRf c=1 sm=1 tr=0 ts=68311001 cx=c_pps a=gjexaPiiPsmG4a9cpA+O2w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=xR56lInIT_wA:10 a=IA0wh2spAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8 a=UOUHd_K5qt3OhNXPEigA:9 a=QEXdDO2ut3YA:10 a=bmtLghkC0BEA:10
X-Proofpoint-ORIG-GUID: SDtomWc2nTVKa83IerWgT1eZ_Z9g6cQh
X-Sony-Outbound-GUID: SDtomWc2nTVKa83IerWgT1eZ_Z9g6cQh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_07,2025-05-22_01,2025-03-28_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGZWRlcmljbyBHaW92YW5hcmRp
IDxmZWRlcmljb0BnaW92YW5hcmRpLmRldj4NCj4gSGVsbG8sDQo+IA0KPiBJIHdhcyBwb2tpbmcg
YXJvdW5kIHRoZSBib290IGRhdGEgZGF0YWJhc2Ugd2hpbGUgSSBub3RpY2VkIHRoYXQgdGhlDQo+
IGRlZmVycmVkX3Byb2JlIGluaXRpY2FsbHMgYXJlIGNvbnNpZGVyZWQgYXMgYSBnaWFudCBibG9j
azsNCg0KSG1tLiAgSSBkaWRuJ3QgdGhpbmsgYW55b25lIHdhcyBsb29raW5nIGF0IHRoaXMgZGF0
YSBiZXNpZGVzIG15c2VsZi4NClRoZSBzaXRlIGlzIHJlYWxseSBzdGlsbCB1bmRlciBjb25zdHJ1
Y3Rpb24sIHNvIEkgYXBvbG9naXplIGZvciBtaXNzaW5nDQphbmQgbWlzLWZvcm1hdHRlZCBkYXRh
LiAgQnV0IHRoYW5rcyBmb3IgbG9va2luZyBhdA0KdGhlIGRhdGEgYW5kIGZpbmRpbmcgc29tZXRo
aW5nIHRoYXQgbmVlZHMgYXR0ZW50aW9uIHVwc3RyZWFtISENCg0KPiANCj4gVGhlcmUgaXMgYSBw
YXRjaCB0aGF0IGxvb2tzIG5ldmVyIHdlbnQgdXBzdHJlYW0gdG8gbWVhc3VyZSB0aGVtOg0KPiBo
dHRwczovL2xrbWwuaXUuZWR1LzE3MDcuMy8wMjM0OS5odG1sDQoNCldvdywgdGhhdCdzIGludGVy
ZXN0aW5nLiAgSGVyZSdzIHRoZSBsb3JlIGxpbmsgZm9yIHRoaXMgdGhyZWFkOg0KaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDE3MDcyNTIzMzE1OS44OTU0My0xLXRvZGRwb3lub3JAZ29v
Z2xlLmNvbS8jdA0KDQpJdCBkb2Vzbid0IGxvb2sgbGlrZSB0aGVyZSB3ZXJlIChhZnRlciBkaXNj
dXNzaW9uKSBvYmplY3Rpb25zIHRvIGFjY2VwdGluZyB1cHN0cmVhbS4NCkkgd29uZGVyIHdoYXQg
aGFwcGVuZWQuDQoNCi4uLg0KSXQgbG9va3MgbGlrZSBpdCB3YXMgc3VwZXJjZWRlZCBieSB0aGlz
IHBhdGNoOg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE4MDYyMDAyMzkwMy4yNDI3
NTgtMS10b2RkcG95bm9yQGdtYWlsLmNvbS8NCndoaWNoIG1heSBwcm92aWRlIHNvbWUgb2YgdGhl
IGRhdGEgbmVjZXNzYXJ5Lg0KDQpUaGUgdGhpbmcgbWlzc2luZyB0aGVyZSBhcmUgc29tZSAoSU1I
TykgYmV0dGVyIG5hbWUgbG9va3VwcyBmb3IgdGhlIHByb2JlIGZ1bmN0aW9uLg0KSSB3cm90ZSBh
IHBhdGNoIGZvciB0aGF0LCBidXQgZGlkbid0IHBlcnNpc3QgaW4gdHJ5aW5nIHRvIHVwc3RyZWFt
IGl0LiAgTWF5YmUgSSBzaG91bGQNCmR1c3QgdGhhdCBvZmYgYW5kIHNlbmQgaXQgYWdhaW4uDQoN
Cj4gDQo+IEFuZCBhbm90aGVyIG9uZSBmcm9tIG1lIHRvIHByaW50IHRoZSByZXN1bHQgaW4gdGhl
IC5zdmcuDQo+IA0KPiANCj4gSGF2ZSBhIG5pY2UgZGF5DQo+IEZlZGVyaWNvDQoNCg==
