Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F55A291E
	for <linux-embedded@vger.kernel.org>; Thu,  9 Jan 2025 02:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389423; cv=fail; b=KZG6bHwhdDH7GsNYpWCZJQEkjCc2kMAoP2NLXejrQFKfV2dtKOKWUaxaT1e/8lyckdOJpqVhlwUvAz91xJq0eC9IbJ6OsX94c3lMbYTDTDgxbK/+QNt83pNJe2A2EN8XPmn6lEMt/Cgi41OJcf/Thig16w2Tx2uRQCI7kk8j0Dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389423; c=relaxed/simple;
	bh=2hPi0IB+cBKI6hqQCdWBASlpkWPiJDvjSeE7I8aoujs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pMz4NrpGYJ1Z5HlWpR1sXsXrxUq0/lz1CNeLNjrDYxZiXbvrLVjRepOyDVbf4fcmkcLPX+rIcqEBDPggYvV+hnW+66e1iI+3T8zxRUJbR2LRoz6qVTEq2pu+Cm+KyFFwqDOwabksBhvbOy5DQJrPT2z8YGMs5McidJcBJsM2Xp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=mms+i+tO; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="mms+i+tO"
Received: from pps.filterd (m0209324.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5090UBdA025139;
	Thu, 9 Jan 2025 02:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=2hPi0IB
	+cBKI6hqQCdWBASlpkWPiJDvjSeE7I8aoujs=; b=mms+i+tO+WEUEFXgT4TntZP
	pTr4pcy2fuaozy5HS/VNwOIkfBcmSmXvki6eOa14xSguyLFh6nRqTBe8lzbievJ1
	bXYO1a9dj/TBKGuRXiDb8K9SyEEm2+3Gb5ThTJHmDvJ29W39AmrE4yzE6xbmmQpc
	4JSDyishi62pcKPa1DK2gJam2NCXrLAXbTnsKzB4/S39PgKWbdWsztPmWfd6GW2U
	sXqlbXkHXiXIhm+EYSzKeaQN9uQbAEzR3SxhE2BLVb8Fod6yehH1SAH5z8wzNBvp
	pVzni7e1BtbbWspTVtO9gvc8pTezzuv/GETg+0aSMafI55sgc5anyMaFMS690JA=
	=
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 43xt534dg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 09 Jan 2025 02:23:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N76uVV5IogGyJ9jRnjjN9EiUMNC6jTKA8jbXSAZJlEyreeBNvdWUbZvbidM7v7OAG0jGgMOuKII2O7FNN62V6mlBtchE9iYbQ7txjqJ7BeEJokgubbysZ9J9XzlJC+qgz4d9OBZeHfiGsPDmQaS8qDj+DDNVWJKm8ignpQUWh+QCPZBJ0u30IPA0FbcLksxKQ7YztivYhJ39VvIviPYTSqyQo3sINcu7wt5U4Cb7NmoBULFOqhSwPB67K+jvN0k3Stp2ssrKc7VFXfI2AIPX+UjHLFzxhJ1eTOmglLcCpQkKmvp8PZP9B/T/V76bmcTUnS47Kwa+RAqQ+kZ5rUSWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hPi0IB+cBKI6hqQCdWBASlpkWPiJDvjSeE7I8aoujs=;
 b=Y3zRL2zzLz7ba2WT0Y4noFy87dQXFJxaWH2KyUjeAtva5JkAtpRyAioj1EU4225KW9odt5gFpokQttbs/ceZfB+ACAwkyStstOs/rb948suahOTvVw7ldJGRZpnEh/0VL84ps94ce2ks7rD/PWGcJ3HeGj8VC5/Rbk/FG4N5eiVHIeqq/KkNHxF8LU/rzpKiIP2pSESd3m5LwWUyC0wIRv0v5eY4W1mkywf3013cDIGNSH2vRI8idMZuAMKp0PbN+C2vfh45ugf7kSKnPnc8b9R3ZERpMXUNfOyfrw9zHG81f58xj7haLgnDTvjpKu/vWMG72LMB5HFFpMBYJwyy5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by PH8PR13MB6184.namprd13.prod.outlook.com (2603:10b6:510:25b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Thu, 9 Jan
 2025 02:23:22 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8314.015; Thu, 9 Jan 2025
 02:23:22 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Rob Landley <rob@landley.net>, Shankari <beingcap11@gmail.com>,
        "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: RE: [boot-time]
Thread-Topic: [boot-time]
Thread-Index: AQHbWiLTBybXJIS1AU23EMmh9EFgybMNPmaAgABPkoCAADb/sA==
Date: Thu, 9 Jan 2025 02:23:22 +0000
Message-ID:
 <MW5PR13MB5632E3DF510914D3AFF5BF90FD132@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <CAORPcfVRobA+u5q7aPboC=3iY8dibDUB0920Z=Z0VgpQEupKJw@mail.gmail.com>
 <MW5PR13MB5632841906910ED152E7AE3CFD122@MW5PR13MB5632.namprd13.prod.outlook.com>
 <7c4d8fa2-9b12-465a-9c23-0503cb086365@landley.net>
In-Reply-To: <7c4d8fa2-9b12-465a-9c23-0503cb086365@landley.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|PH8PR13MB6184:EE_
x-ms-office365-filtering-correlation-id: 92c3771a-7fcb-4345-ecdf-08dd305496dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Uy8zNDJlck81bytYMHlrZmpXUXhwNlMyR25PQlZHYVhja0NubEVqVHZDWWt3?=
 =?utf-8?B?RzhkZno4elhwTDNEeGFaRHVqZWVJc1hLWUhWYTlnOXdRTnFxdmhYQmI1UVpD?=
 =?utf-8?B?SGFwNjdUcEdrOUloVUJCMTZxeUhrR0o4d2pCUVBwaVpjazNUWi9lSWZOWUtG?=
 =?utf-8?B?UU1tNkczT2tJVTJxOUpqdmlCamRRVmlmUk10bkFrZ1A4MTg2UVJBWTdTZmJ0?=
 =?utf-8?B?ejFtWWV0Z1BEcWNiQzRFTEhhdUo0dVRrQnA4bHNxVkRpRjFNbm40c1huNTY0?=
 =?utf-8?B?YTRXdDN1L3I0dnplOFVoOWgyRk1Qd2l4WXFNaGpyenp2NHN3aWNXVnRiS0Ny?=
 =?utf-8?B?M1poQStGbTZtMyt5dFB6L0ljOVNiQ3ovV1puYnVZbWtPRVZmeEdpZlVXeXgw?=
 =?utf-8?B?MzNhV1YwME9RaERxZm1hTUVZalVxTDBSci9vbU51ZUlWYXpTQUQ3YmlBSzJM?=
 =?utf-8?B?d0wwd1hPS2ZlRisrNzNUWXEyTmNqWXJTYlNtNnFUR0ZEQjB3b3RJeW4rQWg5?=
 =?utf-8?B?YXpES1ZieGk2L0plODcrakhiem8xaVJQaE9LczZYdWhpSzdIK2V6MzBlWVBX?=
 =?utf-8?B?ek9BcExiME9pcDIxU0VzdTVUemtnbTVnaGVSaTFKeEFNT1NZbHdOa09Ib1J5?=
 =?utf-8?B?QmwvWTdWMWF6V0NjNFR0RXFrbHViZVh6MUhLYXhuM0xtMk11QkhGN3UxL3BI?=
 =?utf-8?B?NkpORUY2QTI1WnFOeXZKNjlBYzBQZFpQL3NWRWJGdVRDL3F6TlpSRExOVmdC?=
 =?utf-8?B?Wk04T21EU0F2ZFJrZEpSMHFudTBMaDBsZjhEZmd5eXZMUzcvSFRlUFJGSkhE?=
 =?utf-8?B?S3FmQ1ZRcjFyK0Z6Z1Uwa1k1Yjd0NEo0UWtpdVJEU0VuZDNmQU1OQkV3Q3k3?=
 =?utf-8?B?SXRaaTkvc1llNTA0ZCtuaVJTQWhTRWNFNTVvVEpVSERhbU1GbjlITTVQVm5Q?=
 =?utf-8?B?dFdCaGNqSzFsSk12b2FremFYVnZoV1JTMnB1MEsvWExmOUdEK0FtdFZHZGlN?=
 =?utf-8?B?WU91WUk4LzV3bUhlUDZVd1l5NW5DY0lZMllNZ25PT05jcHYxOWxwSXhvcFlL?=
 =?utf-8?B?UXQ3WWkrbDRpNnk2L3crQ3NYQ3MxYXNvdTN2V1ZMamUxS29UTkpDQldXNGhO?=
 =?utf-8?B?S0xkVzJPRmFyeDFKRkd5amlDeEZ0U3hJN2p5RmxGcTZ0Ty9DMjFLeVZraDRL?=
 =?utf-8?B?SlhBQUdTVU9Tdm52eGd2SGRQRS85czFmbDJCcy8zMlo2bUlteEdWS1NmRGl3?=
 =?utf-8?B?MzlDQkNkR0MybkoxeW1lM1lVd0xEMWFmVk1aeVNYQm1FT2dheVFrcXdjaWdR?=
 =?utf-8?B?RlgvOU9DQS9FSmxWanVVMDVEOWk0TFo1d1Zvc2FPQ2FhNG9HRFVpeDN1aHZ3?=
 =?utf-8?B?UklYMFBaU05SSlFOWlNXQUxOdldIdXR4VVozSnBhOVIxVFdFYXlIVVhZSUhv?=
 =?utf-8?B?Vkp4bTRUN3YvbTMyYWN1Nm1aaTlKNkVUU0Z5T2xsWVJHblcxQWgxbS9uNTVo?=
 =?utf-8?B?TkVwMDFnN05uQ3JWN2pNM2JaNFNFdHZZUXN5UlJFeWFMczh6SHBWUFNWaWgv?=
 =?utf-8?B?ejRRMmJVRFJWenR2NlhkNDFKYUVCbkNKNHhPTkFReUVMVTAxSWhGczNQeVcy?=
 =?utf-8?B?N2lpUDFINnZjbmtweHZGYWpya0FXVDdSdDhFN2Q5WlducStQeHJSZDNMNlYv?=
 =?utf-8?B?c3IzQXpkN3FhR0FBTkJSTEVXckVpZ2djRERxUWxSTGVxVFoxUVQvZzFSSWNU?=
 =?utf-8?B?YmlXR0cvZTFVZmt4azllWlRnb2pxeGdRMDl6dVl5d00xaUkxblF6N0tNRENU?=
 =?utf-8?B?Z29JV2JuSWdFMjJINTZjQlBRWjVxMHV3bTRJVjNxODV1L3hmVHFMWHI2cTV4?=
 =?utf-8?Q?WRwlh+J72hYrf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WnFiZlA1N08yNmJ3VzFaODRraHh1KzhiQ0g1WS9ZNWUxVWJTOElCdm1VcXQ2?=
 =?utf-8?B?bDExcmRjSEh5eVI2Tit1a1V6SU5mZFNUajZMdEZ4NmprNmEzdlFVeDJPWWt3?=
 =?utf-8?B?QmVSTFJ5Y3pieDM2anB1ZEJmZzF4T3hoYisvdzlheGhkaHNGWFR5ZFRiOWlp?=
 =?utf-8?B?Um93c21DSzQwM0lUSWxFUlcxMVBZOStGTmlXRXRxRit2U1VCUmNHTWpSTkR1?=
 =?utf-8?B?MUk3bUVMdEhTRlNQbFVSVk5NMHBSNEwxN2gzNmpWRXdDM2FjajJjMDE3c29D?=
 =?utf-8?B?UitFQjdXSCsySWdNS0RCS1ZHS3BRQWlqNjdpY3VOTVdVaXpRYzUwR3VzS1Qw?=
 =?utf-8?B?bmxuZVdNMWRsOG1iV0N6MElXTytESVBjeXFWWS9rV0xiQlRRS1h2REljZ2pX?=
 =?utf-8?B?bUVPWE1kWVhFWGhTRENxZ3pkVm1RblI5RVUzaVdaYk45RDVXOUVVMXJqZmc3?=
 =?utf-8?B?blJvbHZzRmhNcU02eE5nQ3FpSUE1ZVNGWGFQRTRrcjRWZGdxYnJkQklUUHVM?=
 =?utf-8?B?S2J1TURIUm1YS0JKb0tibWNEWDhOdlBmaXRPUC9SbDVBc0dBcGJCaHgwWEd1?=
 =?utf-8?B?R0p1eEVJdXBYRTNaQ2kzOWI3NlJMZitjY0grajFLcUcyK3IxR0I3RHdqdVFZ?=
 =?utf-8?B?YTJXak9JSEFUK3JwcXBjMC9yTkZjbjlReHNQazNseEZia1FlTWU1cWhpcno0?=
 =?utf-8?B?OS82K2JhdUs4Y0w4WTExLzViKzlPMURudENpV2hYRmpHdk0vTUcrd2hBNkxL?=
 =?utf-8?B?dG91YkFxVWlxRmtJL05yYU9xdElBdFJCcFlsLzNvdHltRGNJRWExbVZuTU1q?=
 =?utf-8?B?UDJsS3padXNTWkpYRWRlODFBYmtYSEhPaFVoNDQ3SzRxZ0YxaFJadnBhRDlz?=
 =?utf-8?B?S0Vmb003S3c4aGVQclA5NHNDdlVpa2hTNi84TFNqL1R0WFJvSzlNNHpJTzBI?=
 =?utf-8?B?bmo1cWZydFRHbFJobTBEdjQ1dTZQS2FUR2psa0s5SnlSemJhYUlZTmJlS0p4?=
 =?utf-8?B?NmQ2MmI0aithZitjNm9zTUZuWTRkeGRTWmxIWmJtQnF5VTVDdjNhR1Y4clBH?=
 =?utf-8?B?Y0FwU1JQeCtxTUxYeHhtanRFd3B0MUVPbk5PdjUyNXNJam9uWDFMRmlUdld1?=
 =?utf-8?B?dTJLUENWQlRPMGErVkFCWkhBZHVtVWFzK2h3NW5ZcEE2S1ZzcjZkZmRVNEhp?=
 =?utf-8?B?aTlGYktaNkxKOElxbytyMXZJcjZQYUQyQ0dTL2ttUFlKa3hjeTZ4eTZwQVJl?=
 =?utf-8?B?d1VTcjJYMlRDOEZ1RkNMSmRCS0J1a1l0VGFyd1dqYTJqSFZKRVZQdFByUnpj?=
 =?utf-8?B?cm5Belg4NUVwTTlQSm0wOCtYU3EvOW9qSnJEYnRJakk5TlJtd0RuamJVTzBS?=
 =?utf-8?B?QXZFTGxoR3V0UkJvbWVzTkpzZmc4Sm1PVUNiNzhOWERSTW9wK3JhNWliWW5B?=
 =?utf-8?B?a0hqb0JIQkxqYU1wSVRDY3FNQ2ZPaEliOG1lV2dnRUZENnBsdkszb0ZtS1JL?=
 =?utf-8?B?SE91bDRUZ1NrY0xxVkJNWEhMWTNSQmNiSmRHYTgwZEJXZTA0SmVJRjB4bjdY?=
 =?utf-8?B?a3RSSE1GNmdud3dsVXJObHVHVDA2Yi85Q0FkTkl6bFRQRHVOOXRhZjZLVDAv?=
 =?utf-8?B?dzlaTzNuc29uaERsZGxNNzdRMWtXTjA4a3NSQWdvdll5YzFmVmVMUjBISDZv?=
 =?utf-8?B?emZPVURSd0NJNUIxV2JuK3JvTmtqNTRmSjdiM0ZscDFmbVFNZzhEN2pvK2JW?=
 =?utf-8?B?TXBlZEErY1hKd2FVSEoyUTlSM3VDdUY4QWJ4SVZKYWxGZkRsaXhFQzJRQy9V?=
 =?utf-8?B?Yk5naytVL0RldGN1MEQrN1FPa0FJb0F4RzljaHpHUzVJUllTU2RoVG0xcG9Z?=
 =?utf-8?B?ck9pNTZNWnJBMDZId3F5MXVQUHZUcXkvUTRRNUFIazMrb1J3alpoTzR0R0pS?=
 =?utf-8?B?NDVqZjRRSWJVeWRaa1BoU2FJM1RQQTdoMjZjQjJmT3h6QWc0QkxmYjhHY1V0?=
 =?utf-8?B?TDJvWURmdGZQU1dlN1dlb3lzcTh3ellXbVJRMjBWRnlQbkthZUQ2RW9ORTRj?=
 =?utf-8?B?SHdZZE5ub2RUWXhGbWp2UElUV0tPZDhlNXhLZ3gvSkdFT2ZhT1AweXgrWkdJ?=
 =?utf-8?Q?Ckk8=3D?=
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
	L0sfSyxnwppnb7H7dxJ4h8y8VRh0x89DkqGgClqjFMMcwB02u3WEveioro7Zff3vLx11uLMk3a7smsS6uJXOzpXulJc3C3WYZx4oELOKR7tCMBcT+t+upctCBlXBjKV00uVNXJtDrQkF0kfVe/AZc4m+iID1Pb2yanpq2PvhLqb741Kd9qlNRhNg05wScxvlpTyKCh5e+9MflOuroJVKeWGdyz4xbE6NYEz+vb2YlUMOYa6PqkcenEbXzp4kacIZl78Un3NSqJEMfAcQ0M5Q1VaiJ+MA+wcOgZslEItfmbyPu95V9URyxO02Tl42JAleM2SG6fK3ft0d6sku1VlxpcW42uEF3np9J4+ASODpCCvt5roRekKTNgNsdId75kYgychBVnnbR0fW5MsIxWKnQjgHNNH8uP60DGn6C1+TeoSJZN/guluTA+SH/gjYBEhQFThgDXTsmXoZNp1U8uXjv+5cS0rX/SLxy+7liK9SXQvYlNAPn/0mdf1//wkHRLaXDsCgqFPexlMxDsF6alQBroZ/vrCGDl5K95b4HKHRjjjcy8T+825fb1doXzkeepfs+GatHAai++RmRiRb9VqA5w8c1zACnzr1xfm15+OWCKbpF3xQZLQZAIc3aukKiJ3N
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c3771a-7fcb-4345-ecdf-08dd305496dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 02:23:22.2566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ixqtZE1YUxNbIOQZiAW12ChT5jEy5pElnj1KscPahFBzCoZxzT0kUXdiyNVu9C5vR2Fey8oM6lN1/WPtJ5dCAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR13MB6184
X-Proofpoint-ORIG-GUID: 4zSmVrkKD_LKFDd97ZbfjOD9imk2Dx0M
X-Proofpoint-GUID: 4zSmVrkKD_LKFDd97ZbfjOD9imk2Dx0M
X-Sony-Outbound-GUID: 4zSmVrkKD_LKFDd97ZbfjOD9imk2Dx0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_08,2025-01-08_01,2024-11-22_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIExhbmRsZXkgPHJv
YkBsYW5kbGV5Lm5ldD4NCj4gT24gMS84LzI1IDEyOjMzLCBCaXJkLCBUaW0gd3JvdGU6DQo+ID4g
SW4gZ2VuZXJhbCwgdGhlcmUncyBhIGxvdCBvZiBpbmZvcm1hdGlvbiBvbiB0aGUgZWxpbnV4IHdp
a2kgd2hpY2ggaXMgc3RhbGUsIHdoaWNoIG5lZWRzIHRvIGJlDQo+ID4gdXBkYXRlZCBvciBhcmNo
aXZlZCwgb3IgbWF5YmUgZXZlbiBqdXN0IHJlbW92ZWQuDQo+ID4NCj4gPiBUaGlzIHNlY3Rpb24g
b2YgdGhlIEJvb3QgVGltZSBwYWdlIGhhcyBhIGxvdCBvZiBtYXRlcmlhbCBpbiB0aGlzIGNhdGVn
b3J5Og0KPiA+IGh0dHBzOi8vZWxpbnV4Lm9yZy9Cb290X1RpbWUja2VybmVsX3NwZWVkdXBzDQo+
IA0KPiBUaGF0IHBhZ2Ugc2F5cyAiZ3JhYi1ib290LWRhdGEuc2ggLSBzZWUNCj4gaHR0cDovL2Jp
cmRjbG91ZC5vcmcvYm9vdC10aW1lL0Jvb3QtdGltZV9Ub29scyIgYnV0IHRoZSBsaW5rIGlzIDQw
NC4NCg0KSG1tbS4gIFRoYXQgc2hvdWxkIGJlICdodHRwcycsIG5vdCAnaHR0cCcuICBXaGVuIEkg
Y2xpY2sgb24gaXQNCm15IENocm9tZSBicm93c2VyIHRha2VzIG1lIHRvIHRoZSBodHRwcyBzaXRl
IChzaWxlbnRseSBhdXRvY29ycmVjdGluZyBpdD8pDQpJJ3ZlIGZpeGVkIHRoZSBsaW5rIG9uIHRo
ZSBlbGludXggc2l0ZS4gICBTb3JyeSBhYm91dCB0aGF0Lg0KDQpIZXJlIGlzIGEgZGlyZWN0IGxp
bmsgdG8gdGhlIHRvb2wsIGJ1dCBpdCdzIHdvcnRoIGdldHRpbmcgdG8gdGhlIHBhZ2UgdG8gcmVh
ZA0Kd2hhdCBrZXJuZWwgY29tbWFuZCBsaW5lIG9wdGlvbnMgaXQgbmVlZHMuDQpodHRwczovL2Jp
cmRjbG91ZC5vcmcvYm9vdC10aW1lL0Jvb3QtdGltZV9Ub29scw0KDQpodHRwczovL2JpcmRjbG91
ZC5vcmcvYm9vdC10aW1lLWZpbGVzL2dyYWItYm9vdC1kYXRhLnNoDQoNCj4gDQo+ID4gQW55b25l
IGVsc2UgcmVhZGluZyB0aGlzIHdobyB3YW50cyB0byBhbHNvIHBhcnRpY2lwYXRlIGluIHRoaXMg
cHJvamVjdCB0bw0KPiA+IHVwZGF0ZSB0aGUgZWxpbnV4IHdpa2kgYm9vdCB0aW1lIGluZm9ybWF0
aW9uLCBwbGVhc2UgY29udGFjdCBtZS4NCj4gDQo+IE1heWJlPyBXaGF0IGRvIHlvdSBuZWVkPw0K
DQpJIGFtIGFsd2F5cyBsb29raW5nIGZvciBtb3JlIGRhdGEuICBJZiB5b3UgaGF2ZSBhIHN5c3Rl
bSB5b3UgYXJlIHJ1bm5pbmcNCkxpbnV4IG9uLCBhbmQgY2FuIGVkaXQgdGhlIGtlcm5lbCBjb21t
YW5kLCBJJ2QgYmUgdmVyeSBoYXBweSB0byBoYXZlDQp5b3UgcnVuIGdyYWItYm9vdC1kYXRhLnNo
LiAgSXQgd2lsbCBjb2xsZWN0IGEgYnVuY2ggb2YgYm9vdCBkYXRhIGFuZCBzeXN0ZW0NCmRhdGEs
IGFuZCBzZW5kIGl0IHRvIHRoZSBiaXJkY2xvdWQub3JnIHdpa2ksIHdoZXJlIEknbSBkb2luZyBk
YXRhIGFuYWx5c2lzLg0KDQpZb3UgY2FuIHJ1biB0aGUgdG9vbCBpbiBhICJkb24ndCBzZW5kIiBt
b2RlIGFuZCBsb29rIGF0IHdoYXQgaXQncyBhYm91dA0KdG8gc2VuZCwgaWYgeW91IGFyZSBjb25j
ZXJuZWQgYWJvdXQgcHJpdmFjeS4NCg0KVGhhbmtzIQ0KIC0tIFRpbQ0KDQoNCg0K
