Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667302DB7B0
	for <linux-embedded@vger.kernel.org>; Wed, 21 Jan 2026 23:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769037640; cv=fail; b=a9p3aifm+qhRDI12zZ3mWF4jCL+UWi4dWK0ZODuIoN9url35Y3sX1uZ7+Evkvo9s3x8WVmWSQb+TBb7gxlxn6GS8S3LYWISmCvyBljdPJTntPcM2bah2VoD8SJbfdtKmbgNRh3LM3oqlL4CLpsJi1akgEuyfHD50CtxliF94vRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769037640; c=relaxed/simple;
	bh=TkPWT9X1N6hN5yuSiIRi1oZ1Falx07bWPlVyHrK6R7w=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FtZehKAd/AdfJ+mnGhY+e+AbRtYGRh5tn32rGCyFBPGjkgku7PhO7zwmg7z2GJ8u1ccolBgl7yeNY+TGyZrGurP76hOCuz70eMQkgI5PENt6/CP4PNixgSwwEnV0R1NOlC+jPlcljtBOKVEf4TBBkvJT0XA/f9XdrUkZFnufHds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=i9+fizDA; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="i9+fizDA"
Received: from pps.filterd (m0209325.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60LKjFU3025888
	for <linux-embedded@vger.kernel.org>; Wed, 21 Jan 2026 23:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=TkPWT9X1N6hN5yuSiIRi1oZ1Falx0
	7bWPlVyHrK6R7w=; b=i9+fizDARowuqIZZ0ZoZSA9307c4PGrOHyNYPyQXO3SbW
	JdP1oGIvdsNbganA5hQL/luN5VDfkbNnPSl+UhJTRdGlb5PxRHIgmpwp4SdlWNet
	H/rSZBQ9w2fexOgbNOUGrorWhnU5lOK/evZmAubaTGTz55IQvIor32ZigqY0W43Y
	h62AWxPNK+03i0WJ208P2NXTWfL3l2RjrkI1vuuUOxqp4vqR/d3EEGon9yqp5io5
	9mkTnl7AsLPdgAJ+xEngQVvC8DiQprLqL3S8/kX2XFWK7XJP6jZlJkqTJG4vpS5f
	xzSmXILKVIW1mm3c73X51ypFWqXdmOb0ACRwjtTgQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012046.outbound.protection.outlook.com [52.101.53.46])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4bqynvx5tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Wed, 21 Jan 2026 23:20:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXqLVJq70h4WbWMSej3vDqpkHvtwoF8gV5+6ezD4t/NkEcDYMpU1X/rajaZ6FoAAbwGhh7T73R0PYWg8e4MDidUITseYX2b2Rl7L1Sw7IBM7imoN4mjrWutdrgzX+HayI2t8p1QWHIB4JXcL8HCWr4OkeXuObmUEDMu1vfDby3nJg4rEIrvbaqOlOvEcPc9FpI4riPRGhKrSLZdj32K4XVu1YFgfJ8E016hFYJdQP6rEcb+ucad2i5wzGISv3bwlL5Zyp75+2Z8g1iTnloa3eHzvVe/IC/wGFbxyn7ElHeubNxaxML1exbozqCjDCr5kV9KpnKwN4kh/CVyyDkrbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkPWT9X1N6hN5yuSiIRi1oZ1Falx07bWPlVyHrK6R7w=;
 b=eMHFgRNx2g4Fl5/g1El+b3n6POSgwd2WRu8uaW5Mtsh44iQckPtpZTSw9NRCUJWoU10unWXc8Ud3ssr8ABTqUKufeWs3PGYwWykuL+6L0jQtYX7WokuXFuCmpH4ZZoXf8CFbKkmDxG8+DtkWTH3FdKg46W7vkMUNEPyHuQ+IoLuxAba0MFUaAkisAY4NlQ4lEhYpeODkHse9KzRO2gCZ16PrwQjmlXJnMF4LvYdwJWKfeGfkmJq4prXRwzKpzN8LatWPDk+kvdcxeKgrcFX4QcZVKB2RmnyooPuZClMo/RKLjezqaxku/3EFoPjhCAG0GtXiQzTODkliKulF44vFdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by LV5PR13MB7570.namprd13.prod.outlook.com (2603:10b6:408:35d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 23:20:26 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 23:20:25 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: Reminder of Boot-Time SIG meeting (Jan 27)
Thread-Topic: Reminder of Boot-Time SIG meeting (Jan 27)
Thread-Index: AdyLLHNPe2u2R4oyQIefS2wpRZZOSw==
Date: Wed, 21 Jan 2026 23:20:25 +0000
Message-ID:
 <MW5PR13MB56323DD0CEF5ED5BE5CACABBFD96A@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|LV5PR13MB7570:EE_
x-ms-office365-filtering-correlation-id: d0e62aa0-d942-4066-02d9-08de5943a876
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?V0xqWDNFVTBnWnZ2ZWxGSllnVmRoVmE3L3NSZUc4ZXNmQTZQNWM2U3VObTZk?=
 =?utf-8?B?Q3J6WkpocjAvZXZLOHNqaWxKY1BXS1ZuMjR0S0NtUzNiNE5pVWcrQW80aTEw?=
 =?utf-8?B?bU5TdW4rcURIT0R5K1dMekdtZ0RETHFQTnZkV0krdHF6Q2tNeEo5WHovU0tt?=
 =?utf-8?B?KzBHV1hXY29jMFByZGZhcWFxVks2RmNGUC9TMWxuZnhLdms0WWV4ODZHNkw4?=
 =?utf-8?B?dExuMFY0VUFocjAycm96d2VYdVlkRVlHamVQSkJjUHJTQkRCeWE1emJMNDFI?=
 =?utf-8?B?Z0dmUUI1cDdMV0diT1A1YXZ6bERhdHA0ZjBpNmVXVDVUUVd1ajMvc0pTZTI4?=
 =?utf-8?B?dXRhb1lleWRNR1VVOWdNNzRKdk0ydkliKzU2M0dCNDBkSHE3RXhTUkllaVp0?=
 =?utf-8?B?TTFQNlhqUWd4Y2RSa0MrWXVRL1lDREs2YjFNdEg5eFhyRlZjUTlIV0orc0h5?=
 =?utf-8?B?N3UvOWRXZDJmNDVGbHNWVWdVbjZkWS9zYVVTSjlSblJnUUZDeGNNa1JzS01p?=
 =?utf-8?B?bW5Cak9ZYVFKTUNHN3htZEVDUFppS21SR2xURTBDSXk3c1lhandMV21jSVhz?=
 =?utf-8?B?NW9NdVBvZ2NtdmJHVzhqWk0vdWVzZFl6K0dxUE50OWRIR3F2aFNBRURIc3Fp?=
 =?utf-8?B?UFlMV09pTENGdzlXcU1Kb1RmcFJUdC92cmhLNGoxVzhWRzRkY1Mra1BKRTJ2?=
 =?utf-8?B?ajFydnFaQThqdTE2NWd3Sm14QlBvZUxvTlFXWndQRzRQVmdSYStFMG44R2h5?=
 =?utf-8?B?NVlHd0ROVi9ieldzazFnVU9sY0Y5YUdoU21kdnVqc0Roem9Ydmd0STJZckFm?=
 =?utf-8?B?TEQ2L1FTd1dhSTJIcStiaDB1WGxGS3dpUDE0azMwaXpUS1kxbERoTmh4M1Ft?=
 =?utf-8?B?YUNxS284dlBsZC9jU3R0bjV4RXZDSld1U1M2QnNZeHFnZGtuVG1tM2NEeXJk?=
 =?utf-8?B?dVFjVTM0Y2YvSUNkKzB0S3ZaUjVqMjI4S24yNzY1bHl1S3Q0ZVpNQklEdERM?=
 =?utf-8?B?Yzk2emdsNHY3VHhTcTdHUW9SVzQzZ29rZ1hRbUV0ZUtvalZvMWlNT0hMUTNM?=
 =?utf-8?B?UlgxbG1aa0VydW1hZWlyNUMrQ2lPRlFrUlJVdUhwVS9PTXdtU0ZkYllWRWJw?=
 =?utf-8?B?OFRyd1h2MWtidmYrNmx3VVhHRXBTL1JXOVNROG55OFg2TXFtcmZGdFVQQkZa?=
 =?utf-8?B?K2I0blRZdkg1cWtLTE5iRzZodU9JWnc2Tmtpa21OdUJBbU92UEorNDZldlV6?=
 =?utf-8?B?dnlpMW83ZnlaaGJ6QklCWUlpSmJ0aCtEbjZCSUtEb2x6VEI4NWU4QVFoMkN1?=
 =?utf-8?B?THJJVVdhaHk1dkFNa2lMaXpkVmprMHJkaHhqZzlzVW13TzdmR1lhT2c1b3JU?=
 =?utf-8?B?T2JtYnd3cWlLMjdlVGtXQlAxK001TXgzSE0xN0xXdWRpVEdtdXJHcG1iR1E0?=
 =?utf-8?B?Z2g1NEsrZm5pNCtVR2lxQVVPeVJYQzFESnNVbktiSVZ6WTQxNVNSeFYrZTkx?=
 =?utf-8?B?VEZ6emdjdmZ4ZDJnUE9pTndRcll3N0NCeERuV3pzbUF0ekxlQXRJakdVdzFk?=
 =?utf-8?B?Y2lQdzExaUpDMUxCT2x1anp2K21JbDFiejR4U2I2L3lQRGRrTXA2U1Z1L3p1?=
 =?utf-8?B?VHJVT1FxRU4rcGZaNnFSRFA4bEtDY0RmeTREb1Zpc3BWVjZid2ZkbGZOMkF2?=
 =?utf-8?B?NHJFQ2xmK2VjaEp0blByTkNiMkNVSFRkS1BXWHpVMUhLbGNIN2JLS0pkVVJW?=
 =?utf-8?B?aTNpNndQTVhMWHRqV1Q3SHpVZnRxejVjSmNEbTVnekI5dEtlQW5hek9vRUo5?=
 =?utf-8?B?TUdVWXBuUWwzQXFobFZ1alE1RnJ1eE1zbm9vT1Z1Umw5R2ZOUEsvcStzdGsx?=
 =?utf-8?B?SlhLa2Q5anVmTkZXM1BiaWRYWlBZZUpKdGdMY3h4SlYzVTJSampQOGxYeDlH?=
 =?utf-8?B?WG1EU1FmOTFDczZUd0FZbExmTVRQUDd6Y24rUVE2S0hKMVJXejJJUFVkWTM5?=
 =?utf-8?B?YWdXMDlOVWN3ZUVqYzhFR1p6WHhzcjRpNk8yL1VtMk1MaTZkdEtyM09vUWFK?=
 =?utf-8?B?MUdtYnc4NjFGOGloMDRLV29hbEo5Qnl1ODByQVZFVW50RW1JZmtxamdLaEg0?=
 =?utf-8?Q?xevHcdGEVkLGtaFbVqzE07K+t?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bmtNZjc4VUlZdkNvZGdYbEYzT1poelQ5L2lBejVHTnlvRzNBeUJwd2xuWmR5?=
 =?utf-8?B?cWRvQTEwR1dsby9EaUQvQ1krZHI2Unc1TEdNNmpGTzlZN1oyUGxKMnNTelFB?=
 =?utf-8?B?WWJwdFcrYkpuU2lXbTM3WnFNeDJ6bTErbWZIcDlPSEgxcUw3ZVphZjJwM3o2?=
 =?utf-8?B?VVVxMW5nbEpmSzBTUU5jUVU2eEt6LzlhVVo4Z2wyQjVFNXRhcHVwRmJLYUhJ?=
 =?utf-8?B?Wld3cE5rU040TEZrUlRmeGxsck9LTWFjcEkwdUZvOW1mQW5TekgydmhtM2hF?=
 =?utf-8?B?S1FMMWFYS29SckJIRTY5ZThTN3A0Y25BV2ZRR0w4RW1Kd0k4SU8vUWVZS3R5?=
 =?utf-8?B?bjZnVzQ3N3NPVzlhNllOSCtXcTd6emd2VWxpbHQ4ZCtUaUFrendIcUJUUnZF?=
 =?utf-8?B?UVVVb2RjQjFGVUFrSkhaczBsR1UvMmJUYllWUXp3QzczMFVMdjkxK2dpREdG?=
 =?utf-8?B?RjVaU01iTHdGdG5ndHJXOGc0K1hqWFpMVWhzbWIvUmZlTXdaWHRCT0w3bHIw?=
 =?utf-8?B?T3ZmNmtOOUVRWk9RcXN0N3NTWDdITldteUdSTDBVaUMraDhvT2Y4bUpIMGpL?=
 =?utf-8?B?NTFaUzVlUDJiRXZOZGY1eDJBNlBKZExvK1F5ZDVrTndKVGlLNENkVlJyQ3Q1?=
 =?utf-8?B?MFJob2w4NzdEMVloQk1LVDRCVzlXbmpXUklhS0p5Z3NYQjlGdTJpdEdGS3lU?=
 =?utf-8?B?ejVkaE9wRVJKaVRhN1J3NWlkWThqeHpiUU4zSXBKZTgvRThZRkFrYnlPalp5?=
 =?utf-8?B?K0J0RHgwMUNwbkdnanJ6MTdTdWhBT3J5eGphMUxqWndOV2RobDlLV2RNb000?=
 =?utf-8?B?RVBLa3U0ZE5tSW5tM0pJVjIrMG5RTFJyeG9TczJJTmd4Y0dqekhkcmV2d0RI?=
 =?utf-8?B?cXUrbE9DL0RYN2N3dGRveElFaytjTHVBK0VldDZkNklNeUNtRUhZTHd6OVlu?=
 =?utf-8?B?VTh1S3pSVFJIUHlYZjdUVG1hYWVQUk9hV2E3eFNBdUduY2M4US9HZ1ZTTmJ0?=
 =?utf-8?B?L3JWY3c0WDh5d2V3V3JiN1hVc09ZQkdERUxvQU14MkxZcWovNTU5OUNyVVV2?=
 =?utf-8?B?ZU1YZnNBeDFwYWt0Ri81QXZTUUpRdWhnRTJrYmlrZ1B3TFcvK05rTUg1cWVo?=
 =?utf-8?B?WXRFL3JVenZLMWhBbVF5UkRVdzl3QXk1MUpya3VZVGtGSmkyRnpBdkM4KzZN?=
 =?utf-8?B?TGhYWHVlYWFKdzAvck8zbDB2UDRNRS9KNkdWaEtLMmsxall4Tk9TcDdHeGlp?=
 =?utf-8?B?OUp6N09sVlhBcU5YWmFVNk5NcUNpSWhjTmZkQjZMWVVxLzlyM1FBVDZ5cStU?=
 =?utf-8?B?bEN2dDNScThIMXlSNG5qZllueFJpdzEwODlJTEpOclVPbkFDT29aQzJEaDRv?=
 =?utf-8?B?TXlLV0NmV0xnRHY5Tm11N3g2dlc0aUM4K1NhY1pKcnNKenhObUt1Z2lmY09n?=
 =?utf-8?B?K2gyQ1E5ak93ZWF1d0paVFZXUEkramxUaFJlWE53ZU1iVHRBT2taZTNHVG9j?=
 =?utf-8?B?Y2ozMFdTOE5LNWN4WkN3YnJ1YlYwNlFPWXlLYTZYVWtGRE1EUk5iaVN0cWEw?=
 =?utf-8?B?dHFyVjVDZFIrNmFQTXo0ek4rZGJCMFJncVZZTWxCUmtRYkkxVjhGaDBUcFJ2?=
 =?utf-8?B?Qi9vZGNaT1JCQ3FWeXBwYXVPVGY5SzRncGpWK3krWlc2TmpzS2NNUFpXWUhP?=
 =?utf-8?B?bkFDc3AxbHlrNXBQL1RUSTdXQTVOamdXblZFQ1dNeSs0bWo3TGdTNGo3NlhU?=
 =?utf-8?B?MUdaTHlXTlNrMFp6cjBxeUZSS0RrcEZTSy9OcVEvUHl6VllFb0xueE01K1Q0?=
 =?utf-8?B?VDU2aFlqdTFzZW02cnR3SmlpUVdLMjluUko0NGp5eis0RUNQOG1CZmhFVW8z?=
 =?utf-8?B?RlNJWmpTbjF5bFRsV1BZa2tXbG43VVVWRDNWS0dxMGh1dnhyWkpxWG4rMWZa?=
 =?utf-8?B?M3JtTlIyTXBVeXlCdEI5dDZVdm90RjJ4bEo1RGdtWkRSVXVmc2lWemZ5cGJt?=
 =?utf-8?B?ZDhDOGZScTdCM1FaNlR6bllXOFRRalRsM01KdW1ncitVZlNJS3VReVNLdTMy?=
 =?utf-8?B?T0EySWg2bWt4TWxJQlhIUTVvQWhzYWwxckdzUFBHbGk1Y1NhcWdWLy9sWFo4?=
 =?utf-8?B?OEV4MndZUkoreWxxSlROeDFmV3hYWlg3OWx2OUUxT2hXOHpDUlhRMDVSQXZv?=
 =?utf-8?B?d1VROWc1YWxFQUNiVDVycEtqYXlNakRSQXhPUTBJVXJkNzNiWWdrRnlvWnp4?=
 =?utf-8?B?eTlsemZKbGhVRTcvOTlDWHFqYm1OWDF0eHBRMGZIODVKZFc0WDVFQ0dUWnNH?=
 =?utf-8?Q?UM4s9XoLBtKEQz/bml?=
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
	doKu1ZtP6CE5PzjY2E05wZNmxf7ds3DsYezIqfKGFz2MNtcz0IapQdf9tUqUaqT12XFnTiXvGvtK07evKjBCboeX295aR7CVtU7b3RtsarwsYYV857vsHl6YyRVsswslrPoplYKn2bHrKvp0VR4v0GzJbmFUvTGVujrbhuRkMOAaDJINitpsC8Ierl0QVIBKIsml24Q1eo1aOsgbnwGBIvmBBHhnXAbU7Nhycni41j3YeayfHBakXN6LrGYRCWvkQTaDFKt9idOs7YMIzJRXZXhD3j9Nn90jgYFpRZFD7d8mUZMo9TaFr4PFS9n0XTwQDrlrcofgGArScj4Gbe9/LnRG9GnZsr/LeSHyM4vRocWz/4D6YQgI2nPqwhkDEmTvbCeXjhQHAeIpe4on9+KlNbDuIgqvRyj7e1ozlzW333HDQvl6ewfzPlnGYzFKWi/zWQbnU1NdFuSF+hEsn4tBzChNecUXAJV6v5I8MR4MSxB5JG6GJI1tc6i2sMeABRGjfTcrITMrAK7hn+Ajzmus4J2LlwmA/mkLJjnkTk6lNKcG/xqaZv2gEIolC37Bq/K7IXJi5djcVC4DwvqTDd9dKrZSRUB4IawOpZvQGC56yIIJvSwbSokLpDW63whG3oyF
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e62aa0-d942-4066-02d9-08de5943a876
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 23:20:25.6463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9pCTp5+3OV/t4RMLlDprozlGP4G7oIZMMEhD4kOmF1nHIMUuzEzlKefPTyXzPYaGaJZYKTr7ji/3O54R289hXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR13MB7570
X-Proofpoint-GUID: E13FF9QvxRav-HckXpS2Yr67_3aEc1_S
X-Proofpoint-ORIG-GUID: E13FF9QvxRav-HckXpS2Yr67_3aEc1_S
X-Authority-Analysis: v=2.4 cv=eekwvrEH c=1 sm=1 tr=0 ts=69715f3e cx=c_pps a=H8Bh8Ha9hE1t7kEFpXBZew==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=nXA5WNwiAAAA:8 a=NiL0GWOVAAAA:8 a=2iSxh-PlAAAA:20 a=5k6F5TuV7mzRscbmDlsA:9 a=QEXdDO2ut3YA:10 a=-wH59cBETLoA:10 a=U_XVwcaHIQkA:10 a=fGr-7aqQv4RST94IA8XU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE5NSBTYWx0ZWRfXzRGe7SCsO1XG SxCdH/qjIqEo7/ne4Azjvs/RjmthQMHG3wXteTuKWqGyWZVVeJXJCyXiRdQyHIs4CX0wT6hvyC/ P2788jfK2HPfaZVCx/D+mHHBzWLk+muQ4568ZQWmdAi4YsGpb85sBNVmWsXhXFAiasuAga+Lbmj
 fox1xosx2KDLqyeKap83QvF7UyOcqlPsnuWC7iAkAH4tuhRVu8DlmbzBQ6/lkC4eWL3I/vPONAF x+7WaQNWzQhXfgVII5sK1zEdknYs31wkq5eeVUswtNLvLFcY9g3nVZywNkLR6K60/16oaoHktSB YHSWjjMvA0ImhzBOnngU9h0Yr5KklQIr5Yz07IslEvDQyL3iefrghFD2G8/OE0UA/v73D5V25aE
 K52dusKlCjeXcvLkHH+76aqr8FYbtl2SCtFd4f1Yji/CX3bQKe+Nf5UsS4nEBR3zrkroqUjzbc9 AKeRNLxu2q/wwsV0hdA==
X-Sony-Outbound-GUID: E13FF9QvxRav-HckXpS2Yr67_3aEc1_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01

SGV5IExpbnV4IEJvb3QtVGltZSBTSUcgaW50ZXJlc3RlZCBwYXJ0aWVzIChhbmQgb3RoZXIgaW50
ZXJlc3RlZCBMaW51eCBrZXJuZWwgZGV2ZWxvcGVycyksDQoNCkhlcmUgaXMgdGhlIGluZm9ybWF0
aW9uIGZvciB0aGUgbmV4dCBMaW51eCBCb290LVRpbWUgU0lHIGNvbmZlcmVuY2UgY2FsbC4NCg0K
VGhlIG1lZXRpbmcgd2lsbCBiZSBoZWxkIHZpYSB0aGUgSml0c2kgb25saW5lIG1lZXRpbmcgcGxh
dGZvcm0uDQpUbyBKb2luIHRoZSBtZWV0aW5nIHZpYSB3ZWIsIGNsaWNrIG9uOg0KaHR0cHM6Ly9t
ZWV0LmppdC5zaS9MaW51eEJvb3RUaW1lU0lHDQoNCi0tLS0NCk91ciBuZXh0IG1lZXRpbmcgaXMg
VHVlc2RheSwgSmFudWFyeSAyNywgYXQgOTowMCBhbSBNb3VudGFpbiBTdGFuZGFyZCBUaW1lLg0K
U2VlIHRoaXMgbGluayBmb3Igb3RoZXIgdGltZSB6b25lczoNCmh0dHBzOi8vd3d3LnRpbWVhbmRk
YXRlLmNvbS93b3JsZGNsb2NrL21lZXRpbmdkZXRhaWxzLmh0bWw/eWVhcj0yMDI2Jm1vbnRoPTAx
JmRheT0yNyZob3VyPTE2Jm1pbj0wJnNlYz0wJnAxPTIyMCZwMj0xMzcmcDM9MTk1JnA0PTc3MQ0K
KFRoYXQgbWFrZXMgaXQgODowMCBhbSBQYWNpZmljLCAxNTowMCBVVEMsIDE2OjAwIENFVCwgYW5k
IDIwOjMwIElTVCkNCg0KSSdtIHBsYW5uaW5nIG9uIDEgaG91ciBmb3IgdGhpcyBtZWV0aW5nLg0K
DQpUaGUgYWdlbmRhIGZvciB0aGUgbWVldGluZyAoYW5kIHdoZXJlIHdlJ2xsIGtlZXAgdGhlIG1p
bnV0ZXMpIGlzIGhlcmU6DQpodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVudC9kLzFYQXVm
b1RUNlZWSk9UTXpLTW96OFN5T3NzLUpBOUg0SjFfeVZYUXE1bU4wL2VkaXQ/dXNwPXNoYXJpbmcN
Cg0KVGhlIGFnZW5kYSBmb3IgdGhlIEphbnVhcnkgMjcgbWVldGluZyB3aWxsIGJlIGF2YWlsYWJs
ZSBpbiB0aGUgYWJvdmUgZG9jdW1lbnQgYmVmb3JlIHRoZSBjYWxsLg0KSGVyZSBhcmUgYSBmZXcg
aGlnaGxpZ2h0czoNCiAtIHJldmlldyBvZiBtYXRlcmlhbCBwcmVzZW50ZWQgYXQgTGludXggUGx1
bWJlcnMgQ29uZmVyZW5jZQ0KIC0gb25nb2luZyB3b3JrIGluIHByb2dyZXNzIChVQkwsIGJvb3Qg
Y2FjaGUsIHByaW50ayAwLXRpbWVzdGFtcHMgZml4LCBldGMuKQ0KIC0gaW5mb3JtYXRpb24gb24g
dGhlIGVsaW51eCB3aWtpDQogLSB1cGNvbWluZyBjb25mZXJlbmNlcyBhbmQgY29sbGFib3JhdGlv
biBvcHBvcnR1bml0aWVzDQoNCklmIHlvdSBoYXZlIGl0ZW1zIHlvdSdkIGxpa2UgdG8gYWRkIHRv
IHRoZSBhZ2VuZGEsIHBsZWFzZSBsZXQgbWUga25vdy4NCihQbGVhc2UgZS1tYWlsIG1lIGFuZC9v
ciBwdXQgdGhlbSBpbiB0aGUgZG9jdW1lbnQuKQ0KDQpJIGxvb2sgZm9yd2FyZCB0byB0YWxraW5n
IHRvIHlvdSB0aGVuLg0KDQpUaGFua3MsDQogLS0gVGltDQo=
