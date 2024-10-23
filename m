Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AA71F4707
	for <linux-embedded@vger.kernel.org>; Wed, 23 Oct 2024 23:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729726999; cv=fail; b=c3DVkjcXq+1g0XzdJXenrRSIeKyfZRg9VTyKn9P05Y8X+hRjFP5IAzPSMf5uu10bJXwHPXre8X6WmDQy6Y58seyuAiCaTpFFcV7zF2jr3h8Zd8aGFwCvxx0PMH9eN01Y1hnb5xO8KDa/RVwstCx480LkffG1u+nt+cUC4kol190=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729726999; c=relaxed/simple;
	bh=jIRAWKlOUZaUCFIPWJehvLdZYojo7L0ZMAlWjzaDgpg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=elidM1n09acEvEs/PHDTwYWm+2xLBkslAaXd3uLgJ/MQA9AaOJGTB00htGn+V1ioBDRuoRNCSH1N9mn/zjfqCxfxmi5O39EpgbIvbqUC7xat/ok41PjaCOovoJYXGl+z3NbkTTTqC2H7XSrdKp8FRFzWfaZ2kXI3HWYgIZt8hIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=abcjMpKI; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="abcjMpKI"
Received: from pps.filterd (m0209324.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NNK2dv025143
	for <linux-embedded@vger.kernel.org>; Wed, 23 Oct 2024 23:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=QRkKibjfeKPoqdjYTQlP7O/JRD+e5
	bKG/UUb93TafkY=; b=abcjMpKIXuvWoARZ9OawtwFNVRYoLtWIeR1/OHU8s04uY
	SFU/vskg4Lu855stkHzBzhwnI9zENnVpxW7NWOeLzHB3BUaxdkXDyOqPkeHATpdD
	wPr6x9jFpeSml/4kQQEnVZqT8e+euaGj0BanNT+Y7PrOC6UssG5wrhkGEP18o/ik
	x5CoJiUnBCoFkCuX+UClc/NxlTU1P6FmVlGnAIMYLTDd8N+DhZN6en5eAf87Uw9M
	XvBrjYOZiniX4+8A7OjVlRLogdRNFYK4fA2LfMT+YZoUFctf/uMV+BmHIM9k3ZlR
	WHCuobNQ2BcPHALqGHlhDLBN3e+97MNQV5ulvJh6A==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 42c1x3mgkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Wed, 23 Oct 2024 23:43:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtaMaGj2A9t5rnQN3WyKWsQvKFt8vQOxqoSMiWIOQ+fMuio7/2FEq/51ieCLvszFtHMmJD3D8AIl/t0jWUpRCoB6DV3QCuVNP779E1lfNG83Q8EoJ58x6r6c9g96ERjYxffP4w5VB5E7d5yXc6BseiUG3aKvPVqPWPcqQoBA53gHuNQwxFVyYx1zasYe44NNu+N2bOCl6PCL6kroX2D3aFfjRAAvZErvF30AfWEhXrtVBFANyjPyMit2E5h9xk078RvO8TELJsbfsBiawSooSJtofw46FwYNBzPggUHVyl4WHvLb9gFinUg5Ejtvps7FVvAZamJBljgBpoCIMiZwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRkKibjfeKPoqdjYTQlP7O/JRD+e5bKG/UUb93TafkY=;
 b=DZoz1Q/iyaMCzy2ucnPefZyBFDljxL1d9fJGFWt1Pj4k+Bt5/jRax1Afhwe9jmYkUQKe0lCmRoqtsSnLhMajCwoHc8ftC1Aqa5jAvNxuYc+wkrMl03J0p40FfkR1XDgdF+oPClVrhzyogSF2OhKD1inaqWg4Eqg5ByPNvCitL/bKxUFw15Mrd5IEI8iqpntHkvmp8geEvrzitndOAcqcgM5GipSEt4kXJeJfgcGdl8M8grWHpQJR07W0YW2Ra8XuBNaEplCm4ic4ZRV98AhnDhYs+6OO0W/3Q1pDbfpRP7QAxmyxNhNiGBbHU0jjY3MtRbhA1hL2fi6J8fhgvuIAvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by MW5PR13MB5437.namprd13.prod.outlook.com (2603:10b6:303:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 23:43:09 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 23:43:09 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: Boot-time presentations
Thread-Topic: Boot-time presentations
Thread-Index: Adsloi/K1savGaCaSKmqVZrVI1xmmg==
Date: Wed, 23 Oct 2024 23:43:09 +0000
Message-ID:
 <MW5PR13MB5632615B92A0D5ACAC24A702FD4D2@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|MW5PR13MB5437:EE_
x-ms-office365-filtering-correlation-id: a533b9e4-7390-4ee0-1ce1-08dcf3bc732e
x-proofpoint-id: d8690225-876f-412f-87c6-a7cb45557a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?YVLSUEFupXMC5IImN9OlXmox3xZIxzhPwG86xuAUJYSB8H8dedqp97BmT+au?=
 =?us-ascii?Q?Y7qZf3L4CNIMb8CStmhzX+cqjCPdBf/CnGzwr2wPpmYFPZ6lrEzS7zAXMcLc?=
 =?us-ascii?Q?8NySfs3zUo8ydCL2k7LT/frDXAytAtEryvn5pLy8UlsJdohbS6To4+nZEW3Z?=
 =?us-ascii?Q?PIOBXQdbut5PK5bpLIWqK9yEhXZY3j+fVIFyE45FGuFLLL+HbtzPoGyQrsYZ?=
 =?us-ascii?Q?doEQwZFE4w8N0Q/RmqMO44/YLjq7Xa+ghV95/WizbWnjg0gQXfgD0w4WbjQ7?=
 =?us-ascii?Q?/tAEgmaBqyGlgXK7/UQq4WUTFd77ZLjgrxRzpq7Maxuezd19uPiojqth5Bw9?=
 =?us-ascii?Q?87JSN02rd98PA2mDCM5ODBx/kHZdXYqg8RiV9wD1jZdITUlf0P7kOpdLQEAt?=
 =?us-ascii?Q?6DGgWttV3m7F084hplO8QJPvHJgdryXlhhdlgYqviLc0V48PWtmKzG1ExRps?=
 =?us-ascii?Q?CScLuTt3ML2EkrUaRA++p5ms9h3uky8AYQQVm6t9V6aWFzSIwiR+vcQZ1KlU?=
 =?us-ascii?Q?Fy9E+YVVb4NDSHrfdqvPl/e8A9BDcQngK4ewrdbV1Y83oiusqT8pzTX9Gni/?=
 =?us-ascii?Q?x53J83X9ZgLTkqjLbN5wM0AUPaJUib95ANcXDIrZj/bB2nT7XjCxVzmOLory?=
 =?us-ascii?Q?JJDdS/mwXDLXvd2kYeVXSvZ8S2KU8EtDFqbWVZ+wmzkzQvVxTAc04x5AMz8t?=
 =?us-ascii?Q?8nO011Z+Clis3m6xeui1CFIdHTLStfuZVNeu4ixAbkf6uG0nGGN9WO6ukjVH?=
 =?us-ascii?Q?kL9EjyEGWn4a8G3taJr1mcy2AYMlEPWWexuTqVIBJyZCi+0V17TxtKaAySDz?=
 =?us-ascii?Q?lAVb7GnEO3/OyCeTFa1WeZmfX9k9O3ptZVGstubvK1SU9InfLYWwBoJpoV/Q?=
 =?us-ascii?Q?TGlvfQpZRCEUJp6hoQwOxovkVxPI5oLj1hS4DZtk/3OHT9lP8aWJ6UfrDxGg?=
 =?us-ascii?Q?f2TsXl1QMG/kfhi9Uto6QSr9GVutTdS3Q6kUqlOaqbqKy88IHZkMCGNtYfEM?=
 =?us-ascii?Q?wThOtKgjY19+EE9bVqT7TLq4sU0peOCTKlef0obTzTKpHIRxcweaMqdw/CQN?=
 =?us-ascii?Q?GFiAgQOYug2IKo4GZMVdBCU/rrbpiGYoVUxwF9q8xg0627hp1uA3xOocTh8c?=
 =?us-ascii?Q?+UgPHGumVlCsf4wgQ6UtYulR3v2VoeEJDBn9VR+1v0yEc5SJQ1+59tOadc2x?=
 =?us-ascii?Q?EjVmuLEPz7qIxryJ9Hcuo0NM+KGFkb9vG2oVj8jB61Czgy6He7X7wQ1dfPl6?=
 =?us-ascii?Q?3VsrYsUs3t5lRb/nzzlrKPTioBVYyV+58/uDRWIzcKaLz4FmVZPNJRQidT9/?=
 =?us-ascii?Q?PwhKPV7IqDt8gHeDhwv2KfNStbOoTtaajw4oejPKgwISKSxJQWD85J5XjIAy?=
 =?us-ascii?Q?WarnN6heEzf41xEJfgnD755GZMfb?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JV5cesCFumgZPVlGyD41tIT8As1Z3G4NA144o7KFvvo/me+CXsAf4mAIK4LD?=
 =?us-ascii?Q?mfRp0Xd8qim/k2PoKNfOMpNgm+0sri3RhL0ZLDHNXTNi9qXuSJHiVhLqLAUA?=
 =?us-ascii?Q?Ek9bs6mIk5S2/Ei4u44umVghZvMkOM7tH9S1/0aEYdedtnzQItlB5fy3IwOI?=
 =?us-ascii?Q?XpyQdl1Q+Gq8vkCIp1IJhJ7A/L3j8vBuf7t0S6G2TtvpZWzyvm+38qs7cFwC?=
 =?us-ascii?Q?BN+T8euwW53Zlg5zzid2w01anCdU2RTdm9PL39z5N5LiIsvh8do8uBqs3QKw?=
 =?us-ascii?Q?kzmp7zMnjT0UQNRqk8Ywn9cBbSHfrViIszmWI7HyQanYoZmq9oxqEfNHqNOR?=
 =?us-ascii?Q?BKaDfos6ogi/JtMpHijaZ0u3g6Nijk0pgtrgtTl00LZZ8xjK5jFD54um9HBy?=
 =?us-ascii?Q?CJby39Z4OeP5Jrt4CiaEoaYsg7fVMFs6yyTAXLc1Tb2zWPgoYoxNs5BSh1Hh?=
 =?us-ascii?Q?gjRKEP2CzfkTZnWpc78J5bGZAvXXlYLWTvzPumLIWbQ5EC6eadzgSU2KYeCV?=
 =?us-ascii?Q?yr4WAgF4rBiI2DYLDUWvnsVaFh+f18rGBHhiW0vkpnWNyG3EAlcCUSREOEJ7?=
 =?us-ascii?Q?6KqbVdZGLMyjBH1ZGe2jLwMn20O6pmd8Xs0SrReZYwmDdzgyHBTuGmirV5tS?=
 =?us-ascii?Q?ylGc7xTh/YSwmfh6T0jUBAGeXkdBXrSmshrfTvNvNMaI5n84yizGVY54nXYD?=
 =?us-ascii?Q?2FK54Da8syxxU4FRItw3qNh1xipyeTefL7juWkog9lK+b9toFSuGZCTuM6jB?=
 =?us-ascii?Q?5DrExD5cOvf9sJIS1oRQOck0p4LcVVZbocu+TIORGWE8hS2tLtvnr8Vhw1jV?=
 =?us-ascii?Q?JiKKVcPYQeZWZOEsC5VQhXW4iJhXxzhmP00a75KabHn0NqskHjgKiap2WjFu?=
 =?us-ascii?Q?efsh1IooSpU3fJxRGgV9nmUlof1DmVSa3foe5Ica8Z0OBM1DxRF43kc8WHG9?=
 =?us-ascii?Q?vut/f9LCxsx6ntzM8hhlmIyIB/0UByZKbgZg8+XlUcIQNOGinBzS+wlafktE?=
 =?us-ascii?Q?sv+yDvNbh0+phwlCLM7YZVRireLmUxiVypbzlXKoZznn+Ru3egNyldkS82vi?=
 =?us-ascii?Q?dtq/Xg07zhFuaxOpo/L4+Z/xvJWkBztiKqWGp1Miu0y0iOF+/Z/uE/SD8/bb?=
 =?us-ascii?Q?TaCzYhq6pehjwR6M44oy3XB7Hrg/0l9Ho/z3x2fCR3hGTCZx1Due9t6kiU7o?=
 =?us-ascii?Q?v+e6CegdfL/SLcykRgY1itgBxS7niNk8umvr/WUcB8ueaB+dh/sO1SmFUmWH?=
 =?us-ascii?Q?tLCjzkkt+VtejUYw5XfYkCXpmUo8C8V+V7pCj3Vk19AD+RclAKrBpXtROXLY?=
 =?us-ascii?Q?PsBxQsBda2wvVo7JfBa2qfFNksSdVORxGenGW3i/ztAZcXet6iTkjXe2z/Ur?=
 =?us-ascii?Q?pJ6tAz12J4ygyxSOwc90WgpylUyaWF4unkIPHuVxkddxQ+RAzuJLgnS8dMyj?=
 =?us-ascii?Q?IquvvS7NWvwCamWZVmkStca58Pz5KqCpJ6kQh5cJG7TJ4Roeq+ah25E0fG1N?=
 =?us-ascii?Q?8eLzF0qkrQQqBNabDnGCecGUFZSnkxMWe5tXV2el8lKwP3D0rSVpL22GPNaG?=
 =?us-ascii?Q?dbYRwr0+2woKm4YjPwo=3D?=
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
	YpbI8RqslopcgQaZWVLGgB2D1XXGFrajhW3EoKcEYBSIMrREHOce31foHmCaBTYMHR/NHQbwIIgnxySkpZ8ERyJUMxsbBbMIdwdds5w4hxE1z8DRbx+iIeDaBdzuYidK88omy7QSJv3ryFsKT/82stXaxt6rAk+mi22UALOu38fyakVTvhKIMBu2p/yvuuX8tLkdoUgOawFIKpqSVbmX8ObJgHjU0wu6CfrrYbFz+jahcFfxeti1NSG0D7HFihhfaEV+trjcbmmfjs1SNG33RB0DgZ3TVAVtf8rjhLP/73SdGIlCiAK+hKikAAY3P3pBuHI9lChZjkiZgW0vi5Nx91cdClFnDhdp54eLq/p0d6MY9YZAjXQGoG7Sc85m7RCaxur7l4jrAROu0S3NmByJqEEW3ywh/4xJ04/luLkQBFtagACGPHdajWJI5aRQuQkVKG1i2OParrHnHW+WUW8q+x7ETxUcuO64jLhQxhR3/UFzyL3gFgfu6EHO1hdaaWNB19H99r+H6cBhUvdNYeJ6dpMmMOaRfM9NO8hLDWvLcxq116FMeSD6HsYsnmIdFVliz+vMR9XXQKBUFYw2Z6RZOtmHefPgYoI5Ei4pgxxf3kgAQ3ZlY5rK4FshHWfqZhzR
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a533b9e4-7390-4ee0-1ce1-08dcf3bc732e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 23:43:09.1155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GcfegoeT6Emjw3/ft5ZAQy1IDZPd6OhxBucI6Tw8twYeJjhcGC2H79J3VI6LWp9oTV1Nf9ZywZWU5hTczgJvEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR13MB5437
X-Proofpoint-ORIG-GUID: vwUrMU-gLPdFyTxxo_FF-yC2IQDv4kN2
X-Proofpoint-GUID: vwUrMU-gLPdFyTxxo_FF-yC2IQDv4kN2
X-Sony-Outbound-GUID: vwUrMU-gLPdFyTxxo_FF-yC2IQDv4kN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-23_18,2024-10-23_01,2024-09-30_01

Hello kernel developers,

I'm writing to inform you of some community-building initiatives I have pla=
nned
for embedded people interested in, or working on, boot time reduction for t=
he kernel.

More specifically, I'm working on updating online resources on this topic, =
and
re-starting the use of some existing communication channels.

First thing: I've collected presentations and videos for the past several y=
ears on the topic
of boot time, on a page on the elinux wiki.
See this page: https://elinux.org/Boot_Time_Presentations

I plan to re-work and update the information on the boot time page on the e=
linux
wiki in the next few months. That page is here: https://elinux.org/Boot_Tim=
e

It needs a fair amount of work to update it for recent kernels and capture =
current areas of
activity.   But even some of the old information there is useful now.

Second thing: I'm also trying to collect a list of developers who are activ=
ely working in this area,
as well as active areas of instrumentation, testing, patches, and technique=
s.
If you are interested in engaging in discussions about Linux boot time, the=
 main thing to do
is be subscribed to linux-embedded@vger.kernel.org list.  If you're reading=
 this in an e-mail
client, instead of on lore, then you're all set.  If not, you should consid=
er subscribing to that
list.  This linux-embedded mailing list is where I'll be announcing more ab=
out my work, and
trying to organize some collaboration in this space. You can also e-mail me=
 privately if you
want to get on my list of "interested parties".

I'll be trying to set up some meetings and collaborative activities in the =
next few months.
I have a few patches I will be sending (such as my patch for 'deferred init=
calls'), as well
as trying to build on some testing work that Collabora has already started =
(and releasing
my own tests of boot time, suitable for CI integration).

If you're in Japan, I'll be at Open Source Summit Japan in Tokyo next week.=
  And I'd love
to meet up with you to discuss current work and future plans.

This is a follow-up from discussions held at Linux Plumbers Conference this=
 year.
I hope to talk to you soon.

 -- Tim Bird, Principal Software Engineer, Sony Electronics
