Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3939F42AA3
	for <linux-embedded@vger.kernel.org>; Tue, 28 Jan 2025 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738077218; cv=fail; b=uck8nJA4EQM0CpiVgG3s4YURYEB8+Bo3BWhRUmxkebT/QJRlNfttOXzySsasZjjwnEHME5hRMhbD+SNt5+t9sGM5sy6n0gPNsljzTB7ZBMmR394x2g+v8d7ELL/o9+p12stYQP9sidsPU/QTkea2I6135bRuPEGXQaZqXOvC75o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738077218; c=relaxed/simple;
	bh=I0S7XiBh8fgaEPyhAIZQFv9GrGqXc+rPSVcu4c7+Z3U=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iySOri+IJtTuWSSonHy5PsbsJ/yd0KfrQbwacFHkU8LeXCXNQEMnMkTxI7fRf/iavs97g7cmUmo+p3DEuBnTi7I6OMiY6OzyQoO6vJBgyx6PEbo+wikWnW3O2Upy2rr3E5bKfLyhHf28QtVLw67tOCTN1UpuOpqFbixMmkNDC+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=WdZJLc4y; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="WdZJLc4y"
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SEWQH1025413
	for <linux-embedded@vger.kernel.org>; Tue, 28 Jan 2025 15:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=I0S7XiB
	h8fgaEPyhAIZQFv9GrGqXc+rPSVcu4c7+Z3U=; b=WdZJLc4yWd9hvgNBOWYnN8P
	SpEqc1+NXnff7uGhy7pSUUobHIoDnjp6/SUl54j/GmEaW8LUh+WopMP+DpaXgQ0J
	dQm36uf4/k7DEoiz1htvKNy9uSy6nHJiEqN16b7iHg7mUmWAVDIeUWfWSPucZk6W
	AbFxX6eWXmq/f3u4VFAibmexkLwSHYfD+yO1PJp/k5S+oAs3K0VfNWin5fEl1/9Y
	hGE9sK7kMfZzXZDE5jXMjrNyBxazwmfZf67HbNB+B2zrkdEbvudLDUF2oDBrOHwZ
	hvERQ2AsmizpDF1ACKGI9TjD8LFIyVivKd3gFimEfO3FrtmG7hfBai3PoJWM/Tg=
	=
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 44cs4hjptx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Tue, 28 Jan 2025 15:13:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omjw7FY0Zz33k0ChspxpEee+z/dDVL3436D9hUxS98DB28obvFq9Jq/P+yzFkGOq+Q0jUXCaAaAKjB9pdgYnhlSWyqbFlx6A5rOiTb6TrewywQ9H/V6cKfNo61tZov8BvOllodxmkGJOW8Gkvd3XtQQxxjrehGe0MTADDkVNeah/hzqKcpxlJxhcD0UOk1JhrzLOpEkZ9yr/Gt/g8Ze1Avt6OEjCr0Rbbw2gaPRtOG4pOuQqH7ZuTELixb5rK6VUzN2ao3dO3bHhZbKnF2idD8xw10n0TlrUlFAKl+ayfNh5Mpqvs86i1GGtKKi4nCK9OJZJ9l24odZfN0DwX9wxjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0S7XiBh8fgaEPyhAIZQFv9GrGqXc+rPSVcu4c7+Z3U=;
 b=T5KKpNSZGrnEimHJdTWkujDkN3rj2EWjmMfBu8BoEP9UaWe2kF7SsChNl1O3G9ChfeXJ/V66ph/yO8eXYqsb0ajyFZcubdsc5LSI9BGbaA2V7XaW+M5aB12vf6ppS+oWBrPVK+FWSZCF0gPtA/Q5s+yfx51r2tS5mlrXYoFGLPedzxu7INRcuk4TNHSL7RwT5PPrdiqMaU1iDAbe7/TRvEaJtxoQ9MLjqU1gA5N4b0Msf7o63TsSMu2oPRzHbaMJxZefTbiZFHmowHpzTxFkARyVgcATX2Z13wAjZmmI8aJI1qat4ZLPV63sXtHQxWGgKQFmFaCzuBzjxM9G3E1leA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by BY5PR13MB3681.namprd13.prod.outlook.com (2603:10b6:a03:22d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Tue, 28 Jan
 2025 15:13:20 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 15:13:20 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "Bird, Tim" <Tim.Bird@sony.com>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>
Subject: RE: Reminder for January 28 Boot-time SIG meeting
Thread-Topic: Reminder for January 28 Boot-time SIG meeting
Thread-Index: AdtxB9M4qvBaThm1QKeqFqylUGHTYwAjm9qA
Date: Tue, 28 Jan 2025 15:13:20 +0000
Message-ID:
 <MW5PR13MB5632F9F341D323163FA5E443FDEF2@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <MW5PR13MB5632661DFB3A7CCEF3D20AB0FDEC2@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To:
 <MW5PR13MB5632661DFB3A7CCEF3D20AB0FDEC2@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|BY5PR13MB3681:EE_
x-ms-office365-filtering-correlation-id: 22638c79-42c8-45b0-6dff-08dd3fae4ce5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?citYY0ROOHJJZHpCaThGYkd6OHdHa2FrMFI1VGh6bmxZc093bmxMeXVFVmpQ?=
 =?utf-8?B?YmQrUUhMV3ZWSHlrMXBGQkFOSnlJTlVvN2FuMnI4ZEoxMkFOSkljelNWYjBn?=
 =?utf-8?B?Y1NaMUdsN1JMYjh0Q0o2WExWV0djNzdQckM4WXkydlFjTVVMbU40YzZlekZS?=
 =?utf-8?B?Y3BvbDJ0azZoUXhwNmIveTNENkc0SHVvZVZ4T2l5RjhpSWlDOU1vY3ZUbzNH?=
 =?utf-8?B?Qi96Tk1IYkdWS2ZjU0FJandUMDhhSmtUbjZzbXJqcC9CUGtTYys1VTVndW5x?=
 =?utf-8?B?NnFaaUFla3YyUHJpeXZVRllIRGdaOVE1aG5ScFNEWFhDV0tmQnVGREsvaVMy?=
 =?utf-8?B?dTYyZ1huOFVwekVjSTBpRHIyWjF5ZkpiNG9jMThEMyt0ZlpMOHhaSHJCazBF?=
 =?utf-8?B?aWRua1U4R0x1MUNZMTF0STZjOXBidGZwd1BpRXFURURrRTJoN21NREJGdm04?=
 =?utf-8?B?R1d3amJiVFV5dFJZeHdxazJqcFRXWWhiTW5GQkF6T3BjK3luYW5QQTBDYXlq?=
 =?utf-8?B?Y3ZVdDhXQ05rMi81MXVJSWVpZnlxNVp4Uk14eFFQT0ZTSTFOTHN4U2Zmb2pB?=
 =?utf-8?B?ME5NS0FlUHM5endBWHpqajBlU0lqdGtuR1l2UUtOWC9wWkloWWp1RFhCYzNP?=
 =?utf-8?B?dEEvV3NJcEtYZVovQWFON0srRWtwL1prNVZVVlU4aEFpQmJrN2d0bTFhSWs5?=
 =?utf-8?B?SHdYaExGWlRRNUlsNFd2aEdpcHRsd2VJTFB1YlhtQXltOXBWSXRhdGFZQ0g1?=
 =?utf-8?B?cEhsUGF4TWlWcDRPN0hJZWQ4T0tOVGttemJxTG8vd0Q2WGttQmZudFY1WHh3?=
 =?utf-8?B?MlJIcnA4RkpiV01SYmNmVFl5YmdidEt6OC9pSlFxWFoxTDBCTU1uNE5kWlhx?=
 =?utf-8?B?Y0JpMjdNWmo1eW9KVjQrV1NxeS9UTzJQNVJUNjNHV3JjTllZdnRqWHhoeG1l?=
 =?utf-8?B?cHFPVXUzNTNXdHQrNjFKcUtObmdzdThMMkZxUWpUN01YZUd3ZEd3U1I0ZlVs?=
 =?utf-8?B?L2tZeVp5bFg2V3dETEZpU2lkNXloSnhxS2xDZ2Qwc1BaSXhjZ204Z29kWHMw?=
 =?utf-8?B?NnZhamtnam5Kd1JDSTVXd3pPVFFxZjJLaEd0bjJ0Q3R4OGxiM1BLdFN3ZUVt?=
 =?utf-8?B?U2J1RVkwR3M2NlBYbm5nak5Ed2ppb0MxSnVRa2RKYi84NnhmZTZtK2RXRjk2?=
 =?utf-8?B?dE1tS2tVR0JuYUpYbDUya3FLQjR2ZEpvRmU3eTl5ZFVGV1VUT1dISm16VEla?=
 =?utf-8?B?bUttN1R6QmpscXRqMUdQM2N6eXJUaGhUa3UvVm5yWlhuSkRPUU9UZWplQTJr?=
 =?utf-8?B?dmFDcFZDWE81UEhndmlUNjRjN2R1bmZodjlabE1RR2RhS0FSazNlWW1HZytx?=
 =?utf-8?B?QVA0R0l4Z0FHdGNyVWpnc0VrWEpJSUdnWFR5MWlRcTlsdzRDZ3lmNFdUcmpw?=
 =?utf-8?B?WmxaZ0JWaDhQY0hYRlhZaThidlVDZjVMbXZZY0xiTXNaREtHTnk4NFh5eXJX?=
 =?utf-8?B?eDV6Zm13UEFIMDhXMHkwT2lpUitEWmdyT0tNTTRROGcxV1JYVDFkam4zREV5?=
 =?utf-8?B?L00xcFpFUTJoK2RaQU1nVXJDeXJJRVhuS25nZEprOXFvZ3Y4TTg3U1NnN3k2?=
 =?utf-8?B?ZXVkdkg4cFM0Wmw4OWRtbXdpc2dnNWNXVjh3SUxTd29NeDFoYUVNOWhYUXRP?=
 =?utf-8?B?eGtGK2tHWmRCN0Jremg4YnJ1UllTb3ZuTkJMQW0xdHB4YzVxb1NPNnN3UVRz?=
 =?utf-8?B?WFZSek9mYWdiSGZBZm8xNnpHSEtkNkVVQ0k0aHp5cTI4NXE3NEUvOXlBNU5V?=
 =?utf-8?B?Wmo4TlphRDRrUnE0STU0K2JsMkw4d2dtNkFHb01sY29aR0ovMWF6UTJlV3A5?=
 =?utf-8?B?OStTVGw0ZWZXRzU4MSs4UUoxRG5DU0drRXhUUW9XYkZVQ2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RXJUM2VCUFFMTDNsek4zSVhVTEFUOUtJNlhrWjBlVWVmdnNqdEFveElsYUlX?=
 =?utf-8?B?M3Q3WnJFZVh4VnhPY3k2MmdFcDM2NFVyZktkMzA2MWFTSll4QnlqMkFMeTBw?=
 =?utf-8?B?cTQ1VWEyQjh1bzdqQ3ltZFBXa0JaM1U5RS92UXdBUU5mcTJYL0lPSWg5aGJ3?=
 =?utf-8?B?SWVaOU4yMmJiNHVocGV5RlJZNm1NU3RJTDFhN2I2LzRnbE1ZaFNua2hUeDJL?=
 =?utf-8?B?QVZzQW9oTkl6ZkoxVzY1YUE4aGlEaE8vcXVqai9ZYlBTMUZrN1ozbHREOGov?=
 =?utf-8?B?cHdKVXZ6MWUxMWJWUFZaUnlmSExRLzhpdXozcndkVFFvdXZkSjNVUGNLZzJM?=
 =?utf-8?B?WTFGcWFHNTFQQ0pIM0IyZTVhZU9hRlJrYmVta0dCd29pRFJOZ1NLc2lCeC94?=
 =?utf-8?B?UlhuMFhPL1Jqd281bEM3SU1vNlJ5SkNURm43akRDVXplcVFUZWNTSE1CaXY0?=
 =?utf-8?B?LzZKWGZJRGcvcGQ5b01aU2xxWGZNWU5EZll5d09MV1RBTUdtMWh2SmJBVjBJ?=
 =?utf-8?B?cDY2Y3ZRTEtuMVo0QjM4a0RkS0E0M1ZtSURWWFpRWThOSkwwcTEwVEJrODVI?=
 =?utf-8?B?NktKSHo3aU1aWnNlaU8vcjQ1aWpXTUIwM1htZ2h4dHlMSkVlNGFpSGRiK1JK?=
 =?utf-8?B?Z3RtTVgzZThUbUtXVDVIanlzU3F1TGZmMzNWL05YS0JqcGo3d2Q1RFNEZWty?=
 =?utf-8?B?YUI2cU9oOHNTQ2ZZR1ZXUGVDSmlKcWYySXZyYm9xWGJQMDQ3aXBJR2sxWFZt?=
 =?utf-8?B?eUd6ZHFSUUhNeEh5TDBPbVhYVkR5dmFxZXVoUW5kazM5bGpRTk9SSXJhMEJt?=
 =?utf-8?B?aGxJdVNuY25RM2ZEeXFNNlAzOU5hMWhvVGNtaTE5SSs2TUhVN2Y0QlMyRlV3?=
 =?utf-8?B?alpwUVAyVUNWZzhkZ1pQQVRjYXlwU2NOYmFua3RFemhUeW5Kb09RM0lQbXYw?=
 =?utf-8?B?RCt1eFdmWnNyWE9iTGUyaEdtVGFGUUhCdzhheXlrWFJoMllFUG9GOEJ5WDBY?=
 =?utf-8?B?b2Nya1BtRjNWb2FyWlM4WkxNRC85dzhnZlY4Nk5zWGtuYmMxUEZFSmpZMlYw?=
 =?utf-8?B?cHQ4WDNNZlVlSG9kejRpR2F1dzB3bUZRYlRYbCtJNDBOVUdPa1ErcGszYTlv?=
 =?utf-8?B?bk10M3k0empZTmdWbXFSanUzclhiTW5NUTNHZlFMZmd1cWJHclVMSWtIOHlH?=
 =?utf-8?B?TDdVdDVMNXVxRm5xYXNoaHZCNFJla2UzWkR0RDRDVjJ6YmF4N3N6M21RRncw?=
 =?utf-8?B?VEEvcWVyMXhRa3BKUEcyM21PMDRtRTF2RlZKVDlxQ3Q2WXBtMWJpVzlYNGpX?=
 =?utf-8?B?ejdhd3hGNmVGM1JYK2hvWmtmSWdGV0VMejgrdnQ5SFF3VFdyeVpOUFFPMisz?=
 =?utf-8?B?RVBkMllHamFGdGNlV0Fja1NPS0VQaGM4YzNvUXJRc2RRdzlFK1QxQXhZT0E3?=
 =?utf-8?B?amh1QjhSMGpUOG5PcTAwdUVzSzRoVlVaQzFKd3piaVV4clpKNVpTb1FXTnFU?=
 =?utf-8?B?SE94VEJoWEc4RDdDMHhnYnVhSEdYTldSQ2RlQUQrWk11eGxxb0R5dGxIbHk1?=
 =?utf-8?B?UUZiOEM2Q3lwNGU5WGI1a2F0ZFpDZjZ4cmRmUFNTUzJLK21tREZhcXBOYmZa?=
 =?utf-8?B?bkIwOGVuRUxZMnhWV2tMSERWWG5WMWhIS3NSY1BhK1VBTUlkbUR1MnR1QmhT?=
 =?utf-8?B?Nk53VnlFejFrVW9qT25ScXZyM3FpWHlsTGhaMHJxd0lEellMSjBMQUQxNStl?=
 =?utf-8?B?RXBvV3pNam5EZS9OenpTeWNYL2IwYWM0ZENuUlp6OEQ2WVJPdUN2K2V3UTRt?=
 =?utf-8?B?K0h3YzRkQ3RjRHRYZW1DZEFsd2NabnZIR3RvR2ZUSktWU3NTSEIrYnM2a0ov?=
 =?utf-8?B?SGdOQktVTlZueFg4T2FUa3RReDVWTDZVUU1Bbm1OTjVTQ01mNmxMSm14cElz?=
 =?utf-8?B?ZXRnWHQ4YWtEVUFDUkljRGZoaDYrenJ5dDJ4MDdPOTgwR1pDNzRvMGlVenZZ?=
 =?utf-8?B?SENzczlCdFRDWk5YUTFDTWIvQUVUNGkvclBKRWZ2UG91OFZldHZYSm1OVVh0?=
 =?utf-8?B?dUFxSHNIUEdYT1dRSHVNSGpTL3I3NHRGV0NmVUFqa3FBUUhDRkR0aEkzWDZ2?=
 =?utf-8?Q?izD0=3D?=
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
	EgVFJDdniegr5WEBm6aGRpxVbrTH141j4T6YbSHdNvlTPyDyJMmY4xuYXCt9VsjmterCeNWWrxE2S3qCR1TxhMY7eodf0fsv9g914k9gj8+pWkQbUkVXpHDSn9YVqbvbVrL/uEMw9h231g/06mg1fc9MTJBQOC69+fK8+/m3mKMVqyMQ7E3WXwZ2IvJ6ShoaBzNyg1FGtRnP4VJ6vq1wJuWIMZ9xYei+ZrDvzyX/kCkZVUBen3FknsX5J9vb4pf9qViK752CQkD+2jNgj4+I/Qg5DjiqzZkr40KIdjfFbUPhud30UGBBV8ejphOYqXMYzoXNWTc1vRr6kEngwzKrMYyv/doTi/XlR2aKmcoJsMrdISzD2/44pL7wd1QalTzo4j5dLeo9TT15kaWD40PhwhYQZWk1+7DE8qP/lohtjl2akfn6aaBfZzDiUmBV3bgxC7dx6wbBNfSQvAHXzhH49LIorIXdXKP9RGeKsEBh02c4bXUaVGxhKxHog0WykxyLoY+UgCOMpzlBHXEP1T9pAA5ReDcsX4EV0kZcwr3qaIPHwOgIicG/nmG4suCaf+NuJOhrSzW3KH3/JVkYw698tKbPm7SmEoOIkSzIOzSNGHyF7uyJC4g15uA1/OF1YM/P
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22638c79-42c8-45b0-6dff-08dd3fae4ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 15:13:20.3243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5+kmb0b0wCthVdqua/Z3cZZfOhKgyCt1cpwCzwlTrqWgLgL8FkYBRbR76v/QtXbKPOJiShd09I8dVPtBVl1mIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB3681
X-Proofpoint-GUID: QUan_8D5NGam5PIVehMRj-rZwFa0TrFS
X-Proofpoint-ORIG-GUID: QUan_8D5NGam5PIVehMRj-rZwFa0TrFS
X-Sony-Outbound-GUID: QUan_8D5NGam5PIVehMRj-rZwFa0TrFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlyZCwgVGltIDxUaW0u
QmlyZEBzb255LmNvbT4NCj4gSGV5IExpbnV4IEJvb3QtVGltZSBTSUcgaW50ZXJlc3RlZCBwYXJ0
aWVzIChhbmQgb3RoZXIgaW50ZXJlc3RlZCBMaW51eCBrZXJuZWwgZGV2ZWxvcGVycyksDQo+IA0K
PiBIZXJlIGlzIHRoZSBpbmZvcm1hdGlvbiBmb3IgdGhlIG5leHQgTGludXggQm9vdC1UaW1lIFNJ
RyBjb25mZXJlbmNlIGNhbGwuDQo+IChJJ20gdmVyeSBzb3JyeSB0byBvbmx5IGdldCB0aGlzIHJl
bWluZGVyIG91dCB0aGUgZGF5IGJlZm9yZSB0aGUgY2FsbC4pDQo+IA0KPiBUaGUgbWVldGluZyB3
aWxsIGJlIGhlbGQgdmlhIHRoZSBKaXRzaSBvbmxpbmUgbWVldGluZyBwbGF0Zm9ybS4NCj4gVG8g
Sm9pbiB0aGUgbWVldGluZyB2aWEgd2ViLCBjbGljayBvbjoNCj4gaHR0cHM6Ly9tZWV0LmppdC5z
aS9MaW51eEJvb3RUaW1lU0lHDQo+IA0KPiAtLS0tDQo+IE91ciBuZXh0IG1lZXRpbmcgaXMgVHVl
c2RheSwgSmFudWFyeSAyOCwgYXQgOTowMCBhbSBNb3VudGFpbiBUaW1lLg0KLi4uDQoNCj4gDQo+
IFRoZSBtZWV0aW5nIGlzIG9wZW4gdG8gYW55b25lLg0KPiANCj4gUGxlYXNlIHByZXBhcmUgZm9y
IHRoZSBtZWV0aW5nIGJ5IHJlYWRpbmcgdGhlICdCb290LXRpbWUgU0lHJyBwYWdlIGFuZCB0aGUg
J0Jvb3QgVGltZSBQcm9qZWN0IGlkZWFzJw0KPiBwYWdlIChtZW50aW9uZWQgYWJvdmUpLCBhbmQg
YmVpbmcgcmVhZHkgdG8gY29tbWVudCBvbiB0aGVtLiAgQWxzbywgaWYgeW91IGhhdmUgZG9uZSBh
bnkgd29yayBvbg0KPiBib290IHRpbWUgaW4gdGhlIGxhc3QgeWVhciwgb3IgYXJlIGFjdGl2ZWx5
IHdvcmtpbmcgb24gaXQsIHBsZWFzZSBiZSBwcmVwYXJlZCB0byBjb21tZW50IG9uIGl0IGR1cmlu
ZyB0aGUgbWVldGluZy4NCj4gDQoNCk9uZSBtb3JlIHRoaW5nLi4uICBJJ2QgbGlrZSB0byBzdGFy
dCBrZWVwaW5nIHRyYWNrIG9mIGFjdGl2ZSBtZW1iZXJzIG9mIHRoZSBCb290LXRpbWUgU0lHLCBp
bmNsdWRpbmcNCndoYXQgaGFyZHdhcmUgZWFjaCBtZW1iZXIgaXMgd29ya2luZyBvbiwgd2hhdCBi
b290LXRpbWUgcmVkdWN0aW9uIHRlY2huaXF1ZSBvciB0ZWNobm9sb2d5DQp0aGV5IHBsYW4gdG8g
aW52ZXN0aWdhdGUgb3IgdXNlLCBhbmQgd2hhdCAoaWYgYW55KSBsZWFkZXJzaGlwIG9yIHN1cHBv
cnRpbmcgcm9sZSB0aGV5IHdvdWxkIGxpa2UgdG8NCnBsYXkgaW4gdGhlIFNJRy4NCg0KVGhpcyB3
aWxsIGhlbHAgbWUgdG8ga2VlcCB0cmFjayBvZiB3aG8gaXMgd29ya2luZyBvbiB3aGF0LiAgVGhl
cmUgYXJlIGxpdGVyYWxseSBodW5kcmVkcyBvZiBpZGVhcyB0byByZXNlYXJjaCwNCndvcmsgb24s
IHVwc3RyZWFtLCBkb2N1bWVudCwgdGVhY2ggdG8gb3RoZXJzLCBvciBhdXRvbWF0ZS4gIElmIHlv
dSBhcmUgc3R1Y2sgYW5kIGRvbid0IGtub3cgd2hhdCB5b3UNCnRvIGRvLCBwbGVhc2UgbGV0IG1l
IGtub3cuICBJIGhhdmUgYSBsaXN0IGEgbWlsZSBsb25nIHdoZXJlIHlvdSBjb3VsZCBoZWxwIG91
dC4gIFdlIGNhbiBkaXNjdXNzIHRoaXMgb24gdGhlDQpjYWxsIHRvZGF5LCBvbiB0aGUgbGlzdCwg
b3IgcHJpdmF0ZWx5IGJ5IGVtYWlsLg0KIC0tIFRpbQ0KDQo=
