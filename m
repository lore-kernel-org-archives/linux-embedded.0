Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ABE1547C0;
	Tue, 10 Mar 2026 19:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773172265; cv=fail; b=Y0GgbnxxUMuyJf6nMUQA18eXmBoeqI6bD5I5ZnzSBX7g8maMKBa7ux6LE5Us/wWL3Xx9A0plG3tWGmtsugh8XvVHDA7I20oJGehYBL93LylYVdFnhktZxJVJ/fqGd2Pj07rvCnk8hYNG6oJd1sF04OhxAsGMocVKA811vcUd3hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773172265; c=relaxed/simple;
	bh=rBl3+1A/HmyfpFC8wj/3PJ07ewCtE30i+KKZALKGAwA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cJGe+z2eR92bfpY8Pfxn9MkXudDK0v+Ezs9MGp/fuVDUlAP7E1N/U4VBESJDTzxwfBetWLTT16HZlURHYTAfEQ235W0xzNI19MOt5P6erdMN+JLfqCNCbn+90TfUpv6v210AJHeu0pzTftsvYqUlHuhuS19c94HADxVobtdxMWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=ehPpV0jC; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="ehPpV0jC"
Received: from pps.filterd (m0209319.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJHxeG2548876;
	Tue, 10 Mar 2026 19:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=rBl3+1A
	/HmyfpFC8wj/3PJ07ewCtE30i+KKZALKGAwA=; b=ehPpV0jCgIsZxSgdUQ4xVyH
	cQPX088rr5a34N/VkXPlv1a2Oz2nYCDBdl0sXIGUnPihUnQeEmW1wMPPXjzgeUul
	C7c7ZqOy0qsmoGhKa6ypq2djkCspIhV4tx1KqSUlxnBb56HgMIBC0Gtwr+ZhNKwC
	T42er0wSSJmO926YUWdQ45M8c8Tv40QVjJ4VCoLuhvalQ4Z3sShTOEpkthJaktSb
	X/wTM280FYLErvmzP1Kn0VLZzxK/33YoDchpHK93tGMinK6uHdLUG5YCEIenBO+b
	AjxMSdn4jqLAt5zV91mzoqeqKzDEHThOF521C2ak2ORie3g0gyvANtm6eL1dfZA=
	=
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010063.outbound.protection.outlook.com [52.101.61.63])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4crcytks2w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 19:17:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MymMeFA1Z8+UE4PJ/llSVe6yoFcd3c8Y3B1C5oxgxDldYzuXz7vB/7yp+Em2RVnvSXsnleQEsoramfWxd27aX6ADLdvaxK2LuxYaRsV3euIYnPgnAQK5CIP2JCvuh0H8wqmsI2XYtt4qPPkb5bhTJzMaP93+XLoIKHK4Ub5DbG0v6oOfRVWpO7fOKm9x55nzz1UI9skfJU7uyZ+vVFZ7QtizGBm16tyeAtY8lZKA2uCYJwNY5ENiunRBegtJYlk5X089DBgAjFMf03Ww870CBWAw4Eh6xMNJO9Mof2UYaqFyb9SE75vMtX3XouISbE/bAXFO2mMpnWwHR4bp0uFrwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBl3+1A/HmyfpFC8wj/3PJ07ewCtE30i+KKZALKGAwA=;
 b=J7jgTVPi7KiIZkNtxofeigT9UcI9tAX9+WCqlgKMIenFVuH7EtZcXUb9n49FxQOGk37LeU7ZbvXVcrPBt3wpysEl4w/jOU+d1Ech3ePdY5wakc6ExkbmPdnZORDluj8UgbxfYykKuA2gCI5pNA/Cz4MJq+X2JjnSuRgAvuFgfAMetNQIvjETcqThtlQh8MKZWsf0AILbGlbAe6EcfOqdX0P72A9XsQINT7odob4l5J16S7V56j16kU6VdToZh0zPC6NnAf20xdzP9gwie6c2f/kaeWESKFfjHdF1gxKkw31qdXq6DgLMCYlRi2tCi2s2GJPUxXrjWOc4O8nUaZX3Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from SA1PR13MB5634.namprd13.prod.outlook.com (2603:10b6:806:231::12)
 by CH2PR13MB3653.namprd13.prod.outlook.com (2603:10b6:610:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 19:17:55 +0000
Received: from SA1PR13MB5634.namprd13.prod.outlook.com
 ([fe80::f659:9918:27ca:ffed]) by SA1PR13MB5634.namprd13.prod.outlook.com
 ([fe80::f659:9918:27ca:ffed%6]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 19:17:55 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Shashank Balaji <shashankbalaji02@gmail.com>
CC: "pmladek@suse.com" <pmladek@suse.com>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        John Ogness <john.ogness@linutronix.de>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "francesco@valla.it"
	<francesco@valla.it>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Thread-Topic: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Thread-Index: AQHcmuexSh6ktdFaZUimYV7dOjz0LrWmnjCAgAGwW2A=
Date: Tue, 10 Mar 2026 19:17:55 +0000
Message-ID:
 <SA1PR13MB56346B5572E56FAD60CC7BB8FD46A@SA1PR13MB5634.namprd13.prod.outlook.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com> <aa8C_1eUDoSgMGIv@fedora>
In-Reply-To: <aa8C_1eUDoSgMGIv@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR13MB5634:EE_|CH2PR13MB3653:EE_
x-ms-office365-filtering-correlation-id: da7b0139-9604-46bd-e5e6-08de7ed9bbad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 7fBk1OjUQ9a4E93h707+YaJtX99/TYknX3uRZZrVIapDzNtPWMOE7n/u6hgmf7YiFKhQmJldm26CWknYagL0kSaplwFo4prIH53BRRlaoyvEMYIrF65auV77snwAqdU/xnHtBW4l/+VXz9nEcuoa3XXH1vGK5xaQl8j48c/6BGn978S/I51UavDZId8LpX92R+llyBOTyATWn7XVRAyHpixEAA/lXd0S0xinkRBr4e48RQJHOVdWSjO5ZLTI5gcllKA1V9w7XqVPR5Bx550unfGT1Fe5lL07O3g8nXMrJFP/1F/lpb0Ir/A9eBOc3BPNDBSOIKmmOcySq4sO6osd4T9VCddktwIxx5EKgMWohDLTA1hbTvZkR8zc4VCOHNT5fB9cgsStwv0VaOMharM8VFdqvgX2rKjITsYimUgq674pVv0Hw9QOkF1lCZ/Ti3qQgH5rWZPWCJQiqNgVSBNt0lFJRakwNabNqGDpDS6OydtNYLpzUS5ujiHLiNZFX3O3GmgZ5cKWWhb90P2Yi6BP1F4oHkQt4sJKTlt+SKWaN/kmCLhQgUF24FXaS5KPmLrFy4rt7Xxgv1UDezkVWisFIsQBXR1hRWiiz6KERyskpbKDUEkcn3/eN2CVzQEdULbA1nEfDEYjim72NdZXe0fuJGwM+Bkqyk7U4yfO+NkXVwqUjh+SVSdIFB/ELgnnL//sXYRVfBXhU2l7B9lRRQIHYcVCxfJJbGJ3hkQxC1rwzv6SxN3rs2U/SflhJCYvQu/thL0A3Jrh3cxYvhzWG5hk/X+K/GwyEDuGWMk3YZN3kkE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR13MB5634.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TFJkdnJiN0I2STZJSEg1djhsVnlla0E4M3ZHS0U3NE9ya0ZUZGNqckF4dHIv?=
 =?utf-8?B?Q1ZsQXVrSXMwTjhpanlFK1pOT1NEelZlMFAvNDN6NmdVZXVzTXBFTkFOOHRp?=
 =?utf-8?B?M2piSnJCcWtkeDNtSmFxRDdBRUhlWWVGeXJXZ3FpWjdHd2lUaEpjY2tmNmVv?=
 =?utf-8?B?YUViRlFXZ3NWdVdsS2o2V0lscERvSnhxbDUyR3NqR3dBV1BQQklEYitXQkJ1?=
 =?utf-8?B?c2VjVTBzZGM2enFQcGZzbDN5T0ZHbUx6Y1Y5a1hPWEF3d0F4NmJ3OGQrUEpu?=
 =?utf-8?B?RG56WG5aM2ExRmJ1SGhKeEdYbEVhaU5DZitySlExOTRSY0MyS2UrTGhPT2FB?=
 =?utf-8?B?QncvUUhRQ2NIQ0piZGdXV2dBNUVrQ1U3a3EvZHdpaS9XQm01Mk14alNObmlZ?=
 =?utf-8?B?eFNyS3RBNlI0YUJvSmwwakhHK3JJOE9HQ3pwaDJjbExBRWt6Z0RlMW5SQVRB?=
 =?utf-8?B?bVRWNnJaTnl6VThVM1NZekplTGRRUnNUR0hpTXRaRUE4U3hUL0REcjl4V21k?=
 =?utf-8?B?TnN4ejZQT0E3TEE0bTFKMURZR0djYjE0QXN3Y0crNk5ZMUZiUlFQSUU5aGRU?=
 =?utf-8?B?OWpkYlphUTBTQXE4WG5Od09CNTBFc1loUHBkcCtoTzNPZUNVNEtWalFXNkxr?=
 =?utf-8?B?UWdjRVl4TisrN1ZHWHpua0l6OUYzaytZanpDMHVONDhLVmlmZTJnYlpScEZl?=
 =?utf-8?B?aUZkRFlzV3lFWXB5SnVscW9KS21aTlB2Zk14cUR3bUkvcFl6ODhabDlQcXBF?=
 =?utf-8?B?VjlqYUMwdUlnazZLdnMyTjZYYVE0azV1b1hqTElKNG1LNlhYUVArS2pLS1Vk?=
 =?utf-8?B?c3IyZ3dnbmRONzIyckpxZlBQa2hjSXlkVjNEVjFUaC9XaThlWkFRc3RqeWNh?=
 =?utf-8?B?Mmx4Z2t6cFJkTzBHbGxwbWU4NlowVXQ2bi9Hc1ZuekNRRlN1NzRVOWFTWEtN?=
 =?utf-8?B?TTZtTFJSU2dxbmFjdW5PQWJ1aXRZVEw0RXFmK3FSVFVQa0kzMjJjN25NaGhL?=
 =?utf-8?B?dm5SSjJrenNEaDl2WHpRcEYzL2RkTDlaMjVaMSsvM3lBZ2tmNzBCbTBIUnd3?=
 =?utf-8?B?TEpocTNRaEJRWnUvMklwaDFWR2pVN1k0VWJRUE10d0RCZEEwWDNxcVpRcTFS?=
 =?utf-8?B?ZERHYklKQ2h3bkt6UUdadWZSREJrNVhvREU2WmdZQU5VQm9qY3hmTE13VEZu?=
 =?utf-8?B?alFLWDE1QmpNYllFNEpIYitqejJxakFJcnVyM2RCdEg0bTBoR2phUVh4Mkx3?=
 =?utf-8?B?alhFK0tlWkR0STZJMlFyY1ZLMjRObmNPcjU0MlVmTmttdTZRcXdmbnViT2c1?=
 =?utf-8?B?YnF6VlRxZlBRQk8wS3hUZ0FNMTlIT0NwWXRBSkJCUm82NFlPRHI4MUdxUThu?=
 =?utf-8?B?Tm9HaXY3UWdoWWw2b213dG1DTUliY1ZTOXFUa3E3NnZoWUhWcTZZOHZUeE5W?=
 =?utf-8?B?NDliVzZSSXQyLzRtMjlaV0s4N21Fc1pLZkpma05JaUZBWVYwQ2I2cWE1ZFR0?=
 =?utf-8?B?T0dOLzFBZkwvU21LU2FwTE9iTERGQzhGdkhKOUlLcjRtTWVmU2pQWEdpUThi?=
 =?utf-8?B?cmkveXdpaTlza3Fyd1dwSnZwV3BhbnNiRnNQbUYvcFpzbXRoMmtzUWpWL0h2?=
 =?utf-8?B?bytXbHZTTnZDUTdvdjNLeVMxV0JjU3Y4bFRJV0RVVUhiVERiQnJPdDg2ZGVv?=
 =?utf-8?B?NmlaQnFKV1Q5NG5wb3cxRGRiSkU1WWZ5YjFhZG1iWlUzUVdOUVVCYWpua3hF?=
 =?utf-8?B?SHErVVJtTzMrbkFKYUovTE5VRXNuTFptcUhIcGgvT2JpR0FYbHdFak02Z2tS?=
 =?utf-8?B?WkJqYVN0U08ydmo4VU1jaWU1Qjc1Q3VlUEtraUI0MEZsLzQ5cW1XR3JyaWRP?=
 =?utf-8?B?VGxDb1h0ZGxvdk40TlVKUFdqa2RiMFk4ak9VV25rcjF1ak1pQnlLbUtUbzBI?=
 =?utf-8?B?UlpKUzRoV3NYWDhuYnpuMU5KczdCMFRWT2wydDlKeW5vUSs5OXlsUUZxVjJR?=
 =?utf-8?B?Yy91WTFSWHMrS2czeURBY0pEY1NxY201K2hKRmptMWpIRnEyZ2xrZW1VbDVG?=
 =?utf-8?B?MWFvUVJ1U2V4SDFqSlV1WW1uK2FzengwU25MTXVsZUkybzhRWGYydGM2aDlN?=
 =?utf-8?B?ZEc0RDRoanJTdEkxOEtPLzdxNFdkVk05ZVhOdHhsbGhib3ZRUHJSMnJTNVRD?=
 =?utf-8?B?d0VNSUlrVWZQTGRrMng3OXNzRkRzaG51NEZ0V2lNeVAydW5sOWZXN1kwejdJ?=
 =?utf-8?B?U0JKM1liNzVMSjlZMFQrZkFRSWRxOG93N3BZbTBnNndkVDAxUGJZWDFXZnlZ?=
 =?utf-8?Q?I0KMJzOGd2+Sz7Lm69?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	jkZhK+Im6GgMzfyM+zlvemLEkzyKI9R2nP6sHsnUJxoXO1c6wa+NQEnvDO2UyWMdj4vRLvAAPum4O22S2A9/N5iMX5zDnk17jogcywOahXIJLdzEE/KuKuwNMmB4Zd5LExVp8x+Z+J0gKrZ46STgEf0l8We+YEAOMek+EgHbxuX1Z2Dx9+kUy5eCrjJ/puszz7B1jebZu7RvfZTc7Pp+CJv4AiqsEVVR/MmlDlFYZknPA5f/dl5aLIKXbGNtznqd5jh/yKGwo7KBD+xOImCPsuLnM+4DZP5ScVIVHhR9GZDDcKNcUmHp9B11mAZpO88mTaGKhIbyBCC94CDiRrwlhQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OyG6f7g7gkshbVckg0XhHIfQholqO96anNX2/bMdaVyDYABP6zAGgOCfKoL2x8db1bSjRtNAukQbDiNk8cHMQaGfyQmuRVTN6Ezo1bYmJ8IemMGJIfYfMv26DSR8jvJdSEqAs+xkux9H9mydNVkell5DI3IcPZWPdewIjbotJzleG3iJnvfiEcW0zpQaRnj8CZfmhi9xeTFv14TD+k9PEvsxRSKUQyraEfI/7ZQEn031XHs8loEA20b46Y1PWR5GHrGKWrLMBcg//S38T6wCLZDbwVjPQanDqYUpohoZah+5Y2FW1VV3KPZLmsV48LCJS4HuwtKhD7OmH44J/dewlYZCqDgTRR8m+57xVIZABiCPUfWt+Wm26LwzY8tJZXAXuP59/hxeZqHgZPopYASnDztdypnBx+XF5e/iqj3dIjySDwkPMceGOGguJqByH5qwHnCDs0ALtx0z8iKW6krguAbOgguvGh0tbpJgn2RY7qFQh4lg3/jyJNBFUUJrKqUKDGdUZXysiA+yoKvswP9+H3On/QnTS5MD6puKovdxcUjhR5aXYFYKCxYBEtw7T9H76WWf4sFl0ah3s9CAXGrNAIrwtVlCqLgq4oOYXE1WmWgQSTDDfcVRpOzVrqz7t9mi
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR13MB5634.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da7b0139-9604-46bd-e5e6-08de7ed9bbad
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 19:17:55.4752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tKiY4dbSVRy8mt6gHGCvDG22MKRLX0/J5Cc74z5tQRbjD13BiLBv1wEuU9UeDfuDpHMadEuy0x+E5JO2WwhriA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3653
X-Proofpoint-ORIG-GUID: d2jEcSKkCOwXt2pkQaNxOaWPAnb3H-yj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE2OCBTYWx0ZWRfX3PjaNEz0Lm44
 UMYBYxof9OnyOYmDutN8kFJ1oleEC22maeuW+CtLg2RnzPyLOugHu3dNVNU6j5uykTCyIBwMSgX
 nf88hg9maIn2KNSCvNEcfGnBjHHHRPnIsZMdq46cdFSLIQQdVNoy4JuVcCyWszp8EPDL1E0+2QB
 gOUjP8fP0Sn6XGnVxSQWQk9WxYpTUBVY9pTTKev4ani3uis8S5fFtJE77iOzPGWW/Xqv0PLRiZC
 s0Jvh/7kAjMTyVJa7y0MSwFId7GqSh+5OETdDOhvZMn5tFfS147wXCaa223il5TyNayUOht1Rnt
 zbt6B6ENKKAdKru9NJmnYFRehS6hW79GsXahJ4bHn6MtTsEdpfRst8z1Wpsp/QAkcq+OpAH7ljv
 6tSFS3t+hDqH89dkv0adFlBb8IXG8Mx/NOO6maxe8iz4pTkTpbNqbrknLCpQPCH10VzTJh3Ax6c
 S5eUn14watw7Ap0PXBA==
X-Proofpoint-GUID: d2jEcSKkCOwXt2pkQaNxOaWPAnb3H-yj
X-Authority-Analysis: v=2.4 cv=d5v4CBjE c=1 sm=1 tr=0 ts=69b06e67 cx=c_pps
 a=oA0oAqHEqr9/hfEU5FnDzA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=6Vn1QVPt8UGdu3r8PAnt:22 a=pGLkceISAAAA:8
 a=u9_HPgyXAo7B3JEGo5MA:9 a=QEXdDO2ut3YA:10
X-Sony-Outbound-GUID: d2jEcSKkCOwXt2pkQaNxOaWPAnb3H-yj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhc2hhbmsgQmFsYWpp
IDxzaGFzaGFua2JhbGFqaTAyQGdtYWlsLmNvbT4NCj4gSGkgVGltLA0KPiANCj4gVGVzdGVkLWJ5
OiBTaGFzaGFuayBCYWxhamkgPHNoYXNoYW5rYmFsYWppMDJAZ21haWwuY29tPg0KDQpUaGFua3Mg
Zm9yIHRoZSB0ZXN0aW5nISENCg0KPiANCj4gLi4ub24gdG9wIG9mIHJjMyBvbiBhbiBBTUQgUnl6
ZW4gNyA0ODAwSCBsYXB0b3AuIFRoaXMgcGF0Y2ggY29uZmxpY3RzDQo+IHdpdGggdGhlc2UgY29t
bWl0cyB3aXRoIHRyaXZpYWwgZml4ZXM6DQo+IA0KPiAwMzJhNzMwMjY4YTMgaW5pdC9tYWluLmM6
IHdyYXAgbG9uZyBrZXJuZWwgY21kbGluZSB3aGVuIHByaW50aW5nIHRvIGxvZ3MNCj4gNjAzMjVj
MjdkM2NmIHByaW50azogQWRkIGV4ZWN1dGlvbiBjb250ZXh0ICh0YXNrIG5hbWUvQ1BVKSB0byBw
cmludGtfaW5mbw0KPiA0OTlmODZkZTRmOGMgaW5pdC9tYWluOiByZWFkIGJvb3Rjb25maWcgaGVh
ZGVyIHdpdGggZ2V0X3VuYWxpZ25lZF9sZTMyKCkNCj4gDQo+IENvbW1lbnQgYmVsb3cuDQo+IA0K
PiBPbiBUdWUsIEZlYiAxMCwgMjAyNiBhdCAwNDo0Nzo0MVBNIC0wNzAwLCBUaW0gQmlyZCB3cm90
ZToNCj4gPiBEdXJpbmcgZWFybHkgYm9vdCwgcHJpbnRrIHRpbWVzdGFtcHMgYXJlIHJlcG9ydGVk
IGFzIHplcm8gYmVmb3JlDQo+IAk8c25pcD4NCj4gPiBkaWZmIC0tZ2l0IGEva2VybmVsL3ByaW50
ay9wcmludGsuYyBiL2tlcm5lbC9wcmludGsvcHJpbnRrLmMNCj4gPiBpbmRleCAxZDc2NWFkMjQy
YjguLjVhZmQzMWMzMzQ1YyAxMDA2NDQNCj4gPiAtLS0gYS9rZXJuZWwvcHJpbnRrL3ByaW50ay5j
DQo+ID4gKysrIGIva2VybmVsL3ByaW50ay9wcmludGsuYw0KPiA+IEBAIC00Niw2ICs0Niw3IEBA
DQo+ID4gICNpbmNsdWRlIDxsaW51eC9jdHlwZS5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvdWlv
Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9zY2hlZC9jbG9jay5oPg0KPiA+ICsjaW5jbHVkZSA8
bGludXgvZWFybHlfdGltZXMuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkL2RlYnVnLmg+
DQo+ID4gICNpbmNsdWRlIDxsaW51eC9zY2hlZC90YXNrX3N0YWNrLmg+DQo+ID4gICNpbmNsdWRl
IDxsaW51eC9wYW5pYy5oPg0KPiA+IEBAIC03NSw2ICs3NiwxMyBAQCBFWFBPUlRfU1lNQk9MKGln
bm9yZV9jb25zb2xlX2xvY2tfd2FybmluZyk7DQo+ID4NCj4gPiAgRVhQT1JUX1RSQUNFUE9JTlRf
U1lNQk9MX0dQTChjb25zb2xlKTsNCj4gPg0KPiA+ICsjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5U
S19USU1FUw0KPiA+ICtjeWNsZXNfdCBzdGFydF9jeWNsZXM7DQo+ID4gK3U2NCBzdGFydF9uczsN
Cj4gPiArdTMyIGVhcmx5X211bHQsIGVhcmx5X3NoaWZ0Ow0KPiA+ICt1NjQgZWFybHlfdHNfb2Zm
c2V0Ow0KPiA+ICsjZW5kaWYNCj4gPiArDQo+ID4gIC8qDQo+ID4gICAqIExvdyBsZXZlbCBkcml2
ZXJzIG1heSBuZWVkIHRoYXQgdG8ga25vdyBpZiB0aGV5IGNhbiBzY2hlZHVsZSBpbg0KPiA+ICAg
KiB0aGVpciB1bmJsYW5rKCkgY2FsbGJhY2sgb3Igbm90LiBTbyBsZXQncyBleHBvcnQgaXQuDQo+
ID4gQEAgLTYzOSw3ICs2NDcsNyBAQCBzdGF0aWMgdm9pZCBhcHBlbmRfY2hhcihjaGFyICoqcHAs
IGNoYXIgKmUsIGNoYXIgYykNCj4gPiAgc3RhdGljIHNzaXplX3QgaW5mb19wcmludF9leHRfaGVh
ZGVyKGNoYXIgKmJ1Ziwgc2l6ZV90IHNpemUsDQo+ID4gIAkJCQkgICAgIHN0cnVjdCBwcmludGtf
aW5mbyAqaW5mbykNCj4gPiAgew0KPiA+IC0JdTY0IHRzX3VzZWMgPSBpbmZvLT50c19uc2VjOw0K
PiA+ICsJdTY0IHRzX3VzZWMgPSBhZGp1c3RfZWFybHlfdHMoaW5mby0+dHNfbnNlYyk7DQo+ID4g
IAljaGFyIGNhbGxlclsyMF07DQo+ID4gICNpZmRlZiBDT05GSUdfUFJJTlRLX0NBTExFUg0KPiA+
ICAJdTMyIGlkID0gaW5mby0+Y2FsbGVyX2lkOw0KPiA+IEBAIC0xMzUyLDcgKzEzNjAsMTEgQEAg
c3RhdGljIHNpemVfdCBwcmludF9zeXNsb2codW5zaWduZWQgaW50IGxldmVsLCBjaGFyICpidWYp
DQo+ID4NCj4gPiAgc3RhdGljIHNpemVfdCBwcmludF90aW1lKHU2NCB0cywgY2hhciAqYnVmKQ0K
PiA+ICB7DQo+ID4gLQl1bnNpZ25lZCBsb25nIHJlbV9uc2VjID0gZG9fZGl2KHRzLCAxMDAwMDAw
MDAwKTsNCj4gPiArCXVuc2lnbmVkIGxvbmcgcmVtX25zZWM7DQo+ID4gKw0KPiA+ICsJdHMgPSBh
ZGp1c3RfZWFybHlfdHModHMpOw0KPiA+ICsNCj4gPiArCXJlbV9uc2VjID0gZG9fZGl2KHRzLCAx
MDAwMDAwMDAwKTsNCj4gPg0KPiA+ICAJcmV0dXJuIHNwcmludGYoYnVmLCAiWyU1bHUuJTA2bHVd
IiwNCj4gPiAgCQkgICAgICAgKHVuc2lnbmVkIGxvbmcpdHMsIHJlbV9uc2VjIC8gMTAwMCk7DQo+
ID4gQEAgLTIyNDIsNiArMjI1NCw4IEBAIGludCB2cHJpbnRrX3N0b3JlKGludCBmYWNpbGl0eSwg
aW50IGxldmVsLA0KPiA+ICAJICogdGltZXN0YW1wIHdpdGggcmVzcGVjdCB0byB0aGUgY2FsbGVy
Lg0KPiA+ICAJICovDQo+ID4gIAl0c19uc2VjID0gbG9jYWxfY2xvY2soKTsNCj4gPiArCWlmICgh
dHNfbnNlYykNCj4gPiArCQl0c19uc2VjID0gZWFybHlfY3ljbGVzKCk7DQo+IA0KPiB0c19uc2Vj
IGdvZXMgb24gdG8gYmUgc3RvcmVkIGluIGEgc3RydWN0IHByaW50a19pbmZvJ3MgdHNfbnNlYyB3
aGljaCBpcw0KPiBkb2N1bWVudGVkIHRvIGJlICJ0aW1lc3RhbXAgaW4gbmFub3NlY29uZHMiOg0K
PiANCj4gCS8qDQo+IAkgKiBNZXRhIGluZm9ybWF0aW9uIGFib3V0IGVhY2ggc3RvcmVkIG1lc3Nh
Z2UuDQo+IAkgKg0KPiAJICogQWxsIGZpZWxkcyBhcmUgc2V0IGJ5IHRoZSBwcmludGsgY29kZSBl
eGNlcHQgZm9yIEBzZXEsIHdoaWNoIGlzDQo+IAkgKiBzZXQgYnkgdGhlIHJpbmdidWZmZXIgY29k
ZS4NCj4gCSAqLw0KPiAJc3RydWN0IHByaW50a19pbmZvIHsNCj4gCQl1NjQJc2VxOwkJLyogc2Vx
dWVuY2UgbnVtYmVyICovDQo+IAkJdTY0CXRzX25zZWM7CS8qIHRpbWVzdGFtcCBpbiBuYW5vc2Vj
b25kcyAqLw0KPiAJCXUxNgl0ZXh0X2xlbjsJLyogbGVuZ3RoIG9mIHRleHQgbWVzc2FnZSAqLw0K
PiAJCXU4CWZhY2lsaXR5OwkvKiBzeXNsb2cgZmFjaWxpdHkgKi8NCj4gCQl1OAlmbGFnczo1Owkv
KiBpbnRlcm5hbCByZWNvcmQgZmxhZ3MgKi8NCj4gCQl1OAlsZXZlbDozOwkvKiBzeXNsb2cgbGV2
ZWwgKi8NCj4gCQl1MzIJY2FsbGVyX2lkOwkvKiB0aHJlYWQgaWQgb3IgcHJvY2Vzc29yIGlkICov
DQo+IAkjaWZkZWYgQ09ORklHX1BSSU5US19FWEVDVVRJT05fQ1RYDQo+IAkJdTMyCWNhbGxlcl9p
ZDI7CS8qIGNhbGxlcl9pZCBjb21wbGVtZW50ICovDQo+IAkJLyogbmFtZSBvZiB0aGUgdGFzayB0
aGF0IGdlbmVyYXRlZCB0aGUgbWVzc2FnZSAqLw0KPiAJCWNoYXIJY29tbVtUQVNLX0NPTU1fTEVO
XTsNCj4gCSNlbmRpZg0KPiANCj4gCQlzdHJ1Y3QgZGV2X3ByaW50a19pbmZvCWRldl9pbmZvOw0K
PiAJfTsNCj4gDQo+IFNpbmNlIHdpdGggdGhpcyBwYXRjaCwgdHNfbnNlYyBjYW4gZWl0aGVyIGJl
IGEgdGltZXN0YW1wIGluIG5zIG9yIGENCj4gY3ljbGUgY291bnQsIHRoZSBjb21tZW50IHNob3Vs
ZCBiZSB1cGRhdGVkLiBJZGVhbGx5LCBJJ2QgbGlrZSB0aGUgbWVtYmVyDQo+IG5hbWUgdG8gYmUg
Y2hhbmdlZCBhcyB3ZWxsIHRvIHJlZmxlY3QgdGhlIG5ldyBzZW1hbnRpYy4gSSdtIHRoaW5raW5n
DQo+IHRzX3JhdyBvciB0c19uc19vcl9jeWMuLi4gbmFtaW5nIGlzIGhhcmQgOikNCg0KTmljZSBj
YXRjaCEgIEknbSBjb25zaWRlcmluZyBlaXRoZXIgY2hhbmdpbmcgdGhlIGNvbW1lbnQsIG9yDQp1
c2luZyBhIHVuaW9uIGhlcmUgKG9yIG1heWJlIGJvdGgpLg0KDQpUaGFua3MsDQogLS0gVGltDQoN
Cg==
