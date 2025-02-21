Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D14A13C81B
	for <linux-embedded@vger.kernel.org>; Fri, 21 Feb 2025 01:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740102683; cv=fail; b=MN4nhan+3QfLvB/EeyxzsgulmakU/BWYYmfByxSKsqBTESqYo+QvqlTWLiFiqPrQBvJPOG4SK+nvaxD21Bp4iIVvwBhJ2IQpSbSj1iFWDqOl09Hk8K0uzQdZ25Yoflh1wSUqv3cdfcQ9oPrxJ0g9/5nLEfurz9j4kQsQPrvqzpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740102683; c=relaxed/simple;
	bh=RWWxRcwL7Yx0ZgZXj2IdE/2/i/yERZJruQ9KgAmJ6qs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OT2+l13ujsKb53NMM78+gguxk0wzXjgtf8UQFMg2i9pi6brhIa40BFwOlAedSFF0hPK7q/VJT3IOb3y3jfIJ6wKI4wNr2XqrmdknVsjaf4cKDXUvJR55JINcUYNsbLdFq7mCGee95RnBnGsu5QIyGY9JLBacRFGTdRxo56xS0n4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=gaa3bnAD; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="gaa3bnAD"
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KMr699018423
	for <linux-embedded@vger.kernel.org>; Fri, 21 Feb 2025 01:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=P8ThpwDIcvfU3GVTTkwMzbmTPsO+C
	odHyH8wHE7BXCw=; b=gaa3bnADQ75HQYz2goAZ/sGAcw0fiGaflEszpI8iR3rVS
	adxIcA23p4LEfE5VTTMqwHIgCIZTF71lCXhn6i0mtPVTAk8Jpy9al0/oEp000l5F
	N8Vm168e+LSK9qOaydzu4mNLeR7fqZb29Uu6ZobHMcragALhzHobwsd73Bb1a2eQ
	TLGALOJhlEMwkYUQOpsYETw+ADTlHBTvAsvRWMmScbywxjUpvSt0YIGPjmAPpRgX
	ZxMseCnzgVWOYYmdet5KD9hH6MJNQb73Adlum7vc4ajug2rnO9BzvFZ6kNeWHWUO
	Bcq4Dqg/AbnMcsrGUM41XKF3C+XSmEzEZ3P8+z/EQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 44vyyk29qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Fri, 21 Feb 2025 01:51:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1WJdi8tNsh/03fcVwBPLsqtaNgw1clnDedu0UqBRry8d9R+XneLN1Ioh6lDCsCrAg8h2hgQKD12AzvJi8kGDxwHTFC8vdbZegFQpLuhtP/kPrkUOmZWJiYS6fQ59kyPI9L+S0qLTe0Eov+ZwH6BEIuPaLyPBzBF/3QstaKYnF6gDh3eupXFdHDqizEgaP+oIHHwr4L2F1LsEfSVqzPFk5iRVS95SFE0e7rqGmEomWLNjkONl/DNifdpxaZiIaRd/Q1PWHiYsEgy7R27ErL4Zfsou6OtuHpUpAc5cI1a7Qbk0PjB9dR+SaV2IY4EOi386TGpKS/pe7PXgql9X2PxeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8ThpwDIcvfU3GVTTkwMzbmTPsO+CodHyH8wHE7BXCw=;
 b=PEJwvMb5Y41V5iGhrR6yEcHZ4LAg4KFxIdpNHUdHmJ01psgPE2gRaZI2nu5iBjmqUh4oj3RZkwsfSs3hS45A9x8TppWXG4Bno179QWoIjZOHloh7wpOQm+UiviabTNca4Y1rFE4Pf6HJJgLxU5m7IwAnf3hdDPvLEGVHkgTHIPlwRUEBNsRku1GGktxRyn8WvTxY2r79ogtfUVX4VdV5QDNLnEESeKPug6h9mZ+BZVMJD6XkpDTWUYvFGBq4S99hU5ZEe7/g2DaJmHCTNfWPmKgfQlrM9INX3zWjUiyhZ1dfzOufEljhZTGkqHkMXqJDE8fPCHwpNVumbwoChn2cnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by BY5PR13MB3779.namprd13.prod.outlook.com (2603:10b6:a03:229::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 01:51:13 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 01:51:13 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: [boot-time] Reminder of boot-time SIG meeting (Feb 25)
Thread-Topic: [boot-time] Reminder of boot-time SIG meeting (Feb 25)
Thread-Index: AduEAcLN0j2+gogfTeS94UfnGhnXpA==
Date: Fri, 21 Feb 2025 01:51:13 +0000
Message-ID:
 <MW5PR13MB56324BAF5E95E3403E65C53EFDC72@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|BY5PR13MB3779:EE_
x-ms-office365-filtering-correlation-id: ac6969da-f06a-4480-825c-08dd521a38c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?XEykUjtfVNwT6tLnsFo8DZ8ZFviwssqKRRIEo6lbcCIKomdCPamySvxmL49e?=
 =?us-ascii?Q?/SWr78iMdaHDES/QZo8kX81ESrx1RbCC6YLpSd8aqDue41RoaKaVyf446Vi8?=
 =?us-ascii?Q?+uRkpa7d2iNVj5/Q1pz7L1OmHv1Pf7+2xv16wQ+Tj1u0GU506x/99w3Kt9kV?=
 =?us-ascii?Q?QFSNAbIvcwirzZlq+Nfck9mgqzBg5IjHAuSxB31eCYNbmqt7GEssvi2HG7on?=
 =?us-ascii?Q?3wQTFbR3XTrdCAAz4c5wdYrs2dxmYkMYkL5x8jqEGCe7KTqkVpKpkn3zoR70?=
 =?us-ascii?Q?YsS3T5grJ+GWiK2MTbntRI0tKqckxVxwOODDdlUs7QMW4w0pDJf+0pWW8KoR?=
 =?us-ascii?Q?lGLZHVjBfU6zu6iDeKRfq/ABAXYYYuCSxhrl4b/wfPt2TCAmv9a3hlILehX3?=
 =?us-ascii?Q?XS7lk/DroCzsPGrRuUeMUjQ74m9cZUBsJpy8Ka0TSsY5oPcDE/1o4uB0+6DH?=
 =?us-ascii?Q?nTM/ujZKUqfWQvvyhOH3U65U49ya71wzTgXjtjzMpH0Oa+BHMY77JbVrnaNp?=
 =?us-ascii?Q?EiGhuLnyy6i1TpsIRbyBoj2wpVWvJ3P97ejtBLFw/CWuzQBa2UuPxQg8Xg5m?=
 =?us-ascii?Q?Vz9eAwf+Hgrs3i0/u6xsF0FLHstXUJ7gtKeWWLfd/wI+1UaF7dl+v9DAqrqP?=
 =?us-ascii?Q?wEpTE/9HIff+dPQlHosoz1mNdPxcQURpiGVyUBpTy5S3oVgyAyMHji739kGT?=
 =?us-ascii?Q?7tteMCn6u51SXyI+C2UtwzPEE4BHxsjMTMa6qYKsj/Fkw3kQbfDX7uwAr1bp?=
 =?us-ascii?Q?wK6IDupwV4wwrz3jUutwEefl4QVRG1RmyL1snhtR4x6IyhGRQG3KKo8d6YRy?=
 =?us-ascii?Q?5TNQgWjRyPjrr4Zwm8JM7xsi6MtZ8DIuz5ifIFsIFra8XhUy870kHbbCSSu7?=
 =?us-ascii?Q?DIt2pXJwczzbCkSop3oo3r9kjz9FBdMHQX9+IF+cmSrZKwOAIvITsdcMjY8v?=
 =?us-ascii?Q?ujGYZZL7vJkDo4vkKTahOXxmGytNBYBy0fah1DP/9ttJ+oQM3ImnSArHoOho?=
 =?us-ascii?Q?qXjUFFZ4h10zf26+YEjG4eM0cBcEYx1uQsHbnJCdaETKW3TVU0/Xaoi3Ovkq?=
 =?us-ascii?Q?NNtkh+qADoa7twvcnIAlQ+J6Ar9SJYUoiXX7mYvV58iqr8h8o43ayxy1gDom?=
 =?us-ascii?Q?RX6IrZ1gqTcSPPkodvcPg4MeuHqf4AmaeqW1Qsqb6tjIEdlnm8Q10xQeOetL?=
 =?us-ascii?Q?dDxj5iAQ+MfwU12DbQl/IMiDv7boCGUOQadAWVzov31Gc0ozuLZS8Ntny/C0?=
 =?us-ascii?Q?g0vI3JpeUTOHcRUPcDeJygI2QcQSsWrE2O+n5k3cg0y/QomqVMbyQyEGkJMJ?=
 =?us-ascii?Q?9b3sBwoDw8yB5+fy0cTo2Cw8yeW9OvJtw3yNMJUkuqiMLaCrDKASRspakfgB?=
 =?us-ascii?Q?uhN+HCi4IQ2rNtLibfNrOM6Rusyi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BY+Mo9ZXg/OrvrqaSQBUjcttcqFafg3RllHA6pzcxyO1LZPpM/etgGFjVw9V?=
 =?us-ascii?Q?fqD4zpNsXF+BYuhLhT5u8ZiW+BY69OS1qhVPPQ1ZIr0EHXrhyuJFPzkoM19B?=
 =?us-ascii?Q?roTRjY3xpnOpMJmOQfUjx4pa+qrwTUwGIgOXNLUbvOqvefsqU0N5VbT7AyCV?=
 =?us-ascii?Q?xhvMCX4FnXpf/coriBCo99dEaMxAvV+R2Xm8c1bsS9g8OqT8r0p8Zhpcwqsu?=
 =?us-ascii?Q?buQquJ6mJIXdAAi6BTUxJHkdLa5F7vRltKiKsusaEuJhP2wNpI+0KRV+b8iB?=
 =?us-ascii?Q?lJ7MOCyrUGMghhUykxC8uaReeUXHwfMHfuWrM+taN7zyVs02HJxt26KevAGN?=
 =?us-ascii?Q?+CuehTJy+XAjKfSdhjF4rpMnNwDV7QGgR+JX01ZlJbkKkt7K8aMObcshrycQ?=
 =?us-ascii?Q?P0haywOiX6JF2S4nwxOQu8BwrA2QRHYXmE1iPP8IotukdCmzS1pp0s3rxMQn?=
 =?us-ascii?Q?nEpAvfGIfd+awolYjd850rJxJDWgTOduAao8h1u4m5ADz72OL60AZG0j/BpJ?=
 =?us-ascii?Q?eMstt625qURTqq47UPL/xqL1/XeUi3p3mbnUFoeiVDijv106Hrw9PmvI0Cn/?=
 =?us-ascii?Q?7e3M1jN2tFp3vKAez03vrPOdC+kyr46e2rI4mFifNosaomllnmQR+touNoZY?=
 =?us-ascii?Q?Rc4nEgV7HogCfdMgGj8Uz7gv0X7bjwMdMI88FKWsvoZQLTpiLvzv+TFg8xIG?=
 =?us-ascii?Q?pypemCyzgUM51unlxwxOxS/xOWnUDU2QiuHDtQ1aPfD/JrEMHWdd24VEfadd?=
 =?us-ascii?Q?JSzBouTUjhDhQxrebXKe+W4vsyEdDWbiEiLe25X1idBVaupaDhzJHrr6aRq9?=
 =?us-ascii?Q?AfbhVXGJHfKASb6KcKRGfRWy9ojb+xy0pRO6uenCjgTwiKp4vMm1FNu/MetX?=
 =?us-ascii?Q?1NsUh0zhah28YrhKQWTkIMUNvYQsx+n5QGrMx3/NWlySahpjYNWCB0dVcT4l?=
 =?us-ascii?Q?Hj7Wv8uzkwp7JuYuqvwqbPupX29TrTcVWRpTAUYZUDJqLtuqrhC/XtMWFRgA?=
 =?us-ascii?Q?T56UBBcmViT6ryH/ACQJrWfwiOnfDcSI659BA6OZxNPnZIXDqzY59VzAEkwF?=
 =?us-ascii?Q?KxSq1u4IyTXsSeuy2o96/K2ifGqrLja5y1GE877BNkqmRPrKdEcruwUV6rA4?=
 =?us-ascii?Q?CqMDA+wI49Fuq6dX47XdPvA27CKig8WzzqJkeuu4JHnRTWpgi8VTG0fAFpr0?=
 =?us-ascii?Q?O2cvTG2B4KJJvsuzgK5MVpCFRaipYKTvb3/mOJrJst1nJ90wy2QyX601yOF7?=
 =?us-ascii?Q?NMk8+6+ZoiVBspoFPf/PJMHjhg+7mEQ/45t0lgt/LCuu6FuOKB52ZcPx0qld?=
 =?us-ascii?Q?ii9ZQhbNGagOgrnU5Nh9wF2wZBNMmc0Plolr2hAngVjiYn7MaB1bBMs532re?=
 =?us-ascii?Q?qSENuOiW4Mn5Fwz9fRGUi5HRITyFXuMkQZdWM8FXWYfQqb6lAxxlnfe6dsiY?=
 =?us-ascii?Q?3u5a1a6TG23tzWyUdXqpjozNzHb3nIvnpEohQHc924eUwWdi2LAwUvbd29JD?=
 =?us-ascii?Q?1Ehq4RWCzVrKCF4Ld8AMbJesuWeuJca3YxSJM2YqB4MPn3i+ogoPl00YKztK?=
 =?us-ascii?Q?2TGb/TwZhzAQvn43tpTVthR6zGpCp9sKeuOO5hXb?=
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
	sWJyQRYEm9qoCSL5NaelUOXrTKxgPV6V7jVV7eqNQR5NSjWTkPe14RVQetN0LZBZKB6qrdayiimnfRf9ox38Lr5lH5BsdLNXB/tdHirdOcQ9EJ9gicZy8gP4EvSZ1LDFWcvCSdPwcQUNkI+3y62E64X9pkDUyl1Lld5PL+TovXjwbpGxbie8g9Afu3wyt7a1VG0n/qKCT6oJZyLMUtdLbNhjmnqGGMQODSqo5HhNEGJQomGnH6orcflCcSsQLqNwCAFrgsqTMG2QK39VBHlUivD+qR2cWWw2b9JUsol25Va7SZxGpbJbZuSQU3iKFe1nc/8fIN3pbUtR38v00W5RHOpaBu/+VbwOUAD2EEnsL4vF59/AdMEKGCOC9asL5cPDXWlDBAmIMFB/xOJ5aJYW7vgnF/XalH73b7la1tr5UTsqd/AANEEpQnvgs+YhRMHNySSMCPGiUkN5+CXokUU8tMO4PZv9zBbfIFftbtG64PC1gM/Lju94nbRI9HK27tuT+JNQObfV27yyU9eh7UmGIkBjCtYS/fkq7VW7fWS28cNY5QnOZqsCFYBmqzh5wDameTYwWBOmgLfUimWRZBJGkPDMVDyrZSrbhG6xQWfv2LAyb9NflS3khw6ntaI3ryAJ
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6969da-f06a-4480-825c-08dd521a38c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 01:51:13.1397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z2DViH6Qzsy+LBFWmPgNl6fdUwkpoiszrmYms25H6ZbYHUWpUZx9Hk58uZgNgzrhUdRLEZHVt/Fcv7F6Xp6YXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB3779
X-Proofpoint-ORIG-GUID: 2t8jjgm1oDFxy_wR3E_aK__gXZ2PWGfQ
X-Proofpoint-GUID: 2t8jjgm1oDFxy_wR3E_aK__gXZ2PWGfQ
X-Sony-Outbound-GUID: 2t8jjgm1oDFxy_wR3E_aK__gXZ2PWGfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01

Hey Linux Boot-Time SIG interested parties (and other interested Linux kern=
el developers),

Here is the information for the next Linux Boot-Time SIG conference call.

The meeting will be held via the Jitsi online meeting platform.
To Join the meeting via web, click on:
https://meet.jit.si/LinuxBootTimeSIG

----
Our next meeting is Tuesday, February 25, at 9:00 am Mountain Time.
See this link for other time zones:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2025&mont=
h=3D02&day=3D25&hour=3D16&min=3D0&sec=3D0&p1=3D220&p2=3D137&p3=3D195&p4=3D7=
71

(That makes it 8:00 am Pacific, 16:00 UTC, 17:00 CET, and 21:30 IST)

I'm planning on 1 hour for this meeting.

The agenda for the meeting (and where we'll keep the minutes) is here:
https://docs.google.com/document/d/1XAufoTT6VVJOTMzKMoz8SyOss-JA9H4J1_yVXQq=
5mN0/edit?usp=3Dsharing

The agenda for the Feb 25 meeting is:
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
    - ELC North America - (Denver, Colorado, June 23-25)
       - Looks like we'll have some good content for a boot-time micro-conf=
erence
   - What are people working on?
       - In particular, are there any other patches in flight?
       - Sony boot-time work:
            - Tim is working on an initcall regression test, and the boot d=
ata wiki
               - Tim issued call for more boot data
       - Status of RedHat boot time work?
       - Status of Texas Instruments boot time work?
       - Status of Qualcomm deferred memory init patch?
  - Review of project ideas
     - See https://elinux.org/Boot_Time_Project_Ideas
  - Review of action items
     - Tim started collecting areas of activity for Boot-Time SIG members
   =20
  - Engaging more developers
     - Asia-friendly, secondary call?
     - is linux-embedded working OK, or do we need a separate SIG list?
  - Next meeting - Tim has a conflict on Mar 25 (move or skip?)
    - meeting at 9:00 is not possible, How about Monday?, Wednesday?, Tuesd=
ay later (10:30 MST?)
    - current periodicity =3D 1 month (the 4th Tuesday of every month)
