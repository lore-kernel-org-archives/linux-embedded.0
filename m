Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EC01799F
	for <linux-embedded@vger.kernel.org>; Sat, 11 Jan 2025 18:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736621865; cv=fail; b=sx5nc7kMvSiJJCGlzif3LF2ujSJHEKf0lcV0wMADchV4iCCEo2Fo2+z1wpAeIFYt+guxz72Zw6m7QUA6ST/svcOvJhshPn4f3gA8cfndjNx5p/UO6euFmDZ9BWARRM0tKaam43/7hBe815F4jXzR4XD3eqZuPuTmSN1QZqzsXRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736621865; c=relaxed/simple;
	bh=oeGcZ2NS4OiKaOuxTwNQl3URmWLSG15kSDTztdhgIvc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mn8csHRlHHUQX92u9HLn1EFbmimzi2LBfOXkASOXgu7lz5wgKcAsMLh5IStwsnfT9AVB361ti6DlmaXueaRMo4Js+NRyWhuDCkzOEuwfdcb4P3Z82jyXfZoIY/6zE7L5Ih43ldSdbyPsrTYQ4rBImI9jSxrdhjVLtwNGfsgNgvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=CxQjARLt; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="CxQjARLt"
Received: from pps.filterd (m0209320.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50BIvTUV030514;
	Sat, 11 Jan 2025 18:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=oeGcZ2N
	S4OiKaOuxTwNQl3URmWLSG15kSDTztdhgIvc=; b=CxQjARLtgpXHDPuxvdIB/yY
	Bg1eGgfgO2eu+WJZ6+8i2P3t9p257hiflbIWLSLtIKo5OQpTN1orcq3OvFxo+rSB
	4DPkv5MwmQOW+tKY6nyRqWr1WCKRmqGoivpF6f3R0DWG0VHjRjjxfMgWv0CZ0s7G
	RIPCEOzDJg/6rGaRHEG3uwt0RXqXEGmeYK/0DFftAkL27wYGy9kP0P437PPQN9VK
	K+igHndnKgAaUAvX5yUiz13GvcvchAqZA2M8Cf8c9FCUdSJU7PXD1r2FHtaMmj8a
	JWyrdx7TAt4DiPg3Ng7+V9LW/Nai5Ucrg3YQUF2/s2YclW8SCEBPMdR76mIn7hg=
	=
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 443hum093b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 Jan 2025 18:57:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxqyC6hHWPKfMQGM4c2M4fVsQg2GmXz+k8D6yjaG4DL5oub4IRwD/hzpzyynJC21F8716/MK7L5eA7rad6KJh9KjgHWuNegCepetrsKCz/pr3qmRs8+RtKE3o33WmPvj+pOFK8shenLSzcXEke9EX5jwZDtFN1cDgnx1X1tvXPLZD6KZ1MT32MMz2N5BvQUOA0WWaLVimlvmQhBmBeXohz52jcy/5FMWBxr4bmlGZtrntthFYMTMQqynxNU0xi+6zQSWo/+2DDgCXf+BwbtZVRYFPiv2mPN9D+c4uhvEsgCBiT9TRLa4c8DPIUgscjyAREaLNM/PpVULhkpQ2QZ49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeGcZ2NS4OiKaOuxTwNQl3URmWLSG15kSDTztdhgIvc=;
 b=piywdvhODUhfwysEAnZJwzrmmU4cJLnf6leVJAtBU5TYslNM22HgtPf2yAIGLea6JUk37rtk+q6DBEDplTXwen9iHvxpTPHR+N9/arr2K/CLiC1RBnCe/LQjg0w2WgBGSOr4g/3g9rIbxqyJYkeIPzaxiYRn6LVh1ruk0a3mVxrw25qy3yj4ksnDrUnJr7okFnIKYsKJfm6AMoIcOsvZXZFQ1oPZ+rQOPm+HSyg2ICj7rbMrAW/tLT/qc5gEJW1DCKI0iW2OMV4p95M2e70DZ1W/YpRNPfJaYYlxSYs4lVyVhDttFHS3HHefk+i0QKMZg4BIvnVsDVWkX1EQgMdsgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by CH2PR13MB3653.namprd13.prod.outlook.com (2603:10b6:610:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Sat, 11 Jan
 2025 18:57:23 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8335.011; Sat, 11 Jan 2025
 18:57:21 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Rob Landley <rob@landley.net>, Marko Hoyer <mhoyer.oss-devel@freenet.de>,
        Shankari <beingcap11@gmail.com>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>
Subject: RE: [boot-time]
Thread-Topic: [boot-time]
Thread-Index:
 AQHbWiLTBybXJIS1AU23EMmh9EFgybMNPmaAgANwPgCAAAg7AIAAna8AgACbZYCAAA7IoA==
Date: Sat, 11 Jan 2025 18:57:21 +0000
Message-ID:
 <MW5PR13MB56325452C6F217FB9C927653FD1D2@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <CAORPcfVRobA+u5q7aPboC=3iY8dibDUB0920Z=Z0VgpQEupKJw@mail.gmail.com>
 <MW5PR13MB5632841906910ED152E7AE3CFD122@MW5PR13MB5632.namprd13.prod.outlook.com>
 <1c232997-79cf-4153-9b1c-6fcbc42121a9@freenet.de>
 <c70841da-3fe6-4b58-a24f-579dc3cc5dbc@landley.net>
 <1b6e380d-000d-420a-b198-ecb68c356d34@freenet.de>
 <98ae21b7-43bb-4a72-bd50-0b13f9700734@landley.net>
In-Reply-To: <98ae21b7-43bb-4a72-bd50-0b13f9700734@landley.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|CH2PR13MB3653:EE_
x-ms-office365-filtering-correlation-id: 12391ce6-733e-4a59-1d4e-08dd3271c7af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?THJhdUZJdXFFdkkxc0p4Z3o2N2xCaW14dUx2bVVpTkt0d0UrZjlNUDNoTEdx?=
 =?utf-8?B?bTh5bU5keEJqcUhQUE1FeEtZY2xwT3hCM3dwYjQ3QUxTZCsyRjlZREI2alpn?=
 =?utf-8?B?amlnYjhaOWtFdFB3NnRWamh3QkwyNzdIQ0xaNTJURVhnNFF1Rm1RdTVtbmNJ?=
 =?utf-8?B?SFV1d1g3WmNoMUZaa0diSnZOZlU1N0ppWlpaQTk1MzE0cktIOEVURWN2Undm?=
 =?utf-8?B?TFBHTFlRbWMyUmo0aG85L095U0RsbVNHaktLSThGV0kvZnVkSDlqSktjdTRM?=
 =?utf-8?B?QmtJRVBIRjhxUmdQRGZWeGhtQUdISDdHUm5SRHE3dVJnNEZnUXlpeEgwZG1x?=
 =?utf-8?B?Z1ZoNG5kNkk3V2kyczFwWlRjWjV4Q0hhbjRFUkswRHZGdFQycG5Sem4xWmZm?=
 =?utf-8?B?MWV5bFRJVmNKclpSenF6SlpLUC9IVGF4MnZwcGpYVFJPWWV3bXp2c3RxMnln?=
 =?utf-8?B?TmtwcFc3eGlWMkxwTWFGeVNnVWpGV2xxaWdtUytBODVLNTJzTFh1WmcxeDhH?=
 =?utf-8?B?eGhUTjJxTVROemtRT096cDN2Tk05Ri9kV1J6ejhTNzFFRFNQN3M1Y0FrZ1B1?=
 =?utf-8?B?UTB0VVVZcWsyQ05Bd3E4SGxaTkRuUUkvLzRuL0p3c1ArYnMyOTNFOHhreXov?=
 =?utf-8?B?S2VpQnlVT0h2Wml6RmNUN2kwL0NnVjU5clVBR0U2N3JRc09nQ1Q4RGZvOUFO?=
 =?utf-8?B?cGE0MGF2SWhtbFN2K3lSWXBCQlRLN1U2RUcvT1NhUkZ5TlRSMWx2VWg4N0hF?=
 =?utf-8?B?d0QzTVczUUMwVXh4K1FWR2cyanlxVlJ3YkU3SnFMM0lXUEE4amoyekkwMXZK?=
 =?utf-8?B?QUQrbks4cjJXS2ozeGJrelNUZ3Y3Vjh6SmZoRVlBY29XMTI1bmMwZjltTlhU?=
 =?utf-8?B?aldSczRMZlRJNTJYYU42S3dra2NJVnVoTWJBb3BHRXlqTmhSUGI0VlQwMmFW?=
 =?utf-8?B?eUgyak1lcFl2TmZpQ1NWR211WWhldHNJWktOcmd5b0VkMzIyYklLUE5QcHJK?=
 =?utf-8?B?TTMrcjFoUURFRU90WjlibG5SalNPNXpHSHVuSVQ2Y0lJOGVobU96T3JNdmw2?=
 =?utf-8?B?WlBlN1VsREdkWEptbnAvTnNNRHpja2ZNYXcweWFXaTNWOEtqQXdWamtsWHdy?=
 =?utf-8?B?QnBoaUJ2bmFxTjd1N0EvQjA2M01yU2V3TGJCZzRaaFU3WUxKSmJoSlZVSzdT?=
 =?utf-8?B?M2Z2LzNZd3ltNmNjd3R6MTVoRmFLa29ZVnIwSkQzdWFOWlRrTHBLekNpbkVl?=
 =?utf-8?B?d3N4NHRHUlIyNm41VWpZRWFHZFJEN2RkNzErdldOSktzbnRzMG1rcHFlSWFT?=
 =?utf-8?B?SHFraHkxOFFqRGpodlRSSjlza0RsWTVlV2xiSTlvWGtiNGlMK1lVdnFOdHJn?=
 =?utf-8?B?QUpxendVeVo3djRaZU1JRU55dTlZVWtoMUhyeWpWRlcwY3ZJSTBtSzJEUWpr?=
 =?utf-8?B?eWtodVQ1WnJHZGpDcmhHdlN1ai9MWDNXOTduM0pEazJ1bWptVTRRbGw5N1F4?=
 =?utf-8?B?cjN3bjl1KzB3cCtLODhJRi9abDZjT3NlKzY4aFgvM1NzeHZhTE9sZWZsT2xO?=
 =?utf-8?B?Y2tNU0xGbzkyQm0xT3dNWHZtK1VhVEdvdkVoUm1uODhJenhXaFlVd2lNT2NJ?=
 =?utf-8?B?NEdEVFRRL2dueW82T3FtTHpsUkh1QVAxNDNxUXFzdWpMZ1BKUURxbE51bVVu?=
 =?utf-8?B?SHFQVW9ndUFyQWxZV2VmMFdOb242TWtvekRBVXBiNWFGWVVia21UL2dqcTVV?=
 =?utf-8?B?aEt1VVRMaHhLNzhSTUZjbUtTRUV6NmhnOG90NlVUb3JnQUpPN0lJYmwxZjBp?=
 =?utf-8?B?RnRHT3dpOEgrOWpvOGhGL2ZJTzNkTVpoZnN4dnA4NHdBWUFLUTNBWkRiMita?=
 =?utf-8?B?ZEdmMXJ0ZnVLOHlCL0hXWkpXRklPNGRBcWsydUJBUWZnMHU1dTdIaG5SZ2JT?=
 =?utf-8?B?VjNLSDdoQlhkN0YwT1F4Mng2ZDFnTkxXbDdxL0dTWk9KMTlZR25mbS9jMllU?=
 =?utf-8?B?NmpUMmxQWXFyYnhYc0JRcXlyMHFhSWtkc3YydCt1NzZOanhOMWdETkhjZzl2?=
 =?utf-8?B?M21JNCtUdHAxNDZkSlRUZTdrTWRKTzd4Y2gyR09oeTVidVNQQ0pVMVBPWDdz?=
 =?utf-8?B?M0V4anh5YUdsZTdRSmRhNkx4UC81SXBFVERmTEtOWXVVcnNVUnNFZnNNYkFj?=
 =?utf-8?B?dFhKbEZUZzVHaERZWUdzNlVhSEM3R3pjK2NYU3NwZUZDTW9uOGl3MzNpTS9K?=
 =?utf-8?Q?8BseZyvqOlMp+7iq7YGHV41QuORiUC1aJhGbH0vy/A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cHpUSlRlcVNxWmk3c1Jtb2E3TFhTdXJ0Z3p5SVdnMFgrSW5WekZCL0IzYUNT?=
 =?utf-8?B?cGJYaU9WdTFlTkNoeWNybHIzN016SVhseXZyQUM5WVpTNVNOQzhnbCtRcGtu?=
 =?utf-8?B?R2ZoNzVvV1hLbGF1TTRtOFJjaVpaeGJvVnY0aFpaWHZ0bmlOYSsyMUFoL0V4?=
 =?utf-8?B?UzdSbHlJVkVmZHpqSWdldG5mQ3duY1NkNXVrYStyNmNyZ1IvaWFtSmRmdklp?=
 =?utf-8?B?Wnl4QUo1NGxHWE91Q0RpeWk4Y0dxVW1SaWV4MEN3SWJoZVZjMzNyMTJDZ0pu?=
 =?utf-8?B?emtHQXJybTVwencyc2hGdHVuUiszUlUyVnVVS2FqRENRMFRuMnJ1dFJXUmYw?=
 =?utf-8?B?dkUwQktkRCtaWGQwcUREbjFFT21Mb0lBdDZvZ3dUM0E5bCs0Zm9IbXl2eHdU?=
 =?utf-8?B?R1FLbU5CR0VmNFVmRzZ4dmJYalJUaWp3bjFGYlFhVzNrR2tPUDBXT0VkbDNJ?=
 =?utf-8?B?MTFGd2RkT2xocllDSnEvaDM3NnNub1V2dEVNVnFjM3I2TW1hNlpycWxnTlNq?=
 =?utf-8?B?ZEpsUk4wVjdHUU5PZWVEVDhxbm9lVVNtbkJaSXN3MUVGbDZBaXV1TzY3SEdK?=
 =?utf-8?B?SW54bS9EajlET2VKQzJDMnJENWRQdmVwWmZjN1c0VUN6WFJhOWVrT1RrV0h3?=
 =?utf-8?B?Vng3cmIzRE9JZFZyNDExZ0tsbTFlK2NpTEtoM3lPR0ZYanp3VXExU1JTOXpr?=
 =?utf-8?B?VzNpTjcrYllodjFUQ2JTRzlQNDduSjZyR1hRV0JTeTB6ZDJxaWdSVnJDSnZM?=
 =?utf-8?B?b1phTE5aUkJreG9OZjNSUEFLNUxmWFBzVnFQdWVqUXhqclRUYzdRSkJjYnlk?=
 =?utf-8?B?a0VQRy92TVhZbEhrZmhUaS9IVW9vWWdlNFc3NEh2UVNjVmRuTy91THZYSnFE?=
 =?utf-8?B?dXVWYmQ4NUNySUpLNzBtWExzMkphRFdHbDQyaXQyM1A5L204SXJlZEZ2NkF5?=
 =?utf-8?B?aU1FcDNHTFdNYWs0QVNmZjNKUzZWeWNOc1AwWS9pbDZGRHI0TFhVVkdVTXE2?=
 =?utf-8?B?N0F6ZXJZSlN2a1g1V3NKMldGREpFNVM5ZWFwY05ETkQ4M0tVNmpxRy9QZDlx?=
 =?utf-8?B?bFZjQzVKb3c1VHJSTEhyamJFMTBNUmFsMmhqdXFtQk0rNkZCbExxZGM0SkFP?=
 =?utf-8?B?bWkwVVhiNFJvQXBYVC9Ub2xkaHYzVW1iMnVveHFDVm8vcE44SHZ2QWdDajRY?=
 =?utf-8?B?M0NySDFST2RRMTlsU2hGVmtES2phRkc5NXdrcGtoNnhnTWlmZGxFUjB2MHRD?=
 =?utf-8?B?dmwzOGY0TmFKc3JaZk5qWEFaVzVXN29VVGtmK3VOMWE3ZW4vSThuSHVFWHM0?=
 =?utf-8?B?RnE3RFV2TjVWTTRnRElNMGdvOGZ6WnNKU0RYMUg2MHNPRUl3eitEcXNNZmZW?=
 =?utf-8?B?ZUdKa0JwdVVKbzZBK3RJUlg1UVpvdTRsdkFxZmF4SVdkQ1ExRXgxWVU3U2xi?=
 =?utf-8?B?eWxEajRtV3p3bDd2VDZFK0lmUmRMM3JzY21zOXlJckRqZmZzTUUvREp5NHBa?=
 =?utf-8?B?WElZTGtXRlRycVB6UFVTOWM2SEZ6TEkxMHlST2E0TkhTYnE0a0tYQXVhLzFt?=
 =?utf-8?B?aWVJRlVmb0JQZGtpTzF6b0M1UWR6MWNRbm5BdXNLNlZ6RlZ3QzJBcm91eFZl?=
 =?utf-8?B?eTdacFpjclA3OTlOMUlBZHNHSTNsR3dZakpCdHV3SkkrNFhWeXFPWDBEUU01?=
 =?utf-8?B?SktxSjdXaWMvVTdPcEFwbi8xMFhBMWthZHROa3BRRWsvMENGaTNGckdsZnhN?=
 =?utf-8?B?U2h0aS95S1JkbmE3dXdYZmYrRXF5eUM5TEdYai9RcHFiTDRJZGdWOFdDOWV5?=
 =?utf-8?B?aTc3ZTVOY3NzdlF0OHZMVU15cTFPZ0xHWWFPdlNlRXpnaUFyK0pKUVc5aXpG?=
 =?utf-8?B?dS9Ob3d4Qmg5bkx1blRYWHZwUGNhdUZFSFJNb1JZZWE4UUJtMUlidTlCM05D?=
 =?utf-8?B?MGNoVmhPS2pLVlBTaG1Mb1lYdm1ua25YZGx4NUVUR25MUUVJVmtWTFM3Tm1G?=
 =?utf-8?B?Um02NjkwUUdJczF4bXlDSEs1VHBlRzNJVFdUQWtGMTlzWGtsclozOUNORjNp?=
 =?utf-8?B?UUdHZWE0aklhcW1YM3JYUlE4MlN1aUN0MFJ3bEZqbURNeWVpNS9rOFRkV2VJ?=
 =?utf-8?Q?iF0o=3D?=
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
	wYM4D8AgcUr6kZD5StG0BZdC//4Sp3XsOZuQLIWu0aO8D3Oe9sdcm/TnrVGLmka2LijASPdAFYZ9ez1xxCkMIDDQp8845QZ3MbJT7eH84gyrSY9dlOOFjuqdXx1MGhiVWZshh+kei0fQbaj1la1GGzpY9MR9Femxd6FQqkNwUm2XH9lyeV/77GbxIXUhp4vnXMLkc/Bqsf4cAacW6YHu5e29Q5MpMOujP8MIiEYGHpPtHWYTKRMBMkHLeC2VpENLsG7DNsfwPVL7CMFq8J52dg0RK7OwmUKrVV89Lg/seftsM/6uywZb1qa+Cll8N/757B42tojqk9syODvAW+qIwR+QjN2hDCEI4ueBA6veGVw0yWQ9FcZmOFzPx9O7AyvtxPtqKrUx9TsqHEjcJZt0E/nPeCqqB106ZcCKIbhYk16YHlo+WT6cDbYOo4oPpGgrBigvNrLgEBMFLxrZUjvB/XLXHXz6LmOU9jerhvsAS8jr/AFVm9SsgFP4C4z88thWqUnnvaoCYlIEGHepSfxtua9+A0lPRiVcqCcqFivYnlBjqQwA7I9Ve2RaI33PVco7YrIaf2MeCFrdUIEEkfN1jVMSxOOe1SWP6ppxqq2JrpoxynAgn6LarFDE0n5bGeMP
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12391ce6-733e-4a59-1d4e-08dd3271c7af
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2025 18:57:21.9290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5kQtox23ZrXX3fmo4P68iK42BPzxGOrFNwCgMqtruT4GXAuAoPJwrzoMHwrEPa6815aN8O/VFwAS6r1PNT2l1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3653
X-Proofpoint-GUID: xLu3f1wbhuXLbPlUBFfHjyOh9gzdl_I_
X-Proofpoint-ORIG-GUID: xLu3f1wbhuXLbPlUBFfHjyOh9gzdl_I_
X-Sony-Outbound-GUID: xLu3f1wbhuXLbPlUBFfHjyOh9gzdl_I_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-11_08,2025-01-10_03,2024-11-22_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIExhbmRsZXkgPHJv
YkBsYW5kbGV5Lm5ldD4NCj4gDQo+IE9uIDEvMTEvMjUgMDI64oCKNDAsIE1hcmtvIEhveWVyIHdy
b3RlOiA+ID4gQW0gMTEu4oCKMDEu4oCKMjUgdW0gMDA64oCKMTUgc2NocmllYiBSb2IgTGFuZGxl
eTogPj4gT24gMS8xMC8yNSAxNjrigIo0NiwgTWFya28gSG95ZXIgd3JvdGU6ID4+Pg0KPiBTbyBJ
IHRoaW5rIGl0IGlzIHdvcnRoIHRhbGtpbmcgYSBiaXQgYWJvdXQgdWRldiBhbmQgb3B0aW9ucyB0
byBkZWFsID4+PiB3aXRoIGl0IGJ1dA0KPiBPbiAxLzExLzI1IDAyOjQwLCBNYXJrbyBIb3llciB3
cm90ZToNCj4gPg0KPiA+IEFtIDExLjAxLjI1IHVtIDAwOjE1IHNjaHJpZWIgUm9iIExhbmRsZXk6
DQo+ID4+IE9uIDEvMTAvMjUgMTY6NDYsIE1hcmtvIEhveWVyIHdyb3RlOg0KPiA+Pj4gU28gSSB0
aGluayBpdCBpcyB3b3J0aCB0YWxraW5nIGEgYml0IGFib3V0IHVkZXYgYW5kIG9wdGlvbnMgdG8g
ZGVhbA0KPiA+Pj4gd2l0aCBpdCBidXQgYWRhcHRpbmcgdGhpbmtzIGEgYml0IHRvIHRvZGF5cyB3
b3JsZC4gSSdtIGN1cnJlbnRseQ0KPiA+Pj4gcmVnaXN0ZXJpbmcgZm9yIHRoZSB3aWtpLCBtYXli
ZSBJIGNhbiBzZXR1cCBhbiBpbml0aWFsIHBhZ2UgYXQgc29tZQ0KPiA+Pj4gdGltZSAuLi4NCj4g
Pj4NCj4gPj4gYnVzeWJveCBtZGV2IGlzIGEgbG90IGxpZ2h0ZXIgd2VpZ2h0LCBhbmQgY2FuIGRv
IHByZXR0eSBlbGFib3JhdGUgdGhpbmdzLg0KPiA+Pg0KPiA+PiBodHRwczovL3dpa2kuYWxwaW5l
bGludXgub3JnL3dpa2kvTWRldg0KPiA+Pg0KPiA+PiBodHRwczovL2dpdGh1Yi5jb20vZmZmN2Qx
YmMvbWRldi1saWtlLWEtYm9zcw0KPiA+Pg0KPiA+PiBUaGUgdGhlb3J5IHRoZXNlIGRheXMgaXMg
eW91IG1vdW50IGRldnRtcGZzIGFuZCB0aGVuIHVzZSBtZGV2IHRvIGFkZA0KPiA+PiBzY3JpcHRh
YmxlIGJlaGF2aW9yIHRvIGRldmljZSBpbnNlcnRpb24vcmVtb3ZhbCBldmVudHMgdmlhIG5ldGxp
bmsNCj4gPj4gbm90aWZpY2F0aW9ucy4NCj4gPj4NCj4gPj4gUm9iDQo+ID4NCj4gPiBIZXkgUm9i
LA0KPiA+DQo+ID4gdGh4IGZvciB0aGUgaGludC4gU291bmRzIGdvb2QhDQo+ID4NCj4gPiBIb3cg
aXMgdGhlIGVudW1lcmF0aW9uIG9mIGNvbGQgcGx1Z2dlZCBkZXZpY2VzIHJlYWxpemVkIGluIG1k
ZXY/IElzIGl0DQo+ID4gc2ltaWxhciB0byB1ZGV2IHRyaWdnZXJpbmcgYWxsIGRldmljZXMgaW4g
dGhlIGNvbXBsZXRlIGRldmljZSB0cmVlPw0KPiANCj4gbWRldiAtcyB3aWxsIHNjYW4gL3N5cyBm
b3IgY3VycmVudCBkZXZpY2VzLCBpdCBjYW4gYmUgcnVuIGFzIGEgaG90cGx1Zw0KPiBoZWxwZXIs
IGFuZCB0aGVyZSdzIG5ldGxpbmsgc3VwcG9ydCBzb21ld2hlcmUgYnV0IEkndmUgbmV2ZXIgdXNl
ZCBpdC4NCj4gDQo+IGh0dHBzOi8vYnVzeWJveC5uZXQvZG93bmxvYWRzL0J1c3lCb3guaHRtbCNt
ZGV2DQo+IA0KPiBUaGUgaG90cGx1ZyBoZWxwZXIgZG9lc24ndCByZXF1aXJlIGEgcGVyc2lzdGVu
dCBkZW1vbiBsaWtlIG5ldGxpbmsgZG9lcw0KPiAob3IgdWRldiksIGF0IGJvb3QgdGltZSB5b3Ug
Im1kZXYgLXMiIHRvIHNjYW4sIHRoZW4gd2hlbiB5b3UgcmVnaXN0ZXIgYQ0KPiBob3RwbHVnIGhl
bHBlciB0aGUga2VybmVsIHNwYXducyBhIG5ldyBwcm9jZXNzIHdpdGggZW52aXJvbm1lbnQNCj4g
dmFyaWFibGVzIHdoZW5ldmVyIHRoZXJlJ3Mgc29tZXRoaW5nIG5ldyB0byBkby4gVGhlIGRvd25z
aWRlIGlzIGlmIGEgbG90DQo+IG9mIGV2ZW50cyBjb21lIGluIHJhcGlkbHkgaXQgY2FuIHNwYXdu
IGEgbG90IG9mIHByb2Nlc3NlcyBpbiBwYXJhbGxlbA0KPiB3aGljaCBtYWtlcyBzZXF1ZW5jaW5n
IGRpZmZpY3VsdCwgd2hpY2ggaXMgd2h5IHRoZSBuZXRsaW5rIEFQSSBleGlzdHMgYXMNCj4gYW4g
YWx0ZXJuYXRpdmUsIGJ1dCB0aGF0IGRvZXNuJ3QgcmVhbGx5IGhhcHBlbiBpbiBzeXN0ZW1zIEkn
dmUgcHV0DQo+IHRvZ2V0aGVyLCBzby4uLg0KPiANCj4gSSB3cm90ZSBzb21lIGludHJvZHVjdG9y
eSBkb2N1bWVudGF0aW9uIGFib3V0IHRoaXMgYmFjayBpbiAyMDA3LiBJdCdzIGENCj4gYml0IHN0
YWxlLCBhbmQgbmV2ZXIgUkVBTExZIGdvdCBmaW5pc2hlZCwgYnV0Li4uDQo+IA0KPiBodHRwczov
L2xhbmRsZXkubmV0L2tkb2NzL2xvY2FsL2hvdHBsdWcyLmh0bWwNCj4gDQo+IFRoYXQncyB0aGUg
Y29udGV4dCB3aXRoaW4gd2hpY2ggc3lzZnMgaGFwcGVuZWQuDQo+IA0KPiAvZGV2IGFuZCAvc3lz
IHNlcnZlIGRpZmZlcmVudCBwdXJwb3NlczogL2RldiBzaG93cyB0aGUgZGV2aWNlIGRyaXZlcnMn
DQo+IHZpZXcgb2YgdGhlIHN5c3RlbSwgZnVsbCBvZiBkZXZpY2VzIHRoYXQgZG9uJ3QgYWN0dWFs
bHkgZXhpc3QgbGlrZQ0KPiAvZGV2L251bGwsIG9yIGZpdmUgZGV2aWNlcyBmb3Igb25lIHBpZWNl
IG9mIGhhcmR3YXJlIChwYXJ0aXRpb25zKSwNCj4gbWVhbndoaWxlIGEgZGV2aWNlIHRoYXQgc2hv
d3MgdXAgYnV0IGRvZXNuJ3QgaGF2ZSBhIGRyaXZlciBib3VuZCB0byBpdA0KPiB5ZXQgd29uJ3Qg
YmUgaW4gL2RldiBhdCBhbGwuIFRoaXMgaXMgaGFsZiB0aGUgcmVhc29uIHRoZSBvbGQNCj4gZGVt
b24tbWFuYWdlZCAiZGV2ZnMiIGZhaWxlZCwgaXQgd2FzIENPTkNFUFRVQUxMWSB3cm9uZy4gKFRo
ZSBvdGhlciBoYWxmDQo+IHdhcyBpdCB1c2VkIGNyYXp5IHNvbGFyaXMgbmFtZXMgZm9yIGV2ZXJ5
dGhpbmcgc28gcGVvcGxlIGxvb2tpbmcgZm9yDQo+IC9kZXYvaGRhMSBjb3VsZG4ndCBmaW5kIGl0
IGFuZCBoYWQgdG8gZGVhbCB3aXRoIHNvbWUgOSBjaGFyYWN0ZXIgbG9uZw0KPiBtb25zdHJvc2l0
eSBpbnN0ZWFkLiBQbHVzIExpbnV4IGlzbid0IGEgbWljcm9rZXJuZWwgc28gZXhwZWN0aW5nIGEN
Cj4gdXNlcnNwYWNlIGRlbW9uIHRvIGJlIG5lY2Vzc2FyeSBmb3IgL2RldiB0byBfZXhpc3RfIHdh
cyBqdXN0IHNpbGx5LCBhbmQNCj4gYWxzbyBsZWQgdG8gc29tZSBwcm9ibGVtcyBib290aW5nIHRo
ZSBzeXN0ZW0gYmVjYXVzZSB3ZXJlIGRvZXMgdGhhdA0KPiBkZW1vbiBnZXQgaXRzIGluZm9ybWF0
aW9uIGZyb20sIGVoPykNCj4gDQo+IHN5c2ZzIGlzIGEgaGFyZHdhcmUgdmlldyBvZiB0aGUgc3lz
dGVtLCB3aGVyZSAvc3lzL2RldmljZXMvcGNpMDAwMDowMCBpcw0KPiBmdWxsIG9mIHdoYXQgYnVz
IHByb2JpbmcgZm91bmQsIGFuZCAgL3N5cy9ibG9jay9zZGEvZGV2IGNvbnRhaW5zICI4OjAiDQo+
IChtYWpvciBhbmQgbWlub3IgbnVtYmVyKSB3aGVuIGEgZHJpdmVyIGJpbmRzIHRvIHNvbWV0aGlu
ZyBhbmQgZ29lcw0KPiAibWluZSIsIGJ1dCBzb21ldGhpbmcgc3RpbGwgaGFkIHRvIG1rbm9kIHRo
YXQuDQo+IA0KPiBkZXZ0bXBmcyBpcyBhIHN5bnRoZXRpYyBmaWxlc3lzdGVtIHRoYXQganVzdCBE
T0VTIHRoYXQsIHdoZW4gYSBuZXcgImRldiINCj4gbm9kZSBzaG93cyB1cCB1bmRlciAvc3lzL2Ns
YXNzIG9yIC9zeXMvYmxvY2sgaXQgY3JlYXRlcyB0aGUgYXByb3ByaWF0ZQ0KPiBjaGFyIG9yIGJs
b2NrIGRldmljZSB1bmRlciBkZXYgd2l0aCB0aGF0IG1ham9yL21pbm9yIGFuZCB0aGUgc2FtZSBu
YW1lDQo+IHRoZSBkaXJlY3RvcnkgdXNlcyAod2hpY2ggaXMgcHJvdmlkZWQgYnkgdGhlIGRyaXZl
cikuDQo+IA0KPiBPaCwgInN5bnRoZXRpYyIgZmlsZXN5c3RlbSBpcyBvbmUgb2YgdGhlIGZvdXIg
dGltZXMgb2YgZmlsZXN5c3RlbTogYmxvY2sNCj4gYmFja2VkLCBjaGFyL3BpcGUgYmFja2VkLCBy
YW0gYmFja2VkLCBhbmQgc3ludGhldGljLiBJIHdyb3RlDQo+IGRvY3VtZW50YXRpb24gYWJvdXQg
dGhhdCBhIHZlcnkgbG9uZyB0aW1lIGFnby4uLg0KPiANCj4gaHR0cHM6Ly9sYW5kbGV5Lm5ldC90
b3lib3gvZG9jL21vdW50Lmh0bWwNCkhleSBSb2IsIFRoaXMgaXMgYSBncmVhdCByZXZpZXcgb2Yg
L2RldiwgL3N5cyBhbmQgdGhlIGRpZmZlcmVudA0Kd2F5cyB0aGF0IC9kZXYgZ2V0cyBwb3B1bGF0
ZWQuDQoNCkZvciBhIGxvdCBvZiBlbWJlZGRlZCBMaW51eCBkZXZpY2VzLCB0aGUgb25seSBidXMg
d2hlcmUNCm5ldyBpdGVtcyBjYW4gc2hvdyB1cCBkeW5hbWljYWxseSBpcyBVU0IuDQoNCkkndmUg
YWx3YXlzIHRob3VnaHQgdGhlIGJlc3Qgc29sdXRpb24gKGluIHRlcm1zIG9mIGJvb3QgdGltZSkN
CndhcyB0byB1c2Ugc3RhdGljIG5vZGVzIGluIC9kZXYgZHVyaW5nIGVhcmx5IGJvb3QgKHRoYXQg
aXMsIGp1c3QNCm1rbm9kIHRoZSAvZGV2IG5vZGVzIGluIHRoZSByb290ZnMgbWFudWFsbHksIGFu
ZCBoYXZlIHRoZW0gYmUgcHJlc2VudA0KYmVmb3JlIHRoZSBrZXJuZWwgZXZlbiBydW5zKS4gIE5v
IGR5bmFtaWMgZGlzY292ZXJ5IG9yIGJvb3QtdGltZQ0KcG9wdWxhdGlvbiBvZiAvZGV2IG5lZWRl
ZC4gIFRoZW4sIHNvbWV0aW1lIGxhdGVyLCB1c2UgZWl0aGVyDQptZGV2IG9yIGRldnRtcGZzIHRv
IGFjY3VtdWxhdGUgKGFuZCByZW1vdmU/KSBvdGhlcg0KcnVudGltZS1wbHVnZ2VkIGRldmljZXMu
ICBUaGlzIGNhbiBiZSBkb25lIGFmdGVyIHRoZSB0aW1lLWNyaXRpY2FsDQpwaGFzZSBvZiBib290
aW5nLg0KDQpEb2VzIHRoaXMgb3ZlcmFsbCBhcHByb2FjaCB3b3JrLCBvciBpcyB0aGVyZSBzb21l
IGluLWtlcm5lbA0KY29ubmVjdGlvbnMgdGhhdCBtYXkgYmUgbWlzc2luZyBpZiB0aGUgZHluYW1p
YyB0b29scyBhcmUNCm5vdCB1c2VkIGZyb20gc3RhcnR1cD8NCg0KVGhhbmtzLA0KIC0tIFRpbQ0K
DQo=
