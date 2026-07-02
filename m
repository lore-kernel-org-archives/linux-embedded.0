Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9CB340286;
	Thu,  2 Jul 2026 15:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007627; cv=fail; b=TWWoFjNJi42cwUYivT7AFbcGSbood4Jt8iQ0bML0Phtq5NAyuxH0vsDPm0B52jsaXbwGwxIlB2EZOhgUnkPcxAF8MGqt9IaAUoaak8PlDLiwXY+HQyX0cw+FRDXlLkmsMpYLHGmOBNr9oa9TCvlHY5EiSscurdci3fX2M/u1wkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007627; c=relaxed/simple;
	bh=GxD8i769tC20SJ3p4KhvLY8d795WG4Q31aJ3NN4KeE4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q1xeHTIOZCZPy1KIP6vc9yywpgc57T2aFvgZ+Qam7/uBSj8K0+AxveoRvVVta6p1XIfriLkBwTJVnHpxOBRCoAlHSysObOkehBKFjv8Mu1IA16IA0kb5EEkmftcO80B3ioua1EYackT8P6bUIfej7SmCKZdRh1aSOd51J8typI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=Ih++ZcYM; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="Ih++ZcYM"
Received: from pps.filterd (m0209320.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E20303855424;
	Thu, 2 Jul 2026 15:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=GxD8i76
	9tC20SJ3p4KhvLY8d795WG4Q31aJ3NN4KeE4=; b=Ih++ZcYMRo71pNHP6IwJpHz
	oLXaJI4I0E5oKFD8+u9QnOa9bm4eUK5edYn6x0QO7JIXqjTwkXwZmXDr5KWaY5mF
	g2VdabMfud1Y+qxtG8YV5B8W9P/7w8n9XRjt6B2KOvXOpYW5DB3jPOV2ds1duXUt
	Q8w3CL3T/0YcbihiCyYdKziSL6dEJ3H1Ae0P+FjxQ7JV8/HwWBz/hsHkjk+gfTj9
	uzBPoqSeCoUwCcRSBLxhZXM6WhAy4aCodaJslmdjO/a6wYsRXS5OHQWJ4MaHCCmq
	MRt5u4CLitwWqbgZf4SQbHrHIt995CUP5Kj7YOXzfsn58d/U4VKcZ+w2bVqWcRQ=
	=
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012024.outbound.protection.outlook.com [40.107.209.24])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4f26t2er4a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 02 Jul 2026 15:53:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6ZwkKK2bPN8sSty+UWW2H9Hm2/AOig/nLsANHG0oWO0WEPdMS43R1VNXUhoSInoM/xEnfKVYpVieZ48U88NS5WPlsw72C3R/hXSmZ0kjImkXXCo8Vquc8aBPsKDCZb5NCnB/TOILHRa8Sy1UPwNWyKmU+5jo23ge7UagU7LAp3QMI2pr8+NeRP8Uv6dCSiaFmgPQilyFpGeaqjT3rwmRvGCRzKhkr+9CbqmjV61i9dS/ZqlHSyahAWB7g3ENc+ckgUszMhOxYL7sLChfhVANJPM3q808Bn1aQ1SnUQnCu+r3dX0C6JdjttudFgdEsZrj9nkwjPWIFxpI0qSLl1U2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxD8i769tC20SJ3p4KhvLY8d795WG4Q31aJ3NN4KeE4=;
 b=Ffo+4AOJlMmqr41AnJypJ0BsIoZ2gOXAI0yz/fkv6kaeFlVJMNQJSIzuTKdLY8ATL0QXcVPMESVXiTzW/3oRdDj0+8eFv9Xf002+6PnpPb45BCm6DwQFlgePAl+yHm662zZphikZhqTWMfHeUQkfdegQUNwLbFoukZyRIesXhJ9vOZ0vnShnR0fackMZVTN+HpnSp6c5HEGtFFq/TPJRDdwIpZfl/4ooIDhJi/K8rdwaH5uh5iIg2mz/qYOpER8hwDvM7CwO+MnwhUWZI4VFNJcVKsjmcTLOMOIq6NQDMSHQozqmJdrZ/WrZLgrDlDbQibukUSegGy2fPZHxCSgqAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by BL3PR13MB5179.namprd13.prod.outlook.com (2603:10b6:208:342::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Thu, 2 Jul
 2026 15:53:00 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%3]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 15:53:00 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Francesco Valla <francesco@valla.it>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich
	<dakr@kernel.org>,
        "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>
Subject: RE: [PATCH] driver core: add driver name to probe debug print
Thread-Topic: [PATCH] driver core: add driver name to probe debug print
Thread-Index: AQHdCBF5U71VTWyHfEyFL4CL8lSXA7ZW5FaAgABenYCAAFPMwA==
Date: Thu, 2 Jul 2026 15:53:00 +0000
Message-ID:
 <MW5PR13MB5632B0DF64A45C53CD98CC03FDF52@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20260629-probe_driver-v1-1-fc58117581b5@valla.it>
 <2026063043-slouchy-outgoing-a958@gregkh> <akPnMERmg-QO6kjC@bywater>
In-Reply-To: <akPnMERmg-QO6kjC@bywater>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|BL3PR13MB5179:EE_
x-ms-office365-filtering-correlation-id: 1d0ba4b3-a7c8-4b28-5f47-08ded851fe38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|10070799003|23010399003|366016|38070700021|18002099003|22082099003|11063799006|4143699003|56012099006|6133799003;
x-microsoft-antispam-message-info:
 sNQwBqJuftyo9dpTcJdtITXPhkV7t7XbOZykWKHIdPw+Is9qY3Xc7L9P72IUeQRPH0kLFokHJj6wAKTpN+SYSI2bGzcvIfoUCl9i1fcrQjnnmKpPwgXt2UeuU10AE+Ni47kAkLe8BIsCA+9dastzZKt8yTt213Q25cF+h2DfhEmrfuyLa/SVL3jXtitoU2zArudiUVqtZUHy9JGlPsm6QdKDzbihuxfXMNHwUo7GyWMQJv8leZJxctfG9InWnVyc1Qpn6NpA3n/EQBms21XwSzrGkvN1oSGvByfbt9k6MfNT5lUDqXnaazCRxvFbUntFpaelviSSB57rsGRPxOsAMtN29Vcgh2Sq9ilC6t7cVN+lN78/g3atw0VssKMZjij3+dzMqMWfG4NlbBrsyoR5hlt1CSwmgwMHoJ2XnLNRQEB7f46dyAuqqArF1JLgLrd4cYIioWT8haoH9pqQsQf4UuJwL11t8vFRkrXVpJ95QY8FoKw9jACwpqXVIJnRHn5hs/BH1rw8iuwKQJ8Dz0bqPQAE/uVYnzvOZV9C5FVwwlOPeY/Z63S9ubPQ8JDdxuPfarCXBv2WV7ysxt82GWTedmxbOqGT0/qRVgNNS2+veHz1YpNvYwvVaiS2Yxo5Gh2DjXgRe1xGoFMr/+JnnIe8tH3eHr+3IcPbzkNbuZjI/6sx8EmibOnsa2AjQ9g2yS0mFyNShIGGekjgVIalt/qsDeSL/HJecPmlsiRv7oWNuFA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(23010399003)(366016)(38070700021)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OTBIWjN0REFTR0tsMjlFR0h5V3JVOFNrR3VxRkJYQzhPeDlyZ3JBQTl1NnE1?=
 =?utf-8?B?Z21tOHVLcTFpaCsrdUtSeFl2am5xTUFSR1RPMXFnZnRtUDZDdnQ3dUZTMXNZ?=
 =?utf-8?B?T1kxdzJkRFBxNXQ2bUNJdUd6Z1p3R2FiUGpjeDJwM08yOTFWamtSQ2dkb0xE?=
 =?utf-8?B?dWI5VGRhTUdmYkcva0VvSTBOVGNqcHlZNHZEYWEwcVBMSFNsUTZlaVBod2lO?=
 =?utf-8?B?L254OUVjNVdrRFBoRmJ2b0dIMzdoUExrREVudmVDdWtEb05jZktKK0VOV05M?=
 =?utf-8?B?MDc4M2I5eHhSVmRvRFFscUxmVXNIRnd4UmpXVU5WQlN2NEhyN2NHM29OZW9Q?=
 =?utf-8?B?ZytwZjdNcjBSWUhNRDZrOCs5dGZKMTRKaTNScm53NlJOV00vMEs2bmVRZDVL?=
 =?utf-8?B?TVZrQ3p2V3F0YmVjSVdnc29ZS3ZyeGtmTklsbzhNVGVFTHZVQkhqN2xNakZa?=
 =?utf-8?B?dXZERjMvOHRvanVKdjJFcWM3VmJsbEVRZXp3VStjOWoxWlRLcit0N3JTL2FK?=
 =?utf-8?B?b3JoVkNKN2JzSVVaMEZ4bUJ1WThPYm5xbmg2TWdGNHNCUzlzMWFneEx2d053?=
 =?utf-8?B?ejhwRmM4azZaVUNmYklrcGpvSmdoUXl0ZWFYR21USWU3a3lVT3M2YzZEdE1E?=
 =?utf-8?B?ZnlvM2QzYXRRNHVVU0txTXNjZUl3ZjFSUlRWZGZIRUZLMWtnTjVpMitwV0Fq?=
 =?utf-8?B?TmlHT0NoK0JvajN5OS9mTE1xTWNxTCs2cVo1UlNUM01qVkI3WUQ2eHQ1L1l0?=
 =?utf-8?B?NHp2dDl1RTZiUGEyNnYxS1ROQ2hveXdrcytBVEc1MDhGY0hTTXFLck4vUmRU?=
 =?utf-8?B?QTZsdWppMk5OZ05vL0VGZ2ZkaHNnREZSNVdJaGxHZVRiNzBpZmdCV3NQbVpH?=
 =?utf-8?B?eStnUlFYTXRDTy9FamcxK0FGSTZHY2p3N3BRZVpxZUJKMTFzYzZlaE82VVAv?=
 =?utf-8?B?S3hNbXpHTDF3c3E3VCtDR2ZvQVNlQjNmR083QmQxcXlsaVNSOFhsaWF4VkNV?=
 =?utf-8?B?anVZaXVFbnpZNTJPMmtva3V0RkR5MnptdVJYZXkvTlFrbitqem1LbUx4b2hk?=
 =?utf-8?B?MmpuOU9ocmpPOGxldXhPeFZVZkdmbk81WmNJV1VlY0xsc1lwUzM5NzNnb2dz?=
 =?utf-8?B?NFNKRDFZbTZ1T2dVMTVMMzBiOWtwYy84RmM5SjNLcGRLalZlV2ZmTXFBVHkr?=
 =?utf-8?B?blhjTlVub1ZuV3RlMWY3UzZzU2MxVXNrQ2NiUGdaUFdHRFRmWkJJNGNVaEZT?=
 =?utf-8?B?NHRBTE5EYVNkNEZMc0puVFd2TlRPR3BuSDNDcnJRYlV3dmN3WjlHWVhFZ3pm?=
 =?utf-8?B?a0QyWENmbnNhZklzZzFUTEpWQy9KNmRrS2ZGOFBkQUVYMi9HaXBrTTlLYnNj?=
 =?utf-8?B?VGFnUWM3Z0xlckVZbVduZXJZMTY1OGtXZ0ErNFlIa2NoMi9qdFJKMUlzSVk1?=
 =?utf-8?B?ZHZ3bjRuT1JqYmZuY2ZVbTRXVVBYZEs1UGVRUFRyS1lManpPUzFWYmFmMkNr?=
 =?utf-8?B?YjBUSmo2ZVJiZDZlQVMyL2J4UGtrTTNFYTRYakpGOGlYT0M3R2pqVFFNT2lN?=
 =?utf-8?B?dkt6a2IzVzkyMDVUMFVMVnY0WU5zZTBZb1RMRU5zd0grZ0YwS01LNTloT2pB?=
 =?utf-8?B?TlMyeGVTU3ZmMUkwNWVZWDlHTXZPYTk4UkJZc0E3dGNjR0lOc2FPNThvWTJR?=
 =?utf-8?B?N2N1U2p5L0d0VWhvMjk4cnpKME5CQkR5N0ZmQm5TR2liWk56Mk4vdkwrTmgv?=
 =?utf-8?B?YWlzR0NHcVlRUng1WnVuUTZtN3dUNHFBYkprUWU0R0JnVmNyWkFSVFRXRjNw?=
 =?utf-8?B?enBmUTZBTEZYMVMwSWFJV1Y3ZzZJS1NhRzdRdHFPVElwc3VwaHBPV2NFc2RH?=
 =?utf-8?B?NlJHaWRWVk5xWkxjdnVpYVpCSnVrVDJFOGplMWdxcTduSjdNTnRlRWswWXpX?=
 =?utf-8?B?L3lCM2QwWVM3anBMbFFKUFRFRDd4bmdIenU3cFdzSW9zYVJvNXh2UnRSVlJG?=
 =?utf-8?B?bDJUQzkrQ09kdE14SUw4SkF1N2pDZHF3akVlZEdMWUk2bGdnRU5oZnlMYlAv?=
 =?utf-8?B?eFB0am9JV0hzQkFtTkhxNEFiSlZneWF0cXRlbGl1ZzlKL0hTaG04cEthbU4z?=
 =?utf-8?B?SnpoR0REdGV6aWRqL2UxcGFoSU00eURjbnowRkV3RE94Nm1TT1A2MFljQktq?=
 =?utf-8?B?TnJOcStDbnQ3Tkc1cHp6eTFtWFVLZUl4TGo1dmxZay9EdHFVZmpvbTIrS2Fj?=
 =?utf-8?B?a1hTNGFsSldKbytYN2w0RzFJZGVNcDVJQ1ZvL2dlU0lia0ZzYVpYVEttcTFJ?=
 =?utf-8?B?VkpMOGNiNmUvUnArY1FlcUJFRDRsdVNtNFhBNVhiN1ZYbVhKeU15TUJNREJZ?=
 =?utf-8?Q?S6Q7NUdNJbZ1ATZDJy5RZYomdGvfqQf4cWHqB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	gDg3+yjz3aUqYsq1bG1FyIaopH6pc3sh1p51NOulhWZsdEpzt3t5yphMcW8OdP0MjTT3F60o/afL0j1YoeT5c0asLnLtuXSZjoAwHej2W4tq7ntUa+w3Bb1WkJwZkJuFCwgMMrvPcI+2viA6wzvcdoN2W4FhTiYUI9IVwimP4hpEeMNg6OKjruzxpCZKE6Tg+5qYv0LWqNnTDsxfFFpOlZI2OgU3pUMcS7o9wiPlopIPzWqYkXFpsVpMV448GyeKX9u9B7gFSaXGOvBCQNythQFYbX9WXcHv8tK3+3mfkZRqdhe23wuDQHmka6bJC7uwXsSII+CBnKF/GMjdljPfbw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l1wrTjwoUWhJhfVkMhJ+ifOeN1WseTNVMPg82we2WW9ohxVVAdV2DLHsfboIEvxAkOZwnfACTkhK7EtnUj4+ypNoDV/bkybLI9zuNqp6Ia9OjmVvNqfiT66LSF4UuJ2whPuwUFWGvej/ODXPmEFN94J6y1tb229IDDUt0z28Ph3Xh/duVSSfc7xqTBtASTKV0AAFePavHMkwwzV4kS2ev1JlDDQyecWAxW9VSGhPZtw35+BymFSPtOUV9KzKFWdfHUPyhyZR0mjgy1YR69/V/5dNh3tXg/a+twChMD+Q16lzKYzQ9wJvbmAADevXTRK4DROoombRqNoJQ5bKfj4mh5lmvd8G8HIu1oXgu5/djF+ZGdxH32yQAOBdoV0sF9CXyZqo5HSz/YH13oDA/7EC5LxqqQHeofG4AjuccWClrnKKwrj4q14yB4Cuh9k72ghbdn/FUzYgSH8HtA4WZN3P1aeBIsbsKfFjPneZ+VBFtMnN2n7QZeAtc5JxbL9YI6Hk2Ott8wutbAw43Ud0PnMqp9UQ5YBDPQ6kWlTGkiEk2pQNVRAI0g4igdNblvuTo1aO+tZKZsgvLx8WmwT9cPTUy4eIbXJh4jomcQIPV2JcCaBzxdxBwl6BbqaAcbRSYbrO
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0ba4b3-a7c8-4b28-5f47-08ded851fe38
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 15:53:00.1686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vTGg26DFBukWrvgr5ZAJlERcJlCP0YUYAwZbDsfbkiiUQ7WIND9uJ71OyubcoYdZ4kJ96C6icJTlIoP0N2ir0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR13MB5179
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE2NiBTYWx0ZWRfX21U6YyFqhIrj
 aO8MsgMZGgQmq0DlSwgfLTDIA4YuJLJ/1gAuaWmePzCegNLWKtt2s1Rsb4wqEnvkQJ5iRrVxeXf
 2lYgjr/kxi3xrrOlfHr8xKdDn5noDxC9JLXgvqQ5Y3juspdVCl6P
X-Proofpoint-ORIG-GUID: vsxeFw0nkKKvBRCHi2qxSv1hh_R3ewwT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE2NiBTYWx0ZWRfX0ewbHEB4Huoi
 VgOsEDHmLx4/K6qZXGR6Qs3HD7+OBSfOAGynDoIfcQRLshgrnkIROpYfiA2zp86MsnhLpeuFHFR
 AguQ7loteiLgce7ri8Rm8qjhM/ajYtubsay1shOI+QnP3RKZ+G96okaFMxaEu20uyF8yDbzfh8P
 JcAfhgHaRNdZWKXnilPh56IGuP/sOQvjZwhQP5wLYmss058jS3MeCiX3ND7Fno0fkp8b4gsXOdh
 fXUVjoGHcKcbafDfsgazzzERgezjnk+OMHrJTopPZgtcvT4Zi5Ji8Vnio3DEk80ADkyA5OFwmy3
 Wv23ArSPI/9dt1iHThVXwkfQwDYi+cI6U+Z07mhO90HB/oD0aJLg3ou3Wj9u4v5Rp7tf9xTlJvN
 PZczM2rZzKo2LjFv+0NzU4wLUmKHWyPCYtfXTFMfS5si6xhfuBHP2/Uqh9jSO1CO8gumkB2D3C0
 h2GP5f8+NLeye3WYaHw==
X-Proofpoint-GUID: vsxeFw0nkKKvBRCHi2qxSv1hh_R3ewwT
X-Authority-Analysis: v=2.4 cv=d4vFDxjE c=1 sm=1 tr=0 ts=6a468967 cx=c_pps
 a=IDmSThB3jRGgE2uwFnJQpQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=bd-SKr3HlWZVCYFCRTQK:22 a=VwQbUJbxAAAA:8
 a=z6gsHLkEAAAA:8 a=UqCG9HQmAAAA:8 a=wVouvuCEmgyJ4w1h6-QA:9 a=QEXdDO2ut3YA:10
X-Sony-Outbound-GUID: vsxeFw0nkKKvBRCHi2qxSv1hh_R3ewwT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGcmFuY2VzY28gVmFsbGEgPGZy
YW5jZXNjb0B2YWxsYS5pdD4NCj4gSGVsbG8gR3JlZywNCj4gDQo+IHRoYW5rIHlvdSBmb3IgdGhl
IHF1aWNrIGZlZWRiYWNrLg0KPiANCj4gT24gVHVlLCBKdW4gMzAsIDIwMjYgYXQgMTI6MjE6MzlQ
TSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiA+IE9uIE1vbiwgSnVuIDI5LCAy
MDI2IGF0IDExOjUxOjE4UE0gKzAyMDAsIEZyYW5jZXNjbyBWYWxsYSB3cm90ZToNCj4gPiA+IFRo
ZSBpbml0Y2FsbF9kZWJ1ZyBjb21tYW5kIGxpbmUgb3B0aW9uIGlzIGEgdXNlZnVsIHRvb2wgd2hp
bGUgZGVidWdnaW5nDQo+ID4gPiBhbmQgb3B0aW1pemluZyB0aGUgaW5pdGlhbGl6YXRpb24gb2Yg
YSBuZXcgc3lzdGVtLCBtYWlubHkgYmVjYXVzZSBpdA0KPiA+ID4gYWxsb3dzIHRvIHNlZSBwcm9i
ZSBmYWlsdXJlcyBhbmQgZGVmZXJyYWxzIHdpdGhvdXQgcmVjb21waWxpbmcgdGhlDQo+ID4gPiBr
ZXJuZWwgKGUuZy4sIHdpdGggQ09ORklHX0RFQlVHX0RSSVZFUikuIEhvd2V2ZXIsIG1hdGNoaW5n
IGEgZGV2aWNlDQo+ID4gPiB3aXRoIHRoZSBkcml2ZXIgaXQgaXMgYmVpbmcgcHJvYmVkIHdpdGgg
Y2FuIGJlY29tZSBkaWZmaWN1bHQsIHNpbmNlDQo+ID4gPiBzb21lIGRldmljZXMgdXNlIG5hbWVz
IHRoYXQgYXJlIG5vdCBleHBsaWNpdCwgYXQgbGVhc3QgYXQgYSBmaXJzdCBzaWdodA0KPiA+ID4g
KGUuZy46ICcxLTA6MS4wJyBvciAnMS0wMDYwJykuDQo+ID4gPg0KPiA+ID4gQWRkIGFuIGFkZGl0
aW9uYWwgZGVidWcgcHJpbnQgdG8gaW5mb3JtIHRoZSB1c2VyIHdoaWNoIGRyaXZlciBpcyBiZWlu
Zw0KPiA+ID4gdXNlZCBmb3IgYSBkZXZpY2UsIGFsbG93aW5nIGZvciBhIHF1aWNrIG1hdGNoLiBU
aGUgcHJpbnQgaXMgaW5zZXJ0ZWQgaW4NCj4gPiA+IHRoZSBzYW1lIHJlYWxseV9wcm9iZV9kZWJ1
ZygpIHdyYXBwZXIgdGhhdCBpcyBhbHJlYWR5IHVzZWQgdG8gcmVwb3J0DQo+ID4gPiB0aGUgcmVz
dWx0IG9mIHRoZSBwcm9iZSwgYW5kIGlzIHRodXMgbm90IGFmZmVjdGluZyBleGVjdXRpb25zIG5v
dCB1c2luZw0KPiA+ID4gdGhlIGluaXRjYWxsX2RlYnVnIG9wdGlvbi4NCj4gPiA+DQo+ID4gPiBT
dWdnZXN0ZWQtYnk6IFRpbSBCaXJkIDx0aW0uYmlyZEBzb255LmNvbT4NCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEZyYW5jZXNjbyBWYWxsYSA8ZnJhbmNlc2NvQHZhbGxhLml0Pg0KPiA+ID4gLS0tDQo+
ID4gPiBIZWxsbywNCj4gPiA+DQo+ID4gPiB0aGlzIHZlcnkgc21hbGwgcGF0Y2ggY29tZXMgZnJv
bSBhIGRpc2N1c3Npb24gc3RhcnRlZCBhdCB0aGUgZW5kIG9mDQo+ID4gPiAyMDI0IGFmdGVyIGEg
Qm9vdCBUaW1lIFNJRyBtZWV0aW5nIFsxXTsgSSBkZWNpZGVkIHRvIHJlZHVjZSB0aGUgcGF0Y2gN
Cj4gPiA+IHByb3Bvc2VkIHRoZXJlIGJ5IFRpbSB0byB0aGUgYmFyZSBtaW5pbXVtLCBhcyB0aGlz
IHNob3VsZCBhbHJlYWR5IGJlDQo+ID4gPiBlbm91Z2ggaW5mb3JtYXRpb24gZm9yIGEgZGV2ZWxv
cGVyIHRvIHdvcmsgd2l0aC4NCj4gPiA+DQo+ID4gPiBJIHdhcyB1bnN1cmUgb24gd2hldGhlciB0
byBhZGQgaW5mb3JtYXRpb24gdG8gdGhlIGV4aXN0aW5nIHByaW50IG9yDQo+ID4gPiBpbnRyb2R1
Y2UgYSBuZXcgb25lOyB3aGlsZSBJTU8gdGVjaG5pY2FsbHkgd29yc2UsIEkgb3B0ZWQgZm9yIHRo
aXMNCj4gPiA+IHNlY29uZCBzb2x1dGlvbiwgc2luY2UgdGhlIGV4aXN0aW5nIHByaW50ICptaWdo
dCogYmUgdmlld2VkIGFzDQo+ID4gPiB1c2Vyc3BhY2UtZmFjaW5nIEFCSS4gSSdsbCBiZSBoYXBw
eSB0byBkbyBvdGhlcndpc2UgaWYgdGhlcmUgaXMNCj4gPiA+IGNvbnNlbnN1cy4NCj4gPiA+DQo+
ID4gPiBUaGFuayB5b3UhDQo+ID4gPg0KPiA+ID4gUmVnYXJkcywNCj4gPiA+IEZyYW5jZXNjbw0K
PiA+ID4NCj4gPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC0NCj4gZW1iZWRk
ZWQvTVc1UFIxM01CNTYzMjc3QUY1OTcyRkQyQjU2MDI2Q0Y5RkQzQzJATVc1UFIxM01CNTYzMi5u
YW1wcmQxMy5wcm9kLm91dGxvb2suY29tLw0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9iYXNl
L2RkLmMgfCAzICsrKw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4g
PiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9iYXNlL2RkLmMgYi9kcml2ZXJzL2Jhc2Uv
ZGQuYw0KPiA+ID4gaW5kZXggNjBjMDA1MjIzODQ0Li4zYzA5MzAwMjAwNTAgMTAwNjQ0DQo+ID4g
PiAtLS0gYS9kcml2ZXJzL2Jhc2UvZGQuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9iYXNlL2RkLmMN
Cj4gPiA+IEBAIC03ODIsNiArNzgyLDkgQEAgc3RhdGljIGludCByZWFsbHlfcHJvYmVfZGVidWco
c3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBzdHJ1Y3QgZGV2aWNlX2RyaXZlciAqZHINCj4gPiA+
ICAJa3RpbWVfdCBjYWxsdGltZSwgcmV0dGltZTsNCj4gPiA+ICAJaW50IHJldDsNCj4gPiA+DQo+
ID4gPiArCS8qIERvbid0IGNoYW5nZSB0aGlzIHRvIHByX2RlYnVnKCkgLSBzZWUgY29tbWVudCBi
ZWxvdy4gKi8NCj4gPiA+ICsJcHJpbnRrKEtFUk5fREVCVUcgInByb2JpbmcgJXMgd2l0aCBkcml2
ZXIgJXNcbiIsIGRldl9uYW1lKGRldiksIGRydi0+bmFtZSk7DQo+ID4NCj4gPiBTbyB5b3Ugbm93
IGdldCAyIGxpbmVzIHBlciBkcml2ZXIgcHJvYmUgYXR0ZW1wdD8NCj4gPg0KPiA+IFdoYXQgZXhh
Y3RseSBpcyB0aGlzIGdvaW5nIHRvIGhlbHAgb3V0IHdpdGg/ICBZb3UgYWxlYWR5IGdldCB0aGUg
cHJvYmUNCj4gPiByZXN1bHQgbGluZSwgaG93IGlzIGRvaW5nIDIgZ29pbmcgdG8gY2hhbmdlIGFu
eXRoaW5nIGV4Y2VwdCBleHBsb2RlIHlvdXINCj4gPiBrZXJuZWwgbG9nPyAgV2h5IG5vdCBqdXN0
IG1vZGlmeSB0aGUgb25lIGV4aXN0aW5nIGxpbmUgaW5zdGVhZD8NCj4gPg0KPiANCj4gSSB3YXMg
YmVpbmcgb3ZlcnplYWxvdXMgd2l0aCB0aGUgImRvbid0IGJyZWFrIHRoZSB1c2Vyc3BhY2UgQUJJ
IiBydWxlDQo+IGFuZCBpbmNsdWRlZCB0aGUgZXhpc3RpbmcgcHJpbnQgaW50byB0aGlzIGtpbmQg
b2YgQUJJLiBHaXZlbiB5b3VyDQo+IHJlc3BvbnNlLCB0aG91Z2gsIHRoaXMgbWlnaHQgbm90IGJl
IHRoZSBjYXNlLiBJJ2xsIHdhaXQgYSBjb3VwbGUgb2YgZGF5cw0KPiB0byBzZWUgaWYgYW55b25l
IGhhcyBzb21ldGhpbmcgdG8gYWRkIGFuZCB0aGVuIHNlbmQgYSBWMiB0aGF0IGFkZHMgdGhlDQo+
IGRyaXZlciBuYW1lIHRvIHRoZSBleGlzdGVudCBwcmludCAoc29sdXRpb24gdGhhdCBJIHRlY2hu
aWNhbGx5IHByZWZlcikuDQoNCkkgZXhhbWluZWQgc2NyaXB0cy9ib290Z3JhcGgucGwsIGJvb3Rj
aGFydCwgdG9vbHMvcG93ZXIvcG0tZ3JhcGgvYm9vdGdyYXBoLnB5DQpzeXN0ZW1kLWFuYWx5emUg
YW5kIHNvbWUgb3RoZXJzIHRoYXQgcGFyc2UgZG1lc2cgbGluZXMgcHJvZHVjZWQgYnkgdGhlIGlu
aXRjYWxsX2RlYnVnDQpvcHRpb24gKGluY2x1ZGluZyBteSBvd24gdG9vbHMpLg0KDQpUaGUgb25s
eSB0b29sIEkgZm91bmQgdGhhdCBwYXJzZXMgdGhlIHByb2JlIGRlYnVnIGxpbmVzIGlzIGFuYWx5
emUtaW5pdGNhbGwtZGVidWcucHkNCiAtIHdoaWNoIGlzIHlvdXIgcHJvZ3JhbSwgYW5kIHdlIGRp
c2N1c3NlZCB0aGF0IHlvdSBwbGFubmVkIHRvIG1vZGlmeSB0aGF0IHRvb2wgdG8gDQphY2NlcHQg
Ym90aCBvbGQgYW5kIG5ldyBzdHJpbmcgZm9ybWF0cyBmb3IgdGhpcyBsaW5lLg0KDQpUaGlzIGlz
IGFsbCB0byBzYXkgdGhhdCBJJ20gbm90IGF3YXJlIG9mIGFueXRoaW5nIHRoYXQgd2lsbCBicmVh
ayBpZiB5b3UgY2hhbmdlIHRoZQ0KZm9ybWF0IG9mIHRoZSBleGlzdGluZyBwcm9iZSBkZWJ1ZyBs
aW5lLiAgU28gbXkgdm90ZSB3b3VsZCBiZSB0byBhZGQgdGhlIGRyaXZlcg0KbmFtZSB0byB0aGUg
ZXhpc3RpbmcgcHJpbnRrIGxpbmUuICBPZiBjb3Vyc2UsIGl0IHdvdWxkIGJlIGdyZWF0IGlmIHlv
dSBjYW4gZG8gc28gY29uc2VydmF0aXZlbHkNCih0aGF0IGlzLCBrZWVwaW5nIG1vc3Qgb2YgdGhl
IHN0cmluZyBlbGVtZW50cyBpbnRhY3QgYW5kIGluIHRoZSBzYW1lIG9yZGVyLCBzbyB0aGF0IGV4
aXN0aW5nIHBhcnNlcnMNCnRoYXQgd2UgbWlnaHQgbm90IGJlIGF3YXJlIG9mIGRvbid0IGJyZWFr
KS4NCg0KSSdsbCBiZSBnbGFkIHRvIHNlZSB0aGlzIGV4dHJhIGRhdGEgYXZhaWxhYmxlLg0KIC0t
IFRpbQ0KDQo=
