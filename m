Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BC7D517
	for <linux-embedded@vger.kernel.org>; Wed, 30 Oct 2024 00:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730246534; cv=fail; b=AAsFvvgJtr7J/reWQ6S6JZJCw78nMy58dRPxLsHF68zH5xa53WIJLUVeCpXWpm/m28RPrQQOUN06ULizMt1LtZyH6AuxwjXUKsMOTyjUpzRLJBnExqcjV8qcN5jPPbASRVEoobc1rEkTZlmxAKb5+blHZeSmh2nAM/oTLj/cHes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730246534; c=relaxed/simple;
	bh=aKFuWbxB3Kga25cxoH8Yu5gzzMQPLLt4kde51tjMWGQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jy4gb3aJv6EeXiuGiZOZNPXiauKaLB71qSvoDprc8VD0yVuaJ4OFN5nQMbX41LPtHwkZOTw7fN5T+M6j51TMTIJZUEsIDyd6JgzR7Mb7Vj7AG7rMOdVxf0oOx5iyn0MtNuIacrtcCZDasHFBvLZnplchtNde2A2ZfzttTrZa/qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=l8raikNF; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="l8raikNF"
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TNMQHm000953;
	Wed, 30 Oct 2024 00:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=aKFuWbx
	B3Kga25cxoH8Yu5gzzMQPLLt4kde51tjMWGQ=; b=l8raikNFDC4bZ0OWf+XPFzN
	a2EV7d207qNQNhGIwAKUm/cbA84TKYyd/FSl+lMHR5yDzaUo2Q+4aZs3r1j/9obD
	abTUSddaqazk7IFIz/b/NCpE44C5zznc9NGZpIC8Uuu2XPSEUlyEB8z7r6cwjfzY
	hpYUF/0fcHiw/hS2Rmhl13fx5nCLZzAdgEy1AGs3FyuNMwu19jw9t5yA0NfvUYfO
	QBQYR9EQXhCoWjhbvhm6WF3YwaXEu/h48o6gkA3L/nCg9lC03aa0rbrX4HFXVYde
	Imbjn7DnKQCU6sbrhSV1ubiwoVRgIGo0oqObE/8KVo/aglEUPae73WGpDMVFR/Q=
	=
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 42k2yq89ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Oct 2024 00:02:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGvSjMxelyb1+grHnGOg7s2DxldhDm1GjSuNh5IetDZCWoj8KneT3L1ZJ7D4hPAB74lh+bCUKCVXNIiTZ7ss/rGL0DGXC1X/jMQSVPeS+8eGOSP30NN/pG3VVc9sAyIwh0o+tgeJmPM1fY3zbZytcCnyM89gKzuiqc/WBH/wB20toxeEYs8cFrOhvX3PwadtQsomqrSfFIjatrYtm+oTBGWNDDkvoDI1m37DMUkAtDcYpyu9VekMyFWmYKeXN05CAJrCyHZugTklRnXgcg2DTEd0WVZirhIAP5lz99yxhp4qeGlM7SS7VKz12by+oBKBdj9c+AX64cAkWaSPlKXXKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKFuWbxB3Kga25cxoH8Yu5gzzMQPLLt4kde51tjMWGQ=;
 b=aBekBzAHXyw73PW+uRk2zmvmLNxJiHP0EmUIYYwACoouzKqpCgVl7J53gjFP06e7EJCc7Zrdd5458UF5Z2tSeqgHoTA0BgYDHyGDtTJY1kWU3dFKxLFeQggtxhfjP3rj7D1kltQR437x5zaJMkAX3UFZemXVFpNVJx70Il1gp6Aex7cfj8DS3Ab9ANRM6gB/+vM9n5ljNVzVkUo/ceo1YOjftObMENIl/05x40rMNTf9MeZW+3vzIah8oKUovPJb3aNrB8fq05foK36lwYWimoKC5zjp2NOw15fQnG4NqTt6g4Vc2iTxXFcSl/TR/SqshjA+rbcpJ9NcqYPqtemryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SA1PR13MB4990.namprd13.prod.outlook.com (2603:10b6:806:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Wed, 30 Oct
 2024 00:01:57 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%6]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 00:01:56 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: RE: elinux.org wiki style
Thread-Topic: elinux.org wiki style
Thread-Index: AQHbKgT84ogROyfD8U6jMtY93a+39LKeaTng
Date: Wed, 30 Oct 2024 00:01:56 +0000
Message-ID:
 <MW5PR13MB5632556A41420579038F5753FD542@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <CAMuHMdXN3J=_xFQkuhcLxhniNK0LqTH9rFM9Ydex1TUufuBw3w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXN3J=_xFQkuhcLxhniNK0LqTH9rFM9Ydex1TUufuBw3w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SA1PR13MB4990:EE_
x-ms-office365-filtering-correlation-id: 918e8d55-707b-4bd0-0965-08dcf87611cd
x-proofpoint-id: d8690225-876f-412f-87c6-a7cb45557a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SFVvN3g4bzV6VGhYbitDOEZxUnpSQmFQckdvZHlwekMzU2RLbXo2WjJHTFhi?=
 =?utf-8?B?c2R6SWFlRExQekViNC9sMnNXUVM2Qm8yT21zSDRFUlk0MGxUTjlnYlNHVElm?=
 =?utf-8?B?WXdPd2s0dHh1b2VTdUE3S3N6bWJ0Lzh5a0VZMDF5Zi8wOURZeXhhZm5GWTZ6?=
 =?utf-8?B?Um1UMk5GUXNoUUNlc0NwTjZhOENyVUg5RlNuTDA4eUZxRmZmbFVvR0Z1ZGx5?=
 =?utf-8?B?RXRiaThrZ1ZzU1hyZ3Q5dU51K3M4dFFuaVdlS3U0Q3gwZGN2WVZad1BtNlZj?=
 =?utf-8?B?ZGJTTXIwTnZEWXRGOW5JVnkyZWFSYlZSZGM3NXRrNTlEbTIzREltR3poYThP?=
 =?utf-8?B?cDA2ck1WeFhoWFJQR2o4TVFZVEg3YmRsdVc0V2VjK1pKWFE2ektDYlVhSzND?=
 =?utf-8?B?UHRCaFZyaDhSdXBib2E3RGdUSUUvU2lNbmZEaHo3SW9BMkpaSjNZNzhZNDg3?=
 =?utf-8?B?Y2R2WEQ3R2xXMXMxcWRGWUlPVkxjTHY4UHBudjZTUmhrdXBWdUFDTm1aMXM4?=
 =?utf-8?B?TnBEYmpCemdHMjVVTFpteHRCUlRTdVdlTk5pK29oVnhRWDB3dUQzcGhmdUZm?=
 =?utf-8?B?c3ZvUzA5eC93N21mQWx6TVNkU3htSmREZHkzZDA5UHZoRGdwSFFOTllsb3Zj?=
 =?utf-8?B?blZXeDBFVzd1aWMwd3FGbGJ0aGJtS25mS2c4c05uT1pSTERKSjJ0QmRxcjB6?=
 =?utf-8?B?S2V2eW5JQVJOSko0SXlSbkoxYlJiM3lnNjJQNHV4YW1YQlVzV2R1UGFWK0tv?=
 =?utf-8?B?UTRYeXlkazdINGYrZFRZYlpsbk1WSFZkTGhYcXdhemRTbkJOa3J1ZnY4UDJr?=
 =?utf-8?B?Yko0ZWFoQmxtTldRaFFpd3pzbjc4aFlkWVFKenh3NDZUUjc4enBIRkxZS2du?=
 =?utf-8?B?YnZNYWZ2SjE5UWhiSWtqMnp0K3ZxTE9KWi9vTUxRMWZhcS81MS9SMnRtZXRi?=
 =?utf-8?B?WGhtZ0hJRVV3UFRKclJkRWZNa0s1OG9CLzk1WTY4emRlTVNpWVV2SGZFTU10?=
 =?utf-8?B?MGt3MVRYb3MrU0Z2MUpBVXFnWmkzTFZQVFF4c25WTmszVXM1emZNUVMwY3VK?=
 =?utf-8?B?Wjc0QWFvQ2RYa0JZenEzcS85UjdhOG5ack1XN0NIMnZUazVLSUhRbzVaNzNO?=
 =?utf-8?B?ekNHVWtaeWlHaHdQYUI5LzR1dVRLajdrNFJMdmVuUWRUUmtvTGdneTNac0sr?=
 =?utf-8?B?VDlmWEk4UmZEeGhXOTJyWHpuYkJxbTdZMHB3OTdiQ2VOdUlxNC9oZU8yVExt?=
 =?utf-8?B?UHp2UVRORkp0SGlrNnF4eWFjcktudm5kMHhhYVVVYUlTZlJSVUJicVVIS2RF?=
 =?utf-8?B?TEI3SW9WWjI5VTIzajQwbmt3SVJzMXd5SFVHcWd1R1RVT0xHVWRCQkhtNGtF?=
 =?utf-8?B?NFgvMjl4ZjBwRlVhOGZnUUdOWFFyUG5NV1FZSmVJN1psNmJFN0ZnS1Z1RXc2?=
 =?utf-8?B?TTFhZ0p4LzRCdEJPSFRjZi82a0ZzSSswU2hnTU9hQnFJR2hSOTBXQnArdHJt?=
 =?utf-8?B?TFI4M3N0Vk9vVERmaG5CYUtqZVdyNnNGWTJ3eFV4NHRhb1BNZG1veWNUdTFP?=
 =?utf-8?B?b2NGTXRlK2xONElRb01sdm55L0NVL0VSWGZ1YzhKZ05HSHBaK2dwUDhqNUZp?=
 =?utf-8?B?blJ0b05NTUNkN3Y1dGtNZDA4U2h4Uk1QV2VXYzFISXg0eFF2OWhUSTJYVGRL?=
 =?utf-8?B?V2g1RjdCa3V1c0w1ZGFBcFcvK1RvejM0bXFDMGdnUDMxS3BUMkxRTXdrK3lF?=
 =?utf-8?Q?idwK7u1bAyHkdmA1axMtNSEejJiCf4zSJjLXA8a?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1hHMTN1dlBCRTlTcFRHVmF6QllMbzJxVk00Z0dMOUpwV1Fhc2lvL09vSUsz?=
 =?utf-8?B?MittbWhXVTVRSlBjSWpLeDZPUGd1ZCt6cUhnZEVQSDMvWFZEWDU1aUo0OXFK?=
 =?utf-8?B?MXFMeG8zMm1RR1o3Ty9IMXBtdVFIN3EvV2lDbGUvVGJ4NGFTTGd3cU1EczNE?=
 =?utf-8?B?OFFLdk1JUXMvblUzbGNkNmhUT1Uvbk1ZR1Z5MDNKVkhtQU9MTWxjaVFpekJ2?=
 =?utf-8?B?RTZicnFPZzNVZWFESm9LRDZTNWpjVzFLTEFzM01qTXBhKytUSVJmTUcrZTdm?=
 =?utf-8?B?TFlaRkFqaW5heVhMWlBsVDFDeXBtbm5KWUJVdzJyY1NJRmJpOGhNWmNJeGtZ?=
 =?utf-8?B?ZjdXT3BDWENYdDY0eXVFTVAyWldUNXUzblp1aUVOTW0ydkdvU0NSdEx1R3g4?=
 =?utf-8?B?cTI2UTJVSkl1YmF2ZmkxZ3g5MDZwVCtZMnMrNFFOODBLYWIyQjVSc0FtYjlG?=
 =?utf-8?B?RE1GSmJGenMzbnFYV0p3WWxmT1JCMU9hZnNzMjhpQVZWU0JLUUNxWEY5MTlK?=
 =?utf-8?B?SzkwL1YwckJaZ28zam5vRGMyNWdCenFUb1hMeHlWa1JtQnMyQ0VPMzJ4Uy9m?=
 =?utf-8?B?dWV3am0vRFlXSm1WS3RaN0dnTW9xT3ZtdFRNQVNFRDM1SzREZFBXNlk3UGRy?=
 =?utf-8?B?c1VnVXBPNkZMNnBDMTE5NVZjdWFQNktiL2MyOWg0MlpmOWcxaVcvQ1EwUnNq?=
 =?utf-8?B?TWI4aEJ1L3ltQVQvRzhLek5BdmRSNHNHYlIvcTFMb2NIWUR2N09Mc0cweVlW?=
 =?utf-8?B?S3Z5NnhDMWw3dWlrR3R0YTMrRERMSkRBNnhHZlhIOVdWNWpFbENDSFdJSlR5?=
 =?utf-8?B?ejQ4blpBaFdHZ0ZteGZIOUlVN0dVcFpkTkFyTStwbTVwcmc3aFFTZldydG9N?=
 =?utf-8?B?Wm9WR05DNEFzSVowOEZCUmZ6ZmJQcWxmOTVEY21YYy9Bb3BmMFV3c3NEb2FW?=
 =?utf-8?B?dmhoMlVkWDlMZ0lVMzkzY0ZvUDhva3VKbUdPUjU1a0p0a1kwVjAzd0ljZmt5?=
 =?utf-8?B?a252UTdETmVKTE5MUTV6ZHVSa0g3UXVBWDRoekl3cHBwV1dIbWNZTjdTY3VC?=
 =?utf-8?B?eVpRSGM4d0hUSTYrajRZNkREMHlNTmV2RHVCQk1hYTVBVU9Rd1d3a3J0NGhH?=
 =?utf-8?B?cmRoK2xHcWx5UzJmT1pQUkZQWU5ScWhoWFdTc3UvOHZ5cEhlNkg5RWpjdmRG?=
 =?utf-8?B?RzR5RFJvWTU2VmZ1Nk9BdjZGRWRoN1czTno3WUhkUEZnZlk5M3B1UThTbU9x?=
 =?utf-8?B?ZUhjbWYwK2ZxR2tCb0FyNURrMzFsRWJjQXdHckVFd3EwUGN2YmhyMHlyVFFi?=
 =?utf-8?B?T2tOMzFzOUtkc2RnelJpUlNaYTBkVCtSalhBS0NySms2ZTFjTnJPUXRkaUZD?=
 =?utf-8?B?cXdwT2w0b29kbVhCK05QWVo3Mzc0QllwbHF6VlIvdDRJRUdDcVlGb2ptZVJt?=
 =?utf-8?B?TTdWKzlvMGh1elhFMDVxOTNuQnZDT3pKMVJ1UklSbWxHcHhubGhydm9PbWZJ?=
 =?utf-8?B?cnA3Vklib01DOUkyZjhtYi82ZjZMMjdSRDgvTEVSdHR0THlGK09raERPVCtz?=
 =?utf-8?B?NlFZUGRnajYwZm1vamNNSnZ6T29oUHR6NVNmS0dIemFlaWl0WUZLN1JpbXpX?=
 =?utf-8?B?Ky83RTJlclpGMHdmT0ZIUUtBWjZneHNaZDJPU0ViZG0vVGhiMmQ1WTRMTmFU?=
 =?utf-8?B?Q3hFeTZSNEZyL3o5U01YQXdiWnVLMGRxelg3LzZ0dkdNajBma1NIRjBkVmp1?=
 =?utf-8?B?NURoT1pWdnMxeDF6bkEyWXkrZ2xxb0g1Z0xzY2VEcW45K0JJelZpN1NlcTJs?=
 =?utf-8?B?U1QyREIxeFZNYzFSVUJ2b09nbjBhODRMSmhRazBjVDRoZ1YxbVJrTzg1aTVk?=
 =?utf-8?B?c3FkR29IczRVV2VES1RNM2tsanMycFhNeVlpOVRPbE5lYXdXWERvK3o4eTQ1?=
 =?utf-8?B?UFFWK09BMXh1N0VVRFdOT1pPTGdiaEpOalRXUEt3Wm5WRkJuM0l1MGpVbGU3?=
 =?utf-8?B?blJBTi9hdEtnT1B4QVR4Uk5nVWU4RkdDWHlHZXozeHhUTTJsZlRBS2hUNGxY?=
 =?utf-8?B?VlhrVWdUWUo2bnJOclRJWVRlSHVTNFpRVG1heDFQcStVTHNaTXdGVTFmc1hW?=
 =?utf-8?B?SmxCWWFxUWVURWJKVTI4alExaW5aVjI5SlF2TGdMVHdXcWQ2YXpNSEx3WW9O?=
 =?utf-8?Q?HOQiKjGHAiuKQpY9vVDOGRY=3D?=
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
	pocV/HN0QIHD8Ii81CvW21mi4ISkhJHw7QI4C6Sw7x5GAmYmJdd/lF9N/z49dYmjiF+BMy55+ZxoNrx/r3YYJJHfXm6uvXvoCfkTHwmRK6iBqKrFm8j4K0YpSTjByvMi1C7L8Jn++6Iqug7jqxVRjHTPqDiEL5RY6aIywP8EnJj37CgVQ91TQeJrcWLVb1JzEtEhalu72gDYothbyWPYwgpINPUSCwyJFW4l6bHFmw/qZFksWDDcPfpeutrfi+arMAXwaIUo3MqtYo9+FgAiYe70s5f5iXyp62l2ggj33O7L9UmCG/k8IfRy1z7azVzS+2/zGdCYO2PAtef/LMDGuOVgrlbiA3u3ml1R1etMxIlBdkuVSwpXscLY9jACL/mQBcO13lkWilmoBUG2KmR1x1ostLnUJK6wWXvtCUL+deYvPc1DkeRh/uKT7iM4/551TPma3D1MoYm2GFkBtE2H/GP0ENokPpzobsM0tfNILKDYRc5w0aovRBYG2pbc0oumMtVNLwCvYELEQ/RtnW8GSMWIdXtvzVMEvUjC738rWwb80VOxKWmqBTUWqzdCTUGr29ASCgzWEOnoQvLtwd8tLEGPFoHYONeSQ+F/5mggKNROMPBZmaZQkaD/ZKEkyMiN
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 918e8d55-707b-4bd0-0965-08dcf87611cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 00:01:56.7919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oGJDHOSLLxMfuW+tQnbQv/mAwmrAoSgcfd1HuuTPSiAjW/j2UYLER+aJ8v9MfNe4FnzKRMcmBydGB5d5cEkWSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR13MB4990
X-Proofpoint-GUID: C6GElVUNrCyYhWe0RUJBdj7RtPRIRnTZ
X-Proofpoint-ORIG-GUID: C6GElVUNrCyYhWe0RUJBdj7RtPRIRnTZ
X-Sony-Outbound-GUID: C6GElVUNrCyYhWe0RUJBdj7RtPRIRnTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_19,2024-10-29_01,2024-09-30_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gSGkgVGltLA0KPiANCj4gaHR0cHM6Ly9lbGlu
dXgub3JnLyBpcyBsb29raW5nIHdlaXJkIHRvZGF5Lg0KPiANCj4gVGhlcmUgc2VlbXMgdG8gYmUg
c29tZXRoaW5nIHdyb25nIHdpdGggdGhlIHN0eWxlc2hlZXQuDQo+IFdoZW4gdHJ5aW5nIHRvIG9w
ZW4gaXQ6DQo+IA0KPiBbYjU1NDIwNDk1NWNmMTJhMzNkN2JhZWUxXQ0KPiAvbG9hZC5waHA/ZGVi
dWc9ZmFsc2UmbGFuZz1lbiZtb2R1bGVzPWV4dC5lY2hvLmJhZGdlaWNvbnMlN0NleHQuZWNoby5z
dHlsZXMuYmFkZ2UlN0NtZWRpYXdpa2kubGVnYWN5LmNvbW1vblByaW50JTJDc2hhcg0KPiBlZCU3
Q21lZGlhd2lraS5zZWN0aW9uQW5jaG9yJTdDbWVkaWF3aWtpLnNraW5uaW5nLmludGVyZmFjZSU3
Q3NraW5zLnZlY3Rvci5zdHlsZXMmb25seT1zdHlsZXMmc2tpbj12ZWN0b3INCj4gRXJyb3IgZnJv
bSBsaW5lIDY4OSBvZg0KPiAvdmFyL3d3dy9lbGludXgub3JnL2h0ZG9jcy9pbmNsdWRlcy9leGNl
cHRpb24vTVdFeGNlcHRpb25IYW5kbGVyLnBocDoNCj4gQ2xhc3MgJ0Zvcm1hdEpzb24nIG5vdCBm
b3VuZA0KPiANCj4gQmFja3RyYWNlOg0KPiANCj4gIzAgL3Zhci93d3cvZWxpbnV4Lm9yZy9odGRv
Y3MvaW5jbHVkZXMvZXhjZXB0aW9uL01XRXhjZXB0aW9uSGFuZGxlci5waHAoMjE2KToNCj4gTVdF
eGNlcHRpb25IYW5kbGVyOjpsb2dFcnJvcihFcnJvckV4Y2VwdGlvbiwgc3RyaW5nLCBzdHJpbmcp
DQo+ICMxIC92YXIvd3d3L2VsaW51eC5vcmcvaHRkb2NzL2luY2x1ZGVzL0F1dG9Mb2FkZXIucGhw
KDEwOSk6DQo+IE1XRXhjZXB0aW9uSGFuZGxlcjo6aGFuZGxlRXJyb3IoaW50ZWdlciwgc3RyaW5n
LCBzdHJpbmcsIGludGVnZXIsDQo+IGFycmF5KQ0KPiAjMiAvdmFyL3d3dy9lbGludXgub3JnL2h0
ZG9jcy9pbmNsdWRlcy9BdXRvTG9hZGVyLnBocCgxMDkpOiByZXF1aXJlKCkNCj4gIzMgW2ludGVy
bmFsIGZ1bmN0aW9uXTogQXV0b0xvYWRlcjo6YXV0b2xvYWQoc3RyaW5nKQ0KPiAjNCAvdmFyL3d3
dy9lbGludXgub3JnL2h0ZG9jcy9pbmNsdWRlcy9yZXNvdXJjZWxvYWRlci9SZXNvdXJjZUxvYWRl
ci5waHAoMTQxKToNCj4gc3BsX2F1dG9sb2FkX2NhbGwoc3RyaW5nKQ0KPiAjNSAvdmFyL3d3dy9l
bGludXgub3JnL2h0ZG9jcy9pbmNsdWRlcy9yZXNvdXJjZWxvYWRlci9SZXNvdXJjZUxvYWRlci5w
aHAoNzUxKToNCj4gUmVzb3VyY2VMb2FkZXItPnByZWxvYWRNb2R1bGVJbmZvKGFycmF5LCBSZXNv
dXJjZUxvYWRlckNvbnRleHQpDQo+ICM2IC92YXIvd3d3L2VsaW51eC5vcmcvaHRkb2NzL2xvYWQu
cGhwKDUxKToNCj4gUmVzb3VyY2VMb2FkZXItPnJlc3BvbmQoUmVzb3VyY2VMb2FkZXJDb250ZXh0
KQ0KPiAjNyB7bWFpbn0NCj4gDQoNClllcy4gSSBzYXcgdGhlIGZvcm1hdCBlcnJvciB5ZXN0ZXJk
YXksIGFuZCBhc2tlZCBCaWxsIFRyYXlub3IgdG8gbG9vayBpbnRvIGl0Lg0KVGhhbmtzIGZvciB0
aGUgZGV0YWlscyBhbmQgYmFja3RyYWNlLiAgSSdsbCBzZW5kIHRob3NlIG9uIHRvIEJpbGwuDQog
LS0gVGltDQoNCg==
