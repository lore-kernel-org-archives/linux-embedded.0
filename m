Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFCD3C00
	for <linux-embedded@vger.kernel.org>; Sat, 24 May 2025 00:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748046515; cv=fail; b=YYKeYsG/p3m1+Mrji1rpaqjd0Z7ZqmrEehE0vXKOEr2rJz91W/dRnm9alygjIcO9p7jjdalPNRGevnhAWV+4zs179ofoRfPdN+KqBqVNNfCTHARUR6ZQYtxydzhryeh2f+egmjZf9E7qwTpfYeUcQIwbaYZ538RdMbtuXUvjtPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748046515; c=relaxed/simple;
	bh=V99w9hBxqqQ59s+sG5nPMoZSfJh4zMm9SW4Wd5bqHG8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FtazVSULs9UHps8aQDVeCIlSXenrL88ar4PuLKfNwMjgiw0QNWX9hhfOqRTNFcy0EOllgTF5fbKiBhRge1WuvSIEGTyyUMrw1nXBFLF6StusT4ngCAopOw+dNaDGG8QAp53vZssVs772BYEzgZjr1QhjgXSQA1Ng3i3MrD7c+Xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=YGxmNDK2; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="YGxmNDK2"
Received: from pps.filterd (m0209324.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O0KO9h011964;
	Sat, 24 May 2025 00:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=V99w9hB
	xqqQ59s+sG5nPMoZSfJh4zMm9SW4Wd5bqHG8=; b=YGxmNDK2vlEnQtIw9dzGUDZ
	jvvegMwc6eB5h3g7zMW/b7WAIVHysx1j5/pHMJGtdJLO8tKYlVSFVAtmjLCF9H48
	hlN5tPKVaVZ1bLTZztNMf/w64TY0dAWDghyfDBQ3LelrvlNinNbNcPdRhyo5k2c/
	7EY4GFD3ZVMIw97hnspy46yUOZ3QYMz7p3s3Utza4g8aKsjBh8Fi8ye918fmF4jA
	MISIQ9IKp+PzyNi8R8BheVGJaHyX+inX1w44P+5sQn0OR/nZLGhlxMylY/YrfkC1
	coUPgsgAiCzBLkbqOyulK6g0ecWD9oCREny5F+eGoI1JfobDFgSSSuFGDb8tZVw=
	=
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 46u39700a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 May 2025 00:28:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5xTZA+sodmviH4g7ffI6Umz/hoqVEOdiAOs59bTT8aHNAYuw8Y1Hn64rtS9udYmUaOE5wRcCTRij3iicX1KwJMOwczRAxj5+NPTQ0748YVH3G8kzh+xczNNT/GGIBoARKPJIvGJpk6GKWQT99HsYMNh+SgK2L0cfr2Wv572oSgbMmgurRwy20buA+2P2nQG2Bqifmii/8YARcQlAf5UO60aHjboPcLZNSc5bVT27aeHJpIYNqzsTxHzyBrJmmb3fPS4sT+zgdavE62YPeB4IjU6S8MDZwYEFVi/qIlLTKVc5VGHMdtQu/VjFjsZ3/PEwUh0G0iuXQt7eKpOOF/PEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V99w9hBxqqQ59s+sG5nPMoZSfJh4zMm9SW4Wd5bqHG8=;
 b=OgrgajllovOHA1VtPW5Uz5LIIaMbh7dj97cG6F2uNiQ21KZteT4vsbzxa0l8ryK+YfQrdWKvFb86BhOhetl9TZKoBvXOGbA8RlaHc+z7lzNjfH76Fs2NJsWdiM0EACaEDgP8aptE4m4u5JjNKTkAg8PDs6G8cR1hQsmIef/awi0QskW9Cxd4/1JWv4L3s8hCMNS8/UynAdcetr+f6oULpxAaK1KMSIFglROLEk7u2UislLNOhL+oQuUOe6Kf4JnLGZvZR2GV9YBEqu0Ufy7nWJWGH7dq1Fbgmto/3smFlXITtgHF5i0CsfvWoPSS7Cld2+vjg5RpYYlDsxX6quJFcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SA1PR13MB6648.namprd13.prod.outlook.com (2603:10b6:806:3e7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Sat, 24 May
 2025 00:28:18 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%5]) with mapi id 15.20.8769.019; Sat, 24 May 2025
 00:28:17 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "Bird, Tim" <Tim.Bird@sony.com>,
        Federico Giovanardi
	<fede.dev@giovanardi.dev>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>
Subject: RE: [RFC PATCH 0/1] Add driver for bootstage stash
Thread-Topic: [RFC PATCH 0/1] Add driver for bootstage stash
Thread-Index: AQHby3knPIcKqx4Q9kuTC9KB9U8LtrPf1McfgAEOqOCAAArCQA==
Date: Sat, 24 May 2025 00:28:17 +0000
Message-ID:
 <MW5PR13MB56328F3D55BB197E4553AE7EFD9BA@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20250522224223.358881-2-francesco@valla.it>
 <PA4PR08MB604681FF6392B25A19926A11ED98A@PA4PR08MB6046.eurprd08.prod.outlook.com>
 <473a062e4f939bc58a5c0e636569b826@giovanardi.dev>
 <MW5PR13MB5632A2522BFAF3066DCC57CDFD9BA@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To:
 <MW5PR13MB5632A2522BFAF3066DCC57CDFD9BA@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SA1PR13MB6648:EE_
x-ms-office365-filtering-correlation-id: c84fd193-5468-45e2-a472-08dd9a59e14a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TnlnMnBndlI0NVlPNzUraDR4eXhwV1k2QzgvaXpqWUhkSkZxR2dGbC9JUzcy?=
 =?utf-8?B?ZFM2ME9sbkM1SmVGZVhqZ2ZSQ2hNbkl6anlJRG03ZEdNc0orM3h0aGJ5eCsx?=
 =?utf-8?B?QnlwM3VwcjM5Tloxdlh5VElzOTJJa1Y2SDFxSFpYZUdHWFhtbjFCV0RoMVpC?=
 =?utf-8?B?ZGxUdHlXUWlFVFVCSnBTeHF0UG5IZSs3bThKWThRQUM0c2RZN2lJcnhIbm16?=
 =?utf-8?B?eXNhdG5UcWdVTm5yZUN1bmh6dkFjSC9UTUdDMjBTRUlPc28vMmR5cnBHYjMv?=
 =?utf-8?B?T3JzWWl6SlREN2Rjam5sdmc5ZmYzNkZnbU1uY3dJYXN3NENCRmtEQStUbERo?=
 =?utf-8?B?STJzcGNvQW8yc0h4MnpneDltTmZ5THhxbS85ZGlhWlJZSzlLOXlDbHFyb0JS?=
 =?utf-8?B?STdDUDNpdW5vVmJYZi9LK1ZLRi8wM0lOVlJ3N255U0FPOU4wQ3BZcEkvMXBV?=
 =?utf-8?B?dElad2FkR2tiYXB6RzEwYVM0VGovKysyK2c5WUtWWGlvUkJxYyt0WXFkc05h?=
 =?utf-8?B?Z1kwbGI2TEJ0clg0MklsbXY1bGVKalduV1RTZlpydTJKS0d6M3pNbzVvalhZ?=
 =?utf-8?B?cHE4RWUrbjcyM090eEdpR3pkOVhCUXNRWVNKS09ZV0xzTmRwNHIxVlg3SENw?=
 =?utf-8?B?OHErRktkRVVqZzIyd0JyTkFVTTJaZGtDR1ZYQ1JobHQzL0pCMXg1UmlDWWZk?=
 =?utf-8?B?ZlNHbzNSbFBOODR5YUNSQk1WQW0xVTlWQ2VUcEpUY2pvMUJpS0hINDZ0UzV3?=
 =?utf-8?B?amVLOUZDNXpYLzBqZkxBb0ZWL3YwOEdOL1duMWdiT1drRVdmUzZyNUlPVWNB?=
 =?utf-8?B?MStKcE9qREhRUWpsMStzaUorK0dLZEt3aEhEUW9QR05zdmxiVG1LSnJCTldj?=
 =?utf-8?B?RUJWOXB6eXU4OHhJR0ovMk81aFFlSlR5U0E0L0Z3eHhGeXRJcGxTUjkwVHpE?=
 =?utf-8?B?WllIQmgyMGdpSlVwd0hLSjNNd3YzNko1dkRDSFhvTXJDZ1FITHFVNnNhZms2?=
 =?utf-8?B?MkxQaTM3VmRsb3hDZkFWQ3ZmdnVINmd2dmhDdmZ5SHk2cklYdExyKzZKdjh6?=
 =?utf-8?B?V1lmeWhNZUozMEhsK2NHSWtOZERjeDR5L2lqeWN5eXV2RktPK2ZCR0o3Mlkz?=
 =?utf-8?B?eGF5eGhidkhieWp5R2NDelQ2eXRvOEdneFdHM2szSXFwL3R6N3FCUFV1YzRH?=
 =?utf-8?B?RGp2SHIyQkVQekg4TUxDNitTQ3pEdHdMYWswcEtwTGxnaU51cWRZYXJJT1ZV?=
 =?utf-8?B?OThUM2pMYzEyOWFacENvejhINGplVW9EbXVYV2U5ZWxXVGVtR2o4Rm5CU1lx?=
 =?utf-8?B?alFscUxyQTdNZkpwejJNeWZaRzVpazNlazFCUWFOQXhhdlNVQVhZRFN5NlY5?=
 =?utf-8?B?em51WUlwZ3BLQzFsMDBFVkJKRmdFOXNxSGc0akFzd2RmOGtBazlZN2tCTkdU?=
 =?utf-8?B?NDNWL2VxSHpBWFd4QVN3eHNRSS92Y3lXbGRZa2RYMkhnMktnaEFNSWpkeVhp?=
 =?utf-8?B?UDdmTlplRWhrcUN1K094WFg0VzdMRjRLQ0krNktKT2ZlSjlXVnJQS0daZ25x?=
 =?utf-8?B?TjZ6UlQ3cGsyNzl2RStLZ05TdmkvNWNVOFpKN2xEcWJ4cStSQi9FdzRxTWNs?=
 =?utf-8?B?Si9LbTIwTVB5NERMYmJUb1BqcE5ibkZ4NnVZaEpPRi9saDlMbVZvaDhxeG9E?=
 =?utf-8?B?aGNqZDlSSHJVZytLQ3NueEFsZUxGSVdnV2Z5K3FCSEY0STVSRnpUNmsyTWNj?=
 =?utf-8?B?SUdXcDhWTisvZ1hwOVZMdmR1cnZmbnJlS0lGaUtpYldVVkZKdkpDYkNyZWZV?=
 =?utf-8?B?K2s4Zkd6Nys1dWFZejh5UGYvMnhCeVlaRzVhZlBFL0E1WVFZTnZubWxvN3Vo?=
 =?utf-8?B?U0VIUmdIQVR4NmxRdERQSzVDaXdFWHZ6aDVOd0x4aVByYmRKbHZranRmcEE4?=
 =?utf-8?B?c2tiMC9iTXFydUtwT1QzeFozYUREQ1E0akZzOXhySUQyOHZiMHBvMXloQ3dk?=
 =?utf-8?B?YTdGSmIyWVlnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NExQRE94LytRR2d2M000ZGVteWdtL3JtcGxJcGt1SHBwbHBiSUZpS1hqOWNo?=
 =?utf-8?B?Nms5cE9uK091M1FYMFdYVGh5dDdFd29PR3diM0pjTjdiM0RUUklTRnpVblZB?=
 =?utf-8?B?Mm1GazRNYmNGZTI0dlZGbldkK3BFRyt6Yzc1blF2dGlobGlLTGJrVFA1QnRI?=
 =?utf-8?B?bGZLUHo2cGlBbW5Lc2c5NE1PMERqM1lVeVlxalBFelVjZnh3OTZ1ZDdMWnhj?=
 =?utf-8?B?ZDh0UThBc1FwdnZUckk0aG9GUGREejk5Zy84UUhFSzVwRmJiQmVhK2x5dWxL?=
 =?utf-8?B?WWpTT1FDY3dFZXZWclpXeTFZTjFOMXVVSCsrT1dZakRXVlYxNDFnU3hlS0JE?=
 =?utf-8?B?dnJkQnFnZnJUME9LVVlJMm5VOHdYL1lTNFRoTTFPdEl4TWc5OHJHL01LQ1Vj?=
 =?utf-8?B?MWZnYzk5dU85TjBNRm1vM2lLL0FEcnY5YTVSdjh4UUtWdHFISExqNndWSTNL?=
 =?utf-8?B?N1ZuSHBSNWo3RUNFWHFWRUUxdU14RUY3QUlFcStpUVM0N3RoTkpPY3RjZnhY?=
 =?utf-8?B?THN4YkliUWg5Q0llRC9mOUYvNnF2Q2NOSjJZVU1XSjRESUZPZEZzbEk5UTBB?=
 =?utf-8?B?cHYrNExIMm9LWWlJcjU0QngzaVhJWmRUcUVvNVNTMXdoNWp0cjd3WW5zSW93?=
 =?utf-8?B?UThRdUY0TXhYbndGOTVVc1prbmc5Sk85dHFrcDZMOVZKemc4UnZKWXBvUWVQ?=
 =?utf-8?B?cStSdldicGpSMlJneExFQTdrNVpPcFcvUk1Pd2Y0WkNZTkN1UG1XK0paVUZk?=
 =?utf-8?B?SjNpRDIxSmhkWTNoalBLL21aQnU3eWZhU083amRsUkFYN29MbTdUU0U3ZUVy?=
 =?utf-8?B?dVlsRjdzWkdyekZNM3pseVdoa2lVKzU4UHIrT3JiZ0c1L2dPWmZsVzRJNXV1?=
 =?utf-8?B?YW03amE4aE9EeVdzY3RUYW50TFE5ZXNFZVFyRENxL0M4TkxlMytFWWRaTllr?=
 =?utf-8?B?VjFqeDVkeVpvWlFMWTNsc3UyNkhEMk5PT281bHprMXBZV0RwSnQ1MkZsR0sy?=
 =?utf-8?B?REVndnQ5elJEZlkxVUlyWDdvVHE4VnBHemRvZ2RBZkloS21td21INjdQZEFK?=
 =?utf-8?B?MkdSQzFramQxalZLaGtHN3BpN096Y3N0WTNCWExDYko1Y3lZU3o3Ymt3Ung3?=
 =?utf-8?B?b25IWFhZWnBEY1U2dnpPSENuZlZlc1NFQ0I0bVRJQ0FkdlV3VERQSW15Tm9r?=
 =?utf-8?B?TnlKQ1ZOQnJkcWZRZlY1MU5xZktGb0tWVS9lMStxUEFiSjNuS3ZOOHFqSUFk?=
 =?utf-8?B?OTJGd3NLRHRacVZOQy9Zd2k1eXMvbTA5SnlmY0llNW14VzgvM3VvVklIWFlC?=
 =?utf-8?B?eDZDaGJUZm9sejVLVkl5VHdKalVSdnNxVFFvS3VQbElGZ3NJck5HcGVoUlNY?=
 =?utf-8?B?RlNFbGlrSHBWS1hLSjZ4ZXNhbVdIdWZhUU50V2xyTStyZUxXaVQ0NTNwNVAy?=
 =?utf-8?B?Tm5OVUZGNlA4RjZmd1ZWSGt3T3hmbUlSdlNPY1hOTE1VaE5kQlRJTllNbDlj?=
 =?utf-8?B?dXhLVzFndmNKU3VrU3U1b2FQMjhaU2hMdkJVODRjVkxrUG5pRnJaZFVLSngz?=
 =?utf-8?B?d3ZYRjh1MkQ2dW1WMUlDRDV5UG9QTDI3QUwrVzdpbWNJZ2Q1Mlp1aWUyZGtt?=
 =?utf-8?B?U1BuQkZXQVFQYkVCTWhCa3ZkVkdROXlYWk82YnpIZDBWZTBPRndwb0lUWmxB?=
 =?utf-8?B?MWZQRkFyZEY1blNWWXFuY2JxZ0t1WXVpNFNyRUZCZC9BUnh1SzkwWHhPd21E?=
 =?utf-8?B?TU9ERDE4VGFKclRTTXYycEJMbnZHbVJuRGdEaTZCSXJ2WkIwOGVwTm01L1cz?=
 =?utf-8?B?UFlXWWJYUjVDUEZlU1hlTDMzU3gwMG5qZCt2bVBiR3ovRWlSR0JLOG8wbmU3?=
 =?utf-8?B?WWErcWZLbTI3OEdIelBlMkdndGMvcUQ1blpJeE9tMkxpbkdjZkFOd1dxUU1z?=
 =?utf-8?B?SStiek81Y0NxdHQ5RDZoRTVCZ1JnRWlkMExNcDk3U2dJZVBsV0syYTVRb1cw?=
 =?utf-8?B?eHdCZ0hVZWNMM2swaElCdFFNZlVDSVlIb1M0WlE5WkNrZGt1ek05MVdWcnNr?=
 =?utf-8?B?UzRGQSt4VFdKWnBHNy9uWVEwMlFsdEV4bXBEV0RJTG8vSDZFZzM4SjRpaUUx?=
 =?utf-8?Q?A5KE=3D?=
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
	xeNAn9+nQ0TerlYtNlZuBFS7MVaP9RGq692X20OwzmBWdHKEly0MW5KrEts6FPN3W7Xs/pxhtC1GqtfQJB3QLqWuW7OKIOAWgef3nfsms+pXrcPwN1XF/KT46l+746fEcP10MUUyDK6TExrgcgqNgm2W6anDECSaFhTljHA8TihCGfwOckHvmObu90aFY1y/2bVC8Wag2zwQDzj8wAghBlCAKqjYMBSKdt7pvlBQDhbng5HOiDFUGHnfhaIWA4k+g3eyCkyU62q/y7LfBsxsoqCFmDHLlnN4Z2mEKoOC0D7XY+y2BUcuYpy2ezNhcI4DbpWPWjnr/w+URnsK8Mhym0LmVpO+52XUtjrm1TAGgg47/foqUx0/Oxv9FLEVskwSoSZHOMp/Qad7vBi+z5RXMU997Yn/8CIVGJavb15Iqnw3e2tlPqQzAsS63UkzODzBPyrCI5r96fY5bWumG0Tmem7a9xaMFdde6yCej9TxCfZ/k/CU4dOxBkDPSO1T6LkKe+udgZ4S4QnRbn/V7GbHRHsuxt/REKJptWOB9Moliwch8k955xKpdePRKbT5IO+RrCegcV1DnNvR8VbmJC4XRuGFEY0RAvJZRgbAk4RSVjV43Z/rcF6A3vf7dhFDlCu+
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84fd193-5468-45e2-a472-08dd9a59e14a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2025 00:28:17.8691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uk3x8+T+YW05clOccp5N/xYvn3nlrjAB2HdsAqC0DYzJv1j8ys0ysdalM9ep7w2ixcBkUk0eGCee0+o0GmILOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR13MB6648
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDAwMyBTYWx0ZWRfX1zm541Jg6vRr Iy1BSjPuOpVdjCMMuybx6dcZ9QPqIhHJtwOxIgs1kfjVl0JjqbihKnWWEQIT++e0MdRPe/XoouO JfYKJ6nMpQegEuFPwF5TcTBVrt5hlRLVHAicr3HQRjyXTnLe8akpvS0a6pZpZHqjcB9O6xrzYdg
 3m3/oTmNGNTw5nkngTp98TKb9GxdOfn3igJDSMDQzCPJ1PBeqaN0G9vTlmrFhvdZSa60CQlacRk MjUupCRxWxU8nzikc43ojIlLnP7rGv22x5SZmSvK6XNw0kuoA24xhhXX8ypf0w/9LxV50WYbV19 VkVxOJ/BzrDDz6+/M50YR33lwgftoFmGWJzC+CROFpk4S6lXV/JRisrVGxP06FbKoP6Kr4XlQWk
 uMPv9cWYZaT6bXPAjE8/OToAUx+FxT6wHalHZNXbnNsDlflYsJa1KN09sxJ0E0VtGjaPzUOO
X-Authority-Analysis: v=2.4 cv=LvCSymdc c=1 sm=1 tr=0 ts=683112a8 cx=c_pps a=Nk9nByta7IVv34Xs/Tv0zA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=xR56lInIT_wA:10 a=z6gsHLkEAAAA:8 a=sflO1frO-E0FEifRXdAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: jRrMznZaSxx8SdoThuTWsenXsoe4JqEQ
X-Proofpoint-GUID: jRrMznZaSxx8SdoThuTWsenXsoe4JqEQ
X-Sony-Outbound-GUID: jRrMznZaSxx8SdoThuTWsenXsoe4JqEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_07,2025-05-22_01,2025-03-28_01

Q29ycmVjdGlvbi4uLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJp
cmQsIFRpbSA8VGltLkJpcmRAc29ueS5jb20+DQo+IE9uZSBjb3VudGVyX2lkIGNvdWxkIGJlIDAg
LSBpbmRpY2F0aW5nIHRoYXQgdGhlIGNvdW50ZXIgaXMgdGltZSBpbiBtaWNyb3NlY29uZHMNCj4g
KGZvciBVLWJvb3QgYm9vdHN0YWdlIGRhdGEsIHdoZXJlIHRoZSB2YWx1ZXMgYXJlIGFscmVhZHkg
Y29udmVydGVkIHRvIG1pY3Jvc2Vjb25kcykuDQo+IEkgd291bGQgcHJlZmVyIGRvaW5nIHRoYXQg
Y291bnRlciBjb252ZXJzaW9uIGF0IGJvb3QtdGltZSwgd2hlbiB0aGUgY3ljbGUgY291bnRlcg0K
SSB3b3VsZCBwcmVmZXIgTk9UIGRvaW5nIHRoYXQgY291bnRlciBjb252ZXJzaW9uIGF0IGJvb3Qt
dGltZS4uLg0KDQo+IHZhbHVlcyBjYW4gKGFsbW9zdCkgYXMgZWFzaWx5IGJlIG5vcm1hbGl6ZWQg
dG8gbWljcm9zZWNvbmRzIGF0IHJlcG9ydCB0aW1lLg0KPiANCg==
