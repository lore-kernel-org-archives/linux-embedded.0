Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3CA30C0FA
	for <linux-embedded@vger.kernel.org>; Thu, 18 Sep 2025 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758225586; cv=fail; b=OWrhPxW9HY99h4iaVauutxyJRTh9IHMExmh4krH0K3aRP55O08AEZnKQkNCgmtYxZMiPZAA6WOD9HsNC+HPem9JVPAsnplKV5lVe0AJ4sJnDkHxxi2eXX6OZe0mATIbDHQkr36r+oCF92PdC+OV/cCYuVDtN/VVE9A5wINZKa5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758225586; c=relaxed/simple;
	bh=rEAWWe92Wbm0LPYgfVMjbeuf0D7NpV13uVJzUaNdXD4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dcN1yi56sAkavr5G00XmboprvLatQHSYM7CXB0bS/32PJEznB4FqfT0KOZzB3Vj5LmSpwaTBIvFMyTf3eZWnl9sgvS3LoQnhqva6REk6rMI9nP5rjm5ZEkBm5DTRWpAlEHcybJErrgZW8cAl6VN5O4YMVX7i5A7N+hV9ltqi5lU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=IB1EV6/T; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="IB1EV6/T"
Received: from pps.filterd (m0209320.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IJSerk004521
	for <linux-embedded@vger.kernel.org>; Thu, 18 Sep 2025 19:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=P6hAilCTzHzPbtR3oV87CPA9RxM+1
	oe2xBzfAVrPwO4=; b=IB1EV6/TQrUAnrwWNHBg7KfFlWSfefs43miGltXBbnbYY
	qUml3/xVdzWmq1mfwJ5vKVMg+31LuxGpJu1SDuRs4/DBvw1YXSrGmbzwE0ZurKFt
	FGQnafhkf7i96DJ0d6JAu9d+FnjTuCcDjJWXPcRVkyvOZgyikekM7rxepix2djpb
	AHH7IxyW3M+WqXouspi05voE4QmL1Dt4tYh7KastMEj8qaokfObVCnvdYAtJfbea
	lK86S9ZcxNKFxI3t4W6lV4GsaeVMaPbOdqvW3XteRgk+7ARbtw93qUayBW5UYDHB
	Y6YOkj0yI3AoxlzREJyIDQ9xyZbUFXeUfQWQAC8Pw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011007.outbound.protection.outlook.com [40.93.194.7])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 497fwj9xg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Thu, 18 Sep 2025 19:43:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuXHlx/MSJq/rBr+3uUw4+DKWA/Pmm0dAeZjM8Oq/G7Zel2f6Of+40NNBQkW+EPw25ZWJt/28nUBRBV6BM76jyxt2OVAkNcXPujabIIjmYxFPKQjROtFCE1+SstHEOpZkO3rBo4RqJ0X7fbiabAGyPqzrGFxwtFaU6FTBKnK73r50uV7y1IL+59FPI+grMCtyW3SZPvKxhrxoXEVmy0C+0s3TF38oakVSV/lapIZs5WSq1CzQ83gzp+O6w3FUer1g7TpeJHPDZESqxTyOiSkriZm+f8Et2S94ZwIGcb5pMxO20zE5uyzvMsofxlcdrUqjiKa9VZJ0n2QpfZu97t1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6hAilCTzHzPbtR3oV87CPA9RxM+1oe2xBzfAVrPwO4=;
 b=UkmudzrMsC2HGDqOMGFTsnkoco+GcTFo84u8DfFHGPinv275aRQh3Tb6nhrvA42fpDA26G7sHMFOW4xy9OmwtP353npDzNRnc3EnNfQVrb0L3t6tvDnqIO+IUZIyxrV139BsB2/muPxgBim4JshuU8UJh1UBUyexuRAA5LotTSkNaPYHbykYpAJCf1YjfGhwlDahMmRl8pmn+zJpSeIS35rSFJulvgiEh/dZIEmpzxKF/wJNDVj657FJ0tFvhfWWBKeYk/aMRt7PybPQrpxcho1zPbiIadSwZqw6ClYMY1+eu65ntyXWYlq4/ZxRh+4Rz3Vlt1olasWZqItATXnA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from PH0PR13MB5639.namprd13.prod.outlook.com (2603:10b6:510:12a::14)
 by LV8PR13MB6519.namprd13.prod.outlook.com (2603:10b6:408:182::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 19:43:48 +0000
Received: from PH0PR13MB5639.namprd13.prod.outlook.com
 ([fe80::4213:f165:7017:52a7]) by PH0PR13MB5639.namprd13.prod.outlook.com
 ([fe80::4213:f165:7017:52a7%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 19:43:48 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: [boot-time] Reminder of Boot-Time SIG meeting (Sep 23)
Thread-Topic: [boot-time] Reminder of Boot-Time SIG meeting (Sep 23)
Thread-Index: Adwo1IgYen6n/leXSBaWH3h9OvXpqQ==
Date: Thu, 18 Sep 2025 19:43:47 +0000
Message-ID:
 <PH0PR13MB56395BB2E2A052B797617225FD16A@PH0PR13MB5639.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR13MB5639:EE_|LV8PR13MB6519:EE_
x-ms-office365-filtering-correlation-id: f8957522-f6aa-4ccc-3632-08ddf6ebaf8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?yMlSCp++sDofaj+gX5GaeGXXwZKOvxgbEjbHrR5dWvWxGe45KnCakhufv0AI?=
 =?us-ascii?Q?/ewXfa0Mqiag1QOZzvGk04gfDjL/xCx3FwHwRrKEbVjrg2YNryvgYBYxPlxw?=
 =?us-ascii?Q?fH4TvrYUqDEc6PDVc28dbXDwVsqeC/leIk8b9UhrIOMzzultqTPKEtDPebNU?=
 =?us-ascii?Q?68sRtk+k5dDfceXpXpdkvD2AG9OomMDMRm/RXHIbekwnygRd3hNRODdjvZsB?=
 =?us-ascii?Q?YjAqbHX8d/WwPcdOpb++Zf+7STngG0sgZLLgl6aSPZvLXE7DtJPekjkQAdd5?=
 =?us-ascii?Q?J0EaeMW9TQhXrqt+9Aw+Q7syV48+/J8bn7Tv5+rWh8Zu9h/19qDuZF01kuvF?=
 =?us-ascii?Q?eRtj1YWyjIr8y0AGMssB6IzYynFjhxPfWtGFgI+b+YSGSon8rEqcciGiKxkW?=
 =?us-ascii?Q?qmC6FNY9E8kuUipSTSHfMoAnV+uief0hI7u2Ray4z243irhjyPRwn1G5r03U?=
 =?us-ascii?Q?kB7teF4jvQ9U7kChQFg1F198sWTPbD3wWP7AaMnD4T9zBMaSYFXjQhQwicUd?=
 =?us-ascii?Q?eMaiVDPj0FmV6lEv2DTFqruuMXPjzrepIOogCyzGgrbBLK2GB2mvhJ2MjeM8?=
 =?us-ascii?Q?likiOYoJvD/iwBjDYSayTWd+WbkoK0aQNr0j00jsBjJcPBhxk/Eu2P/ACWTk?=
 =?us-ascii?Q?/CCTRujuV5pMkN1/mwcv0pUdnrA7oOfh1mrj94ZAhD3nU/QfCZoxr9nhnwv1?=
 =?us-ascii?Q?T2YUPCkjQCQBWsEj9vHOrC29nFrZjWzDh5NO4fF/8Y4USKYwe6giFfHuJXTw?=
 =?us-ascii?Q?2tvlACwVmlb72eKoc1fszHYfEQRqNbddSbeXtw76HmaDv3GSuaznJ/zQes/q?=
 =?us-ascii?Q?HMUX5qCW78hqQ/BxyYokbItmnreC4YmILpNCoUvmwtV2LP7iHJxoWM3V9qZj?=
 =?us-ascii?Q?2FoRsb/TlKEZvbKQssDOLel/UX6rsvIW8yF10ba6NQlu0Kg5VnRSUr1qHH9b?=
 =?us-ascii?Q?/oQhx03pT6dmNWF0CeUUwcGxUGEZCII8Wz4RJn+Q3v7YF6CNht62b4Qfot7V?=
 =?us-ascii?Q?3e/ojq/1dJF0hZJ4OhQeoWGbHMTW826OM6HyVbxSMhBvTYgDQdq+nVypooLT?=
 =?us-ascii?Q?+a+8y4Lchk6MqMTisC1xfPkun1w3lfZYvV1Eq+/obkNNkPUE7TJuDZDFWm5s?=
 =?us-ascii?Q?NH+2B529DFJGCxFu6rWxketnAXpaczesz5cRRdXxkT9MsBMSx3vyb9j6xmfN?=
 =?us-ascii?Q?V5IyzkcElQA6tbQg8V9HlbzTQ45O/5XVYLO7VFvs6S+eWnqpmFfZnJuW2loa?=
 =?us-ascii?Q?gV7+25np+fgfdmLOZFGEQCsO7Li8WFnkYmIM2GZr4jQAuNxS5kaJ8DcvcyMC?=
 =?us-ascii?Q?/DXy2FSV8VOBLHTj1Kv3pvwsTq5vC3olDxPMqS6aWzaRNPt+UM3OjPpp+DL9?=
 =?us-ascii?Q?TbbmePhk5U+yqQanm/VDerhm/WJji29Zy+W5dEnaHEYuxnZAMvqe5fHRApD7?=
 =?us-ascii?Q?FOusEEfQXSkRcK0QusswCRH5F7bu4LXv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB5639.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?snlEWjDZYBP3aDUSvGEESi3ODVx5NU8iNdepfukD69fhPtJ4r99AaRDL2VVH?=
 =?us-ascii?Q?1DytS/2tA1LI2X+eAf0wszGeTdJH1UXmq9JRPEZfmwoGHBOVAmDxUGgppKXd?=
 =?us-ascii?Q?3ZNMBYkgvIMv/wFtRJW/tjWv6YdotYHIqqrjLFH/Zv70CnjtYgs7UMtRDgRN?=
 =?us-ascii?Q?A6srZXpIHu6jtC8R0hgIOrnqOYChqDg4O9qyHilgsYyfyVmNKM7jacdcZB52?=
 =?us-ascii?Q?8QAdLvruXJqTVgU9l7b1NxhQbooTHc4W/orJZI7nK5p93S3QTZ+PmjG/LRS7?=
 =?us-ascii?Q?6qWXYXfioXqL1oEWNDAjpMxXt19xip9EKJoN7I+66Sj8GDTe1knQKf1ESeSu?=
 =?us-ascii?Q?/BaGv9+YBiHnv42ykPwwwmbjywuf0R9svAZPfJ1A2rdCEYTI3yHVmV789be8?=
 =?us-ascii?Q?Dqp30VRbGW2FLGPGAn+lHDROSNdnYdHyH1lxFZsiVbCkrxVgMcHFTAKQCDbE?=
 =?us-ascii?Q?nY8rkiGR2ryM8BfereQ+n8OqoPBxOJQdxVQI0Zcu738Q7aw8GQPoVshBkEs8?=
 =?us-ascii?Q?CLoH9OBvxb6B+z988vt/AbQlidhWX/X+vBDO6/Ze4wvp3pfhJmrHaG4U8esK?=
 =?us-ascii?Q?vnWuaOzxScxGFqq2toBvV2ewUGjYcWFX71hUcOq9GY01irU+AKCUImMaW4Xt?=
 =?us-ascii?Q?hCBiM4wp+vFYRRypLHU+Ayb+zM8qpGa2VuimIM7Q5Qz0TZZ8pVYS/bcUZTL/?=
 =?us-ascii?Q?QvcvfrPA7Sz3ODaA6RfH2vjm3zLb5lcWq8Mb/TOLyCeCrATFlGY+jyTMcVuc?=
 =?us-ascii?Q?69ccweOEpyZDixGeeHAXEmayU1dISsF04bJ/CumyoY6sHFSEQLzA/4aKz8bl?=
 =?us-ascii?Q?VCh1mjnkP+JWwlzRtSoDtWnkSnauI5V8ts3PLNX4aUn1b0Xawp5cDUR+pSNm?=
 =?us-ascii?Q?k8wqk2ChSDsTRy0qt4TUNN9CzruXcnTauNJviad6Ryn16aUc+v+vyGiDLsoI?=
 =?us-ascii?Q?jA88855Osvp3V9lydQyWSHCmFjHS5uXTs97qe6xZGsmQXATLSY2jH8N5d7tX?=
 =?us-ascii?Q?D+hlKyRff5SwaY5fenEgShNLd7MH3ZFDS+Cy2zGJIcC0fiaFIvVnReaHtuSi?=
 =?us-ascii?Q?eqO9FIoTnbIyIg/Vh/Ywi42ggJ/0c17dp0K+OzLOR1I1WAGf3Nb9k7OaC1AN?=
 =?us-ascii?Q?eigjM7X4fQCleB9MG2nqEUQ9TpgyUEBqwYfhGG4w41Kat3BzoGQDqx4FwkF7?=
 =?us-ascii?Q?e5SDZnlYruv1Uy8ELb7ENkTBidQPIgFPYprIVQ7+ekC390f+T42c67SpwXnd?=
 =?us-ascii?Q?tNY50kGz+9fJ8ASxLQxQw7w3VCjOSNvpmjk8JkbWu54mcCXaW1GjYYxc0Kbc?=
 =?us-ascii?Q?o2sTWkCcpXKpPrqOxSEue9HddjRSw37fKBqxzNnQWDP65mHTR23GhEBDTEqR?=
 =?us-ascii?Q?+Q2mdNl5EjSQHmlr7XGx5WoMcEBodUvPTBX3tdKV50wDBhLue/rmeOBeV0O9?=
 =?us-ascii?Q?R0AVbp2XGtey7rmors1l1i3LQBjx8TkF+Q/bkFbYahFD1JqGfxdwxqT4NF1I?=
 =?us-ascii?Q?wjbor4SlKnLqPLt7inmVgaAghkXqPRS9jjCRnDBaqHbByVtlRLQ3RE/ClGZw?=
 =?us-ascii?Q?eoZig7KkWMbbIiKykJs=3D?=
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
	+MThlC+aBZ6mWBEp+Db2MHSeBC1cOKtsW9RuabLWP/CSx2CoteYZH86gkIA/Hy1x7jg3AoxrO20cpTRcjricugbxjYAaGMHLuX3RUkj1GXqokqdCqvI6trwN3TzO2gs9DA29f99Gt0jcFt86YLHUBLjcmw2Aef4p6ZapfQRGA/ciaK0UCC/r1/fwbEhZk9hijTbSJrlFc+Rr18bRcZvTe6KWLaBlXRVKE+CCCMG2H7SPrerB3kL/zu9dquGJv7yClcKZHwwRi+ViFKdxawpUY4kmkqH8uD+SkDKBGSBtZB3I8C5OaByB6hgcvSm7yqj/vrTUh6125j5WBckMUWTZ4osF2cNcRuYR5AccEzZM1wmg0qOU6mFWGxSYUVCLvHgYqRejGQDZtd4pFPXNCnyw3xK6YkDRkMGvjcv+oH0xXWslUvKLvQIeZWbb2EDZdO351VC2Xmte6MJLG5BLojpzMA+H4E6cZVa869FAl3cwSgr+3Z1ouxKMUsumn2bCcLtVdkutKhO31D5VselTPsU11XTIpcNUvxMbfom9kKoNwdHlowVfflInEt3HR7rL/+loA0DqfbvIw1/ruWLRpGg/d0nLT7TPgyXzWyRlhGYH49+taTYuzQzU1Uhkz7+SETEP
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB5639.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8957522-f6aa-4ccc-3632-08ddf6ebaf8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 19:43:47.9165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dPoC9LOiJbi33Nu8TvJa9CUfZfh4tAKOCHx3n4HqrUB8/E1eMpiFDgIwLuAXhAzGTGfvHsv7i5dYAS5M90j0eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR13MB6519
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMSBTYWx0ZWRfX8kkqu2afY+t1 rQhQaYBYvonXEWsSuiVyj58OTaods64GwdQtKQ1qaiICdSTrBykn2Lk8Up9ljtHYeUXs7Rpmyxi dSVDNfCmUNWxvFWaV1V63/9fpp3dH+lOy+98OfsQ48u9hGoVMujjTFe8Y1HhR6NLptofCVsJvWX
 o7ARj3X7RIZGyhpZ1P1/ChibrA++YJCtqCljCdoTz3hEMJKZb+Igrm2wDsie8TtValq50qJtKX1 fdmPcvFkcRZi9iPbPlOA0xwoIskOmn1cwmX4wa1P+3inmO8DGoxwXS7Uv8wKidSJkArHtMI+Sy0 UTM1r30y01/VzKxlCTNWjmPM/AUgAkicQW17B9UnGuucLsbCLTHdix/M5tK3tlPwTI5kAUggvXj R9x+iHTA
X-Authority-Analysis: v=2.4 cv=eMsTjGp1 c=1 sm=1 tr=0 ts=68cc60fb cx=c_pps a=4hG4CnY/eg4LDOVkUp5rMg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=xR56lInIT_wA:10 a=nXA5WNwiAAAA:8 a=NiL0GWOVAAAA:8 a=2iSxh-PlAAAA:20 a=Xu_aML22AAAA:8 a=BnlRs-rrYeL9vcQ-VeoA:9 a=CjuIK1q_8ugA:10 a=-wH59cBETLoA:10 a=U_XVwcaHIQkA:10 a=fGr-7aqQv4RST94IA8XU:22
 a=o_LaMfWX3WolavuFUIfu:22
X-Proofpoint-GUID: wK-bRywR3hkHTYBhxytRaB8bNZ8EtP5Y
X-Proofpoint-ORIG-GUID: wK-bRywR3hkHTYBhxytRaB8bNZ8EtP5Y
X-Sony-Outbound-GUID: wK-bRywR3hkHTYBhxytRaB8bNZ8EtP5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01

Hey Linux Boot-Time SIG interested parties (and other interested Linux kern=
el developers),

Here is the information for the next Linux Boot-Time SIG conference call.

The meeting will be held via the Jitsi online meeting platform.
To Join the meeting via web, click on:
https://meet.jit.si/LinuxBootTimeSIG

----
Our next meeting is Tuesday, September 23, at 9:00 am Mountain Daylight Tim=
e.
See this link for other time zones:
https://www.timeanddate.com/worldclock/meetingdetails.html?year=3D2025&mont=
h=3D09&day=3D23&hour=3D15&min=3D0&sec=3D0&p1=3D220&p2=3D137&p3=3D195&p4=3D7=
71
(That makes it 8:00 am Pacific, 15:00 UTC, 17:00 CET, and 20:30 IST)

I'm planning on 1 hour for this meeting.

The agenda for the meeting (and where we'll keep the minutes) is here:
https://docs.google.com/document/d/1XAufoTT6VVJOTMzKMoz8SyOss-JA9H4J1_yVXQq=
5mN0/edit?usp=3Dsharing

The agenda for the September 23 meeting will be available in the above docu=
ment before the call.
This is what I've got so far:

- ELC Europe boot-time discussions post-mortem
   - what's next for UBL (Unified Boot Log)?
      - discuss Kevin Hillman's feedback
- Round table of ongoing work
  - What's in-progress for:
     - instrumentation, reduction, testing, automation, tooling
  - Status of patches or docs being considered for upstream, or recently up=
streamed
 - elinux wiki Boot-Time pages
      - https://elinux.org/Boot_Time_Project_Ideas
 - Conference and meetups:
    - LPC 2026 - December 11-13, 2025, Tokyo, Japan
       - System Boot and Security Microconference
       - Embedded and IOT Microconference

Next meeting: October 28th
--------

If you have items you'd like to cover, please e-mail me or put them in the =
document.

Thanks,
 -- Tim
