Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD09645
	for <linux-embedded@vger.kernel.org>; Tue, 22 Apr 2025 02:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745290270; cv=fail; b=jTqHUvP45gjObkMkmSr09NdXGV0P4RmwC5CUNSycfC4Ktae8KL3UmosnHvxhXAwa9FfFfhjzR/xOzF7W/i35dg0pj5JDnBc01c4vkvIdXFWJo6H6zgliBzf8XzuQfHvMlRFxvyK1MUBNOr97JiwzOdseZTpV4OTLKf1990RKS4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745290270; c=relaxed/simple;
	bh=+wmcAeNOtWFsufa/fp/ig2hWVG12IVmy+kXEaja2n1g=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ImQpbI4jAruCzJAjXp+NsUAkvxOS0GwKqCSiWqHtnRRKMF+rEaG/B1wPmpBsNFJjI1MdaeN2d5xoLO/kgYfvd90A0n2I9fRnYhDOcg3p/V9PEtM/iQbIisQl2u3A2xg9NBJcTQ2iE1PqFtTIDDU7SL5/nDzCHJU84RI/h1SfEAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=MobeWlBM; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="MobeWlBM"
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LMw7vA026687
	for <linux-embedded@vger.kernel.org>; Tue, 22 Apr 2025 01:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=fJndmi6Qaj3L1HEQbElEY1ycgRgDF
	GreUnGfjxxy3oE=; b=MobeWlBMeB3AQt5O5vS45RvE364NMAizngUF+aa4e8v8/
	rAxJw0gV4KR/TDRzGzZGXXi8xdJHN/0JlkpPBJe/QLYNvHdNDEcoBWQEafooruPx
	IWrzHijKRLKxfLNwqninQs/t6QALvTlukm4I4YizXdSCMIlNxPj9ruLAjksawCfy
	kBp7jxlW0fhuKcPhySVG1wr+OBPcLMpr1dPhrIBHuwxtM1GZ331z8zcqzNDPwkB4
	sBnG4XUzLnX2youVZe6+0JpBY/U59wACt1CUBiD22zkWojUZ1a5KXYLxrGZxjkjA
	jtVdHzbFGzNFZ9YWdvOPxsgw5QSPd1rLBWeHIIeSw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4642d2svw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Tue, 22 Apr 2025 01:54:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dc4ZmdZSCspj0Ix/q1Yl8HOfEaeb2PnGWKz9ORLID7SbuVLGO1uLG1Ksln+4WvjnaOxlQouNmcF9PKmepryt+eANS2/H8i55XOs3alSdrAc8feRy0egK7A1lKN9w2ikyhc++CahTS9Ps63oo/nlopMUW3UGCuEuDWoXZBR3W0olwbXOPrw6Fqc/QpF811PVYG/t3F9eGbDCVEYgP4Y6HRygwp9RPJntpDnYZBKr8WpXznD+TUAfoSEr48Tf9qKKIfhbioIJ+v9tglG3CtYdpbnUe8rHd6QiP6Jaf5FXDYfxFR6lwYuOdUUaYnDXyNwU4w7KkoRWsoeY9F7Q1V0aHqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJndmi6Qaj3L1HEQbElEY1ycgRgDFGreUnGfjxxy3oE=;
 b=KXcZlfg8g8bliogyNLVENRhPSL0Sba63nmtdbbRKjsISLYtqb0lAvAfgPujPr+XYITNvGmS+5jhUranm1w0F65A9ZRdwlKZaBbFEUXkNUjgUD/OLf/HskCMDE1tW335HN7KnBX8I55AUCmJsffaw6kkgyEH9YuzCyUUsIm4bOlKdSP5bJ/a5vDLeZbQHDS2Zm/vhy2KhXbqDlgmHeMfGMh4aNkhjAuTk5AmutF5dmxabzMx9ThOCvblApe+f91UYl3MnCWW+u2qp4insNztBYxSyVU9XUIK/CxWO/y4ManpiQyK7WkUuil5yJIq705JWyUU9A2Fo2QASFdc/1Jhyow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by IA2PR13MB6677.namprd13.prod.outlook.com (2603:10b6:208:4ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 01:54:41 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 01:54:41 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>
Subject: Reminder of boot-time SIG meeting for April
Thread-Topic: Reminder of boot-time SIG meeting for April
Thread-Index: AduzKXUB2ibCmIAfQgWBJcLadJthXw==
Date: Tue, 22 Apr 2025 01:54:41 +0000
Message-ID:
 <MW5PR13MB5632DF2E1FE70ACD08E1586CFDBB2@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|IA2PR13MB6677:EE_
x-ms-office365-filtering-correlation-id: 6d4454e7-aa8f-4597-088c-08dd8140a581
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ULqmVopGmPftU65qWWRL4U+fYJulFcdfP9EyDGpwEY3RUWJ3ubj75VjivHHt?=
 =?us-ascii?Q?YQzzE2HnB806v3CIyRcx4PhT0fcllgjgz0aS8tnupq/ZRhKI7cgqLnJuMNPt?=
 =?us-ascii?Q?50BuJUP+M540t8hH5TRXBsA64Q5NAp4Flmm/wPcL4yiOd8aE1xWxMzR6zOYV?=
 =?us-ascii?Q?D9OQzqlCAqiBjV86uj3rN3AAZeoHiqQDAN/G+N8ERGTht+2jgtBq+yaMgQj+?=
 =?us-ascii?Q?4JPr2jpHJ6w4Koa5cOqtFCEw8FOKM6EDB1/rhMoaRfzGmgzmJn/JdmiFlZvB?=
 =?us-ascii?Q?xK+69QdKR8hAmHqrJDHsfIn0tpDulTnqVPu3WXZaE/NXQR2WrBssLos6/ALa?=
 =?us-ascii?Q?8BqtXE7vi/ozm6fcnTQRJzmyMnum8Nnq24ZJh0kZuPuFdOn1IV9iDh/t3ZIy?=
 =?us-ascii?Q?FFfSQQwMnNPeCTNwQJ7or036pQGB9kIqc1ytxi+eNnEjDe97RQGkbM6XcnSo?=
 =?us-ascii?Q?1P+gyvbsUi3ODjEBoP/pHiMV5FZsVdqExVIY9EXhW1ATgTsjQO5MfygcgZAB?=
 =?us-ascii?Q?F4fshMnRPcwYiPWw6okT76zsSQqObqyqkf+nSX2Ro7Nu+HNMEYUzDFhR33tQ?=
 =?us-ascii?Q?gSBiJ4K/ZQTdobQzfegwdH+9KMK258yhc2aM3O9LNAP/v1GBZ4I+Ebl5v7bz?=
 =?us-ascii?Q?Ne1OiHV1uVLXhv8T/85dpmWMXsu92ryUURZms9A2yjXwe33bbO9Jyh1C1s8q?=
 =?us-ascii?Q?4B/us7XevXUsm9wKI6W/p9PZ+2KVLbyQCPAEFqBN+J3P3IOhJrwdhRtUjWD1?=
 =?us-ascii?Q?GRXlcM7X8owFk9W03gwPer/d7tBLBP0B0WAQTN+nF0WCosfXWsrMjAKqZtzs?=
 =?us-ascii?Q?3swqK0UkRGAPvJvRWg7JoibXFAHknnErOZp64HVSBPF3MsY7zkPuwW5vS0gH?=
 =?us-ascii?Q?XWyPphIwHhxk6jopz5BbqF9JaKtj+0dJOR7AIVrlFfJT2cJOkrD4HJWrRVcF?=
 =?us-ascii?Q?A2l/f/3OCf3USAJL2FmNDYNoUDY6U46uqRoyj/QsIw74C0ULs61mKBCazpYY?=
 =?us-ascii?Q?3xb3prIfhc58UrK0XWAcFkW6nmvts/+9tjonH0o9MPlR6fX2zIG9JhS8yN2c?=
 =?us-ascii?Q?T11k4h/S7bn4PoYansMhV5cRj407Ui99HUgozodMrNIOfNCMcVow29qT9+Xl?=
 =?us-ascii?Q?Um+mINhCKbd4ijVx99nyV74dUBOVLYnlPW2OASrwuaAFPautXMIpT2k5Uj5T?=
 =?us-ascii?Q?gy6cGHaRNm8VEH/Rrem1ZHSmQYbQwD9tjzvX2fUWChqKhUlje1Tno9BHI/R0?=
 =?us-ascii?Q?cjZlfv0nidEY1slAVPNJaJciXW4+eCN0CkuM0DsjHvVX3nJNrSNTn1goN5m0?=
 =?us-ascii?Q?fR2H4uF8rjQF+cHovFhHI3PjvklzFI9BJjBSM62NfTgL0ohnzw2v6mE6B8ud?=
 =?us-ascii?Q?b0JHTOORfpIyh3WQl67HltAc7oioxfE2w52oEzdJ2zWoDo9tlP5SuWVelbxh?=
 =?us-ascii?Q?a9cpjMNPogo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zEEXNxvpJNS663QXVZKSpsmBe9DBruTARtuSD40rZizaY0d5oPIOfr6TZb1N?=
 =?us-ascii?Q?608NitAepr1ZBTPhGcsxyOx5hLsfbjxSx5En7OZ47dA0yeLGH+PeSTJLRW+D?=
 =?us-ascii?Q?RJQ8oELstsV6isTDvBMthm8FuOAO2j1UIQEgFVzJChZtELwAPSnUez6OEfRg?=
 =?us-ascii?Q?A0fgPCeWrwlOMnD/GBG6G8R7a9oxA4Sl4bZm3LK5L5W/tucs9cruiWUuDUct?=
 =?us-ascii?Q?to/bjGxomo7WnqLdtTxMLDUltkbxRyTSZZF15LFBSN3PSMAPSB832hMhQEv5?=
 =?us-ascii?Q?bXkHLIsqI17cNTHwcNB55zdkIcnKV0qcl+SuBuJ2cnU1laCZHdchjmLYNlyF?=
 =?us-ascii?Q?NnNvwoJ9ENvuK+XwNWvK+Oo8zGr7X8KsLqAtBC7vMgjNvOb9sq+WJCnb75Ar?=
 =?us-ascii?Q?d9CYmByr4zezT2qQ3VttF72AhF18WthB6KSkgsWDPCG1UvuLYBTl9/hDTwAV?=
 =?us-ascii?Q?8EM8i0FpIQ6mtW9PL47XYVmpXS9lIitqotNz85tBr8jeL4YtEJtAwjvgD/dq?=
 =?us-ascii?Q?HqZOU5pr8ucskUOdLo5BhHV7OL/3dNxVPmAXAxdqf4Bh+3JnOKKahsXlCWXP?=
 =?us-ascii?Q?bLlw8OzpLd49q9ilLUvU9duVQs4l81T0L4PbZmoOWWvsrzgAmNqGO8fUur5w?=
 =?us-ascii?Q?8aUdXwVTruuBr1mVM5HthOWMhik2KZ7j0Pnf8vcPEeJHsTwnTuuqxLvC04lD?=
 =?us-ascii?Q?Lpxhhz3xlUUZu8yBblzcK9TFK3oxVRgj66nNdvP9Ng7Tvn4CDmg09U7PgfNO?=
 =?us-ascii?Q?qHjypTOzYD8YGlUvNo90ugGdSAixk2o45cfn79LjaTIfJdhU7vkQhAoYTzzx?=
 =?us-ascii?Q?ZyxNdiUXx3zSgjrP66pzXsyktI3+pc6V5YmJNgTq7jk7e3xJW2vblcsxesw3?=
 =?us-ascii?Q?0AXcmueMQR52SKuV7+eUg5sDLSHhPzu9kWr+D1I2TU92r48rn1+Ilae+CLMV?=
 =?us-ascii?Q?S/oLJ+FJdFjWo1vubZniKOuP35OcZOOfnD2410gqEhCb5cWkfu7vPGjVLpIT?=
 =?us-ascii?Q?A1jFgU74uPbrsB2KS/niTFV1yGO6GzrJe1AQ+cgpfoT0zF+or+Lhn4bLml0K?=
 =?us-ascii?Q?knXwDDNO+OSp+Ud1fQXO2syr21CGgzUBTX6Okf5UrQxy9lMYjG1d15iYYs1p?=
 =?us-ascii?Q?Y3s8crEEu+UGkeC5dSjiOz+J04xFjagoRYlAE32sN4bixh2o/7DyyplvoT/O?=
 =?us-ascii?Q?LDlMJWTFMv0wkH2xFI7x9g2EKhIZshMDFxB0FPoxPtNwaumUoO2X7YUfPUqj?=
 =?us-ascii?Q?Gfol4IdAHFpEe1vHrgXWstwgm1I9jDxRx3Ia0os03toE8C8fXmOc6FoPPXUd?=
 =?us-ascii?Q?c6hdLsWF3pGiGxUsErHLmKZXIf1p+aBYLlHD/wEQfIBrjUy8FYufMLr1p0VP?=
 =?us-ascii?Q?o150gQ6aGovD2RecrL2hGeSIdYrv9OL7nLaW/SZdJabcLoqOtb/HVqnhNYpy?=
 =?us-ascii?Q?R5bgVi1DzUAPEUWqJ5J+uJQiwWu6AARNDDssX+GbxsP8vQ0ZIwscaMIzVqvQ?=
 =?us-ascii?Q?dlAdAx5d7djIZ9lTle1cA+0Sphg5UhD9dF0pBH4WTMW9Ku8LuLMMgmbiLL2Q?=
 =?us-ascii?Q?lS6SiC/NQBuC2UnS+AQ=3D?=
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
	th3N/dwwTojVRhnLKMimmvXJt/bBdHG7DsiCZrURX4CjwpCO1Exju1cTnOETwr9sc8vgj7j7JdvhCuNCK9tGE9GhxAGt1EWPChMqDZvS4onpie8gBwMvNpKk2qVtW9VnSQrs79pcOYiKgpG2lNFn3crP4oEmkfbGsyWXTundXSsH36t7W+yiO9jGbODE4y/XembfeuuiCkCsKyFYHvgegmd2lX5QWzpivAcwKwm+k8jQoMs0pUGtoKFiR2i6/hmuIkkLW5IL7nYDfXnL2VpikQpAJnzBHlysU7PZKh6FDXQOLFunVuEnAP3wpIHKXAcQYKRyrPFa1amC1WaRoYN9WhFj2sFa0ynwWPb5Lb/CgaFao9yI39jkwCL1xGFnCS+LhML8/SvRN7DqiC9eLPKD8lmleQwtZGOMn2cEhVVN2iRjLPoF4S/4D1sthLfyg3jAnM5XYeR2FtVgQkqP7JCNs66e9iCWb68gsFp1QgZzfyq+ncrkbNpIRYWYW7IjtuMpwj13gx92EVxXoLVlPGIjqEBvF+poWEJTFcum8qpnVZjASBuB09EPCzqWn3CF2NDo0ZmU0ldp9wEscXFIk5xIWJ1aMV92YSnR1r5QBuAbEnQkgz1jxo7nbfwcHfLRSSZb
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4454e7-aa8f-4597-088c-08dd8140a581
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 01:54:41.0601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rb/gOME0EbB6fuTVZQvEq+VgHv3V3V0DCz/o04mW0L+ZUGGzFQ4iRQrkvWC4BbFec+HWdR61D5aEw4a9XmxVqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR13MB6677
X-Proofpoint-GUID: mTr_1xk5KWwSD-RKBDgnAtioeP64cCE4
X-Proofpoint-ORIG-GUID: mTr_1xk5KWwSD-RKBDgnAtioeP64cCE4
X-Sony-Outbound-GUID: mTr_1xk5KWwSD-RKBDgnAtioeP64cCE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_01,2025-04-21_02,2024-11-22_01

Hey Linux Boot-Time SIG interested parties (and other interested Linux kern=
el developers),

Here is the information for the next Linux Boot-Time SIG conference call.

The meeting will be held via the Jitsi online meeting platform.
To Join the meeting via web, click on:
https://meet.jit.si/LinuxBootTimeSIG

----
Our next meeting is Tuesday, April 22, at 9:00 am Mountain Daylight Time.
See this link for other time zones:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2025&mont=
h=3D04&day=3D22&hour=3D15&min=3D0&sec=3D0&p1=3D220&p2=3D137&p3=3D195&p4=3D7=
71
(That makes it 8:00 am Pacific, 15:00 UTC, 17:00 CET, and 20:30 IST)

I'm planning on 1 hour for this meeting.

The agenda for the meeting (and where we'll keep the minutes) is here:
https://docs.google.com/document/d/1XAufoTT6VVJOTMzKMoz8SyOss-JA9H4J1_yVXQq=
5mN0/edit?usp=3Dsharing

The agenda for the April 22 meeting is:
 - Round-table of on-going work
    - Work on the Boot Time wiki (section of elinux wiki) https://elinux.or=
g/Boot_Time
    - Status of the Boot Time Data wiki (on birdcloud.org) https://birdclou=
d.org/boot-time/Boot_Data
    - patches in flight:
       - init/main.c: print initcall level when initcall_debug is used (Fra=
ncesco Valla)
       - analyze-initcall-debug.py (Francesco Valla)
    - work pending submission upstream:
       - show_delta version 2.0 (Tim Bird)
       - deferred initcalls (Tim Bird)
    - Are there any other patches in flight?
       - What are people working on?
          - deferred memory init (Qualcomm?)
          - boot caching (the Good Penguin?)
          - unified boot log (TI)
             - CPU cycle counter logging (for firmware, kernel, user-space)
       - Status of Sony boot-time work:
          - boot time wiki (grab-boot-data.sh, boot-data repository, and Bo=
otRegion wiki processor)
          - boot markers -> boot regions -> common printks (nothing publish=
ed yet)
       - Status of RedHat boot time work?
           - [Eric] - patches submitted a couple of years ago - mounting vo=
lumes - might trigger errors
           - Are currently tracking boot-time variances
       - Status of Texas Instruments boot time work?
          - [Vishnu] - update on work on boot markers (passing cycle-count =
timestamps between firmware and kernel)
          - During startup, firmware runs on different processors, with dif=
ferent cycle-counters.
            - Need generic mechanisms for handling tagging of timestamps, p=
assing data between systems
       - Status of Qualcomm deferred memory init patch?
         - Qualcomm not on call, but TI is interested in seeing this, and o=
ther deferred init work, mainlined
  - Review of project ideas
     - See https://elinux.org/Boot_Time_Project_Ideas
       - TGP (The Good Penguin) has some stuff they did with boot caching -=
 see the page for details
  - Review of action items
       =20
  - Engaging more developers
    - Next meeting - Tuesday, May 27, 9:00 am Mountain Daylight Time
    - current periodicity =3D 1 month (the 4th Tuesday of every month
----

I look forward to talking with you in the meeting.
 -- Tim

