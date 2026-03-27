Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F8233FE36;
	Fri, 27 Mar 2026 18:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774634753; cv=fail; b=oY7YDVh5C9LaZl56UvoVWjWoEN1+B4TkzcOo6YK23/qEFyybBDw0ibOZ2NpG+Sj6axBf15nvXFWE7Gqz2v7vGmZWEWajaQ715HQofAtnN7zBeVXTl32w2bGMm3mRCGz8Es7XTOMI/R4HsSr8OuGDhZixB1wvif7LRWcMr3clKMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774634753; c=relaxed/simple;
	bh=acJIO/LwISZmn8ogt/CcrsqmCJSM6amVbdj467xUOKE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UgODtOI5YY/N/9YQjdWwo2J+B/riRDK9o9urAdy6zeP//QgB+2OzQgI0Jm6aOhUDtj9B+3F2X2MZK9nIW83fe9JxQ5D4jogAY5hx9qPKPzBsEY0Nmjl6Q2HZT0pASAqCifGKFi1ZH4z4J6EZcng9c7zKcBLxfVftExcxigLNQA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=gsx6Z7Je; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="gsx6Z7Je"
Received: from pps.filterd (m0209320.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RFgbn9063298;
	Fri, 27 Mar 2026 18:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=acJIO/L
	wISZmn8ogt/CcrsqmCJSM6amVbdj467xUOKE=; b=gsx6Z7Je0kFmH3VwYxeLsBC
	aRsfcB6IMLbWmJehQicoIPIF/j/HOOMu3NjXu6/75MaEEM3KtgLJBWyVZAXAtCv+
	qVr4zfpoYxWJCy1ig5IpsdkFk3bPIJVNtoQd2IwXU5Epz83N1F12NJfyXXhHD1DS
	ky47iutC0t/zpWoYnSFxdaigajhL7VqRMGZNWt/enVB8kyrW33N3qdhhDeqZUIbY
	/+4zR3gUN9NZEw1zFW0qLT42AJEaUpYZiYbAaVYFj8om4ckCgsDuxQZLANuY1DUv
	7KtBI+6/WJBZOQIea+XHicWrowks+MwTV2oQMdtSUFgtIBpU5JHFekoPSr4u2FQ=
	=
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013001.outbound.protection.outlook.com [40.93.196.1])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4d1kk77twm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 27 Mar 2026 18:04:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TniJDLcNQ0LUUjr/Eo2iwAQpwoHjMtlcQjTIFm4BSTIrbBtwafgbLKHGnZJf6t7u4mDkkoRtX+7A7k7kvRdLv6n21VobIFN2ESmYUrkMwc9X1iG9a6zixk5TP/AZM2CzIyCE12elJGKkRL3zMqqVWjfCbkvHGFwWB+eUVipVr5G/Ab0CQ9JGmMggaQ98GTs9o040GEOZ6nSO87gAduxjd6ZC80skDIPkHCGNg/8Yx4jQpbUKZ2A3FuvuECmiHuGJmGdixvu8fQtZFNZMnhMro12qZxS8MSAOUspCvah4QwWJ7npI0e5mS8euTGtB8ms5hBTfAsn1n1ZBrumvh36tfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acJIO/LwISZmn8ogt/CcrsqmCJSM6amVbdj467xUOKE=;
 b=urPwVcQK/zgJiJRYIagA8Wxm/ibYTSlgjM1qO7UksklPTeBIKnw7Je4Z1BZ3p4WIgr7yhbbXnxsZnC4ZdkPx4kKMepgUcplxE9AplT2Esij9qLmKA33JO2dSXHOomnv7/Z8LRaqEEETLJh+7pawmpvCrEcOkKR7XkzVbav9R+yEqHvn8Y1wEI7NoP4Ei2vUKknUAO3tWz/2H8BddRbWnYPs8/Rg43MEmN5OYQrR1PEjmVuV959G9X5KousV7ze7HNW6Icfn+7xr0VZ2WTciSVWnqPmVvH86Uiy7SkvlHdR0ZIY77SpZHtJINyd4MlGPkjKvbTMvoQXbXsOn3jgVbsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by MW3PR13MB3947.namprd13.prod.outlook.com (2603:10b6:303:57::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 18:04:23 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%5]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 18:04:23 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: John Ogness <john.ogness@linutronix.de>,
        Michael Kelley
	<mhklinux@outlook.com>, Petr Mladek <pmladek@suse.com>,
        Shashank Balaji
	<shashankbalaji02@gmail.com>
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
	<sboyd@kernel.org>
Subject: RE: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Thread-Topic: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Thread-Index:
 AQHcmuexSh6ktdFaZUimYV7dOjz0LrWppsqAgAJpSmCAAGcAAIAB7r0AgA/pMzCAAn/+AIACHJ+A
Date: Fri, 27 Mar 2026 18:04:23 +0000
Message-ID:
 <MW5PR13MB5632A5DBF984959200287BDEFD57A@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
 <SN6PR02MB41571D45C1C8ADF89BD1FE8DD447A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <MW5PR13MB563216F6D786D4DCDFEBED2BFD45A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <abPqrqgXHnDu8XWf@pathway>
 <BN7PR02MB4148F06A53EA3A4061765405D442A@BN7PR02MB4148.namprd02.prod.outlook.com>
 <MW5PR13MB56324CC9F20373A19325061CFD48A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <87fr5nx7rr.fsf@jogness.linutronix.de>
In-Reply-To: <87fr5nx7rr.fsf@jogness.linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|MW3PR13MB3947:EE_
x-ms-office365-filtering-correlation-id: a8f07c67-002d-4be4-326f-08de8c2b46dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 A7hCb1RmgnvzoAqFx1qW5kl9LH6JifEj//REQBcfDxZmJrvuXqaar7e9+KWDON4x7yiiQnAgc5EoTHZll+xSIqNcFxUeTlMIc+jClhC8F8uGR4NJ4MDTDfl2A+1PvLlFcSfPblicgIRglYiMJkdjF/rOo9pWl6eDTkJwCyiSHTOIY0S1DUYT9ptePbAfA3yQwrcBs6SUW2sEaExlb96h/B2aH7EDWehVBAQts8OlfsShAs8WS7ULKog3T511ZuxLoKg02nt8UATYt7v2U5as4Pmt9TRD6phIo8O5pB+g9y5GMzsnq4Mhdvqw3d/k/CFBhFe7JE5XD2gxcbA2NvKSAzIWxMyWaX5TFn2V5QM1CWClVQm5KdnRVxs9BSXSGXPhKYzPLzgLOYJVS78JO3SSl7BwmuBnzoBpa7nDUPh46ZwCoLKiZ9WEvTpDrPx9M0nwzs5CCZuTxBE1bbSFjgLcH1YIqwxXhYdOou2Ar2onoGQvGr2VYwjm62l8ji3t9FbGeNvz9okp+Lbwd+Fd82q38stYnRpgK/mxBNkYCYdwcTVEkGYdxMjXtk+vhqUxTVCYB+VopBHr6+j6IkjWNt72uK4ztsc9L2L+OyNQnyxZzTGWlOzGRlAsWY3VZep0+emWDsoJddbyOVcI8ZFg2Rt8/W6kTJtymPhi/Im/38KAbEjO5n50ziMKmRcgXdPq8Auq0J1ElsdF7gwqLTcSzRMHKPvSiym6TOvtaMCXjtKM2tTiCGtwXutfosB5sL8uVAQYad+LI8tRo+wozsjRdWjJY6Be6XNEmv2/SgDtNTlE57k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S0ROYUVwMWtkQi9IS3FGTmo1cmNydFRueWVzNDdEc24zWTJJemY1YUNqSGFa?=
 =?utf-8?B?N29lcXdrdGxJS1ZtMFJmM0Q3NkYvT3NSdWdqZm51NHkvVUVkbVRZMzc5a2w1?=
 =?utf-8?B?M3pZTGNTT3ArZ1dPSEthcHlEZ2F0M1FFQUZtZWdFUk5DbEZJcEt3MG9jLzhi?=
 =?utf-8?B?enpTWVA4SVlvWHEyMVlWb3dpakxna25OcUhJM0JMOGFTcFpIdk1FUjVEYnBI?=
 =?utf-8?B?bEV6WlNDaEc1RXdZSDZNU01BRUVUdmRsenJveDhjNDU4TCtRTWdNSmh0Q1Jz?=
 =?utf-8?B?Vld4ZG13S2V6TE5kMjQ5c3paU1Q3NHR1WTVuY29rMmFYRmN6dHRQZWpJbjZY?=
 =?utf-8?B?Z1E4NnZtTlE4NkNLejJZL1J2UG1uc1dzSVR1OGNIUkJnU3lZZXJrUWorc2Z2?=
 =?utf-8?B?cmhPbWE0TW9UWWsxLy9CUUFUcWlvNXUrMTQvM3hib0J3aUVGWmRLbyswZFZs?=
 =?utf-8?B?VmRFcGwwNGtzd05pSWdUS1pITzhxREJkQWwvcTNXYlhUelFNUEgvTkVSc1Ns?=
 =?utf-8?B?blptMUFaTHJ6N2F6ajVBQ08zVXcxWXF0blNBWkJNbDg5LzA1bktJQ1M0S0tx?=
 =?utf-8?B?eDNJTEwxQzZYR3Fkb1NhSEJhWit4b0t1ZzM4UkoxZUo4b1F6blFkRFJ0RVZm?=
 =?utf-8?B?WGsxT3pUNk0zOXVpdEhpR3dycEpVTWp6Sm9RUVphQ2VCcnRucmU3YTFpWEVl?=
 =?utf-8?B?RlFFNVErMzF0elpTRk1VQTQ5RmJydDlHZllLMjR3cG96OGZXeE5Lb3hLSkps?=
 =?utf-8?B?TGcrRXJnUlpqQzNKRlZoNUJZRDJ1d0hvVEZIWGlCbVZKRVJMMW8yWS9tckxW?=
 =?utf-8?B?L2JYQXZEYWd2anZ6d0NDTUVabnJ4amh4Mmp4bG43OEJRaVcyYzQwUDFTNXpP?=
 =?utf-8?B?V2RHRTF4MGNTT0poQ1QxOGljSDdkcmhPZnV5Y3JYZzM4S0s4Tml4ZDN5WEdJ?=
 =?utf-8?B?ZEZ0M0VJUktQL2JmRjZoSzBIN3IzOVBQd3l2U2ZIVnMrL2RQOEFEYnRJeWMz?=
 =?utf-8?B?TmR2R0NmZEtzQWcwbHZQR2FBM3Rmb3o3Vmd2R3ZyK2M4SFdNUFVuMVF1NVRo?=
 =?utf-8?B?Z3FmaGtuK3B1WFhFNjRneDdpTmx6emc5VzBrSVBmeS84V3VlcnJmUDZwQS9k?=
 =?utf-8?B?T3UxemlwNUdqbEkwcVNTODdxRkR2WmI5eVVkSHZ2WWtJeEJxMk15VGU2SWpp?=
 =?utf-8?B?elNSZER2aEk2b1ZmMW5DaVlxN0lWbExBcFlBemlER3kyMDlqNFpTZ2thenI1?=
 =?utf-8?B?WHNPTjBaRlZPazkwNzh2b0VqVGhyT0xNWHdWQVRYT2RJeWFiTnJrOHpUVVhC?=
 =?utf-8?B?bWRSRXRMb1BmMXhFb1Yydm1Xa1YveGNjTUxyM0hKK2xZK2ltbnZBUldrTllj?=
 =?utf-8?B?cTN1S3hhMC9BV3FPQUtnbW0zQ3kyazdDb2ZhcFN3S1FwL0JIMzl0UGcvSTdz?=
 =?utf-8?B?QVhsenV1YWhYNFFiVHJ2bllrM3dhLzRSTGE1RjJpTjZETFJIUkIxSHJzREFv?=
 =?utf-8?B?ODhTZDcvamdqR0JyOVZ3ZmRkczZJU1Nma2V6clQreCthSmhUNm9kS3VPYjlS?=
 =?utf-8?B?eWFmSHpuWEZrNTVmZ0JvcWtaQmtjZW5QQlU3ME1FSDVJMlNZOVNDK1U3Qlpk?=
 =?utf-8?B?YzVzTkFqWFJmQWVoc2VTQ1AzekdkY1ZCNW8yNUtCenAvQjBnUEsrVFp5QXlr?=
 =?utf-8?B?ckhHQVNVQzEvUTEzZlhwendMUDN0cjRhYmZTN2Z4cWNPZ3JXSHdyZGNzOEtz?=
 =?utf-8?B?WkIzVjBVS2F1SmNPQWZCdjd3bU9yVHp4MGpKeU5OVHRWZGVJMVpFcXNJTXd4?=
 =?utf-8?B?YXFHSFBldWNKbkxFYk9obE4yemdkamFZWEVYYStBVit1SkFHcWhQY0h2dy91?=
 =?utf-8?B?bDVlN0dKek56QXdJOXRsbUozRE00b0ZaNGs1NThSVnk3ZXpGa1J4TGN5K05H?=
 =?utf-8?B?ZmIzaVE2SHg5cHY4T0dseU5XVFRod3ZpaVdBU0VRMTJLM0hobG8vMU9zc2VO?=
 =?utf-8?B?YjB4TmI5TkZoOXNDbnRWNWUvZjVOZjdCbDF5MWo1b2oyc1k3ZU9JTEUyT2Jl?=
 =?utf-8?B?QXVwNmRzM1R5enpGU0Q1VkI5cUxNODZ2b3RITEpWbnRlNHhHMkkzWEdtUzIv?=
 =?utf-8?B?V3RuenI2MTNVWnZJTlRXZTVGcGR4ZU4yMExkQlJ2Y3VkQTRTeXRqenBMcExa?=
 =?utf-8?B?c0Zpa0Jqa3hBT3R4MGZaY1BkZXNvc1Mzd1o2UU1vY1ZUd0NSZGk3a3Y1WE5Q?=
 =?utf-8?B?bHU1aCtSREw3bDE0NXlLSHJZalRGUnFDK2tVSURoSUlpVTdXdDJzNTl5SmlP?=
 =?utf-8?Q?H8L0Fbu/7OYhwFdG8m?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	GsPEUr67TokdgjlmwHO2MQKaTXrq7O/KhA6AUTbu3rO8gJzkMqbexSjFxrNe1Dzaq1lQClF0dEqxYqE4G0evdRdVMJ6bCFAXrFZZIhdbXHR8AdlfK8B3v6gr5Fr9hM/4MgglH8meSt/8hNBqkupHgWVOuU20+rRKHlVlun4yEGisjinjsGCds8hN311sqjHUrdE/1mwesA0wBS0vCy3FV4YWq8IhIbyyujJG5ZBoGaXugmjANI5l6JAsSS7KrfV7qrm1FgfjjUXLO7dHsNWwJolzZmWVy1240KB0r+cXx3rP/44+I5qowdKZS0Yn8Fl+wRiysHVtaX90Z7AIZx4Kzw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5vzoFY5wTO/N3Hoe8IL2D+fUXSvFyapZ+Hz+5ec5uwA4ETn69u4IAxCWSuZz0WHRXtSD66I4q+x0zCtWLUm1oAoWyZo27wKPmNvhMKmbNz3vDpnkY8eHU2KLrDs57nWMoUeB6cxfrKXEVABP0ysnZzbHWjc7cfx/xNbzmsD0dwydHmFoRMyUHa/umjJT7s0X+nyh5Xv7/Je9cnh/Gqr7L0sEp+4K9ydaCU5gjcVZrylwyeUMyGTg9+4siDnSAjijdJMkxwksB7waOk/UP83Hixq+8efrLxQAfUejvJh/sHTw3zybrrWutvo3u5gHRT4HNhrRmwdf5nPdbHtKsAYd0DJJZ7bXCGnQS3V3ib8ojF2dCJYEtgkc/xI88h2UW+ClcmX0XR5y7yQsCnQfbRjI1qZzBw6KhaFsysdlup7XsOX8aBMZohZalwU9h8GXWoxYQNPoUMNiIGhz/fDQck6OgNdsge5qqQ8Lgc4l4UcZUXxiL5AvsB6zvHFLdUVANlzFPo4lYR+8ynDvpxdAgr4Z8xC+HETE3HOTP7uqt4Ve/GdVQBLP0k9UJ5S1PbIAjWxLzqhBdA/Jo2qgrPgkiOEXCozn9P+7HKgaBZJDZFA4HL5jYqF04Df0idIMGbGSaHPv
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f07c67-002d-4be4-326f-08de8c2b46dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 18:04:23.3258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E7/gidTjr97tLRIMC09NbAOFlyKyI7nR+Aef2D3JHz1w8MwM1CRIVIibaNoWL2K8/KlIWAYiZRslxLhtoYoKdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR13MB3947
X-Authority-Analysis: v=2.4 cv=fvjRpV4f c=1 sm=1 tr=0 ts=69c6c6ad cx=c_pps
 a=dImUGf+04sfXZTE2vAy0Gw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=bd-SKr3HlWZVCYFCRTQK:22 a=z6gsHLkEAAAA:8
 a=Y-V2jbUz4jwFnBrKwtgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LlcVW0hUtsjU04_YsPgDPscEh6mMGqUj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEyNSBTYWx0ZWRfX53SF8tmeiJS3
 5Oe9gRW58/lvN9ZcHfuYl5OobCnnynmousymGKlo1eCYp7oCDJ+Fw/siMzteqqCtJQePUHURUiO
 /Aey7ZyJPnc2CWepFevFJW5ci4IfUY+00no1TkrugoFRCUNQmRjgteY9pOmqX8LnSAKHfOr9r0N
 utjQZGfLEJHu+/9tiR46nc0V1rx+fYQjXc5K/JmMbPS5jbsl1MPx7RqVebvNjbbJSN6VY8cnNqh
 a2Ag0Y9EXHeciEwq2m6b9vbY4WvESeFORiPxQAFa/c8c/Bk+z/oGxaBBzegMxFZwKywOGORfZDO
 9DI5GMnGKOvEqDmKxIvIEDqDJbf5ME4Dkjj86Ep+pVJ4tIw4vjCj5+ouRd7X9Om8m7kbL7KEFyn
 PwHGSapF3BnHyIn51Vq1P0B+c+2MQPnuNZ5583fMadxxGeEHvv12MJ7dQMLh6UEbToJ9hOrlqgs
 ZbnXZYgQ8/Vldb8/fNg==
X-Proofpoint-GUID: LlcVW0hUtsjU04_YsPgDPscEh6mMGqUj
X-Sony-Outbound-GUID: LlcVW0hUtsjU04_YsPgDPscEh6mMGqUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2huIE9nbmVzcyA8am9obi5v
Z25lc3NAbGludXRyb25peC5kZT4NCj4gSGkgVGltLA0KPiANCj4gT24gMjAyNi0wMy0yNCwgIkJp
cmQsIFRpbSIgPFRpbS5CaXJkQHNvbnkuY29tPiB3cm90ZToNCj4gPiBZZWFoIC0gSSB3YXMgd29y
cmllZCBhYm91dCBvdGhlciB0aW1lc3RhbXBzIG5vdCBiZWluZyBpbiBzeW5jaHJvbml6YXRpb24N
Cj4gPiB3aXRoIG15IGFkanVzdGVkIHByaW50ayB0aW1lc3RhbXBzLiAgTG9va3MgbGlrZSB0aGF0
IHdvcnJ5IHdhcyBqdXN0aWZpZWQuDQo+ID4NCj4gPiBBdCB0aGlzIHBvaW50LCB0aGVyZSBhcmUg
dHdvIGF2ZW51ZXM6DQo+ID4NCj4gPiAgMSkgZG91YmxlLWRvd24gYW5kIGVtYmVkIHRoZSBvZmZz
ZXQgKGZyb20gcG93ZXItb24gcmF0aGVyIHRoYW4gZnJvbSB0aW1lX2luaXQpDQo+ID4gICAgIGFs
bCB0aGUgd2F5IGludG8gbG9jYWxfY2xvY2soKSBhbmQvb3Igd2hhdGV2ZXIgaXMgcHJvdmlkaW5n
IENMT0NLX01PTk9UT05JQw0KPiA+ICAgICBhbmQgQ0xPQ0tfQk9PVFRJTUUsIG9yDQo+ID4NCj4g
PiAgMikgYmFjayBvZmYsIGFuZCBhYmFuZG9uIGFkZGluZyB0aGUgb2Zmc2V0IHRvIGxvY2FsX2Ns
b2NrKCktYmFzZWQgcHJpbnRrIHRpbWVzdGFtcHMuDQo+ID4gICAgIFRoaXMgd291bGQgbGVhdmUg
YSBkaXNjb250aW51aXR5IHdoZW4gRUFSTFlfUFJJTlRLX1RJTUVTIHdhcyBlbmFibGVkLA0KPiA+
ICAgICBiZXR3ZWVuIHRoZSAobm93KSBub24temVybyBlYXJseSBwcmludGsgdGltZXN0YW1wcyBh
bmQgdGhlIG9uZXMgZm9sbG93aW5nDQo+ID4gICAgIHRpbWVfaW5pdCgpLiAgVGhpcyBoYXMgdGhl
IGJlbmVmaXQgb2YgY2hhbmdpbmcgbGVzcyBjb2RlLCBhbmQgb25seSBhZmZlY3RpbmcNCj4gPiAg
ICAgdGhlIGVhcmx5IHByaW50ayB0aW1lc3RhbXBzIChhbmQgbm9uZSBvZiB0aGUgcmVzdCBvZiB0
aGUgc3lzdGVtKS4gIEFuZCBpdCBoYXMNCj4gPiAgICAgdGhlIGRvd25zaWRlIG9mIGxlYXZpbmcg
dGhlIHBvc3NpYmx5IGNvbmZ1c2luZyB0aW1lIGRpc2NvbnRpbnVpdHkNCj4gPiAgICAgZWFybHkg
aW4gdGhlIGtlcm5lbCBsb2cuICBTbyBmYXIsIEkgaGF2ZW4ndCBzZWVuIGFueSB0b29scyBjb25m
dXNlZCBieSB0aGlzLCBhbmQNCj4gPiAgICAgSSBjYW4gcHV0IGEgbWVzc2FnZSBiZWZvcmUgdGlt
ZV9pbml0KCkgdG8gaW5mb3JtIGh1bWFucyBhYm91dCB0aGUgc3dpdGNoLg0KPiA+DQo+ID4gVGhl
IHB1cnBvc2Ugb2YgdGhpcyBwYXRjaCBpcyByZWFsbHkgZm9jdXNlZCBvbiB0aGF0IGVhcmx5IHBl
cmlvZCBvZiBib290LCB3aGVyZSBhbGwNCj4gPiBvdGhlciB0aW1pbmcgYW5kIHRyYWNpbmcgbWVj
aGFuaXNtcyBhcmUgdW5hdmFpbGFibGUsIGFuZCBsaW1pdGluZyB0aGUgaW1wYWN0IHRvDQo+ID4g
anVzdCB0aG9zZSBlYXJseSAoY3VycmVudGx5IHplcm8pIHRpbWVzdGFtcHMgc2VlbXMgbGlrZSB0
aGUgYmVzdCBjb3Vyc2UuDQo+IA0KPiBJIGhhdmUgYWx3YXlzIGZlbHQgdGhhdCBwcmludGsgdGlt
ZXN0YW1waW5nIHNob3VsZCBiZSB1c2luZyBhDQo+IHVzZXJzcGFjZS1hY2Nlc3NpYmxlIGNsb2Nr
LCBzdWNoIGFzIENMT0NLX01PTk9UT05JQywgcmF0aGVyIHRoYW4gdGhlIENQVQ0KPiBsb2NhbCBj
bG9jay4gVGhpcyBzaW1wbGlmaWVzIGFwcGxpY2F0aW9ucyBjb29yZGluYXRpbmcgdGhlaXIgb3du
IGxvZ3MNCj4gd2l0aCByYXcga2VybmVsIGxvZ3MuDQo+IA0KPiBJIHdhcyB3b25kZXJpbmcgaWYg
eW91ciBwcmUtYm9vdCB0aW1pbmcgY291bGQgYmUgdXNlZCBhcyB0aGUgaW5pdCB2YWx1ZXMNCj4g
Zm9yIENMT0NLX01PTk9UT05JQywgc28gdGhhdCBDTE9DS19NT05PVE9OSUMgaXMgYSBjbGVhbiBj
b250aW51YXRpb24gb2YNCj4geW91ciBwcmUtYm9vdCBjbG9ja2luZy4NCg0KVGhhdCdzIGludGVy
ZXN0aW5nLiAgSXQgZG9lcyBzb3VuZCBsaWtlIGl0IHdvdWxkIHNvbHZlIHRoZSBkaXNjb250aW51
aXR5IHByb2JsZW0uDQpIb3dldmVyLCB0aGlzIGRvZXMgZmFsbCBpbiAgdGhlICdkb3VibGUtZG93
bicgY2F0ZWdvcnkgb2YgY2hhbmdlcywNCihpZSBlbWJlZGRpbmcgdGhlIG9mZnNldCBmcm9tIHBv
d2VyLW9uIHByb3ZpZGVkIGJ5IGVhcmx5IGN5Y2xlcyBpbnRvIENMT0NLX01PTk9UT05JQywNCmFu
ZCBtYWtpbmcgYWRkaXRpb25hbCBjaGFuZ2VzIHRvIHByaW50ayB0byB1c2UgdGhhdCBjbG9jay4p
DQoNCkkgd291bGQgaGF2ZSB0byBkbyBzb21lIG1vcmUgcmVzZWFyY2ggb24gdGhlIGNsb2NrIHN5
c3RlbSBmb3IgdGhpcywgYW5kIGl0J3MgZ2V0dGluZw0KYSBiaXQgYWZpZWxkIG9mIG15IGxpdHRs
ZSBwYXRjaCB0byBzdXBwb3J0IGdldHRpbmcgdGltaW5nIGluZm8gb24gMjAgdG8gNjAgZWFybHkg
Ym9vdCBwcmludGtzLg0KDQo+IEFuZCB0aGVuIHdlIGNvdWxkIHVzZSB0aGlzIG9wcG9ydHVuaXR5
IHRvIHN3aXRjaCBwcmludGsgdG8NCj4gQ0xPQ0tfTU9OT1RPTklDLg0KPiANCj4gVGhpcyBtaWdo
dCBhbHNvIG1ha2Ugc2Vuc2UgaWYgaW5pdGlhbGl6aW5nIENMT0NLX01PTk9UT05JQyBpcyBzb21l
aG93DQo+IG1vcmUgc3RyYWlnaHQgZm9yd2FyZCB0aGFuIHRyYWNraW5nIGFuIGV4dHJhIENQVSBs
b2NhbCBjbG9jayBkaWZmLg0KDQpJJ2QgaGF2ZSB0byBmaWd1cmUgb3V0IHdoYXQgY2xvY2sgaXMg
cHJvdmlkaW5nIENMT0NLX01PTk9UT05JQywgYW5kIHNlZQ0KaG93IHRoZSBpbml0aWFsaXphdGlv
biB3b3Jrcy4gIEluIHRlcm1zIG9mIGNvbXBsaWNhdGlvbnMsIEknZCBndWVzcyBpdCdzIGFib3V0
IGVxdWFsLg0KVGhlIGNvZGUgaW4gbXkgcGF0Y2ggdG8gYWRkIHRoZSBlYXJseV90aW1lcyBvZmZz
ZXQgKGVhcmx5X3RzX29mZnNldCkgc2hvdWxkDQpyZXNvbHZlIGRvd24gdG8gYSBzaW5nbGUgaW5s
aW5lIGFkZCAoaW5zaWRlIGFkanVzdF9lYXJseV90cywgaW5zaWRlIHByaW50X3RpbWUpLg0KDQpU
aGlzIGFkZCBvbmx5IGhhcHBlbnMgZm9yIHByaW50ayB0aW1lc3RhbXBzLCBzbyB0aGUgb3ZlcmFs
bCBlZmZlY3Qgb24gdGhlIHN5c3RlbQ0KaXMgcXVpdGUgbGltaXRlZC4gIElmIHdlIHB1dCB0aGUg
b2Zmc2V0IGFkZCBpbnRvIENMT0NLX01PTk9UT05JQywgaXQgd2lsbCBhZmZlY3QNCmFsbCB1c2Vy
cyAod2hpY2gsIG9mIGNvdXJzZSwgaXMgdGhlIHBvaW50IGluIG9yZGVyIHRvIGhhcm1vbml6ZSB0
aW1lc3RhbXBzIGJldHdlZW4NCnByaW50ayBhbmQgdXNlci1zcGFjZSwgYW5kIHBvc3NpYmx5IG90
aGVyIHRpbWVzdGFtcCB1c2VycyBpbiB0aGUga2VybmVsKS4gIEJ1dCBpdA0KbWFrZXMgdGhlIGVm
ZmVjdCBtb3JlIGdlbmVyYWwuIFNpbmNlIHRoZSBwdXJwb3NlIG9mIHRoZSBwYXRjaCB3YXMganVz
dCB0bw0KYWxsb3cgbWUgdG8gZ2V0IHRpbWVzdGFtcHMgZm9yIGEgc21hbGwgbnVtYmVyIG9mIHBy
ZS10aW1lX2luaXQoKSBwcmludGtzLCBJIHJlYWxseQ0Kd2FudGVkIHRvIG1pbmltaXplIGFueSBs
b25nLXRlcm0gcnVudGltZSBpbXBhY3RzLg0KDQpIYXZpbmcgc2FpZCB0aGF0LCBJIHRoaW5rIGl0
J3MgbGlrZWx5IHRoZXJlJ3MgYWxyZWFkeSBzb21lIG9mZnNldCBjYWxjdWxhdGlvbiBvciBzY2Fs
aW5nDQp0aGF0IHRoaXMgbWlnaHQgZm9sZCBpbnRvIGZvciBDTE9DS19NT05PVElDLCB3aGVyZSBh
ZGp1c3RpbmcgdGhlIG9mZnNldCB0byBiZQ0KZnJvbSBwb3dlci1vbiByYXRoZXIgdGhhbiBmcm9t
IGluaXRpYWxpemluZyBvZiB0aW1la2VlcGluZyB3b3VsZCBnZW5lcmF0ZSBubyBhY3R1YWwNCmlu
Y3JlYXNlIGluIHRoZSBvdmVyaGVhZCBvZiBnZXR0aW5nIHRoZSBDTE9DS19NT05PVE9OSUMgdmFs
dWUuDQoNCkknbGwgZG8gc29tZSByZXNlYXJjaCBhbmQgc2VlIGlmIHdoYXQgSSBjYW4gZmluZCBv
dXQsIHRvIHNlZSBpZiB0aGF0IG1ha2VzIHNlbnNlLg0KT3ZlcmFsbCwgSSB0aGluayBpdCB3b3Vs
ZCBiZSBhIG5ldCBwb3NpdGl2ZSBpZjoNCiAtIHByaW50ayBhbmQgdXNlci1zcGFjZSB0aW1lc3Rh
bXBzIHdlcmUgaGFybW9uaXplZA0KIC0gdGhlIHRpbWUgYmFzZSBmb3IgdGhlIHN5c3RlbSAoMC10
aW1lKSB3YXMgZnJvbSBwb3dlci1vbiByYXRoZXIgdGhhbiBmcm9tIGtlcm5lbA0KICAgIHRpbWVr
ZWVwaW5nIGluaXRpYWxpemF0aW9uLg0KDQpUaGFua3MgZm9yIHRoZSBpZGVhcyBhbmQgZmVlZGJh
Y2suDQogLS0gVGltDQoNCg==
