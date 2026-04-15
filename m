Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578C1624C0;
	Wed, 15 Apr 2026 23:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295865; cv=fail; b=C+s1FjxmCUCtUhS9jcr0NIjt4qa/NgIzSKFKcWNlxo1flJ/KylWDZVeqUXdqWi9VNse+BZg6pzG9GN6eL1mMT4hiPfCaFlJagnA/IbhPQZIq2pp00mXKLHmEIEAulvoNl5yzEolq7NxNoUgvNP3Exy1zLXfqCUI7XUh9oJfsj+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295865; c=relaxed/simple;
	bh=a1Kxm8q+xwqt9DqNCKgQtEZ42bwUlNDxZsTkhszLjDw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M30KvX/cBPtDE9+akLheJABzdAKrbqZh9yU95V6gl4Yw1ZYPWJ0KCO5vEkAElP4NMxqPTTDK/j5MhhMh19FvPPe5gp1JBqznBJqZJHFFL4zK/yukDkvumHtIWhwvtIZ+wS/BgqkOT8cgBi4cBSl5J/voAk7CL3EBQiJa0Jq3tOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=oQHUhgrM; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="oQHUhgrM"
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FMoZDH2729488;
	Wed, 15 Apr 2026 23:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=a1Kxm8q
	+xwqt9DqNCKgQtEZ42bwUlNDxZsTkhszLjDw=; b=oQHUhgrM8mOWG6NZlK2JzbD
	onqht9dKrRAqd2puUkkCf0taJhWLYH3v1AwmTMLNWxL4pWW+6uBT1nDuQyNCrl3C
	zT24FZ1D91n4KNov1M38QeQzHusJjOo4Bk5uurgnPmBSn9O/++3k7MovkWx633IW
	EUqXV0fXJ99ja+AJtZHs3w/Kw1lCe6fi3WOpUMbGziShdfRAIJkn6xwhjg6xf4DK
	S6aX23Gku8bUgTG8R2GiY6xWaj22K6WZ7pDhQzuIlXaH4O6YdWgKDhEE1555aVkr
	2f6h5yTQBOn1BFIvZRQp0L7zk43BJOs9+xDRfjc8GDPtVlmSQ+fPJXknp6qR+Fw=
	=
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4dh84eauat-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 15 Apr 2026 23:12:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+7EEGqb9MJqhYbftAbyYcJClg8LSTrpJi8vyPXEEXjznD9te7QfjMPpPKLsg9VRCgKwx5E9ffUm7yVrAumCoREyBYecQJDWlb0WH3ZlelXg5vV2qYuRci2ZzAnYrz9tuzQduTJuYBKUF3ZA5I1F5GrkRS2DC9xoBk2sRFcWph+IHyqrBUX6q1xr0LiRDprXf6tRG2M1M827q1x/KXNxilabA6JBTffEWr003rY0okCWUyVNAtJ4g0fidq9V0Uvvxwocy3mN65CKt3ypRPmKU146GDaCq2eIopq7/nijEifR+rnjo/XYT7jYhvKmWVdE2iCFuQ8aoieBAfty8MuwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1Kxm8q+xwqt9DqNCKgQtEZ42bwUlNDxZsTkhszLjDw=;
 b=JGxsokjCsw4+rpZwPNNUqsSqQHanZHGP+wMakQGMRRXY7N0izCJdRopzPLcqccDphHvD6hZijW3iswp115VCW2gwrASpUz5J07pvsJn4bIuMFCVYaERd6o7vth4fajV5FOdu4Md7rSeLVVAvob1xHn4p0DgkjAEMiLLes49mRbfUU6x3Y0gMSXqFDO6C1rMu2bNxdRJE69EmCC/ASaMSVoGXFoEkP8MkqffmiMD/SYanCLDlNEdSfq1l+Vx+UtU1C5w+8araRhWfJU0S3m/IdD+DP7QPkPFaoQixDS2Kaf0yI9LOOEwV80P7IW+2viYbsiX/6ZcR8nusMoJL7Fr9Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by CH3PR13MB6339.namprd13.prod.outlook.com (2603:10b6:610:1a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 23:12:04 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%3]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 23:12:04 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "Roberto A. Foglietta" <roberto.foglietta@gmail.com>,
        Thomas Gleixner
	<tglx@kernel.org>
CC: "pmladek@suse.com" <pmladek@suse.com>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        "john.ogness@linutronix.de"
	<john.ogness@linutronix.de>,
        "senozhatsky@chromium.org"
	<senozhatsky@chromium.org>,
        "francesco@valla.it" <francesco@valla.it>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "shashankbalaji02@gmail.com"
	<shashankbalaji02@gmail.com>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        David Laight <david.laight.linux@gmail.com>
Subject: RE: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early
 boot
Thread-Topic: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in
 early boot
Thread-Index:
 AQHcySnwCKS9XsxkTEiUYBbigES1DrXfLICAgAAcOQCAAWMkAIAAB3+AgAAHs4CAAAFScA==
Date: Wed, 15 Apr 2026 23:12:04 +0000
Message-ID:
 <MW5PR13MB563296D757735B5B84336781FD222@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20260410203741.997410-1-tim.bird@sony.com>
 <20260410203741.997410-2-tim.bird@sony.com> <87qzohdv6i.ffs@tglx>
 <CAJGKYO6Kk4+=9FEJYGxmBQhsB871ERaG0i33Pzx2BV-o7QDFJA@mail.gmail.com>
 <87bjfjap37.ffs@tglx>
 <CAJGKYO5R3yM_DtALNd7BYoNMP6RiRJvCfU84vQNPCKz_Vizweg@mail.gmail.com>
 <CAJGKYO4PatnJLPVuwp730hEEqsMCEAravO-cS6xyenMNJEsXtQ@mail.gmail.com>
In-Reply-To:
 <CAJGKYO4PatnJLPVuwp730hEEqsMCEAravO-cS6xyenMNJEsXtQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|CH3PR13MB6339:EE_
x-ms-office365-filtering-correlation-id: 993bb235-ef6d-4921-ab9b-08de9b44687c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 tReEsj2KyAJlvOnjvJI1M/N/Mo/ENJrmH16rsQo8neNFW5wJtwQJHd887vM8WA0Hn2VAM/ZTHmGxpBOzt31ZeET2niX5Wa4fAy+MnRyoatSKy02lNaL3Q4x0C/vDULTVUqEUNTxE7lIpwK0C4Pjq6OQoAa6incP74cKxlF5DRr78dQqf850w3nS1UKvTwBIeu7jqr86GYAyxTeOuNzEoVJqy0Sxr0KqnyjSGmEa8PKqIJG72UFc286Kfb0hovmwEPBNP9vpDQVLeL+a2RYJBtigyiNXoeRT0/XJGWByoAmk2N9dNpWb12RLTWH9CvlkDi16MhQdGpIGfYKcurQ+cGEYszpI9s+6yP6yqwUd31tu+bdWsEVs2lQ2UbFncSZz8FnuyLp4uX/aXx8OBugRtScKv7NXkfIJ/dN3698O6W/Hm1f6JmZa8QRLWQ6FdYEpv6S15LS5afe/+M5+8latp6HCxhSWy29u0WUPp5ecfNZlzvYenKzXVrqBbQzmeKovHIuffwvVHjrmK88kmjWfBJz/aThOsWParrcJeMXg2vfcsajgwAEEuE4QFluNgeRhziuD8y6tk1C+DkI4DEACHvjrkHLEn8+46kZ9qKMHwxepb+B/KqxqwrtCJ59chtt+uASL2bOkaIG6S2CCpTgi4DiaCa95yfMe8MQR06nFLVrUECDkKgc1wGdLkOnJ4XSYV2tGoA0OaU0KC0rm2QE4pccBeHTpUGEq43oXMa/GR82k09LFIExYfAOyObxyky7w3CQHdY9TMzWGu1cZs2pNxYWp/VPs8Arq89bRd9rSeKQM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGF1Q3cvRy9yYnp3UERvS0RmRis5dCtwaFFCUE1MRE9hK1ovUTJvckorOU9U?=
 =?utf-8?B?aHZzOU5ndkJlVVBodnY1VnlZWmZFTkZCS1VyMzR6d3NTeGMvNGt2MUhONWtx?=
 =?utf-8?B?YytCVUJBcitIMUc3b1V5M2NBUGRKdEhJbGdsK2NwS0VGK3BKWXRGdFUrYk9F?=
 =?utf-8?B?cnRTSU1lU1ZYWjRNWkJoWGZTU3JBTGRHakZZM3FqbmsyVkFjMnloYnNkemkw?=
 =?utf-8?B?QzY1WkZxLzhDWG5KTElLUEVReGFtRldXakFwNnE5a2tndEFtdUx0RTNKZVZU?=
 =?utf-8?B?d3ZXYmp1ZmdEeUc5RzBzMm95bzQzazdMd0FwYnA2QU8zTkc2cHh5UEJEMVFK?=
 =?utf-8?B?akpjYlFuVnVZQlowMzZ5TzlpTmd4QTRLd0dudnNSekJBTXEyV0xmOWZybmxD?=
 =?utf-8?B?RmQ1MWpkV096cVVFY3F0L0RKS2J5b3JBRzRYMFQ2OFkveVBqSE5qTUZyZzdU?=
 =?utf-8?B?SnhRVGZ5cGY5UHNNNlpTVEJ2VEIvY0FNNzNkNnoyS2l0bDJqYTA4aXJGL1hj?=
 =?utf-8?B?Z2hsRFJoeHF6UjZaMUZZMU03eW1DOTRMUHIwRG96Nm9OTm12MDN6L2YvS2F4?=
 =?utf-8?B?TzVGKzY3cW50M1p6RWhSdC9DWGR6MlBTZDEvQnlIc1JSLzVlVGNrczZzbDRr?=
 =?utf-8?B?SkdRMno2ZWJQd2hOWGJkYnlvQzZobmJ3UVg5MzJ6UmFHdVpFZEUvaE5hZEFS?=
 =?utf-8?B?TEM4RkRiWmJhZVlsKzhvQitKbWpJdnBnWHRtQXUrNlp5eERIa0lScUM0ekJx?=
 =?utf-8?B?b0hoMzFvZjlISmFYbGF3Vzl5ZHNVYmg0ZGlEcFBHRjZIenNJa3cwaUpBVHRP?=
 =?utf-8?B?THA0S2RIRThpSTRHUXlGVEtOYy9yYWowZ216eXZpL1podjRWSndjaFlXZVRm?=
 =?utf-8?B?RzNqNGtUc1hNS3RQdG9KR3N6WnVlYzQvSXovNHJQeXBVWEpST2o1ZFk5LzdC?=
 =?utf-8?B?bEt4ZHMxekFuSXhWbXNSTWZVdkZxKzMzQWxiY0dUWEhXaUVVR1lVMUlBUFkw?=
 =?utf-8?B?UDlRL3hHbWRscy94dkRxMHRKMCtOMEV2QUlZNDNCMmFDK1ZGaFVNSm5kK2pa?=
 =?utf-8?B?MURBbWI2S2VCOVdjeUt0eWRNc0M0clZlSlZsZTVxN09DTitTZ3k0T0Zwa2J0?=
 =?utf-8?B?UnFqMG01YWMvakF1eWVFZjBkKzJpNGluYlJHYWxtWDJKdGtFbEwvWWhRaHVU?=
 =?utf-8?B?N2dkczZrZ05uS05xQVJQeC9sOTAxVEdiNXR3REhYV0NqaGdjOWtMUTUwMnly?=
 =?utf-8?B?WG56eCtLQ3B0cTE2eDgwZVZ3L1NycnAya3dQMU1hVUJJQ1g5QjVib3M5RHZx?=
 =?utf-8?B?R3BUTW5udzNKSW9sLzl4TE5HWDJXTENsblVHaDF2TVUvMkpGUG5rMTQyTnRq?=
 =?utf-8?B?ZXFTazUzbCtYRWNnYlo1QXJ3eC9WS1loZnViSzhzOERacXVHdm84dlhhNDN5?=
 =?utf-8?B?eWNZWWNmdEhsbnYxbVQ1S1BxSmRPVmdiKzFzQXN5YVh3Z3dQM0hwV0ppbjBk?=
 =?utf-8?B?Q0xKMEhoY3dPQUE0UlVsQm1WN1AyZ0RxWlRHelpHVm9TSUo3SmRUN1BDOVp3?=
 =?utf-8?B?anBnaVZoMHVvMVNxQ3VkaTlVYVFncW9BaE9sQzF3RkZtVGxYdDFPN2NQMksy?=
 =?utf-8?B?L0RNU1NGOEpQT1cvdU9IVzdjOUg4Ly9VVVkya2hRMU9wcGhmRFI4Tm5Mcnds?=
 =?utf-8?B?aVlzbDg2Ni9zamR2TWk3VkhKQ1ZsWnJwV3dTV1BONW9vSUgweWZzOVp0RHNl?=
 =?utf-8?B?V2VhTE1tWE1vTXA0ZG9kMFhWQTY4SVEvOG9HN20rbDR3UloyS1c4Q2JodlZG?=
 =?utf-8?B?MjdLN01pSGwrVFJVQmRZUUxLRFVkN2ZMWDdpOVlra0ZLc1NHWFhRei9Pd0s1?=
 =?utf-8?B?ZnRnL1c3U21BMW5Mc0VIRVhNZkFGSmZEN2c4dzliY1J6MU5BbHNTSXdFMjRV?=
 =?utf-8?B?Ujllb29vNGNXNE1WTDJoS2JqMVdoS2FxU3pwRGhSSUtsU3JyUEdFNHVNU2s4?=
 =?utf-8?B?RjFPejY1cDEzTG9hSUNZdWU2cDkvMHZHaXNGcExpd2Q1SFFHK0diSUxCQ3Fo?=
 =?utf-8?B?bWZuSGEzZ3lYNXRwdGFIVGZGTmFUVTZXL256SEZTRzhPa2dpazd3UjRqUmQ2?=
 =?utf-8?B?NVI3U2t5V2hyNm5CTFp2OVV6L1NweCtVemFyd0NhOVA1WHVRdFpqNVpSRlVn?=
 =?utf-8?B?c3BsNnNzZVVJeXk4QiszMFZlOGVIdGZNYTAyV3JUQ1E5RGN0Y3BZSmJMU05l?=
 =?utf-8?B?K2NBenU3T3VjaE10a0lvenNxWEFCbUpQM0pXNXVQU1JoaU03WkhQN0lzMElY?=
 =?utf-8?B?dXJQZE9rd1BjTWNGQ3Vnc2tSWExyaW5aZzcydCtLdno2Y2M2UldsbHFhMmdh?=
 =?utf-8?Q?wzZRu2j2oOqD52qGkYsLTX8lUg0FIghL4e/Gk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Z0N4747NNpf5i8i+mHcD7bZqxDGYlSIDwNjHuzQZ9qqDJUMLKGmJZa5EWXqAXqx8GHx6Cp0VnfCf1nTYXBfKGAJoCdZSOXHNDjaxOrzabmYrmo963sGSvSEduH6F0UbH3u3mIegnzb0z1QB+n80MqWV5l+cGDJ+4mWGmr4BMta6Fw5qZiUSC2S6YqndTmII3DQUKKV+bXVKFOMIaudEo/h+7AoeWiAN1OqnoQFMGV3wjTN+Vah/yQ9RoL/uCac4kkinRiglIVq31pnqcfQOx5C8jKUeCEDIWegb5n1Z2uGLtEWsYP185ImHzOLfQMHPNLDpWydVLu9JtJR+POYrlEA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gUDco2+967EDBUJMn4w8JU3J/CtLgNN6TNhm3s9GSr7g+xv9FVpo/7q0/VYW0ApHBSyYR3UQDrseFpVxVrr4vArFRtPMreIilt+gO+pJRvV9DM57D9hm0rp/givZ8M25CjOT56IrFtEKv6plW6kNX2N4GvrooPiaK4GWnZYGAIn7NjX68xxBgP4rYoNA2J3xBRVTBSBwuKy+wAOqBjiZhAxA+yKbjdU7IjKXQ8fv8ak/0S1DVz4/Q0HcbBIhwt1ZWrHRj36Zz/wK8Acl3cCBT+3syvLtKz6JmuSoP36tPjkF4cN6UYBiQCU2+Xsl56lNPVqB4tWHVwXTyBahxsOmL2I+Ijue+afQ9SV6orCBfheEnR3Jfisd/nETIXQ+4IBA2GksxizR23MWLYODDQsyrF5jS1dw6P1LnRxRVpnz+bGI3d+5aiBhb4CrYTPKTGTTUwB0cnTi5+8mmX9wccj2xffaWdaBo6eVTWERG02twLMWEZz04smdkdMkvCWH/Z1sjFjj6wZZAKWjCOx5un25bkcunqpPImNuaNk7hkXbMdPZ5rXrb+c12v/pxUn6Uynf9VruvBkyv//TAs3czyLioLA6R34qMMcx+wPbxpFCiwECwXdTzp6GQro971L2GOY2
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 993bb235-ef6d-4921-ab9b-08de9b44687c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 23:12:04.6033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H0QcOROkhiN66bq9R6v4SoV09pJq0NEswoh8pMB6oyXdf/oEgtnYdzxV6YvH2KUO2nQyJghtWc+d2WQ2caYj+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR13MB6339
X-Proofpoint-GUID: qrhoDN44OTPULYxjGirMMqjRLZpHxvYJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxNyBTYWx0ZWRfX82bc/c8S3qOG
 8qZ8vUc8Vuk6fy6azAIk4ZIy55lUBH6UB5rLMjfUjrKGRc6eigXo9y2YcvXEXxTAKgcdIab47wI
 merADzrvZD4x1TlAGycBltivIraseYnkbxhVbpUYQeyPR5aL+tsWeF4A9O/cGYF1msjeTuu+rav
 u1SYP4T+mmF75rTLcPZXRHntYKB0InUB2Asr0cezUqwhYE7cRCbQ0ejtfWxpNGUIc/0XSvM6rpb
 Ateyccf+Ln+OQXWJ7nFcvXGt3Id15jNuxL8EjWRUqX929FvQIGcjI1TCxRlmqomg8DS6co4PS8o
 QFaVfV2fikeIWy5JG2OYYnacER15QLUd9lE4qYv1+T37KJ55iqT06eW8juPKhPksmauNNbJRIgf
 JUTUQzldDY/0a31ioT4EtpYyOU6BdB7Xh9hsXGDe8iGOHfsQu5Br+2AVT36KzQ3w1MH29Plzbia
 qEp7uGJ/bbWkkd30EhA==
X-Authority-Analysis: v=2.4 cv=KvN9H2WN c=1 sm=1 tr=0 ts=69e01b4a cx=c_pps
 a=+5nsKerQHvRPAoQt0ERV+A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=jHItnBwsj8f3cr25iGAb:22 a=pGLkceISAAAA:8
 a=LfD5RFJ2MdVwQm8x2cUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: qrhoDN44OTPULYxjGirMMqjRLZpHxvYJ
X-Sony-Outbound-GUID: qrhoDN44OTPULYxjGirMMqjRLZpHxvYJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2JlcnRvIEEuIEZvZ2xpZXR0
YSA8cm9iZXJ0by5mb2dsaWV0dGFAZ21haWwuY29tPg0KPiBPbiBXZWQsIDE1IEFwciAyMDI2IGF0
IDIzOjU3LCBSb2JlcnRvIEEuIEZvZ2xpZXR0YQ0KPiA8cm9iZXJ0by5mb2dsaWV0dGFAZ21haWwu
Y29tPiB3cm90ZToNCj4gPg0KPiANCj4gWy4uLl0NCj4gDQo+ID4gVjUNCj4gPg0KPiA+IEEgc2lu
Z2xlIGZpbGUgd2l0aCB0aGUgZXNzZW50aWFsIGZvciBoYWNraW5nIHRoZSBlYXJseSBib290LA0K
PiANCj4gZWFybHlfdGltZXMuaCAtLSBpdCBtZWFucyBiZWZvcmUgZXZlcnkgZmVhdHVyZSBvZmZl
cmVkIGJ5IHRoZSBrZXJuZWwNCj4gaXMgYXZhaWxhYmxlIG9yIDEwMCUgdHJ1c3RhYmxlLCB0aHVz
IEFTTSBiZWNhdXNlIGl0IGlzIGFsc28gc3VwcG9zZWQNCj4gdG8gZml4IHdoYXQgaXMgYnJva2Vu
IGluIHRoZSBrZXJuZWwgdGh1cyB1c2luZyB0aGUga2VybmVsIG1hY3JvcyBpc24ndA0KPiB0aGUg
Y29ycmVjdCB3YXkgdG8gZG8gc28uIEVhcmx5IHRpbWVzIG1lYW5zIGJlZm9yZSB0aGUga2VybmVs
LCB0aHVzDQo+IGFsc28gb3V0LW9mLWl0LXRocmVlIG9yIGZlYXR1cmUgc3VwcG9ydC4gVGhlbSBh
c20gKGlzYikgc291bmRzIHRvbw0KPiBkcmFzdGljIG9yIG5vdCBlbm91Z2ggZm9yICJleGhvdGlj
IiBhcm0gYXJjaD8gSXQgaXMgYSB0ZW1wbGF0ZSB0bw0KPiBzdGFydCB3aXRoLCBub3QgYSB3b3Jr
aW5nIHBhcnQgb2YgdGhlIGtlcm5lbC4gV2hlbiB0aGUga2VybmVsIHdvcmtzLA0KPiAhMCA9PSB0
cnVlIGlzIHRydWUuDQoNClJvYmVydG8sDQoNCkkgYXBwcmVjaWF0ZSB5b3VyIHdvcmsgdG8gYWRk
cmVzcyBkZWZpY2llbmNpZXMgaW4gdGhlIHByb3Bvc2VkDQpwYXRjaCwgYnV0IEkgZG9uJ3QgZm9s
bG93IHRoZSBhYm92ZSBwYXJhZ3JhcGguICBUaGVyZSdzIG5vdGhpbmcNCiJicm9rZW4iIGFib3V0
IHRoZSBrZXJuZWwgdG8gZml4LCBqdXN0IGFuIG9wcG9ydHVuaXR5IHRvDQppbnN0cnVtZW50IG1v
cmUgY29kZSBkdXJpbmcgYm9vdHVwIHRoYW4gaXMgY3VycmVudGx5IHN1cHBvcnRlZC4NCg0KSSB0
aGluayBUaG9tYXMgaGFzIGRlbW9uc3RyYXRlZCB0aGF0IHRoaXMgZG9lcyBub3QgaGF2ZSBhIGxv
dCBvZiB2YWx1ZQ0KZm9yIHg4Nl82NCBwbGF0Zm9ybXMgKHdoZXJlIHRoZSBibGluZCBzcG90IGlz
IGFscmVhZHkgcXVpdGUgc21hbGwpLCBidXQNCm9uIEFSTTY0IGFuZCBSSVNDViBJIHRoaW5rIHRo
ZXJlIGlzIHNvbWUgdmFsdWUgdG8gZGV2ZWxvcGVycyB3b3JraW5nDQpvbiBib290IHRpbWUuDQog
DQo+IFRoZSBjb25jZXB0IHJlbWFpbnMgdGhlIHNhbWU6IGEgcmVnaXN0ZXIgY291bnRlciByZWFk
IHByb3RlY3RlZCBieQ0KPiBmZW5jaW5nLiBOb3QgbW9yZSwgbm90IGxlc3MgdGhhbiB0aGUgZXNz
ZW50aWFsLiBBbmQgYSBidWNrZXQNCj4gb3V0LW9mLXRoZS10aHJlZSBhcyBhIHN0YXJ0aW5nIHBv
aW50ICoqYmVmb3JlKiogdGhlIGtlcm5lbCBpcyByZWFkeSBvcg0KPiBmaXhlZC4gV3JpdHRlbiBp
biB0aGlzIHdheSwgZG9lcyBpdCBzb3VuZCBtb3JlIHJlYXNvbmFibGU/DQoNCkkgZG9uJ3Qga25v
dyB3aGF0ICJidWNrZXQgb3V0LW9mLXRoZS10aHJlZSIgbWVhbnM/DQoNClRob21hcyBoYXMgZXhw
cmVzc2VkIGNvbmNlcm5zIGFib3V0IGEgbnVtYmVyIG9mIGlzc3VlcyB3aXRoIHRoZSBsYXRlc3Qg
djQNCnBhdGNoIHdoaWNoIEkgaGF2ZW4ndCByZXNwb25kZWQgdG8geWV0LiAgSSB3YXMgdHJ5aW5n
IHRvIHJlcHJvZHVjZSB0aGUgYnVnDQpyZXBvcnQgd2l0aCBjbGFuZyBjb21waWxhdGlvbiAocmVw
b3J0ZWQgYnkgMC1kYXkgb24gU3VuZGF5KSwgYW5kIHNvIGZhciBoYXZlDQpub3QgYmVlbiBhYmxl
IHRvLiBJIGhhdmUgYSBwcm9wb3NlZCBzb2x1dGlvbiBmb3IgdGhhdCwgYW5kIGZvciBvdGhlciBm
ZWVkYmFjayByZWNlaXZlZC4NCkJ1dCBJIGhlc2l0YXRlIHRvIG1ha2UgYSBWNSBwYXRjaCBiZWZv
cmUgSSByZXByb2R1Y2UgdGhlIHByb2JsZW0gb24gbXkgc3lzdGVtDQphbmQgdmVyaWZ5IG15IGZp
eCBmb3IgdGhhdCBidWcgcmVwb3J0Lg0KDQpIb25lc3RseSwgZ2l2ZW4gaG93IHN0cm9uZ2x5IFRo
b21hcyBmZWVscyBhYm91dCBzb21lIG9mIHRoZSBpdGVtcywgdGhpcyBtYXkgZW5kDQp1cCBub3Qg
YmVpbmcgYWNjZXB0ZWQgdXBzdHJlYW0uICBCdXQgcmF0aGVyIHRoYW4gZ2l2ZSB1cCBhdCB0aGlz
IHBvaW50LCBJJ2QgbGlrZSB0bw0KYXQgbGVhc3QgYWRkcmVzcyBhbGwgZmVlZGJhY2sgcmVjZWl2
ZWQgYW5kIGlzc3VlIG9uZSBtb3JlIHBhdGNoIGZvciBjb25zaWRlcmF0aW9uLg0KSWYgaXQgZG9l
c24ndCBnZXQgYWNjZXB0ZWQsIEkgd2lsbCBoYXZlIHJlY2VpdmVkIHNvbWUgdmFsdWFibGUgZmVl
ZGJhY2sgd2hpY2ggd2lsbA0KaGVscCBtYWtlIHRoZSAob3V0LW9mLXRyZWUpIHBhdGNoIGFzIGdl
bmVyYWwgYW5kIGFzIGNvbmZvcm1hbnQgd2l0aCBrZXJuZWwgc3RhbmRhcmRzDQphcyBwb3NzaWJs
ZSwgd2hpY2ggaXMgdXNlZnVsLg0KDQpXaXRoIHJlZ2FyZCB0byB0aGF0LCBJJ2xsIG5vdGUgdGhh
dCBzcHJpbmtsaW5nIGVhcmx5X3Vuc2FmZV9jeWNsZXMoKSBkZWZpbml0aW9ucw0KYXJvdW5kIGFy
Y2ggZGlyZWN0b3JpZXMgd2lsbCBtYWtlIGFuIG91dC1vZi10cmVlIHBhdGNoIGxlc3MgbGlrZWx5
IHRvIGFwcGx5LCBzbw0KdGhlcmUncyBzb21lIHRlbnNpb24gaW4gaG93IHRoZSBwYXRjaCBzaG91
bGQgYmUgc3RydWN0dXJlZCBmb3IgdXBzdHJlYW0NCmFjY2VwdGFuY2UgYW5kIG91dC1vZi10cmVl
IG1haW50ZW5hbmNlLg0KDQpGb3IgdGhvc2UgaW50ZXJlc3RlZCwgSSdtIHRyeWluZyB0byBhZGRy
ZXNzIHRoZSBmb2xsb3dpbmc6DQogLSB1c2Ugb2YgYXJjaC1zcGVjaWZpYyBpZmRlZnMgaW4gZ2Vu
ZXJpYyBoZWFkZXJzDQogLSB3YXJuaW5nIGFib3V0IGRpdmlkZSBieSB6ZXJvDQogICAgLSB0aGVy
ZSBhcmUgbXVsdGlwbGUgd2F5cyB0byBhZGRyZXNzIHRoaXMsIGFuZCBJIHdhbnQgdG8gdXNlIHRo
ZQ0KICAgICAgbW9zdCBtYWludGFpbmFibGUgKGxlYXN0IHNvdXJjZS1jb2RlLWRpc3J1cHRpbmcg
YW5kIGNvbmZ1c2luZykNCiAgICAgIG9uZSBnb2luZyBmb3J3YXJkLiAgSSBsaWtlZCBEYXZpZCBM
YWlnaHQncyBzb2x1dGlvbiAodmFsPzoxKSwgYnV0IGl0IG1heSBub3QNCiAgICAgIGJlIG5lZWRl
ZCB3aXRoIG90aGVyIGNoYW5nZXMgSSBwbGFuIHRvIG1ha2UuDQogLSB1c2Ugb2YgbXVsX3U2NF91
MzJfZGl2KCkgZm9yIG1hdGgsIHNvIHRoYXQgMzItYml0IHN5c3RlbXMgd2hpY2gNCiAgIG1pZ2h0
IHVzZSB0aGlzIGluIHRoZSBmdXR1cmUgYXJlIHN1cHBvcnRlZCBzZWFtbGVzc2x5DQogICAgIC0g
SSB0aG91Z2h0IHRoZSBjb21waWxlciB3b3VsZCBkbyBiZXR0ZXIgd2l0aCBvcHRpbWl6aW5nIHRo
ZSBtYXRoDQogICAgICAgKHdpdGggYWxsIHRoZSB2YWx1ZXMgYmVpbmcgY29uc3RhbnRzIGV4Y2Vw
dCBmb3IgdGhlIGN5Y2xlcyB2YWx1ZSkuDQogICAgICAgSG93ZXZlciwgdGVzdGluZyBvbiBkaWZm
ZXJlbnQgcGxhdGZvcm1zIChhbmQgZGlmZmVyZW50IGN5Y2xlcyBLSHogc2V0dGluZ3MpDQogICAg
ICAgaGFzIGdpdmVuIG1peGVkIHJlc3VsdHMuDQogICAgIC0gRXhhbWluYXRpb24gb2YgdGhlIGFz
c2VtYmx5IGNvZGUgcHJvZHVjZWQgc2VlbXMgdG8gaW5kaWNhdGUgdGhhdA0KICAgICAgIHVzaW5n
IG11bF91NjRfdTMyX2RpdigpIGlzIGxpa2VseSB0aGUgYmVzdCBvcHRpb24uDQogICAgIC0gR2l2
ZW4gdGhhdCB0aGlzIGZlYXR1cmUgaXMgbm90IGludGVuZGVkIHRvIGJlIHVzZWQgaW4gcHJvZHVj
dGlvbiBrZXJuZWxzLA0KICAgICAgICBJIGRvbid0IHRoaW5rIHRoYXQgb3B0aW1pemluZyB0aGUg
aW5zdHJ1Y3Rpb24gc2VxdWVuY2UgZm9yIHNvbWV0aGluZyB0aGF0DQogICAgICAgIG9jY3VycyBs
ZXNzIHRoYW4gYSBodW5kcmVkIHRpbWVzIGluIGVhcmx5IGJvb3QgKHRoZSB1cHBlciBib3VuZCBv
biBleGlzdGluZw0KICAgICAgICBibGluZCBzcG90IHByaW50a3MgdGhhdCBJJ3ZlIHNlZW4pIHdp
bGwgbWF0dGVyLCBmb3IgaW5zdHJ1bWVudGF0aW9uIHB1cnBvc2VzLg0KICAgICAgICBUaGUgYW1v
dW50IG9mIGN5Y2xlcyB0aGF0IHByaW50ayB1c2VzIGZvciBtZXNzYWdlIGJ1ZmZlcmluZywgZm9y
bWF0dGluZyBhbmQNCiAgICAgICAgb3V0cHV0IGNvbXBsZXRlbHkgc3dhbXBzIHRoZSBjb3N0IG9m
IHRoZSBjeWNsZXMtdG8tbmFub3NlY29uZHMgY29udmVyc2lvbi4NCiAtIHVzZSBvZiBOU0VDXyBw
cmVmaXggaW5zdGVhZCBvZiBOU18gcHJlZml4DQogLSBhZGRpdGlvbiBvZiBmZW5jZXMgdG8gdGhl
IGFzc2VtYmx5IGZvciByZWFkaW5nIHRoZSBjeWNsZS1jb3VudGVyLg0KICAgIC0gSSBuZWVkIHRv
IGNvbnNpZGVyIHdoZXRoZXIgdGhlc2UgYXJlIG5lZWRlZCBvciBub3QuICBJIGJlbGlldmUgeW91
IHNhaWQgdGhhdA0KICAgICAgeW91IGdvdCBtYW5nbGVkIHZhbHVlcyB3aXRob3V0IHRoZW0uICBD
YW4geW91IGNvbmZpcm0gdGhhdD8NCg0KVGhhbmtzIGFnYWluIGZvciB5b3VyIHByb3Bvc2FscyBh
bmQgZmVlZGJhY2suICBBbmQgdGhhbmtzIGZvciB0ZXN0aW5nIHRoZSBjb2RlIG91dA0KaW4gZGlm
ZmVyZW50IGVudmlyb25tZW50cy4NCiAtLSBUaW0NCg0KUC5TLiBUaG9tYXMgLSBJIGFwcHJlY2lh
dGUgeW91ciBhZGRpdGlvbmFsIGZlZWRiYWNrLCBhbmQgd2lsbCB3b3JrIHRvIGFkZHJlc3MgaXQu
ICBTb3JyeQ0KSSBoYXZlbid0IHJlc3BvbmRlZCBzb29uZXIuDQo=
