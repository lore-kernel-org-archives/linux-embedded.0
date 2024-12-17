Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7731FAA
	for <linux-embedded@vger.kernel.org>; Tue, 17 Dec 2024 04:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734410946; cv=fail; b=WHANq71zbNC0YMHiy/VPq58YxVUeCfgNS99X713TdtCWZfnYEXo68tRNPOisv6O8A+JgNKZzU0u4b8JIBQRPj3RIeOYM0t+nLzVUhZ49ZAdZZ18GVJ+5Ci9rYfdZoqbDINM7FdPrf5ylOs1oCSGHS0wzBXV1eY0IGXB/WwFIqGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734410946; c=relaxed/simple;
	bh=5fWkYTk00VNewp0yL/bCdjH37Gza5ZuweYEi64XE6CQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pfoliG5V6LFwZryck4qWf9fdi81770WlexFAwnmLiWyVlOpceiuGiIEOwWshl02H6OCxOyUob4NNZvL7VKD3G/qSIJVtMCqPGlSpkXERWLAVDAvTs8stk/RT0cgAVThE6feYh+tqGqBYJgm9Ru+hl5Le2GqjoqNy7dGuRMr0IG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=fCaNAO4B; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="fCaNAO4B"
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH4jGkf012155;
	Tue, 17 Dec 2024 04:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=ga36LxmCZuFTCSC58Bl+EPix5NgAZ
	tQVmEUBxbXH82M=; b=fCaNAO4BiDem2XMR13g4wmvwJAXpfpBkIkq0ACHop5XS3
	GBgg8C279zKnISgFhM3YPxBDRpZhN2P3/PoJg10rPmGx8RfR+ikSZov4Uv578uFO
	PRYJvznthWdVD7pg/F8dpIYxMeNLWO9U0K87wzAMjolX3PbhaGaAqa4W4b6CkJXu
	KJjCI+jqpBwirXXxkRMd111QcDZt8hP8240PEBhDqK90I3PBHGFHld7MS8+8CH0K
	PwBmeXo+lXRk+N0xuB/UzXtPb1DX5HYIUZPv/k/o5OSysUKI7r0BFiAz2iJAx2H2
	bJU4XVf51ilfjNxt3kKZy8Hhakni8TxVIYAfyr79A==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 43h0k3j6ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 04:48:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MatzBJ9dV+zl90T+I+Zs99kAtLNsVSS4qQ+HvX2k3QB156r3AHG4Q7V2Y5GTG2jgmdqfOYGrsoPIH2FULmq/dzjezSiLvwdGNiMSsilfxwcwm18NhQIbi8zp4mja5+mqbC8fqYXC9eEDfEWWb7nGxdFTjhPYrsaAvURSYd3ks/rpiV9sZ4Iz2EhXT+XdLWn1n+U73U0H6I/GGQtSBfGs0G6rC3Mp/9O7/WvTYDyA9tFbR9qZVvX+98gZRAkjnCk79MTV2mI5R6+KJ+LTuo5tSOoTsMsrxfYlvBrs0tYTeDnoQAzKrkPhzQzPN9JiJc0gmo2t18+LcSH9H2o83ehcww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ga36LxmCZuFTCSC58Bl+EPix5NgAZtQVmEUBxbXH82M=;
 b=D6ChYQIpWlE7f68ynDOT3L3O54ZwHPd7goebRVRW8VJey8M5xos3Nf5hh4lAy8AGDxshKGuDEOcveIFtm/9WXh9qwB5E2T7t+p/308/pBJyqo3AKgdUry+BfXDsCtLMsy7FZoGaDxbSO7RgYcVkP7i5bAR21BlfAVHwadGscmQMt9+ZeukGCAMIJ99HkVnmXk9eDeHKf/xbqa7hVpaEgtSxCUamIqo3py/E6A6Gacko8EVuvxknT6pKOftg8HXXNjyCtHTd42djfxbjjwxBiTe5TjaodlKZLqqTLq9j0XD3d3WkAgfbr+hZTtG3vOZXxfC0d5/xE5Np0phPFP3TPaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by MW4PR13MB5937.namprd13.prod.outlook.com (2603:10b6:303:1b5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Tue, 17 Dec
 2024 04:48:32 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%7]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 04:48:31 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
CC: "khasim@ti.com" <khasim@ti.com>
Subject: Dec 17 - Next Boot-Time SIG meeting
Thread-Topic: Dec 17 - Next Boot-Time SIG meeting
Thread-Index: AdtQPi8o3s3FSLW3Tk6njBD6wIDHKw==
Date: Tue, 17 Dec 2024 04:48:31 +0000
Message-ID:
 <MW5PR13MB56326570980A91F6A77472EDFD042@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|MW4PR13MB5937:EE_
x-ms-office365-filtering-correlation-id: 9568d86c-5777-45b2-b07d-08dd1e560e91
x-proofpoint-id: d8690225-876f-412f-87c6-a7cb45557a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?RvfzohgCDxNf0RkM/mtPiI/EGlA64jKFN/8tPm9sHWL1sIF+p7q1THMu4aT0?=
 =?us-ascii?Q?r0Jq0+FXqS5UTH9a9qFZpKM54nZuGn1TS2N8jBsXQzGon031Zuk/wvFg28/K?=
 =?us-ascii?Q?YK9Sa2Ea+l+sQOIPW2qXK9EvbE6esurgYwqEwaUbkeY8YuEa7SCJpxWii4OV?=
 =?us-ascii?Q?8fSQMQkym0Oo6VADhrg2WHbJW3aVFZVDMe6qe6wIeYRtnQO2ShKyejsZt/XL?=
 =?us-ascii?Q?fvDw0p3p51nVjCgTYhlRmnTjy1T90yhXMW84SsrAmHsvavkHMv/2mfZXmiMj?=
 =?us-ascii?Q?+ilztWSHNtvcesrjgkHdf2bu+Cm243SZInpZZHTFM/NaTLO+qMJsTPgis8i8?=
 =?us-ascii?Q?lw18liN5HNiF3LloXjSOzO4o5sYhmI6KQePaaZ+S6dEoACCowxBcjQw6Em3T?=
 =?us-ascii?Q?aw66hiHRKG3CZp+gCICqqjciFSm0qc7YMppjZu3OaMl5XQy+AWnJjRgwdIP8?=
 =?us-ascii?Q?pUXQLfD0byDaoQwT9oWIBac1QHXLkfCCea0IFtS0UHUxnPABI+WKRkk4Slez?=
 =?us-ascii?Q?QT4U2gSzU4aBrpxgB+XLVeFJxyj8grq/iJVSV7lKB5H+rPzsnAoVPBY9Jdvz?=
 =?us-ascii?Q?jx3fN176v9WEGUcu161px951aC/wQ41J8UDk/ohbTOkzV29WtmtA8JeK+/JT?=
 =?us-ascii?Q?qNJgQjJlQMKeY1hDY39LxVRLDPDhbBjOn3o5wA4J1By//aUzCdnDc4fjy8JA?=
 =?us-ascii?Q?BaYLbPr2frpVqOp/vt2BE+kcufQLY8/zyndlmZoeMYpY0YW7xXlODIIu2Dcu?=
 =?us-ascii?Q?k5KuNVSXzGeoiFqQ8sRl/N8iUsX9c36PpHO2t6xAN2qo2EEV70uJZsODJUfA?=
 =?us-ascii?Q?ePzsKBn3QE66mm8ooBfBL8EO8wo/H/x0wNtF2UnNni8LTaytpH+BX2tQeB5B?=
 =?us-ascii?Q?5TuOjlnFYASvXG4aRGvYjtdkoPWNoEzVqCaSCFhvpsxA0Pyppy4uLCBEk4C1?=
 =?us-ascii?Q?ot0ovyImOo3vxolRY1LsiO/1plC0s4jOVW3t4Rnt2gnKYyTCngvfe4Yg0E8u?=
 =?us-ascii?Q?EpC80zoTzuAp08YNM+OGeppMBjkv8l9yUQq4lMoxqUB7BCmdnLab6sieo0gf?=
 =?us-ascii?Q?Pjm92gpA9QmyOPm8h1k4SPIVeyNSq0dyBD7bttzbRpIYZQv0i+RNoVji8lvD?=
 =?us-ascii?Q?fd8PNytNfYI/gsx7Qk6BUSNgqvjuDUevl9kSajc1lkoNX+P2KmumEVGHbXyr?=
 =?us-ascii?Q?iOci3VBqbc0csEeFSoromq8MaMpNw4S/EVTH5ihcLGrZkU1fSSz+ltz5bs34?=
 =?us-ascii?Q?hDg7Kb+RSdSP2R8rHP47SQx0FvtdTlb5HsfUbxmKIP87J6VmmRUhUPHnMjUQ?=
 =?us-ascii?Q?slc8Oq51UKZ825Kfo6gNOWukGQ4zmGZpOMknOWjFC6S2MnaqQu1tTBqnPLnp?=
 =?us-ascii?Q?rAFyUSBq7lNWoa9SYiRsBQXa6rEG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jD12gNZF2jGTAcN2PkKhpOP6mDXsjbT1AXr71GUtrLbn3BttokZIzPpgaUGf?=
 =?us-ascii?Q?wz6NOPlEENjnVbAQAM1jo9vYsKGVhvfRCpswGtHReSZ6ZyWq4OItt6KdeUmc?=
 =?us-ascii?Q?ys8ZC+g+JDKtyoWWUrXjqa3/beustS3oFdGru+G8eNfXbMn49TZpHI0xvhiR?=
 =?us-ascii?Q?3fas7wOgc8vKTRZezpoPzmSRd8TCLUlXF4EAIc+o/3cN6qbq8dOxFhO/ZkXf?=
 =?us-ascii?Q?2dathUI1ApEHCw0xJGHJgMTu1BWJKtvDkBQwpy7VwBv7kZwTlnac//4+7JgA?=
 =?us-ascii?Q?GKcESPVqAmQ0icsxxKrreS1K4IR4reuuozJ29bbjrKoKbjlljaSTMmP5K3HZ?=
 =?us-ascii?Q?iOOpQ7Ik0KYqFXRYrZGYovOdGaS7T4PrgU5vNxZ0eYrzU7+8Imbp21iaN8VW?=
 =?us-ascii?Q?g0P+lBMx1EQNIjkSp0lFNLW95Ytsjbo3MvEP0QsafnMFK/oDF6HyMQZhgCmp?=
 =?us-ascii?Q?9RxA38TbNj6HY+KJmeP8lg+7TuC+VHJfp5OafUtcjqkPb8GKuiITNJAzUApN?=
 =?us-ascii?Q?DiNNfpiruRWQCN9NzzF//Gn5eWxyUsfYcZS8dIFvLp1tV3I1qrFqKiY+hbL+?=
 =?us-ascii?Q?k2BPHvHAkWAUtt0neubcWmMXTz/wXVAI8sY0eZfI0Kap63VlvcTmlILkecRu?=
 =?us-ascii?Q?y9S6una+idItBZRgpeGbGc3iPAmn8i8H8OyEHq9AfXYGIDnYdeNFWiRdrBse?=
 =?us-ascii?Q?bKETcZrm64LsW702hzXCeoXCxXenMe+BBZWBEGe/hg4bylwcfIrjXBKoyjE/?=
 =?us-ascii?Q?1rbTd882D3/ZMUdSdIzlgeCfuMfjX/10l+UXB+mCgsh9zsbwC/aVwzJLBTdh?=
 =?us-ascii?Q?utI8Zu9u1IZ9WSImyvV5PIflZ23+Z0137lzUFoWcsbmWeR8m48coY1z9JdD7?=
 =?us-ascii?Q?twZa8ypg4ULWxslfsG87F0dq8HjGb9aenXOjt/4TdlG4WslkOWKve72P+bEo?=
 =?us-ascii?Q?I5eVkikzA6jxz5sIRG0hBBFS/73h4a52QVRnfV3D6sfIoXF+sY7LVdSPgFIK?=
 =?us-ascii?Q?cv6JGE3JncExk1I3BI/pbhcI7XQTKZEUocrKfTSJgWxOu8FLaqdhabU3fPXV?=
 =?us-ascii?Q?Ck96rBzQiKFxQ2elsVlBqaZXafxW7CFIfORrM9p99D0EBbGpsApN5P1mXK7R?=
 =?us-ascii?Q?d6uexvpDRXgQOJNVf4QZkK6hqAzxJuDjh3V7xTaoDAZ0CTBySOt4pJurr3MM?=
 =?us-ascii?Q?JoXxV7hmNNA/4jrYS3s3J33Aph5rHr9C1/PTlk/fT1w/WCNjtRs7izmexvJW?=
 =?us-ascii?Q?1x0IFLb3eIiLpvVi9TGzo4J5/0q5ten14Ye1uK2+OOWBqEw2mbY2Eo6GsylW?=
 =?us-ascii?Q?td80GA8KKlAXYv4gi/id0S3guYigx3v1m3vgda/TLAoRS48zrAm2UwMyTH9/?=
 =?us-ascii?Q?RHZdIxLXulS2myljuwPJ9Gu4yJ4KejKLVOuuT0iqTHURZUyM3Va91EJyraCD?=
 =?us-ascii?Q?WhJvrGbyoQ1z/IKqtHSwapYQTqtbixTFPkIPE+k+5MEKn9HWrYmVALjmxq9H?=
 =?us-ascii?Q?/g8fuQDV53kMi7z5P98YmNi4fNhhZyZMhwb70AZV1s594sFO2gSO/pvj1WZ/?=
 =?us-ascii?Q?3oJ2YcdHJw9zsR6QlPw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TMRuhJKyqGW/3FCd6oZQmXY0VJc0My8jPn5t9mrziITXVFW/3DzBIhJkgYMnD/UylFvfgtvZ+Q5lUHNYAlrqme6oOUDv9SVQ64XW4mbpLuLMkZSgpTDlD3dep2adicb1904dnAxyolraPkvPmfQM323N52Lk8xk6wit9oFqOuRlZ18hNJVsNYI1OZsPO4COJp7A8kqYKp+rv5BwHG3A8qGqR8JciNjhpLDuOvTR4M1/1mqojtnMOJo0zXgF5LepD8kdPd3dEs1yk1RmOlajbe005vL/whOq8MwEChx4i2s5KZIR+PoRWbC6RMRxYtM8dBopUmiI+jPtCJYU9yqnkIZOw3NmylUsQdFmnpraySk3uJJVZQtS6JZcP+LP3rSAY4h29NLVpEEBRkyb299gBmXn3qChqyVsHU5INGf8RyoLLbvIKaHWxepBvuZFZICHy+nsDwcCzzH9KgN9oRC0qmZ0FwgrijI3qs1L9GZsnrbbszLP6pQv24gKWBHeFrjeyrxKkb7ranbR4pNBk94Bo219I01A9Aq2eVpVy68nrR9Ego1k0W/p4Q6tItwDXGbXl2dnwu1eVLRMpNknP8wt1tf6O/yJ8oWqFXFq1fobw3lxMozdo5e0uCkNlaFL0uUIp
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9568d86c-5777-45b2-b07d-08dd1e560e91
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 04:48:31.6819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LlFCDA4oVoi0M2OrunPZJvM/D4rx+E4/eJwq29BZ6dX0csfSFw9hSrJkik0u9x6tJH6/win/wnXQ9oyrgzri7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR13MB5937
X-Proofpoint-GUID: Ri_qPty1ybOXW0EIAwpnREJEfzYu_5C7
X-Proofpoint-ORIG-GUID: Ri_qPty1ybOXW0EIAwpnREJEfzYu_5C7
X-Sony-Outbound-GUID: Ri_qPty1ybOXW0EIAwpnREJEfzYu_5C7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-17_01,2024-12-16_01,2024-11-22_01

Hey Linux Boot-Time SIG interested parties,

Here is the information for the next Linux Boot-Time SIG conference call.

The meeting will be held via the Jitsi online meeting platform.
To Join the meeting via web, click on:
https://meet.jit.si/LinuxBootTimeSIG

----
Our next meeting is Tuesday, December 17, at 9:00 am Mountain Time.
See this link for other time zones:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2024&mont=
h=3D12&day=3D17&hour=3D16&min=3D0&sec=3D0&p1=3D220&p2=3D137&p3=3D195&p4=3D7=
71

(That makes it 8:00 am Pacific, 16:00 UTC, 17:00 CET, and 21:30 IST)

I'm planning on 1 hour for this meeting.

The agenda for the meeting (and where we'll keep the minutes) is here:
https://docs.google.com/document/d/1XAufoTT6VVJOTMzKMoz8SyOss-JA9H4J1_yVXQq=
5mN0/edit?usp=3Dsharing

The agenda for the Dec. 17 meeting is:
--------
Topics:
  - Round-table of completed or ongoing work
    - Francesco Valla's analyze-initcall-debug.py script
    - Work on the Boot Time wiki (section of elinux wiki) https://elinux.or=
g/Boot_Time
    - Status of the Boot Time Data wiki (on birdcloud.org) https://birdclou=
d.org/boot-time/Boot_Data
       - Tim Bird's grab-boot-data.sh
       - Boot Region processor
    - What are people working on?
       - In particular, are there any patches in flight?
       - Status of RedHat boot time work?
       - Status of Texas Instruments boot time work?
       - Anyone else?
  - Review of project ideas
    - See https://elinux.org/Boot_Time_Project_Ideas
  - Review of action items
    - Write a white paper or presentation with a mission statement
    - Mission Proposal:

The Linux Boot Time Special Interest Group exists to make it easier
for embedded Linux developers to meet requirements of quickly
booting and resuming Linux systems.  To support this, the SIG
develops documentation, instrumentation, tests, tools and technology
(changes to the Linux kernel), that enable developers to minimize Linux
boot time.  The goal is not just to optimize Linux for a single particular
use case, but to make information and technology available that
will enable the ongoing ability to configure and tune the boot time for
Linux-based systems, to meet the needs of a variety of use cases where
quick booting is a required or desirable feature.

  - Engaging more developers
    - Not many people have run my data gathering tool - how can I get data =
for more systems?
  - Next meeting - Jan 28th?
    - proposed periodicity- 1 month (tentatively the 4th Tuesday of every m=
onth?)
--------

The meeting is open to anyone.

Please prepare for the meeting by reading the mission statement (above), an=
d being
reading to comment on it.  Also, if you have done any work on boot time in =
the last
year, or are actively working on it, please be prepared to comment on it du=
ring the meeting.

I look forward to talking with you.
 -- Tim

P.S. As a reminder, the wiki for the SIG is at: https://elinux.org/Boot_Tim=
e

