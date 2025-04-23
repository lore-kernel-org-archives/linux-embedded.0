Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E2F253F35
	for <linux-embedded@vger.kernel.org>; Wed, 23 Apr 2025 00:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745369510; cv=fail; b=XA8lbV6okSysCcUu+P5kZaQ+6E1nD6nySDv4Ha3kMf0JjycBvz9a3OdNUHOptJESF06yM5jgoNB2PkR6LD2qXc+pUa+JVhGk4XO+PYyfsCz7H0kV1eerY7ZQuedXLTbd7vjy0iEJtIrl6ahgmi+g6Cqcg99RGI+evL5HI47HRu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745369510; c=relaxed/simple;
	bh=HgxRuBAw1r9TdyU5AUrPUprbqQNRbZlxPUZ8+OQQdos=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WDULw6YFD1GE1hI5VlZ4x1dsjdHIRHYROJVqjO6h+bN9DpipBXaYtdnyFP5vMo6WGu82Ja9a44etscl+yT/zrQ78bk10YqIh02o7PxBGANcpVfGtMjitP+FBu3YogAO+3vVlOyKruAsxtiHkoyRRiKkzLBPYPEX8Df6TXJQNQq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=VFZZATVW; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="VFZZATVW"
Received: from pps.filterd (m0209319.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MNL9kT014113
	for <linux-embedded@vger.kernel.org>; Wed, 23 Apr 2025 00:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=HgxRuBAw1r9TdyU5AUrPUprbqQNRb
	ZlxPUZ8+OQQdos=; b=VFZZATVWsPOKt8WifQm2Fpa2fHyUZwe/x/D52+g/McwLp
	6IopS8ZKzJLD0Wp6aVySFbRK/8rxVA900ErZaMdT5yiEcZWy/qz37JMUPZsKOLEu
	yDx8HLlf4fmDwzpNZTUzBFiDfjbLWNJEzTXSE2Hm7BjpMYJlg8RZx3+5kwHzDK47
	Mb0SEU/fDjllaWMw0+IqY1gvZbyv24ujT0vPEwpmhcnRCPIjvo6iSnKde6i4bRS+
	SeW0XwuJbSDvTzthwcYhpe+Bps+W3R48ap3xq0yvmrtAeFnnvnvdXYE8Czckzbwb
	JWg0B0xlY7BAiEUW+XxRO+YygSkRwezgy+KK0IlcA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 466jj5g4h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Wed, 23 Apr 2025 00:51:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTzApY3zp/zu1K2JIaU8rmrC8sa/QtvI4+g6KJBsP8xEIERzmIuR4I1wn4tCDpICI1iePyoHW/YGbLSxqjxQP0w1f18OcEZln3qXeDULLezOrsxxVWql94v5pxwBEawBJZrzZKSsXyLE4bo67Q3iNP3MnbZ6xkNgxsGE1wTZe6tyh0ofytZkA3IUw6JPq69puGDjOOnXIlXwLPBNa7ogu23S4erC/jxKg45f7GZR6IFQjo9t7vDCQ2gqsZqa4MvTRR5oaMH/z6rnxpAIwhL/J50nldiJms38+okIsKKOKtPh7+9TJ0xM0NeFT1b7VSb9aZe5rXHHW2RSM9z9u9C5Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgxRuBAw1r9TdyU5AUrPUprbqQNRbZlxPUZ8+OQQdos=;
 b=TGLN/SyBncTEGenkSY2c/coGKSOwkhxmYud+bSU1obnzrnSBSliXK/+r9g4DImram2ijazncuYWVLru4myM2m9q54sEtaMrqGasSpRMGGgHwnFGKSHnajzMILZ8RYm7C+9k6bDSDnbR170okLrnW7o2otUOUN1yA950ZgMbvP4GUb7ghcVv5du2/WB/Vb0zWlAUYu2gvIlvrNXWk8uTVY0vfRtdch968YxDVQfyG+CIJtdCs1huA8brZom6JK8iyPp5qBdZtT0uTYCCkM6/3JbBAX3CVu/D9xWADVYrzI8tTFBB7yVHGNa7biaNfXgvdU86lI1VYvJhb07prg7IHyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from PH0PR13MB5639.namprd13.prod.outlook.com (2603:10b6:510:12a::14)
 by MN2PR13MB3976.namprd13.prod.outlook.com (2603:10b6:208:269::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 00:51:39 +0000
Received: from PH0PR13MB5639.namprd13.prod.outlook.com
 ([fe80::4213:f165:7017:52a7]) by PH0PR13MB5639.namprd13.prod.outlook.com
 ([fe80::4213:f165:7017:52a7%3]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 00:51:39 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: [boot time] elinux wiki page for Unified Boot Log was created
Thread-Topic: [boot time] elinux wiki page for Unified Boot Log was created
Thread-Index: Aduz6UemdK6H6n5HRG2gZawPEiNgug==
Date: Wed, 23 Apr 2025 00:51:39 +0000
Message-ID:
 <PH0PR13MB56391BDBEF39974F69992CC7FDBA2@PH0PR13MB5639.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR13MB5639:EE_|MN2PR13MB3976:EE_
x-ms-office365-filtering-correlation-id: b10fd7f6-0635-4191-01b6-08dd820101e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/pbgOU+LkWCKH739gGW4lxyHyXfoO+zt1yQVava8THkqe615U30AuZi2RY48?=
 =?us-ascii?Q?npvICPS5FLdoXsqXd9H/FLPW/Jb2SHtTegowSSsWN1LoVUt1ND6dCvF/aAid?=
 =?us-ascii?Q?VynNKZFmcKDrzpyYDzB+F7ktkqcEoy8S7sydafFh0bN/qvnRcjvF9+0hGL6p?=
 =?us-ascii?Q?qNO7hn7PVGMgphXa/kACaRms13LOlNTAdrdq1VU2tJgvzeZlZImq8T3m7PlU?=
 =?us-ascii?Q?3kXvSiyK8Go/uXyvepfaQvPw4fyZK4g96jQ82FZbPwQ/LXE3N84SeqJKACHb?=
 =?us-ascii?Q?pm+JOmVJn8ME7lz0YiywOOA9KSs/0P1jf5j9+PPVKSQiPGy96CiAEDh+WP+s?=
 =?us-ascii?Q?997KsZgLUIimIvpTHCto6UfASGO0FhsWPldv5oGBuoGRcNZK6jbdMIiOuZCy?=
 =?us-ascii?Q?fCDFY4jEpD86sGtrdziWTy+9i08T0Nu4WQtWRac4+8q6d03XSYnfsYM+DMwl?=
 =?us-ascii?Q?mRmB78+nDuWKrELeiW1q0pA29dxBixT4IMyHRmtaVmzHxxCwlQ59XMRhFvR4?=
 =?us-ascii?Q?v47avHb/SaK+T13AY1CS0yg495i2PdNEETvTgZlzNPq6Gcc4b0pdAdV4fbLe?=
 =?us-ascii?Q?O0L2pz097Q+sVfFBTUuSmpd6s10uBIfAOeyPui3NXKRZsz05sVBKJ2TvX8B8?=
 =?us-ascii?Q?fHPTcvpkW3iWUq2auWAbw/ZPCQFQ/7lOKPWXpXbjkMgwxTGMnFXM7g9f5qcJ?=
 =?us-ascii?Q?4AB5uZ7HP8vKI1eco7qgLhy5psh+L4DC11EjN7G3AuqmzDm60xQAo6nqQgM0?=
 =?us-ascii?Q?3uBD6p05IKs65tfPZ39/KJ3goa4r5tqhXYYAhDQRSX25hAyZY+RCXPwVbYSv?=
 =?us-ascii?Q?yAfrCfNbsQkusrATfEKgwVFz1+U3R6TBT2uI9I83SqLLInfgRte2M6mj/pWI?=
 =?us-ascii?Q?wjoYbWb1Mzr2C8S0Rc0jlr0+JpGv0sndd2qfDhR1XYqekBkN9P/3+yjyrOlf?=
 =?us-ascii?Q?x1nOw3AESBH/Cf8PnSVu6p8aOgayrRs1p3TVrLXnMa8X38LgHNW+s7Pe+5DC?=
 =?us-ascii?Q?pMa8R6ALK8CGHgA4vevvSoLMUArl5u3tYPfZe81Qtas2ko3lI9SPaOGMot/j?=
 =?us-ascii?Q?iD0U6qxD+3qybPSdZ2B6lSQC3IlNGWlNCM6eSIR1sTDFWgqoJ6GlsfWyl5wI?=
 =?us-ascii?Q?sD2vJd6IKxMPntfNvfq2XxJlh7Io4QdMQeaP4/dq3VfdOGSsX5ohSLPA0Orv?=
 =?us-ascii?Q?4NG1b+BCg7vM3cGNaOjLssH4axLVUbnnDxvcb9eXN7ZNFUZ6K6GBAAhd5XaW?=
 =?us-ascii?Q?phaFma6uG0FPtLKWqgM9Rup7HA9INtmLpguU5Iw2ceTBYmTQBpTPB8v2Z+Td?=
 =?us-ascii?Q?PmdVZ9PB2pxNOI35ouYSS2ImwGADVLHYzIXOEZyGLbECRUJdks3bojOZsdAn?=
 =?us-ascii?Q?ErB5WkOdFarPXo/fMpYamUIFXflpfFJMxTWJ4eVKhxjMVyRIPrwcChdfJ7Oh?=
 =?us-ascii?Q?J1mx/5yzkGI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB5639.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uSb6s5J7y72gJ+CM+WrrXIjgtqYrutBvrl2mhFyMsC6KpQPMq2vOAH+hJVD7?=
 =?us-ascii?Q?XapGkbXJ3TIH8qlm/ayCqp3L/Qp680eW6EXMxOMtOM9ygAnojKLxZCcoakiH?=
 =?us-ascii?Q?/XJrn+L5TP6AycjcBI9Beqt3H+MeRjNyZXSO1qkkrbjti0RlhZZDzWajqUBY?=
 =?us-ascii?Q?lNxpR/wJ2dwyc7G/FTmKY0Gh/jFsA5y2NUR4e6C951KdkHX4Rr9bLP8wTAUQ?=
 =?us-ascii?Q?tw0BzH0L9RvM2dWuOsWpJWTVm0srrBIMyOHObIrPdmfnSseauiepnjasB72Q?=
 =?us-ascii?Q?4KX3o7+O+d8XQKFcFK+X/h3vxFI10ixMBrXnLGYPwzYLh/QF4o+8/J7s1sQO?=
 =?us-ascii?Q?ajPFhHdP4pWBJFhzl9TDRzIuRvZW8ky3HWDerRtL8lKHxm2RYt1jl30I24ys?=
 =?us-ascii?Q?lNbtAcT00iRExUcB3Kr+vZju1Yg/UnnMv+R2+LIP6hn/BpBnrGM8+199BryD?=
 =?us-ascii?Q?IfIL33Hlo1hOHOTT7MLRsNXDrbbUf8ZVKEopibv3fcIItwYXn1vGcUZyK8ly?=
 =?us-ascii?Q?gGLt48BKVLpM0XA2BDK+2bA+AdpDedq3KXwxWD34DEOeIGLwXQXSSaeNleir?=
 =?us-ascii?Q?3KdkeQirVhnk4w/j5nSTc3BLtAzn16xuQV0w9xMlKamc8onwdNNl7s7gqsl5?=
 =?us-ascii?Q?k9nWuHDbnjOtVvrGHVbO8UOo7LxOUUMpUJwFgJSotMULnwS+81Q1cdRQM9nQ?=
 =?us-ascii?Q?LQaW63PZPdSfCY+NKVxfyL5KU/t7YwlsC9zJQoM7vkKuaPKU06baviZdDwmP?=
 =?us-ascii?Q?Ty72fxVVySMYkx8nyB/SnM2IAbXQLmmVZfpzngLPOJSScGwOPGKE/tCzaWE3?=
 =?us-ascii?Q?vjwmzCe794vgTPxU3RjVyqI+a1BTW5y5iQq94MI6KMOTtrI7rlek8yViaZVz?=
 =?us-ascii?Q?IwtejArjriNuVYq3sABVVMRKUAOLzfwJX4rz665Oju9wvjs78BD7Qz82+uBM?=
 =?us-ascii?Q?ISdV46pPN5z6BV5KlWD4hUUHuUjU86kG+aRtHVifEyUMGHV8KoSHoBLEf4pF?=
 =?us-ascii?Q?e+6CMAFV2Ido8tY2dDIhi6HgWGvDq8BriKbVx3tcYNUpoh/fyyE7vGy0EQzB?=
 =?us-ascii?Q?mZhe6ZYvJgbfuglaYxwUsjy+U4qPazIc6G9uKNUyoWniWgmfwO0ghrUi+xx5?=
 =?us-ascii?Q?bJsyb5I5M7MDoqZFVeI5RtgKZubG8L9xdLauIhiEQxvLkIRIE0G11fCQ1FtS?=
 =?us-ascii?Q?HsJHbsVBeV5vR+2ysvkiOroMVNvuwJCJyluJx3LjEKyiO8KGH0A5QeF03Yoz?=
 =?us-ascii?Q?GfWF+HP3zxKXJLbezo/IptoFt6hJ8lQQrvxByGPbBajQCw2M/ArTB23cxH3R?=
 =?us-ascii?Q?M7s6X3kHwGVyqyoSs+P/WoH27JWU2kWZCSbk2WGwbD1OxpO0mxJaqGsLy2JS?=
 =?us-ascii?Q?AokpO1eP4SiVN4GFIfRvtzTI5hhOSPa0s+p4J1PnGgtT9UVHxhdHFUR3bmvw?=
 =?us-ascii?Q?59Bi/SBc7Q9qX5IyvtpOTHOwb1j4l5yqHZ4JAORCf8MT3Esya+5BqbR9qG5+?=
 =?us-ascii?Q?v0oy8Q10U/hXsjSlK9ZlVFXLc9AokENafN3b/sUIN5Pks0EXMpsHi9cRZSSy?=
 =?us-ascii?Q?Ck4kT1vkygC9rJ4ZNtM=3D?=
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
	kLuEjNHGUZ2pZ0jQ6jmFPqRvcNRc6gh2zbAkNuZ/ycN0j5EYc/R2ioiqL0HygTmIkHHnhig+a0aKa5P9XzO4RW9xn/H6ATse4VhzoblXBtYELBbdFTf/TskRaQbaYxl8fzD3ONyBXIdcvDppUwQtmNyHoK1iL/9ObNykVFVuziF2nV3c8tcGbB5xkbL/+zhMCjSECiVby8fQp01sQoVtbZnjemoseneop1G8Ei1i6WINCNUPlcDS0n7BhBUlrXPhsmxAgnbZBRQf7n3VQkd1jZlNbYmwffwFAZrMGzTCx2LaT34WAzLLUbPWMihVKykly1K5LtF4qZk6hrb8zvN5mnjYUSUn1L0ZHQ/NkcDuhkDrIhhmS/uwNMm4qu40AwiWC3QLPURQF0nZr6GXZOWyhRaQJDd/7zSAHpmBdiRcJYHHzv4mYLTLTtupo/IFpnTGUpNuesR0ULPPnifq4cM0rKvRfP79zyz+3Plh1LSnfLWDDOSINhumcQ+tv0749bn6v5buVx9tAaqnmU7IRhzKOhYvjhKXA/KN+PVx1yDsHGOi4Ly7hPGkh8w3n9UUfIP9Q8cllBqONcz5nR83fqjw5pkl7Oh1q58qlgM9H4BVhfnzkHMXExkrtGwSDROvbdFf
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB5639.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10fd7f6-0635-4191-01b6-08dd820101e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 00:51:39.4700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qf9eXPlwFlI8g/BCvnSaVXI8/ojXWn4esHPO6Yb2qeN5ewRGCgjJ+QFt6NUJxlZshJ/Ywh7jGhm2F+UsFC8ZSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3976
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAwMiBTYWx0ZWRfX4xpg8y0yNiZE HfYxbCuJRJjosocFKxAfgThPJ2V7+rIG6AMAhlBee9yV/+7KU+pIBjGGQcj3/MMqik/lBv1OHzf STjUVXwACOyAcOJ2qqDSY0XxPHDqRi4FzdccV/g3RB5d6qxVTTkaBjZDU0XOAqgDrBSQw4lR9Hy
 n8LL7FsaDpLf9P7OREUq4SAU8fdKE2WqiDbFGThSmPj/X2xnSWMEoaRbKCaxKHrULTzMFtcJuUq 2TnPgJkVZFeRxfufBlrPdpA8+yMITmZcuPiE6x/w1NYYaQFyRehsm2Ke8CQ2fkx1DOQAmRqszi1 uRcltvlSpVs2t1+kSO7GZIJx7LeACBQZwq0I/+MhUpBBNbCr7WmTNmeQ0P9LCuiEhLniisrAv6U iSMXWbrf
X-Proofpoint-ORIG-GUID: 6DNYFIOIMSWetVsFp1uXYrh3MsmcBDwS
X-Proofpoint-GUID: 6DNYFIOIMSWetVsFp1uXYrh3MsmcBDwS
X-Sony-Outbound-GUID: 6DNYFIOIMSWetVsFp1uXYrh3MsmcBDwS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_11,2025-04-22_01,2024-11-22_01

Hey everyone,

I've created a page on the elinux wiki for information, discussion, and dat=
a
dumping about the "Unified Boot Log" we discussed in our meeting today.

Here is the page:
https://elinux.org/Unified_Boot_Log

Right now, it's just my own mind dump of what I think we're referring to,
and some of the requirements and design elements that I think are
worth discussing.

Feel free to raise questions about the content now, or we can discuss it
in our (special) Boot-time SIG call on May 20th on this topic.
 -- Tim


