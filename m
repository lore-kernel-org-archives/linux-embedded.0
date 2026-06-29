Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D875C3B38B8
	for <linux-embedded@vger.kernel.org>; Mon, 29 Jun 2026 21:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766855; cv=fail; b=VNZ3sJeCjTgCJ+4/77bYSqXpeXVYKaS4Vex82AULPvB/lDPZmzIHX2MyPS1nxbFvwyhmYvd4N60gC6VPgyCEAmM2lVlwVbPxs/zHNG5yUJyvaDLhtRAGHQh70RMzaLIlV7uNs/TE1beRJfjca005WoT9ZuByOMs35o96alGmArg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766855; c=relaxed/simple;
	bh=ASW6RcJoY7sng/vDQloimF5uKChsukQlMlt0+3sOrSo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AAvQOQzkiLkLmRhn71+wi2w5Oh9LMbLsBnAi2mEaTC0kdqP6et7iIGNkAk+WP04IxTQuqXWoV7wH1Lb2s2vZfU2ysrmj80mTcIMEBgOMHJoS6t2nXWxogT/s7SeDE31l/X87FymlfXnWTI7AdQBUCEzU0VcpEEbPdM91Hgusy2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=pDzBWnp+; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="pDzBWnp+"
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TKf4Li966943;
	Mon, 29 Jun 2026 20:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=ASW6RcJ
	oY7sng/vDQloimF5uKChsukQlMlt0+3sOrSo=; b=pDzBWnp+bA8y1pG1XpdFTnY
	GP7z1j9Fg3BynN7xMVyUaKclKXRPLBxT9akonwaRK0XPxCmuRChY5ZJlV/LNSEsX
	AodlX6q659lGJjhQmpCibC8xiNiQgU7LCNXnBrEKdZJoP9FcdHgGfbadk0T4GfVv
	FsegjJRwSBRXqixJMA4R+pPq9GmlHpxE6T3Lbn/n1sMJZZ9Uh2pXOcRSgQW3wFKM
	b1hY5jGeKww/MU09HWPfLQL/OmUobT8eqM5Xc0jHpFow33WDoWTD94DfZgx+7t6f
	G9yOS8hPFPZnElLyk6ZKrn+pMtQLVoLN5Yvu3NDys6zW3CPoSdqeq5tpJa+LXTw=
	=
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010002.outbound.protection.outlook.com [52.101.61.2])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4f26j62s4q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 29 Jun 2026 20:58:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PILg1Qm8fZTQ6v22GET1VUGNlUJ2E4sT4J9H/Yhlnuie41Vr3udqRdb1mbMRpj+8WTTxeo4SrVafnwg97B6STxBAmXDlLxgZ6cDV1Y+uUOY6bTL7nhPhFkTdWRTxH+mIcXLZD90Ce1ZINRD3+FPvs8tkoMcSQTqIK8ntLMzLX+Z46dPFOEw2Tv/4fNqEcTURqfQcMpstRUIZPxkM2T2MwfLn8sVwP5RhIW81wqZNMkzKVgLKOP2EvnrRLT3jKro2z4WsG8uRAUCuQZEeStOsbVgmiqJhbzg6ClVrwNVS9aZiu30CSEFpASBt8IkLCD0SOjJJVhuBbbbKWj/z5J0eLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASW6RcJoY7sng/vDQloimF5uKChsukQlMlt0+3sOrSo=;
 b=NwtMxMvtkiGWyD7BL+2YYQvd12oIJp+Iv8Bb+7HH5DwCdW5/PEdUfec50TqVlTEALjB70hF0EA/HKz1+JFI9Ji9YyBIEBoZuPTikV0XlxbCOrSxzr6ugsZic8v0OH3yi1Y+uKko1vjGawZyOJC7WZh1YoI3++ziBFWRlKtWhjop0eXyjvyQsnANphd/ntZF/tr1mtEjYaZGr2eOShfyLNBoi6vz2b5ejbHcSiiS5wxQM5nhuCz8NcuJLZI3V6Pag397LPr+VqPAT0M8/KUW2+G+RwltZWQFXLCMzdpqJ93Bcj9qizxZknvbMp3WnvRmLlrW58sIhwiokCGRWGcxSUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by PH8PR13MB984277.namprd13.prod.outlook.com (2603:10b6:510:3cf::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 29 Jun
 2026 20:58:22 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%3]) with mapi id 15.21.0181.008; Mon, 29 Jun 2026
 20:58:22 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Rob Landley <rob@landley.net>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>
Subject: RE: grab-boot-data.sh fails on mkroot (zombies abound)
Thread-Topic: grab-boot-data.sh fails on mkroot (zombies abound)
Thread-Index: AQHc/1HmcgxURBYvS06afRVyPqILirZR1UIAgAQ88LA=
Date: Mon, 29 Jun 2026 20:58:22 +0000
Message-ID:
 <MW5PR13MB563273DDAC28AAB1FDF887DAFDE82@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <f35774f8-4194-4715-8321-dc2fdfc7fc88@landley.net>
 <MW5PR13MB5632F0D9C8E8A12F2C24B64AFD012@MW5PR13MB5632.namprd13.prod.outlook.com>
 <81e4aefd-f052-4a52-94b5-36030b26c358@landley.net>
 <MW5PR13MB5632FDD1833ABA105437D02AFD162@MW5PR13MB5632.namprd13.prod.outlook.com>
 <9e3f48db-c827-4892-8e41-656e9c60ff89@landley.net>
 <MW5PR13MB563232D40A099D798E698272FD152@MW5PR13MB5632.namprd13.prod.outlook.com>
 <064b8c64-ebd7-4210-ac28-8be27773c8bf@landley.net>
 <MW5PR13MB5632865579893156ABF6BC75FDE32@MW5PR13MB5632.namprd13.prod.outlook.com>
 <42eb69fb-928c-4e74-bc2f-aa04eaa97681@landley.net>
In-Reply-To: <42eb69fb-928c-4e74-bc2f-aa04eaa97681@landley.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|PH8PR13MB984277:EE_
x-ms-office365-filtering-correlation-id: b09c0891-e4e8-4e45-518d-08ded62127d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|376014|23010399003|1800799024|38070700021|4143699003|11063799006|56012099006|13003099007|18002099003|22082099003;
x-microsoft-antispam-message-info:
 3gLpNoGWjZbl3AOro1CoAlFMSLvFU6e/CyR7lFZQGb5Qo9dVv4CD2ifCVC6fnhfkxOkBifCQUkNn+sLIqJv7IIaZeJrwdGyo5/o6ZNi0ZcyhoZZIAEJEPL0HG9rzpBv2UDocqLRyz5wAf0saFOU9ziTDvtQelMawuFIBS95DNfddBU1Y2nOcC0qrMB05x0QAJbDXOHnXAzFV/vCx5WSGOUlCJmul/c7bjuy/Kt8mNw0iL8CIQ32ZisNUnrILahq8TcYVvmKuL0oNG8gFofazSf6kEIPiI/2SJkwNj1yR6nejO8SVzJtf3J09FH1R5rjpSlDMrAHQFUKT75+Z6A6Yg7+JoZdXayrO94REQNS5LJQaYx0Qz4x1Skf5FId6uwmwN8Y5mrKjc8LRy53Iu7qUyPAdQ4cLJkpD6q/YNqBKvnp3rpdBK/0kv+tTiTn8Vj+4mKJxxgJtRivQBRwuh8MDWvNJIvQUGtBb4v3Py/mm41hZOzhHyMJBFobAswKTQn07Yw5sNjeEH1CR39/RSTzK644zG9lv1JelI6UFCmxu0ExrD2/cBu7A7ejug1roh3duMZ+tKC//XP3OdAQsL8OOAJVHS7iaTywXbNfSd/muCCNUsKgr7rr+tDZi138/wGmKDl63nq1om4279kfYK2GdnIDBO21mF2SdFZYf1PAS4jY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(23010399003)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NEtPZXJObE4vWVBsQjBZQUpwSlhFTzBYY2dkYi96ak1vWlNmTDdEcTFabkQ5?=
 =?utf-8?B?YUtITE9HT0VuYm10d2FlTUV1Y3B1amh6cTZUWlVWd2lFS0lVMkNEL080NkJ4?=
 =?utf-8?B?c0FocTBPSklRbzJpR0UwRU91SC81c3F1S3MzbW1BNW94bkdncDZhTFgvN2cx?=
 =?utf-8?B?WUJSNUU1NUd3RUZoaGMvOWN4L0FNOG9FVDA1b1pEWjVUMWo1STdTcHRkL0g0?=
 =?utf-8?B?eEVJWDc3Nk5FWW9yNWdjN2NYOHJVTExhUVFpeW9KU0N4NmV2T1g3UkxsbUhr?=
 =?utf-8?B?MGhKd0U2MGRYbVh4L2lGOEFURHpwaHRIelc5ancwMWxldFlyaUNkL2ZYTm03?=
 =?utf-8?B?RUU0eHVFVGg0dWFoZ0FtTUFneldMeENkZHpKY0h6TDZUaCtBbWd0Tllaa1Vk?=
 =?utf-8?B?OG9GeG1ydlBzRkkvUlg2TDFRUlZORkdWUm16KzE2SWhVU2laSnRhenRST1RC?=
 =?utf-8?B?VmF6R3VsMXlSbFk4RWxWd005TWhGMG5xM0I3ejlWUVZNMEpYUlpockpaUGYz?=
 =?utf-8?B?bWVEUjJ2SGFlZzZEVVlCR3NEUVFtbkNLSjIxM2RBVHJoZmQ0Rm5mcG5SdWpS?=
 =?utf-8?B?bXJGSHB6QkZaeXhjcUFpbG9teTVXeTk5SlJxSGlMbjlReW5aaVMrc2JZT2Iy?=
 =?utf-8?B?blVBRVdnUFpjUWE5TXF6Vk5VZytKQXN2cVdVck03ak1GejU0K1VYRzFGR1A4?=
 =?utf-8?B?YkVNc0w2MENCaWhMVHhWWFJydG42S2o1Yk1JT2wvMURsYVUvQ2N4SFBBN1Fl?=
 =?utf-8?B?MmtkUUJSRGdhV3d2NElWZjg4L3pKU1VrY0h5Ykk0Vk1RV29aRStSYytrdVEz?=
 =?utf-8?B?TXNNZlFKanJCd3NWVU9XeEFDcnIxbXFFKzFPdk5wayt4WTRGSjFxWUlFcUpK?=
 =?utf-8?B?RWxoQ2tXRFU0b3c0dGJlbHY1bUkrRnJkS1pGMDViWi9TK2s3dG5pNTFIeHlZ?=
 =?utf-8?B?V3NQeHI5LzFpQVU3bkhBQjdJempqb3hWaDZGd0dMbG83OWV6Q0FsZmE3SGhL?=
 =?utf-8?B?aVRqQzZ6dU9HMTRLQVE5ZmluNklaZUJBWlprVndyWkNxSXp6UWFTQVloc05Q?=
 =?utf-8?B?ekUzRUgwbThHWTN6L25BWjBRY3N2TEttTExrMjQydHdBdDdMaG5BbXdCdDJx?=
 =?utf-8?B?bmZLZSsxZzhXZXZzWVU2UHhCMzdybnZNRTdrdzJFMHkxYiswZHpiWFo3N2lD?=
 =?utf-8?B?M1JBcUR5NnducG1BRHhXSkE3Ynd5Uk03VjFYWkVaSFlRWFlrb3FuRVZrSVZZ?=
 =?utf-8?B?cGNhTXdpZ3ZpUm16VmNlSDNjdnFnNW1pRUludEdEazFDdGhkclJXU2VGV0Ey?=
 =?utf-8?B?RUVSMHN0QzJCZ20zWUR1NVAyQ3I4Vk1xTkRhNU8yaitHMHhQdDRTcXNTSE4z?=
 =?utf-8?B?Q3dXYmlXWFlIUHFiVlNCS2ZXbnI2V3F2MHh5NjBzdGFHRHdsOVU2R205MlBC?=
 =?utf-8?B?cjhyV005UFdoWnY5OGptVWJnYnU3SWlBNFhqemZzMmU4UFo5MFBMdkVSZEhL?=
 =?utf-8?B?Nzk5eUwvYkN0Z2c2TzRCSUo1bmorS3huZ0ljTzdXV0szVEhqU0loN24xSXJw?=
 =?utf-8?B?Z0dDdEdVSzNvWURCNkgxSnBYUUdxZ1VDd3hTYnNyMzFhUXc4eWdSY3BCY091?=
 =?utf-8?B?NytKai9EcUVqMTJtc2sxODJiTU05OVViUDBxRDNNM0dEUldwaFJuTHYxMmhG?=
 =?utf-8?B?VHRPZlBVNjh3NWZFeXJnS2NjN3BPSXlaZjdURGtNeXdXVWRoS3R6MFZiQ2dQ?=
 =?utf-8?B?RWJVU2NBOW82aEpQZytoblQ0eXlQRHNLaXRTUStkdDFvL0lTeVBGQkFUVlpX?=
 =?utf-8?B?Y2RjclMybjlNVHVvSnhLbHZCWHdqMWlrZE9pN05GY0V3VzgyWmlNQ1Q5RE5z?=
 =?utf-8?B?eG9ZOGNWRFZhaDh4VjlXNkZYWC82SlNoSEowUlJIaWNMeDRUbEtwWU1HbzFw?=
 =?utf-8?B?Wm1qRE9HNTJDTFgvVjlXL2xRNllnaXRJWlAxMDc1MVZqZUtSMWw0L1VPOWpW?=
 =?utf-8?B?RnRTY1hFdFd3UXIyclNFQUxoM05kMUdkUFpKcGk4S0tLUjgwVmVKbXBxZWtI?=
 =?utf-8?B?azlJODAxTmlNWjlsUXhqNlhCRE8yNWZtK0c5bzRoSFo0YXY1NGhHUzdjSEtZ?=
 =?utf-8?B?UjAvNUdlc3JSTUZJYW9TZHpndVdoMkZaek5rM04zZER6bm5zWllSd0Fmdy9z?=
 =?utf-8?B?STV5NDlZWHZsZUNRZ3hVTFNtbkZQUHZLclEzOSsvTGFEbTBWTjV6Z2lzZVZZ?=
 =?utf-8?B?aVZtSVdNdjJob1kvVlVNS29mdnpXSTZtV3NrQ25pK0JEVmNqbEFJNGxsL3hR?=
 =?utf-8?B?MnZRY0Z3ODRQb3lXUFBWWk1KQzdYK1hjQmF3Vm5CM2ZPT1h6dEtGZ2oyaVAr?=
 =?utf-8?Q?OyxH2wSGXZZ/j3GjN0ijtbo2UnczuGCnNRC8m?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Vcxc1D3jxyLoNH8Q3tvRuUnI9m0dxUnv+yYIgwTKTzi1CGEV6vo4o2Xb3QJF2q8ODGLwmzmrNcHfmqX+wjysp0Sn6ngIdlZs1CSi0p3LAGvh9COf6UpXbzBTRIkpfBqk9M/vzo3IsmA4Zs8KZGbhMOwl0lDmMYz7JnHr6ME+AVMcs1j8B5mou6aml9gNtUy9IjhshtwO0lq68eZ/igp5AiOBv+D1uMf1U6R1WJpgF1RPE1TYf9NIDxsQ9ngr0U/nM2ZLFlMVDaZjgbunwVQ/lBiKJkpfcz9y6aLZPsfwvnk/3JxRUZp/M3+St4q9ga9xkAR1tsDX19G2wxKoJtqAQg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UU1WL/t6YN+vDczPChGBTTDnjxXEjxCBCD9AAEkhvAjqC1TKyTiNc45vlyQgzLhSH1U4TAgjNGZUtIEqk1NV3g1M8YB75LDni+/9w2PkucUCgXFvQ8FC5m8ru18m0/1q4SX+ey48ma7g8YbarW9844dmdtEbEZ9HcQrOHCzAowpBEVzk1qmFeVAG9oTckQGNhz3R2e/aaMXk9LERy7M80YK+mZ3EdH/jRNdvZnzoR+Syjc5xOKvUZnZIikIYONB9flFNpTjV4vjldPi8SK5G9onRVcyawerPxKnpAhVgUl4HUECYxR/GeZtUZL4zjYbTRA6BETkQ9iZgUyGMq7VvZPl2P8y6sU21hRzxsnmj/uluJpaN2WuvhoNl0GW/PTqOl8TZkrS5+lavsiJhMP7vNOfDUJ79CBGTLPxtKcBEbSiIrx1EdU275pb2ebdaIQITuChQOkIzqWfSkw8lgP78QcdyyNWnwwoOoLr7lKJmx59QX+1eeJzCWZF+nvYU+hpJ1zLuZDTBOKcTOz6xeUzQMvxXPwLJZpHTBRP6vyJyihisvqf5qP9Oja1Bmj1gzGv83KQ/PY+T6I+bsjC2YpvBKaqYp5u+nYQK4Yv4vj+y3ewmpHusGSrOxIxWvpdcezgZ
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09c0891-e4e8-4e45-518d-08ded62127d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 20:58:22.2357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jg2I1KvQouN8M3xTLNiktQk4UIhcSzsKgpUIrA2QPM8ImabfsHNCs9AeusviGFV3Db0nCBniFVHtSkFFS8ZxBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR13MB984277
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE3NyBTYWx0ZWRfX18vlQ3HE10hi
 d9xj3215C0mzsHQhBayWjTJojZa2+AbgHaySUX0+epeTn/scvIzdOKBQ5qTaI0AGm9RswZY0Amm
 d3eMjfQqTUBf37+Z2xx4LH1ImaqpN6P3VDp0YEXH5+VDjzjsQA4x
X-Authority-Analysis: v=2.4 cv=S83pBosP c=1 sm=1 tr=0 ts=6a42dc73 cx=c_pps
 a=h3cS895ItAADrFIx/0pANw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=cIyGuqrkuvkXWOl_fzuj:22 a=Xu_aML22AAAA:8
 a=JAcjjVAEAAAA:8 a=4oupQTzvAAAA:8 a=IA0wh2spAAAA:8 a=NEAV23lmAAAA:8
 a=IquDCADfAAAA:20 a=y5Yq1ZyPAAAA:8 a=Gdl9W_2-6Gd7AMye3eMA:9 a=QEXdDO2ut3YA:10
 a=o_LaMfWX3WolavuFUIfu:22 a=Acyig5GiBk5jV-JuFR3u:22 a=F_R_EHrqUKoJocvyGl7m:22
 a=PoVUXeey_BepnEeCpHdp:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE3NyBTYWx0ZWRfXz5B2L5RExteP
 7wkIrE+92K2agvJfzemvxPXhH2FWm4iRuoiRo1G1auBt4DYcGS6HpA+Ok831RfJ7+dNQoMZ+LVp
 tJjm2gtgKfiXfNvJUqcNimxP/Qx9/izbOzvcbQbrvj7xSB9QEBZlJGkdv5gIpASup8Tz8igy9rb
 De7WaaBduVROu9p5PC+OX17m4BRjKCB+8nRtyKnE1aTA0VrNqDRV2FppUhU/MjZNphoEP5hFKX6
 LLG0zXKHsz7KNVKvyGv321Mz1d/7Dk+FBaMe21ZDREdosRQzE4kPrq+Ryl9c5eLPM3XQWOlbVg2
 RNUECrYkhtGvri1Id7o50O6f2uKGlNlVFP3Jw0Az9sVpIr+LZ9HQuGFdbEwdAKQbtAxRaBmbm1j
 ZZzanovoBXVZEwXeDWgLGm03C+gtGhhGiZ9Nr0mzff0N5C0nfytTL9audKVcdDgMC59AXaSgxOU
 v/zO3KwnHhwXBjuNSlA==
X-Proofpoint-ORIG-GUID: 4RkQUmz59VSjfZ5bfhNylxv6-QuP8VVQ
X-Proofpoint-GUID: 4RkQUmz59VSjfZ5bfhNylxv6-QuP8VVQ
X-Sony-Outbound-GUID: 4RkQUmz59VSjfZ5bfhNylxv6-QuP8VVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_05,2026-06-26_01,2025-10-01_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIExhbmRsZXkgPHJv
YkBsYW5kbGV5Lm5ldD4NCj4gDQo+IE9uIDYvMTgvMjYgMTM6NDAsIEJpcmQsIFRpbSB3cm90ZToN
Cj4gPiBIZXkgUm9iLA0KPiA+DQo+ID4gSSB0cmllZCBncmFiLWJvb3QtZGF0YS5zaCBvbiBta3Jv
b3QsIHVzaW5nICd0b3lib3ggc2gnIGFzIGludGVycHJldGVyLg0KPiA+IEkgZ290IHNvbWUgd2Vp
cmQgYmVoYXZpb3IgdGhhdCBJJ2QgbGlrZSB0byByZXBvcnQuICAoSSB3YXMgcGxhbm5pbmcgb24g
ZXhwZXJpbWVudGluZw0KPiA+IG1vcmUgdG8gc2VlIGlmIEkgY291bGQgZGV0ZXJtaW5lIHRoZSBp
c3N1ZSwgYnV0IEknbSBnb2luZyBvbiB2YWNhdGlvbiBuZXh0IHdlZWsuKQ0KPiA+IE1heWJlIHlv
dSBoYXZlIGFuIGlkZWEgb2ZmIHRoZSB0b3Agb2YgeW91IGhlYWQgd2hhdCBtaWdodCBiZSB0aGUg
cHJvYmxlbS4uLg0KPiA+DQo+ID4gV2hlbiBJIHVzZSBpbml0PS9iaW4vc2gsIGFuZCB0aGVuIHRy
eSB0byBydW4gZ3JhYi1ib290LWRhdGEuc2gsIGl0IGFsd2F5cw0KPiA+IGdvZXMgem9tYmllIGFm
dGVyIGV4ZWN1dGlvbi4NCj4gDQo+IERvIHlvdSBtZWFuIHJkaW5pdD0/IChPciBkb2VzIDcuMCBt
YWtlIGluaXQ9IGFwcGx5IHRvIGluaXRyYW1mcyBub3c/KQ0KDQpBY3R1YWxseSwgSSB3YXMgZG9p
bmc6DQpLQVJHUz0icXVpZXQgaW5pdGNhbGxfZGVidWcgbG9nX2J1Zl9sZW49MU0gSEFORE9GRj0v
YmluL3NoIiByb290L2k2ODYvcnVuLXFlbXUuc2gNCih3aGljaCBJIHByZXN1bWVkLCBtaXN0YWtl
bmx5LCB0dXJuZWQgaW50byAnaW5pdD0vYmluL3NoJyBvbiB0aGUga2VybmVsIGNvbW1hbmQgbGlu
ZS4pDQoNCkJ1dCwgdXBvbiBjbG9zZXIgaW5zcGVjdGlvbiBIQU5ET0ZGIGlzIGhhbmRsZWQgYnkg
cm9vdC9pNjg2L2ZzL2luaXQsIHdoaWNoIGlzIGEgc2hlbGwgc2NyaXB0DQp3aXRoIHRoaXMgbGlu
ZSBpbiBpdDoNCiAgc2V0c2lkIC1jIDw+L2Rldi8kKHNlZCAnJHNALipbIC9dQEAnIC9zeXMvY2xh
c3MvdHR5L2NvbnNvbGUvYWN0aXZlKSA+JjAgMj4mMSBcDQogICAgICAkSEFORE9GRg0KDQo+IA0K
PiBab21iaWVzIG1lYW4gdGhlIFNJR0NITEQgc2lnbmFsIGlzbid0IGdldHRpbmcgY29uc3VtZWQg
YnkgdGhlIHBhcmVudA0KPiBwcm9jZXNzLiBXaGVuIGEgcHJvY2VzcydzIHBhcmVudCBkaWVkLCB0
aGUgb3JwaGFuZWQgY2hpbGQgZ2V0cw0KPiByZXBhcmVudGVkIHRvIGluaXQsIGFuZCBQSUQgMSBp
cyB3ZWlyZCBhYm91dCBzaWduYWwgZGVsaXZlcnkuIEluIHRoZW9yeQ0KPiB0b3lzaCBpcyBzZXR0
aW5nIHVwIGEgc2lnbmFsIGhhbmRsZXIgdG8gZG8gam9iIGNvbnRyb2wsIGluIHByYWN0aWNlIEkN
Cj4gaGF2ZW4ndCB0cmllZCBpdCBtdWNoIGFzIFBJRCAxIChhbmQgdGhlcmUncyBkaWZmZXJlbnQg
Y29kZXBhdGhzIGZvciBqb2INCj4gY29udHJvbCBpbiBpbnRlcmFjdGl2ZSB2cyAic2ggc2NyaXB0
LnNoIiBtb2RlLCBhbmQgaW50ZXJhY3RpdmUgY291bGQNCj4gRUFTSUxZIGJlIHNjcmV3ZWQgdXAg
YnkgL2Rldi9jb25zb2xlIG5vdCBwcm92aWRpbmcgYSBUVFksIHdoaWNoIGlzIHdoeQ0KPiB0aGUg
aW5pdCBzY3JpcHQgaGFzIHRoYXQgPD4vZGV2L3R0eVMwIG5vbnNlbnNlIGFuZCB0aGUgJEhBTkRP
RkYgc3R1ZmYgaXMNCj4gY2FsbGluZyBzZXRzaWQgdG8gZ2l2ZSB0aGUgY2hpbGQgc2hlbGwgYSBw
cm9wZXIgZW52aXJvbm1lbnQuKQ0KPiANCj4gSSB3YW50IHRvIHJ1biB5b3VyIHNjcmlwdCwgYnV0
IGdvaW5nIGJhY2sgdGhyb3VnaCB0aGUgbWFpbGluZyBsaXN0IHlvdXINCj4gbWVldGluZyBub3Rp
Y2VzIGp1c3QgbGluayB0byBqaXRzaSAod2hpY2ggaGFzIG5vIGZ1cnRoZXIgaW5mbyksIGFuZA0K
PiBkcmlsbGluZyBiYWNrIHRyb3VnaCB5b3VyIHBvc3RzIGluIG15IG1ib3gsIHRoZSBmaXJzdCBy
ZWxldmFudCB0aGluZyBJDQo+IHNwb3R0ZWQgd2FzICJuZXcgcGFnZSBmb3IgdHJhY2tpbmcgYm9v
dC10aW1lIGFjdGl2aXRpZXMiIHBvc3QganVzdCBvdmVyDQo+IG9uZSB5ZWFyIGFnbywgd2hpY2gg
bGlua3MgdG8gaHR0cHM6Ly9lbGludXgub3JnL0Jvb3QtVGltZV9BY3Rpdml0aWVzDQo+IHdoaWNo
IGRvZXNuJ3Qgc2VlbSB0byBsaW5rIHRvIHRoZSBzY3JpcHQ/IChVbmxlc3MgaXQgd2FzIHVuZGVy
DQo+IGh0dHBzOi8vYmlyZGNsb3VkLm9yZy9ib290LXRpbWUvIHdoaWNoIGlzIGRvd24/KQ0KDQpJ
dCB3YXMgdW5kZXIgaHR0cHM6Ly9iaXJkY2xvdWQub3JnL2Jvb3QtdGltZS4gIEkgd2FzIG9uIHZh
Y2F0aW9uIGxhc3Qgd2VlaywNCmFuZCBteSBwZXJzb25hbCBzZXJ2ZXIgYXBwZWFycyB0byBoYXZl
IGNyYXNoZWQgKGR1ZSB0byBNdXJwaHkncyBsYXcgb2YgSVQgcHJvYmxlbXMNCndoaWxlIHZhY2F0
aW9uaW5nLCBJIHN1cHBvc2UuKQ0KDQo+IA0KPiBJIGdvb2dsZWQgZm9yICJ0aW0gYmlyZCBncmFi
LWJvb3QtZGF0YS5zaCIgYW5kIHRoZSBmaXJzdCBoaXQgd2FzDQo+IGh0dHBzOi8vaG9zdGVkLWZp
bGVzLnNjaGVkLmNvL29zc25hMjAyNS82ZS9Cb290LVRpbWUtQk9GLUJpcmQtRUxDLTIwMjUtMDYu
cGRmDQo+IHdoaWNoIGxpbmtzIHRvIHRob3NlIHR3byBwbGFjZXMgYWdhaW4uDQo+IA0KPiBUaGUg
c2Vjb25kIGhpdCB3YXMgaHR0cHM6Ly9sa21sLml1LmVkdS8yNDExLjAvMDc0OTEuaHRtbCBmcm9t
IDIwMjQuIElzDQo+IHRoYXQgY3VycmVudD8NCk5vLg0KDQo+IFRoZXJlJ3Mgbm8gZ2l0IHJlcG8g
Zm9yIHRoaXMgb3IgYW55dGhpbmcuLi4/DQoNClllcy4gIEl0J3MgaW4gdGhpcyByZXBvOg0KaHR0
cHM6Ly9naXRodWIuY29tL3RiaXJkMjBkL2Jvb3QtdGltZS13aXphcmQsIHdpdGggYmxvYiBoZXJl
Og0KaHR0cHM6Ly9naXRodWIuY29tL3RiaXJkMjBkL2Jvb3QtdGltZS13aXphcmQvYmxvYi9tYWlu
L2dyYWItYm9vdC1kYXRhLnNoDQoNCj4gDQo+IENvdWxkIHlvdSBsZWF2ZSBhIHRyYWlsIG9mIGJy
ZWFkY3J1bWJzIGZvciBwZW9wbGUgd2hvIGFyZSBhIGxpdHRsZSBsZXNzDQo+IHBsdWdnZWQgaW4/
IEkgY2FuJ3QgY3VycmVudGx5IHJlcHJvZHVjZSB3aGF0IHlvdSBkaWQgZnJvbSB0aGUNCj4gaW5m
b3JtYXRpb24gSSBoYXZlLg0KDQpIb3BlZnVsbHkgdGhlIGFib3ZlIGluZm8gd2lsbCBoZWxwLiAg
VGhhbmtzIGZvciBsb29raW5nIGludG8gdGhpcy4NCiAtLSBUaW0NCg0K
