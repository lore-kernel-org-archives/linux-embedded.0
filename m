Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE61E1023
	for <linux-embedded@vger.kernel.org>; Tue,  3 Dec 2024 20:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733258008; cv=fail; b=prmrhG7+c2WbnVwggr1bafK4s8gDnBCFb680IP9YnU+KPk9vymej3j4z28xbNKwI+kvhaTLM8TcKc+C4sZIBcrRQO1rBRHhN4107yonS0vheTlXDG9kDvETgM7PghTnjPLMYtvx5SyxJevFVkVrdGFOU+8atB64DSTs5jz9uYGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733258008; c=relaxed/simple;
	bh=nSlsOWYR3B4gVDT4jM4NHpbY8nkmte6bTxOlieVj1us=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N+UnzVNyUAf+iTn/IhEEZfsNVzc1RJTDLbuHxTWEymKtJ0ubBidGJfO0GYfMEGMPJzw34Bvmwt+aBevpgAMt2UDrlLz/nHHsFNYLQybrQhn4dStW+SXWpF1wINZ72FO7akURfL9Boje0zISgLrYXLL97uIuPZxt8DNc9FCvwgwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=YNFgUGUm; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="YNFgUGUm"
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3KSc5a001087;
	Tue, 3 Dec 2024 20:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=nSlsOWY
	R3B4gVDT4jM4NHpbY8nkmte6bTxOlieVj1us=; b=YNFgUGUmiDPYi6mcizldLP+
	zHvFlxbyqMxqtzIh5xpKBumksvvEDyyoOK9fgHKkkoW0rO2+Zx3gbkyhy5BMZqGf
	/XeaKmpx+wteWoVAmya7qdBjoli0ZtYiJ8FQ43Ib3iM2b9eX0/a/kbOGZXxuQQ0a
	HakWJZBZ109madnmMUMZNIMl/2K6qERUV4T5UBNJ5ky+AeujxbqzwaD0/TAr2Rup
	PX+J3ERKCtGwDxm3K8dTw+RAk4vdzDdpEA4WWfYVw+vDhGdHe2knUommud6kGUJb
	xVDysHO0wkLZ1YO39CzHoLdVM0X0k9/mMze7Yb+37aWCWgT5bKKlqN9Xftfz+tQ=
	=
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 437uvh35jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Dec 2024 20:33:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbzQurJeurolgMy3bkPPTGk/2koR9YfBUyw4q8iQwgtuOhAaKTZ2beO/1tgVGFA0UA3+J2LvyEJfrPKDGO6nXzDmsiMofyb+fZufC8R7/wRz1b1784bQMQphkpE7zPXwSwH6hX5bZf6mqzZkT3zyApSi9xRUWINcsf9h96feKzIQRnfFaPwaAB2c7IuKqM5FyyS8DdM8IJxWtnIuiHQeyC8xrKR3lkl2bjzJiiFKz5gLFq9/BOcFadFwVEL/JzWCMAeVHP+pxCnA3hFWJWzXDmRAzb3CCDe1uHQtaC0+dH7+x94nBxx1VA/TRp4teh5kQqi6K5aecaCzNd8qbsICsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSlsOWYR3B4gVDT4jM4NHpbY8nkmte6bTxOlieVj1us=;
 b=jgMFIf+D+n0+sUYzSuLP5OfkSxAREW4uuVAGWQry3Y73MLa0NFwSnTfMMPHKWuqAfFoHb+NvtOY7SgaGwC7a+3w9hoXKU5itzcZYs0wYWv4eUmcTsEqQB8S0KmrlFirOoF2GXTtGQbDX7bmSys8qFjsuXm4bQj/hLtFRRYChjn3jXAoftAxwK0EAuLdbPXXzDXhWihh4AmZzMZnvvJ4v5JiiJRGQMesy4nY6TF5E09ZlONWi+mYwwgk56jsmMF0FuDQW2fgesohp23BtRUmXsBafnFePWpJmhBH++7CrzV8AES00o+ZfJ2oAOFa2JeIJF+zV5Vs6ndgXxDNraQIUjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by IA3PR13MB6840.namprd13.prod.outlook.com (2603:10b6:208:525::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 20:33:07 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%6]) with mapi id 15.20.8207.014; Tue, 3 Dec 2024
 20:33:06 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Francesco Valla <francesco@valla.it>,
        Linux Embedded
	<linux-embedded@vger.kernel.org>
Subject: RE: [boot-time] [RFC] analyze-initcall-debug.py - a tool to analyze
 the initcall debug output
Thread-Topic: [boot-time] [RFC] analyze-initcall-debug.py - a tool to analyze
 the initcall debug output
Thread-Index: AQHbQUB9VDD2MU55KEKzPJEHGSHhDrLU/GkQ
Date: Tue, 3 Dec 2024 20:33:06 +0000
Message-ID:
 <MW5PR13MB563207AD3DB4415E5A1678A6FD362@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <1964175.7Z3S40VBb9@fedora.fritz.box>
In-Reply-To: <1964175.7Z3S40VBb9@fedora.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|IA3PR13MB6840:EE_
x-ms-office365-filtering-correlation-id: 9e6f2576-3daa-4adc-5d5a-08dd13d9b1d2
x-proofpoint-id: d8690225-876f-412f-87c6-a7cb45557a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?azhueDdLcmZwN0Nrb3RPRUJQNkdFREM4YXd1cnFFRGdMaFd5VStodXhScGor?=
 =?utf-8?B?N1hCc2ZaK1FReEpreDFsM1JSd0xVb3dnc1E5Ym9QTTlHSTNuMmluejFrVTZM?=
 =?utf-8?B?clFEY25tL09wVEdnam1JTmQxbjBQeU1kQXVBQWlUV09iRlR3N3ppZXNpTkdM?=
 =?utf-8?B?bXRVZjhKRm9SU0JXbVprc3MyZUg0UjBTcVB5TVViNlFXdDRMeEZmTzhWTVk1?=
 =?utf-8?B?dTdZLzJkS1M1ZDR0RGFmZlQ2N2dMRWliTU5ZY2QxeE5jbDc0TUJSaHNBcVRP?=
 =?utf-8?B?TnhLYld6K0NBbk9wUjBNSjNpZU1FTHR0anBKVFNTaFpyTmdRelljS3hRdlp1?=
 =?utf-8?B?S2lhTWJmaHdPZyt1OXV4K0JGVDhzdVVTZTNRUjJMOWQ2MExLNmxXRU93dWVY?=
 =?utf-8?B?a2tvVjd0TFNaMEo5NlFZZEw2VzRaZnpNTm5VMnNTeXVKKzh3UFlZR2FOUU1P?=
 =?utf-8?B?WmRVRGVQdEFZanRBcHpyS2JORjYvbk1OTmJZNmN2dWdXTEFZSmhQbG5GMHRR?=
 =?utf-8?B?V1g2N3pMWElqNUE1ZzFUd3hNRjI1dzJYYi91c1lBNFdzMmM2VjViRlhIREgx?=
 =?utf-8?B?eWVwVFp1YUEzay84eHBQZ1VMTndqVW5FZ21mU0hWbEhpOUNuWXlsZXZyeTlq?=
 =?utf-8?B?c05NWmtXbUlLMVUwWW5aMHNydjAvcEZIQ2Z6ZEkwTnpuUFNLd0UyMjMzM3dS?=
 =?utf-8?B?d3JHajdiZmRxaXM4SU5MZi9yNFBkd1ZRUlVQQ1FhM2gvMTY5TlRNdDVYZUpV?=
 =?utf-8?B?NE8xOW5VRll0dThyejlzcnRDdVB0VE83ZVhKOHBGZ0NNMlRucE5wR3AxaDBm?=
 =?utf-8?B?SXE0WUF3d1g2akp0NlllU3N0MkwyVHl1ZVB3R3B6c1VGT3VpT3g2eWFQVjcv?=
 =?utf-8?B?OTUwaWNZWGJQMFphZXltUXl6TzBSWGxlZmRKT2s2aTBjTUJTdDdDZE9neUM2?=
 =?utf-8?B?c2sxY3lQbGQwQ29nVGZOWm1xbUZtS25ZMDJuVFJkL1hKc1NMcEwzZC9MdVM2?=
 =?utf-8?B?bzM0RXpxOG5semR3V3krRm56WVlNS3FwdDBLT1AxeTF4UlgzQzdzVDRWbXN1?=
 =?utf-8?B?c0QvWUdIVHkxeTB4Y1czY3F0aThaSDNHYTJ6WktSWVE3OW5TMi9CTHFjUllw?=
 =?utf-8?B?cWw1T0Rtd0lZOUdveVF2c1ZlLzBkckUwa1J3QnZpTjZ6QUZxb2dkcW5VQ1Qz?=
 =?utf-8?B?bi9RbHFEMllXektPL3BuL3duUC9DbFVWSmxyekNEWkFyMkVpREZOTk83Rnlu?=
 =?utf-8?B?S0dVdUpVaTI3L1cxTWNNNnhjM3l1cG9Bblh5QmdUVGI3RTF5czFtbi9Ca0tz?=
 =?utf-8?B?cFFWaDl4Sytrb0N4a0hUSWVYN3VickV1MjZhTkNWdGhwMXc5OEsrNXplcWdQ?=
 =?utf-8?B?M0ZZRklhc1RudWhmKy9sbEM1Ty9UMU5PbjB0QVlzT2hPL05LNnNZdFU3QS9r?=
 =?utf-8?B?dm5McEpQVjdCUVV2RzhZSnc0M0t6eUxUOE83UzNyRlhLbE8vNWIzb2pNU2VU?=
 =?utf-8?B?b2tXdUlabW9FV05wNDc1cEtPTjBCNjg1R0FDQXpNSW9PamZxaGJtSU81WTRt?=
 =?utf-8?B?M2J6MmNpK2lrc3ZJT3VVQnBtSEhKYm1Db0RGWFFqdmJGUm1QUHlCYnlWK3E4?=
 =?utf-8?B?TmlWN2hEVHJxeFRDdEFaQUUrajJJQzlCVlhIemVyMURzYjhPYWlJZ0ZiRXM1?=
 =?utf-8?B?cWpJb3JRWFA1dkl6dW02Tm5FOXg5VjRoV05VMUxla0RnNFRlL2xWYWw5KzVi?=
 =?utf-8?B?NVNkRS9wK3RYengrS1krVEg1UjQwQWdnL0xCdFpZeFY5VFVROWJ4bndQR2Vx?=
 =?utf-8?B?ZTBzUCtLZDN3Sy9PWmZtdWR1TkwwUnJndlBUaC91RzBKOXFhTDJLbzBJdjZM?=
 =?utf-8?B?a2dBbE4vNWhtQnBCVGtxUXNPY2lBc3lUNWN6WXEvNU1IRHc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGZseFpNOHFPblZwNDVPaTNzbkNkaSt6dzZaTkNWd21OMTVKMHNSdEl1bkZh?=
 =?utf-8?B?QnVncmRySVV5dW54QXdmeDB0V0NFd1R5MHNkbUpSeFNMYWNvTFNKTC90NTAx?=
 =?utf-8?B?NGlBc2FkQU9pRWx1cEc0MGhuQmZ6VXFibkJLb1hjakJNQ3d1ZkZPc3NiM3hr?=
 =?utf-8?B?bVVoUFlvOU5HS2ZyMGozTW1WL3duOTBpdnp6TTRUQmN4bjZjK00xQXJtclZX?=
 =?utf-8?B?QTd3R0I3SkUzeTRqb05Hb0p0WEkvbXQ1L1FjNTR3WEZpUXZzN2N3Lzh5enNV?=
 =?utf-8?B?OGRaQ3VFZGljTmtVWkZ6T2tSdnNMQkNGWVBIK3RVWkRxdUdtbW8yTWJ4NGF5?=
 =?utf-8?B?NUhUMFB1Z1E5WTlaNmlKWU15RFBnekM4a3BXUXFwZmwwdk1jMGFqbVFTbmpz?=
 =?utf-8?B?N1JwNjd0TllwSnVjTmxRMXlndUZRRy9BZURkSHlwNW5Kak5PQnpNcllGbCth?=
 =?utf-8?B?M2tKM2ZNVkFMWUdUZ04va2VZcjBFOURldThaVjV6d0Q1N1QzTGx0d2FkWEN1?=
 =?utf-8?B?bVFYL3h3aVRscFBicUh4cmY0MTgvWU1lQm9QYzdlWmlidFhWdHZQYmo1QmE2?=
 =?utf-8?B?UllyWC9iYi9XbHRtM1BxV3kxZGIzNmMxaWp3akNsemphQzNqQ1ZpcC9lY1lt?=
 =?utf-8?B?TDl3SzY1cHBYZUw4cGM3S3VBVnl2V3dvd3pMdEhFSzBjNDhQQmJKR0hJeFlQ?=
 =?utf-8?B?aUZ2Z3pveXY1ekMxb3RIR2FyeDBWb1NxOFMvNUw4VEVONkk1K3FVSkx0eUdS?=
 =?utf-8?B?NVJRRmlIeUZXUEd5NnVPL3lyYkxRU1d1MTlKTHZLREV3czhHZ0VhTnN1cWJm?=
 =?utf-8?B?bXg0U0JNazFaYnpESStDS3Z2RUFqUHkzNzRmam95OXFSaXJjeHk3dEdiRVAy?=
 =?utf-8?B?Vzg5cFh5WXlkcnExaytIdzdqa2JHQ0I3N0lSNWFsTnhRSzNEOStseDdzSkVI?=
 =?utf-8?B?eWNYT0tKQU40NFRkRmQ5MnFLUlR6SkFlditpeTkxZjVpd0NYNkl2a0NkS0tC?=
 =?utf-8?B?MUhOSHhYb0xkYkJLbXVheFlVZG1ic1J0cXAvTXZzblhveGhuelFnd21qTG9j?=
 =?utf-8?B?UnZrQ1RBeEkyeHJKVk9JRkFCVWwrS0JQaVE3THhrSzFqNllTaFlGS05IeExH?=
 =?utf-8?B?ZVBRY1ZyWmpBVkRiWEF2em00SmFjVTVpK3NiQkcwYVRCaEFScGZyZ0svNkJy?=
 =?utf-8?B?bXhmZFIrN3lQcSttOWFJc09KYnZVWGQ1czNZVVZtZEluc2hXQ2cxaVR1WHMw?=
 =?utf-8?B?VkJrSG5MZ2hrWGcyZnYvZ3JkQmtBWFNGdXB1dHNEWnhLdXprWFN6b1F3L3Vj?=
 =?utf-8?B?WXFyYm1WN0lYN1hCMmVHNGtFQVBqYTZpeGsyc1VpMDhGOVBXclp3b2E2Q2d4?=
 =?utf-8?B?cTQ0RU1hVWFldC80MTN6UmVONTF6MGNmMDRoRVo1ZjJRdEJ3WE16eC82TW5V?=
 =?utf-8?B?bmxzTWNQdjNVR1J4N1luSkQyWmMwbUhHUmIyWGNYczFDSnM2Z0tqdG1EZDY1?=
 =?utf-8?B?dmkwMW5IT0Z4c29kdjBPaXFaOWxvTWo3ODd6M0ozN1V3dHkxRFFHejdDaG53?=
 =?utf-8?B?dU4wWGJYTVRMaVViSnNza25iTUs2WWZJdFBRS0wwNUU0V3ZVVVN1aW93aUlq?=
 =?utf-8?B?QVJyVVg5b05DT0h6clNJakw2anFVTUtTcUJSendIUE5QbHkrcTNWS2kyKzh5?=
 =?utf-8?B?K2h1Z2hmZkFFcU9RMWdwN29rb0l6UVdkejh5MlFUMmxaaitRdjhMdXE0RkZI?=
 =?utf-8?B?dWhKVWN3WXRDamQyYXRKVnppSGc2eUV6aXNvL09mZFRhT0JFRUc0aHA4S3RX?=
 =?utf-8?B?VXQvemhZUUtHSE5Nc2VPcEw1Wk8xTjBPazFYUUpVTEI5djB0MDQvU2o2eGdF?=
 =?utf-8?B?Qk5HZTJKNUZBdWdJNUdtejA4YkhDaXF1ZEJMbnhDR1JCSzF6bjBsOWJkTGRE?=
 =?utf-8?B?SUZTcW9jTUpNWmlWVWJSV0djVERnZjVVeUxTRStDa2tmOG1TK0szazNVNzNl?=
 =?utf-8?B?eXRrQ3o2T21WZElEcXhna3JYMEt2b3hXY2I4UzY0c3VpUjhadCt1KzBjcWdR?=
 =?utf-8?B?ajIrZ050VzRpWjRLU3RsMUI3bnJHTGFZeVgvT0FVeksrNUUrVzRpczBKZ2xS?=
 =?utf-8?Q?Ezeo=3D?=
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
	IhLX668Oz8wC/8zxXbKigi1Gx+NS6sZLyapp3VdR0Muh4Zor1nVZEuxmCL2CSdOIs08Ytr6AoFCAcDFPbZJbdDuJSaMeUg17RBv4GYzBi8FNoLtG/V01VCJwmzIELgJHu0KZ/o5IR0Qsd+kpkwi30RS8KwJ6KQVjJJ36QvRn2onyZYWhAPIKwZ1kKq9jiHOfYPcBCTjTdzyQzh0TCsaDFRgrA6mRU60sj7czPnWFsWPok2LgmtouJmEX36SCB5PmWMebsmn6mkWoZEAhLtPe0/fsrQqZ+F8BAQTZ8suuzZ475CbDfc0CfgrAJh0x3Fm68G8ozLWGdBfkZzPnXURM0zQKIDz0U+670JRz8JWBmHTr1EV4/QHBnIAdqSq73+unggAQGfQaoCYRkG7SaabypTKBGsYXrMFXhOQ+Crc7JiIGn38tuN54KicZPDhUVba9XiOZ76pYFeX6oQ3tdjs9ruI9zQu4O4ZlQ1pUaKeOLNQuPiOgZ1bXbB1MtpkVYrkVUMuHmdgfArRa0GtFSyihWbA3P/AiTQxbXNGWmQ2IAm54lX9lgWnd0/vetEeXhfPotdoznyGKk921M8rzweI9EtdxxLusStfnNsRqWeeE8NJ16sjs/G0VkAxZtCfZQQgb
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6f2576-3daa-4adc-5d5a-08dd13d9b1d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 20:33:06.8112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NbX69cdTNcqvcpdF4xg4asySK8tjgKHH9jVC3WdHos024faiPvLufi3/pTfthqIrCau2rzQstVPB0TEO1+rXCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR13MB6840
X-Proofpoint-ORIG-GUID: tWpJGrbaK9EF-tbDOEYr-jnzLifcEMOa
X-Proofpoint-GUID: tWpJGrbaK9EF-tbDOEYr-jnzLifcEMOa
X-Sony-Outbound-GUID: tWpJGrbaK9EF-tbDOEYr-jnzLifcEMOa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-03_08,2024-12-03_03,2024-11-22_01

SGV5IEZyYW5jZXNjbywNCg0KSSBhcHByZWNpYXRlIHRoZSBuZXcgdG9vbCwgYW5kIGhhdmUgc29t
ZSBmZWVkYmFjayBiZWxvdy4NCg0KSSdsbCBzZXBhcmF0ZSBteSByZXNwb25zZSBhbmQgaWRlYXMg
aW50byAyIGNhdGVnb3JpZXM6DQogLSBpc3N1ZXMgcmFpc2VkIGZyb20geW91ciBzYW1wbGUgcmVw
b3J0DQogLSBmZWVkYmFjayBvbiB0aGUgdG9vbCBpdHNlbGYNCg0KYW5kIHNlbmQgdGhlbSBhcyBz
ZXBhcmF0ZSBlbWFpbHMuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
RnJhbmNlc2NvIFZhbGxhIDxmcmFuY2VzY29AdmFsbGEuaXQ+DQo+IERlYXIgZmVsbG93IGJvb3Qg
dGltZSBvcHRpbWl6ZXJzLA0KPiANCj4gZm9sbG93aW5nIHRoZSBmaXJzdCBib290IHRpbWUgU0lH
IG1lZXRpbmcsIHdoaWNoIEkgbHVya2VkIHdpdGggbXVjaCBwbGVhc3VyZQ0KPiAoYnV0IGRpZG4n
dCBwYXJ0aWNpcGF0ZSB0bywgYXMgSSB3YXMgYSBiaXQgaW4gYXdlIGFtb25nIHN1Y2ggYXV0aG9y
aXRpZXMpLCBJJ2QNCj4gbGlrZSB0byBpbnRyb2R1Y2UgbXlzZWxmIHdpdGggY29kZSByYXRoZXIg
dGhhbiBhIHByZXNlbnRhdGlvbiBvciByZXN1bWUuDQo+IA0KPiBIZXJlIGlzIGEgcHl0aG9uIHNj
cmlwdCB3aGljaCBjYW4gYW5hbHl6ZSBhIGRtZXNnIG91dHB1dCB3aXRoIGluaXRjYWxsX2RlYnVn
DQo+IG9wdGlvbiBlbmFibGVkIGFuZCBleHRyYWN0IHNvbWUgdXNlZnVsIGluZm9ybWF0aW9uLiBJ
dCBjYW4gZm9yIGV4YW1wbGUgYmUgdXNlZA0KPiB0byBhbmFseXplIHRoZSBvdXRwdXQgb2YgdGhl
IGdyYWItYm9vdC1kYXRhLnNoIHRvb2wgdGhhdCBUaW0gcHJlc2VudGVkIG9uIHRoaXMNCj4gbGlz
dCBbMV0ganVzdCBhIGZldyBkYXlzIGFnby4NCj4gDQo+IFVzYWdlIGlzIHZlcnkgc2ltcGxlLCBh
cyB0aGUgb3V0cHV0IG9mIGRtZXNnIGNhbiBiZSBwaXBlZCBkaXJlY3RseSB0byBpdDoNCj4gDQo+
ICAgICBkbWVzZyB8IGFuYWx5emUtaW5pdGNhbGwtZGVidWcucHkNCj4gDQo+IElmIG5vIG9wdGlv
biBpcyBzcGVjaWZpZWQsIGl0IG91dHB1dHMgYSBicmllZiBzdW1tYXJ5LCBsaWtlIHRoZSBmb2xs
b3dpbmcgb25lDQo+IChvYnRhaW5lZCBvbiBteSBCZWFnbGVwbGF5KToNCj4gDQo+IDE3NTggZHJp
dmVycyBoYXMgYmVlbiBpbml0aWFsaXplZCwgb2Ygd2hpY2ggMTc1OCBiZWZvcmUgdXNlcnNwYWNl
DQo+IDExOSBwcm9iZXMgaGFwcGVuZWQgb3V0c2lkZSBvZiB0aGUgaW5pdCBvZiB0aGVpciBkcml2
ZXINCj4gMCBkZWZlcnJlZCBwcm9iZXMgcGVuZGluZw0KPiAtLS0NCj4gVG9wIDEwIGluaXQvcHJv
YmVzIGR1cmF0aW9uczoNCj4gICogMzAyMDAwMDAuZHNzIC0+IDUyMzAwMnVzDQoNClRoaXMgY2Fs
bCwgYW5kIGEgbG90IG9mIHRoZSBvdGhlcnMgYXJlIG1pc3NpbmcgZnVuY3Rpb24gbmFtZXMuICBE
aWQgeW91IGNvbXBpbGUgdGhlIGtlcm5lbCB3aXRoDQpDT05GSUdfS0FMTFNZTVM9eT8NCg0KSWYg
dGhhdCdzIHRoZSBjYXNlLCBpcyB0aGVyZSBhIHdheSB0byB1c2UgdGhlIFN5c3RlbS5tYXAgZmls
ZSBmb3IgdGhlIGtlcm5lbCAodXNlZCBvbg0KdGhlIG1hY2hpbmUgd2hlcmUgdGhlIGRtZXNnIHdh
cyBvYnRhaW5lZCBmcm9tKSB0byBtYXAgdGhlc2UgYWRkcmVzc2VzDQp0byB0aGVpciByZXNwZWN0
aXZlICBmdW5jdGlvbiBuYW1lcz8NCg0KPiAgKiBkZWZlcnJlZF9wcm9iZV9pbml0Y2FsbCAtPiA0
ODc0ODN1cw0KDQpJIGZlZWwgbGlrZSB0aGlzIGZ1bmN0aW9uIGlzIGludGVyZmVyaW5nIHdpdGgg
dGhlIGFiaWxpdHkgdG8gY29ycmVjdGx5IGFzc2lnbg0KYm9vdCB0aW1lIGRlbGF5cyB0byB0aGUg
Y29ycmVjdCBpbml0Y2FsbC4NCg0KSSB3b3VsZCByZWFsbHkgbGlrZSB0byBzZWUgc29tZW9uZSB0
YWNrbGUgdGhpcyBpc3N1ZSwgYnkgc3R1ZHlpbmcgdGhlIGRlZmVycmVkX3Byb2JlX2luaXRjYWxs
DQpmdW5jdGlvbiwgdG8gc2VlIGlmIHRoZXJlJ3MgYSB3YXkgdG8gaW5zdHJ1bWVudCBpdCBzbyB0
aGF0IHRoZSBjb3N0IG9mIGVhY2gNCnByb2JlIGNhbiBiZSByZXBvcnRlZCBhbmQgdGhlbiBhc3Nv
Y2lhdGVkIHdpdGggY29ycmVzcG9uZGluZyBpbml0Y2FsbCwgd2hlbiBpbml0Y2FsbF9kZWJ1Zw0K
aXMgdXNlZC4NCg0KRG9lcyBhbnlvbmUgd2FudCB0byBsb29rIGludG8gdGhpcyBpc3N1ZT8NCg0K
SXQgZmFsbHMgdW5kZXIgdGhlIGNhdGVnb3J5IG9mIGltcHJvdmluZyBpbnN0cnVtZW50YXRpb24g
YW5kIHJlZHVjaW5nIGJsaW5kIHNwb3RzIGR1cmluZw0KYm9vdC4NCg0KDQo+ICAqIGZkMDAwMDAu
Z3B1IC0+IDE2Mjg1OXVzDQo+ICAqIDgwMDBmMDAubWRpbyAtPiAxNDI1MjF1cw0KPiAgKiA0NDA0
MzAwMC5zeXN0ZW0tY29udHJvbGxlciAtPiA3MTM5MHVzDQo+ICAqIDItMDA0YyAtPiA3MTE3OHVz
DQo+ICAqIDQwOTAwMDAwLmNyeXB0byAtPiA1OTM1MHVzDQo+ICAqIDgwMDAwMDAuZXRoZXJuZXQg
LT4gNTg0MTl1cw0KPiAgKiA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9s
bGVyIC0+IDU2NTk5dXMNCj4gICogamVudF9tb2RfaW5pdCAtPiA1MjE0MHVzDQoNCj4gDQo+IEEg
bW9yZSBjb21wbGV0ZSBvdXRwdXQsIHJlcG9ydGluZyBhbGwgZHVyYXRpb25zIGFzIHdlbGwgYXMg
c3RhdHVzZXMsIGltcGFjdCBvZg0KPiBwcm9iZSBkZWZlcnJhbCBhbmQgc28gb24sIGNhbiBiZSBw
cm9kdWNlZCBlaXRoZXIgaW4gSFRNTCBvciBNYXJrZG93biBmb3JtYXQsDQo+IHVzaW5nIHJlc3Bl
Y3RpdmVseSB0aGUgLS1odG1sIG9yIC0tbWFya2Rvd24gcGFyYW1ldGVycy4NCg0KVGhpcyBzZWVt
cyBxdWl0ZSB1c2VmdWwsIGFzIHRoaXMgd2lsbCBhbGxvdyBtZSB0byBhZGQgdGhpcyBvdXRwdXQg
dG8gbXkgYm9vdC10aW1lDQp3aWtpIHF1aXRlIGVhc2lseS4NCg0KPiANCj4gTm90ZTogaXQgaGFz
bid0ICh5ZXQ/KSBiZWVuIHVzZWQgaW4gYSAicHJvZHVjdGlvbiIgZW52aXJvbm1lbnQsIGFzIEkg
bmV2ZXINCj4gZm91bmQgdGhlIG1vdGl2YXRpb24gdG8gd3JpdGUgYSBzY3JpcHQgYW5kIGFsd2F5
cyBhbmFseXplZCBtYW51YWxseSB0aGUNCj4gaW5pdGNhbGxfZGVidWcgb3V0cHV0Lg0KPiANCj4g
SWYgeW91IGhhdmUgdGltZSB0byB0YWtlIGEgbG9vaywgcGxlYXNlIHRlbGwgbWUgd2hhdCB5b3Ug
dGhpbmsgYW5kIHdoYXQNCj4gY2FuIGJlIGFkZGVkLg0KDQpJJ2xsIGdpdmUgZmVlZGJhY2sgb24g
dGhlIHRvb2wgaXRzZWxmIGluIGEgc2VwYXJhdGUgbWVzc2FnZS4NCiAtLSBUaW0NCg0KPiANCj4g
WzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LQ0KPiBlbWJlZGRlZC9NVzVQUjEzTUI1
NjMyRjU0RENCREEwQzc0MzcwRTUzMUZGRDVDMkBNVzVQUjEzTUI1NjMyLm5hbXByZDEzLnByb2Qu
b3V0bG9vay5jb20vDQo+IA0K
