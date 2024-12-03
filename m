Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103E4205E3B
	for <linux-embedded@vger.kernel.org>; Tue,  3 Dec 2024 21:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733261088; cv=fail; b=oG/bzB3il14/XbHhBq0pPYEsSMg9B5Jhjt2CAlpkfNX3QeDmCzvlfLV6eFc3WuBnMtw/b+us05UnmRhEioJj4uK3fE8fwFi1TmIr4aI+7gHwnZGzZil5WRBQV4gIWncfaC5v6tlLH4VFurqiZxeq533MOwROqBuuXenScVOnSgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733261088; c=relaxed/simple;
	bh=bSwKq2hkh8y4Z8aWOaT1BC00swV5GwTU3wgZClmP/ME=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LDjdpQH+vX3SAETOTmdbP7YN+5n8dNQ5Xt+7pW/EaWo71piYEVkp9ZthWtaH55c1sJ6inFaqyk6BGGt36MrsrmJhXQrb9UgZCyHWsAo352nb142HbYecuxXrG3314RndLHuL0+G7GgbLjHMUcT9hQkok4U1L3Qlyr5Y6m9QsWo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=CQi187NV; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="CQi187NV"
Received: from pps.filterd (m0209323.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3LCDpI016259;
	Tue, 3 Dec 2024 21:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=bSwKq2h
	kh8y4Z8aWOaT1BC00swV5GwTU3wgZClmP/ME=; b=CQi187NViX3Bnv/iLxC8Yb+
	yZmNO4Fi1Oj9nTT7nvl/3TrgPlOnE4mZN6RFsJvSjlvkCAU5mHL57MEhOj0Tnfqj
	K8gK0b3735HI5tZLDmbrWS+PRU8xzF/4ug45EfNUsk6g9HXD1mVzOuUwU/oQ6rN/
	bKPlzAXV+LDHrfbZQKUUTMlTfwKQIlrE2jCgWV8eDV8ckouhcP+s7DK4t6QE15+t
	J4H48kZStGUO83sjI4BUOECzdPvhY12Xo4TyTzUu8U3jXfXBsnxrSHDxHljVgQTn
	wleiYIBxV/6neG3aiynE6EAg/534iR0FaeYvYug5UpSB0t9ZRUxjCSEPm5EvbHw=
	=
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 43a5qrg4sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Dec 2024 21:24:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAAyprodmCxjC8c8Ii/+gYFXQRCOXOdiPYewOiPiyH0V0vqgCd8tARDX9ksJqUlVdcoXiwMAboFW8DbNEBLzFH8LlSE0XU8Ghb8+v5MjrEJCLaMmzb48JxKVgJvTV1hUlYEj3dPCTpLtJINsrYy5Zl6/qRBPvTBEyhctWeCND4WXqqu5y47XPEEJE1XbaW7LW3KeVW7EE7Ecwob/fP7trXFwNF2jw3IQNJ9kWCdAiWUx9YGVNW/ZMqEmQLfm8fnzK7ccc4OGZ0ulBky4f4YySZeoBGnb6TXNudIov/baIlDXK1AVh+37HjtWAXXYTTNj1X+yegZeSGccwEj1awBLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSwKq2hkh8y4Z8aWOaT1BC00swV5GwTU3wgZClmP/ME=;
 b=U7OO+sW7iipZ9AJP3d0vFTn2CnCAGydpPbbQai9aRL7aJweqBv5f76//SXzj7vYEJ8Sa7EEot5bzpTafxDVulr2ZcJNWb+NW5b6OaQUZraj/UvLZoAMok4DNPo60C0wjeFgBPInICfhTBfL1MQZWsPC1UcVbBB6pnqfoEYTkGl9Fo9TlTeld33RzDzEwN5fr8ttpwKo4WfOfGX4A1s2NfyoKXZxUQ8lY+noxZGLcV2F9IXAnr+JNxg4mZ719DYpjET7wj6xLxr0GPwKhgM1I5q2DW45VkoiqaJ1cKDJmbiYKZPNhzYemSUayCLfMoVnmnPZSKJR8o3UGaeUBAGu8mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by MN0PR13MB6592.namprd13.prod.outlook.com (2603:10b6:208:4cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 21:24:28 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%6]) with mapi id 15.20.8207.014; Tue, 3 Dec 2024
 21:24:28 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Francesco Valla <francesco@valla.it>,
        Linux Embedded
	<linux-embedded@vger.kernel.org>
CC: "smueller@chronox.de" <smueller@chronox.de>
Subject: [boot-time] jent_mod_init on beagleplay (was RE: [boot-time] [RFC]
 analyze-initcall-debug.py - a tool to analyze the initcall debug output
Thread-Topic: [boot-time] jent_mod_init on beagleplay (was RE: [boot-time]
 [RFC] analyze-initcall-debug.py - a tool to analyze the initcall debug output
Thread-Index: AQHbQUB9VDD2MU55KEKzPJEHGSHhDrLVEPXg
Date: Tue, 3 Dec 2024 21:24:28 +0000
Message-ID:
 <MW5PR13MB5632D5A1AE2D16F53FA2391FFD362@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <1964175.7Z3S40VBb9@fedora.fritz.box>
In-Reply-To: <1964175.7Z3S40VBb9@fedora.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|MN0PR13MB6592:EE_
x-ms-office365-filtering-correlation-id: 42abe026-1d9e-45bb-0781-08dd13e0de79
x-proofpoint-id: d8690225-876f-412f-87c6-a7cb45557a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SjRuanNNVm5PTU9WTlU4cEF4L3hpOEZ4UXlQbDhva2ZuRVdhWnZGL1dCTWxr?=
 =?utf-8?B?bmVzNGlIS21GUEtRRkZSVmx1bHdtYkhkL0NUNkV6VFlhVFRHWG1VSGtsZkJs?=
 =?utf-8?B?aG9GWWRpYTJiWllhTHJXWCtOcHIzZHcwMjUrb1RrS1RGY1hmNndLTllSVFNl?=
 =?utf-8?B?YUlWYlliVWsvQm9mTWYrRVorWmFGYS9LcVltNmZhQzhQZUNEUFpOc3hrYllZ?=
 =?utf-8?B?UDRLUm1NT3FNdldKa0NhQUFobFZHZFcvTDdmOG9MQ3JHbDNjQmw3Tkxnbm0z?=
 =?utf-8?B?RFlJd2R3R1F4d2FIKytOc0xkUUhxbFRHVTgxQkMzSTNPc0VhcHgxVXc1bmQr?=
 =?utf-8?B?VEVTV1gyUXRrc0lpbSt6WVBIQjBJcXhONU9QbTh6bkpxc2NZTURjTkFOZVBB?=
 =?utf-8?B?SzJJdWtZajVsVG9wZGNpWWEwOWI5RmprWVJYbVlSWm9hd01QWlJnZ014ZnAz?=
 =?utf-8?B?ak9HY2dvdE1xOGpPUlNTNmlRblZwSXlFYWxEVW5xd2JuZ01RTTZRNVg1Y1hI?=
 =?utf-8?B?QUFYL3N0by80Sk4wRWgxeE12WU16S2ZQZytiMXAzVUNnZmRsMFo4NGQ0M21y?=
 =?utf-8?B?ZDA0TW1ieTB4TXVGQVRPYW9LRWRtT2hBM29JSUM2d25LbllwZUozalppd056?=
 =?utf-8?B?QWlZaVp0U25uRm50cWhWUzlWbEtLRTVlR2g3SWxFRXpJRmNvUTlxekdJOHJj?=
 =?utf-8?B?M0JFdytrMjJlZ3h2NlRjTmF2SjRMbzc0R21NNCtNd29mTWZlcGdzdlZTZHdq?=
 =?utf-8?B?amtKYXE1STU2L3AvbytWVVUrdW1DNTYvcWJYcklsclpZZ3dKUWJaZXBWRVJy?=
 =?utf-8?B?ZVRlSHZwTWMxaXo5aXc1VXkwZXM1Y0ZHSnd1TEYrYlhGbXhkL0ZCVUFDZmZr?=
 =?utf-8?B?RlNsSkI5SmRKcC91ZnQ2WGgzeDMwTEl0YXBxd05jRVJqcTBsL2cwZWlnaVZw?=
 =?utf-8?B?VkRxcXFveHkzMEorMmNXK0x0eWsrWDVtN09UTy9aRXdPcWg0UDBMWmxHVFdm?=
 =?utf-8?B?ZThzQjhqTG9uclVmNllKeDVybDErTGY4YUZLNjQ3MFF6V0FuTzZOQzFvbTRj?=
 =?utf-8?B?ckdRbHRzODRKWHdURUFsQm1IcW8vVkRoRGFiYjVpMUgycFJsWHExTWYzOWl6?=
 =?utf-8?B?eVRXQkx3Nk5jdnd5SUI5Vzh1eFZORjBwR2dpM1hkaE1JK2dFZGg2cGFkUGpB?=
 =?utf-8?B?aHI5TVl3Y1dabVB4Y2ZmTVJreEV1THVQdi9LMGZKTUhYeCt6b0ZIa1JvOUhh?=
 =?utf-8?B?ajNWUXA4QmdIV3JMaVI2bWpNbnBFWHdQWTFKR1RwZVpKL0Z1azJhMXltdVVW?=
 =?utf-8?B?UERPQlBzQnJiUXhVNHQyaVdWQm9PNCs5N1dqQ0c4YXYvRTQ4SlJxcGxvd0Na?=
 =?utf-8?B?am9HM3V0YTVnZHA5eHZNZVRNUlFhOEJrSFpyRnBrYUlUWTI1dHI4L3U4dTlG?=
 =?utf-8?B?RWovd28wRmZTYUlWMHFkQ3hTUnFKL2ltcFI1bG80aElPUlU2T3VwSWFXeUFZ?=
 =?utf-8?B?alpVQjQ1UDlRSElLS1JwaFFhVnNMZnBHYkZGdnVzZkxEajBMK0ZSdWM4STUw?=
 =?utf-8?B?QXBQVXBiK20weklKUE5VK2s3QjVhMUlBMytQR1ZXNVVLMnZGSXdmOWVEMUNu?=
 =?utf-8?B?Q1pCT2FPTlhwMnVFZGJVQjV0aE1VMXZpMzRPRG9sM3gxUGttSHNQa20rTFFM?=
 =?utf-8?B?YjlIYU9mVUw1eHdjUVZLamlFd1dxMHF2L2Fzb0QxeE5kQVliUWNmSldKU3lu?=
 =?utf-8?B?RlpFcXVrSU8vYVhvVzBiR0JKZi96cmxDUCtncVh1bHNpYTAyZXIvMVVBT1VG?=
 =?utf-8?Q?y8JkHT7mATlSK65heJPK9FK/D7ld/VIwnxrAM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RW1DWEkzY3BVc3YwVjZUS1FBckIxakpIaGlta2xLYXZNdzNYY2Y4WVV5RW5W?=
 =?utf-8?B?cGNldlNSL0kxTFFkZDJ4WnFGbENnR3VQSW52ZWNTazY2L21vczdMcFdlSmpI?=
 =?utf-8?B?dUExb3RZNzN6WEkrNXEzclYxQ3haTTJpb3VwaG1JZ05DcVBJNU42UWE2NWJJ?=
 =?utf-8?B?NUhIVE84UHI2dTZSakJtNTh1c3dDVXpRMWl1MDhmRnZ3RVQzVTdERkZzdFVL?=
 =?utf-8?B?Ym9JWGk2QklDMWJEcGtaTDk2WlhiZFdud01HazZKdjcrTTROcmlaWXJYcE96?=
 =?utf-8?B?ZCs0ZlhCbzZRYVI1ZVZjYkEwVmFDLytNT0p3QnhXQW1LdVVya01aT0R0aWxJ?=
 =?utf-8?B?RzBuNHhDdVovNzRoN3gxTG1QMDEybm9FSitrQWxzdVNkNk9jdm9Iemd6dTdP?=
 =?utf-8?B?WU5jSTA1ckNhc01JbkNXSnhDeHBkTk90NGladndWdTBDV1JyUkxRazlkMHJP?=
 =?utf-8?B?QmEranhmWjJxMjRId2w4eWRlY0t1Mm9SWjBXSUYzc3lhWGhHU2ZsOTRzTGU1?=
 =?utf-8?B?VWNqMDZjaTZDTjgxaUU5Tmd6ZnJZVTVua0V5MW1wN1c5K0VRbWVyS05JYjA3?=
 =?utf-8?B?MmVyNlgyRTZqQS9GQXcrUkwzcFVZZEZKSlhsWWJMWlVOdzR2NllEbEFnb2dS?=
 =?utf-8?B?UzRPOUVCaThPbHJOZVpNMFhCY1MzaUFxNG02SWdSS2RiMnU4UHp3UW9xcmF2?=
 =?utf-8?B?MlFpdXB5WGpUbVdjaEFxSCs5eEhLS3QreXl5L0orZGthVXE3VTc5ZSs0ZzNr?=
 =?utf-8?B?UUdFclFUN3RObDl5QzlVYzdldk9zNnFoa1dlYUszb3RRb0tSUkZSbXVCWVhM?=
 =?utf-8?B?cGswbFlLNVZLTjllM1U4Z2xtT2ZVSnE0ZEZLdktFYlE5MGZnSE1BbE5yWis2?=
 =?utf-8?B?QXkvakhuaWZzZzc1cVdHbHc2TUg4cisxTVp4cnJVT1ZCY3NiUWFkeHRVMDVX?=
 =?utf-8?B?T29SNnR2VVBKRVdoR0t3YXpwT2wxNUFsYkdjUWhmU25HcXVnelZOQmtxa2ZX?=
 =?utf-8?B?OWxadktBeDdTeHduNWNScUl3YU9DdVdTUDY2TXNQaVc5NzR6M2cyYjRFN1B2?=
 =?utf-8?B?akRyQUErUHJYYkhJNTcrZHBiRjVyRUpjUHBVUndDajNoZzd1am8xOE1wYWRh?=
 =?utf-8?B?ZVhkUVJ1Nk83L0JhZkIycFM3OFJDQnlteVZTTVErR3pGbjNmUGtkejdXRmpJ?=
 =?utf-8?B?czYwb2xsQTVQNXNUd3Uvc1NUUzEyYWQxWUZIMUEwVGhjbld6dDFrN0R1Z2M1?=
 =?utf-8?B?bHZDanprRncxMnV0VUZPZDZMT1o2cWl4dTQ2T1VYYjY2WVdiSFVDbFBvSVRD?=
 =?utf-8?B?WkIzSGRwakFITkZscW1tMlJTTWFWQ00zT25ETkw2UW9takFLK3JUMkhoYXdl?=
 =?utf-8?B?MGgwb1dYSmNpMW8xdTlWVEhRcTEwQ01sRWhTVUtQb2gzeFJTaGRqRkVnRzRE?=
 =?utf-8?B?ZzFGVXpWRmdEVHNsaE51UWYwb1lQNnpyNWhnRGZzeXdycVhWTWFjZDk2dzFM?=
 =?utf-8?B?dWVFdkl0RGJEbmY2Z3lpczZ2Q0NDbkRXb1Nldk4zOE5FQjZPV21EQlhNSllm?=
 =?utf-8?B?SGNxRVJoZC8rbUsxL1Y5WmFsZnZPci9rcExwNDhJbkpuZ1JyMjdvZEMzTCtY?=
 =?utf-8?B?VkduYWRQa2FSbDZabDkzTE9mYjQxckdvaXN0UmRsdVZ4cEV2c2RkTU5ZSitL?=
 =?utf-8?B?M3dLeUdZa0Z2OEg0ZVlWQWdKSTBCam9hYTVxSU9VcGZ0YnBmS1AycUV6dXdP?=
 =?utf-8?B?M3dmcGViU0NCNHVRc29mdVpKNnE4V1NKWVVFcFlSY2FuSUFJU1NFYU9SWUcz?=
 =?utf-8?B?Wi9IcHlPYmRGMGJVa091ZWhjOFpjeHRSQ1J0ZmQ3VjI2TzN0N3hqcFFhNXNk?=
 =?utf-8?B?bmZiUUhsMHJMQ0RsVUNGN2tLTzNHRzU2d1p4bW95dzc5bk1nam5RenhIWmp5?=
 =?utf-8?B?L2pJTHAwRUlYdmdCQUlNNWg2ZFZnSjBBYmFpbHFyVURWQlE0WTZvVDAwckd5?=
 =?utf-8?B?dnF6ZVk5czBrRmw4ZlMydXU1dzBrS1NjZUo2YURrYmRIRWI0L3h0T3J0QnBG?=
 =?utf-8?B?dXVITUk3anFwZTF6M1czOHdmWSsxbzVuZFNGdThVWDEvK0NLc3o1dW9qL2VT?=
 =?utf-8?Q?fDb0=3D?=
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
	Z+FU5oJby4rxAnmdoEz2aVU8aeeGtAsImqkYhR/fjZKUBufGZeLgtQz1koUGtCZv8ydAvc16a84rRRd5bg3LXeY9+GVx1A5/YvNvNsBjABduG2LhonGH4qX3F7EuJHjP9AGeuGesOHVG1wkJSZoYcUY1Puys6/NBVA549ow4aVzf0tYFNADutKHxRMb+GJVMoxBYKgpiPAZGZQRTKARmsfAJgKdluYp1/+0Yydjak3UR8w4fjibEwx/qQCqmCjjTJFsniuA3DFDIBlnxyqgwctfa1kP6dqxpFD+Xzvim5EImpg2OkVHakKshkICVWjWcR5XAFA5QNYd/VrTZcqepXELPRuwBBeHJmpCjYdIaXGN8CKVttuSTnER5gxxvlGHLxdpiE9VF0PkcgSN+y+F5i6Kg5ngOmFE/LGHPj6ihN6vkmBlgi00euPIRDdAivtopLTrgry2pshiUE1YaF3T3hMR8N3Y78dNkjAwl7g2//Van0iuhQ/kGsLnd5moKjVYcdL/D/wCD5WQDLgmwE2dunsVCV8r2sMzE958wBJg41crAEw9g4UgsErFRjvRIuUcGEgvPLmRwbTnPyUC9vE9giX8ZNKDBrGymq37jQ5Gb4PszShQRhZPEhExphfhdy/yj
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42abe026-1d9e-45bb-0781-08dd13e0de79
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 21:24:28.2189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qAAQLkcw8tOR6qL6hSRh95gA/bl43sseYIs/7LPZyUOwVWHWa8xPGHje7biqlvSbCURYYKaNCFGX7cKOzB7zpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR13MB6592
X-Proofpoint-GUID: oZv67PRuoSXIJjSPvkOlSCHRIkttzjwF
X-Proofpoint-ORIG-GUID: oZv67PRuoSXIJjSPvkOlSCHRIkttzjwF
X-Sony-Outbound-GUID: oZv67PRuoSXIJjSPvkOlSCHRIkttzjwF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-03_09,2024-12-03_03,2024-11-22_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGcmFuY2VzY28gVmFsbGEgPGZy
YW5jZXNjb0B2YWxsYS5pdD4NCj4gRGVhciBmZWxsb3cgYm9vdCB0aW1lIG9wdGltaXplcnMsDQo+
IA0KPiBmb2xsb3dpbmcgdGhlIGZpcnN0IGJvb3QgdGltZSBTSUcgbWVldGluZywgd2hpY2ggSSBs
dXJrZWQgd2l0aCBtdWNoIHBsZWFzdXJlDQo+IChidXQgZGlkbid0IHBhcnRpY2lwYXRlIHRvLCBh
cyBJIHdhcyBhIGJpdCBpbiBhd2UgYW1vbmcgc3VjaCBhdXRob3JpdGllcyksIEknZA0KPiBsaWtl
IHRvIGludHJvZHVjZSBteXNlbGYgd2l0aCBjb2RlIHJhdGhlciB0aGFuIGEgcHJlc2VudGF0aW9u
IG9yIHJlc3VtZS4NCj4gDQo+IEhlcmUgaXMgYSBweXRob24gc2NyaXB0IHdoaWNoIGNhbiBhbmFs
eXplIGEgZG1lc2cgb3V0cHV0IHdpdGggaW5pdGNhbGxfZGVidWcNCj4gb3B0aW9uIGVuYWJsZWQg
YW5kIGV4dHJhY3Qgc29tZSB1c2VmdWwgaW5mb3JtYXRpb24uIEl0IGNhbiBmb3IgZXhhbXBsZSBi
ZSB1c2VkDQo+IHRvIGFuYWx5emUgdGhlIG91dHB1dCBvZiB0aGUgZ3JhYi1ib290LWRhdGEuc2gg
dG9vbCB0aGF0IFRpbSBwcmVzZW50ZWQgb24gdGhpcw0KPiBsaXN0IFsxXSBqdXN0IGEgZmV3IGRh
eXMgYWdvLg0KPiANCj4gVXNhZ2UgaXMgdmVyeSBzaW1wbGUsIGFzIHRoZSBvdXRwdXQgb2YgZG1l
c2cgY2FuIGJlIHBpcGVkIGRpcmVjdGx5IHRvIGl0Og0KPiANCj4gICAgIGRtZXNnIHwgYW5hbHl6
ZS1pbml0Y2FsbC1kZWJ1Zy5weQ0KPiANCj4gSWYgbm8gb3B0aW9uIGlzIHNwZWNpZmllZCwgaXQg
b3V0cHV0cyBhIGJyaWVmIHN1bW1hcnksIGxpa2UgdGhlIGZvbGxvd2luZyBvbmUNCj4gKG9idGFp
bmVkIG9uIG15IEJlYWdsZXBsYXkpOg0KPiANCj4gMTc1OCBkcml2ZXJzIGhhcyBiZWVuIGluaXRp
YWxpemVkLCBvZiB3aGljaCAxNzU4IGJlZm9yZSB1c2Vyc3BhY2UNCj4gMTE5IHByb2JlcyBoYXBw
ZW5lZCBvdXRzaWRlIG9mIHRoZSBpbml0IG9mIHRoZWlyIGRyaXZlcg0KPiAwIGRlZmVycmVkIHBy
b2JlcyBwZW5kaW5nDQo+IC0tLQ0KPiBUb3AgMTAgaW5pdC9wcm9iZXMgZHVyYXRpb25zOg0KPiAg
KiAzMDIwMDAwMC5kc3MgLT4gNTIzMDAydXMNCj4gICogZGVmZXJyZWRfcHJvYmVfaW5pdGNhbGwg
LT4gNDg3NDgzdXMNCj4gICogZmQwMDAwMC5ncHUgLT4gMTYyODU5dXMNCj4gICogODAwMGYwMC5t
ZGlvIC0+IDE0MjUyMXVzDQo+ICAqIDQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyIC0+IDcxMzkw
dXMNCj4gICogMi0wMDRjIC0+IDcxMTc4dXMNCj4gICogNDA5MDAwMDAuY3J5cHRvIC0+IDU5MzUw
dXMNCj4gICogODAwMDAwMC5ldGhlcm5ldCAtPiA1ODQxOXVzDQo+ICAqIDQ0MDQzMDAwLnN5c3Rl
bS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXIgLT4gNTY1OTl1cw0KPiAgKiBqZW50X21vZF9p
bml0IC0+IDUyMTQwdXMNCg0KVGhpcyBpcyBvZGQuICBPbiBteSBiZWFnbGVwbGF5IGJvYXJkLCBq
ZW50X21vZF9pbml0IG9ubHkgdG9vayAzMjMyNnVzLg0KKHNlZSBodHRwczovL2JpcmRjbG91ZC5v
cmcvYm9vdC10aW1lLWZpbGVzL2Jvb3QtZGF0YS10aW1zbGFiLWJwMS0yNDEyMDMtMTM0MTM2LnR4
dCkNCg0KSSdtIGFzc3VtaW5nIHRoYXQgd2UgaGF2ZSBzaW1pbGFyIGhhcmR3YXJlLCBidXQgcG9z
c2libHkgZGlmZmVyZW50IGNvbmZpZ3MsDQprZXJuZWwgY21kbGluZXMgb3Iga2VybmVsIHZlcnNp
b25zLiAgSSdsbCB0YWtlIGEgbG9vayBhdCB0aGlzIGFuZCBzZWUgaWYgSSBjYW4NCmZpZ3VyZSBv
dXQgd2hhdCB0aGUgZGlmZmVyZW5jZSBpcyBiZXR3ZWVuIG91ciBzeXN0ZW1zLCB0aGF0IGNhdXNl
cyB0aGUNCmRpZmZlcmVuY2UgaW4gdGhlIGR1cmF0aW9uIGZvciB0aGlzIGZ1bmN0aW9uLg0KDQpU
aGlzIGluaXRjYWxsIChqZW50X21vZF9pbml0KSBpcyBvbiBteSBsaXN0IG9mIGluaXRjYWxscyB0
byByZXNlYXJjaCB0byBzZWUgaWYgdGhleQ0KY2FuIGJlIGltcHJvdmVkIG9yIGRlZmVycmVkLiAg
SSBoYXZlbid0IHNlZW4gYW55IGRlZ3JhZGF0aW9uIGluIHN5c3RlbQ0KYmVoYXZpb3IgYnkgZGVm
ZXJyaW5nIHRoaXMgaW5pdGNhbGwgb24gbXkgc3lzdGVtLCBidXQgdGhhdCBjb3VsZCBiZSBmcm9t
DQpsYWNrIG9mIG15IHN5c3RlbSBkb2luZyBzb21lIHJlbGF0ZWQgb3BlcmF0aW9uIHRoYXQgbmVl
ZHMgdGhlIFJORyBkYXRhLCBvciBteQ0Kb3duIGlnbm9yYW5jZSBvZiB0aGUgZWZmZWN0cyBvZiB0
aGlzIGNhbGwuDQoNCkNhbiBzb21lb25lIGNvbW1lbnQgb24gd2hhdCBpdGVtcyBvciBvcGVyYXRp
b25zIG1pZ2h0IGRlcGVuZCBvbiBqZW50X21vZF9pbml0DQppbiBlYXJseSBib290PyAgSW4gcGFy
dGljdWxhciwgd291bGQgd2UgZXhwZWN0IGFueSBjcnlwdG9ncmFwaGljIHByb2JsZW1zIGlmDQp0
aGUgaW5pdGNhbGwgd2FzIGRlZmVycmVkIHRvIGEgZmV3IHNlY29uZHMgYWZ0ZXIgYm9vdGluZz8N
Cg0KSXQgY2FuIGJlIGNvbmZpZ3VyZWQgYXMgYSBtb2R1bGUsIHdoaWNoIG1ha2VzIG1lIHRoaW5r
IHRoYXQgbWF5YmUgbG9hZGluZw0KaXQgc29tZXRpbWUgaW4gdmVyeSBsYXRlIGJvb3QgKG9yIGV2
ZW4gbGF0ZXIpIGlzIE9LLg0KDQpqZW50X21vZF9pbml0IGlzIGRlZmluZWQgaW4gY3J5cHRvL2pp
dHRlcmVudHJvcHkta2NhcGkuYywgYW5kIGNvbnRyb2xsZWQgYnkgDQpDT05GSUdfQ1JZUFRPX0pJ
VFRFUkVOVFJPUFkgKFNlZSBjcnlwdG8vS2NvbmZpZykNCg0KSXQgYXBwZWFycyB0byBkbyBzb21l
IHJhbmRvbSBudW1iZXIgZ2VuZXJhdG9yIHNlZWRpbmcgYnkgbWVhc3VyaW5nDQp0aGUgaml0dGVy
IG9mIGEgY29tcHJlc3Npb25nIG9wZXJhdGlvbiBpbiB0aGUga2VybmVsLiBJIGFzc3VtZSBzb21l
IG9mIHRoZSBjcnlwdG9ncmFwaHkNCmNvbmZpZ3MgYWZmZWN0IHRoZSBkdXJhdGlvbiBvZiB0aGUg
b3BlcmF0aW9ucy4gIFRoZSBpbml0Y2FsbCBkdXJhdGlvbiByZXN1bHRzIG9uDQpteSBiZWFnbGVw
bGF5IHNlZW0gdG8gYmUgcmVsYXRpdmVseSBjb25zaXN0ZW50IChpbiB0aGUgMzJtcyByYW5nZSBj
b25zaXN0ZW50bHkpLA0KYW5kIGZyb20gYm9ic19sYWIsIG9uIG1hY2hpbmUgc2FtMSwgdGhlIGR1
cmF0aW9uIHJhbmdlIGlzIGFsc28gY29uc2lzdGVudA0KKGF0IGJldHdlZW4gNDgwMCBhbmQgNTIw
MCB1c2VjcykuDQoNCkknZCBiZSBpbnRlcmVzdGVkIHRvIHNlZSBpZiB0aGUgcmFuZ2UgaXMgY29u
c2lzdGVudCBiZXR3ZWVuIHJ1bnMgb24gb3RoZXIgbWFjaGluZXMNCg0KRnJhbmNlc2NvIC0gQ2Fu
IHlvdSBzdWJtaXQgYW5vdGhlciBib290LWRhdGEgZmlsZSAob3IgMiBvciAzKSBmb3IgZnJhbmNz
ZWNvc2xhYi1iZWFnbGVwbGF5LCB0bw0KcHJvdmlkZSBzb21lIGRhdGEgb24gdGhpcz8NCg0KQWxz
bywgY2FuIGFueW9uZSBlbHNlIHdobyBzZWVzIHRoaXMgaW5pdGNhbGwgaW4gdGhlaXIgYm9vdCBz
ZXF1ZW5jZSBydW4gZ3JhYi1ib290LWRhdGEuc2gNCihmcm9tIGh0dHBzOi8vYmlyZGNsb3VkLm9y
Zy9ib290LXRpbWUvQm9vdC10aW1lX1Rvb2xzKQ0KYW5kIHN1Ym1pdCB0aGUgZGF0YSBmb3Igb25l
IG9yIG1vcmUgb2YgdGhlaXIgbWFjaGluZXM/DQoNClN0ZXBoYW4gTXVlbGxlciAtIHdoYXQgYXJl
IHlvdSBzZWVpbmcgZm9yIHRoZSBjb3N0IG9mIHRoaXMgb3BlcmF0aW9uIG9uIHlvdXIgbWFjaGlu
ZXM/DQoNClRoaXMgaXMgb25lIG9mIHRoZSBmaXJzdCBpbml0Y2FsbHMgSSdtIGdvaW5nIHRvIGRp
dmUgaW50byB0byBzZWUgaWYgaXQgY2FuIGJlIGltcHJvdmVkIG9yIGRlZmVycmVkLg0KTWF5YmUg
c29tZSBvZiB0aGUgUk5HIHNlZWRpbmcgY2FuIGJlIGhlbGQgb3ZlciBmcm9tIGEgcHJldmlvdXMg
Ym9vdCwgaW4gb3JkZXIgdG8NCmVsaW1pbmF0ZSB0aGUgb3ZlcmhlYWQgb24gdGhlIGVhcmx5IHBv
cnRpb24gb2YgYSBjdXJyZW50IGJvb3QuICBBbnkgZmVlZGJhY2sgb24gdGhhdA0KaWRlYT8NCg0K
VGhhbmtzLg0KICAgLS0gVGltDQoNCg==
