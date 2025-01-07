Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C573596C
	for <linux-embedded@vger.kernel.org>; Tue,  7 Jan 2025 21:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285698; cv=fail; b=Bt7a7kQR5ZU0vY309WKSWfro+097D3RTSul82ZPe0WN4oXHjOI5G0StR+AvJEwAU2BAKlnzcl/nG5+8uoJNkGM5Fq3CR2CFJKq5Nc7zQ1/LvJG/C8CV0NPRlhN+Ooi3gKhk2OhBYzyxtPjMQLKfekozsqC4lvVW8mvZO6SF+N74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285698; c=relaxed/simple;
	bh=SQlIvqr4oXX5WQscXOcsPsxANwvMtTOWCmOZw7PCoHw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pBYOMNkQ7KMDoTvkZ1L5+MqVL+cAxNYXAP4pBmeLVzdsH0klV6Nq+f32loTYUJcRFFwTCla8KXo1m79uu4oJ6/uem6ksN7r8cuVjnqYGJTBxdEaTCpcNV0zI9S9KqRgao4Lh/wEtVCWiAeDwOBvLSO2oE0R8/DRLNwkvfkiYP0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=QTen9uAv; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="QTen9uAv"
Received: from pps.filterd (m0209325.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507KofE0003574;
	Tue, 7 Jan 2025 21:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=SQlIvqr
	4oXX5WQscXOcsPsxANwvMtTOWCmOZw7PCoHw=; b=QTen9uAvv1RPWSv2jBd6ZUh
	ATBdZb1FL1z2gVqzscu38Y0Ij6NHEbcic7h2fCRklb9t49aHmF8pWVGTQWzVBQH3
	e+X+yXjCb2eUPI45jQ0yi5JaC45lk/uLgaywpHm12+VvxoQ3+8AXlUcWMdT93hNp
	RSRmCn1Evo9c4TogN95iSCoz82cFJOuD4WFWzO9h63G7Xc0YkvM8Agqi0Zz/YHas
	K6Aj9DOTDqcIHlOZSnSKM/BpjIrBJwgemMAfVhNuRAnViIWtMSznDc8llwrGIGAj
	Zl7mFPcvxtgAtw7RP1Lqbx+sfPL3wktfPbVF4fr08ubh9WVDRzCy5Gc1/NetVOg=
	=
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 43xt7w34ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Jan 2025 21:27:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jo1nRFHqPHwT0a5QSgGrakxDQWbNBLnrEsX/0BEWezuhXwLmTEsIrzhUAcMZgR0PZ1HEM06e6WwTGSKo54BAkTNj/0CeJwAiK/IfU/x5fRB0mGF4Qv+eSJazogAPPr6D/il90l6v+olMzI9YOLe9f5n6ndhPpCtTgoS9X9GfMe1O91Aultn8ZOo/7kzIBEEcaXjk9F6MgyRsS1ilqMjdZ/1teqjMFSYv+l/k2aA8d26HHlSEWSd5b6epbuu8zBvqMY+a4CVSL0dD7dlRhDUp9UjR/3CXPSBa2xsRVaPmkFTk7lXs5+cakxuyMgNsg8deDIfE35Ig3gno0I/Oc+mF5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQlIvqr4oXX5WQscXOcsPsxANwvMtTOWCmOZw7PCoHw=;
 b=ERNbZxOxXCAqN1XGwv8dq1KQ+oXNP3XqVDrQZh7zzH+dTUqKUelYy5irAD13hF2/bq1pSYK5recbLVDEMlpAaGEcdtkbIRZqowRscz4NExzu0mpLwlaEBwsBy5rejjo9HK5LB4zhXou8PQmL4b9hqIDIUQp4t3+inWTJpWUuU2gPyKRDS8jgwq44m3NWlHMfS+qtwkEk3jsEOifdz09LI3O0Fz78Kriz/C7XHoN+n9VbDcSwNMQI4UJvWRvjyMP1gZNc5fNhuAezmK4UF3n4OyCPdDLH4Tv8mN1M4gcGRxS6vxSw7eHz+TrrO/AEWYL+OgV+d2+Z/44KDyUR6ice0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by CH3PR13MB6994.namprd13.prod.outlook.com (2603:10b6:610:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 21:27:06 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 21:27:06 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Francesco Valla <francesco@valla.it>,
        Linux Embedded
	<linux-embedded@vger.kernel.org>
CC: "smueller@chronox.de" <smueller@chronox.de>
Subject: RE: [boot-time] jent_mod_init on beagleplay (was RE: [boot-time]
 [RFC] analyze-initcall-debug.py - a tool to analyze the initcall debug output
Thread-Topic: [boot-time] jent_mod_init on beagleplay (was RE: [boot-time]
 [RFC] analyze-initcall-debug.py - a tool to analyze the initcall debug output
Thread-Index: AQHbQUB9VDD2MU55KEKzPJEHGSHhDrLVEPXggCp/J4CADIJzMA==
Date: Tue, 7 Jan 2025 21:27:06 +0000
Message-ID:
 <MW5PR13MB5632C013FD212706BAF4A30EFD112@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <1964175.7Z3S40VBb9@fedora.fritz.box>
 <MW5PR13MB5632D5A1AE2D16F53FA2391FFD362@MW5PR13MB5632.namprd13.prod.outlook.com>
 <27104545.1r3eYUQgxm@fedora.fritz.box>
In-Reply-To: <27104545.1r3eYUQgxm@fedora.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|CH3PR13MB6994:EE_
x-ms-office365-filtering-correlation-id: eaddadfa-86d3-4803-f982-08dd2f6208fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L1hNS0VkSmhnYVhhMWI4ZHJjdEk2MGIxb3pybjNXUy9TMFF6RjkxNHFUVzJQ?=
 =?utf-8?B?MTN4U3B4bGZ0S0U1MEEwVmNJNTEzbkZXY29wd01MbXZzbXE5UElZYktOTEw2?=
 =?utf-8?B?b3hPTEY0SkRuMTd4b25na09qTXpZSXlzMlU0ZXArMHd2SmZ5RG5zcWdGanRr?=
 =?utf-8?B?L0RPZGNOOFVUSlM4aGkvc2NacFRWNGdpcW43bkprOGNuTTM5TU5Ibi9QVUJH?=
 =?utf-8?B?TzhkWFMyQk9IM0RlbW1CaEQyLzNRYkNQNWd3aEhTek9CS3krY0F5ZWRLVzZo?=
 =?utf-8?B?ODhxYVR0QnhaUlNWRlBTMFFrc0toM29pK1BFalJCQzBLbWR0SnZLbnByaUcw?=
 =?utf-8?B?SFpCM3g1cXN0WTZ2LzhZcElPUHlQalg2Qm1YQkxvYUZyanJDL2s0S1RpOVk0?=
 =?utf-8?B?Vzc1MkFzcWluRHdTdFBQWDRVU0FleDBpSEdwWEluQUZiSThON3RaNDhHSWZP?=
 =?utf-8?B?VDMzdEJGb0RXbDJGamh4VWpXV012Z2ZQVWZVdFBZMm45NWd4ejM4bHpUOFhl?=
 =?utf-8?B?Q3JZRHFCdHRzN2lrRGVKMGYyTUNReVhlT2pGWE04TUJKVmF6RTd2VTlqdWlN?=
 =?utf-8?B?OS9NUmh5M2cveWpMalFCUDhiMk9rQ1gxaTd1YUZGMHBWRU5uYkFRZHUzRVdu?=
 =?utf-8?B?dUpDQmYrTWdOWWhQVjZvSUpsWlBFNkJkdWNicHNuLzk1L0c1QzFjYThod2dK?=
 =?utf-8?B?a0M2azljV0hWN2F1Qi82UkRmTnRwR2szYWdDMmlFVUlhcVBYY0hyNktMTXhY?=
 =?utf-8?B?T1RLc2Z2SWwvMFNwOWdNYjZmQ0gyb2FRSkhnQXgxVmNKTE1mdk53UW5nbEcv?=
 =?utf-8?B?T0xtYVcxUzlMUWZjUlVycEhhYWtGUDlKWThlSlphdnZPanpEeHdXcVh6U3hK?=
 =?utf-8?B?Ukozc2ZUYzdVejJlM0M2bzBBSytGbkxpSXZua1RZd2VoSXJjT1M2TW9qWE1W?=
 =?utf-8?B?MVFKZzVaT0tQVEMyZEYwcldnU3pKNXA1MjA5T0xSKzBxanlPZE40Q1IwRmxk?=
 =?utf-8?B?N1BBYUxCcXR1NjlwTkMrSVpBb3plVjFpKzNsMlhVM2dkeDliOEYycmQ2T2d1?=
 =?utf-8?B?MDlTeVhhNXlJVVZQUHdna2VsQVRHOUZ6dmhhYTliWHdWNnlUZldjdGVpaDJF?=
 =?utf-8?B?ajdHazc1eVN6dEV6STl3V0VOVnFWWVNBRVJGMUFqVXk5YmdGZmxWQUFsa1li?=
 =?utf-8?B?NjB3VmIvTmxjaUJ6MzY2TUJ1d1lUWmtneDQ2U3Z4cXFnQUM0eDRTZkVwaHdw?=
 =?utf-8?B?Q0tPQWxQN1R5d3M4OGFseGlIT3hKMm9zc1ovTXhIVkVFK1F5YWFLczdGa3hY?=
 =?utf-8?B?cFdlS0IwR21tcWxKaUJzVHFaci8rVkZJdjl2WXFKQjdyaGU5UEsrMUg3SWFy?=
 =?utf-8?B?TEY3a0llODRpM0FxR3ppRWZlem9BaUVZbEF3OXRJSmlvR2JQek1GTng3ZjNR?=
 =?utf-8?B?R09tR1lJdHdmZmVCRDVQZ1dXczVmTlBmUlp5MXUzTGNVbGxsY0N2TW92a01G?=
 =?utf-8?B?aE13dXpEdG5WeXZQS0FqNnpsTnA4Rm02cE9iUGVMVUI2Y1V4cnlweitJY0JL?=
 =?utf-8?B?K1NxREl3ckpUQ0cydFFoQnZyU1BHV1ltcnV0VzNxKzR0NFRWZm1lbjc3OTlv?=
 =?utf-8?B?akpDYXNKdWxQcTRMZ093TFhLMzBSRFY1dTF6THF2RTdUUytIdVg3ME1wUGpk?=
 =?utf-8?B?Qyt0S0JhUWpmeFFtVm8zWnNDVnJQK09USis4bVVvZ2M0ZFMxeWNiUlcyWm5H?=
 =?utf-8?B?RzNWUFZWR0NXRDN3emhMMUlCWFM1MWdBNVQrL2ZNOFl5SGM3cC9qVFZhSko0?=
 =?utf-8?B?cDA1M0lDS2dQQ2JsVUc0elZTeFZTek5iVzVxekQ4dnhsZGhQMGRnamR2SVll?=
 =?utf-8?Q?V1hT5eykP0YyJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RytjMlQrU0dGNzlBUkI3OFUxY01TdGI5YTB6VjFURTloNEVmdzJrM1ZQMk5X?=
 =?utf-8?B?bGpRcFpJRjJpQ2Rua1JKV2dmL2xZREJOWDY4QWk5YjhNeEdLRFdwdlEwWnMx?=
 =?utf-8?B?SGt3Q3d2YTcvbUhkUGlBWWdSR1h2c2dkRTNuemlrQXAyckNjb0tIclBFRHFs?=
 =?utf-8?B?UTNNem5FRjlYdTY4SGxWSmUxS2pVYlRWbDF6TlozUS9QYUpUdEh6R0JSa0ZK?=
 =?utf-8?B?RG1XT2pTNHM0YUh2TlN1d1JpMUp4K2pnWThrb3FQZnZmNWYyem13cHdFdU02?=
 =?utf-8?B?RSt0MnVrckx5UUliNU1UNys1am5xR3J1MEVISElia2g5VGNFUWgrWlYyOGUr?=
 =?utf-8?B?MDNBdUpQM0UwdW5zdEZaeGlCdWJnajZGTGM2QkR4clU1Ym5HaFV3d25vL0gz?=
 =?utf-8?B?RlR5S3pIajNyOGRYcWJ4NU5Dd0dOMzc2SktRZ2pXSmRoOEJrSWZTMWVBb3pZ?=
 =?utf-8?B?a3EyT0J4cmpQODQvQzRKMTlkUjF4UWVWUHdwcjdwUUFhNGtlYmlFcytnbjk4?=
 =?utf-8?B?QjF2bmpNSXlmcFZDRGlWZGFNY1ptQUxmNGhzNGZjcUY2SCs3YkhvdzJBT2Zj?=
 =?utf-8?B?eHF6aURPOUVYNktVM05rYmtzR3h6V3YrNGd2TnBWVzI5cVJqS1lPMFpBWUdx?=
 =?utf-8?B?V2pQMDJacHVwQVFkUTZrU0FTVjJTUDRxWlNsbzJSRHhuekw5R1BtQXo3Vmxk?=
 =?utf-8?B?b1ZMUmxDSkRMUzBud2ZxNFNoeXN0cUhjQ0FDQkNodUVWQWt3L2xYMVRoWTcx?=
 =?utf-8?B?WjV6a3BhZ1pOUDBCUjhCMDdGVWk1Sk5GZVJjN1lsKzBKZDljaTNyK0taK0pw?=
 =?utf-8?B?NzFoYVNqcGdwcUVrU1p0d05RWDY1Mm4xS2ROaGJLVkhwa0NIbllOUkJRdnNw?=
 =?utf-8?B?WGc1RktFUTZvUlZ0L1FKVlhCN2JMS3JoRmVmc1RFbWI1YmlVVzFabTU2S01E?=
 =?utf-8?B?bVRWNnJTL2JlRGczRkl4a2RXekt1bWZQN3hQUHlobExnYnptNlovYWp4cmVW?=
 =?utf-8?B?V0JoRWF3Z0hHOEx1WGhnbUhERWhVRk9WbkZ6QWtvMDZlTm0vQ3E5VTkzUGxL?=
 =?utf-8?B?UlpDQStJRmtST0lJYjZVT3crTnowZ3pIYWljMndBRGZjejZnTUhFYlVxcnd0?=
 =?utf-8?B?OUdoM1A4c3BSRTJwQXN3c3NsVG11R3M4eENrbFYxWG1VS0wvRTFnc1NaQnpO?=
 =?utf-8?B?OEp3OWJvUDNjQ2VBUU50ZTdXMFNYY3pvcDhTL3ZvZVl3TWJEZTNjYytEMks1?=
 =?utf-8?B?L0pjN0c2aDBmc01CM2U1Nnc5Y0NJUVhLUWFZaVRxLzRicHJRNVdPemtIYXpS?=
 =?utf-8?B?SjEzR0VjQ01vQmFtTzJ5MklyL29ZRnI1Q2ZNVmhBU1dVN3d6MTNLV0Z2emJE?=
 =?utf-8?B?RUN1SXJ6NlRBUWJpYzV2QlZrNDBkV0xKV0owVzNKdlltNWM0V1JqV0VsSmps?=
 =?utf-8?B?UWU1bkMwakxQRVh6WkI5dmVXWjJrOTduNENNN2I2VlY2eGlPaWxmM1VHMldJ?=
 =?utf-8?B?VDJJelZ6TGQzRFVNUllqdDZ0clhpQVRjNmNKVC9yd1lmanI1NXJBek5nejV0?=
 =?utf-8?B?ZFhydC9lME9DcUtlYi9LZ2JkQURYUENHOWlNdEVvc2tadFpUY0p2ZWU5ZXA2?=
 =?utf-8?B?Rk92ZW13RWYzVzYrS0dTQjd5MWhrMUhkRzFrSnhGcTlGeGlKK3lHWE5LTFZv?=
 =?utf-8?B?YzZDajZEdmZ4c05xQXZrOUx2T1RtaDZDTmxFRnA1K0FrVTZENzJ6Q1F2SjlE?=
 =?utf-8?B?QVMxYlFGUkNYaXFJbE15YkdoNFlDeXlXZ0F1VUc1QmZMd3BwL3NTNDZLeEgz?=
 =?utf-8?B?VDN0NXBOQklTSitpOTd2VzFKOHFUbmRIQU5TMiszZnAzVU5YUldNY3F4R0d3?=
 =?utf-8?B?aEM3blo2RWFacVJDcU5mVUxERzZrQnhNblBDTDVCZjV2cWFNbVUyTWQ5RHd1?=
 =?utf-8?B?OCtDYkxrVUhEQUl1ZVZnamcyNGJPRGVPNDdjR2paR2ZURzVkdEVtMU5ZVi9n?=
 =?utf-8?B?RjY2TFJUS1FEZWJkVGE4aExOdkEzcmRGWUlmWDFOUTFZbHRJdCtUSTExMTIr?=
 =?utf-8?B?bm1iMjZBK0xQbmN0cjQ4Rmw2aGVSY0JvV0ZMK3JRWFQ2cHVtRzBrU2lBVGl6?=
 =?utf-8?Q?C8+g=3D?=
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
	R4oFziJuWqAO8GcgH+9sWdzwKLvbkpfGyc8yhqVIJdYdC/VO87IPHD0LHVOIqtQGPmwfRiOh3xMBfuICyt51VkhYCzwfAaFuX0WukopWvk87lK2DURDsTTXlbb0BQpJpyWQel/QmDN5UFc+CyVha+gtcQ5m0Y76Hj90GGzWACp6b0TodGyp7XLteYotmrQn1C4+kYfbylBZHN+e6qShsQe/KkWGlm1jYh9FvsJetb+IehvbyeVhTiYdkdHCrHW4jEApMTQ4k2tL5wnmZvLDaKgt8+J3y1glqGfy1Fgs4Z5vdx2k4iVpmkUY4W01PAKXqU4xM923y8TBM/jAhLL06xmtaOYIWMJBizSSQUvjoV7/vUYQrsUEX3Fbr1ui+TZ1oF6zD6nAMp19NEgWGyT8TGsVwDnqtbUwSgdz+gok5c8ZMdti1EKM1h7PJxOm7a2GtWJt7oeMRgBFxgnE9A27ZWkfbDpj+/H824ZIMvm81SDI8phur4dknL4ybpRwS+MMs+GXmKr3syJZ1mC1pCmLxtazwHnawxqzBV+1C+wNytZnl5bDyg/y5Q/pYNSScg70MruZZ+5u/YjHx9L/KXPJ3w58XXVYab/liwyYh0/pV8apPwRUf2LkwQyiFs090qbl9
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaddadfa-86d3-4803-f982-08dd2f6208fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 21:27:06.0436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ePTmVQtE1srJ6OgjdeRTxKH6s8cmHZGnqamGmHcV+kdad0wxtHqrUeN7K8m48rewMxLKRMi1SvFltN3GKLCvEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR13MB6994
X-Proofpoint-ORIG-GUID: JiujCmdUHP3xkzbsTasmMPqcGUp6fm3B
X-Proofpoint-GUID: JiujCmdUHP3xkzbsTasmMPqcGUp6fm3B
X-Sony-Outbound-GUID: JiujCmdUHP3xkzbsTasmMPqcGUp6fm3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_05,2025-01-06_02,2024-11-22_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRnJhbmNlc2NvIFZhbGxh
IDxmcmFuY2VzY29AdmFsbGEuaXQ+DQo+IA0KPiBPbiBUdWVzZGF5LCAzIERlY2VtYmVyIDIwMjQg
YXQgMjI64oCKMjQ64oCKMjggQmlyZCwgVGltIDxUaW0u4oCKQmlyZEDigIpzb255LuKAimNvbT4g
d3JvdGU6ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLSA+ID4gRnJvbTogRnJhbmNlc2Nv
DQo+IFZhbGxhIDxmcmFuY2VzY29A4oCKdmFsbGEu4oCKaXQ+DQoNCj4gT24gVHVlc2RheSwgMyBE
ZWNlbWJlciAyMDI0IGF0IDIyOjI0OjI4IEJpcmQsIFRpbSA8VGltLkJpcmRAc29ueS5jb20+IHdy
b3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEZyYW5j
ZXNjbyBWYWxsYSA8ZnJhbmNlc2NvQHZhbGxhLml0Pg0KPiA+ID4gRGVhciBmZWxsb3cgYm9vdCB0
aW1lIG9wdGltaXplcnMsDQo+ID4gPg0KLi4uDQo+ID4gPiBIZXJlIGlzIGEgcHl0aG9uIHNjcmlw
dCB3aGljaCBjYW4gYW5hbHl6ZSBhIGRtZXNnIG91dHB1dCB3aXRoIGluaXRjYWxsX2RlYnVnDQo+
ID4gPiBvcHRpb24gZW5hYmxlZCBhbmQgZXh0cmFjdCBzb21lIHVzZWZ1bCBpbmZvcm1hdGlvbi4g
SXQgY2FuIGZvciBleGFtcGxlIGJlIHVzZWQNCj4gPiA+IHRvIGFuYWx5emUgdGhlIG91dHB1dCBv
ZiB0aGUgZ3JhYi1ib290LWRhdGEuc2ggdG9vbCB0aGF0IFRpbSBwcmVzZW50ZWQgb24gdGhpcw0K
PiA+ID4gbGlzdCBbMV0ganVzdCBhIGZldyBkYXlzIGFnby4NCj4gPiA+DQo+ID4gPiBVc2FnZSBp
cyB2ZXJ5IHNpbXBsZSwgYXMgdGhlIG91dHB1dCBvZiBkbWVzZyBjYW4gYmUgcGlwZWQgZGlyZWN0
bHkgdG8gaXQ6DQo+ID4gPg0KPiA+ID4gICAgIGRtZXNnIHwgYW5hbHl6ZS1pbml0Y2FsbC1kZWJ1
Zy5weQ0KPiA+ID4NCj4gPiA+IElmIG5vIG9wdGlvbiBpcyBzcGVjaWZpZWQsIGl0IG91dHB1dHMg
YSBicmllZiBzdW1tYXJ5LCBsaWtlIHRoZSBmb2xsb3dpbmcgb25lDQo+ID4gPiAob2J0YWluZWQg
b24gbXkgQmVhZ2xlcGxheSk6DQo+ID4gPg0KPiA+ID4gMTc1OCBkcml2ZXJzIGhhcyBiZWVuIGlu
aXRpYWxpemVkLCBvZiB3aGljaCAxNzU4IGJlZm9yZSB1c2Vyc3BhY2UNCj4gPiA+IDExOSBwcm9i
ZXMgaGFwcGVuZWQgb3V0c2lkZSBvZiB0aGUgaW5pdCBvZiB0aGVpciBkcml2ZXINCj4gPiA+IDAg
ZGVmZXJyZWQgcHJvYmVzIHBlbmRpbmcNCj4gPiA+IC0tLQ0KPiA+ID4gVG9wIDEwIGluaXQvcHJv
YmVzIGR1cmF0aW9uczoNCj4gPiA+ICAqIDMwMjAwMDAwLmRzcyAtPiA1MjMwMDJ1cw0KPiA+ID4g
ICogZGVmZXJyZWRfcHJvYmVfaW5pdGNhbGwgLT4gNDg3NDgzdXMNCj4gPiA+ICAqIGZkMDAwMDAu
Z3B1IC0+IDE2Mjg1OXVzDQo+ID4gPiAgKiA4MDAwZjAwLm1kaW8gLT4gMTQyNTIxdXMNCj4gPiA+
ICAqIDQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyIC0+IDcxMzkwdXMNCj4gPiA+ICAqIDItMDA0
YyAtPiA3MTE3OHVzDQo+ID4gPiAgKiA0MDkwMDAwMC5jcnlwdG8gLT4gNTkzNTB1cw0KPiA+ID4g
ICogODAwMDAwMC5ldGhlcm5ldCAtPiA1ODQxOXVzDQo+ID4gPiAgKiA0NDA0MzAwMC5zeXN0ZW0t
Y29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyIC0+IDU2NTk5dXMNCj4gPiA+ICAqIGplbnRfbW9k
X2luaXQgLT4gNTIxNDB1cw0KPiA+DQo+ID4gVGhpcyBpcyBvZGQuICBPbiBteSBiZWFnbGVwbGF5
IGJvYXJkLCBqZW50X21vZF9pbml0IG9ubHkgdG9vayAzMjMyNnVzLg0KPiA+IChzZWUgaHR0cHM6
Ly9iaXJkY2xvdWQub3JnL2Jvb3QtdGltZS1maWxlcy9ib290LWRhdGEtdGltc2xhYi1icDEtMjQx
MjAzLTEzNDEzNi50eHQpDQo+ID4NCj4gPiBJJ20gYXNzdW1pbmcgdGhhdCB3ZSBoYXZlIHNpbWls
YXIgaGFyZHdhcmUsIGJ1dCBwb3NzaWJseSBkaWZmZXJlbnQgY29uZmlncywNCj4gPiBrZXJuZWwg
Y21kbGluZXMgb3Iga2VybmVsIHZlcnNpb25zLiAgSSdsbCB0YWtlIGEgbG9vayBhdCB0aGlzIGFu
ZCBzZWUgaWYgSSBjYW4NCj4gPiBmaWd1cmUgb3V0IHdoYXQgdGhlIGRpZmZlcmVuY2UgaXMgYmV0
d2VlbiBvdXIgc3lzdGVtcywgdGhhdCBjYXVzZXMgdGhlDQo+ID4gZGlmZmVyZW5jZSBpbiB0aGUg
ZHVyYXRpb24gZm9yIHRoaXMgZnVuY3Rpb24uDQo+ID4NCj4gPiBUaGlzIGluaXRjYWxsIChqZW50
X21vZF9pbml0KSBpcyBvbiBteSBsaXN0IG9mIGluaXRjYWxscyB0byByZXNlYXJjaCB0byBzZWUg
aWYgdGhleQ0KPiA+IGNhbiBiZSBpbXByb3ZlZCBvciBkZWZlcnJlZC4gIEkgaGF2ZW4ndCBzZWVu
IGFueSBkZWdyYWRhdGlvbiBpbiBzeXN0ZW0NCj4gPiBiZWhhdmlvciBieSBkZWZlcnJpbmcgdGhp
cyBpbml0Y2FsbCBvbiBteSBzeXN0ZW0sIGJ1dCB0aGF0IGNvdWxkIGJlIGZyb20NCj4gPiBsYWNr
IG9mIG15IHN5c3RlbSBkb2luZyBzb21lIHJlbGF0ZWQgb3BlcmF0aW9uIHRoYXQgbmVlZHMgdGhl
IFJORyBkYXRhLCBvciBteQ0KPiA+IG93biBpZ25vcmFuY2Ugb2YgdGhlIGVmZmVjdHMgb2YgdGhp
cyBjYWxsLg0KPiA+DQo+ID4gQ2FuIHNvbWVvbmUgY29tbWVudCBvbiB3aGF0IGl0ZW1zIG9yIG9w
ZXJhdGlvbnMgbWlnaHQgZGVwZW5kIG9uIGplbnRfbW9kX2luaXQNCj4gPiBpbiBlYXJseSBib290
PyAgSW4gcGFydGljdWxhciwgd291bGQgd2UgZXhwZWN0IGFueSBjcnlwdG9ncmFwaGljIHByb2Js
ZW1zIGlmDQo+ID4gdGhlIGluaXRjYWxsIHdhcyBkZWZlcnJlZCB0byBhIGZldyBzZWNvbmRzIGFm
dGVyIGJvb3Rpbmc/DQo+ID4NCj4gPiBJdCBjYW4gYmUgY29uZmlndXJlZCBhcyBhIG1vZHVsZSwg
d2hpY2ggbWFrZXMgbWUgdGhpbmsgdGhhdCBtYXliZSBsb2FkaW5nDQo+ID4gaXQgc29tZXRpbWUg
aW4gdmVyeSBsYXRlIGJvb3QgKG9yIGV2ZW4gbGF0ZXIpIGlzIE9LLg0KPiA+DQo+ID4gamVudF9t
b2RfaW5pdCBpcyBkZWZpbmVkIGluIGNyeXB0by9qaXR0ZXJlbnRyb3B5LWtjYXBpLmMsIGFuZCBj
b250cm9sbGVkIGJ5DQo+ID4gQ09ORklHX0NSWVBUT19KSVRURVJFTlRST1BZIChTZWUgY3J5cHRv
L0tjb25maWcpDQo+ID4NCj4gPiBJdCBhcHBlYXJzIHRvIGRvIHNvbWUgcmFuZG9tIG51bWJlciBn
ZW5lcmF0b3Igc2VlZGluZyBieSBtZWFzdXJpbmcNCj4gPiB0aGUgaml0dGVyIG9mIGEgY29tcHJl
c3Npb25nIG9wZXJhdGlvbiBpbiB0aGUga2VybmVsLiBJIGFzc3VtZSBzb21lIG9mIHRoZSBjcnlw
dG9ncmFwaHkNCj4gPiBjb25maWdzIGFmZmVjdCB0aGUgZHVyYXRpb24gb2YgdGhlIG9wZXJhdGlv
bnMuICBUaGUgaW5pdGNhbGwgZHVyYXRpb24gcmVzdWx0cyBvbg0KPiA+IG15IGJlYWdsZXBsYXkg
c2VlbSB0byBiZSByZWxhdGl2ZWx5IGNvbnNpc3RlbnQgKGluIHRoZSAzMm1zIHJhbmdlIGNvbnNp
c3RlbnRseSksDQo+ID4gYW5kIGZyb20gYm9ic19sYWIsIG9uIG1hY2hpbmUgc2FtMSwgdGhlIGR1
cmF0aW9uIHJhbmdlIGlzIGFsc28gY29uc2lzdGVudA0KPiA+IChhdCBiZXR3ZWVuIDQ4MDAgYW5k
IDUyMDAgdXNlY3MpLg0KPiA+DQo+ID4gSSdkIGJlIGludGVyZXN0ZWQgdG8gc2VlIGlmIHRoZSBy
YW5nZSBpcyBjb25zaXN0ZW50IGJldHdlZW4gcnVucyBvbiBvdGhlciBtYWNoaW5lcw0KPiA+DQo+
ID4gRnJhbmNlc2NvIC0gQ2FuIHlvdSBzdWJtaXQgYW5vdGhlciBib290LWRhdGEgZmlsZSAob3Ig
MiBvciAzKSBmb3IgZnJhbmNzZWNvc2xhYi1iZWFnbGVwbGF5LCB0bw0KPiA+IHByb3ZpZGUgc29t
ZSBkYXRhIG9uIHRoaXM/DQo+ID4NCj4gDQo+IEkgYWN0dWFsbHkgbG9zdCB0aGlzIHJlcXVlc3Qg
YW5kIG9ubHkgZm91bmQgaXQgdGhpcyBtb3JuaW5nIHdoZW4gcmV2aWV3aW5nIHBhc3QNCj4gZW1h
aWxzLiBNeSBhcG9sb2dpZXMuDQo+IA0KPiBBbnl3YXk6IEkganVzdCB1cGxvYWRlZCBhbm90aGVy
IGJvb3QtZGF0YSBmaWxlIChvZiBhIGtlcm5lbCB3aXRoIHNvbWUNCj4gb3B0aW1pemF0aW9ucyks
IGJ1dCBjYW4gY29uZmlybSB0aGF0IHRoZSB0aW1lIHNwZW50IGluc2lkZSBqZW50X21vZF9pbml0
IGFjcm9zcw0KPiBtdWx0aXBsZSBydW5zIGFwcGVhcnMgY29uc2lzdGVudCAtIG9yIHNob3VsZCBJ
IHNheSBmaXhlZD8gLSBhdCA1Mm1zLg0KDQpUaGFua3MuICBUaGlzIGlzIHZlcnkgdXNlZnVsLiAg
SSBhcHByZWNpYXRlIHlvdSBmb2xsb3dpbmcgdXAgb24gdGhpcy4NCiAtLSBUaW0NCg0K
