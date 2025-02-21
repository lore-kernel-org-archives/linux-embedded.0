Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CBCEEC0
	for <linux-embedded@vger.kernel.org>; Fri, 21 Feb 2025 00:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740097461; cv=fail; b=AjH35sXuQwnN+97akW/cpbMLO2Oyih9i9FGG4eVva3PCbiAXjEpL6iZQIa/hHNTdFh6IsSvCwb5IDSJPQRH8ufg8drQ1dnptbTZ7XYx5IgTnvZ/mwCG3zjnO9/zvxosrpYMQbL2s5thvOhCr9UbeyXQ/TL1LXdM/6A/NRf6ahTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740097461; c=relaxed/simple;
	bh=DWVt1P66Z9/ze9iyhAVkE3piWrdS2O/GByR/6nbG2Fw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=U3XcfJaGb1ciXSAmJ3rYgOd+bi8iP926paIOPWa2FMEi/gXoswiuBZ2UjAyZNmcIfnv8ZvJop+4cqmwb5WrOFmCZ55smtK106fWZtE9wo5Ro8zUFvdSsLa+sQWreSxW8o/ZFMKd7vWoiTmmDZ6Vz0r3gETifaPT1qXirNZgAuC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=jAvH2znj; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="jAvH2znj"
Received: from pps.filterd (m0209319.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KMgE2T019480
	for <linux-embedded@vger.kernel.org>; Fri, 21 Feb 2025 00:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=jTIJ6ExQpGYWNoAx2aZtngixm08LK
	UKrGoLNt1KqXgU=; b=jAvH2znjLASyXesiLI8GLO63GfpQlQpOH5FbCXG22I7Hl
	a3Rq09dCjEwnD/a45gIe1sphikOKmnb4GVl5hqJfTmdf6ffdkWHpfsKTT8WgIfWi
	EW8rvAqSNMsZkZMdSohszn10z+cYwjgVe2yJkJxZTKGg9YNKIJOwT7CJyy/3RSgo
	K0ja2COEpkQjkhrZCpCEMaxCE5jKMeSuaQT2jKvkhEhODtaZJEAkNvdCIcgxKD5Q
	g35jWRxxl7LCQ1YRk3Tz2+qb+rBO9nK4BqiP7ZTKnQiajHEA5DAMvtqgjVgSNEXJ
	1O+afrKeh/SAu4ioeKFv2w+EM7vusEd1mdjCEvZYg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 44vyyft79w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Fri, 21 Feb 2025 00:24:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CP7wB4FJqB0D6lDlIoLazp3uWdasQYPn3VTvU4PiPmIHksTxEGooakuaDLYQw4/wvltR/1JSUH2Gj3SRIcni+5J/GU5gKXqyyboOQtIY2XCtAaVoHCa4BYlQ4UOEoKfLDcSg4cvR5doeXWL9n0jaobG3WGpHZNNEDqX253hVoQ/47i5vZsZNcvWxn4DnIRnM4o46W8piTlbwrb1J6jTck1h0E3MQJFAOGIySUFMCyZDIDBDSeDdySd+DcIrSmUIeWRx+M4m7ebrQEo7v2b9EOf5kITF7uXP8CkCLKJ3Ixne+1Imz/yZpLM2MJgOz/WrEHcNxBvfM9txxfIC4jfrrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTIJ6ExQpGYWNoAx2aZtngixm08LKUKrGoLNt1KqXgU=;
 b=ss6311/rhntq9e2xX/iwKd1oR3nkA8BO5JuUztkoHGF8NniS6Zg24Au4AFfz/mu3WvShKed8Vk5d4IJwYt1X/sMPvwpAfhsZNaQha1+1mPCUGj8OPkJMJONCABVF2cvXKnljLgvRqOAFzhXLyUD4Wpqharb+qhB/nm+egLA35R1K6Hp/po6Jf5ukHQbKDeNvkRolnpWDA5GXMt8oWJIlxLssSlGQFl0mnwqnteurG/2OI+PAUsHqFc9+3jNTbxI4Ah9MhCS3FPQ3CxgcCxMpT3yDko+Dle7eDGmQxkjsVGl5caiQA9h9VQAxm9cBAjLXPL3Jb4QkgW+TC8aFY1gl1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by DS1PR13MB6917.namprd13.prod.outlook.com (2603:10b6:8:1dd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 00:23:59 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 00:23:59 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: [boot-time] Call for boot time data!!
Thread-Topic: [boot-time] Call for boot time data!!
Thread-Index: AduD9jqxViFaMwFRQFeCiePIOCb6aA==
Date: Fri, 21 Feb 2025 00:23:58 +0000
Message-ID:
 <MW5PR13MB563253EE423EFC1A71F058CAFDC72@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|DS1PR13MB6917:EE_
x-ms-office365-filtering-correlation-id: 43985627-41eb-4c93-b86a-08dd520e08fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?QdRt2/FHK6GjxoHGN7XcyhwUYhceRn7nWqzXiuSomnuOQAqbQ5NNLThJCoY9?=
 =?us-ascii?Q?avVPFur+yagV3ziyUoW0UbM0q4+p/CArdZxmExC4ZRRCRtAboPiqtImMnGyM?=
 =?us-ascii?Q?bNi5mGsrpEYkb37FNn9R6em24zWq0w0Mg5bUY64c0t2ETRUaSZElW58NxXlT?=
 =?us-ascii?Q?YV/QKgInQSq4586xgzGtv4Y0YVLVZsewnZ0apB6+kLdA6FCg0zjBZZ20oBZv?=
 =?us-ascii?Q?grCnqWlDfqxN3WS06cDRN6SpEqxjaoBaF0Dwwd+e0NDDxkpYwqXn7Y7ePT58?=
 =?us-ascii?Q?cU6wpXRrz8jUSQJ7a3QfTALhA14s9IHIIqo0939nhzhR0YpxuXGJUhw91Wcy?=
 =?us-ascii?Q?/kvq1Jce0lQIZjAqGwI03ys1v7FAKuG3AMWV2MTonY+3aRFewuJcPcyZ9/l/?=
 =?us-ascii?Q?kDl0CWqONiNPQ7/27TzUNSYLZSOPseymhe2+wkIJaLzmwigsOTjHMZSMq8jB?=
 =?us-ascii?Q?Xytzm521esnPQlT1Rg5e7pLcCUhfkRr88US+yb175CnY2EHf/r2T4nmwZzss?=
 =?us-ascii?Q?/rmZN3FPQCcUyGQbwpWcfnecF5qXSVtr/7Mo+1gbWyd8bhb2+3sRQmsFHCoj?=
 =?us-ascii?Q?Y1z7CIqtVSjMM19vJ906CZR6sEATTFZPttAgFyLL/BWrEr8GTTvu9pfWZGDo?=
 =?us-ascii?Q?49whzpFyQFSi8ptEMIQDKkjcBWroOsAiFbbRCO5RvEeH/oORnCAbCsNcJPn+?=
 =?us-ascii?Q?sEt+rQv51XJgyR6gAKsMRZK4Nzx2nVF/ubTHorNVrLDKfB5lAGTannBITsCf?=
 =?us-ascii?Q?w5cjGd7TLcCzEl5nMr5E7y+XDdSIQZ4fcmjI90G1lrGFCKh85iU7cstbVBcP?=
 =?us-ascii?Q?UNYcOm5binJIC1SfQfEgUBt2IsX0+w5HvtAOvEfcfGKhB4oiB1I/rnWjZet+?=
 =?us-ascii?Q?LTiG+t7myFuZnEj9ob5a4Jc4qW2/ZS35ngOVOCqvZqYyc6689pcTmS8B7K4Z?=
 =?us-ascii?Q?vDowXSiH+Kw/spl8pwd2onmKXGUsjdBaBPKlsrXOEN6jzHUmjtE6WdwImwi1?=
 =?us-ascii?Q?iUe/Nx4wxnwiFSnN3EGmDpmqwACG+MFeX/8gvEQwscAO8351qpQuShM9CmxR?=
 =?us-ascii?Q?m8WREq1FmZgblOvesbdhuupKNfvyKGp7xwgmDjVVjxFs8fVAMr1hlijfhlhM?=
 =?us-ascii?Q?SHOKU8OYMR320BH3TeTATjLwkzayU9GLHIINyU42SgJ5SVmKUPobAOj2tRmN?=
 =?us-ascii?Q?1Bsl3JDgmgFPFnEe9/Y/SDkw2OQbCa06/7SPqcbYP9JKlKkY0+K9G4ZhVIId?=
 =?us-ascii?Q?B7kFuFhv0GIYHEjl+m6noa2GaQGI5tOKSAL8Osvu8F3Qu9xmntAVe5Co/78n?=
 =?us-ascii?Q?Qvlzz1fyv7ilfi6LtH2Rv0ww5N+U38wT2alGA1w0bfAB615wH1oce79Pz5Y3?=
 =?us-ascii?Q?a0zmYwKdSpIvmF+wAICEnJV/HT38?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vTkoc+T31khpOIsyC3+hAKErGrR0fEeC8iz+7A5ObtkBjUFRSz2CADscvR/y?=
 =?us-ascii?Q?d+0Z8GVRaOYUJakBsoYCjYilmQwwoJq3TE1Lsesplxb1iRofi8AQTei4g6Mb?=
 =?us-ascii?Q?zA5hdiL3oJhxzJAFYSXzdZyvyMn/EQKgnYi27zLFe8uYVekTnT+gqZEcEfUD?=
 =?us-ascii?Q?OdjCntFFDz6SK6sb3xRn+L1MxDsHD4PPwqtMjHLhd1lt9wJ+UM6dyjgtRG9G?=
 =?us-ascii?Q?35Kho4j26tVqbEhIPIS0hYe45Z+gJeMw06+nUddq6lnxPssmSTVz0FdNlAtS?=
 =?us-ascii?Q?rv0mIS7eHut7vS3d6VOB/BYTO67UDPz9bE3uAHDt2AHDAEMTv2dKkNG6zkQG?=
 =?us-ascii?Q?Lc6eyr2wnB9OfxcYHt/SKSuV7WTmFxSIuXaifSOhen3trvQuBwPKpUo+qQpw?=
 =?us-ascii?Q?DY3syu4hP58LkLYSgZdvnENhckUi2AkffDqIQGNydNXC14k5kxMjsB52VRnb?=
 =?us-ascii?Q?0AoA/eJqXHuuWceMfrHGBF5vFPuG77gEtulwwig/Eo2PMZ4DXG64mYLr9U5w?=
 =?us-ascii?Q?knz2QddAwryIuNAFcquEl4kboJ9zRrhnLYafchzfH91ngMVO2rIbFYW8mYGS?=
 =?us-ascii?Q?j6v/PQVFUUhYQazyXdtfcRBP8AZGtY7BkiSFExONlMOg84DsrWx/Q0dEXv2Q?=
 =?us-ascii?Q?jcsnIGqeEnwriV3wHSJV9q4vshfIHN2D5PHAkAaZlqwQeRl6jzTjjUX7p+el?=
 =?us-ascii?Q?G3ac+AODNwYQ90vNCf9RQic3CjBuwRtgXXEulRY7ObBmVpxFd3ekrCkFGn/m?=
 =?us-ascii?Q?Z41esCLUQrSpfEKM0Obiy4XKnAQxY/tuh7vnf300zqiEAvt7ROmK9jtDSSv7?=
 =?us-ascii?Q?pC9ZeJjfofi6e07ENe/VmePdVH8VFyNlKONIW4qdfZV6/oiRl1FDj4imya1j?=
 =?us-ascii?Q?qPbI+9CxsIXuWAYaJKAf6iKHmj49fpdeLI7ZIo7rCT/NEP6JygdD1a/2Ev/B?=
 =?us-ascii?Q?1mbG8kz2zGvzZvodoDn75Gs9ZhjAJzwvQvKh7e76f/NuHWNKcsjfaJ5IjM36?=
 =?us-ascii?Q?1VoG2eEo+xjFFUcP1jaTSnixgJHkkGU/NWFrUM9fPtbIEvASe32x3REV8Bfv?=
 =?us-ascii?Q?UcRbSkgCkRsGG/Fz2VaCDv4hIM98W1hgN3Tki7Bw3sdA86M2DokucQn/aZBf?=
 =?us-ascii?Q?JaFmoCzl6D8IrS3k+P0M5DeXxwTyHrdnhgdHyXrufStaoL8coPZlB3BNqt9F?=
 =?us-ascii?Q?EJ0KTWhqvWaLfl6towL1yoX4FvEkzoSTPOeWEAoPnCYZUgvn1L8qd/+zhy7I?=
 =?us-ascii?Q?5u0sFk8ZZm/e74frrtBCd8Lb5UhZCgjJbFEALgIYeIVa+nomGYBPH22w1mXX?=
 =?us-ascii?Q?C1nRejGweQLqdt5NSW+e0LGWxLniJuYZqP6snB+cqWOmjdVON4u0pHbGbE/O?=
 =?us-ascii?Q?1tXdQmpQmOJa8YASXIUdLqOtLPzDjqwAXexgsRmjsWNhbSNVVZf5YkZAT0Ig?=
 =?us-ascii?Q?f8BGRNl/s7GsjXozTqoVwGU4XxkiD86rNu7R5NghEglZ141qbaudFgMnXB1y?=
 =?us-ascii?Q?Yco6Jr+k8SI+mA6BQS+o9SCE3Erg9ytfI5W6RJpRrFY9HIyPJ9Y3YD8SCTfA?=
 =?us-ascii?Q?Zz87aaSqxkPRBWjiUJc=3D?=
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
	ydKFo+vmndAzViTagJgEJ0A9TmzeTPjszyr1vX4seeKMijyGudZivHBO3bi1RDxGY8mFEI8ADe5woWmaAG3JEoJu7ajjpptAwjgWzJfwPj0AaGKGNTt5SqpYtRiujTEISsuw0mNwhYtPrhxzPyTwNjneApCqZis8Rr79AhtknqM22rECsRaBEBQrIjx1G81SSu04yvgTuPFXKGAC5GKcjXMANNoXvRK6LhxIPI2AqIV/54NVoEuSRu9zC+EMATZZ12TfHOHb64sAfnV1/LyPSf/vG0w6ecie8S4pYu2gzOagWnyKKq/IyaMPDWZobnXwDv4zQ4Hq0vZ+JXuW1Uoqz+WQQ4UXc9mgeehgVTfC+WWU8MDyCNkyKpZMBgfPpAgCc3xJqO7VlcCAewizej0SSfOahKADul02nz2c16MQ/6vRBj+ZvN8ak6ep4gx9MxoVDgKVOqwM3Z5TIHe9afFHcY0dN377Yyhu4OTpWXv3OiP3niT69lKNG4qnuZkPUDDAMnwcPM4BI6Mab7BAZnki0t20mOLz1KonA1eF2IfD10SS6gopPpiCfJuVfqAdzwqHPXg6gOEQndekj7r3XDjn/AwS8dEEDH6Q03X1O5K5JZtbbPjmOJDf7sxTlNOoODHZ
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43985627-41eb-4c93-b86a-08dd520e08fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 00:23:58.9656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RgEV5Yd3mXgHRRPf6owd7vUjO5dw6jkLTgYU7RLzZPhV8vNdG3ScZKJWHJB8kUHS35Dl246ZL6qFFUMqZ5G5iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR13MB6917
X-Proofpoint-GUID: BDemRdrKr7Zk0V5PLTLyKmK0ETKKxDsZ
X-Proofpoint-ORIG-GUID: BDemRdrKr7Zk0V5PLTLyKmK0ETKKxDsZ
X-Sony-Outbound-GUID: BDemRdrKr7Zk0V5PLTLyKmK0ETKKxDsZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01

Embedded Linux developers,

I could really use more boot data for the initcall and boot region analysis=
 I am doing. (I'm trying to build
a system of reference value files for an initcall duration regression test =
I'm writing for the Linux kernel).

If you have a machine, or particularly any embedded dev boards (like a beag=
leplay, beaglebone (*), raspberry pi, etc.), it
would help me out a lot of you could run this tool: grab-boot-data.sh

Optimally, I can get the best information if you run the tool with 'quiet' =
and 'initcall_debug' options
on the kernel command line, but if that's too hard to configure, you can ju=
st run grab-boot-data.sh with the '-s' option.
Please run the script sometime shortly after boot of your machine.

Data for any machine, running any recent kernel version, is fine (any kerne=
ls pre 4.0 are not that useful).

You will need to make up a lab name and a machine name for the machine or b=
oard you are reporting on.
I use 'tims_lab' and 'bp1' for a beagleplay in my possession.

The tool will send data to https://birdcloud.org/boot-time/Boot_Data

If you can send data for just one machine, that's great.  If for multiple m=
achines, that's even better.

I'll be reporting on the boot-time regression test at ELC in June, and any =
data I can gather in the next
few weeks will really help me with progress towards the test and my talk.

Thanks.
 -- Tim

P.S. If you see any problems running grab-boot-data.sh, please report them =
to me.  Thanks.
