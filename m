Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C7F2264C4
	for <linux-embedded@vger.kernel.org>; Fri, 24 Oct 2025 16:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761323929; cv=fail; b=NvDoWm9fvMhqNdSUZjvB0Q0v+qlRWhXovUaK7f5UEQIOk/to3gFLKmrhJpW5xM1JocXXEmcvQXJt0GvH5zbLuniERDDP1RnbOIKeJk+9fPSn7GXsPOUsuQXCff3zl9kzf2nzLHMkAKIdAnokCSxlM7R5bqKsyXieKE/qtF2WewE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761323929; c=relaxed/simple;
	bh=unt53wfDb+92IP3c55n0MK1SXPxa5V9sBo6LOe14zdg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QtAmxQHbsueQkVpRcdixunB65al7X21axqDXlFZlHql+82/8nqZXrC+4FcpQiRDv/38rkwMAzm1DACkD7deck4t/38hreM7TUHAUIR2KAvDI1wPTy6E5hBh/z2onO+ulaWe+NCAawl+ZiZViaFbmE8T+CEXLCuf2vFch3YMwrdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=IMWv+qpB; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="IMWv+qpB"
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OG9V4F010795
	for <linux-embedded@vger.kernel.org>; Fri, 24 Oct 2025 16:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=O3+7jyDcvfYBbGheeDgHBZtgml0iv
	bW2PXascNJPGjc=; b=IMWv+qpBO3zLr5pI9vKoupFdn/XMszSQEnY5RZuIhBEb9
	p9TC/Y9qd+m/KouyUVMSspSHJSoanXPW5/BOmsOAlrvmP7/iHnCLHpIjkHGz6DbV
	f2/f/KalHrTq0BjMqS2QcX60OBrtEFhNfBUxY+pt2SVqDbWAZptVTvZyKcXEihUI
	3ABXiq13uylp4m451rseoXmWCUNcpAdW9lpxj8ODwJjL+uo1TXFX/HL4/zu7lPcC
	DP5ANTRYimlCcN0xaSXxEB5DjweVhsHkqLlCUceOJoQVR/49b6MYnzQ+L1A/TEyr
	w6a2W7nNFa59JyN6kQGEpeicAoWhviEuu4Vjdvwvg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013064.outbound.protection.outlook.com [40.93.196.64])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 49v1p5ygqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Fri, 24 Oct 2025 16:38:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oh8kpxLns7gZRWz+1bsXfya6IXRUauRy+AhPtV0R6zuPCUjZEt0LwpO6CBLzZ0HER9SVbKUJ7agWlurNY8qo7xH2VmH5Yz3IQoCB4ofwmnHfl8+lp59ZvhvKJ7AvOeMspW4Y8Q8/W1tTarX+172iF+nbMY4bKl7pOhGwLD8AuRa7GQBfVJKar/kAMQ91+dk88J9U1nBfQ/03A8X+YT5KNNI/4c7lKWyVmKwnNRS5ivbWlDgQ4eU0g8GTMVs8u1mVydv38eVY87SEOvt1gXtqEFDigBuY68kWbIJDXfvzCzoRtvfSnvuZ9F97p4sdiKSowsqaTAqk1lzD6JhYZ1IOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3+7jyDcvfYBbGheeDgHBZtgml0ivbW2PXascNJPGjc=;
 b=RQMDLfUFDwCLNj7GLy8UFgg90zk24f/K7qTXWIZiSe0RRBZYAWM1xHpXaO7c765pLiDJYJZodP3Rfv+rqmaRbles4ESbJ6oCnOc75QcJ6kxp5cTX3Ps8rY06GECZvet6UFtQgjFDgwTBLSqRhwuVcrmCYFcZQWwitUG+foHIsDzlC6DE1Ggh8P2eLUWaxHIKpHBAgbEY5PQNS2U1vWco6+J23tgn4dQ2Jk8Hfni19RtBfQEmhpgf7F2z9qJSv5lIiwrLhj3hA7R2sHpICCYP2LLuJZdHUva3BMq7zjFYCK020IQHDJO9ePjJViem83ImGaVzkEM2bhYkNR1V8++uQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by DM6PR13MB4432.namprd13.prod.outlook.com (2603:10b6:5:1b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 16:38:38 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 16:38:38 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: [boot-time] Reminder of Boot-Time SIG meeting (Oct 28)
Thread-Topic: [boot-time] Reminder of Boot-Time SIG meeting (Oct 28)
Thread-Index: AdxFBJLGVA9UJSggSES+7k/335nffw==
Date: Fri, 24 Oct 2025 16:38:38 +0000
Message-ID:
 <MW5PR13MB563285EC707304CDBD4F8BB4FDF1A@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|DM6PR13MB4432:EE_
x-ms-office365-filtering-correlation-id: 41b9f5db-afbd-46a5-2348-08de131bc8c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MiADsaHWIaObKDjNQ0+CfL7l3URtsmo7q/bxVvdvAikVBfvZXVggfyIjkwzQ?=
 =?us-ascii?Q?5yhCadeskL6FFXFyZG0iBEZAuuX0m0ut62nrf0gJvQKpd8qA7cCaSyfQswCN?=
 =?us-ascii?Q?tJSFu4ZovvxzK998wEzkydF9Fp1RW7S6BaswxRIq9KhCO7hWRv1oJLBHzXV9?=
 =?us-ascii?Q?jRjdpBOF/hojZn2nWRFmY+o7s8tHtwf8rvb9Pt17pX7mgGqRRhTczD4MEuNc?=
 =?us-ascii?Q?B3ZGfeR9kc2w+3GJCZN5RbCHREiORYRiCYgwTYz7qjsAgSX7ywYVWnokC/ZL?=
 =?us-ascii?Q?w58PIM0XqM0rtKSFw0P60MSb4SzBmo34lQCc0OEp62XtbJ+JCJPLvCcIxkIL?=
 =?us-ascii?Q?BnBS3jePZrFltQCHP67m888igFM0tOJo6PwAl+UfQJO6IGaXFqG1pKS9xlNJ?=
 =?us-ascii?Q?S7L/nlWx4LqwakJH1q9k5A+n0zVv12f16zuTwJ37xw/5hNB/solzPgAsEE2w?=
 =?us-ascii?Q?OcGHIyP9awANlLVLh0ymIfkyjwaNM4eJDhxMXOAmLdYF0RrzEvvplBGIhAhM?=
 =?us-ascii?Q?6OYm43lJOHC7DhJez9F+hzK2sAtsZvKVhSIx8BD+MA/nJ3aYt9wE53KUC7BL?=
 =?us-ascii?Q?1i4yN+JnSBPFKXOJKvjzXD96cVsjAQtVFI2sGAccbXjZA4pMNtm2GPNeczjE?=
 =?us-ascii?Q?4S1o2aOUnv39BXwq07BFZzv4ft6oh2c9k1D73hQ0CaLuAr1CNCgHcZhFqXp+?=
 =?us-ascii?Q?JQgR2ifN2dwEXtRzLp5ZkqvXUbgeJXACsLvt61VjBtBfUd9rhftFJwTFF1js?=
 =?us-ascii?Q?zKizi9cLs2j2cZWvhIpSfZjhBbBImEscWszkvyFovjrClPFby+A0JZvGX/KP?=
 =?us-ascii?Q?H2BMAAhmpiYcfFIuGhz1LR1WTKpkjt5LT2Fa24DSFtch1ddgItm3Qw/CZpJu?=
 =?us-ascii?Q?L8xJxaffJaTRZqfJHzZcU80XkgICGSWxyIVWuOWxzg2n4rXCVjWZhK+cWqDx?=
 =?us-ascii?Q?xeelXZ8l/votu9v19qmVNZqa0Gcd9jPOPcONJcFm8VDMAYOXLXK9xeOL7HiM?=
 =?us-ascii?Q?Gfn50/B8whItjRRQDUA4T3YxoB/jU99F/HRuxrGyiIKsWup8X5+ndgmTpg5R?=
 =?us-ascii?Q?4t5l4m7PwLKGsPhMDjO0T5LGtrFCJcFMucqpn7zZINTn9umrsP24GAu4+P4V?=
 =?us-ascii?Q?BgongXQY6egVxWTe34VMxMdGfuafZv868dKqBBb3zdHjP0N8OIvMnTfl90PV?=
 =?us-ascii?Q?3X3biOK6iL77Z+I2DZkXqJRRAb2Mdu/b/Zq7YFGrV4xNpnOMlOxIVyyrdue4?=
 =?us-ascii?Q?IJxeCYomFxjpfVq2DjMo0mubdBWmz9iYunwxPcMHjk9lLLzv+Umd/T+Rkecq?=
 =?us-ascii?Q?HeEhNZngHw/1hhkFqBq8PPwADiBwj1fUl8gIU30dUNsFYPpQykVIbTa1wmvP?=
 =?us-ascii?Q?M18SSMFj0JS5G87sTXoBh9AQ6zBh01CXdIuzfqKdAWgXD9t4x4pf1wxC8OoG?=
 =?us-ascii?Q?fsswlCA7fBWH7+Kmnya/6NEP3JLqNcaihJaA3O+t84003JR0+se0yw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hQEntglY5jCZF0M+CsaWNZjz226vLhG9ubA+Qod2zc0npsP7BMXnKNY0qMaI?=
 =?us-ascii?Q?+KE6dgpaSYeUPAexPQBF/3bgmVTjKWFCQ2GL6oHu9PKqh8vUnzcHHJfz6f/6?=
 =?us-ascii?Q?DAcfPcVadU3zkxZi4yBjLK71i0QJyck5wdmB0xX1lSinh/6Jn6tCyOYjUyHr?=
 =?us-ascii?Q?6aumdZvSiDkgp5amYbksk3YRGbiupwUb3hV367mRvkSqgx4Jxj7hdKygdZc0?=
 =?us-ascii?Q?ZZTbVKO1eLP8F8PqC8rReH/o+4meZf9EbebbLQD9IEJ50k7FyY/edB4Ws0hd?=
 =?us-ascii?Q?4U1X/KQ8ITwV8tCDmpQfN9NqCnZJkqR0IKIwhDfLU08cfciu0xyoPbAXfax2?=
 =?us-ascii?Q?l95ouUOqQY5OIXlXzT8hAgdu05tJZsZCU7C9wjKDgWoub1qSNHiMnw5Teb93?=
 =?us-ascii?Q?xcleqZ6NEhLrYG2ttWkwhYSNIgG4X+BL/PH+yZUHo3nOXrveKzCOSpuQyqAs?=
 =?us-ascii?Q?5QjcRJlWnyoBCkNHGAMqwbca7tgN6mWYH3XeVaq0UpV6VAney7DDdig5OcXu?=
 =?us-ascii?Q?iOfrK6kEFhqRPe8JI6QKynMf/XvJwwUieYpcl9UCmQj8yu4D0v+7Tz5Q4q/Y?=
 =?us-ascii?Q?VenW04LbfiBmuqUQWMdREqfLWIvYP/HTb81IHzy/ai0enH3FKjFqbG0hQMCw?=
 =?us-ascii?Q?Xe785O1JAAk6O0FY3hntQGVPY7mh2506FkmJJpmwjkPSAO4JITKRE0VqkNOH?=
 =?us-ascii?Q?KSq2DEkCdXUi8VPQ5jkcfY6qTU7ndndpkHonRf3NQN+FTHiWPdjEyGPog9gV?=
 =?us-ascii?Q?Fj9CsW9PanJDy1hqxWMDaF2RseHXCiI4FAlO21u8DlN8udRP92MILiLFi0UR?=
 =?us-ascii?Q?kui1qdcAHuoUKbsk7Jm2u7qZjPfDnFwueTPT+Fr15frP2uUaplZSGBmAqORl?=
 =?us-ascii?Q?sQeS6zNJzUayDhxbuOYFPycjEObQx7ijGTtiQDmLM9LdmGFzwb5WIKAVXBps?=
 =?us-ascii?Q?oKFZFJHvhb5YBibvCWCanJXXoW+05qqJ7woBtTxKT2r5aa2d23e4j2/h6UnP?=
 =?us-ascii?Q?sTSUkPbh0KUc2FL2uqzK/WXTjKiTRLDEqMrsjKKp+IxJvuss8wWpLTmZdDEn?=
 =?us-ascii?Q?ZPtl6vmPl4pqdvkWhQBN/U8fGnV6Srb2vXJLTuZu8tBPYH9byPO3SyOikTnC?=
 =?us-ascii?Q?3r5A3QigeufJhPZxhK2v4giYaKU/rgiQWVZ3OhSWwwxclmX9F32pZgMWWWWW?=
 =?us-ascii?Q?jt3IMu+ocARet0HnfEtk8pz8UloEgsii7f4Em3QHwpSiEMa0RMQ45cK12Q8N?=
 =?us-ascii?Q?scqV3rcARhfIFPkN7FHFzhhkN+l9MavGlXqN44zMNmazIYp0x5M4DV/tDdNL?=
 =?us-ascii?Q?jegw6ilMd9GEz/dR5HvXd7XPhtMKYshElr9cqgt2fsYqp6osmadYKhLpVwyW?=
 =?us-ascii?Q?9tJr7rksj1ntbTTgm3GrlFh3PrM5BtS+WIVwVlUWIRl2nPsNkxTSrNZV6eru?=
 =?us-ascii?Q?9R0Yl0Gc8yKGjMVSBfeeyw+fXH9ZBbtM5j6UYyvFxfx54T8wi2CRHDml3cB3?=
 =?us-ascii?Q?qo9YsWOA6r8MLbXYH1d/SilQx4wPaQCNy6HPedb89gweVhfoxvFIa04GXuMZ?=
 =?us-ascii?Q?FDIoOcGAkjT8guzoyMQ=3D?=
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
	vU2wzWKBLxPIEmge8au+h0clGMqQC9GmtZ8zjNbXvG6NsUIiEaWI0ArpepeBmTAC59z+EXvzH+DqCVB3bIP9iECZmd5BO/Zv7xHUI27n8mGAUTILuirlxltKM+GMC59parolC0UKRVMcVwbOU+9V2nfCA1t0C6/f/QBClAvMKmVxSFtbod6DAsheu1pA0KmtbGORiWIO1UqyZe4LNhTuRAssrhrSSg5p+msgo8/XDsABeVvbCF7kE8XPwb5TuqBhrnVjT9SZcqGYvlh7o77IT6C3bem0Rw0Tj0A9RiQ63QLiJm6t2zaE1zGiff0ITTQR/s1Ej5urNyGXtM0Lofs77t8oQfKPspvlkyzJRZ52At0yQy9yYYYzEeGKwA1URL0za+3TW/0k2jfBev9b1kVLXEL3MW6dlrDztSNQ74qvJW9L5PCmI9Gey2gzn0r4Sy6nb/wgwi97nOlGrVr2F+yYsx6n7WOiASPsla54mZTPVC8gQxS0aFvxitWINFKtHX66wDXEk/CATZrvocH3/VepTBFWPTCtXPIf0GZkPTq91JK/pb0Xy7gRL7Y7omrWORnQZugfODLYZXK4Qbce0EWVWKa1F4TdxWU9UJWAjfsgLmkyA73mSQ5HCllanPIht24X
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b9f5db-afbd-46a5-2348-08de131bc8c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 16:38:38.6531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: klU2vFU+OA7n7aQ/5G8q3gnWbWmeQ5DHV4+hM63u5PvAZ1u/dDYW+vfQO6VmyLu9OkATNjM4IlsaiMJnRzGUgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB4432
X-Proofpoint-ORIG-GUID: svC0ulEP_qRijlYqoQ2mjYC9j37m2v3f
X-Proofpoint-GUID: svC0ulEP_qRijlYqoQ2mjYC9j37m2v3f
X-Authority-Analysis: v=2.4 cv=NoLcssdJ c=1 sm=1 tr=0 ts=68fbab94 cx=c_pps a=Kac4Oh/pgoirBk7HbaAweA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=nXA5WNwiAAAA:8 a=NiL0GWOVAAAA:8 a=2iSxh-PlAAAA:20 a=OGjWj8McAAAA:8 a=ILDeWNMUXppn9k0RS1EA:9 a=CjuIK1q_8ugA:10 a=-wH59cBETLoA:10 a=U_XVwcaHIQkA:10 a=fGr-7aqQv4RST94IA8XU:22 a=UYjydHh6ynBBc6_pBLvz:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=CTwFTDRtctY-zZ8oRDn3:22 a=yULaImgL6KKpOYXvFmjq:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=SsAZrZ5W_gNWK9tOzrEV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxMyBTYWx0ZWRfX3K3uStNKcW1d A3U5b2/jtSTpIxgnuszV/V7agiwGa4N3PRSwJQ76RDksPj/pUXdn52ouXCdSpRnkN1Rpchxf/jz dtyG3BwhT7xlOao2+3Zm3fWWi/i9HBXp1zOiwm84wjwavVMw8+QHoQY0zt2YwuRYAvAw/nZ9pnM
 dObSU/BaRKzXbzPcVbcZoB18Qn/johrbDQbETO01jerSdhO1wvO7BR7BeerQFmjgcNrS1I8FQr/ R1VpOVXJ2l7w+oANMn6LP9wLZU9CgBPFag3JSJRXmPNTh34Qwrc1haOm+kH6pKJbvPGXqUgM6KO Wh3KLNWgG3/Adriq+cI7OC9BgWdDQRz2pkm7osaNlHgUb6hrziR/c2NKqvhZo/+qg+FGu6C90Vx
 KQa9pxUgMgZy5XfOGIvLicJ+uNJlOg==
X-Sony-Outbound-GUID: svC0ulEP_qRijlYqoQ2mjYC9j37m2v3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01

Hey Linux Boot-Time SIG interested parties (and other interested Linux kern=
el developers),

Here is the information for the next Linux Boot-Time SIG conference call.

The meeting will be held via the Jitsi online meeting platform.
To Join the meeting via web, click on:
https://meet.jit.si/LinuxBootTimeSIG

----
Our next meeting is Tuesday, October 28, at 9:00 am Mountain Daylight Time.
See this link for other time zones:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2025&mont=
h=3D10&day=3D28&hour=3D15&min=3D0&sec=3D0&p1=3D220&p2=3D137&p3=3D195&p4=3D7=
71
(That makes it 8:00 am Pacific, 15:00 UTC, 16:00 CET, and 20:30 IST)

I'm planning on 1 hour for this meeting.

The agenda for the meeting (and where we'll keep the minutes) is here:
https://docs.google.com/document/d/1XAufoTT6VVJOTMzKMoz8SyOss-JA9H4J1_yVXQq=
5mN0/edit?usp=3Dsharing

The agenda for the October 28 meeting will be available in the above docume=
nt before the call.
Here are a few highlights:
 - Saravana Kannan will be discussing fw_devlink, which can support driver =
ordering for device-tree related drivers,
   reducing probe deferrals (and potentially increasing parallelization?) d=
uring the boot process.=20
  Saravana gave a talk on this at LPC 2024 on this.  If you want to review =
that talk, see  https://lpc.events/event/18/contributions/1734/
 - recent patches contributed or accepted into the upstream kernel
 - ongoing work in progress (UBL, deferred probes, kernel boot-time regress=
ion test, printk 0-timestamps fix)
 - information on the elinux wiki
 - upcoming conferences and collaboration opportunities

If you have items you'd like to add to the agenda, please let me know.
(Please e-mail me and/or put them in the document.)

I look forward to talking to you then.

Thanks,
 -- Tim
