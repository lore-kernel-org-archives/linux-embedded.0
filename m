Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729F91B043A
	for <linux-embedded@vger.kernel.org>; Sat, 24 May 2025 00:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748045239; cv=fail; b=cUY4S0uTrr1izMleQoYGFHE8ncdI1c+vjqKcdq+Cz80zIR5dX+TyF6VXJuhdxBZlecD0ATrCJHLrsHZrF/heNSk5XjwKBfQ7wmYy5lrLDpCshT2FdXaI9gUfP/ZOqeKqhOzdwaxYeshLjFlfsU9u0PgoH80sQKB2wOtxiUE5SNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748045239; c=relaxed/simple;
	bh=tWdPYFAny8gs6NOvjYbZUSb/cYF0yN6OS0/oki/wv74=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hAjpF0D9s+ezhNDEzTzagGgI4ijt4F3BQ9dmWnr4qHKM1eFEg5QT131VCqW66Kvcn7Ztd+4VkFQM5BHf3XNgtnMSeqaOKOxRyHLsXgGgd7Mm+/EBrvOguQCr5bewaUOH7VrIKNqaubhz6/9XramXVn72AxbCsFGa7PoXRMytRUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=AMc93/Y9; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="AMc93/Y9"
Received: from pps.filterd (m0209319.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O05FhX027401;
	Sat, 24 May 2025 00:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=tWdPYFA
	ny8gs6NOvjYbZUSb/cYF0yN6OS0/oki/wv74=; b=AMc93/Y9rh/qDsllEZI6RzK
	TVlUOa6YyUr0KKWniLS9LZSjm5l/pdaUUCrB6nP2N3M/1XclSN30D8cO0o49hynC
	GfaQbzwKJkwXBqUqUOQNQgEMk80lkqMPTqFSD70y1ggGCOs1Z0zBlZumJHhzWkNj
	TpoIsYgeu58nEh+SWQFxtCMpvmyFVplGcdQy3w6iAWE1fSVqupAVeff4ZewnI1jh
	xJdqthjTsEmGdbkLuhD+P618uhciat0RM0i6ynMdv6KIxYClcxItfvbKxW1/xrSe
	7ndR1Axda+gCs2gHKNi5VqX89ctewOp1iHvxekY1eDykYd9OTjTAd8rGaoUj3NA=
	=
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 46rwh6b46u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 May 2025 00:07:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aio/2Rlg5jJLBY4/d8IwAiwiQyyPVdoQDHebJguXgAZ+ZIp5kf8tZXgVVWAjaOEHJ+gsk6N+3aszZQCnrjXLtgAEEiOokcsPdTDIOYu5bzxIYW+dU6CYvJ2gJRDpSYGLNvJ4gwanVfAakXg3k6WRLvBlSh+nPvI67r5P2x9bz6uDXpAAgHBm9TuwILRoFJU5zZ0Z0Qrhll7kFciPcsWDUM6k+o+3ZmcTVWv/4BVWHw7pYboxkifC+SUQT7e3YiMMnpfTkhsSPn/Lua+zdePpfC0zJOd+gBbhSpZhNqOPweW2Dgv6gzTzZig0wgYUjZow+rh4SOoGsDHuczYIeP0MSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWdPYFAny8gs6NOvjYbZUSb/cYF0yN6OS0/oki/wv74=;
 b=e9lQv/Yf9qs6dZCiqwHSjuT8iZOXNplfzUhb+7EpyGtNDzqHyfc3RTy42NtoEdHw1/3b2+bWnpa2kmbx6p53+lfS6JuYGgxxoDaC7fx+ytTcdk+EHnDj/ixXjR6RnGlPqOJ97yZZ+MxxminqPXgVgLmt1cAvymRnSpvIhIDja4R1ZRvLhQh5BHSdzysRt1ZNzMbRRAUc67Lixc/WXx3bGUMT0aYeji8kzzZNBFLzOJwDpLP7TqD9w8ikcYlSzOSmC7FIlpiZ6qvp8+kfBAcWDddXnnzmWHMVXkWeONMCWP2DkZrGIshOEurh6Zd5l96+3AnjJdAN3ysfSrwaBtF5rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by DS7PR13MB4685.namprd13.prod.outlook.com (2603:10b6:5:38f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Sat, 24 May
 2025 00:07:07 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%5]) with mapi id 15.20.8769.019; Sat, 24 May 2025
 00:07:07 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Federico Giovanardi <fede.dev@giovanardi.dev>,
        "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: RE: [RFC PATCH 0/1] Add driver for bootstage stash
Thread-Topic: [RFC PATCH 0/1] Add driver for bootstage stash
Thread-Index: AQHby3knPIcKqx4Q9kuTC9KB9U8LtrPf1McfgAEOqOA=
Date: Sat, 24 May 2025 00:07:07 +0000
Message-ID:
 <MW5PR13MB5632A2522BFAF3066DCC57CDFD9BA@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20250522224223.358881-2-francesco@valla.it>
 <PA4PR08MB604681FF6392B25A19926A11ED98A@PA4PR08MB6046.eurprd08.prod.outlook.com>
 <473a062e4f939bc58a5c0e636569b826@giovanardi.dev>
In-Reply-To: <473a062e4f939bc58a5c0e636569b826@giovanardi.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|DS7PR13MB4685:EE_
x-ms-office365-filtering-correlation-id: 02af5d25-c6d9-409b-515d-08dd9a56ec1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S2V0ckI1Q1lPVndxTlN4TURRcUhmWDBHa0YyRGtEZzNpZkErNEtEb3MvRk1F?=
 =?utf-8?B?c1N6bjg0bzQ5c2QwNEZYcmV4NDBTOEUxTU9xS25seDhtdmhSb3BuSWNLeWVT?=
 =?utf-8?B?VU1MYWJpeGhpTXJsZEZ5aE1zTGdwYnhOZjI4VkczVzQ0Z3FNS21OS2xxaVVi?=
 =?utf-8?B?K3FiRU9WMmd3bEQzTjF5YVdGaDRuRERCRWQ0aUNRcE5TVE1nV0g2TkJFQ0ZQ?=
 =?utf-8?B?M3AzejlrMWs3RzF0c1NGT0E4V1Nhb0R5RklIcWllaDI3RFU5RmFQUWYvRTFC?=
 =?utf-8?B?VG15dEdNL0VRYUFGdU9TcGZVYllmaDYvbUtLbVZBaGl5bnErTDZ1eVVOMVY3?=
 =?utf-8?B?WDhwOEtKVzcvYWprbHRoSE40RUNXNExrcVFTbk1YbldacHNhenZLOWRybUZu?=
 =?utf-8?B?U2UxWS9LZTEzWlZtbkY1ZXBzZHZmRXpvcXdTbVBXTkV5YzJMRzM2WE9mR29o?=
 =?utf-8?B?YjJZRVAwV3NhUEZ3VTZVRy9IenZtRGYyTVFqdEo3NlVPL3YxVU9EeVdJMVhE?=
 =?utf-8?B?SCtYYi9BcmJNM2NIaXNkRDdWWVprOUxCQ3hVckpYTDdDWXpjVnBETTVmKzFC?=
 =?utf-8?B?M1dBZG5MeDdFeEMvY2NmTXdYdmljbmFjdzFiY1FxemtIeHNpTXE2SEw1RWdY?=
 =?utf-8?B?cm5RckJuSVoyWUpxNm5zUGxhYU9VTy9xdUsyanBQMWJSVFZRa1oyaUYxU3p2?=
 =?utf-8?B?MkNQcEFvclh6MXlBK050Zk9LR1NtcGdoeldtNkp3Nm50UkNaZE82VHVSVGR0?=
 =?utf-8?B?Y2FEdndGeTUvaXkvK3oxRndyVmFhSXVmNjRESGdlV3hqdFd5dXdsNGVWdlJm?=
 =?utf-8?B?RmxxVEhuYVRvbmJWMmJXQTdFSmZiNVF4bk85WmxWRWk4b0Zpb3FiVWJxcDNU?=
 =?utf-8?B?WXo3V2ZGYzhQeC9BUURBbFZtMElCZ09xRit5bTJLU1ZvWDBaRyszb2JiY29L?=
 =?utf-8?B?SklBc1N0NkYreUIzSUc3a1pOLzJhYk0ydzd1M0VnLzVxNmVCcXRDVHBtMjJ6?=
 =?utf-8?B?OHRIZjFwbHNHMHZoQjlVM0FFcG5HTW1iZUFuV0ZBb0dBSXJRaTZJUXZTdDY3?=
 =?utf-8?B?Q290S0UwaUNyTWtxZ3JlazlnTXl0L2JpcUNmaFB2dkU1cE1DbmdkYXliclY5?=
 =?utf-8?B?YTVGbkVSa0tMUnl5cjVXOExTdWdpTUJlMGxiSnZ0QmRpLyswVHVIbU51NERF?=
 =?utf-8?B?OXlJcTR2WTNQeDFvZzNrd2VCVW5PWk1mY25NakpXelJhTUYzNml3UDdkNUw5?=
 =?utf-8?B?WHJ5cnVhQTcvVllZdEJTc01VMS9YTkk3Sm5odXhHbEtTUXMyVS9CNkdOeWR3?=
 =?utf-8?B?RW1DT1VlTXdURkQyVUVPZUhIUW9QeHNUS09LdGtDcFVTbmREeWxLYWVIWXB4?=
 =?utf-8?B?WFpLV3NhbnZkMi8xQlZtQjFMUC9vS1BwVUx1Zm00ekhKUGY4cElBTGxGQ3BZ?=
 =?utf-8?B?YzVSdk9QYnpvR1dSYjJVN01SblFLTkpvUG5EVG1BNy9LWVpqQUpmMFNZMW8x?=
 =?utf-8?B?VXMyYnBFcjAzeGlwWHpNeTNoZ1FRWTZ2Qy9nNHpFdU5CdUczMklSWUFBeEpZ?=
 =?utf-8?B?TlN6RElwenJWbkh0OFN3YjExUHp6L2s1UllidHl6OTB5bnlLWVl3eGRUOEtH?=
 =?utf-8?B?ZTBqcS9XRVhtUVhxdE5tT2xIRjdaZGVyc0J5VWt2dE0vOFhsRVpOZ2ZMVE9V?=
 =?utf-8?B?ZnlYRWxFenVMdmVhblFsczIrT2dQajNXZnZEMUVWaU9wcTlicmxLSXB2d2Fu?=
 =?utf-8?B?ejA3QlYzM3Z3Q2tqT3Q4M2Q0UVNjOC9zcUVFM2NOM256Y1B6MHhyYnc1UUVL?=
 =?utf-8?B?cnYvMDhHcC9XMERpbWhhekgxTXAyY3Q4VVFwOUVmM0lsaDZyb1d2aW5JeGVE?=
 =?utf-8?B?ekFQaUxsRDhxeXNsa0RWdk95YWNMd3g5cm5mZmdXZWZVQlFxLzRoNXdVQjBV?=
 =?utf-8?B?NjI5TXNpdjhDRmN3M3U5VGRibzk2aUVMM0xDSmJmUlBBRGh0aHl0NWM1em9F?=
 =?utf-8?Q?pIban4Aof0J/XbhEOAFxx8yAaqMYKw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXJtbGl6YmNiR0F1cUJ3U1FVWTVaMDl3YVRwandTS29FWWxYU2RibU11MUpx?=
 =?utf-8?B?R3RaMVZYRDNPTHlhQkp0bGtCbHYyRUNqU0V3UUVINlpTcCtqSWV3enczb3Az?=
 =?utf-8?B?S25UL1NlSHFLWTh3K21BbjBkdWRhcklwM213YzVLd3RLWGZpcGg0cXFhdDVu?=
 =?utf-8?B?Tzc0cy8zQlBKWmFEL1dFeDdkZHdjZklGN2N0cFlCS0JaWDdJNTFrVE5lRks2?=
 =?utf-8?B?ZGYxcXpuekttck1tWWFlNkgzd1E4SEs0T01IL0FMREp5WmxrUUg5OTdVVnlB?=
 =?utf-8?B?eTRDTTcrRWdnWGlIbGx1RUVHZXFQUW1NZVplYTlWclMwbzZZQ1hKT3lKT3My?=
 =?utf-8?B?NURxTUhwVVQxblJmS1hFT2tXR3lBQ0Jqb0xVRHp0Q0tVbFJmaURSM2U4SnFk?=
 =?utf-8?B?Z0NrZTgxSzE0T2tGZ2xNaDhwQ0NOVTBZa2NsZDd6eVNVeHdIaTRpUEZ3N3Ew?=
 =?utf-8?B?Y1pJQjJZRGtyeGpFNGNIbTVmWkljTnFETkRFSG1id1N1dUcrN1dVTEtvNWl1?=
 =?utf-8?B?eUNQVmhab0w4T2VZdGNjUEZ5QWo3c016QTU2b2hiQ0o5YjVVZG9Xbkg5YjJk?=
 =?utf-8?B?Z1kyUEcwbFhicEJEaGpYc3Q0cFg2dVRBQXo0WXBINCtiaVJLL1hHNDdzQnlU?=
 =?utf-8?B?bTl6dmttSlcwdmFFa1JOajlRWkpCMzhRWWtsR3RoWUhBTUhkL2lwbUdzTGVm?=
 =?utf-8?B?Z2crSG1nbjJLQ0RqMTl4dEtYWDhpeU9KeUR1TE16QnhtOFRtQUFiZDNQMjQ4?=
 =?utf-8?B?Kyt0UDRVSUs2QnNDaEpnYXl6ZFRsL3dubXhDRlpQWm1jKzRVOUlmMXBiUzVy?=
 =?utf-8?B?dFlrUjFUNTM5bUV4SDc2U003QlNZRWpNb01HTnlZbkxZREx5Z011YlZmclk5?=
 =?utf-8?B?SE1DNnJUSEVSNk1hSWpXZmx1eTc0MWJ5R2xFMVIwT2dOaHZrVEFscUNYeUxD?=
 =?utf-8?B?YStncys4TytiRCtUcVJENGR1Y1Vib0hsdWl2MUw2ZVp3Y1MwVE1FSXhxSnNq?=
 =?utf-8?B?a2hqL25sSnNzeXFDRkJvTC92WlBTNEI1Q3hCMmx6SW5pa1c0WDJJWHdQNXBS?=
 =?utf-8?B?NjVnM3djOWxxdldpRGRPUHc5QWM5N3Zyd3FTQ0VNcllDODY2MFp0a0NtU2RX?=
 =?utf-8?B?aUd2Vk96WlJJMy9KMHd4NXAzQ3U4MzFSaVgxdlBlZkx0VVpUR2I2RmU1cE11?=
 =?utf-8?B?SWtJR0t6amlwUmd2QUwwSE8yY3NJMlFmK3RTUU4reCtFbFlsemdvbGYzV0Nk?=
 =?utf-8?B?NFQvNW9uQ2RNRldEWXlyT0w3WW01TFZnOXd5SGM3M1IyQnd5Q29hMkJRTVk5?=
 =?utf-8?B?QWF3ckxOQlNucVRSSTJVRnJTaXZndjJIR1R6V1pnTGhrVTk5QjdPZ1JuTWg3?=
 =?utf-8?B?WUVWczd3SDdhK0NsSmc4RFBCNVUxOHYvR1A5aER3dDdURURwcURaTVJsUDM0?=
 =?utf-8?B?bUZnMG9ZWjVEMHB4bUd0aVZFU0ZlczBxdko3L3FWcWRmWDBzZUNJbmtTSE0y?=
 =?utf-8?B?cXhjbEdqZE9hdXhOdSswV2JsVkVwcitNMlhvaU9Jd0Jxbis2SjluL2lJckhJ?=
 =?utf-8?B?d2hMQWxqVmZCMXRJZVRtSWdUV2lvUFppODdBRVppajhXZGkxb1hlbWlTQ2xH?=
 =?utf-8?B?T0ZkMTdDQUdHWTc0TnJvZklRUFdvQVRVd0VkYzJRdGhyZC9YVjJhRENFTSty?=
 =?utf-8?B?VWM4QjBOUzJqb0hmcEVFeS9TSkRnUTNYTklaUWkwVC9sdEZWeitZVmdVa013?=
 =?utf-8?B?QU9jZDFiaXU5Zjlzd01zTldlSFUwSE1LRlNvd0VCdy9BQWpwZmpTazlKTER2?=
 =?utf-8?B?dWRnaEMzTGtha0pybW1QSDNSbGUwZnVBRkZzSU16aGV3ZWNrWjBPblovYk9l?=
 =?utf-8?B?YUVCQll1ampDZDJPRmRkUmZ3ZngzSElPNGkvajN0TkprRHp5dC9YSGhGRG5Y?=
 =?utf-8?B?TXZ3amZGeFRCYjZQTTd3SDFxa1pxMWs4ZmhjQ0N0aW43UHpMZWlSWHVTMlJC?=
 =?utf-8?B?MTdoelFEekp0ZDZJMEU0Y1E3elhFeDR0S3NibStQSnlGYkpiRjU3MUJTdVVo?=
 =?utf-8?B?c1BWYmE1ZUViSUJBKzYyTExkbXpUOHlGK2o1dERCaTRnUkg1TWZXSW0zdlk1?=
 =?utf-8?Q?RRMk=3D?=
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
	6ioxxg1QGO9z8BXZrWbE+Fc0Pn3SfMzd0ZpNIdAqj6n3o/F0R7oG71wkj41zs9lG5rXR/o2UBh76vJHmXYW2WNu/d8mu4rqFWPM1Rln1g2fWJpUbVrd0tudqrDmt0jjCYH6yWS54c/uK6kltwtz1g6c5snfus4C5suSv3jKJy/rr8EShbedkyjGJ3uDYr0JZu5tewRcuvO/eoEFLM8GjbQb0Cp+pNAyaPuRwhQt+SQYcBNdvNYgaTopj1aR+XwwGo5VsKiMvx7V0KGDl/tY+o+QyHMcl/B3rIxcFtv+kiotua6e9zEkJMf4slokN5lsE0iEycggWDvktzkF58TgrE9iU51hhbRPMV/+x5npuM6XI8NAI9G509N5q/Ut8h9ss0LmLKVmKQYLEZNXeWMLs7kO2tnmoXr00pCvsmUP7X0Ak9Wvu+YdiGvL/zb8Rc5IjHdYnTwWPzGBaon8Us/Uzda0h3wMZLqTJMeR8QoY6H9vFoZWNTWd9gaSL1HwmEApa5MCdf2uqJxdzNW1FiktdmrmWd5ahjuHNz5hTLQqWu6Lk+XyB3gaXVnYeC0yS+XJvgqV1tFFX6EOVF5V+Jd6banMsPsoD9EHd+8wF7s9C8sye4eeWosWr6Eao1x2D59bV
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02af5d25-c6d9-409b-515d-08dd9a56ec1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2025 00:07:07.5039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kKd5+Huc8jMei2IjNHMT1HESgKVlycJDxUU5VYEnEPjdFnjuCOHngjRoA1BE3JJWILsjYySkwHt2sXxFtHHh1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR13MB4685
X-Proofpoint-GUID: FlV9YtSZF3IXZ4fn_FkcBgghQvVpcJ08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDIyMSBTYWx0ZWRfXza0DrK3Qr6Q9 ag/KAD+V9WbmzPNtZXW6qJvKAfyef7KwEqU9rtpuAcOF0ADNrHtEHvFvgtCO0morMKSci28ESSf OgCFza9FzX1tmS/x3cdH5+8IUzL4xBNTYToTTyZnkFtEEqbJLvRDRU4mT1Co7Zg8L68TO/B9N1I
 bwRAHywtIASTaqQ4EKvC1pB4d1KqSa8vIDosuGBiLtxOk6IgDOd18WAY4ULwOOKpyu67c8BDqgz ZoDlPA49na9+PPddw3adVYdpx9o239X731WdCkZpe1LGgryM08AuZScXXbG2o9y0X1Q5wGZvcl8 SQkKQVyZacV/hVorlVxEaA0wQjJrCi8rBiwpRHfpmhOq06nNtyOSQHSRkqeWq3Xsk1TTr4yDo3t
 za6OC+EQ14H7TJUwbKfOHLG65Tp7NZqikUSPJ6UmvIbhdOpdYg78ehRvM2fpxyyh5Oe3+JSH
X-Authority-Analysis: v=2.4 cv=YYi95xRf c=1 sm=1 tr=0 ts=68310db0 cx=c_pps a=IKKnTnttSRAw3yzzHe0h3A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=xR56lInIT_wA:10 a=NEAV23lmAAAA:8 a=alQUlhaaS7uaSUi_saIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: FlV9YtSZF3IXZ4fn_FkcBgghQvVpcJ08
X-Sony-Outbound-GUID: FlV9YtSZF3IXZ4fn_FkcBgghQvVpcJ08
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_07,2025-05-22_01,2025-03-28_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGZWRlcmljbyBHaW92YW5hcmRp
IDxmZWRlLmRldkBnaW92YW5hcmRpLmRldj4NCj4gSGVsbG8sDQo+IA0KPiBUaGUgbm90ZSBhYm91
dCB0aGUgZGF0YSBmb3JtYXQgYWxzbyB3YXMgbXkgaW5pdGlhbCB0aG91Z2h0LCBieSBqdXN0DQo+
IGNvcHlpbmcgYSBDIHN0cnVjdHVyZSB3ZSBtaWdodCBoYXZlIGlzc3VlcyBhcyBzb29uIG9uZSBw
YXJ0eSBjaGFuZ2VzIGl0LA0KPiBhbmQgdGhleSBtaWdodCBub3QgYmUgcGVyZmVjdGx5IGFsaWdu
ZWQuDQo+IA0KPiBUbyBhdm9pZCBpbnZlbnRpbmcgeWV0LWFub3RoZXItZGF0YS1mb3JtYXQgSSd2
ZSB1c2VkIG1zZ3BhY2sgaW4gdGhlIHBhc3QNCj4gZm9yIHRoYXQgKHRoZSBmb3JtYXQNCj4gaHR0
cHM6Ly9naXRodWIuY29tL21zZ3BhY2svbXNncGFjay9ibG9iL21hc3Rlci9zcGVjLm1kLCBub3Qg
dGhlIGxpYnJhcnkNCj4gKTsgYmVjYXVzZSB0aGUgc3BlY3MgYXJlIHNvIHNpbXBsZSB0aGV5IGNh
biBiZSBpbXBsZW1lbnRlZCBpbiBhIGZldw0KPiBsaW5lcywgYW5kIGl0J3Mgc29tZXRoaW5nIHdp
dGggYSByZWZlcmVuY2UuIEJ1dCBJIGRvbid0IGhhdmUgYSBsb3Qgb2YNCj4gZXhwZXJpZW5jZSBp
biB1cHN0cmVhbWluZyBzdHVmZiBvbiB0aGUga2VybmVsLCBzbyBJIGRvbid0IGtub3cgaWYgaXQN
Cj4gbWlnaHQgY2F1c2Ugc29tZW9uZSB0byBkb24ndCBiZSBoYXBweS4gQW55d2F5LCBJIGNhbiBj
b250cmlidXRlIHRoZQ0KPiBpbXBsZW1lbnRhdGlvbiBpZiBuZWVkZWQuDQo+IA0KPiBTb21ldGhp
bmcgYXMgc2ltcGxlIGFzIGFuIGFycmF5IG9mIGZpeGFycmF5IHdpbGwgZ2l2ZSBleHRlbnNpYmls
aXR5IHdpdGgNCj4gb25seSBhIGZldyBieXRlcyBvZiBvdmVyaGVhZC4NCj4gDQo+IFdoaWNoIGdl
dHMgZW5jb2RlZCBhczoNCj4gDQo+IDB4ZGMgIyBsZW5naHQgMTYgYml0IDw8IGFycmF5IGhlYWRl
cg0KPiAgICAgICAjIDB4QiA8PCA0IHwgKCBhcnJheV9zaXplICYgMHhGKSA8PCBmaXhhcnJheSBo
ZWFkZXIgKCAzIGVsZW1lbnRzLA0KPiBzaW1wbGVzdCBjYXNlKQ0KPiAgICAgICAgICAgICAjIDB4
Y2UgIyB0aW1lX3VzDQo+ICAgICAgICAgICAgICMgMHhjZSAjIHN0YXJ0X3VzDQo+ICAgICAgICAg
ICAgICMgMHhjIDw8IDQgfCBzdHJsZW4obmFtZSkgIyBuYW1lDQo+ICAgICAgICAgICAgIC8qbm8g
ZmxhZ3MsIG5vIGlkKi8NCj4gICAgICAgIyAweEIgPDwgNCB8ICggYXJyYXlfc2l6ZSAmIDB4Rikg
PDwgZml4YXJyYXkgaGVhZGVyICggNSBlbGVtZW50cw0KPiBiaWdnZXIgY2FzZSkNCj4gICAgICAg
ICAgICAgIyAweGNlICMgdGltZV91cw0KPiAgICAgICAgICAgICAjIDB4Y2UgIyBzdGFydF91cw0K
PiAgICAgICAgICAgICAjIDB4YyA8PCA0IHwgc3RybGVuKG5hbWUpICMgbmFtZQ0KPiAgICAgICAg
ICAgICAjIDB4Y2MgIyBmbGFncw0KPiAgICAgICAgICAgICAjIDB4Y2MgIyBpZA0KPiAgICAgICAu
LiByZXBlYXQgLi4uDQo+IA0KPiANCj4gU2luY2UgdGhlIGdvYWwgaXMgdG8gdXNlIHRoYXQgaW4g
bWFueSBkaWZmZXJlbnQgY29udGV4dHMsIGRlZmluaW5nIHRoZQ0KPiBmaWVsZHMgdGhhdCB3ZSBu
ZWVkIGVhcmx5IGlzIGltcG9ydGFudC4NCg0KTXkgb3duIG9waW5pb24gaXMgdGhhdCB0aGUgY3Vy
cmVudCBib290c3Rhc2ggZm9ybWF0IGlzIHRvbyBjb21wbGljYXRlZCwgYW5kIHRoYXQgdGhlDQpV
bmlmaWVkIEJvb3QgTG9nIHJlY29yZCBmb3JtYXQgc2hvdWxkIGJlIHNpbXBsaWZpZWQgdG8ganVz
dA0KbmFtZSwgY291bnRlcl9pZCwgYW5kIGNvdW50ZXIgdmFsdWUsIHdpdGggZml4ZWQgbGltaXRz
IG9uIHRoZSBzaXplIG9mIGVhY2guDQoNCnN0cnVjdCBVQkxfZW50cnkgew0KICBjaGFyIG5hbWVb
N107DQogIHU4IGNvdW50ZXJfaWQ7DQogIHU2NCBjb3VudGVyX3ZhbHVlOw0KfQ0KDQpOb25lIG9m
IHRoaXMgbG9va2luZyB1cCBuYW1lcyBpbiBhIHNlcGFyYXRlIHRhYmxlIGJ1c2luZXNzLg0KDQpP
bmUgY291bnRlcl9pZCBjb3VsZCBiZSAwIC0gaW5kaWNhdGluZyB0aGF0IHRoZSBjb3VudGVyIGlz
IHRpbWUgaW4gbWljcm9zZWNvbmRzDQooZm9yIFUtYm9vdCBib290c3RhZ2UgZGF0YSwgd2hlcmUg
dGhlIHZhbHVlcyBhcmUgYWxyZWFkeSBjb252ZXJ0ZWQgdG8gbWljcm9zZWNvbmRzKS4NCkkgd291
bGQgcHJlZmVyIGRvaW5nIHRoYXQgY291bnRlciBjb252ZXJzaW9uIGF0IGJvb3QtdGltZSwgd2hl
biB0aGUgY3ljbGUgY291bnRlcg0KdmFsdWVzIGNhbiAoYWxtb3N0KSBhcyBlYXNpbHkgYmUgbm9y
bWFsaXplZCB0byBtaWNyb3NlY29uZHMgYXQgcmVwb3J0IHRpbWUuDQoNClRoYXQgaXMsIG90aGVy
IGN5Y2xlLWNvdW50ZXJzIHVzZWQgaW4gYSBzaW5nbGUgVW5pZmllZCBCb290IExvZyBjb3VsZCBi
ZSB1c2VkLCBhbmQNCmluc3RydW1lbnRhdGlvbiBjYW4ganVzdCBzdG9yZSB0aGVpciB2YWx1ZSwg
d2l0aG91dCBkb2luZyB0aGUgY29udmVyc2lvbi4gIFRoZSByZXBvcnRpbmcNCnRvb2wgd291bGQg
bmVlZCB0byBrbm93IHRoZSBjb252ZXJzaW9uIHJhdGUgZm9yIGVhY2ggY291bnRlcl9pZC4gIEJ1
dCBpdA0Kc2hvdWxkIGJlIGFibGUgdG8gY2FsY3VsYXRlIHRoYXQgYXQgcmVwb3J0IHRpbWUuDQoN
Ckl0IHdvdWxkIGJlIGdvb2QgdG8gZGlzY3VzcyB3aGV0aGVyIHRoYXQgcmVwb3J0aW5nIChhbmQg
Y29udmVyc2lvbikgc2hvdWxkIGJlIGluIHRoZSBrZXJuZWwNCm9yIGEgc2VwYXJhdGUgdXNlci1z
cGFjZSB0b29sLiAgVGhlIGN1cnJlbnQgcGF0Y2ggcHV0cyByZXBvcnRpbmcgaW50byB0aGUga2Vy
bmVsLg0KICAgLS0gVGltDQoNCg==
