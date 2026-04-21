Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5D63D7D8A;
	Tue, 21 Apr 2026 14:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776780598; cv=fail; b=VEV1PrGW4fMBGU1crqmjm5kbSXxixN8ZXGJ28+a9ZwbHGRMrKkGzCxFjFa28NFXioh+MSa2zsfahvAQ85cfnJypK3u6J8UvVALTPc6WkjE0T6WPaAfjRiD64dMNLq45YTI2fzFQzbkGwUv2f4Y+PoqgZezwNeGRv9cQ5uJMSnXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776780598; c=relaxed/simple;
	bh=h6Qf7sxHs7NMHF0Pt56nCk6mO/uiR21LZTP6l64E2V8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nSzd47ffN3rF5NaNxNup3ky9zi4NJaFReCn58gOVyANWfPiQPcfzpthNCnbt2yTHYaHvQ+UpKiZZGQZhGXxaHFDdy3rawLvhR0TI1BeToMz4Fn6mhjWI2cXAwT+W92EyuC3oqEKHgXWVb0Bon24FJcBF6GzNNCmfilutZgLIxOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=AsOXAGYj; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="AsOXAGYj"
Received: from pps.filterd (m0209319.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCdQtc1900030;
	Tue, 21 Apr 2026 14:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=h6Qf7sx
	Hs7NMHF0Pt56nCk6mO/uiR21LZTP6l64E2V8=; b=AsOXAGYjx+0y81aDpXk7hhV
	0jV0/RbQyMunlODzX00G/oqZVHnBfJft6EDmnSyPXBF5N74PHh4gsEN32CQyZGZc
	V850bv+J+Hw93hrMe+ndIh5r45jJWO31Q+rnLF8D9kEMC/URLLAIorSF4/wDx2ux
	sX0twQtAnPqO6eIkJVaPK5qqB8HStUUvO7bRHDUnI4kq5L9XI7Lfwvk1rbp3ASKz
	0yXNuLE2yc4fQGmO3jYpPfDBAzTfWJGH3n5KGew7hyXN3LJeJ/JHaVr5khHFmYk3
	Ksa54nofCDBcUnzux6869gszQYx2/TNfK1bqT66l2fQgTtnFRpVLg5ea71d+KLw=
	=
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010045.outbound.protection.outlook.com [52.101.46.45])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4dm2bjbbvs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 21 Apr 2026 14:07:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ad83k7dzhg9vjBhpE6xLNwetwM06dbvxpGoTPuiNlOJ/PnMHxJITeu8RZxcuhzM6vccCFcyKa71I21vUVmYa4YpyTYWFEh8lKph9HYlYn7ZnWcodFMWIQEbz5zGel5ww8EAisKQ1OTV8ihgNOtmp+s8GfUTBVNynth1FoXzIozDKC3SdS3C9e0sRSfY/B2T8CGqcmoehd366uTxdG901aXEt4DufJVlnH1so2/VFvtXNOFx8NZ6Q5XHJGg+Z9A1hCDhG/WROQsyv28894IlZTkHwkklTKHN0ja5ibow/GIo91UurSL9i3KBaeBd8ubgxpbdpCe0RvMF53aESZNKQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6Qf7sxHs7NMHF0Pt56nCk6mO/uiR21LZTP6l64E2V8=;
 b=W91z4Xhb1FqqTtmZK889oIPLMYedC9VD/03wqPmX4deUm7C0AKkz7xjEIH9WPZ74xuSncPlojoXAnzQRRmv9QtGPlMQYk9PGMZ1fzJhj4FeWQCtbN6JCf7+hvw/ARHzuZGzzaF1+LlLOm4xIYYeTb5WUfxeav4smjG9bZvbELOlah/WNcd/yHedHfN0YxvJ2sMlD4or7jmz772K0j/f+6zWk9K67KWW1IZyglJiCg3W/NeNuz6HZ6VmSB5/70GB0Ckw9KUrNXYKOeOAwU6Hzmgd9wzNX8d4J7MsXNxqBFB17RQ+KV2OP9e4+Fh8g4HXjcRTebKcY2mEWX5R7Sk2Ouw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by BN0PR13MB5248.namprd13.prod.outlook.com (2603:10b6:408:15b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 14:07:36 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%3]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 14:07:35 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Petr Mladek <pmladek@suse.com>
CC: Thomas Gleixner <tglx@kernel.org>,
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
        Brian Masney <bmasney@redhat.com>
Subject: RE: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in early
 boot
Thread-Topic: [PATCH v4 1/1] printk: fix zero-valued printk timestamps in
 early boot
Thread-Index: AQHcySnwCKS9XsxkTEiUYBbigES1DrXfLICAgAPtlICABWGo8IAAxRSAgABZ7mA=
Date: Tue, 21 Apr 2026 14:07:35 +0000
Message-ID:
 <MW5PR13MB5632E5E9176349336E9AD376FD2C2@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20260410203741.997410-1-tim.bird@sony.com>
 <20260410203741.997410-2-tim.bird@sony.com> <87qzohdv6i.ffs@tglx>
 <aeINb8-a83R3QDXd@pathway.suse.cz>
 <MW5PR13MB5632F6F08DB75F7CCBC2AFA1FD2F2@MW5PR13MB5632.namprd13.prod.outlook.com>
 <aec2a2RPO9rYQa0D@pathway.suse.cz>
In-Reply-To: <aec2a2RPO9rYQa0D@pathway.suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|BN0PR13MB5248:EE_
x-ms-office365-filtering-correlation-id: a34b72ae-7b29-44b4-b82a-08de9faf56ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|10070799003|1800799024|376014|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 w7QvD+o52thGG4T9rR9tplClkiEJYMJj+XoQqKz283FyGVclvhrGMEnRN+Zu/caGxgjmBruewq6dCuXS9L74F1JS6dXHtj5VQ779PD8frIJA7ZwWOeNoFcYE+MOLbLgu9hoEjKEny+npklLc8v99WCJmhrmVzKJZSSMiMpDfM9D8wT1PwA/UCSGgt52RfXxm8hnwQgD9I24eWg8ZNEKpoVobbDZT4QgLHsozn/w8ibZGhvM1fmCJ3XCY/4Rg6NNmNwLKL7QJn8eflZ6IlU8tGOkuO4b1hjAOM13qtUS20RjVLuCvVk6yfKzbUdBxQAR+68gRNW+5XwMQoH9DFcXds2d5KpQjqRiKrjdPKDly3zocydXRyBjD2s8z99gofvwx6ARYHfjQZrXzs6JgW48SgCzOXmjpmGUX4jpFJnfSLj1CYCuMQLVVRpsWLujAAW8TYNc64g0Fu6RSjCqTtpi3/wB3GvuS2Jnu7IODnkQExn0LVyp4uDQ0FSCA0zIeHsLGf+V4jZK84G81pcN93bQW2vs8kKCzHmR5C+oFkzTGoSaA7iuL+e//hEst4uo5a6ipMqwOVkeoXsoq1uF/BkesJzK9g3zMbGYAt4zNe9KZQ2WTCjvZgVzjPjJCIFJ4hPy0XWRc4ZWTvsg+vRPLXIvwBzPb3/mHwjv6pnonts71G45/C2XNT6HDRIJ5Bm+JB6Yg0J2hy/NeNgLx2f02HBtBwznLOR953m0oGV6nc4KLp6xdU4w9VayaYinJ1o4QXF1jgxXZ9Yk45COn7qpWdvYlVLcwogYuqknJLIsLQ8HLN6M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(10070799003)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWdxK1kzTVNWNHZVT0F2b3RUaTgzWXpXSVFFci9yUmRyMnh6YW5BaWhIRnZ0?=
 =?utf-8?B?anZWQzczWGhpR0tHRzIwNE5VVmtkVUF0cytMWEJ0bnBIK2lZbnBKR1N5WHBB?=
 =?utf-8?B?cm9aeGxjQ0prYjB4eElscjRaV2xib1dLYy9BSy9XcUpobDlPTk02dFlDKzND?=
 =?utf-8?B?b2VJekxXYWpTNnB5K3lTRm81WVo5aDd0bGgxUnJQemlHY2tqRlhBVTdMQ3hu?=
 =?utf-8?B?N3FRcmwycldObjJhMzF4Tk5nRS9oU09pOU5vaHFrbUFzRHZIS1pJdEFmb1Zo?=
 =?utf-8?B?dUxHb1FrOG1qTlBjODlxdFZjT2tJc1R5UVhHZTZjUWY3enI2dXZWYjNua3Fq?=
 =?utf-8?B?Q0JJeHV3SThPWG4rdlZ6WTkvTi9Sbkc0ZzRWc1I0UDMzdHU0QkdFNDFaTUx0?=
 =?utf-8?B?QXh2TVpHMloyaUEzclRjeUx4ZEJMMjZoaXVoVmljZjhpcTRSaWRhN204S2xJ?=
 =?utf-8?B?YXBTWFNGNkxJTjNyc1lFTEVyaWJzaGlrdXcvdHVlUHZVdWdSMHhHWXo1T2cv?=
 =?utf-8?B?dUtEY3dLN21tbENyVW81QzI5OFVJcjBtakhFd1FFbnNCMTVGaDVpbE9hOWNK?=
 =?utf-8?B?aEFCS0NVb1JrNG0xeVlsVW9Dc0R3L2lDWmxHSG41YzR2alhtdTU0aHBlcmtO?=
 =?utf-8?B?Zyt1d1dkNWY2Zm1sK1ZIbm1LbDArUXl3RGdjd3ZyakJLOTVZdW1JMzgySzcz?=
 =?utf-8?B?U0J1MHo4MUpFQUt1QUJHdC9FZFE3NUdtbFdRd3phL1BBdnRzVjV2UXVGZVN0?=
 =?utf-8?B?OEhKczlJc0xmSzFMcWczbUtpWDY2WjBRbkV1dWdWM3FLeWlFZWR2azFlZG14?=
 =?utf-8?B?c1lpZm5Ua3BZMTFuMjRGUXNMZ2RVR0E0a1EwUWVuRkJhN0lEYUU0MTRyakNW?=
 =?utf-8?B?T2VJbEtkT0p3YWgrUXVaNWJCeGxBKzRISG9nRUJ1QlhBYUlUb1p1UE9MRmhT?=
 =?utf-8?B?NzBxMHdlVTJyQjlVa3FmRncwN2hPVUs0TGxRWVYwSXducjM3S2xCOHc4Um9x?=
 =?utf-8?B?dWdCWTJFRUZuSWlrNGw2V0hqU0Z4b0Q3SlVud290MGp2MVcremJEYXVYaHdu?=
 =?utf-8?B?aGFYTWphTUU4ME5nZDRrYVlCU3llR2dRVmY4dHlvUnNocWovNTYxRXUxekRP?=
 =?utf-8?B?dW8wZWJJdUJ4WUZ1Zkh4ellkV1FIVVhYc2xMRnNWM1hnYS8yZ20vTXBSakZk?=
 =?utf-8?B?NTRtQ2daeVk4UVZaRlV6TmRmRmo0TmtwcFdBRnNERjMzTnFWaTZyRVVZQnQ1?=
 =?utf-8?B?Y0ZwY25GK01teDdWL3FBMTFUWHVwRVlFWjRzR1RWRkJZaU9QUTZhWWtSS0Jj?=
 =?utf-8?B?eVhOUndTYVdnSkllRnVxNTdURVFwWFZlZi9UdjZXKzFVMlVjTVExR2NCZ3hZ?=
 =?utf-8?B?SFlWOFpTY0RlZlYwTTBMR09yRmp5UEpNdjZQY2VLTEptSXViQlNWbWRJQlB6?=
 =?utf-8?B?N3FaaFh4TlBvbkJZUkFMWHlGblorYkUxM1hWZ2RaajlaVWNXQkNJRXRJMjJP?=
 =?utf-8?B?eW9jOERhRG1TaVN1anZhZG1sY0Y3dmtCQ0hHcjlQZnB0dk1weWtwTkREK3B4?=
 =?utf-8?B?cHdnRWNZcnlrWU5BWWxCczIzVDRmT0hmcTZhblBsNk9NbEVjckp4RlQwbDk5?=
 =?utf-8?B?VGZ3cTU3TGZWS0VaUGQ0bTloNHIweWtVY0thNExVdGdkMHBSZlMzS2ljTGVw?=
 =?utf-8?B?TUJWT25xOU9kak5vUW0vMlBNblB4ZDZ6U3dIdFJxVGJLaXRYSlE3aTBwWENX?=
 =?utf-8?B?MmRNWllLRGkwRTYwMzVma3ZNeEpJRDNsem5MZDJsQnlIRzFYMVZtUTljem1B?=
 =?utf-8?B?MURCRFJUajhKbW1JZFFBOUhLNVJEdWxJY2pwcUNhSVo1L3JMUFZYSGlGalh5?=
 =?utf-8?B?STNsU3dvZG05OE5VenRIZzZ4TUxPMDdpVEI2OHpoT2ZSQmpvZ2hzK1FjUE5r?=
 =?utf-8?B?a0l5M0xWeFVoaWljSmN4MUVGcHFKQVlIbzR0TGJxOG1JempDTlQ2SmxTZEJS?=
 =?utf-8?B?NHZNVjNFMTZGUmVaOTdIQTE3QnlZR0RHTEdaTlYxZXRwSEF2Z1lmeUpqU1Bn?=
 =?utf-8?B?aXhBMitOeVhIK2thYmYzakdjU1lwRUFCR0wvL1dWMlk3a3lpVHZwcDgxbFFy?=
 =?utf-8?B?WjhIZkZIcmhyWWJuQUw5dFlBbHlDTDF2TlJ1Z0EzTzJKRm9Ga3Z2d3dyeWlj?=
 =?utf-8?B?Uk4rS2NmVEJrWVJidG40RXN0WmNyZnZ2UHdCRWxmNElwOSt1MXNUSGNBaCtp?=
 =?utf-8?B?WitzL1JYV3FMZDlqV1gzZGVWdDE3cStHQVg5dU1hdHhUWXBkMmZoYVBqZnY5?=
 =?utf-8?B?K1YyVUtXelVHVThJVFZ4YUt0UFVUa24ySVZudUVEb3N6T3FoZzBEQmJrZ2Vn?=
 =?utf-8?Q?bShYdyfQ0JeqW289ayXOoOPOrOLFP7jjOHsMH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	ZM78Ko795vDVYgr2eq7/Yv9N8Hpfj5jQcvKNJ/UCjJIlYCB5FRyIQpLUaI9199d1pAyuGd1KB6mGxUmiAfRr2pQAoPkLjQ1ssBFCqVGIAAWaaG9RTzd/E5ENLkb+JT70fclgcROwj6tQTtlXc7NDnQkIDDjealinuiCyK80w57vCv1Lhl15XF2UpBBa9kSvLAwAR5PaWk6KUiksXracqCT0IYlOHwHLkkgYHk4/1g9gBwUjLFDW+e7qUHw1TRP1dpyCUjEzp8eqf/jOjQg/YBGGy+X9r0d4eSYNiwUrfY39Fiz78R4dDV9WQxIO4xVRuLyO/ilqmCzUnMfQEkhWutA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oBRm7/v5pOBvmNoZAT3Hg0WSMw0Jc+PerOw8AMAPwvgDTZuTae++m4kFySXsAcSFN9jaguWNetaq2fS0xsRTrM3xJqtjIbLD7ami9V24t2XUZR0yU5NP0bZetsP1vpmbdLZGyqiMvzT0jL0IqGqRFfScuhlOwlTk+oCRDyl+80VIhDCYvpyFct1cLmvECF9HW3/wDinVcub/+lFa5U8e/PUGWjkjYlutFdSM1+1nTwvNFCfvmjxKpy1AXvc9btZHBjgXfpVfbS1z3Kbb3cRYwsxcIHlAZmsGG7WzWq9H2EMEyNWcZ4F7wS7cxLxYWeNNaU8YFS1YPv3vkwHNmdBB0gpDV4ZTVsiXwOzhnSq563We86W4uL2lgl3M9RNWiZktJzfsog5L2dB9rJy9/PXPlwkSu4BvX1eELUtcZHXxa2Zyp5s76ohmwW+knlMdjMGT4DomIYDosxsSB0g71pVkBobdCVJxPl2CBBD+nKRuhZbJfNkODNtWZ8QHxQK5ySWEf0PFlhPYF3gSJPdJJAQ4eUnGCUvswPf+Xq3tMuEJUwZYvT9VA/5tVxYdIzpbyvL3BTBdiaBCN80T8CdUV0oYQE2QBg9qyOkZ2vKT83B5Umt+PlTv7q9aYVGkN9HAx0Ij
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a34b72ae-7b29-44b4-b82a-08de9faf56ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 14:07:35.5374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RnjReb4EhxIA9KCT680KkV6gGfNkcUK4E9POhIXddm4+Rmp6frFzp/sH0SfAeAw+PjPyWPiieGR2ry8tPpb1Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR13MB5248
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE0MSBTYWx0ZWRfXzd9VgDUhGl2F
 azZM2tmeyfG86ZACvC75yQ4OIdP4vmHGf/en7uF7ZAPttLKIqjhmx+npqCzaAVPh5HKzw54Nhui
 4kNaWFJLNOJnc1VkT9xcIzCwtsN5gA/YiLkSDlSVEU9ErSq+Tye76gtUSGU5XzwjRBChNCBZrl7
 BJlhkZ4pVmsxgps9qCUHIoSh2O+lX1ABSC5LTAlFIoi6MA1Bl5q1HvR+wthvRE+J7seULM7oblw
 7JL0J0xEruIT7tzDEIsFk539JveDtOtJ5mflJkiXX4FxXPrB6WuJk4h/v3zfSiLeID5H1+QCGzC
 O9jEEzZI/XvFIws+0T/c5yVJDQ7cZ0fV5EeDF/Z07QG+Y4mhlHkUdeaKRavEU1LeU6NK72LdUpn
 PynvqkUa2tomZqPkCDP10BLW37N7197yvFVqIpyU4aYpUDx/5qGVvpf7XIYB/YIPa+gpNoItPo9
 x13gbpbM1KCywmAmVGA==
X-Authority-Analysis: v=2.4 cv=DqdmPm/+ c=1 sm=1 tr=0 ts=69e784b0 cx=c_pps
 a=lEAAG6kgDLZw1ps4cEx4qA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=6Vn1QVPt8UGdu3r8PAnt:22 a=iox4zFpeAAAA:8
 a=cOwyw8SJ0nTT0GaXNAUA:9 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: -2Q8sWpKlaWUSL3rQ0NvV-9DLh6ICQA-
X-Proofpoint-ORIG-GUID: -2Q8sWpKlaWUSL3rQ0NvV-9DLh6ICQA-
X-Sony-Outbound-GUID: -2Q8sWpKlaWUSL3rQ0NvV-9DLh6ICQA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-21_02,2025-10-01_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ciBNbGFkZWsgPHBt
bGFkZWtAc3VzZS5jb20+DQo+IE9uIE1vbiAyMDI2LTA0LTIwIDIyOjE4OjI5LCBCaXJkLCBUaW0g
d3JvdGU6DQo+ID4gPiBGcm9tOiBQZXRyIE1sYWRlayA8cG1sYWRla0BzdXNlLmNvbT4NCj4gPiA+
ICAgIDIuIFRoZSBlYXJseSB0aW1lc3RhbXBzIHByb3ZpZGVkIGJ5IHRoZSBib2dvIGN5Y2xlcw0K
PiA+ID4gICAgICAgYXJlIG5vdCBzeW5jaHJvbml6ZWQgd2l0aCB0aW1lc3RhbXBzIGZyb20NCj4g
PiA+ICAgICAgIHRoZSBwcm9wZXIgdGltZSBrZWVwaW5nLg0KPiA+ID4NCj4gPiA+ICAgICAgIFdv
dWxkIGl0IGhlbHAgdG8gcHJpbnQgYSBkaXNjbGFpbWVyLCBzaW1pbGFyIHRvLA0KPiA+ID4gICAg
ICAgZm9yIGV4YW1wbGUsIHRyYWNlX3ByaW50aygpIGZpcnN0IHVzZT8NCj4gPiA+ICAgICAgIFNv
bWV0aGluZyBsaWtlOg0KPiA+ID4NCj4gPiA+IFsgICAgMC4wMDI5MTJdICoqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4gPiA+IFsgICAg
MC4wMDI5MTddICoqKiogICBOT1RJQ0UgTk9USUNFIE5PVElDRSBOT1RJQ0UgTk9USUNFIE5PVElD
RSBOT1RJQ0UNCj4gPiA+IFsgICAgMC4wMDI5MjFdICoqDQo+ID4gPiBbICAgIDAuMDAyOTM1XSAq
KiBVc2luZyBCT0dPIGVhcmx5IHRpbWVzdGFtcHMNCj4gPiA+IFsgICAgMC4wMDI5MzldICoqDQo+
ID4gPiBbICAgIDAuMDAyOTQzXSAqKiBUaGV5IGFyZSBub3QgcHJvcGVybHkgY2FsaWJyYXRlZCBh
bmQgbWlnaHQgdXNlIGEgc291cmNlDQo+ID4gPiBbICAgIDAuMDAyOTQ5XSAqKiB3aXRoIGFuIHVu
c3RhYmxlIGZyZXF1ZW5jeS4NCj4gPiA+IFsgICAgMC4wMDI5NTNdICoqDQo+ID4gPiBbICAgIDAu
MDAyOTU3XSAqKiBUaGV5IGFyZSBub3QgY29tcGFyYWJsZSB3aXRoIHRpbWVzdGFtcHMgYWZ0ZXIN
Cj4gPiA+IFsgICAgMC4wMDI5NjFdICoqIHRoZSB0aW1la2VlcGluZyBpcyBpbml0aWFsaXplZC4N
Cj4gPiA+IFsgICAgMC4wMDI5NjZdICoqDQo+ID4gPiBbICAgIDAuMDAyOTY4XSAqKioqICAgTk9U
SUNFIE5PVElDRSBOT1RJQ0UgTk9USUNFIE5PVElDRSBOT1RJQ0UgTk9USUNFDQo+ID4gPiBbICAg
IDAuMDAyOTcxXSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqDQo+ID4NCj4gPiBUaGF0J3MgYSBiaXQgbG9uZywgYnV0IEkgdGhpbmsgYSB3YXJu
aW5nIGxpa2UgdGhpcyBpcyB1c2VmdWwuDQo+IA0KPiBZZWFoLCBmZWVsIGZyZWUgdG8gbWFrZSBp
dCBzaG9ydGVyLiBJIGp1c3Qgd2FudGVkIHRvIGV4cGxhaW4gd2hhdCBpcw0KPiBnb2luZyBvbiBh
bmQgd2hhdCBpcyB0aGUgZWZmZWN0Lg0KPiANCj4gPiA+IFsgICAgMC4wMDI5NzVdIEJvb3Rpbmcg
TGludXggb24gcGh5c2ljYWwgQ1BVIDB4MDAwMDAwMDAwMCBbMHg0MTBmZDA4M10NCj4gPiA+IFsg
ICAgMC4wMDI5OThdIExpbnV4IHZlcnNpb24gNy4wLjAtcmM2LXY4KyAodGJpcmRAdGltZGVzaykg
KGFhcmNoNjQtbGludXgtZ251LWdjYyAoVWJ1bnR1IDEzLjMuMC02dWJ1bnR1Mn4yNC4wNCkgMTMu
My4wLCBHTlUgbGQgKEdOVQ0KPiA+ID4gQmludXRpbHMgZm9yIFVidW50dSkgMi40MikgIzIwIFNN
UCBQUkVFTVBUIEZyaSBBcHIgMTAgMTE6NTc6NDggTURUIDIwMjYNCj4gPiA+IFsgICAgMC4wMDMw
MDJdIEtBU0xSIGVuYWJsZWQNCj4gPiA+IFsgICAgMC4wMDMzMzhdIHJhbmRvbTogY3JuZyBpbml0
IGRvbmUNCj4gPiA+IFsgICAgMC4wMDM4NjZdIE1hY2hpbmUgbW9kZWw6IFJhc3BiZXJyeSBQaSA0
IE1vZGVsIEIgUmV2IDEuNQ0KPiA+ID4gWyAgICAwLjAwNDQ5NV0gZWZpOiBVRUZJIG5vdCBmb3Vu
ZC4NCj4gPiA+IC4uLg0KPiA+ID4gWyAgICAwLjE4MzU1Ml0gUm9vdCBJUlEgaGFuZGxlcjogZ2lj
X2hhbmRsZV9pcnENCj4gPiA+IFsgICAgMC4xODM1NjFdIEdJQzogVXNpbmcgc3BsaXQgRU9JL0Rl
YWN0aXZhdGUgbW9kZQ0KPiA+ID4gWyAgICAwLjE4MzY5OV0gcmN1OiBzcmN1X2luaXQ6IFNldHRp
bmcgc3JjdV9zdHJ1Y3Qgc2l6ZXMgYmFzZWQgb24gY29udGVudGlvbi4NCj4gPiA+IFsgICAgMC4x
ODM5NThdIGNsb2Nrc291cmNlOiBhcmNoX3N5c19jb3VudGVyOiBtYXNrOiAweGZmZmZmZmZmZmZm
ZmZmIG1heF9jeWNsZXM6IDB4Yzc0M2NlMzQ2LCBtYXhfaWRsZV9uczogNDQwNzk1MjAzMTIzIG5z
DQo+ID4gPiBbICAgIDAuMTgzOTUyXSBhcmNoX3RpbWVyOiBjcDE1IHRpbWVyIHJ1bm5pbmcgYXQg
NTQuMDBNSHogKHBoeXMpLg0KPiA+ID4gWyAgICAwLjE4Mzk1N10gKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPiA+ID4gWyAgICAwLjE4
Mzk2Ml0gKioqKiAgIE5PVElDRSBOT1RJQ0UgTk9USUNFIE5PVElDRSBOT1RJQ0UgTk9USUNFIE5P
VElDRQ0KPiA+ID4gWyAgICAwLjE4Mzk2N10gKioNCj4gPiA+IFsgICAgMC4xODM5NzFdICoqIEVu
ZCBvZiBCT0dPIGVhcmx5IHRpbWVzdGFtcHMNCj4gPiA+IFsgICAgMC4xODM5NzZdICoqDQo+ID4g
PiBbICAgIDAuMTgzOTgyXSAqKioqICAgTk9USUNFIE5PVElDRSBOT1RJQ0UgTk9USUNFIE5PVElD
RSBOT1RJQ0UgTk9USUNFDQo+ID4gPiBbICAgIDAuMTgzOTg5XSAqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+ID4NCj4gPiBJIGFjdHVh
bGx5IHdvcmtlZCBvbiBhIG5vdGljZSBsaWtlIHRoaXMsIHRvIGJyaWRnZS9leHBsYWluIHRoZSB0
cmFuc2l0aW9uIChmb3IgaHVtYW5zKS4gIEJ1dCBpdCB0dXJuZWQNCj4gPiBvdXQgdGhhdCBkaWZm
ZXJlbnQgcGxhdGZvcm1zIGluaXRpYWxpemVkIHRoZWlyIGNsb2NrcyBkaWZmZXJlbnRseSBlbm91
Z2ggdGhhdCBpdCB3b3VsZCBoYXZlDQo+ID4gcmVxdWlyZWQgcHV0dGluZyB0aGUgbm90aWNlIGlu
IGRpZmZlcmVudCBwbGFjZXMsIHdoaWNoIHdvdWxkIGhhdmUgcmVxdWlyZWQgYXJjaGl0ZWN0dXJl
LXNwZWNpZmljDQo+ID4gI2lmZGVmcyBpbiBnZW5lcmljIGNvZGUgKHNvIEkgZGlkbid0IGRvIGl0
KS4NCj4gDQo+IEkgdGhpbmsgdGhhdCB3ZSBjb3VsZCBwcmludCBib3RoIG5vdGljZXMgZnJvbSB0
aGUgcHJpbnRrKCkgY29kZToNCj4gDQo+ICArIDFzdCBvbmUgYmVmb3JlIHRoZSB2ZXJ5IGZpcnN0
IG1lc3NhZ2UNCj4gICsgMm5kIG9uZSBiZWZvcmUgdGhlIGZpcnN0IG1lc3NhZ2Ugd2l0aCBhIHBy
b3BlciB0aW1lc3RhbXAgZnJvbQ0KPiAgICB0aGUgbG9jYWxfY2xvY2soKS4NCg0KWWVzLiAgVGhh
dCdzIGEgZ29vZCBzb2x1dGlvbi4gIEkgZmVlbCBhIGJpdCBkdW1iIGZvciBub3QgaGF2aW5nIHRo
b3VnaHQgb2YgaXQuIDotKQ0KDQpJJ2xsIHBsYW4gdG8gYWRkIHRoaXMgdG8gYSBWNSBwYXRjaC4g
IEknZCBsaWtlIHRvIHdhaXQgYSBiaXQgbG9uZ2VyIHRvIHN1Ym1pdA0KYSBWNSBwYXRjaCwgdG8g
bGV0IHRoZSBkdXN0IHNldHRsZSBvbiBkaXNjdXNzaW9uIGZyb20geW91ciBwb3N0Lg0KSWYgVGhv
bWFzIHN0aWxsIG9iamVjdHMsIHRoZW4gSSdsbCBmb2N1cyBvbiBhZGp1c3RpbmcgdGhlIHBhdGNo
IGZvciBvdXQtb2YtdHJlZQ0KbWFpbnRlbmFuY2UuDQoNCkFzIGFuIGFzaWRlLCBoYXZpbmcgYSBj
b3VwbGUgb2YgcHJpbnRrcyBzdWJtaXR0ZWQgaW4gcXVpY2sgc3VjY2Vzc2lvbiBlYXJseSBvbg0K
aXMgYWN0dWFsbHkgaGVscGZ1bCB0byBnZXQgYSBzZW5zZSBvZiB0aW1lIHRoYXQgZWFjaCBwcmlu
dGsgdGFrZXMuDQoNClRoYW5rcywNCiAtLSBUaW0NCg0KDQo=
