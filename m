Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6816C301474;
	Tue, 24 Mar 2026 19:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381692; cv=fail; b=N+ZbKBKHZC6pIg86W0u5TAJuEWj9MjqFb004drJI8GfKE0vjq9IdGES+TAUnfwbItw/tvWKYQ1T0hhOsz9QiKHvi9r64m0i2lh5g1rhU9ghboc3d3N7+EIazwwMP4+HVOJU9EU/fNW83JR5DpEHZwZE30HZ1RSy04y8AwVs/bvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381692; c=relaxed/simple;
	bh=q7+hM/h/hWtJPKxrn9HIu4mGbxn4S2P+yUrIzSSPrK0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=AfFhxnYQElJIRwkJPwpgOgcq/OlnudfRb5nUYHCZB9aXP8BTeeHeBllNo4PrL4z0XtcOOh2xWgCZ5ZaNKeK5B67/H31T6cHPBqRIKkpXLdUcH3NwQfDIrg9m4eQePqmuOOSWf9ltJRUPtWGTy4d7soKESBo7DwLyqVSd/3HcA/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=LQ4JhkZ0; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="LQ4JhkZ0"
Received: from pps.filterd (m0209320.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OF9Awl387289;
	Tue, 24 Mar 2026 19:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=r/su35w
	Nea7h/dghOntkgPcV2DH06T/qDp5S345/ud0=; b=LQ4JhkZ07WpMiB+/vQxaoiQ
	VhGX2MPzkgTkk9D/dSYOSCJZcH9bep5jFrIAhyf+2PrK6IcOWcg9xCfe5ySCSmWG
	sZhbBA9iM65jQS5j7DoQVkQc7MznP5du3TeIoUqENpcv1gh6d2vAjcKD9m8AOOyC
	b/k/b4SZ8B2Jngbglc5Yw3CzZtPByjRnEg83Uz6XSX3UORYWI85M5PM3CSUL+Dnl
	KcevLmj1qnGnSM5q7TNAo1iSA1F8DJOGOHjM7JgB9XtigtcYtqC9Cw8tkskD3NDO
	0ZPoLwo2fvA9XqxirxykO1CCKqYDoRMz/kMcL4inIykhXVSKYEHLm+GA/7liEJg=
	=
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4d1kk73vfy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2026 19:47:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdlpN7/D5xxFrYXMML2rHsjfFD+x/SXQo+yg5RAlnDd7DMQI1Eq+Anpz/CVIgMV679YZDxi30Ee5ezrMfzoZZjsEp0XUJFmGvJh9eRI+mS7yidJXZ4t8iJF9RmM9bsp8ISFyQABQBf6NwBNUvm+OytqStBsIZiAXiG4psgBxhkiF3aurVwwzTInaGa2mGdoALrY8vyRfDoDrzijxGuEv2xQY1oGLYlicm0HEGR2eMoqrIsnBqDxqLi9BEht3R+FjDtfj/u7+AGminuL5ShowEav0byzRjSI3EgMLcCb/8MWCtylLkql6BvBr1lmJ4HSRD3sOCo0NhdKsJdV2IXw6fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NK77yU2b4I8ttwlQWTEroarJ/yorF3iENIyItkgzilk=;
 b=vuaaVwEEW8PB21T88AbjNm45Bibozsizh+nWeCYU+ppzB/b97Z9DmxOlM8quwwacMfg/WyeTT81d7SVHUqMivNC/UHFiL6cmwqVafwU6VwTQpkbTI+W8WQoXLEfQzzcImS7r1nfkNb3pPOuF/+z3j7aCYkbi+MCY2s5RSSrGAPWPe0vXk7Zp72Xy7vmqlgQQDP6yQtEOZq8RYRHRgtmBlDPKcNmniWxPWjZDgskrbLGWRRnvNF1PgKUh6cSf2gM6Aj3twsqMlvbBwqV3Zhu9ZwG+n+wtoGrBLXf3UVFPVRA8MEffh24ejRZttByO47kBtgY2swLCwoHCHZTRhvWeMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by CH0PR13MB5187.namprd13.prod.outlook.com (2603:10b6:610:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 19:47:04 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%5]) with mapi id 15.20.9723.022; Tue, 24 Mar 2026
 19:47:03 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Michael Kelley <mhklinux@outlook.com>, Petr Mladek <pmladek@suse.com>,
        Shashank Balaji <shashankbalaji02@gmail.com>
CC: "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "senozhatsky@chromium.org"
	<senozhatsky@chromium.org>,
        "francesco@valla.it" <francesco@valla.it>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Thomas
 Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
        Stephen Boyd
	<sboyd@kernel.org>,
        John Ogness <john.ogness@linutronix.de>
Subject: RE: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Thread-Topic: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Thread-Index: AQHcmuexSh6ktdFaZUimYV7dOjz0LrWppsqAgAJpSmCAAGcAAIAB7r0AgA/pMzA=
Date: Tue, 24 Mar 2026 19:47:02 +0000
Message-ID:
 <MW5PR13MB56324CC9F20373A19325061CFD48A@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
 <SN6PR02MB41571D45C1C8ADF89BD1FE8DD447A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <MW5PR13MB563216F6D786D4DCDFEBED2BFD45A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <abPqrqgXHnDu8XWf@pathway>
 <BN7PR02MB4148F06A53EA3A4061765405D442A@BN7PR02MB4148.namprd02.prod.outlook.com>
In-Reply-To:
 <BN7PR02MB4148F06A53EA3A4061765405D442A@BN7PR02MB4148.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|CH0PR13MB5187:EE_
x-ms-office365-filtering-correlation-id: 3dda7334-df59-4a8a-fcc5-08de89de1ed6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|7416014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 1OpStqk92s+cdg6jrTE842/gJJfQbm2UIUVldu9wyjmFE//nnEx+WevtbO3BcGpYTxYa1/i0hsdOnPpi650Ib5RstxQxU3wHQFFYjyzp0nAnUfMpHDGbmaJpFobCtspKkpeF1rKrZb0UhDEN8iZ25XdTXfcUKa16lHjf5uH+36lRT48ek8dNqAAGmqzPABmevwqBojrrtHEEoTveTsv5JR5uShkeO7ipadgNA8OGsiBqpa0JO6ZZILaQwAVSK4KPIUnUwuipg0G9Ngh2CWYVC8d7KV5wHL/iWgfuNt7fFckGp5/qGZOIgD12cZJqelNBKQsWNTl3m3zP4yzZyAOuJ1PIz/46dE3R7Lv7wmnfnGfvR+NqLQITv8d6Sav3Td3julrtVPgXOQbenNmPujgIa9CivRoCA5vDkJlERKEWhG3wU5BR3OGXn9TsdTfsr8UcjJ1qK+e+aqGkk5r42Gess23oTAWTfY3DjINGJCQ+rH+ByQ5wlGuDFMLkEmpghwVFXplVMS2NmT8dLQ7ROo6ucsACGbjKEqawUnOTAUtBZSAfhvtuE1VhUC7f16j7m7elY+OnXiD7JvoQAxQGVWIvB4LoyUPkE/rMbrXxB6AaJxpd3WjfOI/hdsW0MK/NKQMTwucmfIeTSArNOuQ3ZdxA9uSZROf5F7jQpKaDUHi5e8a7/hgvmTKfx8fsqafCSBT0mQAF+nJ766hDCP9qPT92G1ngLUJ6N9CkXtS5tPbxoyxlW66jDSByv0fkILE82KKi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7416014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RUZzNk04d0V6RG9Hd05TckdBLzRIbEo2ZFdYM2diRkpvWUIzRFBrellhMm1Q?=
 =?utf-8?B?VlBFMTdXdURFWVRJMkZVclRndnJRSDJIRU1uOERISlk4MDFic0NyMWpnbGEw?=
 =?utf-8?B?MWR6anJtOE56cHExVitjaVcvb1IreTE3R3NjUytHNWx3QTMzZkRDakRlQnlL?=
 =?utf-8?B?NUk3SGw1OFdzQSs3UjY4OVR6ck16cXlDbXB5eGpsZlhWT1RqQmN6VUtwRyt2?=
 =?utf-8?B?UzBlWk13bjZRTVhWU1h2MFc0UzR0MTgyWFBLTlJ2clhXMFk1R3lDZ3o5ZCtS?=
 =?utf-8?B?MnIwU2pBeWZ2ekREalRoL2pTOGhHMzZaYWpIZll5Rm5rQUUwTFlkd01ZWFBn?=
 =?utf-8?B?M0h1Z2ZHMVErbXZSa1VFdHJUWDQvd1hkaFhnK014NDZjQWx0b3ZTLytuMlEw?=
 =?utf-8?B?V3FINEg5UWl0WHUwNkJDZUV5REVKdFZ5ZDVKUExEb2tFMHEzeVF2RVlRN3FI?=
 =?utf-8?B?TmtFZUxORVc0OGl2VDdSWmVlYzl3bjFWdCthUmhTa250a3lUclczZEkwR21N?=
 =?utf-8?B?enh3amFrVGs4WUlUNGYyOW44NFFvcUVsaHdjRGYzSHZvSFJna09ORlgzRk9X?=
 =?utf-8?B?cDFzMW90Sm1KRERDOFdXdjRzZ0RsM1VWQnJGQlNkZW5FMGZqU1VQUXM3K2F2?=
 =?utf-8?B?ZVUvVXQ3TjhsRG9sdTlRVHlqWWYxUGtyMldERm5kUnlEeXBBRzBNYjRUU0tN?=
 =?utf-8?B?a29pUUROSUJIM0hDK0ZFSk5IT3k2Y09jOWV4M0l1VTMrM0tmamRxZmlxNHdT?=
 =?utf-8?B?VktWbUE2MGN1dU9zcTdnOEdxdEszb0tKNXJRR3NJTUJLM3FEU0s2eXZ6N2ZW?=
 =?utf-8?B?NzVFQ3o3ejlZRTJsQjR3N0psdndLOGsxT1R2ZnljMUdFdVpId2J6UGlzQkRS?=
 =?utf-8?B?NzUxYXlMem1KWnZLR0ZreTdHVkhsRWs0RlkyOVlJTTU3aFk1Q1J0Y0NlVWtt?=
 =?utf-8?B?amRGWVd3aWxwUWIxeU1ZVlMvVFV0cWtnVEJRVkZVUW1XUWFzOFdUNWEvT0xo?=
 =?utf-8?B?KzQ3anA4bFVtSlBPUDhvUXg5d0hFSERwMytLK1lBQjhRQlBrS3Fsa1QxUnQw?=
 =?utf-8?B?a1htSzdKbEtGWmRmdVEzTXlYS3Rnb2thcVVhd2VGckdHN1Z6d0RSc0t0SkZX?=
 =?utf-8?B?UlFNQlB2UnhjaDg5NVc1MzJCczNqMStuQlNnS2c3ZlRPRUswdFlCT3M1aHAy?=
 =?utf-8?B?MWI0OVg3RElaZjRLMVpCQWlMekxWOUcrL0liaTZYR0YvVDd3S005RzZTUnJ5?=
 =?utf-8?B?UzdvTFVXaWkyUjVuOXpSczNVT0UwWlg0V3dUdDkrNmZ2NG9sa25VM1Z0MXAr?=
 =?utf-8?B?ZUhvNEpzRHI3MVBEU3Q0RFNNSFFGRE1BYUZWREJLQkw0SUJRM2lIc0xXeEhE?=
 =?utf-8?B?Z1drMUZ5Tnh4cTFsdUpmU0huRHduVlJtUW9pUkk5WTJlV3IweE5ZNUFCYUtX?=
 =?utf-8?B?Q0V1WE1odEVraHAweG0xMzVudE9DSnhIdjBRSlJaamt6OFpWL2dGWGJrSHZt?=
 =?utf-8?B?R25TRjVwOXNqaTkyR1J4RXZTSTlhQlRuSEZGV3JkVXMwNll6Uko2NDhLd1lZ?=
 =?utf-8?B?TnJnWE1WN0tONml5WUdBVk9id1hwOUVYWEdLTG1USWxkUERxcUkrZkRrcDZv?=
 =?utf-8?B?c0lGQ2ZmRDcxMmpZVXZ2cTc5YTgxQ2p0cmxZWlJKeTRPak42UEFtMjBVV2NP?=
 =?utf-8?B?UUJ5R2lUNXJlU1pyY0VSbURVOE5iYlNvKzdyaUJGTk5FMjRsNGxTYWpFNTBj?=
 =?utf-8?B?WXlUS0tNckxjamM3TS84MnFCWE1UL2U2UUp4R1NZSWJyT2s0VGdaWHZkeXQ1?=
 =?utf-8?B?Q095MVJlYUNPM2NrZlM4cW1ZZ0dpRjc1cUJLTThhcmplK1M4ZU5yWU5hRERK?=
 =?utf-8?B?M3RKNHVVTGUxcXZPQUxGSmRZNVNkQllodWwvR0JHWDA1a0t0VVdjaWR5a0lU?=
 =?utf-8?B?UEVBMDNuNHEzSHNRUk1HNERYOUR5ZFhSanlZcHJ4a3B4VURSMGhKM2pZbVNT?=
 =?utf-8?B?a2tTWHhURTcyZnNIWFNvTzA2RWpLczBWS2pHZnpNaUJTZ25Xa0p3SUh3T2Nh?=
 =?utf-8?B?bFZQYnRUZVJ0R2lhTWg0emZobTE1c2R5N0drWDZIejE3YnZqMExJNmc0b2xQ?=
 =?utf-8?B?ZUJXN0VCYW9XUmFCZWs1SklQdFZSajRvTXNZc1dIN3VJVFh0elJwLzI2TWRZ?=
 =?utf-8?B?TzAxVWVsbzBFWUU1ZDRaWlBaWm85dGF1bGRiN2pFT3JSMDJRZEIyYS9sdkZw?=
 =?utf-8?B?bDhpbWpZaHNrK3NrVDRVM1BpNFJNOEovZmpMSzRiVGRJNkhPV3JtUGx1Ykts?=
 =?utf-8?B?Q0VEazV2RklXRUJmdFNRR2Zyd0pRdGdZTjA0dXo3WS9BbXUrd2NocWRpT3VN?=
 =?utf-8?Q?7d5pu11S43d6erFc8Irl62qfK2GuAwYqk6zaO?=
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	c/4fqYUothb/wqrTp9Z+udJVj75uIwUcNEJIVNfbXdrepi9dAd/S13jDMEa9e62OlCjybix63BPJFTkhDck5PhgiXdv0xaQmL4p7AxFllC1Zjl5KkAn3sG6vx5L8uIparZktrSjJUeiXwmeRd+v6ntsL/lNpgK7puUvEbI/Qp0tXfrAfTb7wH3KMmkWJZQn7TcaTWuLNIaSLdndhYGJ4a6d9U9LYihwwx3td6OeIG2Cn+ESvMUnJP510LA3+ASVnV5LucClnE5iiePuRyLJRC0DZu13rrRUtQlNn4MUYBFIumu7OVW8CJm/oYcZHgLiftEwpDGBiguP4uhFjggBETA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	v2//zEqTytcaiFEbRNDbIbq3AJ7tJtQGht2LUuFuycm2MTnxiU9zq4pByj+hM8zI7tZ7kkqwSefBV54wa25KWf6h5aElYvWttBLu7b0QE13PCrd3mELFtNrjIctB9IEfySCDEdM+2Lu8nRcx0HjNNW5iJ7aly0mkZ/iJZIp3l61PeIJdTPKZgrZdCQTSTYzw5tIn+J9hp8k4Ma3BrflYFnU0OUro1FdCW5QYs765SlwNYfFIJ+HrO7MVbISDIZxrHEitBIiEE0w9QU+OfALQB7izymCCIR93nk3nG4t6T+NIYrOj929mBhXx0KpZMJHymi7+UQL/C2WEn5xYxn9ftZlOkSGHUK4D8+0oDFeZR0HGqSlyEIj+6GA2RickTpC29vvoBZKIDdEaf2rqnDYwIRnIpgfhEYLjrOIV2erO/ibbzrYLs1f8VMwfmjsTZYj+xf107g+zKoDLv6dza3O6ToiylVlY46oo2EvZQvR1bwE96gP4ASC4BXv4WKMTDFHs7Mf9kdG5peNdlhzd/3KqT8w0sbxF4HD4NbvSKl3bQAh0cAFV71jAaWx4erSOaK3nJZheEh7oCX6ATwzp47/p5Y/bzmajU82BOW2wwPRIM7jEX1tq+ItEnC/5Xom3tbbI
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dda7334-df59-4a8a-fcc5-08de89de1ed6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 19:47:02.4844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +FCVIOpuzQ3OrJYKmw5o7fHnjotJs+GpL+0xFJ5lf7Tv3njxrrdoD6poG+X1lBgIJU/R1ZjtMuCeRru8n8gY+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR13MB5187
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=fvjRpV4f c=1 sm=1 tr=0 ts=69c2ea43 cx=c_pps
 a=7whtcbPCeBOLW6TxF+pv5A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=bd-SKr3HlWZVCYFCRTQK:22 a=VwQbUJbxAAAA:8
 a=pgMwbierAAAA:8 a=UqCG9HQmAAAA:8 a=iox4zFpeAAAA:8 a=z6gsHLkEAAAA:8
 a=ID6ng7r3AAAA:8 a=5M1dmemzYo2cjqThY5oA:9 a=QEXdDO2ut3YA:10
 a=jg0q2lLtnhMsWSggHq3u:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-ORIG-GUID: mLElQm9VRVO9Jfn9N0ufOuuDdZD9ZHTn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE1MyBTYWx0ZWRfXwudC2VQ6c8Vt
 UtNqGMielMfUph0pQPKYfr71gzRtlXPzEOdb4uvN9ChxFnnJLX7wlDxKg4YiqNo5PPFIqMA5qYu
 8bY9ZJFZikSRY2RtQtGDaTNhl1Z/xACFPuL7Bgq+V6XQimCWHoNe0lU7JZfxFEGn6JneiPp4eCM
 os7qeQO3fwSy6SAwXnD4u2Pm8pCNNWV2JfhapMlr9b8rNXcHfyyg+pCr1wuIl36sr0TMxrr8j6n
 R35GxflmT7BIP3MzSXWV6KAR9ZetrmS2HcwJi9J49tDQ1VkSrHBg8FrdOG2Q4WO1PzkIcF6d3Ns
 tm/nGKNe4mzeXYyoPvxvBBONtSJIW8ybX3rmJP9HJ0fyFSOoFsed5m0q37xi7onXdcCXPLSF+s5
 SJSdimPw6JBzCXZMW909dXWRcZmio7SgrmYHrR/jZhWBc5MQ6407g9Xj6Al/+uUnAflcR5rnuLK
 MTR97OfDlpVqei0MC3g==
X-Proofpoint-GUID: mLElQm9VRVO9Jfn9N0ufOuuDdZD9ZHTn
X-Sony-Outbound-GUID: mLElQm9VRVO9Jfn9N0ufOuuDdZD9ZHTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01

Sorry for the slow response.  See my response and plan inline below.

> -----Original Message-----
> From: Michael Kelley <mhklinux@outlook.com>
>=20
> From: Petr Mladek <pmladek@=E2=80=8Asuse.=E2=80=8Acom> Sent: Friday, Marc=
h 13, 2026 3:=E2=80=8A45 AM > > Finally added timekeeping maintainers and J=
ohn into Cc.
> > We should have added time since v1. > > Anyway, you might see the entir=
e history at
>=20
> From: Petr Mladek <pmladek@suse.com> Sent: Friday, March 13, 2026 3:45 AM
> >
> > Finally added timekeeping maintainers and John into Cc.
> > We should have added time since v1.
> >
> > Anyway, you might see the entire history at
> > https://lore.kernel.org/all/39b09edb-8998-4ebd-a564-7d594434a981@bird.o=
rg/
> >
> > On Fri 2026-03-13 04:52:40, Bird, Tim wrote:
> > > Hey Micheal,
> > >
> > > This report is very interesting.
> > >
> > > Thanks very much for trying it out!
> > >
> > > > -----Original Message-----
> > > > From: Michael Kelley <mhklinux@outlook.com>
> > > > Sent: Wednesday, March 11, 2026 9:47 AM
> > > > From: Tim Bird <tim.bird@sony.com> Sent: Tuesday, February 10, 2026=
 3:48 PM
> > > > >
> > > > > During early boot, printk timestamps are reported as zero before
> > > > > kernel timekeeping starts (e.g. before time_init()).  This
> > > > > hinders boot-time optimization efforts.  This period is about 400
> > > > > milliseconds for many current desktop and embedded machines
> > > > > running Linux.
> > > > >
> > > > > Add support to save cycles during early boot, and output correct
> > > > > timestamp values after timekeeping is initialized.  get_cycles()
> > > > > is operational on arm64 and x86_64 from kernel start.  Add code
> > > > > and variables to save calibration values used to later convert
> > > > > cycle counts to time values in the early printks.  Add a config
> > > > > to control the feature.
> > > > >
> > > > > This yields non-zero timestamps for printks from the very start
> > > > > of kernel execution.  The timestamps are relative to the start of
> > > > > the architecture-specified counter used in get_cycles
> > > > > (e.g. the TSC on x86_64 and cntvct_el0 on arm64).
> > > > >
> > > > > All timestamps reflect time from processor power-on instead of
> > > > > time from the kernel's timekeeping initialization.
> > > >
> > > > I tried this patch in linux-next20260302 kernel running as a guest =
VM
> > > > on a Hyper-V host. Two things:
> > > >
> > > > 1) In the dmesg output, I'm seeing a place where the timestamps bri=
efly go
> > > > backwards -- i.e., they are not monotonically increasing. Here's a =
snippet,
> > > > where there's a smaller timestamp immediately after the tsc is dete=
cted:
> > > >
> > > > [   27.994891] SMBIOS 3.1.0 present.
> > > > [   27.994893] DMI: Microsoft Corporation Virtual Machine/Virtual M=
achine, BIOS Hyper-V UEFI Release v4.1 09/25/2025
> > > > [   27.994898] DMI: Memory slots populated: 2/2
> > > > [   27.995202] Hypervisor detected: Microsoft Hyper-V
> > > > [   27.995205] Hyper-V: privilege flags low 0xae7f, high 0x3b8030, =
ext 0x62, hints 0xa0e24, misc 0xe0bed7b2
> > > > [   27.995208] Hyper-V: Nested features: 0x0
> > > > [   27.995209] Hyper-V: LAPIC Timer Frequency: 0xc3500
> > > > [   27.995210] Hyper-V: Using hypercall for remote TLB flush
> > > > [   27.995216] clocksource: hyperv_clocksource_tsc_page: mask: 0xff=
ffffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120
> ns
> > > > [   27.995218] clocksource: hyperv_clocksource_msr: mask: 0xfffffff=
fffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
> > > > [   27.995220] tsc: Detected 2918.401 MHz processor
> > >
> > > I wonder if the tsc is getting fiddled with or virtualized somewhere
> > > in here, as part of clocksource initialization. I believe each clocks=
ource in
> > > the kernel maintains it's own internal offset, and maybe the offset t=
hat is
> > > being used ends up being slightly different from the cycle-counter of=
fset
> > > that the early_times feature uses. I'm just throwing out guesses.  It=
's about
> > > a 4ms delta, which is pretty big.
>=20
> I'm fairly certain the TSC frequency is not being fiddled with. In a gues=
t VM on
> Hyper-V, the x86 instruction to read the TSC executes directly in hardwar=
e and
> is not virtualized. There *is* per-VM scaling of the TSC value to handle =
live
> migrations across virtualization hosts with different TSC frequencies, bu=
t that's
> not in play during my experiments.

OK - thanks.  I suspected this was the case.
>=20
> > >
> > > > [   27.991060] e820: update [mem 0x00000000-0x00000fff] System RAM =
=3D=3D> device reserved
> > > > [   27.991062] e820: remove [mem 0x000a0000-0x000fffff] System RAM
> > > > [   27.991064] last_pfn =3D 0x210000 max_arch_pfn =3D 0x400000000
> > > > [   27.991065] x86/PAT: PAT support disabled because CONFIG_X86_PAT=
 is disabled in the kernel.
> > > > [   27.991066] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT=
  UC- UC
> >
> > I wonder how the calibration of the cycles is precise. I wonder if
> > the problem might be that cycles were faster right after boot than
> > later during the calibration.
> >
> > I added the following debug output on top of this patch:
> >
> > diff --git a/include/linux/early_times.h b/include/linux/early_times.h
> > index 05388dcb8573..cdb467345bcc 100644
> > --- a/include/linux/early_times.h
> > +++ b/include/linux/early_times.h
> > @@ -20,6 +20,7 @@ static inline void early_times_start_calibration(void)
> >  {
> >  	start_cycles =3D get_cycles();
> >  	start_ns =3D local_clock();
> > +	pr_info("Early printk times: started callibration: %llu ns\n", start_=
ns);
> >  }
> >
> >  static inline void early_times_finish_calibration(void)
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 774ffb1fa5ac..836cb03aaa6d 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -2308,6 +2308,8 @@ int vprintk_store(int facility, int level,
> >  	ts_nsec =3D local_clock();
> >  	if (!ts_nsec)
> >  		ts_nsec =3D early_cycles();
> > +	else
> > +		pr_info_once("local_clock() returned non-zero timestamp: %llu nsec\n=
", ts_nsec);
> >
> >  	caller_id =3D printk_caller_id();
> >
> >
> > And it produced in my kvm:
> >
> > Let's say that start of the cycle counter is
> >
> > Start of stage A
> >
> > [    8.684438] Linux version 7.0.0-rc2-default+ (pmladek@pathway) (gcc =
(SUSE Linux)
> > 15.2.1 20260202, GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.45.0.2025=
1103-2)
> > #571 SMP PREEMPT_DYNAMIC Fri Mar 13 10:23:54 CET 2026
> > [    8.684442] Command line: BOOT_IMAGE=3D/boot/vmlinuz-7.0.0-rc2-defau=
lt+
> > root=3D/dev/vda2 resume=3D/dev/disk/by-uuid/369c7453-3d16-409d-88b2-
> > 5de027891a12 mitigations=3Dauto nosplash earlycon=3Duart8250,io,0x3f8,1=
15200
> > console=3DttyS0,115200 console=3Dtty0 ignore_loglevel log_buf_len=3D1M
> > crashkernel=3D512M,high crashkernel=3D72M,low
> > [...]
> > [    8.696633] earlycon: uart8250 at I/O port 0x3f8 (options '115200')
> > [    8.696639] printk: legacy bootconsole [uart8250] enabled
> > [    8.731303] printk: debug: ignoring loglevel setting.
> > [    8.732349] NX (Execute Disable) protection: active
> > [    8.733447] APIC: Static calls initialized
> > [    8.734667] SMBIOS 2.8 present.
> > [    8.735358] DMI: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.17.=
0-2-g4f253b9b-prebuilt.qemu.org 04/01/2014
> > [    8.737285] DMI: Memory slots populated: 1/1
> > [    8.738380] Hypervisor detected: KVM
> > [    8.739151] last_pfn =3D 0x7ffdc max_arch_pfn =3D 0x400000000
> > [    8.740254] kvm-clock: Using msrs 4b564d01 and 4b564d00
> > [    8.732971] printk: local_clock() returned non-zero timestamp: 3486 =
nsec
> >
> > End of stage A
> >
> > This is the point where printk() started storing the values from
> > local_clock() instead of cycles.
> >
> > Start of stage B
> >
> > [    8.732971] kvm-clock: using sched offset of 252367014082295 cycles
> > [    8.735471] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cyc=
les: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> > [    8.738880] tsc: Detected 3293.776 MHz processor
> > [    8.740474] e820: update [mem 0x00000000-0x00000fff] System RAM =3D=
=3D> device reserved
> > [...]
> > [    8.932671] rcu: srcu_init: Setting srcu_struct sizes based on conte=
ntion.
> > [    8.934047] Early printk times: started callibration: 201079507 ns
> >
> > End of stage B
> >
> > This is where we started calibration of early cycles.
> >
> > Start of stage C
> >
> > [    8.935571] Console: colour dummy device 80x25
> > [...]
> > [    9.289673] thermal_sys: Registered thermal governor 'fair_share'
> > [    9.290077] thermal_sys: Registered thermal governor 'bang_bang'
> > [    9.292290] thermal_sys: Registered thermal governor 'step_wise'
> > [    9.293530] thermal_sys: Registered thermal governor 'user_space'
> > [    9.294856] cpuidle: using governor ladder
> > [    9.296302] cpuidle: using governor menu
> >
> > Here the thermal governors are registered. I guess that they might
> > reduce speed of some HW.
> >
> > [...]
> > [   11.974147] clk: Disabling unused clocks
> >
> > Some unused clocks are disabled. I wonder if this might affect
> > counting the cycles.
> >
> > [   12.330852] Freeing unused kernel image (rodata/data gap) memory: 15=
00K
> > [   12.351191] Early printk times: mult=3D19634245, shift=3D26, offset=
=3D8732967929 ns
> >
> > End of stage C
> >
> > Here is the end on calibration.
> >
> > Now, if the frequence of the cycles was:
> >
> >    + was higher in the stage A when only cycles were stored
> >    + was lower in stage C when it was calibrated against local_clock()
> >
> > Then it might result in higher (calibrated) timestamps in stage A
> > and step back in stage B.
> >
> > Or something like this. It is possible that even local_clock() does
> > not have a stable frequence during the early boot.
>=20
> In my VM on Hyper-V, I do see a problem with the results of your
> calibration code. Over the calibration interval, you calculate the delta
> number of nanoseconds from local_clock() and the delta number of
> TSC cycles. The delta TSC cycles divided by the delta nanoseconds
> should yield the TSC frequency. But the result of your calibration code
> is about 3.05 cycles/nsec, when the actual TSC frequency is 2.918
> cycles/nsec for the hardware I'm running on.
>=20
> In a Linux VM where CONFIG_PARAVIRT=3Dy, local_clock() eventually
> comes down to native_sched_clock(), which just reads the TSC and
> then converts to nanoseconds based on the kernel's understanding
> of the TSC frequency. So I don't think the local_clock() frequency is
> varying. But I'm thinking there are some adjustments being made
> to the value returned by local_clock() during early initialization, and
> I didn't try to track those down.

Thanks very much for this data point and information!

>=20
> Hyper-V provides guest VMs with a synthetic clock (that is based
> on the TSC). As an experiment, I used that clock in the early time
> calibration, and everything worked properly. The calibration code
> produced delta nanoseconds and delta cycles that were exactly
> 2.918 cycles/nsec, and the transition from Stage A to Stage B was
> correct -- no cases of a smaller timestamp following a larger
> timestamp. So my conclusion is that the calibration is indeed
> problematic, though I haven't identified why the nanoseconds
> delta from local_clock() is smaller than it should be.

I'll do a deep dive on my calibration math and see if I can
figure out the problem.  One guess I have is that it could
be an error in precision due to not enough time accumulating in local_clock
before the start of calibration.  I plan to move the calibration start arou=
nd,
as well as compare the math from my calibration with the one done by=20
local_clock() to try to figure out the discrepancy.
=20
> >
> > Idea: A solution might be to start calibration when printk()
> >       gets first non-zero time from local_clock.
> >
> >       Something like:
> >
> > diff --git a/include/linux/early_times.h b/include/linux/early_times.h
> > index 05388dcb8573..09d278996184 100644
> > --- a/include/linux/early_times.h
> > +++ b/include/linux/early_times.h
> > @@ -16,10 +16,13 @@ extern u64 start_ns;
> >  extern u32 early_mult, early_shift;
> >  extern u64 early_ts_offset;
> >
> > -static inline void early_times_start_calibration(void)
> > +static inline void early_times_may_start_calibration(u64 ts_ns)
> >  {
> > +	if (start_ns)
> > +		return;
> > +
> > +	start_ns =3D ts_ns;
> >  	start_cycles =3D get_cycles();
> > -	start_ns =3D local_clock();
> >  }
> >
> >  static inline void early_times_finish_calibration(void)
> > diff --git a/init/main.c b/init/main.c
> > index 27835270dfb5..a333b0da69cf 100644
> > --- a/init/main.c
> > +++ b/init/main.c
> > @@ -1123,9 +1123,6 @@ void start_kernel(void)
> >  	timekeeping_init();
> >  	time_init();
> >
> > -	/* This must be after timekeeping is initialized */
> > -	early_times_start_calibration();
> > -
> >  	/* This must be after timekeeping is initialized */
> >  	random_init();
> >
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 774ffb1fa5ac..19330b6b4eb2 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -2306,7 +2306,9 @@ int vprintk_store(int facility, int level,
> >  	 * timestamp with respect to the caller.
> >  	 */
> >  	ts_nsec =3D local_clock();
> > -	if (!ts_nsec)
> > +	if (ts_nsec)
> > +		early_times_may_start_calibration(ts_nsec);
> > +	else
> >  		ts_nsec =3D early_cycles();
> >
> >  	caller_id =3D printk_caller_id();
> >
> >
> > > >
> > > > 2) A Linux VM running in the Azure cloud is also running on Hyper-V=
. Such a
> > > > VM typically uses cloud-init to set everything up at boot time, and=
 cloud-init
> > > > is outputting lines to the serial console with a timestamp that loo=
ks like the
> > > > printk() timestamp, but apparently is not adjusted for the early ti=
mestamping
> > > > that this patch adds. Again, I haven't debugged what's going on -- =
I'm not
> > > > immediately sure of the mechanism that cloud-init uses to do output=
 to the
> > > > serial console. The use of the Hyper-V synthetic clock source might=
 the cause
> > > > of the problem here as well. Here's an output snippet from the seri=
al console:
> > > >
> > > > [   20.330414] systemd[1]: Condition check resulted in OpenVSwitch =
configuration for cleanup being skipped.
> > > > [   20.332911] systemd[1]: Condition check resulted in Set Up Addit=
ional Binary Formats being skipped.
> > > > [   20.333257] pstore: Registered efi_pstore as persistent store ba=
ckend
> > > > [   20.334360] systemd[1]: Condition check resulted in File System =
Check on Root Device being skipped.
> > > > [   20.338319] systemd[1]: Starting Load Kernel Modules...
> > > > [   20.341094] systemd[1]: Starting Remount Root and Kernel File Sy=
stems...
> > > > [   20.350993] systemd[1]: Starting udev Coldplug all Devices...
> > > > [   20.356255] systemd[1]: Starting Uncomplicated firewall...
> > > > [   20.361536] systemd[1]: Started Journal Service.
> > > > [   20.386902] EXT4-fs (sda1): re-mounted c02dce0c-0c40-4e6e-88af-c=
5a0987b0adb r/w.
> > > > [   22.532033] /dev/sr0: Can't lookup blockdev
> > > > [    7.955973] cloud-init[783]: Cloud-init v. 24.3.1-0ubuntu0~20.04=
.1 running 'init-local' at Wed, 11 Mar 2026 15:27:06 +0000. Up 7.48
> seconds.
> > > > [    9.933120] cloud-init[822]: Cloud-init v. 24.3.1-0ubuntu0~20.04=
.1 running 'init' at Wed, 11 Mar 2026 15:27:08 +0000. Up 9.82
> seconds.
> > > > [    9.935483] cloud-init[822]: ci-info: ++++++++++++++++++++++++++=
++++++++++++Net device
> info+++++++++++++++++++++++++++++++++++++++
> > > > [    9.937726] cloud-init[822]: ci-info: +--------+------+---------=
--------------------+---------------+--------+-------------------+
> > > > [    9.939905] cloud-init[822]: ci-info: | Device |  Up  |         =
  Address           |      Mask | Scope  |     Hw-Address    |
> > > > [    9.942059] cloud-init[822]: ci-info: +--------+------+---------=
--------------------+---------------+--------+-------------------+
>=20
> The cloud-init output to the serial console is coming from syslog, which =
is
> presumably writing directly to /dev/console. This output is also recorded
> in the syslog log files (/var/log/syslog in my Ubuntu system), though with
> timestamps in a text format like
>=20
> 2026-03-14T08:44:24.781241-07:00
>=20
> The timestamps recorded in /var/log/syslog, and as shown with the
> 'journalctl' command, are monontonic using that full date/time format. But
> 'journalctl' with the "-o short-monotonic" option shows the seconds-since=
-boot
> format, and in that case, the cloud-init timestamps are discontinuous wit=
h the
> kernel messages, like in the serial console output. I don't know exactly =
where
> journalctl gets its knowledge of the boot time, but among the possibiliti=
es are:
>=20
> /proc/uptime
> /proc/stat (the "btime" field)
>=20
> These are not adjusted for using early boot times. And it's not clear whe=
ther
> they should be -- I don't know what the big picture implications would be.
> And there are probably other places the boot time is available to user sp=
ace.
> If using early boot times is intended to be only for occasional diagnosti=
c use,
> then maybe living with the discontinuity is OK. I see that Shashank Balaj=
i has
> also commented about userspace issues, which covers this syslog case.
>=20
> I think all this gives a first-level explanation of what I'm seeing in a
> Hyper-V guest. I don't think any of it is specific to Hyper-V guests
> or the Hyper-V synthetic clock sources. The issues are more generic.
> Sorry. :-(

Yeah - I was worried about other timestamps not being in synchronization
with my adjusted printk timestamps.  Looks like that worry was justified.

At this point, there are two avenues:

 1) double-down and embed the offset (from power-on rather than from time_i=
nit)
    all the way into local_clock() and/or whatever is providing CLOCK_MONOT=
ONIC
    and CLOCK_BOOTTIME, or

 2) back off, and abandon adding the offset to local_clock()-based printk t=
imestamps.
    This would leave a discontinuity when EARLY_PRINTK_TIMES was enabled,
    between the (now) non-zero early printk timestamps and the ones followi=
ng
    time_init().  This has the benefit of changing less code, and only affe=
cting
    the early printk timestamps (and none of the rest of the system).  And =
it has
    the downside of leaving the possibly confusing time discontinuity
    early in the kernel log.  So far, I haven't seen any tools confused by =
this, and
    I can put a message before time_init() to inform humans about the switc=
h.

The purpose of this patch is really focused on that early period of boot, w=
here all
other timing and tracing mechanisms are unavailable, and limiting the impac=
t to
just those early (currently zero) timestamps seems like the best course.

Of course I still need to get the calibration correct, and I'll work on that
before sending another update.
 -- Tim
