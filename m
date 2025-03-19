Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0220628373
	for <linux-embedded@vger.kernel.org>; Wed, 19 Mar 2025 21:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742420994; cv=fail; b=W1XkWImvMbXP+ExJS/Bnb3AMA77T+0uBj6zleZbpQqWqYXCqqIjvJJztn0cPXXV5PO4V8hgRvV0DZWRTbxgkLEBAFemAzkH/2VVLgYaIQUUFh/+oZg6QeZno0mC9sJqdknvCMVWJJq365ZBzmmlY0q3HERalwGETQm9OymhBWGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742420994; c=relaxed/simple;
	bh=apEwWkl+noOpYhmceyd+mM2sdDRu2pJbaV6Jt1NOBOQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qmwjl7M4u0ldG0Am4ExtXdVLvfqqM21kbavPum3A2aTHtJ/Qgf0nmusHWo7S1BFfHXpjQFD8VIw6KTaups6r/SVTe2M8Psznp2HtmRf4L05i/ErvdgCzOeIfQ0+3XsdBCx4eDoYN/o8bRdFcBHO6z05eu+LW0Zwc50A++eY9pS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=V1GPCw3D; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="V1GPCw3D"
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JK5IUq010478
	for <linux-embedded@vger.kernel.org>; Wed, 19 Mar 2025 20:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=/izm7QyP/7Xw3+S2rzk0tHjTN32pq
	16l72eBSBfkA/E=; b=V1GPCw3DUjAYNGx3pUcpeDii2Mfba0pxuXiDo0lm6nnz0
	XynUZbNIeW+j/iyVAndktQEaHquzbCtg8V7WaCPRkSwkLiqLB3gzf78iPNoLVxG9
	l/0phEoGpdnYMD0LqyU2GrJrBF/5FGAXZGhqxXGtUhKcbu/ZccnZ5dHnDLaVBQTR
	5yOgGZerQrGo6ckVc/zaVvAO9snKjAbv/ZSe97sySTObGUXG/o2/r0Qofk33SbYj
	cnQDr/v0b8eWDZ9OFyXtWM7cykJVVT2RkCNBtV/Sgjw8PvZLZgRdZURLJnoy8PQj
	BxX2UHIq5PkJ7QX36EgFw007HlklRCV3Ua28gk6ag==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 45fdn71507-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Wed, 19 Mar 2025 20:44:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tz8YUiUsbwOEKbPiZ7aDrXomnqo+5cjUPxidU1T77Nd/JdI53uzFnIjWWJ89HMSPlmfyJvRwj08AA45JCu7Cyo6gnj3Cjagi84tKl76jOJsRtc2pc7yNpjLgMNzpM1qKwLCQAeG9yS8lLJyXcr3l7MpBe2oplbG3o4/pGuNmSb8I+ll0qmWff3n1g4irTDwCesGEq7tKD15fO+KQyKZRIfK15ZBvBW77Z7DOSUts9+/+8IrCkUmhlJ715ImzXiqSNCmmm8xTXLgv9QHeJ5kVphLOwS/cFNApaw8wu9X7G33hNKk1d8y8xfx8QZWAk8Bco/G3D9aS2Y5aZu618Z4y3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/izm7QyP/7Xw3+S2rzk0tHjTN32pq16l72eBSBfkA/E=;
 b=ymXRlfbwKsPiZEGXocMP6+lOYv2gpDqNLMWfKbH844VrZqWWHdds4EYpK9bUNHaa2MC0JQGOnqua+E9hA2eHu7D1VZe8CulNyDmNNb1PqRhpxGJnRppUXBNghS99m26eyvFPkRiouAhYPHSv7GlTnxsK1ZL7++PLytBq7Eqp/RVc+fKH4RX94WOhXFpL9SXFJSuQhEGoraQSCOUyKgVLThkHRVDQ8pzYtwnF99FxIxur2l0EjobiWwFLjndDnM9fT5GL5U1nGKQH1Z2NeevOY07ukFTSMKYD/1TrtkzWHCXqSqaNlcDZKZqdxyX6C0Ue4Mq90y3tCYP7yc/s6JhesQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by LV8PR13MB6517.namprd13.prod.outlook.com (2603:10b6:408:191::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 20:44:00 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 20:44:00 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: [boot-time] Reminder of boot-time SIG meeting (March 26)
Thread-Topic: [boot-time] Reminder of boot-time SIG meeting (March 26)
Thread-Index: AduZDufzIHXZnBuUQfeJJiOL+2oYHw==
Date: Wed, 19 Mar 2025 20:44:00 +0000
Message-ID:
 <MW5PR13MB563271D351A97BDD0170B833FDD92@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|LV8PR13MB6517:EE_
x-ms-office365-filtering-correlation-id: c97c8458-1998-4ca8-de68-08dd6726c72a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CJe1OlelRwQO6cLHntYx9BJTNa7lXAlWo8ya/DoTMz6F4yKSWbH5yS5sRbMV?=
 =?us-ascii?Q?BhdBRdi1Sl/h1/C85ifp+0jyQRPSEzjUhsVnULqLwMuf58W1dSS3loo+n1tn?=
 =?us-ascii?Q?yUKQv4pvQaPPvpcXQio10IPgfuBfJEE+kco9B9iWjCQnVQjv3By9R1otKPbf?=
 =?us-ascii?Q?LRbug3TNvrwDDe7qvJYbgtreCk2WNQn4atn9eV6H7SKpUshveEjTjIRQpFSI?=
 =?us-ascii?Q?F0pT3Wu1D/5jieAvM3nJqq23AmJFo8tguwLhqYxAjzO/EjXIdMC/EepdLzgy?=
 =?us-ascii?Q?JZyFZuZUuwIL+Oa8RUcjOxUX+Rf7fLuirAvB26KkXDJhWCruYi51ByR2gZzz?=
 =?us-ascii?Q?NBOAZl9DLH6wlsVbhHcL3b+R4hjz6AVmwhzoZ/I6C1lq2ciwxuMvo9racjK+?=
 =?us-ascii?Q?1BHeyj03CgdVARpxAbX1TQNVm16T3pjk1oD/oRwOS+y9DIjJv39zxLz5LQ8N?=
 =?us-ascii?Q?MUsjcDqtKC1GHAP1tkRq2ApYtOn//0ONVClh8TDCGVu8YabOPX7kIYVHSU4/?=
 =?us-ascii?Q?ES8wOE7c/dSrdQpPXQo/NEjvvJlNRKd45aPy8kNx6ru7fjwcNUGMsa9cWu4A?=
 =?us-ascii?Q?mmePcpClsTEngs2/z9tjk/MU+6rRnSTVyybRXkHFrcHq7YduodXfrifrg1Ke?=
 =?us-ascii?Q?0Fn5VeESiLGqjG+NYhH7Z3MwAEIF4gk4NGhHi2yR35JVejn03onsiG4lCYpt?=
 =?us-ascii?Q?wdm36MErFy8lmkEyZszKsa8G8JB0nqy8wDyOl8sebBeB2f+zJYTjL6FpUA2l?=
 =?us-ascii?Q?wzn5O4XxWG6p59oljTCSswF5YYqW7RvuhNeRIDwCGxY8z1q4YfbAAb3lylVh?=
 =?us-ascii?Q?rvoBtJXHL03ppIG+xAn/ticOTTvcRrKCpTNG/bVD4v0FyND/Y5E8c/GFALBK?=
 =?us-ascii?Q?JXTdKP85vLAgcJTtdO5nHLlMDJROYoHrErbuoIPim7hGhcA6cQp1qVFX2Y+D?=
 =?us-ascii?Q?A4TAcWiCToWG31jS0b4G8kks9zNBbWMbQGIfJYMd7tO0TiwH7qBQu6nS1Par?=
 =?us-ascii?Q?O7LEzJJSk6x1ABJFSq5IKmlEcYwnUza9hmgP1nL2zrqrNOLXHsYmHJK6BAHK?=
 =?us-ascii?Q?CQTEYFt4fdOHDyaT/I3IhFCdmaSPBQhoPE/CskkvSPZixXNIyq4NH0XWiThC?=
 =?us-ascii?Q?+GwdFvroBViFflr72gB4qBwS2KdEXSvMMNC9QSy+rSwOzABkhks/gBqaVWXO?=
 =?us-ascii?Q?BPxX51Rzc58Aw20LJg1e57EzJc+lhaShmyg7r7vTySqG/TA2eUHCrupp2TQ9?=
 =?us-ascii?Q?lXcG2r/FEDSu3S+XfAJnONl2QP7AhDM4eWg/kllY2lbbgZhJ8AoduKoiQhas?=
 =?us-ascii?Q?zXRmoEugOYh7NiYED77/ZJVfD1hApa5tEHe2B7ptmUqWzsjV9nYYLf+jjdAh?=
 =?us-ascii?Q?YJEtsrHNWzQj838318yqXB/OPphQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7lsyUPiFyBn7Uqfod45QjNEmLKQU92y6g/NnLSQXZXoyIpHviQPkQ53nT0yS?=
 =?us-ascii?Q?01lRXGkY8kQ5e8K50ZLDBZOo80aTwqo7lCQC2uz4HnmCzrcxtG/CM7yN+gzT?=
 =?us-ascii?Q?WEt601ti/0bGuFQwKhVjOQF4IBTbtuGLU0CUuc5KBzeEaVPULk08ZwHaSAv3?=
 =?us-ascii?Q?x3xuN7tTB4WVh7+tx5T28BsyILAs0HD8k6BAaMeGQDVsmrHAUohoS9NNYm2f?=
 =?us-ascii?Q?JovJVS03460LFbE9PDL80fN2Rt5hpv8KC5TUxap+wWY48GQsgJn4U1s+qGhN?=
 =?us-ascii?Q?Evf9K2cxD/gE668Rq5NwViuMXbtCR0EecOCOUCnz5+PhdWrppQ4Cs0wj4/C4?=
 =?us-ascii?Q?bCpPU3aFJ9CbbcN/cxlIzxX4Iz/53lNTKa0ZkeJ4PQJzsX7Xg9of7DzKzNFR?=
 =?us-ascii?Q?A8LocuxKLQgm1mBLoDOOv8+JTd1BuaLc/BIHbDx0OUc+w0pvJ8fT50zoW8in?=
 =?us-ascii?Q?CMB5DwX93OpHb9BjD3NM7KtZGJE7wah+YCWpYnp/EkQ6JWSuCMAqlM4X44Li?=
 =?us-ascii?Q?OUzTuHbhk9FlvgcVwETqCOOcwofQr/6CgM4PunUi71ACPhDDFpwIO7OMrrnd?=
 =?us-ascii?Q?vhZ4fndgFLuEjIAks7nTGBV1Qw5xe245UgRcAwplnm5mpJqZcxONi5b4c1Rv?=
 =?us-ascii?Q?hJszb9Yk7RRfl7VrJWDgzx71RewucyLPYGrvau1Ygf1VLPQjm45ZS9pzGnMI?=
 =?us-ascii?Q?JQcHe3yfcx92aVtRP5lBlDMmRnLux6vTs1df41wBWCzMgWlXTUT4pywE7mS0?=
 =?us-ascii?Q?r8NDxWgarM/knxbhyrqzs8DYricC2hm5Jda+K0Kz6WhBYRaB8EN9K1SjNbTe?=
 =?us-ascii?Q?4RsZeoWCwIGjfHYOjXd/YC8S2CXB35M3EGiECt3X1AlVeXL6k0FCtn+9apZD?=
 =?us-ascii?Q?PwpvdlgwNwql235Ky02bSr9ESZouVn6perPbQy2f0xOdl95HsHs6Cp8FSFYP?=
 =?us-ascii?Q?y8EFvsT6ONAWj7lS7gRxzxgSzZU16ZJcROP6VTolEptgz5P6k4d0y7tUTzzc?=
 =?us-ascii?Q?o5ZgPvou6WEIsxSXSuaZ6fMMitFXEDJeHGuFvafj2HWr4ZDilwD7Dd0xr1sW?=
 =?us-ascii?Q?tvv2yDeUfL6z3QqwjSHiNhxjwOAyB7W5dmHfYCx8AV9cdLz72m2Vn7ynWZRX?=
 =?us-ascii?Q?8hBuhLlJlO32AmwzEM2Hn2yKGy7b0F12YtRTztgxK7c+aVG1dQDxuhR8Ex+b?=
 =?us-ascii?Q?nyGZuIB8Sd9xTgSOfYIbybpFWog0aNoPfRIQuGpYvrd4+P856yguba6XqtQN?=
 =?us-ascii?Q?cgtxADfCUErOoesTLrNOrbgmUFFTZAvEDX0JS3Eo7zXasKF7li8rZljjXWBc?=
 =?us-ascii?Q?e2OLHzFpRSP6Li1o+ov7+3SRbOv3xtt+BaHfNuNjztJcjLVRB4riD0vEhrR9?=
 =?us-ascii?Q?b793Q9Chg3SJS42mFvD6qHC7EKAflq8KYcwqBUa5bV1cQ9/vYVbpXHiTNoZM?=
 =?us-ascii?Q?Wv/jP5x9UF78pGkvCrN+yFYfsDp8KrKZMjH4uPQwWvt0fUDOPHlUvcPsmHMm?=
 =?us-ascii?Q?0Bm1ZgIOxsRdcLv1jNv769cV8Th3oHlrPJfAcSavKPpyfuja9QEkio+3CE2Q?=
 =?us-ascii?Q?ionls+Ib6+k/t2CFTPY=3D?=
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
	a3QAYnjD7L5MnvNxqWEr1iMGplatEhCu/tDg5No3PVPQw6rpZ5bVvPRBbcGKPfERcOJdfa/63/KKZQlBdBxkYXM6jVLFjBCUQjrQTGczXTnbDnlnKi1KYlps+RQmVGxPmelTQ3z2igSBO4DW2jPCe9r4d/9OX981DfWXjAYl0BAXVix6f9Vx+3gfNR88v5vciVCFefV71Ta3xv53IvYSXVMRE0VowKfM3BH7a2FyhdawgOCuVH+YvjNuNTj/aMddMYlePWqnfgDIOIH+WjDzE3xqJjz9cfsysBn561Cc/2nogCQgJ+Mz69yrvkXDb2VROfjqMhu0nfR56+dYf/CaDVmf90gqQ1bIX3/j71S9aqtku30tU+LtIPqDiSv772IBK/OHyAw7QxZuFRQVn/SNLUPC+9/cy5D/P02+uvctpCaDUeNO1qFsiCIYIcUYpC+BMXWEGjEI5EbnTVmr4nbnitciB/ErSCVtEGTLhGmLUu12aMtH5twK7/nZ4R9qRgnyRML9cqIJf6jXbVdd9k9l33kL52SRgN2npNbVqlDe61ys4A4YQCw+Kmc9EojleGB02OAzdybUQf1uN3glfg+avdNUpWli8tXf84jh1TCBZcxM0zGBuMFvEtXiV65eQupr
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97c8458-1998-4ca8-de68-08dd6726c72a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 20:44:00.4275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E2BS5C1oeO3dRLjlRNM5Aj3Kf1E6iPTClcXIpnNQU4iQYY+s0xvafIddR5oyAK+cielVi2/mUaBZqxzvjZkilw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR13MB6517
X-Proofpoint-GUID: 90Gcrb1QFu9EgwbL9OacgEKG4oxJV_i6
X-Proofpoint-ORIG-GUID: 90Gcrb1QFu9EgwbL9OacgEKG4oxJV_i6
X-Sony-Outbound-GUID: 90Gcrb1QFu9EgwbL9OacgEKG4oxJV_i6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_07,2025-03-19_01,2024-11-22_01

Hey Linux Boot-Time SIG interested parties (and other interested Linux kern=
el developers),

Here is the information for the next Linux Boot-Time SIG conference call.

The meeting will be held via the Jitsi online meeting platform.
To Join the meeting via web, click on:
https://meet.jit.si/LinuxBootTimeSIG

----
Our next meeting is Wednesday 26, March 25, at 9:00 am Mountain Daylight Ti=
me.
See this link for other time zones:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2025&mont=
h=3D03&day=3D26&hour=3D15&min=3D0&sec=3D0&p1=3D220&p2=3D137&p3=3D195&p4=3D7=
71
(That makes it 8:00 am Pacific, 15:00 UTC, 16:00 CET, and 20:30 IST)

Please note that this is NOT our regularly scheduled day, since Tim had a c=
onflict then.  This call
for March will be on Wednesday (NOT Tuesday, as usual).=20
Also note that the US has shifted to daylight savings time, so the time may=
 be off an hour from our usual time
in your location.

I'm planning on 1 hour for this meeting.

The agenda for the meeting (and where we'll keep the minutes) is here:
https://docs.google.com/document/d/1XAufoTT6VVJOTMzKMoz8SyOss-JA9H4J1_yVXQq=
5mN0/edit?usp=3Dsharing

The agenda for the March 26 meeting is:
 - Round-table of on-going work
    - Work on the Boot Time wiki (section of elinux wiki) https://elinux.or=
g/Boot_Time
    - Status of the Boot Time Data wiki (on birdcloud.org) https://birdclou=
d.org/boot-time/Boot_Data
    - patches in flight:
       - init/main.c: print initcall level when initcall_debug is used (Fra=
ncesco Valla)
       - analyze-initcall-debug.py (Francesco Valla)
       - boot-time: instrument probes more (Tim Bird)
          - this provides names for probe functions called during boot.
    - work pending submission upstream:
       - show_delta version 2.0 (Tim Bird)
       - deferred initcalls (Tim Bird)
    - upstream discussion
       - effects of new nbcon console (email from Michael Cobb)
    - ELC North America - (Denver, Colorado, June 23-25)
       - Looks like we'll have some good content for a boot-time micro-conf=
erence
   - What are people working on?
       - Are there any other patches in flight?
       - Sony boot-time work:
       - Status of RedHat boot time work?
       - Status of Texas Instruments boot time work?
       - Status of Qualcomm deferred memory init patch?
  - Review of project ideas
     - See https://elinux.org/Boot_Time_Project_Ideas
  - Review of action items
       =20
  - Engaging more developers
    - Next meeting - Tim has a conflict on April 22
    - current periodicity =3D 1 month (the 4th Tuesday of every month)

----

I look forward to talking with you in the meeting.
 -- Tim

