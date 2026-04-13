Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37B83B4E9C;
	Mon, 13 Apr 2026 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776103180; cv=fail; b=XlqUb4mxa9wlKALHjXsCPWsbCPxrOTjs9GEXieUadNLK3jhVR+rwN4o2V7r4x4ELKE/S54L+RgM6ZMYgw9iVDrQ+E2YqMxh+kPokkIBzRUqIkSBSzNyqcmZBC/e39/NN8UVENO1OuN5GZKLok2QjgCC3VWHBThg/trUVF9EOz+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776103180; c=relaxed/simple;
	bh=of2d6h5BD1lz4Qy8nftYgGXOb08cjHYJDXfukSuGvgk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iecWenMiQvJt3zbL982/ScVZIqEpEKpoOZCv4TcbNIEy/Y/JTuMdJlHbaPIk8RBls4IKlLQtv/oJRQCT7q6qbS0IBQnFynJ7vA0cr5aSPeSGjnynWrb9rODau4MfIYQGMgESXKKYsM7Xk7/vI6oigiILSn3ZiMoh+6Ylr6207YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=OnMJqNlH; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="OnMJqNlH"
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DHsjUL1433395;
	Mon, 13 Apr 2026 17:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=of2d6h5
	BD1lz4Qy8nftYgGXOb08cjHYJDXfukSuGvgk=; b=OnMJqNlHcUatdStAao+12xs
	FTkLG+NWf5neZEPuLtaRzHOZKeAVT3Eb0PssN4tBi4/bfvJNtp//ltdHOBFr0xst
	L5CqvpwevaEFWVilwyVq6DWDdKsp9aP5qdB7mSdVAF1go41rlHGTKWyoKdvPJxkx
	y1C2bR1oippUmSqc+faeD4lQv1+BzTjGxGb3vPH6oiAkkO6srhoJkBV+F+FVsgkn
	gBMAX5hti73NNciuPfQRL9khPPqkANbFtGbsDzsvPOVmnfG5j4p8vzuYtRz2Sph/
	YJNaifXez2mA6qXCNRp1ROCqGIHvEcLLLdwUcOHSaiMLbizM4pxDTlupmAHStYQ=
	=
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4dfcv4tb4r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 13 Apr 2026 17:58:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwvhuJMSt1auIMhngK5XjKb7hZGftW7EX2swgf6w5t6G4zGLSoG61F/n+zF4/kpaVlNTv6HBZYevG2h+mWUku8PbTnD0KGQMcAZ25uDMFvQL8cbjK9TZa6vink9u12BxgXzSQU7drKbuwlKldiYYecnCIjOj4RnNtii9HFOhGwOsdaZofKWfEftzVFl9SGXAYSOMGF898xt+vCwiwXD6dV8Gmsh/r8MWgMeCWaDzQECxW173r0oTjJ84hkzruQ7690IHvPkPvoDPasAFILd5Wd2AY+8Ypm3ThFTdo0L62s/lTD5AVfxECQtScchbNDD/IB0HHH28KgCT0xrQwOEBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=of2d6h5BD1lz4Qy8nftYgGXOb08cjHYJDXfukSuGvgk=;
 b=DqqJBYpW3MI9RTobwIae+lCgePnZwX8XXQlPmHF/nIjoeqVosf6/P2d9XhxucvMCZoWUvh1abE50nZ+UviXDUWwo53pc6Go9bcEjtsaWxoCflGi/XrqvAEVryDkvccRoPFQU/fP1WS15aJ6atHOaeJb7MS1617inZ5wpvZwDmJ1dEc8F/Rzy+fchBF2iAtn1lnRB1XLVu/1g1ezeWuArXAmTgIF+iEPpbZp2KTB2GyvYjyRNumFWzCA2vM13thKQNnC6dwNHdBjUvg2YKU48PPuElqGLSucNdlqUBi7IqsHkN2cm12AIFvl1jagHiC0TT/R3ijZAoRjq172U15zdZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SA6PR13MB7133.namprd13.prod.outlook.com (2603:10b6:806:407::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 17:58:35 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%3]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 17:58:34 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: kernel test robot <lkp@intel.com>, "pmladek@suse.com" <pmladek@suse.com>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "john.ogness@linutronix.de"
	<john.ogness@linutronix.de>,
        "senozhatsky@chromium.org"
	<senozhatsky@chromium.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "francesco@valla.it" <francesco@valla.it>,
        "geert@linux-m68k.org"
	<geert@linux-m68k.org>,
        "tglx@kernel.org" <tglx@kernel.org>,
        "shashankbalaji02@gmail.com" <shashankbalaji02@gmail.com>,
        "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early
 boot
Thread-Topic: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in
 early boot
Thread-Index: AQHcySnwCKS9XsxkTEiUYBbigES1DrXbNuIAgAITqgA=
Date: Mon, 13 Apr 2026 17:58:34 +0000
Message-ID:
 <MW5PR13MB563241C9F7C8BCAF0D5F3D21FD242@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20260410203741.997410-2-tim.bird@sony.com>
 <202604121822.OvOLcTnO-lkp@intel.com>
In-Reply-To: <202604121822.OvOLcTnO-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SA6PR13MB7133:EE_
x-ms-office365-filtering-correlation-id: 965a69f1-f3a6-4101-d3fe-08de99864836
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 KAF3r7nQnIlCMDGg5fK9QfyCmaBS5A3ku5jJkuIEUvD2veB5ESQZO1+9soms1bDgMwNQbYzD5z79y9C5smLh5hP5bPDbeW9NrnRyzqn60zqCzfBhIK31M7fUWB0eKDtegIhcuJs+MzSmq1sDUiAc/ADbXf6U4AgiNkXIb1QZjdy9jIUNumaSmA7IswTOQkJhqPz6AvAVtUFzmtaXRE0kx3qCbA6noHG+cgQiB+eFCrX6aew3ru4n6IHbJW9TEfM0LcYEcI2HHwdAJC3QD2w0k4e4Uw0qb5vf+u3l4+234Pyot89aV+B1Vh6dPJskiWoJOPmyljBC7pwAw6hRasafhYR3kx6AkGpSehYQwJ9weuZwPrh3eLO1wETj++S1VB0qj2k/ZR3oXVYXgTTkNJ9fm/KlQebRhTrdtVsKYXw50n974IMdXK8/g1BOUHWGcSyRU38XhhYFyof9L89iF8B+bFylk5bojGbXoj5nU08ryOP9oCOSvAaQPSO0cMLfl1je2xMANsp4I6azBsmj5Er7t6uf7MZQX6MtI0SgirNZ+gEupo5/zbAUi9vMkvbImPA23HfFGNf4I6YNfuHZoBOAEZKoOaDvc1vk/OGsBvZ8nb0Cft4RgjPdl9xIlwue2st8ZM+SZBMTk/qNYYraqpDTXn2kPPwCD9KPRRUyKKsu1Iu8YPNvPTJoArLCql0Rxtf1yovgPXnuatX+nk7z/X9VKb6f60wx1J9xndrf0Fg5AgiyJImIzXFwAWj+EUozkbqx
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UlJvcU5mdmRTak1xK0x3b3k1MDErTEFuRTI3b2YrOVliOEtKdU5nQWkyYUkw?=
 =?utf-8?B?c0E5VkFsbXNEQnRnZ2RlOFE4S2N5WWJORC8wQzh0QzBuUzJDeVFsakRYVmxP?=
 =?utf-8?B?dk44TE92L0tEbmcwRy9rN244dUc2eERMNjJvMjVFZktCdHlBekt4cmJaa2J0?=
 =?utf-8?B?dEFoeEpXZnR3QUxwMDIwbUdGN0hEVXM2SSt6TnVYZU5UOVhPRzVJSDBOWHNL?=
 =?utf-8?B?UFVndWdMOEozV0pDL0hMYXZGNDFKOHBZNGIvRFAwZ0dFaGs3TGtvNjU0Tis4?=
 =?utf-8?B?cXNUNjE1Q3kzMmlkVXI0RUx3VUVOUlB5WVpzU3h6dllKaGZidnZmVjJLcVVB?=
 =?utf-8?B?OEg1Q083bnFQQ1ZOVHU0NDFNaThiMjl6U2EzQW5FYzJYVnFOeXQ5WEZSTnVa?=
 =?utf-8?B?bmQzNWNmN3kwRnk5WjdVVDBZSmw2ZHBaWHJLVDVyZUxaL2o4TWhyTTVaNkNO?=
 =?utf-8?B?bHhabEFoZk5PeXBnVkwxbTFaRW1jQjc0UnpodUtBSlczb1pyMjBucWdxOWFt?=
 =?utf-8?B?VEM5bFhDOFVWNW83dDRTT1liWXR0Z0JWdXQ5d0tFbEROejJoUTkwRkh4cGIr?=
 =?utf-8?B?aFdFYUJmSHpOaSt0YUNPUUV5T0xsaUQralBoM3BjaE1ZVmVDRFo4WnRyQjlm?=
 =?utf-8?B?UVZsR2xwalptUGJhNFFHVzd3UUo3YVc0NXBIaG1DYWk1S2VFSjIxYTVodUJ6?=
 =?utf-8?B?ZDQ0YW9ZQzhOK25xcFBPNWh4T05wRy82UjU0bW10T2I2VWZjcUt1aE5nUkYv?=
 =?utf-8?B?WVp5ejl3NDkrRXVzVkQwdG1EQVFnUW9pR2NzcTg4WjJHQmJ6L2pRZ0x2d0VF?=
 =?utf-8?B?cVFiN21LT1o4Sjh2aUphQVdtSCtybEhvRXZyanFiZ2p2K1V1S216Zy9DSkNv?=
 =?utf-8?B?WEFTQ3VoVHA3b2YyV0Fzb1ZIYnlkK0JEZmJqU2JYZjZ4WjRzWjMrclhiQTVl?=
 =?utf-8?B?RlJPMCtobStwdXluSkhvN0xiWWxWRzJLeGN6SWVFTHNBSWFacmVnQngzTnUr?=
 =?utf-8?B?aWI3MTZ3Z2FEbW9rQ3F4QW83QVVmQWJaZVFRUFduOVBYbXM5T1N4a2pIOFRo?=
 =?utf-8?B?MDd3K29waHJBeEJxTDVvSEwwb1pwSUVrN3cwYWZ3ZWR3ODJFRUt4QUZqV24r?=
 =?utf-8?B?MjUyN2lpejE4L2VTbE5mVXlndDU2a3ZjdHhHdEgrK3pOK3UybkRGKzhGUlhu?=
 =?utf-8?B?OTlhbk1qcDhxYS9GemttQ3VYUFl5MjBLVXBEd2FWbmNlbXh2WmJMWWhUK2xW?=
 =?utf-8?B?YndDbXFaT1Z5TDZ2WURCaEtzZjZNdjVZUGs0L3VrSk9JMkEzcU1seGdBTzc0?=
 =?utf-8?B?MmZRc1pSOWp6eGN4YTJCdFV0TldpWUhKZzEySVpLOUc0QVBySk04aTVESGFV?=
 =?utf-8?B?TXgwUGRhazVuQVN0SEZWdTdKa09kSUJTSlpuT2tybUpucmQ3MDFYZ3IvbjB4?=
 =?utf-8?B?RkhOb3lQZVVoU2dhZ3oxUFg4MzBkUktZZTQ0OXNheWhNNVRUUFBELzdOclFV?=
 =?utf-8?B?eUNYZlpWVTZ0SW1FUTByeTI5VXZnY1JXOEdQdlphdW5EKzF2K05WZXVzRFM0?=
 =?utf-8?B?Mzh0TVprTWFhQW1pT1MzNmh5djQwRUhQWkRIWTRqSWQrWlI0TStxSUFYb0xZ?=
 =?utf-8?B?TC8xTDdzanc5UGVQSE5DdFlMcU1CRlFvaTRCbnBGbXhuRkJRZlFZbXlFb2p4?=
 =?utf-8?B?UWorVWQvYS8vblN4LzZjRGk2Zi9sejJtcXNVNWtIYkh1T1l4bnBYUm9SbUh1?=
 =?utf-8?B?M2ZESlZhWXUvUC9vcGN6c2h6WnZUOVllNC9iemRkVEtNQ2prdkYxRk5xZUtn?=
 =?utf-8?B?S3o3TUVvTWhQNHRXdVk1MGxGRjRRVEpMd2RuS21meHZ6RDVHUlExZ3VGS0VX?=
 =?utf-8?B?ME1XWVFta0pXYUNyV2lVdlhybTZObGJoVjVzNDgrOTFaYXFZWEg5MzJpbWVX?=
 =?utf-8?B?QWtNZHlhajhtVWVsRnZENCsvRlFWRnhCam4reVo3L1NidEF1VDJzeVdmQTJX?=
 =?utf-8?B?VGMwQVdSMWRnaFlJVmQydjd4bmdOKzd5V1pVbjROc2ErOFV6VzlFM0RqRzFU?=
 =?utf-8?B?S3EzK2xMOXNuQnFsMUdmY3Y1dTVqaHlOMWFNRTNRalB3SUdiZzJOMHB1Mzly?=
 =?utf-8?B?SlZvL29rUlk4d3NhZm9VOStTblNwSCsrR05BSys3aS80d1pSVDR0cHkrOXpE?=
 =?utf-8?B?ZGZLMWs5N3U2Tk1FOC9PWFhCN2NHSFBxR2hQbDhOK1lzdG9KRTZZdW5LUTVs?=
 =?utf-8?B?bGEyaytUZ09CSVJMMlhBTDgvUXM1end2QkxXaDRGUWpDL2FhcER2T0JWRmhy?=
 =?utf-8?B?SGJwMWp6dWpwdElZcHI1S0FQNUtieUZ5d1JJbEJwazI4QnpRSi9CRG1FSnV0?=
 =?utf-8?Q?eizBCyJfQLPFAwF4gUHib7b0R9HdcLxvuaGgD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Ef2FZNt9Wd+WROdfrm/Xp8co7tdhRKUbKHmOjkDDtH9x5F5NtsNE/LmN4TROBuWwQ4mSLASda1nTtOranSLiUTirXcjiPltao6nvEEZp7H+aemF9dLFV9NO2T2sa2IMnAt7CtyqVIydko/aH/AKm7litqUEnV6+N+s/02O/UftyijuqQe1U32AYBJujA+fhuBnZJurynDLYdZ9igG4R90UIBmOaQEo6cdnXHdJ6RNz1FcCoDJmtd8jI9SQO2ILbUtZp93v/GIXArQiLiamUAjNLfkpuYXrI7TAKjyoUYR9+rbhn01drlSCbE2dnUQ4SwMp+stfv8uAG1qCHHt8jgWg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	01yqqHejVGpO+RDlge/ts3A+LWpEyopzUsphavQhoMdT09XDfgP1VcU3/MlTqDqWAyxZZMb/Ff9OEEWXHB90E5Znx9ikpIkN6buezTAGXaGGLLRUYnjc3e4ruKNoCJ4qs6b263S7WxXeaGhp8eo+MyHuu+cEr7ZRE/6t9ZOei+x7nWqmmZWK9gGqPjbj9e6x+fi9ZcY/iJxVEx7JgpyTgERDzAdQIt80tVHFx1+pgpJr4rW3ICSZcXk98kOu9A/4oULoa3uIy1yRZRw/fIuB0+/ItPrQkfOgQLcQeHZAP33jr4CYKhnmUQGx3GjMR658Gt3lUo4RvoEYr1NmE7Au7weBFUI/0XDwFVRGmWwHXDKa0SEKbXV1eN3dnfPaKgEDw7hi+U3GDdqlUH1PlRD42iMZCdQQwkZS+Gs64X/Ff7ueBm1eMR8SdBMw7LS27NguQA14LW0iU4VuUqvmTEMSsSop0zNzppCTt2Y8v7sTX/dpKo+3NXzlJ8K0oC9/J+y6nqqIArbUx+dLufLYC1rbcFA3VjvZ0zzA+3f6WBEWinDQ/r/GfaUnEl3CheJ6wLnxMLJgA7/WunUAQD3t4njOjJ1TvTM+KQY7ZIIwa3uQNWuDa3Hae767hC/tSd8+GUqK
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965a69f1-f3a6-4101-d3fe-08de99864836
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 17:58:34.9316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rIhekK5S+GslnYkAct4WrMSIOxRgWS/2cSqFhuAImiYOPqWzFxHdG8uYAjFR/n7RiUEq6MdVYbzT6vYg2TcufA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR13MB7133
X-Proofpoint-ORIG-GUID: p3P_qBu-siHYvnREhep62YVGDnHhZOga
X-Proofpoint-GUID: p3P_qBu-siHYvnREhep62YVGDnHhZOga
X-Authority-Analysis: v=2.4 cv=Xbi5Co55 c=1 sm=1 tr=0 ts=69dd2ecf cx=c_pps
 a=rlKp08D5gBKtwCtLUzcdEg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=XGr2FpfLDd2dUKU_94WB:22 a=anyJmfQTAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=z6gsHLkEAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=myrUAT9Cg681sXkrklcA:9 a=QEXdDO2ut3YA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3NyBTYWx0ZWRfXyKBiL3YEfo3e
 85aPcmQkO/ltFXVk7AI45tonLl8f8JVmP3wmp0pumCmkjmXjJmk4fUuBQIA0wSROEDFb/+gh3ZF
 cqVlgQ0Vm7unCD11/s0BTvQnEuLkgUOqPEiMOE0zQgnqiuOCsBHrZ+vmahnH3vTzXDTeGlUHpbR
 GMmcqDRYnXmHLpNAVwJqpwEkQy52KZ3hbU/2DkeCTqFtcPq0o9ni4HHTdTfPXEcTf6RzpWcQae4
 7vJ+TMxUEtDniSHgQxYEd8MhsuJmVaYGHISjkephYgJwoJBDEFgMgMRYMxV0gSrKbsPWC5lbTzg
 qcc3JQ5yiRAQkgz6DzJYdX2NjnL4rwyLssCmSpoYzy1cZj4j5dKPuPyh1wx6zuE4mIYdZaOMe1O
 jxj1+GSDgHvcNTV92Nw+H0S8NIW0XT0WwUI7f9CNvkI66yao4mDWWOqdQwuE8GvnGoHRtjzTHcp
 kFPcFCrdypAUTqzG2vw==
X-Sony-Outbound-GUID: p3P_qBu-siHYvnREhep62YVGDnHhZOga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01

SG1tbSwNCg0KVGhpcyBpcyBhIGZhbHNlIHBvc2l0aXZlIHdhcm5pbmcgZnJvbSB0aGUgY29tcGls
ZXIgKHNlZSBiZWxvdykuDQoNCkkgYXBvbG9naXplIGZvciBub3QgY2F0Y2hpbmcgaXQuICAgSSBk
aWQgdGVzdCB3aXRoIENPTkZJR19FQVJMWV9DWUNMRVM9MA0KYW5kIEknbSBub3Qgc3VyZSB3aHkg
SSBkaWRuJ3Qgc2VlIHRoZSB3YXJuaW5nLg0KDQpJJ2xsIHNlZSBpZiBJIGNhbiBzaWxlbmNlIHRo
aXMgd2FybmluZy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBrZXJu
ZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gU2VudDogU3VuZGF5LCBBcHJpbCAxMiwg
MjAyNiA0OjExIEFNDQo+IEhpIFRpbSwNCj4gDQo+IGtlcm5lbCB0ZXN0IHJvYm90IG5vdGljZWQg
dGhlIGZvbGxvd2luZyBidWlsZCB3YXJuaW5nczoNCj4gDQo+IFthdXRvIGJ1aWxkIHRlc3QgV0FS
TklORyBvbiBsaW51cy9tYXN0ZXJdDQo+IFthbHNvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiB2Ny4w
LXJjNyBuZXh0LTIwMjYwNDEwXQ0KPiBbSWYgeW91ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3
cm9uZyBnaXQgdHJlZSwga2luZGx5IGRyb3AgdXMgYSBub3RlLg0KPiBBbmQgd2hlbiBzdWJtaXR0
aW5nIHBhdGNoLCB3ZSBzdWdnZXN0IHRvIHVzZSAnLS1iYXNlJyBhcyBkb2N1bWVudGVkIGluDQo+
IGh0dHBzOi8vZ2l0LXNjbS5jb20vZG9jcy9naXQtZm9ybWF0LXBhdGNoI19iYXNlX3RyZWVfaW5m
b3JtYXRpb25dDQo+IA0KPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1sYWItbGtw
L2xpbnV4L2NvbW1pdHMvVGltLUJpcmQvcHJpbnRrLWZpeC16ZXJvLXZhbHVlZC1wcmludGstdGlt
ZXN0YW1wcy1pbi1lYXJseS1ib290LzIwMjYwNDEyLTEzNDcyNg0KPiBiYXNlOiAgIGxpbnVzL21h
c3Rlcg0KPiBwYXRjaCBsaW5rOiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwNDEw
MjAzNzQxLjk5NzQxMC0yLXRpbS5iaXJkJTQwc29ueS5jb20NCj4gcGF0Y2ggc3ViamVjdDogW1BB
VENIIHY0IDEvMV0gcHJpbnRrOiBmaXggemVyby12YWx1ZWQgcHJpbnRrIHRpbWVzdGFtcHMgaW4g
ZWFybHkgYm9vdA0KPiBjb25maWc6IGFybTY0LWFsbG5vY29uZmlnIChodHRwczovL2Rvd25sb2Fk
LjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyNjA0MTIvMjAyNjA0MTIxODIyLk92T0xjVG5PLWxr
cEBpbnRlbC5jb20vY29uZmlnKQ0KPiBjb21waWxlcjogYWFyY2g2NC1saW51eC1nY2MgKEdDQykg
MTUuMi4wDQo+IHJlcHJvZHVjZSAodGhpcyBpcyBhIFc9MSBidWlsZCk6IChodHRwczovL2Rvd25s
b2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyNjA0MTIvMjAyNjA0MTIxODIyLk92T0xjVG5P
LWxrcEBpbnRlbC5jb20vcmVwcm9kdWNlKQ0KPiANCj4gSWYgeW91IGZpeCB0aGUgaXNzdWUgaW4g
YSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGkuZS4gbm90IGp1c3QgYSBuZXcgdmVyc2lvbiBvZg0K
PiB0aGUgc2FtZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzDQo+IHwg
UmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiB8IENsb3Nl
czogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI2MDQxMjE4MjIuT3ZP
TGNUbk8tbGtwQGludGVsLmNvbS8NCj4gDQo+IEFsbCB3YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4
ZWQgYnkgPj4pOg0KPiANCj4gICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGtlcm5lbC9wcmludGsv
cHJpbnRrLmM6NDk6DQo+ICAgIGluY2x1ZGUvbGludXgvZWFybHlfdGltZXMuaDogSW4gZnVuY3Rp
b24gJ2Vhcmx5X3RpbWVzX25zJzoNCj4gPj4gaW5jbHVkZS9saW51eC9lYXJseV90aW1lcy5oOjQ1
OjYxOiB3YXJuaW5nOiBkaXZpc2lvbiBieSB6ZXJvIFstV2Rpdi1ieS16ZXJvXQ0KPiAgICAgICA0
NSB8ICAgICAgICAgICAgICAgICByZXR1cm4gKGVhcmx5X3Vuc2FmZV9jeWNsZXMoKSAqIE5TX1BF
Ul9LSFopIC8gQ09ORklHX0VBUkxZX0NZQ0xFU19LSFo7DQo+ICAgICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KPiAN
Cj4gDQo+IHZpbSArNDUgaW5jbHVkZS9saW51eC9lYXJseV90aW1lcy5oDQo+IA0KPiAgICAgMzQN
Cj4gICAgIDM1CS8qIHJldHVybnMgYSBuYW5vc2Vjb25kIHZhbHVlIGJhc2VkIG9uIGVhcmx5IGN5
Y2xlcyAqLw0KPiAgICAgMzYJc3RhdGljIGlubGluZSB1NjQgZWFybHlfdGltZXNfbnModm9pZCkN
Cj4gICAgIDM3CXsNCj4gICAgIDM4CQlpZiAoQ09ORklHX0VBUkxZX0NZQ0xFU19LSFopDQo+ICAg
ICAzOQkJCS8qDQo+ICAgICA0MAkJCSAqIE5vdGU6IHRoZSBtdWx0aXBseSBtdXN0IHByZWNlZGUg
dGhlIGRpdmlzaW9uIHRvIGF2b2lkDQo+ICAgICA0MQkJCSAqIHRydW5jYXRpb24gYW5kIGxvc3Mg
b2YgcmVzb2x1dGlvbg0KPiAgICAgNDIJCQkgKiBEb24ndCB1c2UgZmFuY2llciBNVUxUL1NISUZU
IG1hdGggaGVyZS4gIFNpbmNlIHRoaXMgaXMNCj4gICAgIDQzCQkJICogc3RhdGljLCB0aGUgY29t
cGlsZXIgY2FuIG9wdGltaXplIHRoZSBtYXRoIG9wZXJhdGlvbnMuDQo+ICAgICA0NAkJCSAqLw0K
PiAgID4gNDUJCQlyZXR1cm4gKGVhcmx5X3Vuc2FmZV9jeWNsZXMoKSAqIE5TX1BFUl9LSFopIC8g
Q09ORklHX0VBUkxZX0NZQ0xFU19LSFo7DQpCYXNlZCBvbiB0aGlzIGNvbmRpdGlvbmFsLCBpdCdz
IG5vdCBwb3NzaWJsZSBmb3IgQ09ORklHX0VBUkxZX0NZQ0xFU19LSFogdG8gYmUgemVybw0Kb24g
dGhpcyBsaW5lIG9mIGNvZGUuICBEb2VzIEdDQyBub3QgY2F0Y2ggdGhpcz8NCmlmICgwKQ0KICAg
eCA9IDxzb21lIGV4cHJlc3Npb24+LzA7DQoNClNvIHRoaXMgaXMgYSBmYWxzZSBwb3NpdGl2ZS4N
Cg0KPiAgICAgNDYJCXJldHVybiAwOw0KPiAgICAgNDcJfQ0KPiAgICAgNDgJI2Vsc2UNCj4gICAg
IDQ5CXN0YXRpYyBpbmxpbmUgdTY0IGVhcmx5X3RpbWVzX25zKHZvaWQpDQo+ICAgICA1MAl7DQo+
ICAgICA1MQkJcmV0dXJuIDA7DQo+ICAgICA1Mgl9DQo+ICAgICA1MwkjZW5kaWYNCj4gICAgIDU0
DQo+IA0KPiAtLQ0KPiAwLURBWSBDSSBLZXJuZWwgVGVzdCBTZXJ2aWNlDQo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9pbnRlbC9sa3AtdGVzdHMvd2lraQ0K
