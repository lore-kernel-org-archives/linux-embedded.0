Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AEAC139
	for <linux-embedded@vger.kernel.org>; Tue,  5 Nov 2024 02:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730772277; cv=fail; b=j0nQ8AVaMKbOlOYR0Ej/2a1au6kDAGMBi5UFjQeX6OGp+hiAK/mG0BwnUn4ctaXcGe4kreWpCeJ7Sr9OBnT83wIcB8QzT3YG0hr8z0/yhP1iym3LU0C8G9X+F2DG9TPJlEsdyj2l19G5vAUz/Scduz1inELlkBb4lD1xIfNQ5j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730772277; c=relaxed/simple;
	bh=3SKLdK0FCWGt4rk6xGNHufAOrXXtJsKjP4eUnPysa+4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rCY2jqlfzAegJltUfRsZn3Ouwkp41ICE8LaAhHjuKsWDF69Q4yM6tzo8xdrKklaIHAgtu0giXfMLrf51I5f+PTTswMFddKNyDZZ41QgEznGgUCpuEMbVm9TWVOVxBhLflOyapkHnuWN1hj67SLrSdf6G5gYVtFXS0rk4TC9jE+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=PVnlgDSM; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="PVnlgDSM"
Received: from pps.filterd (m0209320.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4MfdAE012985;
	Tue, 5 Nov 2024 02:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=3SKLdK0
	FCWGt4rk6xGNHufAOrXXtJsKjP4eUnPysa+4=; b=PVnlgDSMuR25389iOtxE2g0
	TsQ3KQeALM7oFqvKp2nk5DYxwnT8zG6gc2ajCJjcTaTp/z34dtwAt+dzusTdhCYu
	ANv3nPbw7yDkpBH7FOphVINd+6XkMPqCB6gbqXHnGfwGfTSh9sT3w1XL0AX2JOqm
	GDziCtA92CffYrQaNvF+qeQooW1hPS7AdWtguj+NdU/i7/ik9bOpzucFb7A41EeI
	C+Q3MUGDg7saNwpMIetYAqmOVlvqqW0X+G50HruNn8iue+azlEugNwBTnUiNk6fD
	v2MsvZEQjAWaTvF4Q5CpFDpHhvKbXnW0DtjD2cop085aBNjZ3p134zK2aLudEsg=
	=
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 42nc20t09g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Nov 2024 02:04:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQA0vYnirP52jgJVrvQ1c/Wj2tGX1SwaM1ciwKsa4hIXykvwD7LbJaeHem2HV7Euz+wIfz/6+tqnNH1yUG8j571S3Iljrv1whq2YLfBulVwCXOrb348oCpaSfxh7PN0Q/5hz9H5aJTeS5QOXO4kP+WM/fm5yoePmlzRvkQl9JSOarVySMBOnxpCkszB7i2SpxBKlQ5zRtHYjKxJ987UM+Yqus2ZEF69Wa3Yb5z4IfqU+gTlgmu4fOKrd7krPKi2NIvS5tw4HEvAqLOuXJgwJrzr8ORuYQef60Vnvtb4C02B7jlSfI010oIkN4cL0aSw+P+o0xVx6tLn2VqvCJKn1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SKLdK0FCWGt4rk6xGNHufAOrXXtJsKjP4eUnPysa+4=;
 b=f9L6ahBrjDp/nSHfUE6SWcB7bgft6jD5koMYjcXm6vOCQuuTDOQhFUFTNjK4604TvbZ/nvWPRLKdpbsHh8kZP9Vi079wLWl/CfwT5p4aOVZL05kaWOrlcqlAz+uzgKqXX6W8X2WVaR1lfpwip90oByOmV5E+bfbqDE8iKYuOx1zqMXkUWQv609Jko9xNz9s4dnKWrsYveyTu6Arw/lWHrJh6gJEcZIr5hG2R8r7xJpg84wvwq3fhOoGrO148+JaxLpoaVHloOiORI/gUhZ5zBe6Q+Jjsp1V/QL+C4lto7AFYU2lNFt16CFsDRgzSoopnBsD/y7fLx4nFWNGu3b+hpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by DM6PR13MB3804.namprd13.prod.outlook.com (2603:10b6:5:245::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 02:04:15 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%6]) with mapi id 15.20.8114.027; Tue, 5 Nov 2024
 02:04:15 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Francesco Valla <valla.francesco@gmail.com>,
        "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: RE: [boot-time] RFC: proposal for boot-time tools github repository
Thread-Topic: [boot-time] RFC: proposal for boot-time tools github repository
Thread-Index: AdsqoTd6NBTHlURFRUuz6jBESPbDUgDam5kAAEbS7cA=
Date: Tue, 5 Nov 2024 02:04:15 +0000
Message-ID:
 <MW5PR13MB56324F4DFA23625FA141EA8BFD522@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <MW5PR13MB5632D76A85C2DCE48B5AA2B4FD542@MW5PR13MB5632.namprd13.prod.outlook.com>
 <2523504.XAFRqVoOGU@fedora.fritz.box>
In-Reply-To: <2523504.XAFRqVoOGU@fedora.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|DM6PR13MB3804:EE_
x-ms-office365-filtering-correlation-id: 835fe219-d47a-4c21-479d-08dcfd3e2680
x-proofpoint-id: d8690225-876f-412f-87c6-a7cb45557a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|3613699012|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SkNxb3BkbTVyTVBucGVkZ2c4VG1IWlZLUzVxTllxUWlSK0ZOemh5MnptSVFT?=
 =?utf-8?B?eUE0MUlqRTViK2xEVnFRN1djbDRUdGJhck9MLzJVWGFUc20zM0Fka2l0V1Vh?=
 =?utf-8?B?R2lWMkhnTCtidHJpMHlmOFZyZXUxbi9JaU11bnoyZ3dDbnFRU2RTd01vajRV?=
 =?utf-8?B?S0ZFNER3c0NKdll5VlNLQ1N4bHRFK2h2MnVhcDQ3UDBpN3RNSTJGWlp5UExt?=
 =?utf-8?B?bEtMNjZYa1h0anA1OElVM0tZR21nS0NmeHNCRVhaU0pmUWdPWGdXS1F6TFBR?=
 =?utf-8?B?OHRpTlFyQ0hoaVdGQklqSkhMeGF1akNkc0dlZHZCdXZFVnpqTkpQMEZJemlY?=
 =?utf-8?B?eUx1cVdwdWo0aDlCSkZDd3ZaV3BRK1pwRXFNRTd0MFZtTDZiZ3ZuSkdSbU4x?=
 =?utf-8?B?UHg5WDlkMDg0d1lVMngxcjhwd2gybFBVcENqUGlTeTVoSUdiNHJlWFJGNlBC?=
 =?utf-8?B?RmRSZitoSktSVGdKTlJ5Y3M3YnJVREl4SUdFZG5pazZGazQ4SVlNTXhTbUtr?=
 =?utf-8?B?K1RqVDJ5V2lZeStIdWV0L09idjRhYThNaGV5RzN5ZHlWUFhVdkI0UWJ2dmw5?=
 =?utf-8?B?eThBUDVzZjBsZFRaR25VakVEYWYzajh1YXNpMnVlVUpIa3g1dzQ2V2pwTnkv?=
 =?utf-8?B?UFd6QmlRUC9wNzUrYm9ESjkxL09pU1pmelNwanpBaEQ4RjRGMnZFanIxcXBH?=
 =?utf-8?B?Mk1xWWZuZXRBSEZMR0VaUTZmMGd6NmVlZ25ZdHR5N25BcmJISzVYdFY2NXk5?=
 =?utf-8?B?MGwxOWtNbklkUDA4UVViNEZ0OHVEMVA4cHNsaGFiam00NVlNZ1YySTE4R1No?=
 =?utf-8?B?UDJPbXlNRERwSSs1Y2s0TWxvcGwybFdQQjlSOGhIRzNzRXVxYXhCaWkxN1B0?=
 =?utf-8?B?aDcrRmxrR1p5NWdFcU5CR0ZyTzNmMmFwQm4rT2RFZmlMSFZDMlJueENsU1Ra?=
 =?utf-8?B?dEJXMWJZMHVwc0hmWUEzQUQ2VGMvQ0pVYmtROTJtMm80bnp6YlpHZ2FxVTFV?=
 =?utf-8?B?Sks3T2JoNWR2OG9ZeTdITFhhVU4ycjlQYnZtdXR5VllEOFJKdXJscDBvc1dz?=
 =?utf-8?B?cFdpcnB2M0Nic200VXFmZkRGTU5zc3FzQmNhRW1BY2ZhUnZvWXhzRHZ6UnQ1?=
 =?utf-8?B?a0xOQkh1azZTRnBjdkZLRTMvZXVOWE5DWHlCT1l1MmNMeURYNEh5SG02ZFdh?=
 =?utf-8?B?T21xT1hpQUVVQ2U0UXFyTTVZc0pDQXJzVXJ1VTJSaUVGL2dnbys3ZzErdW1E?=
 =?utf-8?B?bmgrL2R1WnU0NnZINE85THp6MmRrUUt5L3VyM0xhSWQxdXV2Z05TanZpeSta?=
 =?utf-8?B?Z3JITjRRcll3cDhicG1veUJLMTYvNXREejJ0MzZtdE9YSGhidmFFNnFnb0hR?=
 =?utf-8?B?Y1RWSWgwQ0xXMnVMaGtqVzhXR2RUVzRzYkJmWXBzWjRQL0ZraW1CekkwY3k3?=
 =?utf-8?B?czBreXZNcG1qOTFISWZnY0s0dm9kZ3psempldlJyWnBwdUlVK1Mrc2lNVFZz?=
 =?utf-8?B?QkNzSGRKVmRGOFRMblNQT2p1cGJ6QXRwdDhsMklLb09IQXN4bEJmNXdMcmtV?=
 =?utf-8?B?VWJST1FQRnc5NWk2YWpOaUVPMW9EOUlEVDFZcWRKU25pVGdkaG8wMzluVVZh?=
 =?utf-8?B?elRZNGNldUtVTUNzLzRscDg2Sm5iS1E1ZEZTcjNrQ0NpVG1ER3hUOVcxYkhv?=
 =?utf-8?B?QXEyNlN6bW81R0FFWWFSNWlKbTUrUlNIWXkyeWQ2eGZhQkZoekozQkZYR2d1?=
 =?utf-8?B?QnNXeUFmdDA5Tlp5d0IzVGdqQmtmanFyT2YwVHltbHVWbjREMDBod1J3ZGtu?=
 =?utf-8?B?NWpLaURHVVdyY3Z4R001bG0rWC9yeVNwYVdxTHQydEtkWXJ3ZnIrdFh6YVIw?=
 =?utf-8?B?TVFqM05HblJ5aGl3MWNpVWJQeHN6MjBMNWxBRnpmSUlwUFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3613699012)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M2NlY0JTdU9qUVpGaXlvbmd0VWtmckxrZ2c1ZUE2UmhSUTlsYldLYlNTSGVD?=
 =?utf-8?B?cUZOYktSQ09vN2Y3SkhrZk1zdkhWc1k0KzcreWhyTEVjcWRxNkhYQ09pdmlx?=
 =?utf-8?B?MDNlMC9OQTVOcmZlYmxYSGRMdnRQWjhLMjF6MmppZU9iTE9jNG5XWWx4a2Ni?=
 =?utf-8?B?eEcwaDFRc1FtbHVoM3VuSVBEbzYzWWlrbis0d09nQ1ZLQ1FubnpJd0t2U1Na?=
 =?utf-8?B?WGtFOVR6R0lmTFlYWVR0cW9jRUt0a2RxUXIvNW1kT2k2bFJ2Vk1SRlVBUW1V?=
 =?utf-8?B?Q2YyNDdkcUVjdlY4dWZHUEJtcG5ITnN2UmhUZC9MZWNZc2huczUwaVNMSFZt?=
 =?utf-8?B?NnJzak1scXlERUFxVE15cm1nNllkOGxVNHVKSmlxQmJLeVFtZE5BbXp2NHJE?=
 =?utf-8?B?U3VlRWVweWVZc1Y5U0ZnYjBFaXliNlRVZHJZRHJIb3FwMEl5cUZydTRNb1Z3?=
 =?utf-8?B?MnJVK0Qrc09vaWJNUVVLb0QrRFFnaC9xVldTZE53OGpQSXFxSjd6QmpMbEFG?=
 =?utf-8?B?Y3VvYitkZWczem9kY3BWYXgzNlAvZlBxNzBpamo2cmY2NGhmd3ZFYjlpRUtw?=
 =?utf-8?B?ZXFLa0ZCVWtPSXErRlA4Zk9rd1ZQYmxDczBncm9HWk9UbTNXUm1WMGJxeGlp?=
 =?utf-8?B?Z3lZS0lhVy9aRTZuNkRraURGODA0eVU4T21RTzkvU1YxMTBIVVBJbTBGU1lL?=
 =?utf-8?B?L2JDSzQ0Nk9ON1pKa2JLU2pFWWVtbWQvR3pJSFJudHBxUHNkL1dwbDVHdnho?=
 =?utf-8?B?SnBEYVlRY1dKbjg3cWcvamZYY2ZvZ0Z6MU9oSThzdWZabm5xYXRaajJmNWRu?=
 =?utf-8?B?bjRSOWxrajVxblM3VWU2akVOOWQ2YU9kdllkU25nQ1l1eE9pWGpXKzVIRmY2?=
 =?utf-8?B?NlNnazYydHRhVE5KOEx2d2pHRHhKc1kzMlg4YXplZU00VGNWdjBNOCtZSDk3?=
 =?utf-8?B?OFJFUkI0VThwRC95MFdhUHZKSm5hUzc5ZWVmaTkyNStvb0FBd3Z2THJ0azNn?=
 =?utf-8?B?ZXdZbFJQTDBxckNkTWZoSk1KWUlIWi9XUG1FRmd4bTRIbzduUGVDVnRsRlZo?=
 =?utf-8?B?dWVYcURvdDJ5NmhaZnpvM2tleTRUK2FDR2lyL25sTkc0MHJBTU4zK3BBbDJl?=
 =?utf-8?B?QVIzYmNnT0lreVdQUU5OM1Z6cm50bEk2dUJwOHlLOUN0YWpOcFVNWEFyUC8r?=
 =?utf-8?B?TFV2bkd1RUxhTVFSSUJRT2gzK3cyalpOVGJidHNMVW5JbDVKNmV3TDNpQzdL?=
 =?utf-8?B?bWppYVUvTDZRcWcrZEo4UEU3UU9XbmdnaytKbWd5MG9YRFdnWmEzL1NqSjNa?=
 =?utf-8?B?M3JTSEFtODRBalVvU25VcTZyM3QwR1pyQnhWRlplVHhuRHkvVUtaZlF5aWlm?=
 =?utf-8?B?SXczRzVJMVEyNkZ2OXZVVTNnR095eVFEQWh5aWNxZ1p1VGdKYmFWSjJ1WWxn?=
 =?utf-8?B?S0dtUng5VnZPQkNCYTlRbW9Yc2d6NXJ2Q0M1dkhIR1l6ZjU1MXpET0F1dTZU?=
 =?utf-8?B?YS95Q1dic1RFT1RKeWJ1Z2NDT1B4VXNKT3dwdDdsUUVOY0syeXdaeXZPUmxL?=
 =?utf-8?B?UXdwTmZLb2xxTTFjTjZoYzlvMERDaU9HNHRRK3hQdlVYR0syeDZkdzdabUg3?=
 =?utf-8?B?aWMvdTVTOXlUb09NczlXN1Y3eWpDaGZObmNrQWhPbGg4UG5haFMyRXduY1FE?=
 =?utf-8?B?QWJGdkNZRENHM3g1SzZkSmR0ZXd4eEFlNnVaNnFvWDBsd04wSHZqL1VHMTVI?=
 =?utf-8?B?RnE0bFk4Nk55NHdZcnpjRkdkb2ZwbU90c1c2ZEJ3S0VYNEtmWU9aUExWeGE0?=
 =?utf-8?B?WHpDTXhxT2Y2Z0JBVUF0MURIRDUwY3FwUXRwR2Q4QkZDM2ZzNFZSK3ZtdEt0?=
 =?utf-8?B?TWlQUDRacGZNZk82ZWdaOW04QTJTRUpRM3llSVZmb3JjOWE5M3VXNXE2aFdl?=
 =?utf-8?B?R3ZXeW90ZVN3a1YzMk5ZK3pBaHRZa2VOMjd5TXdSaTJJYnJ3UEJTcy9sS0l0?=
 =?utf-8?B?TWhDelkyWEVJSWxqWFhkLzFOY0pMRzFUZGpxWENNNCszTEJOVHdXdHcvTWJU?=
 =?utf-8?B?YlBtb0pESjgrR3g2aUpSSUNFQkJVa25EdnJ5QjZrQmxzNG9PbFVWRWZaZTd2?=
 =?utf-8?Q?jsCw=3D?=
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
	uDpthH4WOVi1NZ3UTt1jZmNMILAe2XE7Rxh9KlXZUZtSbek0/Z15d998bkrUwMlQqMQ+j/fj1nNfXW07PqZX5fYMuMnD2oe3/5DnIGsk5ofFICV88LsIWlM7YlhX01BGPATyF7FBn9dVPjPVt9h0acalG43VSwbdLJGIyub1WHUOWmhQiuKzL5uwUhavOQIQWbT2NkbdOQJmJCjPzvk4COAQyMAd3PmL9VTZxlURW9GXDBs3XG2cyn20hMxpzB6kQuh5XheIrR+vi9a1eiAdkSNxNdOo3btowIJOa9Aonr2fCBqrZRr6P9vqFL8KzejuFKLW3DTZDqM/TsGq5vQZQKr+J0Q5iwmeRQkD+QlhGpa/kzYjsM3EZw/O0CYFhbsNBOWoEAWDqwXPn6jKLuT/uFZfKfC7eiqzy4DUopkkU2WdUGMB38c/8r44NMvZcbwiGF17jtXI0SEbWUzxnNGTvWy9oafj3yFHKK1P9iMFWZ4k6NMmxNEGJZXbXwldM8wMR6AC/xph8GD/lePqv9zL5hRca+wIw+Z88Miygsex/GcSXnMjmEH/bB7e+6cVF4mYqAo8TBzLVbK1M2z3uSfjtXECCjfRQxVZdDmqf53kXnjssSpg85/AJXeJQm3BzwQi
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835fe219-d47a-4c21-479d-08dcfd3e2680
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 02:04:15.4899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/Fu5sJNuToyBWgUoZM2OMDmUmcMEMZWen7zETv5mnFyQp/lroG/80NVew+cturZSx8p1XTtcG7C+Mq/sxltuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB3804
X-Proofpoint-GUID: BDKm-hT9-IJzBbA8f42VjLAtw-jwl7q0
X-Proofpoint-ORIG-GUID: BDKm-hT9-IJzBbA8f42VjLAtw-jwl7q0
X-Sony-Outbound-GUID: BDKm-hT9-IJzBbA8f42VjLAtw-jwl7q0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_22,2024-11-04_01,2024-09-30_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGcmFuY2VzY28gVmFsbGEgPHZh
bGxhLmZyYW5jZXNjb0BnbWFpbC5jb20+DQo+IE9uIFdlZG5lc2RheSwgMzAgT2N0b2JlciAyMDI0
IGF0IDA5OjIyOjA5IEJpcmQsIFRpbSA8VGltLkJpcmRAc29ueS5jb20+IHdyb3RlOg0KPiA+IEkg
aGF2ZSBhIGZldyB0b29scyB0aGF0IEkgcGxhbiB0byBwdWJsaXNoIG92ZXIgdGhlIG5leHQgbGl0
dGxlIHdoaWxlLg0KPiA+DQo+ID4gU29tZSBvZiB0aGVzZSBtaWdodCBtYWtlIHRoZWlyIHdheSBp
bnRvIHRoZSBrZXJuZWwgJ3NjcmlwdHMnIGRpcmVjdG9yeSwgYnV0IHNvbWUNCj4gPiBvdGhlcnMg
b2YgdGhlc2UgbWlnaHQgbm90IGJlIGFwcHJvcHJpYXRlIHRvIGFkZCB0aGVyZS4NCj4gPg0KPiA+
IFNvIEknbSAgdGhpbmtpbmcgb2YgcHV0dGluZyB0b2dldGhlciBhIHJlcG9zaXRvcnkgb2YgYm9v
dC10aW1lIHJlbGF0ZWQgdG9vbHMNCj4gPiBmb3IgcGVvcGxlIHRvIHBsYXkgd2l0aC4gIEhlcmUn
cyBhIHNhbXBsZSBvZiBvbmUgdG9vbCB0aGF0IEkgZmluZCBoYW5keToNCj4gPiAtLS0tDQo+ID4g
IyEvYmluL3NoDQo+ID4gIyBzb3J0LWluaXRjYWxscy5zaCAtIHNvcnQgdGhlIGluaXRjYWxscyBi
eSBkdXJhdGlvbg0KPiA+DQo+ID4gaWYgWyAteiAiJDEiIC1vICIkMSIgPSAiLWgiIF0gOyB0aGVu
DQo+ID4gICAgIGVjaG8gIlVzYWdlOiBzb3J0LWluaXRjYWxscy5zaCA8ZG1lc2cgZmlsZT4iDQo+
ID4gICAgIGV4aXQgMQ0KPiA+IGZpDQo+ID4NCj4gPiBncmVwICJpbml0Y2FsbC4qYWZ0ZXIiICQx
IHwgc2VkICJzL1woLipcKWFmdGVyXCguKlwpL1wyIFwxL2ciIHwgc2VkICJzL1xyLy8iIHwgc29y
dCAtbg0KPiA+IC0tLS0NCj4gPiBTZWUgaHR0cHM6Ly9lbGludXgub3JnL0luaXRjYWxsX0RlYnVn
IGZvciBkZXRhaWxzLg0KPiA+DQo+ID4gRm9yIHRvb2xzIG9uIHRoZWlyIHdheSB1cHN0cmVhbSwg
dGhpcyB3b3VsZCBzZXJ2ZSBhcyBhIGRldmVsb3BtZW50IHJlcG9zaXRvcnkNCj4gPiB3aGVyZSBk
aWZmZXJlbnQgaWRlYXMgYW5kIHRlY2huaXF1ZXMgY2FuIGdldCBoYXNoZWQgb3V0Lg0KPiA+DQo+
ID4gU28sIGRvZXMgYW55b25lIGhhdmUgYWx0ZXJuYXRpdmUgaWRlYXMgZm9yIGhvc3Rpbmcgc3Vj
aCB0b29scywgb3IgY29tbWVudHMgb24NCj4gPiB0aGlzIGFwcHJvYWNoPw0KPiANCj4gU291bmRz
IGZpbmUsIGF0IGxlYXN0IGZyb20gdGhlIHBlcnNwZWN0aXZlIG9mIGEgZGV2ZWxvcGVyIG5vdCBz
byBtdWNoIGV4cGVydA0KPiBvbiB0aGUgd2hvbGUgbWFpbmxpbmUgZGV2ZWxvcG1lbnQgZmxvdyAo
bGlrZSBtZSkuDQo+IA0KPiBXZXJlIHlvdSB0aGlua2luZyBvZiB1c2luZyB0aGUgR2l0aHViIFBS
IG1ldGhvZCB0byBhY2NlcHQgY29udHJpYnV0aW9ucz8NCg0KWWVzLCBhcyB3ZWxsIGFzIHBhdGNo
ZXMgb24gdGhlIG1haWxpbmcgbGlzdCBpbiBhIGZvcm1hdCBzdWl0YWJsZSBmb3IgYSBrZXJuZWwg
c3VibWlzc2lvbiwNCmV2ZW4gdGhvdWdoIGl0IHdvdWxkbid0IGJlIGdvaW5nIGludG8gYSBrZXJu
ZWwgdHJlZSwgYnV0IHJhdGhlciBhIGdpdGh1YiByZXBvc2l0b3J5DQp3aXRoIHVzZXItc3BhY2Ug
dG9vbHMgKGFuZCBtYXliZSBhIHlvY3RvIGxheWVyIGRlZmluaXRpb24pLg0KDQpJIGhvcGUgdG8g
aW5pdGlhbGl6ZSB0aGUgcmVwb3NpdG9yeSB0aGlzIHdlZWsuDQoNCiAtLSBUaW0NCg==
