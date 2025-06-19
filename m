Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DFF21FF5D
	for <linux-embedded@vger.kernel.org>; Thu, 19 Jun 2025 19:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750360028; cv=fail; b=bYWVXrJTcVG/PuteTivVONUqcAkZa0mBkpR1Sdsme4NxcEWUaCGSg9UpyvaR00OLcPiNvFwNQ/kNx4ycZLV7qfx0CupQXZqEyE6+gt+/uwkoTDAYD1FHP8a+kzxKWwRYRyEYn6wKD91dIwvvAREjuyOnce913pP6dsh+o4mp6Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750360028; c=relaxed/simple;
	bh=ldQNw0upviz3gb/FNRt8wa1lYoPriNiJJbt26VoV4WM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VBG42i4IxBu4N4v0OQ1qNyYcpGaWqE3j0rNP2TldDj1UFYLgb5RLiH8wyG0x8XYegAFx8EIbGIi2mVnYlUOypqPTmkaGLiHuKV+p2dM7J7bJWzxIugl2IM4qpTJg2dLvQE2X6craKcycLxX1vF/r/ukrlfL6mbIuOPnK8EFtJ3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=cUqqbS4l; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="cUqqbS4l"
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JInOeZ003556
	for <linux-embedded@vger.kernel.org>; Thu, 19 Jun 2025 19:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=ErcdFvvyQG4zE6ZcrRoR3e7cp9XAD
	72PW66sFNxyRMY=; b=cUqqbS4l//qhxvRlA9SfhcA0HyIPA5tawZ56BuXDh1Kl/
	f+4VpB3g+oEPP65YJVTQxoNBLXrpAV/BXn+8blW+YSbPQyrYDxpsAcXPtAiOk09D
	StSvrNOjGtSI+Hjp3C9Lr6fYKYI9GtfwMyfpOmgk7/gVdTnIK7CpJApZQJ5Rzzte
	v7jUrUnLOcsiuihYoxAaOeZgnTDFyo8GCi7zYxlIH01kPu6qa1FYtBJWKa7U/aNJ
	jrXsJEKSDDe4NkT7DIw12gteX4vO5YS/mChPXqROIv3GU8mfWsUUea30uuplFw82
	A2u/jgvPTIz6ALjaj3l41F4xBQTNOux2kt5SMW5hg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 479t53ch96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Thu, 19 Jun 2025 19:06:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxXseyVOU71Dg5thL43ljm+A5QDTnXktZ1ADERv7fg19Vk0sikXA9Tj3z/B+dC7UG2+3uNd3KnYFgd92pQqm6831ZXR6l6OYVqi6Lru1k7Z1wgGIwiNFJ0llfUlPw8wx98LyXE+/n9AJTAaGTkTynJHEV7q7G2UJw6KhnzE8oedhNngY4o+VeAiZZ+X6eqBj99Ms7jArIUy9YZlEcyTX5WHNv4sNzk2Aw4D3IpWgNNcDIXsDqgzfOai1m+NyjgBhS/COYfDBrBRiGo3PkyLcRJL/cCSD2byXgQDJrs9L98i7Jf/tibS+/JIE9ype5Yzr2E2aHv/4UjuhceJqlF0SWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErcdFvvyQG4zE6ZcrRoR3e7cp9XAD72PW66sFNxyRMY=;
 b=L3z0xuXausjb0lebjJn7gUOFs9ezlAXlvpse8d/EIA6QmD/C9vZCJpEGIhndSUvO0fqbe9eYsgLcoFGEVNXL7h0AABp5Af7vPiSlPKLELmAfN9QKRzWyeZteEe+yhbmEVpsh9/3UUcWgNNoLZz5YNixnEUuCgtDmLkzQ80bB6R5JHTXbTV33a0s35uu7lOCyQkMqktLaJXQwKfIA2kO2+p/J4rfO/DswWTNUvus7fjnd6v3/7QzdhFYBIYp4tr7++RvbcWZ0tqTVJJ4kw/9Shn+Mxd8O2R8Xb24d9dLs9/v1VumYXvP2L/tZFz5zK+BjG3bIJ+Vh5aIybUPcuEeJEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by CH3PR13MB6506.namprd13.prod.outlook.com (2603:10b6:610:1a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 19:06:47 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%5]) with mapi id 15.20.8857.021; Thu, 19 Jun 2025
 19:06:46 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: [boot-time] New page for tracking boot-time activities
Thread-Topic: [boot-time] New page for tracking boot-time activities
Thread-Index: AdvhSdQEPBO5vNr+Sve72t2mxktshg==
Date: Thu, 19 Jun 2025 19:06:45 +0000
Message-ID:
 <MW5PR13MB5632D3415109C228182DF2F3FD7DA@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|CH3PR13MB6506:EE_
x-ms-office365-filtering-correlation-id: 7feed3ba-81f0-4dfa-523e-08ddaf646f95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hy5wpUNQrb06m42K+vk7fKqiJmn4cVUntAY50WtBOZkFLlUKwVEHN0Qr+P3G?=
 =?us-ascii?Q?WlOD9YQloqOPDPMhAUKEj0XPstQkrivYTzP9ScmVZsj7d5H9LGrI83WpbuSB?=
 =?us-ascii?Q?kWcWTv0yiGAROnRwE4VV5SIT7NZcjRwUTMSckE7Wy794IEnCydROd3Zb2/gE?=
 =?us-ascii?Q?E5/IkpI9QdWaQmAa2BIBjjD9qoa1a0I1FBXdFBDLtwGklw0+m4fAaAPTSxj6?=
 =?us-ascii?Q?EmPzX5vVTIUQC7OFtyFNIkUwIGwja5ZWXT+qko2byND+Cr0ThWFH919S1hfa?=
 =?us-ascii?Q?2c6ovhUSUsy+iddtk3G2ih+qb491d2lfgY+/UL5lTws/nz7JnJp7dhuUUX6/?=
 =?us-ascii?Q?+a3SF/hkx4J+kQJufvNDrsL1a1UKydQbxdBRsoRegxC7rty5/QbldLKth39p?=
 =?us-ascii?Q?1NjLwkHbYphKhsiC6wbUAo8hF6xZ01qW2HKQsnD9Yf/TBZOVZxJCIC0/x7jo?=
 =?us-ascii?Q?R5cR6F49B4FYz3hc8OgwD9pr6JuBAfFbV+A+W2a13vPo/FGPhmIItopjd+7D?=
 =?us-ascii?Q?0bxIr1kotk+77Phm7Yy9bUiOIjfUMgLRY8gqxFIt7HVSRzeCi8wprWNEJqgB?=
 =?us-ascii?Q?O0XzGWWz+60Qa2+8+BMZmyT0jaTOdtgT+DgCGFyblHQ3MlQrxRjdge42xs4Q?=
 =?us-ascii?Q?IyLPvRDHF+sEWERMPrTdcglo603mKc5gDfXltDrh0X8aLydRgGURVyXCAGel?=
 =?us-ascii?Q?66AM03/zm7zASAqlSrXD1SH5duy98CUMTIk4UvvzJ6cKcnzm5P3msTVPyCYt?=
 =?us-ascii?Q?LYQq2UveFVgWo2HJnv+boBIsUSg8vKaSBTTehCgsWm8kxE05KCU1pYE4F5aO?=
 =?us-ascii?Q?RNfb8J54XRKx9NPnhsH4qjP0MZMiqlrODJSWYWG9Ay2xyzmSKFH7YS5gSWI6?=
 =?us-ascii?Q?KdVpEV6QxHZ7RlHebPtSxeFtg0s8N9EbGtE6aJ/kS1evf0SGyixN8uBc4Tk3?=
 =?us-ascii?Q?4VTbBhzeHte8bcpqE//RWhyrYIBbQUMQ3/T/kAjSgT93TS8iO9KFjFJB/M/7?=
 =?us-ascii?Q?Q+nTqR9ubpBgEtuQmfmGPamRqm66pHWiaTQE3CH5hAxHHiaZ9Egh7mhiOp14?=
 =?us-ascii?Q?eu1swzjQ54cqXlDhZxZkIOUiBuL6ndSWigehw7WNRGhNMjIQBgjfn8Di4G8w?=
 =?us-ascii?Q?ZIMHvg+lnDwW7igwH1wooDM0oz8ZoHq8rxEjgg+pLt1g0kIIW21eLgY4TwQN?=
 =?us-ascii?Q?NZxAET0vk+X/HDSPmSfAh7UQFK7FF9yck+DP5LIxbjnsuqc9JLTI/Royqx/B?=
 =?us-ascii?Q?XQ3ohAUIBdLhkOegwUht6t3KfRLo9TZ0CG/vN/mLPQZsH46rRqR/mKKwVJjr?=
 =?us-ascii?Q?v6MKXR9jkIetbws1R4zUyPrrA+yjSV1SYlq4ePZGr8Lr43kyd4sYUQEeX1HX?=
 =?us-ascii?Q?UoaqwfKNXoW2JQ0Ki70La571tNRtKoCQm1f07BBFPGMOIXIMZZy2RV8gNX8v?=
 =?us-ascii?Q?h0h40eawZ1w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ILv41zSGU+lc6gXuq4bFFpZOM53nM+Lh6CRa1oj1+er4B10FAWgzzasz5ltS?=
 =?us-ascii?Q?dUjiSLEatKtKi8K0vyVd0Vew4cBypPJn6yUqOJG1zsiQpRMWHznw2rhntzf+?=
 =?us-ascii?Q?uL5PtR1C4WYxSt/ObyJKXE3lImo3St5AqP1Q5A5GKPTPoGRnSbB8vcQtmpzc?=
 =?us-ascii?Q?SpriOZ+DZU5iv5IXxWHuXUXxPe/Drdcn3Qi8F1x+GL08OQt2KWCOgMkak6s9?=
 =?us-ascii?Q?GoME0lfLfdH3izkDmjh3Cjrch+TkjHfdEyfXXKBbygU9ZDJxWYWeFh3jwV8J?=
 =?us-ascii?Q?fexlt9e/dv0P/gd8Enyr1McFo7u9lWXUmGaQDWvZxPJRHOOCtaKRrw4GtCJG?=
 =?us-ascii?Q?Rc+pAPHpxIvWxNRxeTzdmnP2JmWyBZrSxmzbeI1yfnzLd0XOxBfyF56Ulrag?=
 =?us-ascii?Q?7bB7pL6Cj7/WgOQsBITRCL9YlEbThfVUAjnY1y0o25zJahoWkRUZJPMxhta0?=
 =?us-ascii?Q?UTDMlWHZfXBWQgpcnqXb5kHjoaGDVi2s9zAHqPSw5iDoMH+wEUzbyhxzLnw3?=
 =?us-ascii?Q?OwpUG4/tWjrJP4nWs08O9gdEJrydQ2Xd9v/bFGUcMuF+s88eQOjuEE8d02PO?=
 =?us-ascii?Q?/ps0L1U/bjASgbQupr6wkeShtjEdtnPZ0kVejE2S2IONw5NKXc+ewrZtBWPF?=
 =?us-ascii?Q?3X9knEpE0g2WBVvNts0MxIjRLdsaEcINKp1xxH9hf5eoZu+D52ZtQYFVHdYe?=
 =?us-ascii?Q?rc2DdshDc88XgP3qzef+vy3khiHhY8bJ+Hn40U71p1+GOcpibwlVbz6cU7cW?=
 =?us-ascii?Q?MuLhvbjjdJO2x4rMv3AoTYIuY0EKw1IJh2n3sSiny34bqsBIWwHWo/gsyE1N?=
 =?us-ascii?Q?Gif2NyEpdMA8kEp5YuTyxC1ndceI6bKojHj69hR0z/pXyG79pzuaqRf61xgL?=
 =?us-ascii?Q?CvqANFGoDd7EZvff8qp9tsEU6xgrg8eQHcEUe8Hhlf340f+JObsuJaoSlZDP?=
 =?us-ascii?Q?WTEmG2jXaG9FNHgnRVqa+73pDr9SMynIWvqO4DelIChSPdt27tpm4q8l76EL?=
 =?us-ascii?Q?mW66jEBOjpIMtj9JRcqD+QXaMPd5757Yrs1LQU4ZJAHXDA0gCI8xgvH8ZLqd?=
 =?us-ascii?Q?LMFbp5ADw5WA+lDfNreoontiBZ7VBTy6kDNVsxROOEzb8O/4IPS2ktWi6Y1H?=
 =?us-ascii?Q?fdpHkfy4vSFWUgysSeWKhhiD7QjwBQYmdD1DOdpUpckK3H33CtN9O0YY+M70?=
 =?us-ascii?Q?Bxxkv9xufsgd9fwwkABWfBha5nOBQRllCIAQWNsxzsjkNgduLgy1UZd3B3O2?=
 =?us-ascii?Q?mCVTKq5k0lj1Fep+SB34NcJIl7dDBBLYE5Op6eW0tDBKk999NOHWRS6iWwq8?=
 =?us-ascii?Q?qfcycFydubZLY8rzCZyMPcHEi14DTCFSWVF4zHBQ/mwHAZ0dw6ITiF+EL98B?=
 =?us-ascii?Q?LmHhMkjlB4P4W9Db1aqrNGXd4ANcA7FyqaHzADeF3rMaqa3dN2D94ggE+YSR?=
 =?us-ascii?Q?TsleQR/UnthipwiOi+WK47GzkPaLz1l/UJSfCIUUdtDO+ark5rwkbUENpB86?=
 =?us-ascii?Q?slGPb9nngUkMKOexRt7vV1nr9QUYn40/12cMLACobCG1EBcavhxLZnF7x0JP?=
 =?us-ascii?Q?IEobpO5A6urgERKHfp4=3D?=
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
	mCPvg+0NMthVnEzSM2AMVpzNb+YEUCoNs6WMYCTqpszWoS14bzFGz1oiwFl27qwdneOBLkqg7Qhdv8qI5DZOs3ZHvEAbKxLNaztlPx1nAUBzVjWvw3hsY6E8WVFBw7DktAC2iMcdB+yxljdWabRROm6VMZLJs3F83eNprgsV2JZepA60n4qTdryNoG3gN2/UkkwgcGLoECpa4GbFr3orDAMFUHYG5px11ri49G6/vW+tumoboQ5lxegXVn66f+1BTYnN2ALlgze+ZczUXejcrq5HVWZx/5IiVMfoND+1Qrz7zTOUhss7lRhsV5WO1qgztacZZlQev1HljZG7Kj+t2uzmYEKP2k0S5A3fC0X0eaVCGTarI0fHTMOlVfO/fKP4rcDnqPuXMxcXrsP1e4wOhPJ5DbYJ6DQkqNwoY3Lce+1Bvymp6hO/uIKrxnkqxSdzp4GQiBud7bmYSIbQ6Kzxb4eHdS9A6e7vNevTykxOkd0sdh5kLqPCjOWOpNClZtCxvg3HVmY2t6o6IMTjdMwPBX4ExNWLLdlf4YYjl6sF9p2sv1I//qNHOwsTI+Y9T7GJOfEN+ALOrlkQZA3La+WtMZASDaxsifof++kSnMYPqObFmpNBLzs37xMTTQn/cAsZ
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7feed3ba-81f0-4dfa-523e-08ddaf646f95
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 19:06:45.9997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LXgf4NdHJpS4Xm3BgXDadvbsfJjaxueg/K+wB/nzkjv8Vvo+2wvWiCTw3PwLRjsJXDLlvCXWgLhFXOedZo7NJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR13MB6506
X-Proofpoint-GUID: ZF5iKgaePECtctdz3x5NOCYfjfW3vnHt
X-Proofpoint-ORIG-GUID: ZF5iKgaePECtctdz3x5NOCYfjfW3vnHt
X-Authority-Analysis: v=2.4 cv=GJsIEvNK c=1 sm=1 tr=0 ts=68545fcf cx=c_pps a=F0lD6ZpX2VF4uFIdGQZaxg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=xR56lInIT_wA:10 a=vugxpd_pAAAA:8 a=Xu_aML22AAAA:8 a=K0lk9xvRrJn_MjdAfsoA:9 a=CjuIK1q_8ugA:10 a=u6CEsx33FqgA:10 a=dlIDbnWlQMEhdIxAeUMX:22 a=o_LaMfWX3WolavuFUIfu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE1NiBTYWx0ZWRfX62T2dg7sihNt 4mR+0zMByZFnb6IlEqJeFeOZo5BGgiBBb7rN5ZSWeQUa9R0SYf8QOwwUtEcTUyHDUSY5IaEVk4f OKFuY568crvCQ056swIBepFNP8vXrHGq68qpF4/ef1cbqBwwgy1GrRrzFCDMdCDrOzAizWQROC6
 cwNn5Fo/IbpaekHsTKQdnhccczMcSIj0xBKfxuV4wcpA8F8DmwK996k56ouJJEKHvXh/3tPIExN MV5Izn3ULTQfYD9fH5iOT0gIarv10kBqSp2JVsRlmJkt4ZiXPKM03Mx2Qesql/qsk6cZYR1tM6y 5esm5fHTPZuH8uzY+LauqLTKUeCBwvng4CSm94JebL4SKWgND7TdbV5cy2BRdN94ETMbfdGLpCG
 tX0D0a8wFtsb9a/VOFnE23zb2LIiwvS8/jJ9XQ6FxtsMToMflL3t5diwp8bcI5DETbRID/mI
X-Sony-Outbound-GUID: ZF5iKgaePECtctdz3x5NOCYfjfW3vnHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_06,2025-06-18_03,2025-03-28_01

Hey kernel boot-time developers,

This month, I'm replacing our regular Boot-time SIG meeting (which normally
happens on the 4th Tuesday of every month), with a Birds-of-a-Feather (BoF)
session at Open Source Summit North America, as part of the Embedded
Linux Conference track.

Tthe BOF is Tuesday, June 24.
See here for session details: https://ossna2025.sched.com/event/1zfle?ifram=
e=3Dno

I've made a wiki page to keep track of some of the things that SIG particip=
ants
have mentioned that they have recently worked on, or are currently working =
on,
here:
https://elinux.org/Boot-Time_Activities

The page is not exhaustive.  I plan to review this page during the BoF.
If you have a project or work that you'd like to let others know about,
please email me, or add it to the page yourself.

Let's keep each other informed of the boot-time work we're doing!
 -- Tim

