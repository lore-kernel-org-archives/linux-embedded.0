Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CA31E4BE
	for <linux-embedded@vger.kernel.org>; Sat, 25 Jul 2026 01:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784941479; cv=fail; b=iqqOUbdg0MX15xmCyptBzmDr2rqm29CwJzB9znU4868JvaAjmet1/WGS884ww2UqExU4QGgCAoTthBsij14EPcRdP+KqZGMx2cQCV/t1J0JfsdtvzcPnKHrxnHxIJisNmKvIGgjlRv5qW+UKDD1C8kgHl+rgizXIcHdDSblJZUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784941479; c=relaxed/simple;
	bh=B9rBoZ3NmjZ98JKxqhu/fcW/FqF7Mh54ZeVdFt59XEg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=l7aMFwukPWOThVBcmSso1YyppKih3Brd/EiW1VStx+hee10Eq6wES9nGfpb4pvk8znSWWPmItyndWpvcZDnJCbzf0mzqqjCPcIDqAhayl98vnLjDIGDbQREl1piP6lN4f4SpwEAl9uP67Cni41v8UCvOBmLhg8zMfOa+spblPV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=lAw5/Ypt; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="lAw5/Ypt"
Received: from pps.filterd (m0209324.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66P0t2YX2169929
	for <linux-embedded@vger.kernel.org>; Sat, 25 Jul 2026 01:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=p1; bh=B9rBoZ3NmjZ98JKxqhu/fcW/FqF7M
	h54ZeVdFt59XEg=; b=lAw5/YptwU192khoPF/xI94CwJbUXHUkCmNX1lwX2xcC3
	moi7mrM9oVL1PAQQYaAy+/PQCu0zACdW+lCXkbHesWqD1TP8ZWtYi0jPkqFKYhCm
	VjRoXcFFZq6sylv4soN/MMy38eXRZXZ/3HgmVw2KCAfUl9I792+Tu+TrY9pEUr4o
	DHAX0l5Ih7GW3qzXOkSRBjBd4MmKb2yaV//FnDi6aHLHvql3zNL1qNhluf4pNgS7
	nSVtgWP0ByPAS6mkuylN2s9A2WEaVsMk4lSCykRNXQ9nb4Ajb3RwStekqOdZH4OQ
	wf0gh8uGJ3A0cCNTAHKO/Pd6vWuXk4jez1V7Ckf7g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4fmja301cf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Sat, 25 Jul 2026 01:04:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVj/5uywowUmJBukxVIUPhoM6ZDmyMbetvkqfWzGXEvhi2HYv93ZAmjXidkGpXvSBTRNIgTjr/Ww/jVOE3immlQuQwdWPFmaSfwCQHngAvi7HlrdiZPSuaynNmnhRlIkzLM+/MuMb4ZywLfzwqUCeYECXiW5kIoV9It6qyNGlYwo156WvE93UJRJfTCjLS00vaHrNyM72SC0A0x9KpjhS0Q7mKcb1gaoPlPnZ4N89ubwFvGTO7Y1BgdvC6ml22uSqdwHSiwqd2MJxar3OUibDqdpPlBKxQfKcGx8cCCjYZ9M0TuWwfUIhfS4zLzGaednew8OKdi52Qn5+ooRk8Jspg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9rBoZ3NmjZ98JKxqhu/fcW/FqF7Mh54ZeVdFt59XEg=;
 b=h6BQapT+9b8aruQdVaqfmsENEocelIfbkblYa8m1CjxOVwSLSiWa52VyuPhVM7mVstMnMCCVC/OCfnhjBSgLBYoEgcOSCtShkmrvX+L/EYYcZec3E8op3PyykEs9qCFfRRYyiS+iAu1rFHWHAQ2CYvVa9r6eEqqzvV76USVLhMVo5J7ie6bKCcwX8uqrOk/AQukOttlRneHh0TsqUR0L+uhuqGkfcy9nkrYrjq93Goa0H/8VSfQdsTuWEnF4hJycRKsKFU8+cPWs0RgRo4MXLRK5VwTZtsJ31cNK4oaLac8DfMDjwGVN8FfZYM+TQwFvXTwjXcJyu6jB+V+qQ+XY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BY5PR13MB3651.namprd13.prod.outlook.com (2603:10b6:a03:22e::19)
 by CH3PR13MB6699.namprd13.prod.outlook.com (2603:10b6:610:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Sat, 25 Jul
 2026 01:04:25 +0000
Received: from BY5PR13MB3651.namprd13.prod.outlook.com
 ([fe80::a413:78a3:24c7:39bf]) by BY5PR13MB3651.namprd13.prod.outlook.com
 ([fe80::a413:78a3:24c7:39bf%4]) with mapi id 15.21.0245.010; Sat, 25 Jul 2026
 01:04:25 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Embedded Linux mailing list <linux-embedded@vger.kernel.org>
Subject: Reminder of July 2026 Boot time SIG meeting
Thread-Topic: Reminder of July 2026 Boot time SIG meeting
Thread-Index: Ad0b0R1HV3R/XrXISwuzeuvdvxGI/w==
Date: Sat, 25 Jul 2026 01:04:25 +0000
Message-ID:
 <BY5PR13MB3651478F507308B80B5575A9FDCE2@BY5PR13MB3651.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR13MB3651:EE_|CH3PR13MB6699:EE_
x-ms-office365-filtering-correlation-id: 496abfb2-5faa-464e-a986-08dee9e8ab8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|1800799024|38070700021|11063799006|56012099006|10067099003|18002099003;
x-microsoft-antispam-message-info:
 2RWbHYSM1p5AEDKt0QFOOtheBdQyta0tZ1LZyVkYi4qvI2OJU/1zTgwOcCLvwtaxwZ/1qXErxBPqDTPXop0NFKICnAB8nkgCp9f0pJEQKwhkpiDVnn+eIkYonfAHbTybPs0As2cvpabIcWnPBsffH7wOP3UoDVJ++Zsz5fkS6jzPfGXivL0yaJfk2XrrI4SxGuIzsj0KYksIEHRBIquKd+/E3juOIioA0uNQZG2XuLUk0AQBOnpfY3lTN9n/p9iMassNbxIpv/su7P3Mx3ca59IXzeGL+evnaX7XIPHxdXAA4pdZlLSFWkaR8VIz4+cpece1omkQxVwJ7IzVK20mG7OkXT3lQlRRMnQ8Am/+Q9hdPiCIgFd/r0OfCcJNuEzuqijKvKp6aGbLJR0bqNTH6jKX/5iPHUf4A2wLsjSiJYCARqz00nZg/TG1+6kcn/UbmC5B3r/jtiThnExe/fQl8AzyNGqG+NJEZySNsNla68OtZORGcZIUNqWWXVph5X2mcwkLMACRbbNpwXegj7dCx6ar8u/wrLnQQ+wqPOfvUZC8I9TUbH4NmY/uB4M6Rns4C8/xYuwo5fHo74Pgw1RKwxqlJJ+O+Bs2BmPZj962G9wYJltCGH++YoggNWqOvoV9oSq/JwFcvhqWHxsqA+I0wHEnNiyETNNOm9pm2KhPD38=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR13MB3651.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(1800799024)(38070700021)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVhYa0NIbzlBdk1wVXBNaEhDYlBqVEVJQjBOalg5Rk5VSWVOem9kaTJ2WXh6?=
 =?utf-8?B?SFBkTkRjb2Q2ZmNkRzQ0VFY3UXFxZ3FZekVTM2N4YzEzT21nbk8zNEorZWxR?=
 =?utf-8?B?SGs4OW56NTZuMUJZSFdyWkJDck1SbEpsOXhiT3NjVWxLZFFkRmp2RkNaenMv?=
 =?utf-8?B?WFlnLzNlaU04YzRFMVQ4cnVjR2h0YU8ydWx0WGZIQWpyVVdkcjI0WnZaTmRM?=
 =?utf-8?B?anNVdnB2NTcvUUJpYzl3a0c5ZU9YV0M3eVdOLy9HR3ZRSFd6a0szODdzcDRK?=
 =?utf-8?B?MVR3NkdFSUFoZmJ6bm1CZWY3UDduSzZiY1U4TXRManI0dzNTeXQzb0tXNjVO?=
 =?utf-8?B?VEdZY1JlVXIrUitBVi9vclVUT1owRFgzT1NpcUVJOE44OTk3TjlTS1VUbUlo?=
 =?utf-8?B?a2ZoclVjN05ucGo5dGNrM0pJOGU2Vm8zRStYcDFVSDJrOWNMaGEvVUlmNWkx?=
 =?utf-8?B?VWQvZXdvZ1VrWWF6dG1TcHQzcGhyM1RqRmRNWlFsbGhyb1llYXZPWjlaZ0NS?=
 =?utf-8?B?U3A1TkdiMWJpR0NkY1pJK1l6M3BBVE1rc1dqWmdobDh4WVg4dVZMRndsVTdq?=
 =?utf-8?B?VXd6VjA0eEd1bngvb0dJLzBtNS9QbEpTNGFkMjBDZXZ3dDRQWTVWVjE1UFVP?=
 =?utf-8?B?eDFna0hCTlM0cEtXUVlCVjZaS1NNY1ltQUh0Q0dpZXdTbFI1YlBBd3V0Y05p?=
 =?utf-8?B?YVJrNXM1c2RRd0Z0YnIwSXM0a1NZejRvemNqaTBhQTBoQTJoRXFHcE9pUjZC?=
 =?utf-8?B?UThNbXVLSXlhZmVkODZpbjYxdG5wTG5LTGdSQ0FTUldkZklxU3Q3ZTRUNUVw?=
 =?utf-8?B?VjBGRE1hcDJrcFpwQmhtOSsrYzJDR1FxQmd4Y3ptSGFReldpTXVRb0dSOStq?=
 =?utf-8?B?RDBUYkFtMHMxWWxzTmxzbzQwWTNOMjBPV2N3aktTSUE1S2RZTmc2ajdUZXVz?=
 =?utf-8?B?MU1LbWtwb3lVd3J3enZvOG8xamo4UjlMZGd4dHUxdDVUNGVEUDQ4NFg1VHBn?=
 =?utf-8?B?WlREL2R3U1NyTkdqbCs2Qy9LQXRiTzFaYjU2VkpuVzFDcEQ0MFdJZ21FaElN?=
 =?utf-8?B?OXdLY0xDM1NKbWJiREhlZUNYV3c5RkR5aXlxNVRuL2VwdmtpN0JlN29iUEZS?=
 =?utf-8?B?SEdSdmlSQmpVbTV5cXI0NTFFNkdnaEl5dytHMXFOMjdQYmlhdm93T3d6Mngx?=
 =?utf-8?B?OFJVSC8yMG5KNk1UcHFJQlV6ZGZoUWVnRkRtQW5JMUNnMGpQSStNV1dhYlE4?=
 =?utf-8?B?Z3B4WkozeEc0WDhOTlo2UHVzSTdxY1pyUXBIQWxXU2dtd0FYbGFpSW9GekJK?=
 =?utf-8?B?ZWkxWGRTdDdOcFAzbENzakw2NmNScDM2Zk52ZzZlSGpBcnFPblBHRW1rTHFV?=
 =?utf-8?B?V1dwMXQ5akg4ZkR0NUFwQ0FLdWpSalgrcjhNdzhnSURZTC9zYXp5d2xpcVhM?=
 =?utf-8?B?U3NkaGZoSUFkM0xKWi93eVhiTzhCRUhWWHFSRTduYXNoZThvc3BqM09NNThm?=
 =?utf-8?B?RFk4aEhLT3BmRkpGVVcvNnVYWWdBbkVaTUFSNmlyQUEybW5pVXlrbExLUEhP?=
 =?utf-8?B?TlZqdnQwTUtMYmgyeHBXZzlTNWdJb1hFVFRFREE1WlloM1Q3YU02S2FsckpB?=
 =?utf-8?B?SmVwYXRrWVlXTEkvRGVnTEJoK005U1hqVnVleXFxWVVxcklaanFSR3NKRnRz?=
 =?utf-8?B?czVVajJpNDlzbGNmZGNTODdPZVlMUGxyYmh0QWM5ZWJGZGRGL1JhR3liT1pT?=
 =?utf-8?B?V0pUR095NFVLYmRqTTQvZHo3eUJSK3V2aXE0OFRZT1VJTUFYM3RLc1A2cFRj?=
 =?utf-8?B?VlVNa011Sk96NWVJTzFVT2ltVTlyU2hPNmxWeUU3WFhWbEdhcXViNTdpT1o1?=
 =?utf-8?B?VVFwcERzVkp6UjZnYitoTWRJWTdFbkVkZjJzcyttS3NBMGxNMkNaWEdMRGsz?=
 =?utf-8?B?MDl4YWU4Ukh3RGNmVDZOcSt4YkZLamJKcDY0cStLbVdocjJlemx0ZXRaa0p3?=
 =?utf-8?B?Z3JJeWxNa3IzYXJ3Y3QwWEtRUnVMZkx3ZzJnMC9nSDI0T1lKM2NWcHc0aXUz?=
 =?utf-8?B?L2dtekdmN3pScm9IREc4NlMvYnE1ZmRyOTNSMFJrNjQwSDJFQlppWFhSeVZh?=
 =?utf-8?B?RjFJa0tRR295ZWJyWm9wWjFlK1UxRC9YZ2l2Sk5kczhSY2Q4NjVDWFptNHBw?=
 =?utf-8?B?K01YT2hnZjRWZy83b2NjY3MxNkVUQnNzcmEwZDA5ekhCQUxQa2hCMVp3NUx0?=
 =?utf-8?B?WDZVSnUrMFZNQ3Jyd04wcnRSSDBWYWw3elZENXZIQ0JTOHZyTU44R3BvTlVL?=
 =?utf-8?B?V3VNY3o1L1FHbGdWV3EvaUtaK0lDNkgxWkgrUVVSYTJXQitucmVSVEc1d050?=
 =?utf-8?Q?ouJ4Fl4FHxqmlKhwRpCxhYAnvmttKjqw35FjW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	R02u2WaIL3o/kswoTNJj3N4z42u2/mY6SfiOjHY/c3D72TJG3HOj8XM5fn2LhCe1CiVoqbRphAOnBqcJ1whcMB6wNVIFvGRwuhzZJQ3jN4+y/5JbTQqotD5L/1ZTEQlCE6HQCRViyVrCTYZNQvxMzKVn83ObmoQisJXS3Yz5EBBdpt95vYVtCTGDVpYFZYWCrNiI+AKwAbz0durfi52ZuzyzwQP0DLh0UnPOh9Ti0R92dSmLIrjCOOXAvIHCAhgyXJHu1MZsIxgBFXI+n1Pa9F3+8hmOEA4phZJwRJZBeXYS0KKPLNy3DnA3U8wq4FYBATFkVVpDbl4X66vNr3r2Ng==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KhuNDDJ8v4NNlU+SISpaGG+v+5EJq1y0gTl37evEJ4sh3t8LzX/1Kg4+JSVexgMrh5RU97hI8w8EsNI0TosyrUUZPP8PnpKdkcDtoRPLfotGxAy8S30WiHKszyRbaU8BEC31Hfgloop+DxO2hOAlqQkSM2x2wnGkBbly3STuVPObwgnxqSvCoPNjMCMAxEaErNyWT0uDAraB5/t5GJDWu905dUwFQRh0aLjJFBtdO+sGzM+yjDB/iDyJrfvwwudS0sYC823H2rMtpWAGCAmg+CvaxBi4QqQPIwNeRWlMpa00H4ncL86zlHGdZ8wJDzpkSqglGjjP+TTcvN3ArnPQBEmYBDiamSWwKnmZd6DixcK3zb7wjOKxuufLqFxhXL1zs6qG7Ceu0QVWnC6BVR+1PXshZK4GfmJtNbFc4eW5cJGL0aAfPzXU5MS2lo1zOsYCjxtNRMoSfXSjP3fOoo/AHryEmFWoohT4dq/9GCQOY29z1qrtZTpEdWpb7Fzw0W8Ct17kNKNw9fIwVfmxmM8zaxE8gp1RuaCwOab5q1aXH8w8G9PmHM6qhC4Rjq1X6HucZimxTsaJiipHeHyahcaRsDOeqp3e24YvQvyx4D9Ie3VT1v+c6GpTNQ4XT2Biuxur
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB3651.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496abfb2-5faa-464e-a986-08dee9e8ab8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2026 01:04:25.2297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LJ6L6UsD83rzAS5fgizzG1+LMHG+YzCa1DWy8Wh3WfNFbRkC5ercjAPidODDGUGqG039DJ/E5Wmhg09Y3oVwlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR13MB6699
X-Authority-Analysis: v=2.4 cv=MoViLWae c=1 sm=1 tr=0 ts=6a640b9d cx=c_pps
 a=zHP1L1ZDY46t+2XtVYLmoA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=I_Y4LlEPCAdqsIK1J1Zo:22 a=NiL0GWOVAAAA:8
 a=nXA5WNwiAAAA:8 a=2iSxh-PlAAAA:20 a=wro9PZ2lU5UfSe5mHM4A:9 a=QEXdDO2ut3YA:10
 a=fGr-7aqQv4RST94IA8XU:22
X-Proofpoint-GUID: MM50wNIAuCfTzQBQVjUc5EgJYaCwcH8F
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDAwNyBTYWx0ZWRfX9xTQTtE6njuE
 YGpZF856eY3xIHD/mHKN50LXZ31ilXtNYUeYT/PtLke9yls0LRQ19/SLDTKqRXb1g/Iq4xkRFDA
 fgfdZdL9OzOSnb6fogoShwL5r/gM9h+zl8kIxxThw8hp2KEGbOj6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDAwNyBTYWx0ZWRfX0WYM46c8ZicW
 In/BjENlFPBIyVSXnx6bgCrEEdHb/kg4FYYnjOq/HtIOrS3NEfWhq/WPrAc+po1JVb8AYwjRJdi
 pecZFv+bjgvj0gMh/PAr8itOtwGeJIkGy8hcG2ArmICTG/jg+0Eh05Ysoyx3irpsq/WUlal6RK2
 u3keiWsSdd4ak7tx2+G2CuRkthI7Wg4QQGkNgshZM5TZf3K7/UnVEIBYVB52d+eovtUJV8zJNFD
 f6ac2M7rF9V2jmYFPqq4B/fVx0n+Mq0QnSUKVklJy+V+jZF6o4rIm5BJkbxS36UHOZrPB5Lv2iM
 8W7DJgs1yC7M8AYP9d/ZleGAMl1TCf8qsv96It9FsGxYEKVuJ6Abj66iaVHzAhuUdy7W+Ie8Z8F
 Fs9sXQV1N8A4mlFAmml4WAhgGYPCTpGv/XhGOFmNfXXdjcoD5TuDmzzMqKH1axaHvPZS7WzDNw/
 9Xi7y3cw6QLh2PO92Vg==
X-Proofpoint-ORIG-GUID: MM50wNIAuCfTzQBQVjUc5EgJYaCwcH8F
X-Sony-Outbound-GUID: MM50wNIAuCfTzQBQVjUc5EgJYaCwcH8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_01,2026-07-24_02,2025-10-01_01

SGV5IExpbnV4IEJvb3QtVGltZSBTSUcgaW50ZXJlc3RlZCBwYXJ0aWVzIChhbmQgb3RoZXIgaW50
ZXJlc3RlZCBMaW51eCBrZXJuZWwgZGV2ZWxvcGVycyksDQoNCkhlcmUgaXMgdGhlIGluZm9ybWF0
aW9uIGZvciB0aGUgbmV4dCBMaW51eCBCb290LVRpbWUgU0lHIGNvbmZlcmVuY2UgY2FsbC4NCg0K
PT0gdGltZSBhbmQgZGF0ZQ0KT3VyIG5leHQgbWVldGluZyBpcyBUdWVzZGF5LCBKdWx5IDI4LCBh
dCA5OjAwIGFtIE1vdW50YWluIERheWxpZ2h0IFRpbWUuDQpTZWUgdGhpcyBsaW5rIGZvciBvdGhl
ciB0aW1lIHpvbmVzOg0KaHR0cHM6Ly93d3cudGltZWFuZGRhdGUuY29tL3dvcmxkY2xvY2svbWVl
dGluZ2RldGFpbHMuaHRtbD95ZWFyPTIwMjYmbW9udGg9MDcmZGF5PTI4JmhvdXI9MTUmbWluPTAm
c2VjPTAmcDE9MjIwJnAyPTEzNyZwMz0xOTUmcDQ9NzcxDQooVGhhdCBtYWtlcyBpdCA4OjAwIGFt
IFBhY2lmaWMsIDE1OjAwIFVUQywgMTc6MDAgQ0VTVCwgYW5kIDIwOjMwIElTVCkNCg0KPT0gY29u
bmVjdGlvbiBpbmZvIA0KVGhlIG1lZXRpbmcgd2lsbCBiZSBoZWxkIHZpYSB0aGUgSml0c2kgb25s
aW5lIG1lZXRpbmcgcGxhdGZvcm0uDQpUbyBKb2luIHRoZSBtZWV0aW5nIHZpYSB3ZWIsIGNsaWNr
IG9uOg0KaHR0cHM6Ly9tZWV0LmppdC5zaS9MaW51eEJvb3RUaW1lU0lHDQotLS0tDQoNCkknbSBw
bGFubmluZyBvbiAxIGhvdXIgZm9yIHRoaXMgbWVldGluZy4NCg0KPT0gYWdlbmRhDQpUaGUgYWdl
bmRhIGZvciB0aGUgbWVldGluZyAoYW5kIHdoZXJlIHdlJ2xsIGtlZXAgdGhlIG1pbnV0ZXMpIGlz
IGhlcmU6DQpodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVudC9kLzFYQXVmb1RUNlZWSk9U
TXpLTW96OFN5T3NzLUpBOUg0SjFfeVZYUXE1bU4wL2VkaXQ/dXNwPXNoYXJpbmcNCg0KVGhlIGFn
ZW5kYSBmb3IgdGhlIEp1bHkgbWVldGluZyB3aWxsIGJlIGF2YWlsYWJsZSBpbiB0aGUgYWJvdmUg
ZG9jdW1lbnQgYmVmb3JlIHRoZSBjYWxsLg0KLg0KQXMgdXN1YWwsIHdlJ2xsIGRvIGEgcmV2aWV3
IG9mIHBhdGNoZXMgaW4gcHJvZ3Jlc3MsIGFzIHdlbGwgYXMgZ2V0IHN0YXR1cyB1cGRhdGVzIG9u
DQpzdHVmZiB0aGF0IHBlb3BsZSBhcmUgd29ya2luZyBvbi4NCg0KSWYgeW91IHdvdWxkIGxpa2Ug
dG8gYWRkIHNvbWV0aGluZyB0byB0aGUgYWdlbmRhLCBwbGVhc2UgcmVzcG9uZCB0byB0aGlzIGVt
YWlsDQpvciBjb250YWN0IG1lIGRpcmVjdGx5Lg0KDQpJIGxvb2sgZm9yd2FyZCB0byB0YWxraW5n
IHRvIHlvdSBpbiB0aGUgbWVldGluZy4NCg0KVGhhbmtzLA0KIC0tIFRpbQ0K
