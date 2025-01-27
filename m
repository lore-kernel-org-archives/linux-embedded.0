Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF18194091;
	Mon, 27 Jan 2025 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738017826; cv=fail; b=Qgxy97FlC8HgSBmtidV2dHgs6iJ2+w91ZCdMuvJekVJncuPJLgjLiKJTLk0/S9TJangS8QDGZkZw4blbfwPkzTk+TslEF6XUgNAkiOkxLCP1Y9ClZow8BIRGTq4XAX6tFvZNKUZ6o08uSm0NK6kcaf0friG2Eiw9PKdX+aQT9kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738017826; c=relaxed/simple;
	bh=SIVU93F1aYyR+9kkyCpofHp/5ugRnZhRAwouv/QcHSk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ohjp/5YKGyHJ+52xS8lnn9LEJxqhySgU3HTfTPqgPIsNXj6Omsg3qWl17iyy2TTIfCQmYmKVzAphov3z3YJcuXNkL16HgHkAilmhyu7CN0AU5kCT8kBGPHkDDEGZrPnNdtHREFiqDY+Ajq4tuHewUZnH1FnjxGNi7Pc1mq2yeKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=g9/6/tjn; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="g9/6/tjn"
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RM0XZP027427;
	Mon, 27 Jan 2025 22:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=8YAPCQMw+FguverZlkDUYywJ/bIws
	elEeTmFUH45PnM=; b=g9/6/tjnAByymS21yJthZtEzhXlnLyvZ0hB1/5QYcQMZM
	tNu+0tTcLJxTl4DUp3dSlDdhlzk9pknNlkR8d1N+2SqxarMI+oMJLuUjm+LcbFrV
	RGOSQ3da05ew9O2nzfa1gxndVBEziYVLvfz6hyK+qbVzgKWMmRQ7wnjyxbNh4kiB
	1nyUftYbHPyz01XOmRIBRhtZsf84gUGVnptROMml88GHAhAxRlfn7vJ/8q8RzGg/
	ot2SJjmO22L6uXwZkAjzLmOfCUPpOBZiVx9UxmWBG579nvjr6q2ifIrBVnY2v4UP
	UkBqKPy/0UI4JNvpp9Ntg5fJiE74L19lh92kl5GyQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 44cph39s9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 22:14:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhZhIxiwIhqMYuaEOYdFcJu3x3D8zq7iPAkcsyqRaZYuj2xrshaqXZ2XQ31WxE0i3nkD91Jx32JLFvFhabS7108XubTKZmxb7zcmjPZ1Tqh3WGacYeTeXfkS34WlYOT/AjEqxG0/1kyV4lykKnqJWdFO/H78xt78MEUZYuaOU+1Wp6oeW5qQeVZIupqCCx04KP3F9eAuiG8kqHLpscdTrvgR3nnigsEMBjVPlDd5MPfDN8HKPe3oKaQXAhzl6GAQFRHcJ8yLhMBbw4xmV8CcAZcv7N3wNciq1scHauFQb9I44A3TpGNiMZsyqJedtY1UrNqIkR12eO/N81ys72PhNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YAPCQMw+FguverZlkDUYywJ/bIwselEeTmFUH45PnM=;
 b=MS/gumOIQob45qkADVXjmsZ22ebS0rmS0fFe/mHspV//88vKPq8Xos4Gid0h2JR2PecD3nnOo09cRGz8g2vi7o6H9lskz4xXekhqQ3fxCI9fGRy/9tvwiYi/3/4Iy51xghjsc1QxfOcby7Mm94QZqvG4Zx2LJRSihHF7yvqV0kms4AUFyG2iITk+D3skTe8Jox9rHWVc+lVOCjhe2by+31RFi2qA3+HllWwszsHyiymZBmFl35AQMDkJsTtNwK4d/F0EvPDnnobFXaJf//+RiyFbJRZdBvkJh89iwhHzRoLWsZnO06KEDdjr+WPcZgVCAou97JN7gz1Ua8HUK1s17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by IA2PR13MB6586.namprd13.prod.outlook.com (2603:10b6:208:4b4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Mon, 27 Jan
 2025 22:14:17 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 22:14:17 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Reminder for January 28 Boot-time SIG meeting
Thread-Topic: Reminder for January 28 Boot-time SIG meeting
Thread-Index: AdtxB9M4qvBaThm1QKeqFqylUGHTYw==
Date: Mon, 27 Jan 2025 22:14:17 +0000
Message-ID:
 <MW5PR13MB5632661DFB3A7CCEF3D20AB0FDEC2@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|IA2PR13MB6586:EE_
x-ms-office365-filtering-correlation-id: eaf4bfc2-1f03-4264-f377-08dd3f1ff0e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?x6qnuH6aC30XZ9k2K63rm1MHlgEVcfuarHswlWGMul1h8BIfMS2yqxFv5yNU?=
 =?us-ascii?Q?eWwA8YloEFfVT1FQ9N0WYrvQ0bpqvghjRzYvmR79Ktk127TItE0xZ6kNn+B0?=
 =?us-ascii?Q?SbeP6YzU+K0fr1GAGnY+a6J6lElwVb8EVh6pVYwC+GRtnfRfMpYzoVujl3A0?=
 =?us-ascii?Q?QSJv5bwLnrYBJ73ZxCzqioM7nt9BUTifm2uwhQM5HqtcnZmJPn1RCF4DiNc4?=
 =?us-ascii?Q?ViYanmZGQ3kOMZ4GLGd35JekLhSDi6VX+UDkmvhhOwP16X4oYdzc7ZIleu3h?=
 =?us-ascii?Q?FqWBRF2T6xV+5f4KjNXabGTstzULR63WL3/YC05D0SrKUnk+3yxswbME8E4e?=
 =?us-ascii?Q?NPCOT9Sc3+pJpHh2E6dFoLr4XMeQ4HQ8KM7yQhs/dKC/qvAEtJKvbvvG9QwP?=
 =?us-ascii?Q?lOX1N8JMidRsNCnbuFBMmlpEaev+V2amk4eYnyHQ2657lnL1ex9Uti7agwtn?=
 =?us-ascii?Q?VtZzqHTTC+TTEpJ4C6qexJEhVFF95lttCKx6d08nbqKHobiMshwnKHIPGX66?=
 =?us-ascii?Q?jq3wJfllGevKPD02LwKo7K09cUFJM2YLx+LjtFGJa6I+HIx98tcnBosrNFNx?=
 =?us-ascii?Q?BjEAjAafFJN/pPii+hdy3abP00PPgHSCsD9DedvLIatHtWZpR2VvrVISwR6m?=
 =?us-ascii?Q?PoUN5mgQiNc/F4vsfNcTe8astlWwV32N/Q10q9IhtU+RmC+dUlUb1w7Y34O6?=
 =?us-ascii?Q?lGfQ7iuKnZxH2uKIZtUR+kUiOu3IcMUxcgKyNOP+wPHp938IkLN5+HWsvQtC?=
 =?us-ascii?Q?Mz7MDLY0X+K5zbZ4FsubTBuf6QrVq0GP8HBqf/23aNoFtN1UM65OD69WO0ku?=
 =?us-ascii?Q?mIT1+v+7dfSugeuVAhtaqqLiQDQifNvTs5WtIevyD8mt1IcW+FUD8zydFYYV?=
 =?us-ascii?Q?1JcXW5jpGjrjhZ63MEpR8d5T5LPx7B98eh24f8LlgHYgIApfzqsevZsAvCJu?=
 =?us-ascii?Q?N9l6ILIQ0oDnLmr66Z8E5VMnawwaWk8sVVuHZ6egTBQtBPGeEbhh4JvqSUKM?=
 =?us-ascii?Q?pgii0UOTsr8GyhFnsGe6FPFGdd95UMezWpgX1jbDQJ/lgd22b7FlIDKgypvc?=
 =?us-ascii?Q?Vmon/roXEL4zR81B7tArWxp3tZkoIkkqbhyKa7l1pDCoh06Hxp7B+mzbu+59?=
 =?us-ascii?Q?zeNdu3BjHQ92LWBqLCLaIS4l/TqwaIVefv32yOlBnz7z/71BEsCeWmTelbnu?=
 =?us-ascii?Q?TXCvwhZWpuBItCm0mWmEjdepNbekakGAiA+/lnQDRWSn0Bs/j7gCVBR2cZmR?=
 =?us-ascii?Q?5E+vFrbGCnWOaYKYumdWIjgNacSEFObd8JGRm975l8shZ7GYBQt2CBYtBjuW?=
 =?us-ascii?Q?xQTI1JARzYJ8ZihwYYLuotCKwJPnLy07wNoK/9tg2HEIRmnMZJl3TfIeu+60?=
 =?us-ascii?Q?enY+XEyUum14z7vTjdvg/gJWPmqb?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?S3bCaIquDTHPR7TEP+o2KFKKp+HA4S7RAy81CocHCNyLPc7aPwPAB1QYccMP?=
 =?us-ascii?Q?9MCwzC/6g8r2bUC2CgDLM8S5D1J13oVzQaUl3KI5y3PV8uN6LejDxg/WqP5q?=
 =?us-ascii?Q?M0jBlGM053U/cccCnsVOzKi6KGWhzk6ySRbcSkc2B7TOhjF4+leyRQEvbJaP?=
 =?us-ascii?Q?QQuEJH4qpB/weIr515ahZNJD+2hATyGsmCyqXeHm4VIoHqN7Nq2IoKB7uP/2?=
 =?us-ascii?Q?yFERo8hH3xprd9xYLBROchZiuLMD4fDtjt7CWWe4JFjxRpv1NIsO0AQc7wpf?=
 =?us-ascii?Q?16x58+t5pDK+nhgCrXc4bBK1u8zMj5TuH111kwK0g98w22NtUXsHb48aJa/W?=
 =?us-ascii?Q?5JvNkITsCAVIxa0YVrJuthwMXQSY/TrRPSbR3GBhNH6pXOQW3m54+LJvl9UB?=
 =?us-ascii?Q?/nb6YZaoXfusGndPv3Kwo9rADF2VpC//8PGkPYAyM2BpZ6CJvgdr3YlkFk+6?=
 =?us-ascii?Q?GarTPSVsaEMfTD5lxZEm+m1aX5X0fn4qJa3poQ3AyyWGYCtH+O10RFB7pvKS?=
 =?us-ascii?Q?+MRudL2GNILRthsKhRzi93GweUeAIz4onkmNeNxPLT8aBcqIQxBhaGGUvH7p?=
 =?us-ascii?Q?WYmzBwV1qhvWxItRzIYOUzJGXZwzgJBthuBUVk4P+uGn/2cmQK3aBX9E9OHF?=
 =?us-ascii?Q?bjs4gBxYzt83Q726ytqslMoMQAQ7aSxNcoCG4zxsDP6/APsqsqFYwgHkYQRb?=
 =?us-ascii?Q?UxxVoasJPZdt/Gm6Z7TfMERPZc4+y6+gIsCaxY4dXhxaPlD/mSQW529g8aEr?=
 =?us-ascii?Q?Dot7K9sVJ6XFbgyrLOYdLXPjo+vh2ZFBNZdSuYpgM7jAAa1E9dIPS54bDe53?=
 =?us-ascii?Q?mSTvPHI76qqf+E5wlY0Gyb+47RKa+UGMNMsiFDRFkBWSgsVwdNR3vuMDE/a2?=
 =?us-ascii?Q?3sQ1LKsNugdlWzfARxwr5QR502eVlmgF7Eknuht60tf8FqIrGOBWczj74Wy9?=
 =?us-ascii?Q?INJKPKCW9L4zpJDOF08uhZcnJgFiwur2Hl20Dor23wsnIGTZl14vv0GiaZfs?=
 =?us-ascii?Q?bL0B2CPCKBsrlBRLNJMAp0d50UkXaBSG1QbYnROb2cn0BBvLVXqsp+uB9bR1?=
 =?us-ascii?Q?v8MSSVcebz2RAg/85gMYwcelkkrZufCtCWEFeyq1GMkeHakz3HlWE7v87cyy?=
 =?us-ascii?Q?0Skz4KAWNyG/IyfyLAXhJs80uzJ91qMhMeoQCsVDxGxxaLj1fIj5Y8XJBFBd?=
 =?us-ascii?Q?+r2VC0IE1GuhHYrwLYqPOlOTBrHqAD3s/WVZV+8kNqBWsSuIhnCkLVDFDwtK?=
 =?us-ascii?Q?n06Pu5X6ECW+9Mqddb68LuVzWoN15IyLeyUUgaF3CuEhQUCFK1qnXaY4sgVW?=
 =?us-ascii?Q?ykOXYF2Yim/9BpBSNqjCKDN0wgpAeEbvIxdQwx9wFc9rn172i3Et36HfV2KJ?=
 =?us-ascii?Q?tyVU2EzDGo35+n9+JOxedeVm9SZVy2thtL/STZhlpdcb+wNrwrmRS3DXsm9E?=
 =?us-ascii?Q?5Mmp1njKpzykONsQBXyFFkrQf7Lo/inOF9uyA1bzcvXoux9vityfOUeH5euV?=
 =?us-ascii?Q?4pbPGj3Kv8EMfGFPs/5qsgJEn8Sz5JL/SXE5pcISWHT75J1d0CcwgU7Jtgor?=
 =?us-ascii?Q?2Hp6P7czXMtrYO0SLaU=3D?=
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
	vEc5YSurB9CzMG6lthK38X5/3P/eiOWptR28sS4y36MnQMyBfhvnR5GU4yNHiCoT4TuIcwOhkjSPCBpGCXbe2PONuVz2qs5Ms0COtXS8RSWE3xTsv/mQvYjIebkj6FE7U3S7cR7YEOBAWcxhNTNpRgLR8OzEOAOcalh+t4aFo5/qyucIGFmu2cCilvhqisiAs/5ma0k5XAViRnoAwTVZMYfz3yEUuxIyFPJSgHO9MVpWTYiWOhV31fgRzpFjvP0FO1ADOLRPYQTmorsK/IyZydA3N80at6VwbbVRq9Fm5FGZP6CTgrFMZTcLjTu6F+RGPTRl1ow9KFhC/LlJSckTuTW/Qsws1yHar+2aLk/7PjyxlHz8NFAREfsXawh3s1FPC05iyAg4+qnJR8My00v1v21W8kcA9CSSyKA9oGi3oukrMOMz+B54fC3FfhRcBtZc9ksATTLjc0FxzBN6Nixyh0JFZvCkQ0bwXu49rNELY+fOOnC6ZcNe7O87Bhq4AgvWZSk6aVjeLndCUpOTw0qB3LrbTT3wxMr61HVba+Iw5xH360jAk7M2BOFJjn+ATnufR4pIk6UvqmNdTtCYpKG97EQ2ync18pIJp1IrU+ksx61YjpnJsML8Hi+9xjYKdk2M
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf4bfc2-1f03-4264-f377-08dd3f1ff0e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 22:14:17.4068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sF/3pRKRNTu3BlyAzfmggiDb8xzvknEBTH5H2nMAm2nzZN/laEFUC+6SP4ILG15YF3Tv5V4rFIdHHicFtDRpJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR13MB6586
X-Proofpoint-GUID: 3z8g4x-e5x0vc2EGygjZeW-Kf3ydgqf6
X-Proofpoint-ORIG-GUID: 3z8g4x-e5x0vc2EGygjZeW-Kf3ydgqf6
X-Sony-Outbound-GUID: 3z8g4x-e5x0vc2EGygjZeW-Kf3ydgqf6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_10,2025-01-27_01,2024-11-22_01

Hey Linux Boot-Time SIG interested parties (and other interested Linux kern=
el developers),

Here is the information for the next Linux Boot-Time SIG conference call.
(I'm very sorry to only get this reminder out the day before the call.)

The meeting will be held via the Jitsi online meeting platform.
To Join the meeting via web, click on:
https://meet.jit.si/LinuxBootTimeSIG

----
Our next meeting is Tuesday, January 28, at 9:00 am Mountain Time.
See this link for other time zones:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2025&mont=
h=3D01&day=3D28&hour=3D16&min=3D0&sec=3D0&p1=3D220&p2=3D137&p3=3D195&p4=3D7=
71

(That makes it 8:00 am Pacific, 16:00 UTC, 17:00 CET, and 21:30 IST)

I'm planning on 1 hour for this meeting.

The agenda for the meeting (and where we'll keep the minutes) is here:
https://docs.google.com/document/d/1XAufoTT6VVJOTMzKMoz8SyOss-JA9H4J1_yVXQq=
5mN0/edit?usp=3Dsharing

The agenda for the Jan 28 meeting is:
--------
Topics:
  - Round-table of completed or ongoing work
    - Work on the Boot Time wiki (section of elinux wiki) https://elinux.or=
g/Boot_Time
       - Recent pages worked on:
          - https://elinux.org/Boot-Time_SIG
          - https://elinux.org/Boot_Time_Presentations
          - https://elinux.org/Static_Device_Nodes
          - https://elinux.org/Boot_Time_Project_Ideas
          - https://elinux.org/Disable_Console
          - https://elinux.org/Generic_timestamp_counting_Research
    - Status of the Boot Time Data wiki (on birdcloud.org) https://birdclou=
d.org/boot-time/Boot_Data
       - Boot Region processor
          - support for new reports: meta-data, diff
          - support for meta-data filtering (supported operators: '=3D', '!=
=3D', 'in' 'not in')
          - lots of linking between reports
       - some new pages:
          - https://birdcloud.org/boot-time/BootRegion_tests  (and sub-page=
s with different tests)
          - https://birdcloud.org/boot-time/DocProcessorBootRegion
          - https://birdcloud.org/boot-time/XPS13_Quiet_Analysis
          - https://birdcloud.org/boot-time/Beagleplay_Quiet_Analysis
          - https://birdcloud.org/boot-time/Boot-Time_Reference_Values
    - patches in flight:
       - init/main.c: print initcall level when initcall_debug is used (Fra=
ncesco Valla)
       - analyze-initcall-debug.py (Francesco Valla)
       - printk: Improve memory usage logging during boot (Geert Uytterhoev=
en)
       - boot-time: instrument probes more (Tim Bird)
    - work pending submission upstream:
       - show_delta version 2.0 (Tim Bird)
       - deferred initcalls (Tim Bird)
       - others?
    - CFP for ELC north America - deadline is Feb 16. (ELC is in Denver, Co=
lorado, June 23-25)
       - I would like a micro-conference on boot-time at the event - need f=
rom 3 to 6 talks or session ideas
       - Does anyone know if they'll be making a boot-time submission for t=
his event?
    - What are people working on?
       - In particular, are there any other patches in flight?
       - Status of RedHat boot time work?
       - Status of Texas Instruments boot time work?
          - Bootloader-initialized hardware?
       - Status of Qualcomm deferred memory init patch?
       - Anyone else?
   - Do we need a call or survey dedicated to use-case or requirements?
   - I would love to get a taxonomy document going with a review of existin=
g techniques
  - Review of project ideas
    - See https://elinux.org/Boot_Time_Project_Ideas
  - Review of action items
    - Write a white paper or presentation

  - Engaging more developers
    - Not many people have run my data gathering tool - how can I get data =
for more systems?
  - Next meeting - Feb 25th?
    - current periodicity =3D 1 month (tentatively the 4th Tuesday of every=
 month?)
--------

The meeting is open to anyone.

Please prepare for the meeting by reading the 'Boot-time SIG' page and the =
'Boot Time Project ideas'
page (mentioned above), and being ready to comment on them.  Also, if you h=
ave done any work on
boot time in the last year, or are actively working on it, please be prepar=
ed to comment on it during the meeting.

I look forward to talking with you.
 -- Tim
