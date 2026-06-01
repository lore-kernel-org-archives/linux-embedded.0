Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754C53446C7
	for <linux-embedded@vger.kernel.org>; Mon,  1 Jun 2026 20:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347320; cv=fail; b=Lx7GDNIGIElTxIYsvSOyYhRrliZegzf9lPDVSXumpFwoqNydYVF6lNb97RoJ18RYZTe6rWbmIA/jKFIVNaT4GaOa1tXmyh1KEJUy6vIteouW8Y2miBO0gMEIQ33bI8XDZN2izc9PE0ESvYFZge+WRFVwUHWzi5cJp0Mp1h5aL0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347320; c=relaxed/simple;
	bh=hmPEoVcVJUb9WnmER/eFHuDsiA/Ju/oFuW6YLKDfWHY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A5XDs52jP899TbRTiEHfAx5RR0Gfdco20XlnP53Jm+/1M14IgcQIFpTNCG/2/O7JA2zNcrxpoc/xhBM5cmq/T74PkfzOxmPcji6EvzSwaI6dTkM57hQ7SEL73pd5ED8O0WYj3J1w6o1DnV2PKx28oN1LCMrqgDFuNc+tc2gl1sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=bY/Y89ri; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="bY/Y89ri"
Received: from pps.filterd (m0209319.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651KndAS3240773;
	Mon, 1 Jun 2026 20:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=hmPEoVc
	VJUb9WnmER/eFHuDsiA/Ju/oFuW6YLKDfWHY=; b=bY/Y89ri7ohx6BqFu+qK0Tz
	3jn/SPugAKKJco6quQEvv7sUqJ901gJzOiL786CmgiFyxp01VFghd8i9w+PXBQp1
	XpD3J62mU7J9bSOkEKHnypriYB3KiOt0saDtRJj2ki3WH1d46IYmMDwIYFs+M4TE
	IDuC9PB3pc9lfsvEVM+mXu6clb8VOOPPMRYXJm0rBfOoPZunYDbLZ5QvJaodAmSn
	kahs20Xvy7LWPp/F5JoBhiepBc3eYlsiRbRpcXigJJS57rpmKdZljg0Hq2One8As
	zJVUbOxJRc9WfEjSbdt4Cme8EASSl+lwlcwWW9r59kGMvdgxWJu9RPk85I3VmNQ=
	=
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4efr9p28kn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 01 Jun 2026 20:55:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fl84gH1PFItz44NVsZPPHkMaG05agk3vbBrrim4/w3JhXb44HvvU7BSBf5tfO0k3XbyqdPQEP4oZXCSvBvxltCiEhcJn94Hnmloq9hqmd6X6uqzT5WBC5GAB/8WgGXP6DO534IZjV2Dj48Zx4mJVtJFAvk2x+kH49Bk4//jahcoR28GloWZb/7gDqFpKL4jo8A5D94wdnovYJBastCV0SqxDqpn3RZqpsLQE+533NUMabN6MNjPDQO6hXUpu4RG/W6dGS9YJlOtPLut++RcyAFzi310bGuuWNFdWm5kguK8kJWal1Tk/10ABVg1bQ92mPi4XNOnj+pDfTeeh+EuZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmPEoVcVJUb9WnmER/eFHuDsiA/Ju/oFuW6YLKDfWHY=;
 b=ehqYHXR6LmtKVPRktagBEMMxeaQBDpKlyuA8Ur71wfunWyyYMwYueJXPkS9sDjo2LsIyhacgziTR2iVWqmUMlv6E4K5WjTZfcdIscY/6BJGBwE2dLZ8exme32FsFSvo8/f69J9f81bzfaiWO/EJ1ZQZZctyUUPJ9YL05EAO/JFUJ8LuO62R3ppcCwZxY6FI90OwFghUWjyCDU96/7+/vtKIM4KaD6Fd6WiKvkEi2otBgyrwredr0n3y2t4sOezdQjotlveQuyGB0+Cw3MHQhb16AkOeVCP37Ic6mA+NJGhearLRor/qEsIYKnMbUjD6AelNyheqYfbig7FlD+LQgBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by CH0PR13MB4668.namprd13.prod.outlook.com (2603:10b6:610:ca::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.4; Mon, 1 Jun 2026
 20:54:39 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%3]) with mapi id 15.21.0092.005; Mon, 1 Jun 2026
 20:54:38 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Rob Landley <rob@landley.net>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>
Subject: RE: mkroot quickstart (was RE: Testing on lots of architecture
 targets with mkroot.)
Thread-Topic: mkroot quickstart (was RE: Testing on lots of architecture
 targets with mkroot.)
Thread-Index: AQHc74NjJg12AYhEcEarJG3Xfa25T7YnClUAgAMgUbA=
Date: Mon, 1 Jun 2026 20:54:38 +0000
Message-ID:
 <MW5PR13MB563232D40A099D798E698272FD152@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <f35774f8-4194-4715-8321-dc2fdfc7fc88@landley.net>
 <MW5PR13MB5632F0D9C8E8A12F2C24B64AFD012@MW5PR13MB5632.namprd13.prod.outlook.com>
 <81e4aefd-f052-4a52-94b5-36030b26c358@landley.net>
 <MW5PR13MB5632FDD1833ABA105437D02AFD162@MW5PR13MB5632.namprd13.prod.outlook.com>
 <9e3f48db-c827-4892-8e41-656e9c60ff89@landley.net>
In-Reply-To: <9e3f48db-c827-4892-8e41-656e9c60ff89@landley.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|CH0PR13MB4668:EE_
x-ms-office365-filtering-correlation-id: d591169d-17ec-44c4-cba6-08dec01ffefd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|4143699003|11063799006|3023799007|6133799003|22082099003|18002099003|38070700021|56012099006;
x-microsoft-antispam-message-info:
 iXgD5hmUmycrgydDUXcUN5+24iTBFqEWuFw56XEEXRZ4Wip/wCBbdGiMbDKc6CQ436Uszk5kpfRwWMmg8Wetcw/HTQk5bBmQwABp2vJs8j0jJvNcHecY12EcHJQVL1Td9diT9pPgN+j94TSk+nBNtfqFpTR+uWDpT55FA1rv8mD+5TRQgiWnel8MwM0K39NQS/Mu8hpaxxfOhpnHmvDAL47TSj93neYSkKJMkR/yN+PgZppbx9WnCrfRstoyIJ+1YVq2ahAc+k4u0fs1MGt0fKv0G2DeXboyGKJnH72tBoYxu+I3RhIza0TPFN1JHVx+pu8dIdU69HoCbJ7Y9wBp59lmValf2AdrBVZRK0o9QOrk+SULp4CXsBexZH+la9HT67Ml45NYB/BGKYaHIoyTLBexS3iCzQ4MfRk5hPzIVkTiP3XW6uxLPKinPemR4ccF63jt+cVab2P7w/MYblUXbDcoURN8Kq87NYoATEaSDI23QgHyBP8HfkG6y0BPymSS9ULSs/ottq4zNkU1uGBVyJA1SjhIqM4kWSju5jCKcaAygCM/Pqfj+hc7AQT619HWtQElMfZ65s/n+blVbcbrL9H0Hkq3kHSpV7pzrxAl7fjb/lLFLxeGZS1eXz7/v/OoVIUrS4pxZJC1vhkObjrKXBp47inWrlkt8/tSPIz8MooAWW02hJoY3LVAhjc6wuC//HdvMg9Ha8hiT+YFbaB+9A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(4143699003)(11063799006)(3023799007)(6133799003)(22082099003)(18002099003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmRvS1RpOWhVRzBTVDB6RkxtT0ZrOE81clcvMUcwdWRKZngyTGRIclgydUxa?=
 =?utf-8?B?T1ZiaS85NkRMYkhqeXZKclI5ak5NOEtoNkNQaWhQYU5MN2tOSXVISHJaZU9C?=
 =?utf-8?B?WVRUZitrQ0FwSDlISzFjdW9hSHZqL0R1WjE0U3Z3eC9tcGZucXJPZUpwa1Nt?=
 =?utf-8?B?dXVZdkFKa1B2T0JFK0o0R0M4dDVjOXdHdlQ4U0hmT3BtL3lXQisxd1granJZ?=
 =?utf-8?B?MTBhTCt4dXM2UHJYOGtoZDVRMWJnNG5FS25TMEo1cGFsaERUT3ZzaURhTjZD?=
 =?utf-8?B?MnRuMnNYbytMeVhKZWRkNzVFYWoraE9Wa2g1Q3lCanNUV0psNnZIbDJtckpR?=
 =?utf-8?B?bHZ4amR3d1piT2pwVVFiT3FMSUZEMTdEWHQ3ZDVacGpia2tLQkJqYnlSWUpv?=
 =?utf-8?B?UEFXZUlGMDNSbTA3WnVhdTR5djRuMGFFeGRZMjQwMHk4WjlPei9nSExyZlhv?=
 =?utf-8?B?YnNWbmtCN2RpK2RMK1NSbnVsMGpEa0toelh0ZHdoYzVVVXNLUElQUm44SnFE?=
 =?utf-8?B?VWYzODdDSDZ4NU0zRngzUTlEVVg2cVN4NTBpMmRIR1dCSHZCSUVwZDRTUzNi?=
 =?utf-8?B?bVlLY3E4ZzNodG1NbHhRK2NZZWFRa3ZTcjAzcVcyelJNUXZFbU4zckdQMnBM?=
 =?utf-8?B?cCt1MlhrZnNMNjdtMmhTTVVUQUVxaXVubWdvRDRnN0t5WmFmN0tOU1A0SklJ?=
 =?utf-8?B?R01xOGliSGNYSzBLU09Vd3RoK1p3dGJPeG51UmZaYjBQSHpyb3daMHNmT1Uw?=
 =?utf-8?B?Z2wyWmdPNTN4bTNRRzAvZWU0ME5BNzRhUG9TNXM5ZUhHMGhqTHNTRXRxbFN6?=
 =?utf-8?B?b0V3MXlubm1KdGJOeW4yY1RpQXNTbW13bDRGZHZEMEQ1bVladWZCcGJUMFpC?=
 =?utf-8?B?d3Awd2dzL1JXTjBNTkZHVVJDYXNlcXk3ak16akNxQ0lCcVVvREhTWjJYNzJs?=
 =?utf-8?B?Y0hyR1dURE1uODlHeUJWcTQ5ditMZG9xemlhSzhXL1lLenA3dHZVOG55bkVk?=
 =?utf-8?B?WG1xTWpTZExZblhCT2lJdzJ3MldScFdvNXYvNGc5a0tESERJeWx4ZHF1NUVp?=
 =?utf-8?B?RnRJSEo5MkMxbUZWS241MjBqWUc3d2pIOVZacVU1UlR0TkZPZzRlNUM5bmYy?=
 =?utf-8?B?cDlJeW91OW9BcUdrSTV2eTR1M25sQVJDYUtDUTRpcm4zMWFSQ1UwSzNZazFj?=
 =?utf-8?B?V2hRVUN4RTMycEFHaXovdTh4L1E1M21lVVFLY0owMW1Hb2o5Y2lFeld2VTFu?=
 =?utf-8?B?b0tSVk1TTnlzSVpOOEJVZ0FhTE9EY2lsaUZMT0pFZDhLc043S2N4WEhjRkJp?=
 =?utf-8?B?eHRNSU1vS0tTZ05qQXFTQW9YdjBFNnNQeWxrcmxvenVueDZQeUg5NHlteWth?=
 =?utf-8?B?RHg3d2p0WWgrSVUxbG55R0hNYm1LV2Npdk8rOVFlMVFCSWttZGxmeklxRmNT?=
 =?utf-8?B?bHB5RzBQNWpYTlpOTmIxcG03QmtFZ3VUNmpHTDFaQmZpOFBScVZ0ckhINzY1?=
 =?utf-8?B?ODdyVzdtR25EOFpDUUlYRlRQb0owUVZReTNuQ1BtR015K0dUWGpER0NmcU5V?=
 =?utf-8?B?ZXU5U3l5QWlhWEF0cGswS21odmFESWZBNnpGTUVzSURZNEtCMGRnVEI4cmcv?=
 =?utf-8?B?NXZSREtxSnJJbWJiZnUyS0RobGxBWVhXeXBJRVRsR3dRL0ZqalpwQ2RxWDJF?=
 =?utf-8?B?SVcwNG9rcUM0U3pVSFlZTkw4bGd4OVIxTWZDcDZlQ0dhaVREME9ReGlMM0Za?=
 =?utf-8?B?SHVKUUdSQkVaZklTQkpDVEZleGNoT0txMU1nUHlqYldOUTdOOTZQZzN1NFln?=
 =?utf-8?B?Vk9uOHNKSk4vT1grekFpaGREUXZTWUlHMm80ejdOYnYxcUdnemRpZkNhakNN?=
 =?utf-8?B?WXR0bGVkUnhDYStmWlhlNFFLVUhmQzc1dWNISEdaUzRZQmcyUnhTVFpNVlYz?=
 =?utf-8?B?VXRRZmlxLzlmUURSb0VHYTllMnRiU0o0R1RDYnA5dEJUMTNvZ3NZd004Mnov?=
 =?utf-8?B?d3BVM05SWmw3VGIxbTN1bnlYOC9DcS8xbTQ5S0YvS1ZCLzZUc21aamhlM0Uw?=
 =?utf-8?B?UlJPTXBmWVdPZ0RTaFNGZUVwTDd4U2tnZy9XR2NZRTUyMkJBZEpRcGJTVXRp?=
 =?utf-8?B?aVd6VG1WUXl2RndVUlo1TjNmVGJNWHRPYnBOUERsd3RmWkpyMGRxTy96TmZw?=
 =?utf-8?B?NXB4VHRIZ2ZQRWpTb2ZBZFZUdExIMU9GRjduYzhsU0JpZVUrQ2laOC92UmZ3?=
 =?utf-8?B?MEF6UVUvb0VDUEJWcU5TWTVkb0FoT1BRZ1FDRWlNTEQ2dG51RkZnb25jb1o5?=
 =?utf-8?B?WEJRRlFGM2FLTmMrUWVSRUJiV0d3dVRzbWd0Sk11dFE3T2N5dWs0SjNUdnpL?=
 =?utf-8?Q?8cd7f5mWStJkWgTnnv17nTKgKW9Xa71PQcaw5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	RdOvZeckn5X7tb8fGAK2hb/mgB2yfOLa7GDkzbPom/mxACMKaDE1WL+loD9Y3r6t2xqP52IzSwFal497aJvdZLoNvKcn3IYRaR3B9kb79oLx7fo7v5qzKOWjRGLKzjIlCpHJT0L93A/oBVWPc9lboDsjTkCzRwMeUqZTRqeCkYC9DBgnCq0thjgoLXErenl5/pyNihWnSOvFzVwTGJPhOZ/Kz+zjdU5MthYHbGf6ac0YJGfLprSo2tztE6FQ/WgX3CKwAewpMSznczC67urOKpOoQfELKcbXrVALlcVlBJdalNU8tfyboS03F4RLJAYPVykQU7QcH1Huol1D8JoYUg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yz9fMQep4PK8biOkFA+5gPp663ZEOyNir/+9tAbayAOgT8GjVxcmE/pSmZ+Dkd1swGO6cj+YEjPBCkhLGQ0hE+RIvm7sZpIr7FWJ2Nu+ahNzo3Yj5/ceeTs28RFkGg21U/uOymcnBZYSvfLs72Qou6Yr2h9iCsJ6EoMW1XqeM5BB+QiUJ1WweyOomeNDJjoIipqjh3kjI9TxXpCo3SoZokR1hGTO9YTleR5VZ8ezWcMgx2R13ypKf62AkLZ7qtg9d92tONoEqAc8OXW0AKp7nMiY3zpS6XKspmxrIlZlUDpzU0aF3n5hkeWmE226UGM138MAJNxhzHOxXBZ04+0DLhKY4rPtX583Wy9XRC06meceHVQ2YXUhPuZOz00QfUS7/wXFYySu5EiJLSO+khVrOh73/XD+DqKC3XjP3iA7IUT5OExKedv8hEurOG55cLrgXUqvdO+YnML/6baoYATZOYgReDZxoYtpDGQ47sJl1fvUfmPvJ0JTRRmWd8ZCabYj+wMklidhwa46nwvXbXuyYqgOsdOpLNjZ69Wfu28fBLqis8tGpYBDCmR0MANc6CZRLvWuS0slMnf4MYGPnG4tycEv2az8lubwz1KhODOys1YX7B92Abtt1Bd0nZh7u5DN
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d591169d-17ec-44c4-cba6-08dec01ffefd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 20:54:38.7331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5lzlBc2mTvdeKynEggQy/A9f+P7muB2RCWYkMjOnscgLmg0GE3kjmre0gEAHhz43IxY2pgvN6gYQ/0yM/hvBDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR13MB4668
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDIwMyBTYWx0ZWRfXxaEGDm7Juxgc
 rn9FxK2fQE8IRry6kzvwK1i+LxMZ9OPZls+ZqfykEenUMQUD11FADljDob1xFhC+AZTpkzZjDD/
 9OTuVDnRmdposkTnn9Nr4Y6HHg+LQ875GbTfS/l67sE3saLWwAV4bg22U7cCpevHg9JUZhmFgpk
 NBui/jpGvDSXGfbBzV1Q0qqW8OILpHUfI+yF3jOu8Dnj8ctf0dxlmXWkUnKwU8NB0soHfzXAhtK
 irJjDegUDerbdxW29K/dclEb4f3azaxMovnLNiV/owI+Gb9v5p6zxFNdkUxuvMUEnTbpB62Uh9f
 WAlZCgvVy7VSvJMCG6lD0vbo2LLvyiafg3E2IOQprPK3L6iKw/pzXDRCFQ/WSk+Znc5PMGFRYrz
 Y4yh2zAOqJ5sV/rSH7mwXxFLO5jsq++AZ4t68f4wQKvDQ2S2tTiS7zqDuA/FqzvS39bjqYK+3O8
 TbPRIyC9qVZD2KHZDtQ==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a1df1ac cx=c_pps
 a=os0lWWs/UWv4pnmIIs5naA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=fIyWl1o40DOTyIs-:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=6Vn1QVPt8UGdu3r8PAnt:22
 a=SXzkmgPmAAAA:8 a=PjuYqXk4AAAA:8 a=y5Yq1ZyPAAAA:8 a=GRaHDbWIGgAT183tvqwA:9
 a=QEXdDO2ut3YA:10 a=EWLf6cg6Bh5aS0AxDgDu:22 a=PoVUXeey_BepnEeCpHdp:22
X-Proofpoint-GUID: M-1W_qmKIw43UGDDhjPz4a8Q1R8yq1uH
X-Proofpoint-ORIG-GUID: M-1W_qmKIw43UGDDhjPz4a8Q1R8yq1uH
X-Sony-Outbound-GUID: M-1W_qmKIw43UGDDhjPz4a8Q1R8yq1uH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_06,2026-05-28_03,2025-10-01_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIExhbmRsZXkgPHJv
YkBsYW5kbGV5Lm5ldD4NCj4gT24gNS8yOS8yNiAxMDo1NCwgQmlyZCwgVGltIHdyb3RlOg0KPiA+
IEhleSBSb2IsDQo+ID4NCj4gPiBJIGp1c3QgdHJpZWQgdGhlIG1rcm9vdCBxdWlja3N0YXJ0IGlu
c3RydWN0aW9ucyBpbiB0b3lib3gvbWtyb290L1JFQURNRSwgYW5kIHRoZSBpbWFnZSBmYWlsZWQN
Cj4gPiB0byBzdGFydCwgZHVlIHRvIG1pc3NpbmcgaW5pdCBwcm9ncmFtLg0KPiANCj4gQ29tbWl0
IGQ3Y2VmMmY0YTdkNiBzaG91bGQgaGF2ZSBmaXhlZCB0aGF0Pw0KPiANCj4gaHR0cHM6Ly9jb2Rl
YmVyZy5vcmcvbGFuZGxleS90b3lib3gvY29tbWl0L2Q3Y2VmMmY0YTdkNg0KPiANCj4gVGhlIHBy
b2JsZW0gaXMgdGhhdCB3aGlsZSAvaW5pdCBpcyBhbHdheXMgdGhlcmUsIC9iaW4vc2ggaXNuJ3Qg
dW5sZXNzDQo+IHlvdXIgLmNvbmZpZyBwdWxscyBpbiB0aGUgc2hlbGwsIHdoaWNoIGlzIHN0aWxs
IGluIHRveXMvcGVuZGluZyBhbmQgdGh1cw0KPiBub3QgaW4gZGVmY29uZmlnLg0KPiANCj4gSW4g
YW4gZXZlbnR1YWwgMS4wIHJlbGVhc2UgdGhhdCBzaG91bGQgYWxsIGJlIHRpZGllZCBhd2F5LCBi
dXQgcmlnaHQgbm93DQo+IG1rcm9vdC5zaCBoYXMgYSB3b3JrYXJvdW5kIGZvciBpdCB0aGF0IHdh
c24ndCBhbHdheXMgdHJpZ2dlcmluZyBiZWNhdXNlDQo+IEkgdHJpZWQgdG8gYmUgY2xldmVyIGFi
b3V0IGxldHRpbmcgaXQgdXNlIHlvdXIgZXhpc3RpbmcgLmNvbmZpZyBpZiB5b3UNCj4gaGFkIG9u
ZS4uLg0KPiANCj4gRGlkIHlvdSBwdWxsIGZyb20gbWljcm9zb2Z0IGdpdGh1YiBpbnN0ZWFkIG9m
IGNvZGViZXJnPyBJIGhhdmVuJ3QNCj4gdXBkYXRlZCB0aGUgbWljcm9zb2Z0IGdpdGh1YiB2ZXJz
aW9uIGluIHdlZWtzLi4uDQpZZXMuICBJIGhhZCBhbiBvbGQgdG95Ym94IHJlcG8gbHlpbmcgYXJv
dW5kIHdpdGggYW4gdXBncmVhbSBvZiBnaXRodWIsDQphbmQgSSBqdXN0ICdnaXQgcHVsbCdlZCBp
dC4NCg0KPiANCj4gPiBNYXliZSBJIG1pc3NlZCBzb21ldGhpbmcuICBXaGF0IGlzIHRoZSBhcHBy
b3ByaWF0ZSBtYWlsaW5nIGxpc3QgdG8gdXNlIGZvciBta3Jvb3QNCj4gPiBkaXNjdXNzaW9uPyAg
SXQgaXMgb24gdGhlIHRveWJveCBsaXN0IG9yIHNvbWV3aGVyZSBlbHNlPw0KPiANCj4gSW4gdGhl
b3J5IHRoZSB0b3lib3ggbGlzdCwgYWx0aG91Z2ggdGhhdCdzIGluIHRoZSBwcm9jZXNzIG9mIG1p
Z3JhdGluZw0KPiBmcm9tIGRyZWFtaG9zdCB0byBvc3Vvc2wgYmVjYXVzZQ0KPiBodHRwczovL3d3
dy5yZWRkaXQuY29tL3IvZHJlYW1ob3N0L2NvbW1lbnRzLzF0anVudnYvdWdoX2RyZWFtaG9zdF9n
ZXR0aW5nX3JpZF9vZl9tYWlsbWFuX2VtYWlsX2xpc3RzLw0KPiANCj4gSSdtIGhhcHB5IHRvIHN0
YXkgb24gdGhpcyBsaXN0IGlmIHlvdSBkb24ndCBtaW5kIHRoZSBub2lzZT8NCkl0IGRvZXNuJ3Qg
Ym90aGVyIG1lLCBhbmQgc29tZXRpbWVzIHRoZSBkaXNjdXNzaW9uIGlzIHJlbGV2YW50IGZvciBv
dGhlcg0KZW1iZWRkZWQgTGludXggaXNzdWVzIG91dHNpZGUgb2YgdG95Ym94IGFuZCBta3Jvb3Qu
ICBJZiBhbnlvbmUgZWxzZSBvYmplY3RzLA0KcGxlYXNlIGxldCBSb2Igb3IgbWUga25vdy4NCg0K
PiANCj4gPiBJJ20gdGhpbmtpbmcgYSBta3Jvb3QgZW52aXJvbm1lbnQgbWlnaHQgbWFrZSBhIGdv
b2QgYmFzZWxpbmUgdGVzdCBzeXN0ZW0gZm9yIHNob3J0DQo+ID4gYm9vdC10aW1lcyAoa2luZCBv
ZiBhbiBleHRyZW1lIGNhc2UgdG8gZXN0YWJsaXNoIGEgbWluaW11bSBib290IHRpbWUgdmFsdWUs
DQo+ID4gYXQgbGVhc3QgZm9yIHRoZSBrZXJuZWwpLg0KPiANCj4gSSBob3BlIHNvLiA6KQ0KPiAN
Ci4uLg0KPiA+IEFsc28sIHRoZSBidWlsZCByZWJ1aWx0IHRoZSBlbnRpcmUga2VybmVsLCBldmVu
IHRob3VnaCBJIGhhZCBqdXN0IGJ1aWx0IGl0IGEgZmV3IG1pbnV0ZXMgZWFybGllci4NCj4gPiBO
b3Qgc3VyZSB3aGF0J3MgZ29pbmcgb24gdGhlcmUuDQo+IA0KPiBJIGRpZG4ndCBib3RoZXIgdG8g
aW1wbGVtZW50IHJlYnVpbGRzIGZvciBwYWNrYWdlcywgaXQgYWx3YXlzIGRvZXMgIm1ha2UNCj4g
Y2xlYW4vYWxsIi4NCg0KT0suICBHb3QgaXQuDQogDQouLi4gW3VzZWZ1bCBpbmZvIHNuaXBwZWQs
IHNlZSBwcmV2aW91cyBlbWFpbCBmb3IgZGV0YWlsc10gLi4uDQoNCj4gDQo+ID4gQW55d2F5cywg
dGhhbmtzIGZvciBhbnkgdGlwcyB5b3UgY2FuIHByb3ZpZGUgdG8gaGVscCBtZSBnZXQgdGhpcyB3
b3JraW5nLi4uDQo+IA0KPiBJIG1lYW4gdG8gcHVzaCBvbmUgbGFzdCB1cGRhdGUgdG8gbWljcm9z
b2Z0IGdpdGh1YiBhcyBwYXJ0IG9mIHRoZSBuZXh0DQo+IHJlbGVhc2UsIGJ1dCB0aGUgcmVsZWFz
ZSBub3RlcyBzYXkgdGhlIHByb2plY3QgbW92ZWQgdG8gY29kZWJlcmcgKHRoZQ0KPiB3ZWJzaXRl
IGxpbmtzIHdlcmUgdXBkYXRlZCBjaXJjYQ0KPiBodHRwczovL2xhbmRsZXkubmV0L3RveWJveC9n
aXQvY29tbWl0L2VhNmMxNzJkYWRkMCApIGFuZCBJJ2xsIHByb2JhYmx5DQo+IHRha2UgdGhlIG1p
Y3Jvc29mdCBnaXRodWIgdmVyc2lvbiBkb3duIGluIHRoZSBmb2xsb3dpbmcgcmVsZWFzZS4NCj4g
DQo+IElmIHlvdSBkb24ndCBsaWtlIGNvZGViZXJnIHlvdSBjYW4gYWxzbyBwdWxsL2Nsb25lIGZy
b20NCj4gbGFuZGxleS5uZXQvdG95Ym94L2dpdCBidXQgbWljcm9zb2Z0IGdpdGh1YiBoYXMgZ29u
ZSBWRVJZIFNUUkFOR0UgYW5kDQo+IEknbSBzbG93bHkgYmFja2luZyBhd2F5IGZyb20gaXQuIChN
aWNyb3NvZnQgZ2l0aHViIHN0aWxsIGJlaW5nIHRoZXJlIGlzDQo+IEFMU08gYSBzaGFycCBlZGdl
LCBidXQgSSdtIHVuc3VyZSBob3cgdG8gd2VhbiBwZW9wbGUgb2ZmIG9mIGl0LCBvciBpZiBJDQo+
IHNob3VsZCBqdXN0IGhhdmUgaXQgc3VkZGVubHkgdmFuaXNoIG9uZSBkYXkuLi4/KQ0KDQpJIHNl
dCBteSBnaXQgcmVtb3RlIHRvIHRoZSBjb2RlYmVyZyByZXBvLCBwdWxsZWQsIGFuZCByZWJ1aWx0
LCBhbmQgaXQgd29ya3MuDQoNClRoYW5rcyENCg0KTmV4dCB1cCBpcyB0ZXN0aW5nIGl0IHdpdGgg
Z3JhYi1ib290LWRhdGEuc2guICBJJ2xsIG5lZWQgdG8gdHVybiBvbiBQUklOVEtfVElNRSwNCmFu
ZCBzZXQgaW5pdGNhbGxfZGVidWcgb24gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUsIGFuZCBJJ2xs
IGxpa2VseSB3YW50IHRvIGFkZA0KbXkgbGF0ZXN0IGVhcmx5LXRpbWVzIHBhdGNoLiAgSSdsbCBw
b2tlIGFyb3VuZCB0aGUgc2NyaXB0cyBhbmQgc2VlIGlmIEkgY2FuIGZpZ3VyZQ0Kb3V0IGhvdyBi
ZXN0IHRvIGRvIGVhY2ggb2YgdGhlc2UuDQogLS0gVGltDQoNCg0K
