Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B0F1FA8F9
	for <linux-embedded@vger.kernel.org>; Wed,  8 Jan 2025 18:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736361226; cv=fail; b=WgPLaHPyj+MNqUul7o3a8L0B9TBQYm1YwXRU7Ju49uhOmxXJKEEWleYRLILIJas9ZLp+1CjI6c+wXIlj8iJnHbO89VDc0wmJXl3Ote/uZBK+EoFwiAIJykEJO2evZ1eRxcLKg16+/gJ2hPkLpiGBH3EGKBcGRc8Zk8ZfFlz/iX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736361226; c=relaxed/simple;
	bh=YXjVulfRN78WQFUzEcTUfR3i+wPANEcrD1P2hiHfJfs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E4qvdRcE6b60UO6swHV29C7fwWpRTOLMl/lPlgIqGCHgjWE7WteOHLBAXzfheGr76IPs9nDJigB+JHIPQXN/ko4FPL/GywIDCPCsU6JUMMki2gjEWJTmIIyIjmkg6NdtpD4JAuC5lYBDGDxo9xz4GB6UnkQ1oPCNx2cc6WKutWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=dka1jwpl; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="dka1jwpl"
Received: from pps.filterd (m0209326.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508Ho1X4008999;
	Wed, 8 Jan 2025 18:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=YXjVulf
	RN78WQFUzEcTUfR3i+wPANEcrD1P2hiHfJfs=; b=dka1jwplxV0rZ1CEmHGqGlk
	j2Gk+Fid+4Kqgufk4WGqq8IjztiW9Dyg3WVtt6U6a0BbFzAq71MVDkw/cKP/EiF4
	KSzJnooScI3pWhLAuJN1tL8gEHZ9Iv9FLuDg2vTxMjdqawDChI9T8/P/yfFQ6PVL
	FRqe7+zghghxlcEX3gm+J3m9ljf4d/LNsAgVEalP+kEsG4qUZlgr9fei9GhgE9RX
	2hiIibYKOwu1FkBzhNItrS0GimYEjoszgtzye/rPeABsAzRAoRHnWwnAUUri933Y
	YiRCFHb32aA+af2wK1+4GJcJv9AUroA4aVHg6Cgnkjw+tmznzN1w/v3orFeNHlQ=
	=
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 43xu6e426j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Jan 2025 18:33:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuCLplk52avPUeKeuixcMlPdSWp9nbiAhjOa7GOFJP9/OoMdDzQREmnMO9S4ENU5lZi/HP+pliK/q6ETSEAB+vjZgJ5p9+7nVOzYT2p4WRoh3ALrv/szKonCcLdBIGiDlD5Ydi6Hwloj1AWxLOCW4eU6bT62JCDGLWTME8xjunbOlqjKixQzitJdiodK6kj8iwnV1RVl12f3QnvQl0/ugX5Hf4tPzD4SEWdz2CLtBlC8hN7u6pV1AkuDIbOQO3GjLUu4pV7TH/xWZeExzbSw5y5xBQg+goi4qc/jWtwfsr/UNNfn3SnJE+UdugjqPTy8EOUfqwB4qfH1fBq5EZH5pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXjVulfRN78WQFUzEcTUfR3i+wPANEcrD1P2hiHfJfs=;
 b=Q4yhygysSsI0u0lO66fSKYV87TNSMOHw1kGjTfrqRo2/yKrlB/70hLU33VWUm++5w31E+++A2WcNoJ+GccHUdBeQNEU+rPNxT3VirgN/A8kPjdiCWs0Cpa6iEwksy0WTSOtcRSpBcnmR9pDJ9M8+N/oDzR109dw/JTzK45PfWhwolnpXTZDfGIOyp+m/hIAR4e9+3LiA7BHZG+iu1aroDz2YNCC1zSiWrB3J9bVd6Q3GfcJHZuLvKbMtBrm17t6n5ICVRUjXH9MahLylkiM+IdUGPxA0uv1LHnHqfmuwUUS5De8SGQTC6IxGG8SWPo1P+n+azaV89xe/yGJ0MnJbMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by PH0PR13MB5020.namprd13.prod.outlook.com (2603:10b6:510:93::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 18:33:35 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 18:33:35 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Shankari <beingcap11@gmail.com>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>
Subject: RE: [boot-time]
Thread-Topic: [boot-time]
Thread-Index: AQHbWiLTBybXJIS1AU23EMmh9EFgybMNPmaA
Date: Wed, 8 Jan 2025 18:33:35 +0000
Message-ID:
 <MW5PR13MB5632841906910ED152E7AE3CFD122@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <CAORPcfVRobA+u5q7aPboC=3iY8dibDUB0920Z=Z0VgpQEupKJw@mail.gmail.com>
In-Reply-To:
 <CAORPcfVRobA+u5q7aPboC=3iY8dibDUB0920Z=Z0VgpQEupKJw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|PH0PR13MB5020:EE_
x-ms-office365-filtering-correlation-id: 0b5fdd80-450c-40b8-c6dd-08dd3012f62b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QytRTHJldHZQU2tGUDVreDRSYktZdExhL2hubEVoNDcrVjVqRmFNQnRmWTU0?=
 =?utf-8?B?anZ3am8ydUtBbXNZT3lUS2ZjWldVcVFWR3h0ZHRPbGlkZ3lsQXl4cEdibHlt?=
 =?utf-8?B?bW9kZ3ZpU2pNMzVKSFoxdzJULy81b3FBTExkRXZDaWtBM3gzanJYY2gwMmR0?=
 =?utf-8?B?RHFRbkxtYXdOclpvZyt4QTZYR1BOZGJRT09HQ3JnT0NzNWZzaURTVWtIcUtx?=
 =?utf-8?B?Zm5MNFRqbDVtVHc3bzh1T0IrVExveHZtQ0lHbzFONlIza2x1L29OV045UkY0?=
 =?utf-8?B?S2xFTW5Ba2s3c0g3VEs4dC9YOGNsaVZHY2hiaVkraVVSUStXWUpabmt6OGV6?=
 =?utf-8?B?R0U5TUh6Q2hGUEtjUlRvd1IvK2xxU0hkZnlxQ1BJanZlbzFpb0NLRzJQRmpV?=
 =?utf-8?B?L1ZDZUl4WmhFMm9sUE43MDZ2Y25sRmRZWHBZMmZCOWZ1UTZIYVUxSG0xaHF4?=
 =?utf-8?B?eDluL0dpVWtEQUpmeS9EaFE0MmpyNFc0ODlodXlUVHpwRHhXYjhBR21OTmo3?=
 =?utf-8?B?Y1c2QzBDRmYyRHUyQ0lETGthS1FRZ05uZE5zUjB5Q0N1SWJTUTNIVWpmTEpx?=
 =?utf-8?B?OEYvWTdZMVJuWGxXeHlRMFZ6R0c2U1lLdmthN0lTb1NMQThKVjlhUEE0bUxq?=
 =?utf-8?B?MEJyRzFPcHMwYVZ4T2xNeTJUcjUwWU92SzMrblk5MGplQjhIUVZCK1l5MzB2?=
 =?utf-8?B?VDQ5eG8weDNlTjZTcWRrME9UTERTbGtFeXU0bHZyb0YySWRLQm5JbGFIRW1R?=
 =?utf-8?B?UkpnU0ZaeUhUeDdCaUlkUmNjdWhhTjhRZEd3YnFrdWhyUWVnb1BIaTRNdllk?=
 =?utf-8?B?TGlLUmZsMHpyZzNwODBhVktmV2t1cTJsK3U1dHVRa1J1YUU5QnpyVjgza2lO?=
 =?utf-8?B?bWFrVk1yUE80QzV0V3ZaTy9zelVPOWJDci9Ha1hzSHk1MjNNNksxbzdLYXhH?=
 =?utf-8?B?bEt4SXAzUm56aUxwN1hMTldaUVNBY3d6V2dFczVySjRKWlh0VE1XYVlneWpY?=
 =?utf-8?B?bGd4SGc3Mitkb0o3THduTy96Mm8zNFNwS2o3WVNLNGFLUDBOMzFOQ2kyTlBl?=
 =?utf-8?B?NEVWc3h3OUFkOTJJQ3g0SWFVdEdvSXkyWlAreENSaE14dHFDbmM3MFFtakxn?=
 =?utf-8?B?WkJlVzliMUVwc09mTmRyQXNzc1RFbG0xWW1jOWIyb3FIbmRPdjV2TlY3N3hE?=
 =?utf-8?B?NXcyRk5lZnVORW5zMTJPRU8rOG1VU2pTbWpEZVdFNkd5WUpoZzZNTnVuOFdJ?=
 =?utf-8?B?SEVZejBmMDIrbGNNOG02MjFLMjhqMk42UXlWdXpKWi9JM1laUzRTVzRPQk03?=
 =?utf-8?B?YlFyYmhKY3FwaU9zRUJvWngwd1JZdjRrdVFKMEhIV2ZRK2xLWmt0c0xzSnk3?=
 =?utf-8?B?d28vTUNVWllBRmZTQnlJY2wwZFh4aHlWNWthMmRoU1Z4RTVPYVZ2ZU1XTUM1?=
 =?utf-8?B?L2JLdW5QMXNYTDA0TENxUXZWcGFOUlpJM0VWWXc5WERXb3c1V0ZXVTVLa21v?=
 =?utf-8?B?TTNYanhub0NFVUJRblpCNlprSlFBSFBqVXJWd1hPY1ZoNXphdGMrSks3MnBS?=
 =?utf-8?B?a1R0Sm1hak5CSmxZTWdlbkxJd1VaVGp0N0lVTC9LclRGL1FHMkdFZjVBUWZQ?=
 =?utf-8?B?bnJmZ0pmdTZpR3RnYkNlTFo3QkpRbnpnWkxmUG1SMGZvY3RBaWp4cFp2cEFJ?=
 =?utf-8?B?TVlqKzRPa3B6WjVzMHV1VVFYeG9LTzRrSFM1clFWUmVtdE80MzY5TXl3eWpH?=
 =?utf-8?B?aTRURzZyM3Z0UHlvMEtyMUVtMnk0NXF3QzlvejVHUWQrS3RFSlpINVBPVjd4?=
 =?utf-8?B?SVhzbkFKK2gwY1k5UU14UmwxeTIyYUtFNVFkR0hwYXNqZjhpK3RtZ250ZWdl?=
 =?utf-8?Q?OxuksSvNz2Ky8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y3RjZDJyeXJjS0Z3eUtVNGZwWE55K2R4UjJxc1NkWmlVQ3NRYlZJRi9rVmh1?=
 =?utf-8?B?T0NzRmRpRjlycXNMWExqUHE3VjBzWktFSXI0UUVQS3IyQy85YjBnOE5lbU8z?=
 =?utf-8?B?VGtnTkdRZGthZUhuSHl0Yk5rcTFFejdPalRCUG10bFBCdkxCemNldVVEeFdY?=
 =?utf-8?B?eDJaNllRRG44N2xzRWhVZDl4Vkh1RWo0WjNKUzdVZmZ4V25sZ0JpVGVvSS83?=
 =?utf-8?B?UzRGWjlodU80MXlScFhnL0lDd212RE9wMlR6Tjlrc1p2U3ZXd0RIaTc0MXNk?=
 =?utf-8?B?c0tNUDFVQ3JyTWg5YzhzdVVHVEJzcmowWU5IRms1UkJHRVNpcnIrMGhtSmI1?=
 =?utf-8?B?K1ZvdzFKVlJ6Mkl6aE53Y0NQby9vNTZSM3V3Uk5HYTFnUzR6L3R3bmNOdUN0?=
 =?utf-8?B?Ri9WT3M0NGZRZjl4SWlTZUUvQ1MrNjl1R3dEWUk4UFRPZFRBMlE0dDV6N3RY?=
 =?utf-8?B?NDNRL2h4QW1SbTR1QXNETXc2blJnU3BJYjU5V2UzbjFqOGc2aVRpZmVERlpP?=
 =?utf-8?B?TCtvYUExZXpZUStreG5JWUJEOXBHSVlpK2Vta2lZWHRkVHNlNU5sNDhlcnEz?=
 =?utf-8?B?b1lsN3pLUFdzTTVaeFN2dS9Lczg0M0pSNU9lMks3S0xZTW9nbUYydER3d0o0?=
 =?utf-8?B?RUJ0ckpaZHJod3lSblh5ZUlCK1RTRVdVSEdYb1E4d0s3dFQ4V0JQUi9oc1VL?=
 =?utf-8?B?c3g3QUcvcFlUNVA2bjRzNGRXcFBROVZpTmphdENJOEJ4UHgzbTNlRllFQ1Q4?=
 =?utf-8?B?SHFLR0M1NUNieG00ZGtKU2NNWExISTVXaWphenBTcGg5YStXYjlpTjU5MEMw?=
 =?utf-8?B?dmZxZ2M5SnFyZWxuMDNNdmUwVnAyU1FRbGQybDZ3ZGg2RVZMajF6USsxN0NM?=
 =?utf-8?B?QnBpZk40TGdjNHFzTGN2VzhlSFpBRklITVdVdkdGNXNXTmROZkM4MjA5SUNJ?=
 =?utf-8?B?VDl0ZUVXNmtJQWRmS3lwZFN0bWhGdlFMcXJTdDNSdWlueWtHRTBVWFNDU3Mw?=
 =?utf-8?B?dzgwSXA5VDBxYndFaStOREhBTFF4bmxtRXNOWUFvUWNGb3hSdFN1T2tmclVl?=
 =?utf-8?B?alhrRW1RV0gyM2tKMFNtTFFQNjlOc2VvM0FpZExMVFFGM1F0dEgvcFRnMXky?=
 =?utf-8?B?TWV0Zi9Ld1pySmVEWjZDTlphczFJM0t0NGZtckxlQmRBSmJmaTR1YTBxbzlU?=
 =?utf-8?B?d1JYV1I5VDRyQXU4Q003alI2eHRrTnUvVlUwU0dPeGQzV2Vsck9LWkZ3RGJ2?=
 =?utf-8?B?YXZQS3dtb0RoalNuZy84U2VCSUVsUm14SkRqNnN1WTNDbFpvaHBhaXIrMlRn?=
 =?utf-8?B?bE50eWVveVhycEVRcTAxWUhQUkxtWHF3cUw0WDFtd21RVXBETkxidjBSSGRq?=
 =?utf-8?B?U3hLc0Z4WFo5Zk5rc2p4anNldENObVFLZi9WNlZHTXdreUw0aXhuQmNwRDds?=
 =?utf-8?B?OEdEbHV4TVZlWm9BMHBtUUFSWXVFSHg2VnluNCt2d1d6K2h0WW9GV2xVd0hM?=
 =?utf-8?B?dW1wTjdsblYyZDcwUFdrU1RMYmdPQkdhVGE5RmxUTlBKK0l2aDFJellGWmEv?=
 =?utf-8?B?cDc4VmtWUnpVTk1uWXJjMWd4N2M1ZldOVHhBZ2xnZG9DWDd0OHp4WWZhRkla?=
 =?utf-8?B?WDF0SXhRN09QRTlDbkZzVjRldkhRYm12Vys3WXJOdmx1c1Z1ak4veGhybVZI?=
 =?utf-8?B?VVA4cXF5eFlaaFRVVzhFMVNPYU1WM1NOSjIwQ3hjUjdJUmlUc0xOK3pIZjFX?=
 =?utf-8?B?bkNjZE1MbGhZeTRTWlR4R0FnTXRaQUptMmpmUDVqQWxsaUQ4Q3NQR2gxeE1u?=
 =?utf-8?B?MHRrdThxL05YNHFnLy9oNVdjbmQvSE8yaFFPUnc2N1F0ZWQ5UDJwc1BQSk4z?=
 =?utf-8?B?Ykk0dWFjNks4cmpJTk45SGJCNDI1VUY0UnkxOVozL2I2T2FEVm1HUEdjdEp2?=
 =?utf-8?B?YVArUm5YcjlUNis3T1R6aHp1K2RiWmZqMzdZSjdpRjVwdnN4VmgyM3I4dmJR?=
 =?utf-8?B?aHo5QktSZ3R5NjZvQlNRanhmU0YwVVIwalBHYXVha2M3QnF1UjZreVY0RE1V?=
 =?utf-8?B?QlNKay9RVm5KTzJoSE9iMVFqR2YzQ2xEck9VYk92dStvSXBDbDdFRThudHFB?=
 =?utf-8?Q?SS8A=3D?=
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
	rHg4VMt3fnAxI7tSAfgWNAcJCfeLZa1/d40ISo9zWUWI0me/sHHqvoJ7DPbuqfOz5ZqQDVkXTGHk8rvncZqpemJ3Pigx6yOTzKuwuAp6IbNfQDQqxBi+QN+70VT6zeQSaD+36RClTkvN86Jthppl4pzIytR8+pK4+T8xF5Pga+eZ9th3o/BSKGSCRSuNE5OtuDcYTHwe8AtYKj9M1lHS+8p7XS6g+slsru3ODK8mmyqZKIUi1VXMU0QDj9BXC7okmJZF0xFSZMSVCMcv8hdusjJITecPioBcHeQwKWEAK573wqYmFfDBZixobnHpvG6Vds+4Q1yicn8Hw36MgIqt+H+NGPUUJ3O4l32l5rcyhnCaaEHTXbSp22aK3o7F3brQboONsBU16JQZcJR9CIuZC3TP3oVu0gcd1FhVfkaIeWHQH6JHh1tmpCB0K6RYMbkYlZ/CY7uDSjdg8lts8bprn8DVFiD+9FbWKl2kKYHrMFuPyQS1hXsGras9vL4o3R2Krd6MwNu0frdj/Mp43vxlrA4IOR1iqJZ604ZawqyH2nN9lzACnf6D2yurjle3zdq95Q7ds1dn8cVF2gL25iECTmwxQ9XDBeDxCl6l/Aexeyk+tPHgfgM+/StzJsFJ417K
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5fdd80-450c-40b8-c6dd-08dd3012f62b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 18:33:35.3932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3yfbLhjyOzAIA/IKK1cfW9w2Q1Zmhnw5lckj9eUjHxoa/zXVwZ3VgTg6+GONq3of2ImyRf8ezS0O4CRGz/sydQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR13MB5020
X-Proofpoint-ORIG-GUID: scv50nd2hoHyjy1HiS0RDOJicIZZ5SgN
X-Proofpoint-GUID: scv50nd2hoHyjy1HiS0RDOJicIZZ5SgN
X-Sony-Outbound-GUID: scv50nd2hoHyjy1HiS0RDOJicIZZ5SgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_05,2025-01-08_01,2024-11-22_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTaGFua2FyaSA8YmVpbmdjYXAx
MUBnbWFpbC5jb20+DQo+IEhpDQo+IA0KPiBJIHdhbnRlZCB0byBwcm92aWRlIGFuIHVwZGF0ZSBv
biBteSByZWNlbnQgY29udHJpYnV0aW9ucyB0byB0aGUgYm9vdC10aW1lIHJlZHVjdGlvbiBwcm9q
ZWN0LiBJIGhhdmUgcmVjZW50bHkgc3RhcnRlZCBjb250cmlidXRpbmcgYW5kDQo+IGFtIHdvcmtp
bmcgd2l0aCB0aGUgYmVhZ2xlcGxheS4gSSBoYXZlIGJlZW4gYW5hbHl6aW5nIHRoZSBib290IHRp
bWUgb2YgdGhlIGluaXQgcHJvY2Vzcy4gQmVsb3cgaXMgdGhlIG91dHB1dCBmcm9tIHRoZSBzeXN0
ZW0gbG9nOg0KPiANCj4gZGViaWFuQEJlYWdsZVBsYXk6fiQgZG1lc2cgfCBncmVwICJpbml0IHBy
b2Nlc3MiDQo+IFsgICAgMS40ODA0OTBdIFJ1biAvaW5pdCBhcyBpbml0IHByb2Nlc3MNCj4gDQo+
IE1vdmluZyBmb3J3YXJkLCBJIHBsYW4gdG8gZXhwbG9yZSB3YXlzIHRvIG1vZGlmeSB0aGUgY29t
bWFuZCBsaW5lIGFuZCBmdXJ0aGVyIGludmVzdGlnYXRlIHRoZSBkYXRhIHVzZWQgZm9yIFNJRyBh
bmFseXNpcy4gVGhpcyB3aWxsDQo+IGhlbHAgbWUgZ2FpbiBhIGRlZXBlciB1bmRlcnN0YW5kaW5n
IG9mIHRoZSBib290IHByb2Nlc3MgYW5kIGl0cyBwZXJmb3JtYW5jZSBjaGFyYWN0ZXJpc3RpY3Mu
DQo+IA0KPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIG9y
IGFyZWFzIHdoZXJlIEkgY291bGQgZm9jdXMgbXkgZWZmb3J0cy4NCg0KSGkgU2hhbmthcmksDQoN
Ckl0IHNvdW5kcyBsaWtlIHlvdSBhcmUgb2ZmIHRvIGEgZ29vZCBzdGFydC4gIEkgaGF2ZSBzb21l
dGhpbmcgdGhhdCBuZWVkcyB0byBiZSBkb25lLCB0aGF0IEkgdGhpbmsNCnlvdSBjYW4gaGVscCB3
aXRoLCBhbmQgdGhhdCBtYXRjaGVzIHdoZXJlIEkgYmVsaWV2ZSB5b3UgYXJlIGluIHlvdXIgc3Rh
dHVzIHdpdGggYmVpbmcgYWJsZQ0KdG8gZXZhbHVhdGUgdGhlIGtlcm5lbC4NCg0KSW4gZ2VuZXJh
bCwgdGhlcmUncyBhIGxvdCBvZiBpbmZvcm1hdGlvbiBvbiB0aGUgZWxpbnV4IHdpa2kgd2hpY2gg
aXMgc3RhbGUsIHdoaWNoIG5lZWRzIHRvIGJlDQp1cGRhdGVkIG9yIGFyY2hpdmVkLCBvciBtYXli
ZSBldmVuIGp1c3QgcmVtb3ZlZC4NCg0KVGhpcyBzZWN0aW9uIG9mIHRoZSBCb290IFRpbWUgcGFn
ZSBoYXMgYSBsb3Qgb2YgbWF0ZXJpYWwgaW4gdGhpcyBjYXRlZ29yeToNCmh0dHBzOi8vZWxpbnV4
Lm9yZy9Cb290X1RpbWUja2VybmVsX3NwZWVkdXBzDQoNCkNhbiB5b3UgdmFsaWRhdGUgdGhlIGlu
Zm9ybWF0aW9uIG9uIHRoZXNlIDIgcGFnZXM6DQogKiBodHRwczovL2VsaW51eC5vcmcvRGlzYWJs
ZV9Db25zb2xlDQogKiBodHRwczovL2VsaW51eC5vcmcvUHJlc2V0X0xQSg0KDQpUaGlzIHdvdWxk
IGNvbnNpc3Qgb2YgcmVhZGluZyB0aHJvdWdoIHRoZSBtYXRlcmlhbCwgYW5kIHRlc3RpbmcgdGhl
DQpkZXNjcmliZWQgdGVjaG5pcXVlcyBvbiB5b3VyIG1hY2hpbmUuICBUaGlzIHdpbGwgaW52b2x2
ZSBib290aW5nIHRoZQ0KbWFjaGluZSAyIHdheXMsIHdpdGggYSBwYXJ0aWN1bGFyIGtlcm5lbCBj
b21tYW5kIGxpbmUgb3B0aW9uIGFuZCB3aXRob3V0DQppdCwgYW5kIHRoZW4gcmVwb3J0aW5nIGJh
Y2sgdGhlIGZpbmFsIGJvb3QgdGltZSBmb3IgYm90aC4gIFlvdSBjYW4gdXNlDQp0aGUgdGltZXN0
YW1wIGZvciB0aGUgImluaXQgcHJvY2VzcyIgc3RyaW5nIGFzIHlvdXIgZmluYWwgYm9vdCB0aW1l
LCBmb3IgdGhlDQpwdXJwb3NlcyBvZiB0aGlzIGV4ZXJjaXNlLg0KDQpIZWxwaW5nIG1lIHRvIHVw
ZGF0ZSB0aGUgZWxpbnV4IHdpa2kgbWF0ZXJpYWwgb24gYm9vdCB0aW1lIHdvdWxkIGJlDQphbiBp
bW1lbnNlIGhlbHAsIGFuZCBpcyBvbmUgb2YgbXkgbWFpbiBnb2FscyBmb3IgdGhlIGJvb3QgdGlt
ZSBTSUcgaW4gMjAyNS4NCg0KRG9uJ3QgaGVzaXRhdGUgdG8gYXNrIHF1ZXN0aW9ucyBpZiB5b3Ug
aGF2ZSBhbnkuDQoNCkJUVyAtIHlvdSBjYW4ganVzdCByZXBvcnQgeW91ciBmaW5kaW5ncyB0byBt
ZSBhbmQgbGludXgtZW1iZWRkZWQgbGlzdCwgYnV0DQphbHRlcm5hdGl2ZWx5IChhbmQgZXZlbiBi
ZXR0ZXIpIHdvdWxkIGJlIGlmIHlvdSBjb3VsZCBhbHNvIHVwZGF0ZSB0aGUgd2lraQ0KcGFnZXMg
dGhlbXNlbHZlcyB3aXRoIHlvdXIgaW5mb3JtYXRpb24gYmFzZWQgb24gcmVjZW50IGtlcm5lbHMg
YW5kIGhhcmR3YXJlLg0KVG8gZG8gdGhpcywgeW91IHdpbGwgbmVlZCBhbiBlbGludXggd2lraSBh
Y2NvdW50LCB3aGljaCB5b3UgY2FuIG1ha2Ugb25saW5lIG9uDQplbGludXggd2lraS5vcmcgYnkg
Z29pbmcgdG8gdGhpcyBwYWdlOiBodHRwczovL2VsaW51eC5vcmcvU3BlY2lhbDpDcmVhdGVBY2Nv
dW50DQoNCkFueW9uZSBlbHNlIHJlYWRpbmcgdGhpcyB3aG8gd2FudHMgdG8gYWxzbyBwYXJ0aWNp
cGF0ZSBpbiB0aGlzIHByb2plY3QgdG8NCnVwZGF0ZSB0aGUgZWxpbnV4IHdpa2kgYm9vdCB0aW1l
IGluZm9ybWF0aW9uLCBwbGVhc2UgY29udGFjdCBtZS4NCg0KVGhhbmtzLg0KICAtLSBUaW0NCg0K
