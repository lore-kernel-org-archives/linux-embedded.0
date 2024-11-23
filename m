Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEA9A59
	for <linux-embedded@vger.kernel.org>; Sat, 23 Nov 2024 23:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732404930; cv=fail; b=nn1vL8vkWvgaJQ3KXkyIrLxQGTMUvEZ4JFRmbanPpAhxAndzwbQJFl+qhmSGZivbl4tnoUwKCR77+j02podgmx6tgcOFdfxcBFErPSdbAdMlcAu/bl9E2/M4PQTZ0SvHciJiJ8ZCS92xsmDqFDY0dyN75IW756Iu14oUXUH3ac4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732404930; c=relaxed/simple;
	bh=xlioyf7Y2/0CUHVESLylaRWZnp6A5NC0DwnegdCuwNI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TTZSQliBHXB8RRXTM/tyspnNxgd05mAsoWYcX4OSHCWtT7osfT93VWBvki/Fkvs5ho21EUvZVfBsWP0l06gT51mToe1w2fsMXwoUHEG3LFnEzUcTkkxhSXXG8QN/WQSVmnTB3G3uwl6oIDBr44wPjE0VkfUnr7ejGhnolV4Mafc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=fyidsUFi; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="fyidsUFi"
Received: from pps.filterd (m0209321.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ANNZKrB002280;
	Sat, 23 Nov 2024 23:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=xlioyf7
	Y2/0CUHVESLylaRWZnp6A5NC0DwnegdCuwNI=; b=fyidsUFiVP+e9aH8VgXjgG3
	/ZowKGtj5sCdS4cRyZdKL7oMRfNYEdcfuuAsQ87dpDJ6hEzFLoJyELGoZQ4eYYgm
	srw2rofmzbjMuClDV5LLr6FPbeRBePvhrVdoT8U9g59qi/ak6bbwrFIO5q7xWI5B
	xfxMecBGbUxz43+hRXqLBYYkB0Uuxraca0JXeem3LDbuYJ4Z2ee23Z/Ci6GB34TI
	CE7oDLCNaP6S4Lon+uC9vU7+Cz0/ReHxeailIYzBISOa2sNWDX21v4ONO77a44TW
	lH+wvhTkbBpxHGlBB6PJvkwMpeJlIwlTrBOtFgbZyTEYj+QWl35IxDOsM6g7+dg=
	=
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4334f10fkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Sat, 23 Nov 2024 23:35:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSLCLe+WcpCoN6FtzcCptCSCrJ+/ejDuabm1yu/ZkgTAg1X5CVEir0rtkJ4BCBQ1VCWF08kBbQQ/xcJgdV+UPfuCdE4GYzJMVI2Q8yFoPV6osGewc9BeLMFomjEjYZnsSaKaV8nuWa7jyOA0VlPREQ0NXbI44dwspXx/F1QGyvvwfWfXb6X7hp1IKTg6y7wMsGB/bfCqJd82DiUBKefQFbKV3ybq7Pw2pdnsYn9RQwqeFniF23V4uKdUkghBpZodN5QN0R1JqDuPQP2Ox2u1qFZVor0csvpoydvZHAm87qf9OLf+edSaAGIEVkqffeniTfvssAvvWzZxyvg23JkhyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlioyf7Y2/0CUHVESLylaRWZnp6A5NC0DwnegdCuwNI=;
 b=lxcScQfbbNn2Kbl+qNrLSfNNjbnp+gRB/0MeyRwimwAmrvPYd2TE2RV+gXvrY2wuryKanBUUJLYd2cIY3idL0asU0c1w41kS4i92qoPH8VSpv/vJ5TqaRVDYCnr8dF34fpnb+N7Jb5TfQvRfAf1Ni56ZLRDcQUwxzTJxTyxepELWKCzCQMWZqhMDTqkJbqDJXSHo0I8MmZG2hEklQpiSPBgNg4ykWGrdZX0yu37Su+/hS6ojot4EL7K9sPzR8SmkuHqqXh4PtZYd4bFBB34pAQDtXJbQi44jOrKtzu99+V5ZDplm60W8BMmvnz5Ff/xb8sPPCYW4zTgxYS5j7P4B7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by LV8PR13MB6744.namprd13.prod.outlook.com (2603:10b6:408:221::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Sat, 23 Nov
 2024 23:35:11 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%6]) with mapi id 15.20.8182.018; Sat, 23 Nov 2024
 23:35:10 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: RE: [boot-time] SIG organizing meeting
Thread-Topic: [boot-time] SIG organizing meeting
Thread-Index: AdsyNUUDzZQ/3++gT1+/YcIfOX+G7QLyQIqQ
Date: Sat, 23 Nov 2024 23:35:10 +0000
Message-ID:
 <MW5PR13MB5632E7C5AEDF8AAC82EF8192FD2C2@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <MW5PR13MB5632D59CC8D54682BE6EA092FD5D2@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To:
 <MW5PR13MB5632D59CC8D54682BE6EA092FD5D2@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|LV8PR13MB6744:EE_
x-ms-office365-filtering-correlation-id: feee722e-60a4-4493-f703-08dd0c1778c6
x-proofpoint-id: d8690225-876f-412f-87c6-a7cb45557a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Mqvoljfk1HZql4hbCZAsoJT6rIswQ65LCAoQp5b662Ucqh32hebQ++ywOuTZ?=
 =?us-ascii?Q?FZ4p0v4LXUwosMUDi1BJcCmWTvOTzRXkdirlvZfnduNXcXnOtqqMwVgB3nHf?=
 =?us-ascii?Q?GkUITtn8bujvuGA15Jm/B5+7shPb0z/E1+Utt2BiD5tZrVeg/7BNBxp8bjVb?=
 =?us-ascii?Q?ts1rGkKZE/BqdEKgngMf9+OIGfZi37+lQD6SDJfVI0C4+3IBvkwjL9B8eJtT?=
 =?us-ascii?Q?czmW40BomWObinLHlGIw/P8qEPDkFAukYh5FCfidY1xchk6lQx0reMnWEttc?=
 =?us-ascii?Q?OJWkhOj2cn0Ls+NVGhpgHMesVJcekLk/dbuDbw7xGRl+LrYQuFJWrE0ikAoT?=
 =?us-ascii?Q?uMIW9azcxa2jAyASxXyF1Z8cnlMFatURlsMn+pqXL8Ey/8wVFWmUvEfhS8or?=
 =?us-ascii?Q?ku4mgq8tAj9S/AtKGP6nTBpKeeSrj0exa1olmxAn2EkKIAQ66l9n8V5Xh+l6?=
 =?us-ascii?Q?xTgHvxWutfSRrurfBNuOfcM4LBj/GEVCYhntkMVzMeXm7wKvLLzwnS64gvXI?=
 =?us-ascii?Q?7ihqki0fwoarA2WvmYvLpJDohRPAWqRi1h9IvwRQYxIAVBbNl4YJc9jL5fbP?=
 =?us-ascii?Q?51cg7Y6wTQtRi3v+GX5qJdWp7Z43k4cgwuGKHQyal4T5yqzgj82+ZjRCjESC?=
 =?us-ascii?Q?aGfsJICd7SYRA27j4YNpI2iX/QTl55VG/nJnWL91sp1l0U0v+SliDzJeFRSe?=
 =?us-ascii?Q?+HG2ubIHzgoJhSnPc/4Y1FVvq5qOHI/6D2B9ttbBbAlwrefq3ITn93R3xUKx?=
 =?us-ascii?Q?3pMHCVtSJsrbCg+/hHykIZvzzwx63qFQLXn7dtJOfp47A+YilnQR3bsy9ti5?=
 =?us-ascii?Q?FrJyxcafpBogBLRRDCv/CrfdjgoMsT1UeTOxHeA4VK+ItzEJPn0utKcRiifz?=
 =?us-ascii?Q?rbgfok/sL27CL7a1oz9SJNxmMA99nx2O8dRQ5ahRLX1ojcVu9/dbQB2Zjo4/?=
 =?us-ascii?Q?z1wvFVZfDGPry9ZjY1tcJV2jbxjkRRjIdLeFIIts73ecGfOu12PHMJxQNNm7?=
 =?us-ascii?Q?yYn0kHQZNEsm0uFKBHBUvmLHSSMxKFK0XefKeVk8UL2nTzCV3MG/TqTfbUBh?=
 =?us-ascii?Q?L0og8UnL+86AaIN4hEqKx+QVNakFgOqOsKRwt/4y4B7mdnOrggHNW5Me7WOR?=
 =?us-ascii?Q?HT2xyN06Q2XWwp3iRG+un/m75Vaj8ycEWd57HikrkCfUb0b0khmhRDmlj943?=
 =?us-ascii?Q?tPwPy8gmPaxMC282Ew/FEAhO2LuMm3he8MFq/85c6pmRsyXjgsS9y91WgUH0?=
 =?us-ascii?Q?wj+8CWWsCwn9uV6f8uXNjFEaMVaDcpIrYIMBULGyH9TaP2WXtqR1tvpROqbt?=
 =?us-ascii?Q?aRB2z7X6H1QfzCpYrHAAQa/B8Zu7jQJXgEYYK/hY8zKMy8t8zikyl6vq8Hp/?=
 =?us-ascii?Q?klW4XcA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HIJHLXSmV88Kk2+aHVSObu0N+hvfeSMhwaF1QnpbAeinDUZPDGg83nkhOLbC?=
 =?us-ascii?Q?c5B9rk5Qyle9oZksrT1sqjJ5v6UagC7MheSoTlYjqRiUynxtrpcXLq3Z9oh8?=
 =?us-ascii?Q?Pu4ZBEjYFYSbpTADS6gSppoI2m/B9wlgFstwnWBlifDYme/Fgp0ckazW52eQ?=
 =?us-ascii?Q?BA/nbBXBSyMwMg5sQePToZ4PCJqXaksW2Bwruj3GVgFjxYhYPiGN6oJvkU2J?=
 =?us-ascii?Q?WP+aasAOJzBFcjfK7N/mEOOQ6Mr1uk0Gzw1VyFSYg2Fc0bLZXXbvGPhSluUR?=
 =?us-ascii?Q?Kiu/WprfnYPB8Jf/dem9EQzMjdvuLzgMzqHe7M/eMcqyFNAmnJaFP+bkvcTm?=
 =?us-ascii?Q?lByuJ0JwFTsdL2BJlGBagusdM2758vOd21S1U4OhIZKrt1dGAapD4QXjK1Tm?=
 =?us-ascii?Q?bgXUlcd3zrMpLgPQyzZiQ0WroR8RUH0S19D59/ALeCecKIhCWOg1v1DTQqZd?=
 =?us-ascii?Q?EKWNZlqqxXm8MnTh4GCxGvaxEdLgKetVvtrWpm6/XHCufcnUpcJ7o/nhnNSN?=
 =?us-ascii?Q?QXZyeivr1UPEg8PUsgbw+3kHpgnTND3qw/97gxGDAxFAaN7PCjOROSrdjRU+?=
 =?us-ascii?Q?q8BWvHEIuENjnuAIhYieWT/PiaBJ/ZT9LZ1EuBJvOJRvU2aBXoVBbTb8+Qgs?=
 =?us-ascii?Q?kCcWbsPVPMxPXCsm+2JCA4X/AIFO6GYm4Uv3ZabqC8idu3GDmJ9fGBcSCABX?=
 =?us-ascii?Q?UujB4E2v3p64bP4FWUiYAB+zAV2mDzLLXNY8gFFOsqrlzn9DGNAMcdgOYxVp?=
 =?us-ascii?Q?6pA3YBnLOhZuNXn16qhXt0OFT7nKVGwCuzpAAAwGhwVYnrg+Zpbc0bn1aUrm?=
 =?us-ascii?Q?6BXAA1V5TdO27p2w9W/jq3sVtNC6EmTTby57M0xZlRvJ2PQV+lvt/mQ5ZSvf?=
 =?us-ascii?Q?IS7OaXL8sFx636lCS76Wu5v+t08MCLc27Upaw12hEwtQwPSRoWrpzGm/IqeE?=
 =?us-ascii?Q?aamgMRDIoKQmGFT1gp4UORl98HcS+98SphmxYNw+gLCK6auCQ8pi38ZNqnGD?=
 =?us-ascii?Q?FBKTx6605XLvCWWT3KooLZyvC9+zMyLLM4rH4Tq8iDHWIjUvsjAkduKTKQng?=
 =?us-ascii?Q?3VeZgPECf2blMnKNA4aHmGx7VSayw0/Xhsd1LGSVwORnRJMmzh5omdM0PwA2?=
 =?us-ascii?Q?EkAvNMz2wLQywEX2IFioJYtMK3SJmRk5FIudlMgPlEjeKo6C//6xaeRFQHXd?=
 =?us-ascii?Q?sJaOTevTwhKoCbM6k/9etfrLWL6JcLkErDHMj7BcklD+2utiiHufSOl6j+kR?=
 =?us-ascii?Q?wwvFpi2jJ47optofJ0gBymeJVVgQ34/M98v97whmuiKeHImyWA5jYokCe4eR?=
 =?us-ascii?Q?jgbN+1jnL2xH5lGEh8iLCA8y2+69jIZR9mUhVJRN2qzVrApnssz4Bil4lZIA?=
 =?us-ascii?Q?Dk1aXo9ttu6tmAaOgH7aNlj6FaguVM1RW3jZyOaAg57F9KB/CT8P0cNttyEY?=
 =?us-ascii?Q?UqjIdQxILX7//m6/vGX9xNwyML0bh+Q5I/mTn43RqbqGcnT9dZvelkP3u3Tr?=
 =?us-ascii?Q?ZNu3C73XGKeiMxi/1XBB5gbuERyamo0Op15O9YoF5//9xgkiQfEHIlN0HbFp?=
 =?us-ascii?Q?/W2w8JQ8Tm1MTqNlXGA=3D?=
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
	D72wXzCl4mPMH9Cf1QC+XttMZP3UY5aOwwWqZMGm7gLZ7CMGRlSBKCUmwjSSpU9NLwLTGPUrCIqr3G5xEttWhRQG/fHGLMY1yNoulUCLztwI/1FD0uUjH9g/K9G+7F3AVp2AEu9Z3yj0Ngcn3gbHo7dbe6JEsYtW/VtIb7+rODjb5o4I0beGQ0cT7tlOqjNxmoxhOIn4MuppmSICBM1taFjgYBZO8hJewQXeMfQOB5tMZvWU8EOa+/sK17XNnoipdLuH4OvAOqxOrbJf7SAjTTDRwpW4U0LY4ZewgxrL/k3q3phycJHgPpLxh3e2Px/lDu70KjAiQqIls7T4axEvqVXMfWlbCJnqyRedVQBwvJ+kPFFTcIIVfDSexABl4mSq6kdmrbvC3JCeBtO2yWFyC7hvbqR0A6LPfW6y4wWEmPuUMLDfJONU2THo2Cd/igLo8jcIXIA3Zp5tW6pm4nSRTejKMTVyZN+w1rsBjYyOe0ucCdq0Pt6C4yX1M9iihBXT5CLBMSw6kLI2iDzRD+oRA0AIag5cFB3HD5MBUtzOM3ocC5lT9xpU1JjDHrVlaHc69UORhPrmM78WE7YVCBrPi3XU3YCYw3kHzqeKDbSRqI0We2QBYLpnqU6yVRt9Vem0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feee722e-60a4-4493-f703-08dd0c1778c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2024 23:35:10.6319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RZ4PgZ7A/qpE6sStufP0JRp5dJMlsupInMqr9LFCKAD5G9nuVU4n6flvdc0TVbT+fzEeUZDlTs9h+oB2bbSVLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR13MB6744
X-Proofpoint-GUID: dtyGmW-OGgLeJZpukgS9gJeCj66r6gk-
X-Proofpoint-ORIG-GUID: dtyGmW-OGgLeJZpukgS9gJeCj66r6gk-
X-Sony-Outbound-GUID: dtyGmW-OGgLeJZpukgS9gJeCj66r6gk-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-23_19,2024-11-21_01,2024-09-30_01

> -----Original Message-----
> From: Bird, Tim
> It's about time to plan our first meeting of the Linux boot-time SIG (Spe=
cial Interest Group).

Hey Linux Boot-Time SIG interested parties,

Here is the information for the first Linux Boot-Time SIG conference call.

The meeting will be held via the Jitsi online meeting platform.
Here is the connection/call-in information:
----
To Join the meeting via web, click on:
https://meet.jit.si/LinuxBootTimeSIG

To join by phone instead (in the U.S.), tap this: +1.512.647.1431,,33375847=
63#

Looking for a different dial-in number?
See meeting dial-in numbers: https://meet.jit.si/static/dialInInfo.html?roo=
m=3DLinuxBootTimeSIG

If also dialing-in through a room phone, join without connecting to audio: =
https://meet.jit.si/LinuxBootTimeSIG#config.startSilent=3Dtrue
----
I will start the meeting at 9:00 am Mountain Time, see this link for other =
time zones:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2024&mont=
h=3D11&day=3D26&hour=3D16&min=3D0&sec=3D0&p1=3D220&p2=3D137&p3=3D195&p4=3D7=
71

(That makes it 8:00 am Pacific, 16:00 UTC, 17:00 CET, and 21:30 IST)

We'll plan for a 1-hour meeting.

The initial agenda will be:
 - governance of the SIG
 - projects to pursue?
 - frequency of meetings?
 - what resources to use?
 - where to put things (besides (obviously) upstream)?
 - how to collaborate?

The meeting is open to anyone.

I look forward to talking with you then.
 -- Tim



