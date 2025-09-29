Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8191A0711
	for <linux-embedded@vger.kernel.org>; Mon, 29 Sep 2025 23:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759189703; cv=fail; b=NjXK0EjiVZsBOBibHSTzS1N5R0PsDsry/iPvLDhyXS1e+yib+eA3fPx812HE6KbLvI42p4xe0n1KuSWTS8steJ6YPuTvW+/GEU1uElZGb8dWW7yJ1KFolWzo8oV3TDUNRwN455Po2TOQkFddaPzUB454CggvZsG/dEG1cfIBgQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759189703; c=relaxed/simple;
	bh=qKGerO8qfJK17UziyFaIwx0x8RXgqusDCq7pjiALGv0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g9UhC8p1bV2hm402JJAUe5N/cZoYvWf8hyaBRMu/OgbDvBDxOKY0TiP2qi1/IB7SyObZKjzI21254bwBJ0zjJD4STInkebCXs0X+7DRSDMIgjDowHAxoTI7wZb2HtEm8jlDNO7Hm7pGlb/P2JubfLTEr0MTIkSOP3exDHM/Jqzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=STHoWHLM; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="STHoWHLM"
Received: from pps.filterd (m0209327.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TMaX2f027967;
	Mon, 29 Sep 2025 23:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=qKGerO8
	qfJK17UziyFaIwx0x8RXgqusDCq7pjiALGv0=; b=STHoWHLMquEz08V/9ApB88r
	fT/wj3h/fkMibj/vqxyFouIGmXqPgYnO5W0eXE6tJoVK1RNJUbqU4to5tV/HjpnU
	EGQIJ4vlNFbxY/bvne/KOwm0NHa+bQGcmvCo+QNRWIkjX1EYy0jiFKsTc8xPNXvk
	rLqKckfDX4pe34GxSdpcpPjnOPlWITLiHwJMFqM7p49Ks4MFlae8OVi4JeM0MScP
	lnCjrjr2yXvOVZYPcG0VYW25BS3YzfHw6GQLlZQnP7oyDl1q0v7CB4SfSluPKPaZ
	AEm2az2AQD2MFD+Q1kAtxV8H9D979mRPKEggS7RDrnuf74IoKwXUfV6piMxKXDA=
	=
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012016.outbound.protection.outlook.com [40.107.209.16])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 49e6swjx33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Sep 2025 23:48:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZ3ASglj906W6iwM/czo9frUzWRUzYnmotScOegjs0t0yHgIKTjAyws7c9qmyqOLi7JKwAJg6OYE9CYCC4u8bJp63p/aUDOOMiHk3NXlWRbw+NdMOZazyO+oKuLdtb8PIVOT+nLtZj6/6n0j/Ss2MRcXyNoPM7cGsmIpxl+IYh67Q/LQc2iQ6wHXmGM+UOavC0LgehJulUIfqMX4HJq70nJ4oIUeMqXKyKZbHMaSBh9dM8Zod/hgyh9j2JpwpbpdAjD/WIYt52hrJemNbiQNUNyDfPs3EIzDtrfqkosKB+yMaOH132uv2VUxN1R6sQozEj+kRZVZCZDjCj1kTuSztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKGerO8qfJK17UziyFaIwx0x8RXgqusDCq7pjiALGv0=;
 b=MINusIN1V0+4l3CStW/hkLEEumAVMfKSZpTLhVjQUV35vz9BeD0BRmCfxyToEnPkbx1YEXaXRGttbMfmr+mpMfvdhwAsedi9O66bK6ICOjnIUbD4LbGPeHpqhLbW8Qmu8yCR8gc1as7908GT6MPv5qDLEtqHPklJ/z8SrRMJR0TUMNsriYAX5LW1ZvqiuK85rljI/qobRWr8yl88SpoESJJBcFbB6lxm2/IuT8d3Rsw2+ff3g6HwGUvWHYHkvwsG0I3tctDyRMEqN89IDTrmx5rToly/3YJ6jc2hPbNkaoCBlt7FPyiC4a7zrFCQR+folQczSr63IfgRgGT0Fi4iiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by BN0PR13MB4582.namprd13.prod.outlook.com (2603:10b6:408:117::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 23:48:11 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%7]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 23:48:11 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>,
        "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: RE: [PATCH PREVIEW RFC 3/6] crypto: use bootcache to cache fastest
 algorithm
Thread-Topic: [PATCH PREVIEW RFC 3/6] crypto: use bootcache to cache fastest
 algorithm
Thread-Index: AQHcLJdPwshFUUv+kk66CtCfCwPkvrSq2zJg
Date: Mon, 29 Sep 2025 23:48:11 +0000
Message-ID:
 <MW5PR13MB56323768BFB9EE9C5D18DB8DFD1BA@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20250923-bootcache-v1-0-4f86fdc38b4e@thegoodpenguin.co.uk>
 <20250923-bootcache-v1-3-4f86fdc38b4e@thegoodpenguin.co.uk>
In-Reply-To: <20250923-bootcache-v1-3-4f86fdc38b4e@thegoodpenguin.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|BN0PR13MB4582:EE_
x-ms-office365-filtering-correlation-id: 8f82036d-b175-4864-aa9f-08ddffb2a670
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ajdVUWVnUHhheXNXWjY3TVJzUTJCVi81ZW5NdmhXb2dOZXZhMm4rdFVrd2hv?=
 =?utf-8?B?STc5YVZ1TVF5bW5VQmM2L1oyOXNSbGJZOWR5ZlR4V3ZHTFNEaXdxSGZNN1JD?=
 =?utf-8?B?dEtEKzVtaWdVcFJTdE1Cd3N0aWVGQ3o4MGRsdmZFc3FyRGNkOVRLS2RKRFZD?=
 =?utf-8?B?SVRXMTBzcmtJYXRndEFxenhxbnlpQmRrMkJtOURkYmhGVitybElDcjAyYnZF?=
 =?utf-8?B?N0tlTFpiRDZDUVU5ZCtEOEt3b3RuRDlvRS9KT1hZTzlrNFp3RHFETGlvSWVj?=
 =?utf-8?B?NVNPMXJWaUJ2dHZHeGVRMVRTWHFpdW11WFRrYmFDdUtrdmRwd00yeGMvb0FV?=
 =?utf-8?B?Mlk2QzhUd01nU1o3NGhxTUJmWkhrOU05eS8xVldKeVhHOGI3YytxTlJBZ1pB?=
 =?utf-8?B?blk2cll4Z2xQbndySW5QSDlId01ZSHBld3kzMlRDdyt5eHVVKzVmVnAvNElr?=
 =?utf-8?B?YzFucW5IU2NXVGMyb0RBam9PRGY3b05nTGZiNkJza0VjZFVib1d0R2FVa2pa?=
 =?utf-8?B?RTh1NjZmNFZqSGtLQWR4VURnMU03cEhkMmRQKzE5Q0M5ZllNdm1ubkpnMVd6?=
 =?utf-8?B?cmJLZG9LcnRLNGJZTnFMMlFWc01qWkxabGliNXZpZ3ByME50NU1kOWtOTUdp?=
 =?utf-8?B?UE4ydHR1MlNSSThqaVE0aW84S1dPNlhMTWROWHFvQitNWHhlSGxWOWxkb0pX?=
 =?utf-8?B?aWNmNGkxS3pqbkRMMlNkOGVadU41YzBscTdxb3VYNGIwRzRQSS9ySmFqazZa?=
 =?utf-8?B?MXpWM0xLdEN4QjNobEFlaXROaENTS3l0dW5WL2lJUEdzMklzVFJ0ZnBQM2pT?=
 =?utf-8?B?dDNoVDVBb2dha053R2I0TUxwdUJYQkhnT1lJaWxGb0xQVm0rU3FMeU0rcTFV?=
 =?utf-8?B?cnNKTXhKeTJaNmtWSlk4dk54MEhtZ29ndFRlcGgzdU5PbTJld1RPdk4zdGZu?=
 =?utf-8?B?ekNPWFI3Q3YvQXJjSFhQTmVjVlFIMGJHelFsZndIUUI3clQ1cVUwQWRsUVJE?=
 =?utf-8?B?ajJHaXZGNFZEWjFEdHRkREFGQ3ZzNWxCeUY3NnkyK09Cc3NJK3NPSDdJVU5o?=
 =?utf-8?B?dUlrOW9wMFBTWE41NEVFUDFDVWVVakZNbmFFb2ZCTkxyTGZiSlpaTDNZVVBh?=
 =?utf-8?B?ck1iRlJFb29ZbGJSZTdoQTlBZ2pEZXk5TDRneDEvWUc4SjlpRlVWdFJSZVVI?=
 =?utf-8?B?cHJIS1ZpekRpcW5tYVhFVW1nRXhXbUJKTHJSZjdmSHo0WVJXa24zSHlrTVdv?=
 =?utf-8?B?OGRrK0lXVWVaSlMyaTFNYVVzNElDTEhiQzBaeWJOU3ZQc01YMjR5dlhRTVZL?=
 =?utf-8?B?RnVPMVdPbFhiQmdrYVljN3h0WmRteGF5TG5EZ1NROFZXTkROcFdWNzV6TkxB?=
 =?utf-8?B?ajJ5eU5ObWd0UmhqMGpDN2xjQ085U1Z0S1k5M2R1MHpKbHVEREZleEVma21W?=
 =?utf-8?B?OFhiQjBFLzBqZDhDWE1pb3UxNnNZZjhBbXdMY0pqa2JIVDg5d1c5djkvUEFW?=
 =?utf-8?B?MmgzbHU5S2I5QjRPTzV1WHlKbXZEbjQyMlhVMk5nQkV3eHlRNnJ4S2RCVWd1?=
 =?utf-8?B?RlI0ZVYwRC9vT0sydzNuZTA1R05zcjVRYWZnOEgzU01MTFhNWTJiWkp3SC9J?=
 =?utf-8?B?V21GU0RZL1dqMFUrMitQY0owME5IU3M4UGtDSkpsNmNMeHI5V2QvaHU5czVt?=
 =?utf-8?B?dG5aSUNxa2ZqNHdTdnhxV0dVR0k2YW9PQzJ2dGoxRnlIUTNwS3JOQzY3NFRO?=
 =?utf-8?B?MVA0Ymp3eGpWdjhRQ0IvRlE3MDJTVytVeXh2bmFtUENkVzBPUnd4elJ6K3BU?=
 =?utf-8?B?SlNwM1ptanY1ZnZ4QzJkNlhndGcyUGJKSjdZeURzbEhZQ3B1VUdrTTBTTlZT?=
 =?utf-8?B?YnUyQ2U4MVpDUDl0aitRTnRLdGJ2cmt3a2FhMWNzSnJvd2FmKzVHWkRVZUhq?=
 =?utf-8?B?NmlxcExheURxN0FsYjUvZXBaZFFHTzRIVTRqRy9aYjQ5MENPK04xRjQ5VXBT?=
 =?utf-8?B?ditxT3VwS1BxYU5YTU11cjVlVys0L2Q3VWE3RHlwMlM1TDZMdUdnNGpvcG41?=
 =?utf-8?Q?oLUaKT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?clY4ZFdzY3RPU2d1WURyeDFUdjFHOVZzbTFla2Z4cmhsS0NLMWt6ZXMwQ3Qr?=
 =?utf-8?B?UmMzT3NaQXhFK1k1YkdHS0ZPQ09MbW53OUlwSFcwVXZnbi8wK1p5WGF0ZHpW?=
 =?utf-8?B?aGlYeGdscGN2Zm9QQ0hLWjhSUTFCRU5PMXpyWDBHcHp5T2g3ZEh6UW1sams5?=
 =?utf-8?B?QVkxalZFVDhNVkVOUVIzQXBzWWwrTWVaZ2o3RDVjQnd4Y2l5d1AydVF0OFVD?=
 =?utf-8?B?dGt6L3l2LzNjNEQwdzJFOFFydGU4V2NzUjcybXFGNGk5VnlJOE0xQ3NXUW8z?=
 =?utf-8?B?SGlhRWdoWlMzQzZyWjVpbHcvam5YWGx6NllOSThKa082QWxhR1ZXTUZtK05v?=
 =?utf-8?B?bHE2NExRMjArbkhjdThFOFB3Z3VrR2pPdkhpL2ZRTDd4L3EzbWFOZWJXK2w4?=
 =?utf-8?B?TVhnbzh6K2tXUC9rNjBhZDgvNnF6TUJNcy9ZV3dSNjhwK21nT2NVaWZEbVBr?=
 =?utf-8?B?UlpmVVg3bC95cWNqZC91ZndCU0Y0bVlPTlVFb1RaTTY5UWxTTkRpMU5Zanpu?=
 =?utf-8?B?aWV1SzROM1NocitQTkJDc2M1WUVRK2V5aU1CNElrLzdSTEZSSnYxbWtCL0ox?=
 =?utf-8?B?WnY2RUh4RStFcWZtODE4MWZ4SDBraWtaZTJ2cmdncUtpWUtmYTdVcHJTY210?=
 =?utf-8?B?T3hpMFdtdTdGeTdYeDhaTWV0RWFmaERFcStnTDRUazI4cldXTzlCVVpnSzFT?=
 =?utf-8?B?cWY3bkxuZDdCUmRibldBTDFoeDhyT3N6UEVKWFVpRktXTUx4cGZxUlhKaHg0?=
 =?utf-8?B?K21LelZJQ28zU3lVYVJCd2pNOVhKeXF3WkorNmp1T3VnUGNINGdobmRUcFhY?=
 =?utf-8?B?S2kwbHozZ0NzWktWY0pWa1cwdWVSSFB2N3V0Q2h5UFdUQ3BUdkptcGw3QW1i?=
 =?utf-8?B?WkkyMFpkQWViWmt2Y0FaekV0UTQwNkpPZGkxa0ZkbExqZ05pUzBublFhQ2Mr?=
 =?utf-8?B?QUFteW5sa0hpNkRsLzlDamF1U1BPdWhrNU14QXp4R0lXclRTeWJwaVgvcyt1?=
 =?utf-8?B?Qk9jTXZTWkx2MlBYT01TbHNNM0VNQlFDb3hJR0YyTElyNGRuVXNEYm9TQkRU?=
 =?utf-8?B?TzZydWNHMXllOVBEeE01bVhHSFk0VGhpQ3hqV3ZKQlVNRmZQbGpOeW1XVHZY?=
 =?utf-8?B?U2I0UkxmME9NcUZFU3V5ZlBIMy9ZUHdFUHkrRjlsaUVrajlwblhYT3RIUTJk?=
 =?utf-8?B?MzB4M1JrRDB5QVFJYzRrYWIwYmIraEEvM05SYkxWeWhjMVZIQjZsSGlXblR3?=
 =?utf-8?B?cGtkc3liQWZ0QndKS3ZuY0F4N25vakJpQk5Ma29oclBHRGo0Vm9sVDlNZlU3?=
 =?utf-8?B?Y0phRk93My9ZbTlLSjAxa0doUlBGY0NyaFhYWm1JV1VHV29JNWsvWERNZ2FO?=
 =?utf-8?B?ZXE2NnZoUjFZKzlDLzR6dnVyb01rWGdKODJINTRQNkpweWVwbVpCVXRFQVdV?=
 =?utf-8?B?WlBYdFVmalZidGFWZExlQ29vMmhNZkpnb2EvQW0wTG52R0IvWXArOXczTUE2?=
 =?utf-8?B?Z2JDYWs4bC9lTmxzNDBRVlB0ZHl0UjBKdGN6czZGTWlLUmFrN1Zqd1VKQmlt?=
 =?utf-8?B?WDE5ZGZVSEpMYU4rZWpZRVhjbGN2ZG5mcTEyZWNaNm9Zdk1mVlJHVmFyek9R?=
 =?utf-8?B?ODVnWG16QUlCaUFzR2l5MzY5OHBHQlZ6L2VDaHpNeTlsOVh6c0hPd2xDczBG?=
 =?utf-8?B?d0ZJMHZlM2VTSmQxZDNsejhOZFJWdm1lV1kxeE1oVHcxZm5zdkZ3Ym11d0RY?=
 =?utf-8?B?UW41V3RKa0ZsdXlacWpjeFhsbC8zYmRQYlYzTjZ3RjJ1YWRTYm05ak83UVpG?=
 =?utf-8?B?VzVvVGZGZ21mWHpMdUtvNUF4QlhCUCtmcFJVMmx0T3pEcmhWdFJoLytFd25v?=
 =?utf-8?B?MXBscW1aWmZXTEdwT1phaFVnMEs0SXQxTFBYZURsU3AxZ1JVaGRkbkNCZE9O?=
 =?utf-8?B?aDREdDJGUjNJdkVUdlA4d3pUcFc0VWxhOE5xRk8vUFlnV2c5ZXA2b2ZpcmJw?=
 =?utf-8?B?N1Zyd3NUR1diVm5ZZ3BtY2Vma0pQYVM5NVh3bFpmZGNSNU9JMm5FN0JpZlRm?=
 =?utf-8?B?Q2NnUGV6dFYwRzV5RU85bTlWYzROVTNqSzVtUU5UNWphVTV6SjFBZG4wZHhp?=
 =?utf-8?Q?TtcY=3D?=
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
	M+9DOSNp810IkETmN5Jip63ubcnuOKfwp2MCpxj8XHTSGOe8g2Ip9S4/F4UY0QbJrOBAnEQZywrlMqvZLzRQOUsha5J93iAtEJY/mYqBhraQuSGU62UIppz0ttocnjolHiVqPkR99ZCLNeUANSMWfQpakS3AFVuzua/EQ4cdNJYBYSsUm51V8vWpw7vVKg+V897qPtccPHxOLu4ggjXWpUt7zAiSOJwLPmvo2BzYP3gpqI8ocuQlM0xn2iMbB82VdzCc2LtQ+mvyH8AODxc89TnbrjWvFmrPGwxIwauM6YvdyooCsNOyeb5sJ0NnIm8jcC6x3A0pugnZTou4h95Cly2m7qrJFMSqytT7NxDcWgzo47GnnbroXljhxnS00NUXW3XAQq8TT28cqwua+NvANehl7MN0ws0u0t5ewOmMdMOkAM9d9p9dTmpNwbTpo+L6vkmyv8QbsWdZOlRq9/ho8v7uHGqxU5+6ORPAOqQJUU+FKIl9mL7PX1PSMZV2YrUGtW/G3YJ7kRnxTBue0yX+DTBCo4is6b2sOedwjOcynNGK6Rr74zo6NOfhSK1VCb5yy71NrzUZeBqcQ0m3CXaDzZG4Wu4G/2xdxcTj0Ne55PEff1EmHw3xSMh2SAuPzWgd
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f82036d-b175-4864-aa9f-08ddffb2a670
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 23:48:11.8114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HSo7Qk+m11i4Z2T/BgH2bucRAZlbeXAMxEEA4hc4p5flliLPU0jAsvOHqhO5gZAe0mphGOK/QuEuqp+bye3zXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR13MB4582
X-Authority-Analysis: v=2.4 cv=Ro/I7SmK c=1 sm=1 tr=0 ts=68db1ac0 cx=c_pps a=lV9semjb6HF4qJ8WeHToSQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=xR56lInIT_wA:10 a=uMr1uQFKAAAA:8 a=VwQbUJbxAAAA:8 a=XxlINH5wdAbaw3OubFgA:9 a=QEXdDO2ut3YA:10 a=mA13xv-6rAYGTomVCS-P:22
X-Proofpoint-GUID: -cH5JPwxsw5U8y9v7LGvumqfdwiGZ-ud
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNiBTYWx0ZWRfX/U9BXSS+4rUT irxXdJKCsOk1zObuWv5fZOsYuEKnJBdPvWkyiiiVqYYAsk2XMBz5hN/Kz1l6QLmCtqCD6f4ZQUl zptVvL39Dxp59WWfr8D19egaNAAJ9ZqUd5fX1vmUf7Z8YauZTh+C7Tb6tbKoJKMn13ctsiEPk5D
 U4iLa654+X49rwdC6Cvlv2OG6hLMnmm4XALOi2xCLs4jRw+byjzgANseJtBOIbSx1P3m5/p0Ic2 al5FaAzFPJsdAiZR3c63ZlhvkobHPO3DHLDJ1rGQ2A4NiLbcGeAR/BCJIOKENhaQMaLk64QhjL0 m3lMJz8Wesa02q9rYO4vU+IkrRpEJcvOMVN/WwklwensI9Nqy5ukTNQ+xzjwUl1YtdLdGo0QAeA
 D345sQM9y5HxJSi9FURaQA58pZDzBw==
X-Proofpoint-ORIG-GUID: -cH5JPwxsw5U8y9v7LGvumqfdwiGZ-ud
X-Sony-Outbound-GUID: -cH5JPwxsw5U8y9v7LGvumqfdwiGZ-ud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_07,2025-09-29_04,2025-03-28_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhY2FtcGFuZWxsYS10aGVnb29k
cGVuZ3VpbiA8YWNhbXBhbmVsbGFAdGhlZ29vZHBlbmd1aW4uY28udWs+DQo+IFNlbnQ6IFR1ZXNk
YXksIFNlcHRlbWJlciAyMywgMjAyNSA4OjI0IEFNDQo+IFRvOiBsaW51eC1lbWJlZGRlZEB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gU3ViamVjdDogW1BBVENIIFBSRVZJRVcgUkZDIDMvNl0gY3J5cHRvOiB1
c2UgYm9vdGNhY2hlIHRvIGNhY2hlIGZhc3Rlc3QgYWxnb3JpdGhtDQo+IA0KPiBGcm9tOiBBbmRy
ZXcgTXVycmF5IDxhbXVycmF5QOKAinRoZWdvb2RwZW5ndWluLuKAimNvLuKAinVrPiBEdXJpbmcg
Ym9vdCB4b3JfYmxvY2tzIG1heSBkZXRlcm1pbmUgdGhlIGZhc3Rlc3QgeG9yIGFsZ29yaXRobSBi
eSB1c2luZw0KPiBkb194b3Jfc3BlZWQgdG8gcGVyZm9ybSBhIHNwZWVkIHRlc3Qgb24gYXZhaWxh
YmxlIGFsZ29yaXRobXMuIFRoaXMgcHJvY2VzcyBjYW4gaW5jcmVhc2UgdGhlIG92ZXJhbGwgYm9v
dCB0aW1lLiBMZXQncw0KPiBGcm9tOiBBbmRyZXcgTXVycmF5IDxhbXVycmF5QHRoZWdvb2RwZW5n
dWluLmNvLnVrPg0KPiANCj4gRHVyaW5nIGJvb3QgeG9yX2Jsb2NrcyBtYXkgZGV0ZXJtaW5lIHRo
ZSBmYXN0ZXN0IHhvciBhbGdvcml0aG0NCj4gYnkgdXNpbmcgZG9feG9yX3NwZWVkIHRvIHBlcmZv
cm0gYSBzcGVlZCB0ZXN0IG9uIGF2YWlsYWJsZQ0KPiBhbGdvcml0aG1zLiBUaGlzIHByb2Nlc3Mg
Y2FuIGluY3JlYXNlIHRoZSBvdmVyYWxsIGJvb3QgdGltZS4NCg0KSXQgd291bGQgYmUgZ29vZCB0
byBtZW50aW9uIHRoZSBhbW91bnQgb2YgdGltZSB3ZSdyZSB0YWxraW5nIGFib3V0IGhlcmUuDQpJ
dCB3b24ndCBiZSB0aGUgc2FtZSB2YWx1ZSBmb3IgYWxsIHBsYXRmb3JtcywgYnV0IHlvdSBjb3Vs
ZCBtZW50aW9uIHRoZQ0KYW1vdW50IG9mIHRpbWUgdGhpcyB0YWtlcyBvbiB0aGUgcGxhdGZvcm0g
eW91J3JlIHdvcmtpbmcgb24gKG9yIG9uIGEgcGFydGljdWxhcmx5DQpzbG93IG1hY2hpbmUsIGlm
IHlvdSB3YW50LCBqdXN0IHRvIGhpZ2hsaWdodCB3aGVyZSBpdCBtaWdodCBiZSBhIHByb2JsZW0N
CmZvciBzb21lIHNpdHVhdGlvbnMgYnV0IG5vdCBhbGwuKQ0KPiANCj4gTGV0J3MgbWFrZSB1c2Ug
b2YgYm9vdGNhY2hlIHRvIGNhY2hlIHRoZSByZXN1bHQgb2YgdGhlIHNwZWVkDQo+IHRlc3QgZm9y
IHN1YnNlcXVlbnQgYm9vdHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgTXVycmF5IDxh
bXVycmF5QHRoZWdvb2RwZW5ndWluLmNvLnVrPg0KPiAtLS0NCj4gIGNyeXB0by94b3IuYyB8IDI5
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjggaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2NyeXB0by94b3Iu
YyBiL2NyeXB0by94b3IuYw0KPiBpbmRleCBmMzk2MjFhNTdiYjMzYzQwMTVjMDZkZmYwMGUwM2Ew
NzcxNjYxOGY2Li4zNDU3ZGYwNDE0MDY0NzU4YTE5MjM3NTJlOTE2NDJkMjIzN2FmN2IzIDEwMDY0
NA0KPiAtLS0gYS9jcnlwdG8veG9yLmMNCj4gKysrIGIvY3J5cHRvL3hvci5jDQo+IEBAIC0xNCw2
ICsxNCw3IEBADQo+ICAjaW5jbHVkZSA8bGludXgvcmFpZC94b3IuaD4NCj4gICNpbmNsdWRlIDxs
aW51eC9qaWZmaWVzLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvcHJlZW1wdC5oPg0KPiArI2luY2x1
ZGUgPGxpbnV4L2Jvb3RjYWNoZS5oPg0KPiAgI2luY2x1ZGUgPGFzbS94b3IuaD4NCj4gDQo+ICAj
aWZuZGVmIFhPUl9TRUxFQ1RfVEVNUExBVEUNCj4gQEAgLTU0LDEzICs1NSwxMyBAQCBFWFBPUlRf
U1lNQk9MKHhvcl9ibG9ja3MpOw0KPiAgLyogU2V0IG9mIGFsbCByZWdpc3RlcmVkIHRlbXBsYXRl
cy4gICovDQo+ICBzdGF0aWMgc3RydWN0IHhvcl9ibG9ja190ZW1wbGF0ZSAqX19pbml0ZGF0YSB0
ZW1wbGF0ZV9saXN0Ow0KPiANCj4gLSNpZm5kZWYgTU9EVUxFDQo+ICBzdGF0aWMgdm9pZCBfX2lu
aXQgZG9feG9yX3JlZ2lzdGVyKHN0cnVjdCB4b3JfYmxvY2tfdGVtcGxhdGUgKnRtcGwpDQo+ICB7
DQo+ICAJdG1wbC0+bmV4dCA9IHRlbXBsYXRlX2xpc3Q7DQo+ICAJdGVtcGxhdGVfbGlzdCA9IHRt
cGw7DQo+ICB9DQo+IA0KPiArI2lmbmRlZiBNT0RVTEUNCj4gIHN0YXRpYyBpbnQgX19pbml0IHJl
Z2lzdGVyX3hvcl9ibG9ja3Modm9pZCkNCj4gIHsNCj4gIAlhY3RpdmVfdGVtcGxhdGUgPSBYT1Jf
U0VMRUNUX1RFTVBMQVRFKE5VTEwpOw0KPiBAQCAtNzksNiArODAsMjEgQEAgc3RhdGljIGludCBf
X2luaXQgcmVnaXN0ZXJfeG9yX2Jsb2Nrcyh2b2lkKQ0KPiAgI2RlZmluZSBCRU5DSF9TSVpFCTQw
OTYNCj4gICNkZWZpbmUgUkVQUwkJODAwVQ0KPiANCj4gK3N0YXRpYyBzdHJ1Y3QgeG9yX2Jsb2Nr
X3RlbXBsYXRlICogX19pbml0DQo+ICt4b3JfZ2V0X3RlbXBsYXRlX2J5X25hbWUoY2hhciAqZmFz
dGVzdF9uYW1lKQ0KPiArew0KPiArCXN0cnVjdCB4b3JfYmxvY2tfdGVtcGxhdGUgKmY7DQo+ICsN
Cj4gKyNkZWZpbmUgeG9yX3NwZWVkCWRvX3hvcl9yZWdpc3Rlcg0KPiArCS8vIGJ1aWxkIGEgbGlz
dCBvZiB0ZW1wbGF0ZXMNCj4gKwlYT1JfVFJZX1RFTVBMQVRFUzsNCj4gKyN1bmRlZiB4b3Jfc3Bl
ZWQNCj4gKwlmb3IgKGYgPSB0ZW1wbGF0ZV9saXN0OyBmOyBmID0gZi0+bmV4dCkNCj4gKwkJaWYg
KCFzdHJjbXAoZi0+bmFtZSwgZmFzdGVzdF9uYW1lKSkNCj4gKwkJCXJldHVybiBmOw0KPiArCXJl
dHVybiBOVUxMOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgdm9pZCBfX2luaXQNCj4gIGRvX3hvcl9z
cGVlZChzdHJ1Y3QgeG9yX2Jsb2NrX3RlbXBsYXRlICp0bXBsLCB2b2lkICpiMSwgdm9pZCAqYjIp
DQo+ICB7DQo+IEBAIC0xMTcsOSArMTMzLDE4IEBAIGNhbGlicmF0ZV94b3JfYmxvY2tzKHZvaWQp
DQo+ICB7DQo+ICAJdm9pZCAqYjEsICpiMjsNCj4gIAlzdHJ1Y3QgeG9yX2Jsb2NrX3RlbXBsYXRl
ICpmLCAqZmFzdGVzdDsNCj4gKwljaGFyIGNhY2hlZF9uYW1lWzMyXTsNCj4gKwlpbnQgcmV0Ow0K
PiANCj4gIAlmYXN0ZXN0ID0gWE9SX1NFTEVDVF9URU1QTEFURShOVUxMKTsNCj4gDQo+ICsJaWYg
KCFmYXN0ZXN0KSB7DQo+ICsJCXJldCA9IGJvb3RjYWNoZV9nZXRfc3RyaW5nKCJ4b3JfYmxvY2tz
X2Zhc3Rlc3QiLA0KPiArCQkJCWNhY2hlZF9uYW1lLCBzaXplb2YoY2FjaGVkX25hbWUpKTsNCj4g
KwkJaWYgKCFyZXQpDQo+ICsJCQlmYXN0ZXN0ID0geG9yX2dldF90ZW1wbGF0ZV9ieV9uYW1lKGNh
Y2hlZF9uYW1lKTsNCg0KSSBwcmVzdW1lIHRoYXQgaWYgQ09ORklHX0JPT1RDQUNIRSBpcyBub3Qg
ZGVmaW5lZCwgdGhlbiByZXQgZW5kcyB1cCBiZWluZyAtRU5PRU5UDQphbHdheXMsIHdoaWNoIG1h
a2VzIHRoaXMgd2hvbGUgYmxvY2sgY29tcGxldGVseSBldmFwb3JhdGUuIElzIHRoYXQgcmlnaHQ/
DQpJbiB0aGF0IGNhc2UsIGRvIHlvdSBlbmQgdXAgd2l0aCBhIHdhcm5pbmcgYWJvdXQgdW51c2Vk
IHZhcmlhYmxlIGNhY2hlZF9uYW1lPw0KT3IgZG9lcyB0aGUgY29tcGlsZXIga25vdyBub3QgdG8g
Y29tcGxhaW4gYWJvdXQgdGhhdD8gIERvIHlvdSBzdGlsbCBlbmQgdXAgd2l0aA0Kc3BhY2UgcmVz
ZXJ2ZWQgb24gdGhlIHN0YWNrPw0KDQo+ICsJfQ0KPiArDQo+ICAJaWYgKGZhc3Rlc3QpIHsNCj4g
IAkJcHJpbnRrKEtFUk5fSU5GTyAieG9yOiBhdXRvbWF0aWNhbGx5IHVzaW5nIGJlc3QgIg0KPiAg
CQkJCSAiY2hlY2tzdW1taW5nIGZ1bmN0aW9uICAgJS0xMHNcbiIsDQo+IEBAIC0xNDksNiArMTc0
LDggQEAgY2FsaWJyYXRlX3hvcl9ibG9ja3Modm9pZCkNCj4gIAkJaWYgKGYtPnNwZWVkID4gZmFz
dGVzdC0+c3BlZWQpDQo+ICAJCQlmYXN0ZXN0ID0gZjsNCj4gDQo+ICsJYm9vdGNhY2hlX3NldF9z
dHJpbmcoInhvcl9ibG9ja3NfZmFzdGVzdCIsIGZhc3Rlc3QtPm5hbWUpOw0KPiArDQo+ICAJcHJf
aW5mbygieG9yOiB1c2luZyBmdW5jdGlvbjogJXMgKCVkIE1CL3NlYylcbiIsDQo+ICAJICAgICAg
IGZhc3Rlc3QtPm5hbWUsIGZhc3Rlc3QtPnNwZWVkKTsNCj4gDQo+IA0KPiAtLQ0KPiAyLjQ4LjEN
Cj4gDQoNCg==
