Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F97F21A447
	for <linux-embedded@vger.kernel.org>; Sat, 25 Apr 2026 20:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777147651; cv=fail; b=LZpCGSHi6ZuhuAl7izZowpxZYsgDJ41BaJzREbmoSpzDh3sY5tCzF86xkJvJEbmBOVtDMT8PRay9PY2MjyJmMOlOrZo+O/tUNsV4N7pRMIDeYckO0CnJlwr2EV06DfazIZSExTzY8C1AbbD4blCJMgM413If9d3W3OBpV87GEvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777147651; c=relaxed/simple;
	bh=04Vtre6IPizyEExHKxyTyiUbFm09TwBR2LN1jVbeuD0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bJFEpJCizpw1+NBPZ9c4svHOjddaUMdSZx8b1JfXQkTfbjjSdwGfAYzAVaHydCYtlqg68a7xKnUko1cYVEKUr42miK6Uwp9pdzgPTyb41Sfcn7joak5RyM+YuOnKS9dEJmE9FWJ9EJF/ZgFsGsNQPNsX4nFGX5wNsBQeAKplbUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=IR78tUKi; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="IR78tUKi"
Received: from pps.filterd (m0209321.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63PK7LRj889034;
	Sat, 25 Apr 2026 20:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=p1; bh=04Vtre6IPizyEExHKxyTyiUbFm09T
	wBR2LN1jVbeuD0=; b=IR78tUKi3h6IrjQ6fnHbrdrH8shcYXYwS01nT2zNtzXEa
	c33CovVXGp5SJO3+c5oDZp9zfO67cyoBH/KOAQ7QHlVskkc+MY6zZo7DL3jcF2WB
	LTHSlC00m3IJ17QvSCkChdy4E9B0dEnWWYFwi2jDu8RLmJlG9lPmwIA8Hn3gJzzC
	NukeOv/xz8XRSw9BtraeSRX5tcfQT7i3zPFAwdz1QtCFyl7FaUDuJq9wRAYo4hdL
	3hcnNXhLLMDi4L/UJb9BDVGWaocxyJNGfxcjoSGw4OEwHZ4AXDqnpT55bZwHOo1P
	yQfHQ7GoflVzP05CMNM+2LySMIHo8cUpFPbWPjVHA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4drk12rhn5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Sat, 25 Apr 2026 20:07:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtI+jQYBDO8ABLUviXSrVTip2/g5Wy74aqx6f8PqeExODaPFqRcpcZG9SudMQNVunFTtCVfc49RIWXMv1CXISKl4sQhwtDZk4rXu1Fn7r1WgeJ50OkKh+BQ+K0kzpdz6VMUr1H49Oerqrosa5DHWZhpYAsKyQ/8h248IWWCSR2S9lUllEAkqHm+qAFbWlmJP3rlzXqVI9R/Mwo45FZmX205yAmq9O0VIxdcThiQq4aSLBP156HBne6W1jvIIRSN8A3eXsDx//rymIDtnPwKz1X4SiqnUnlPaBOujo5lMA73LkmgM21OTgeVPjfW+A7tvJXFIsfi/k48gIh1p6ExoGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04Vtre6IPizyEExHKxyTyiUbFm09TwBR2LN1jVbeuD0=;
 b=KutsOedMcOvb+ZcdYYJPyBB6uRUGaFlC39jDktG0bLhBesSxvCi5F4Zs7FYl4OCp4u8RqCVAniZlYYwaaVhCGFPV1S953sw7um9yYB8pbptsP5m8FPu6/UYqRANxsT8xVmAGma0zVymGYFpaEvzRqiaLq5Yv+yUYb/VxjJQ/l+II/UIdHX/kTASbIDZhC09C/YOJh6FuT6YREWwHFwKCqaGUpnWA0jpqBQYhhsOiDB8JM4yIMqQyae8N6JhANFyFIomd4334pFZkTT0Z7nviFGGay/Mr+kqs+ffrj1Jf1TT7kXKf9GNe3LCHotITzsV8tmqdAoSi92VcO1ws1c02vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by BY5PR13MB3745.namprd13.prod.outlook.com (2603:10b6:a03:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.24; Sat, 25 Apr
 2026 20:07:15 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%3]) with mapi id 15.20.9846.022; Sat, 25 Apr 2026
 20:07:14 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: Reminder of Boot-Time SIG meeting (April 28, 2026)
Thread-Topic: Reminder of Boot-Time SIG meeting (April 28, 2026)
Thread-Index: AdzU7nz+NimaI9/+QM+YKjTwGpBdNw==
Date: Sat, 25 Apr 2026 20:07:14 +0000
Message-ID:
 <MW5PR13MB563285A916D228417998D1E1FD282@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|BY5PR13MB3745:EE_
x-ms-office365-filtering-correlation-id: cfa85e4a-2a87-4af3-9dd3-08dea3063e7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|18002099003|38070700021|56012099003;
x-microsoft-antispam-message-info:
 wbx94gb43HBISxGjRKsCcsjFUi6c3A3G0aSj5WCU542kkisJGWh1KZ/azTD89z8IT8kr1DjqqDh1PWQh0l6innJNngnpsw/xmA4VO1tZazoGxade0sdZa/uyhsnUHisCfIMZMgMAEyQ+CB1GTlxl+uyMVGyACQ+Bl8jAgr0H4isF6G6LEA8tOFvW1x2huC109C3ONZ0S8tUK2hJQYbKw3c6P0QSArUIlKZ3OLPKot/gKrcJRUPvpcwcIk27n0DUsgN0Ij6lOjdVij1tu8TpRPd6WWpXw3YuTqO9jH1jVVuACTa/KhNUMZScI3EVtLWetkhQfFmjpGjeJmTYQHTP7VMhqm5ctFJKd9NhCMvcl1dkOOUGq6Wqm8fFTUAe+rGO2P9czuB1vdVAXXfZ4AHlceQRsRfKEIFfter/7+eST3QkJrJQ0Isyr53xI6qOKWY5LUodj9topdjW5mB6QvQ9VXdZEmSEjiw6Muacsyto6TWS0y93Oc7do00PI/AXd66nvO1A41R0C6gg73MWN+Im1ELG628BPmM+GX3+IMzOuI53FMVU1OVlzgQetjeDMk2Txsh0NeV2MUxb5ZH6XKravWaq1Ejl5B9taR12YhOaktrwbrAMeCLjVr34pgy1esAeCS6NTFPB5/pk9D7xC2Wxuj4ihcVv/UfUro2skBvkKTucuhXfSuIl9IoULV7vKEA19cxYmWCpnIYQBW8aIjRpRJ9HZ3FEA/WC3tqxHdyHTSEkVvjiSyaZ+vol5RS9fLscR
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(18002099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkdkcGRDb2trdVRORlZidnBBYnMrbExyeFA3TjBvNHlGMGNqaUtyS0FIM21H?=
 =?utf-8?B?VERNNmhMdEVra0p1aGg5WXY3enhNK3Ezd3ZUSWEyb3VIazZxOW41RzI2TndE?=
 =?utf-8?B?Vnlwem1OLytQbUdnMUtkWnFybnpLYmRJWS9XUWlTaktYT2x3cm00TG9XNGta?=
 =?utf-8?B?SkQwdmo4cjByYTRSRnFVSUlVblFaT2ZuT3IwdVFpelF5Ymt4bGR0NzltUzdZ?=
 =?utf-8?B?T1hxYnIyd3E2RWpvV3FRUjJlTi9pb1Y2MUg1VXBGVnNScTNXSnBFU3EyVUJh?=
 =?utf-8?B?KzdLWWRFaTh1QlArbi9ydjllQWV1S1BCM3FYK2kvaEN0cHp1MzJKWWRnd1Rp?=
 =?utf-8?B?M3IyR3pwMmtkS0RvWDRjcVZxWkdMVnJXNk0wREZob2FJaUlFVFNLMGVwM0lu?=
 =?utf-8?B?RHpXMjhOMkVUZnkwTFpXdmpDSzc1V1BlQkROdDRKU0NudWlWMXordW5hYlFt?=
 =?utf-8?B?TVp4ZVJtVHQ0d2l4UEtHOWFKZGFhVEFTZ2pCL0FYdTBycENWbERPWWwvVVBu?=
 =?utf-8?B?MEJISGxJM29WNXNkTC84TENtN0VuWjlHa1FJY3puRk10TDd1WE1helhkM3Yy?=
 =?utf-8?B?ZCtud0NVb3VvaEJLYTNEV0t3emdvNE5BWmxncHorQ1RWbkhFc21VVy90TFJH?=
 =?utf-8?B?NW1rR3NJRGlualZocC9ndEh5SzRDU1RZOVdzYXRSZkdBWmlnL1dPSy9VTVJX?=
 =?utf-8?B?TzU0QUFsbmlqYmRBNmJEekkvTEFaazljTDNndVdpL3QyTUpxRjhNOTR0RkNP?=
 =?utf-8?B?bTVva0I0UFZDa2cxUjFyTzM2ekNDalFBUDhvTkZSUEkvekhuVmRxeUM1M0Q4?=
 =?utf-8?B?U29kT0VRRGJFK1dUSENZbkVNVCtUMnpUSmpneVMyRi84Um45RHkxbGI5MFAx?=
 =?utf-8?B?MjRzWmU5Y0Q2ZWNSanNJMEpSTW16S0hzZDZkMXhTSi95L2RMOWVCNjJHbzJk?=
 =?utf-8?B?K2JDNmh3azlkNkdLZ1B2REtEcklkOExmQzRPdU1NUkl2VS9ZMnZGNkdHeEtt?=
 =?utf-8?B?YjUxK2EzODl4NWFVS2srRXdqbmgrSm1ZcDI0QTgrU1RTbkl1VDRNSVY1Rzhl?=
 =?utf-8?B?cFhJblVUV01POXRINDE2N2t0ODVKQTV5MldEbGRXT1RuZmpOWFBwVTY0N2dX?=
 =?utf-8?B?a2NDR0RZcDRhWXF5T0FwUmw2Zmk3NzBQN1VVUjNqQm5zeU04emR1VUNDR0hr?=
 =?utf-8?B?c01yNzVyZnNFMTlFT2FMZ0hrWWR1anRQRG9UKzl4b2k5M0liOWJrb0ZsQlhZ?=
 =?utf-8?B?SHFSWFNxVzBuckRTL3RIRWs5TGFUZ2UzNiszKzFZdXZla3NwRm1UVmhEZDNF?=
 =?utf-8?B?N3N3ekh5bEFOSjhhTWlTVnl4WnZMTXJFbSsrSVhETEtSK3UvNS9CaEpXMlVK?=
 =?utf-8?B?QzdVZ3Y5UFRoN1p6TEdMS3V2amRzajJUeGVBdzJTMlpaeG04dG4wcHk3K3BI?=
 =?utf-8?B?ZHZ6RU9PTGtPejBSMU5tZm41OXBqYitvc0FObUZDbnQzRE9TcmFwOVZWekZW?=
 =?utf-8?B?U0FkcDdIVHNtS042eGM4QWtKZjV0emUyb1lWT2p1clkxcUxDQUUzU29oTVEr?=
 =?utf-8?B?UTRlK3VCMUdQYnd1MVUydkd5UU1RZ0YyMnBxR2M0ZDYxeE1pWDF5WGNlMmRU?=
 =?utf-8?B?M3krVm1hcU14QStXZ0JxbitXOXNiUGp1dW5tTVdjQUxianBOeUhucXV0Zkl4?=
 =?utf-8?B?TTd5NkJ5UnZFNnlKUm1HMlFQNUdtNnN5TWgzT0N3Mm9kZyt5V1JGckNoMjVs?=
 =?utf-8?B?TFRkMVhoVk1Jcm1IU2NNYUdlTHpCUXpRNU1CU3A2ZitoOEtZTEUyV0lXMkxq?=
 =?utf-8?B?eU9jc0hiRmR0RUlaMFljTWVZS3lHS1BsbVd3NE1tbTYzNkpRUTIwVnV2dzBa?=
 =?utf-8?B?eStHS051L3VnMFJ2bFJqS0NtK3lRU0NldUpLcFc0QVpWUm5wSEFvRmpXWlBh?=
 =?utf-8?B?eHVoT2VDc0Vmc3FqMDFTZktiOVdZUDBmWmcrTXoyejdFZytaNFE0WnIvZ0Ev?=
 =?utf-8?B?UG5LWDY0NEgwWk4xTnlEK3RjaC90RHppck1LeWd6ZFc5TCtHT1hKaGtOZVY2?=
 =?utf-8?B?ays0eGIyY05vUVRyMG0ycDArVTRLMW1adFRUK3NxTHM5U1B2YVJVaWcrQnc0?=
 =?utf-8?B?THNBcEtXZzZHdXhxdXhWWTNFOTBRMm50bXAwYTh1c3JoeUliQzg1K2Q5QmFD?=
 =?utf-8?B?aGJ0VlFHUW9YcTRQdGxsVHBibWh3TW9BMEd5NHhxdloxWGtwdTBURlFMYmJK?=
 =?utf-8?B?ejltclFVdjVCOGIrOXorSjdpM1ZTbEgrL3lwNzhIY0YvdzhLeEdhT3IyZDNL?=
 =?utf-8?B?SWpyYjlEMCszV2g2WFFYMzBVY3krNFB6K2ltZEMwTnowQUx0VmJWZjYrODd2?=
 =?utf-8?Q?sQktbs3wKS2TCB7pCuuK+WeZkxBPmAaNwd7UZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	GgqFGyn/stTbhIP0VjE3cuS8yMpR2TGdHzuJBPq6ZtglCGQWV4h1h04UVqREVQ5n++T555yiAdu1QyXTUXOmN6aidjkMjG4QIWLSvgX5M7SXL+HyioWxUPyz1L+Te6r8s+H+d9AB1FoyhUwIKwwidN7qR9JZ978zFLF1y8anooU4v21W5kqrq6iHEBxNZjJrpMMgHCSv/0Dt6FwVnNbFOY2f3Bkb9+R9am5qf+VqvMWRJvJxXqFgQrdeK6hsmyM5hklS1ycaHexijkTPWo9oSzlStONnFLJzF09TunCW9Dzj94jBzenO6GZp2U6Ryak3FlM+yFmoruK9mbkKYSEx4Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6B7pKLhOp1s5bNYQNjpEn/wns3ckUKXH7shI25d8YiVq1qDZhYBybOQUsoq1HoTdDn2vSqBSbW78Pkzr28B3Vb9/zCKEyyt6WYCmApQOf9lGUpT/CFAhp6tL6GIctLXNQ8vZt23OcvffgunCish7bn3n+YR4SulkGZYPhu9Fc9xWPenpwO6HjoS3RqhOdmEQ5y6VEfWJMAk49phlUhhKtmWR5XP3+pVv/XR/ivx+jdpJHZv0D+OCCSm3mp3hpVZ2fXSitwvD+cxAnFUgRUXQ9rNFnndKGvOhLhRcB7c2bL0qj2iAb9681AblhuLi2p1eNrs4jmzeLVqydJFXbjHp+YxXFf90CctYDX9G/4bXp7iBRNJm4mNwwLxVrwMh8n25K3MDVuTlbydsTzNXjuY/e436C25QsBrgEcafVUkIeFDBitt2kYMv0AFs2kc6vFTwJUqvNoGVLeGIEhtHQ33kHCMKSwP0UG05+Y1csBGffQIQfiw0GIkJKKbVoqTS7BP4G+i/U5UGrQkMwXfBArOWaqq+9H4bOPnw1ZSoR6TDfmDqGSp+Y2XSSUfdSaWCIIakWxZmQCzXRv9FnSOTkAUKAP9/1LYytL0C+arios5neeTi3+1jQBgSG264GQN4W1Um
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa85e4a-2a87-4af3-9dd3-08dea3063e7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2026 20:07:14.6152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F/TyaebGbgieZgjSdcvA4N1kOuxwI4vxby7KUOX7glHWr0ntLv4MEGqYAHpSlPaQ5g14qeJ2x1ye9TJRr+VWjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB3745
X-Proofpoint-GUID: G2UVTRdy69WJnSX4vqfIhH_HNh5eWlWB
X-Authority-Analysis: v=2.4 cv=Z9Tc2nRA c=1 sm=1 tr=0 ts=69ed1ef8 cx=c_pps
 a=z4Cvy7J80qD6KqIazgzwmw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=M2bq-ooH9SiLYa4vvubY:22 a=nXA5WNwiAAAA:8
 a=NiL0GWOVAAAA:8 a=2iSxh-PlAAAA:20 a=HZN-5cM-O2QQ2VkYsA8A:9 a=QEXdDO2ut3YA:10
 a=fGr-7aqQv4RST94IA8XU:22
X-Proofpoint-ORIG-GUID: G2UVTRdy69WJnSX4vqfIhH_HNh5eWlWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDIxMSBTYWx0ZWRfX09TnRXvPYMiB
 wyJ6kgoFO2SGDzlhmhGJylSWhlcwABoY8H4396uf6LMH3sWgrTobn2yKoBxJqDOC9VBdPIurZPn
 jbVnTfgMND1I7kaRXf9BwJ74dRcAqKndp5lGoRPvsE+xJAlt7nFbAw8Q719minGA83iVB1IW3vp
 EMef6N8myiY3itiw9pBOuYoyB1ado9v0Z7LigDkKcVdUma8+FSnNymuxOv5M45h39Bn4OPIIQjf
 NzCs3L52xaJSFbGWRmUbNBKmjH/0glceVq3TPCLtAk679ZQRNSg8X8PaG5WdEfFLYPTj7l3BFAR
 n58ek3ukiYdWou6pWtTIaA66JP88qIZieYu2xHjjioeIWlRtR9oVYFkt7XEjD8kVYgcU/pqnubv
 ypIXyu1/wFStQDcESF3y3A3JfaWFby3yOb/DugPvu35A3Yvpk/T224kahmw4lugI+1JfuQiLG3h
 WNw6vmVIvb7VFnFi3fw==
X-Sony-Outbound-GUID: G2UVTRdy69WJnSX4vqfIhH_HNh5eWlWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_05,2026-04-21_02,2025-10-01_01

SGV5IExpbnV4IEJvb3QtVGltZSBTSUcgaW50ZXJlc3RlZCBwYXJ0aWVzIChhbmQgb3RoZXIgaW50
ZXJlc3RlZCBMaW51eCBrZXJuZWwgZGV2ZWxvcGVycyksDQoNCkhlcmUgaXMgdGhlIGluZm9ybWF0
aW9uIGZvciB0aGUgbmV4dCBMaW51eCBCb290LVRpbWUgU0lHIGNvbmZlcmVuY2UgY2FsbC4NCg0K
VGhlIG1lZXRpbmcgd2lsbCBiZSBoZWxkIHZpYSB0aGUgSml0c2kgb25saW5lIG1lZXRpbmcgcGxh
dGZvcm0uDQpUbyBKb2luIHRoZSBtZWV0aW5nIHZpYSB3ZWIsIGNsaWNrIG9uOg0KaHR0cHM6Ly9t
ZWV0LmppdC5zaS9MaW51eEJvb3RUaW1lU0lHDQoNCi0tLS0NCk91ciBuZXh0IG1lZXRpbmcgaXMg
VHVlc2RheSwgQXByaWwgMjgsIGF0IDk6MDAgYW0gTW91bnRhaW4gRGF5bGlnaHQgVGltZS4NClNl
ZSB0aGlzIGxpbmsgZm9yIG90aGVyIHRpbWUgem9uZXM6DQpodHRwczovL3d3dy50aW1lYW5kZGF0
ZS5jb20vd29ybGRjbG9jay9tZWV0aW5nZGV0YWlscy5odG1sP3llYXI9MjAyNiZtb250aD0wNCZk
YXk9MjgmaG91cj0xNSZtaW49MCZzZWM9MCZwMT0yMjAmcDI9MTM3JnAzPTE5NSZwND03NzENCihU
aGF0IG1ha2VzIGl0IDg6MDAgYW0gUGFjaWZpYywgMTU6MDAgVVRDLCAxNzowMCBDRVNULCBhbmQg
MjA6MzAgSVNUKQ0KDQpJJ20gcGxhbm5pbmcgb24gMSBob3VyIGZvciB0aGlzIG1lZXRpbmcuDQoN
ClRoZSBhZ2VuZGEgZm9yIHRoZSBtZWV0aW5nIChhbmQgd2hlcmUgd2UnbGwga2VlcCB0aGUgbWlu
dXRlcykgaXMgaGVyZToNCmh0dHBzOi8vZG9jcy5nb29nbGUuY29tL2RvY3VtZW50L2QvMVhBdWZv
VFQ2VlZKT1RNektNb3o4U3lPc3MtSkE5SDRKMV95VlhRcTVtTjAvZWRpdD91c3A9c2hhcmluZw0K
DQpUaGUgYWdlbmRhIGZvciB0aGUgQXByaWwgbWVldGluZyB3aWxsIGJlIGF2YWlsYWJsZSBpbiB0
aGUgYWJvdmUgZG9jdW1lbnQgYmVmb3JlIHRoZSBjYWxsLg0KDQpBcyB1c3VhbCwgd2UnbGwgZG8g
YSByZXZpZXcgb2YgcGF0Y2hlcyBpbiBwcm9ncmVzcywgYXMgd2VsbCBhcyBkaXNjdXNzIHRoZSBm
b2xsb3dpbmcgdG9waWNzOg0KIC0gVS1Cb290IEZhbGNvbiBNb2RlDQogLSBCb290LXRpbWUgdHVu
aW5nIHdpemFyZA0KDQpJZiB5b3UgaGF2ZSBpdGVtcyB5b3UnZCBsaWtlIHRvIGFkZCB0byB0aGUg
YWdlbmRhLCBwbGVhc2UgbGV0IG1lIGtub3cuDQooUGxlYXNlIGUtbWFpbCBtZSBhbmQvb3IgcHV0
IHRoZW0gaW4gdGhlIGRvY3VtZW50LikNCg0KSSBsb29rIGZvcndhcmQgdG8gdGFsa2luZyB0byB5
b3UgdGhlbi4NCg0KVGhhbmtzLA0KIC0tIFRpbQ0K
