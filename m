Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E214037C937;
	Fri, 27 Mar 2026 18:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774637370; cv=fail; b=RhtgjcBLb8PDjHg8TrWh7TCOMmhsLN/5FvUt1/eert77FAnDDLA6kLhXuTMsLGBHSPiPIsCrIE3AVJrQBrHqnGGe4cPZQGh7CwLrO9Si7PbAxJGe2bMlZTs6soBLWgigQkrP+lkcxsQAH+CA1ZIHDVklT/NfUO5yCBlwp/S86Ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774637370; c=relaxed/simple;
	bh=4D1WfR110Y830cxxGQmWgczRvHpwL67TnEmhQ8+Ql4s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hoJ4S32BGfYCENJpyPFdE/xmfjlCpHcNJEHjR36kPXSywK15GUY0MxdbLtBKxXGXCY0+j1FkTSt3Y/2XvOnrQ05W6Nx77wxtVHGxKDdY1UjQvNoRK1mbeBOpo2NtK6bl/NNUi+cO0qdX8RTjBpoPLGVCflpdZVSQWdE7qu38JMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=Axt+xJ8+; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="Axt+xJ8+"
Received: from pps.filterd (m0209320.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RIgBc6380451;
	Fri, 27 Mar 2026 18:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=4D1WfR1
	10Y830cxxGQmWgczRvHpwL67TnEmhQ8+Ql4s=; b=Axt+xJ8+it5IzkpB7Ti/VBJ
	zU3TWEm7Pf+R0/qoBINEKP/NgamylsejDu/mhPEsk88ueKtwTqYk7aZm2iWFLK4b
	9oSGuU14bZqtdHzgX1GEfuXcWpjhZ5hMG3g9UPDh5HND4ts8HNIbip5d6TvFl9ms
	z6hhHYBtOq5kpLyO1mOeiCYPnYB5vxZLwELwGmdU8T6d8lAMNVA8fpXcHXjFbdRJ
	tY+xB8r2e5UFO1bfHVMz2qbpxWJYUdA1WSjzHqYbDlkJLm9XhfEvgaYFoXP9F8FV
	ckX8g5NUPX3VkbqaMhkAazPhsOhzO9fIn8GIWlOTB3y5z1jSmeherrw01wv0AvA=
	=
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011001.outbound.protection.outlook.com [52.101.52.1])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4d1kk77uvr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 27 Mar 2026 18:49:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsABnyLec6ta1nc8da1wXARGx7R6yRd2frGYRDXEmj0ZsbyOpfeYqOgQ26DMtLOiYB/wpcJjeOrqhpqthKp+hAoQF9O/82CamY/y7/KdlRR4daVSuhFDjX0Am+jyMcW8aYdpxHv4woANzsBBHXmAweTxNeKhAeQtTjkhiG20K9iihRNsqMEjqYe4mgFuArnvPi6YgsYHN572kwcb/rTbOCPKKkzwQXpi7wXliOXZI4JJykK0VpkyVLSXVyYkhh7vmwujMZpgeJMc1Vjmz9PmgnlUsbaq6DMo8G3iv3DUsBqoP/TK0OW5wTNqKQUJnHBoXZQP3AxbVzIN+GbiHVu24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4D1WfR110Y830cxxGQmWgczRvHpwL67TnEmhQ8+Ql4s=;
 b=wK+pqRzLDmeHjJW676zBvPEf20b0wXWhlVCILtFYftW/Dd8989IyCd7bmTYtSzMFmvgle8uWHyJ0TQuyzOiaZEXjWi2xa3s41/o7qTpMP5280AHX6faO1H6VJpF745o5z+dGXwhi/eHKedjED4KilkJ/ewyVf93xhA9ipPOZlvGmOS5CevhVQlGvep3bdB6TlzbE6P+6Qw9K9PR2MVpPVNN/py2r6pKIou9qogYkR2raMa/ytPJkrPFVwswXzs7O9RV6Z5ssTjxP67gsujoHQTdpJxZiZMEOzT9tcSmSElUy0xLiqX2drhPzB7mfSmnv0GCrh10aR55G6LEijAMNqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by MN2PR13MB3647.namprd13.prod.outlook.com (2603:10b6:208:1ef::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 18:49:00 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%5]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 18:48:59 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Thomas Gleixner <tglx@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "senozhatsky@chromium.org"
	<senozhatsky@chromium.org>,
        Shashank Balaji <shashankbalaji02@gmail.com>,
        "john.ogness@linutronix.de" <john.ogness@linutronix.de>
CC: "francesco@valla.it" <francesco@valla.it>,
        "geert@linux-m68k.org"
	<geert@linux-m68k.org>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Thread-Topic: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Thread-Index: AQHcmuexSh6ktdFaZUimYV7dOjz0LrXBD9gAgAHiyyA=
Date: Fri, 27 Mar 2026 18:48:59 +0000
Message-ID:
 <MW5PR13MB5632FC91EE0EF8754331400DFD57A@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com> <87zf3ud92r.ffs@tglx>
In-Reply-To: <87zf3ud92r.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|MN2PR13MB3647:EE_
x-ms-office365-filtering-correlation-id: f7418855-55cc-48b6-61a7-08de8c31821e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 5f9ll40ZQJvulUt1UXIx2PTcpTgAflEJEYMyAGi6ldZE8y+0GSSu1O6stK+5KoKdmrbkOrKz2MA3ocDaQahoYhKnDGl7Z6r/H5dYoIp4lzwyzVETgOVONi5o67QIXgYSVJ/p/b939+Fp0Aaa2oPeJbS90iNDwt39tEd8l5uRpSWHPhXrZ3IRZwaCcynM/xHF/8Y9MkaasHm1OZsGKvFUXwzgj+SCK+c06DkyKK/eOIM0jkY2K/xRS0UA/92s0ps3BP88OpOOwmUOg7cqG5X3Qxso5ENnvJTOsngdiRKp8xVoT1E6ckaJ37o28cbpndsJmO9FbkNw3HxeJCHu3hotu8E5bA6ktlwGBFQ0yWgz1IMWIwQ+WQE740pT86t6b0Sti92UaSjTycQekVm8h+TgsrWC6d6utrxBCn/BW4HKu9yeeNg1TliOwfxr+Ho2tSGhMrLzzhdg3qoQpCuTu7tGqczEXuWx5bwmCpRTtluRAqVrnQh4hi2GFzaAYcRgJ9uFZsYlOAebir81zIeVcAKibKMW3j9zNk7Yeav1RCnkvz+46Fo9Uv59pMUarBI22ZlRl8S5SoRpUOTtThVBm0ZEopu0XZLe1RchjjI7o/9oodCeKtHteTSu6Nv8ygUUvUabhOGvNcPJH7E/yV1ZUSWp9FTPq5wIonlg5+p6TOxMrtGkNysIIXXvFfs8wIzNsXWPxNC00J89t8uLeH6xW0+5ZHqi6kLFocF4TNhnVr0gVjEuOPf1xmdYy9c4Oi4i8i+g
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXp1RC9sYUFTWkN3bUtFWXZSWmhUVk8xMjdnc1R6Wi9SZmtxTzV1eEpKbGdy?=
 =?utf-8?B?RDAwWXRoM2d0RWUxRk4yNTlmK1l4YVRzVy9EL1FvWXFsQmMzcGhsM25ETFFj?=
 =?utf-8?B?U29wWTdWOU1OYmk2UTBzSEVWTW1DZ2tOb0l4emdYd3dRNjhBamVQY3huNmND?=
 =?utf-8?B?YTZpOE9XeXlXMVNYYW55c1d6MVZPWER3bTVWV1FiQmlyWDNuOEZnYzBTM0l1?=
 =?utf-8?B?WUNxWk9iY0h4Q1BDcFduNlY5ak0yeDM1WUJ5RVRmQktxcTMxd1ZVby9RRkJz?=
 =?utf-8?B?ajZQNnpFOVF1WGFIazZlczRseHVqN3ZHUWk2Zk4yWWFiVHBLajB6RS8waTYw?=
 =?utf-8?B?N2pob1NhQWNzTGtwQmZCTzR6Y1EzTjBBbHFqVFJkcDNCdmQ4cW5BS0x2Z25D?=
 =?utf-8?B?VW02OE82SWlyYlppaC9Mejdhd2hLdzMzcjlRZzdwV1g5M0N5bW5kVDN4ak1R?=
 =?utf-8?B?ZEJKcnFHR3ZSUTVacUZGbDRacFBEQXRtMU9yTExITzE4VkFWVDg4THNFTkNB?=
 =?utf-8?B?RXI1eVdVT3l2SWg0WkNCRlpTYUw1SUtDMXdkZHlkWlVSYVRTb3ZzYVdDbitI?=
 =?utf-8?B?Q3NZMzFDRExKMXRhV0Q1Q2pYYzBLVTJ0eVNaMnlnMUUvc2NPNGNWWTlPTUtU?=
 =?utf-8?B?OWxScXpUaTBZc1dMOUtDZFpqcCtWRks3YllVTFVDbG9aU2xBNWd0V2d5cWxO?=
 =?utf-8?B?WXlMdGJ5MTdxc1FsYlNIZjArbjVmNE0zQlNQQ29DNndJK0JXcGNTVnB2bCs3?=
 =?utf-8?B?a3JianBzMFkvamxzOTdDZ2Rxbkt6dll2Y1N2M21FSzlmOEc5WUlKUkFZaGNC?=
 =?utf-8?B?bjF3ZEFORFp0c3BReUVLb1Ryc1phQTk5MW1wcDhUa0NmYzBMRS9JQ2FIbDEz?=
 =?utf-8?B?VkFoVEZnTGpNQVNVWEdXREhOMHNJQlZxbDJhTXczM0NZMTFPeExMN1hPTElM?=
 =?utf-8?B?aU9icjZMRnhzYkhSZDJLY0N6YllseTdWbit5eGp4eHBUamNOb2d3R1ZQeDZq?=
 =?utf-8?B?OXM0SVYwWUJpNzRtMnphZXFRdHNUYVIzb1FoYXhtd0NrS2pUcklrNlByaDVt?=
 =?utf-8?B?bnErT0t0azk5OEEzWHg4bk8vaWtKSk9sVGFWbkMrelVlbEgzVWJlOCs4QVhX?=
 =?utf-8?B?YkVKTlBHQmgxc0VDU2hwSUJuMjVzOU1MMWlVMklSWlFyQU5yVWsrenVXS1V5?=
 =?utf-8?B?KzlWWmFKOUNrdyt0dWM4QmczK3QyeEN1YmlDVnR3c0FHN2pmam1yMEQ2b0Nh?=
 =?utf-8?B?a1FxRm5TcUxMV1lKb0hvY2RmMXZieFNQY2VNYStrUjlTbEZBVXZ4NWNjdEF5?=
 =?utf-8?B?R09XSWxKOFVXUUdrUksxWSttZDlWeUpjbm1vZE9xSGxXbXJrV1grK1J3RjJ4?=
 =?utf-8?B?L0FKZjVueGo1QXFBYnlLT3NUcXVXeGtIWGdRNndWZlM4SkEraCtMT0NkWlgw?=
 =?utf-8?B?VUJ4Y01PcWFEcXdpSTc0cjlZV0E1ZXA2OVhlV294d1M3em0rd2NhSURHcHF2?=
 =?utf-8?B?MFJrZ0RLaUZmRE1FWGRxWE1lSG5ZSmdIbjNZUTNHbm1yTVFBZmlNQ2ozZ1Rp?=
 =?utf-8?B?dW8wcjgxQWtaNUpVVHJLa0pVSmc0VW5oeC9ZemVHUDJxSVpLWk55WHA2b01L?=
 =?utf-8?B?alNtcXFuajg4UlQxT2t3anFHcElxUDJ5dmlOUjJTSzR4Ulg5b05OMWkxaUVr?=
 =?utf-8?B?eStScnFFNTRRY1Z3bmRWZG9NeTlwVHhmUFJPaDdQWlUydVVqc1VObVFzRXlF?=
 =?utf-8?B?VkR6Szk3Zis4UmpoRjMyYjFrRlFCb2RMeHJBR2J0SXh1OHNyUzlYYzB3emU4?=
 =?utf-8?B?cDdhQld2dnZVRUVramEyUzI5YWY2M05MSm5GMDBwZ0VWS1dZME9ZVndsTjlp?=
 =?utf-8?B?SUdsYXVsZDNRZTZpc2tXOEhzRDExVStKQlRRU0NKdnpYck1vZU5HbmQxQmRm?=
 =?utf-8?B?Z1BDZ1pwZ3hWcFREY09uZjFkVTFkcTBSN3BFU2NUK0N0UW1nakhNMUswVUNK?=
 =?utf-8?B?SjRySkhpNTRGL25URGNRNE9QdkNlYmZjenA5TVhOaHZYb2xEWXFaNElvZXRF?=
 =?utf-8?B?bGxzZCsxRDZWdWxCSWNZbnZGKzFRMUY5ejN1NTErRHQ2WDkvRTZnb2xpOXVw?=
 =?utf-8?B?R0lCRHdGTkh4SHQ5d2JnRkN3NWtmVmJEb1ZuV2NZWUU5dlQxKzVyNzFOdGx3?=
 =?utf-8?B?YVJ2cW90ZzUwR1VlQTlZTlZlQTVQRFlQMEF2NHI3ZGU4dTdHeG15cGkvUk42?=
 =?utf-8?B?OGZZT3JWQ3N5RTl1c04wYUJ1N2wzU20yNGZRbWhXdXJjYWJRNnVlYytSajVt?=
 =?utf-8?Q?jVftKGClrF5J99AsyK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	P70ZNWz12WzkosPsG+72N659iHuwvUM6KAIA6+xeBY8r7Yc13CdWstEJaCpaylmoaP/GyP2JM+3ZpRavfenW0rk5nyaGEtQIPpfGRpqJPvan3UQsDnHxr0jrMz+Q3I+BEy5wAt8fjlyhv6OxhUNtAKbQvrTR9iHQCfRW6pixHgnlh5dBgNklzRPLkf0Ng51iUKf4mguJbUL52AS7Fs0pF5PczTk5ih/G0FRulgTHC49PGrBNWIy+a11LsSMZYec+SQMKCYSw9qUuxdVuVqWf5am/8jfQt4viOCbX6ZpdeXZIeTQ30usl3fgSAHJ1y8l1hRJl4EZz4Ve0g/Lm4yIuXQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fd+HxkJVEGTwLaD+m/KiL+YO7Q/uqIfl54BFlVFv7w0bpxy2VfOQ5YISWG4Fso6qt70uqG9en9YZ6A8G1phsNWRGkahhaEqsZMisEyi5A1JURcGwhiwVcpDaeyOAs3XEhuCkip9T8bQgCORyXSXFkNtzVr5Hbl/FjhHHQT89JzkZzJYBj7iK71V4S5IHsBxxXfj1NUP+gDmeOs18uRy1CL1hm1YivzAVrpqDCFkDPl9W74gFgy3+OgsEypWgeJ4hZVybTxznaN/MzwsfsDDnSACU+G0oULh0YnL8yOWYngvdB8Lz6z8OPbsB2RfSxs0S9aCRZa85h4Zl+hP5iauAeWVVe1gQ35fu1ZcBS5FVDyjbY97mh63pUfGMYzWQ2FVq+kkU8YF9gk5bjRLNWHcN084KJYIOyX2spSiIR+Lu7lDTamtmGHkqInmcDIx7dPBlK36uowT17zwuLZJvTmac0MvHXvide9tqmpJ4ZAkhVwYedOOVjQaylDMHtB+khLJzsFSW201z8t75dReu9ZA6ZvpGEcGEF7J3Wga16ve+26htGwOqyKnoMubOYN6i6zKiuBGIpPJcS78cMTUgf8Cv63TQeZ1WtA+vD8MNtH8Wsr1J3BLohfxjocklIUMAlukH
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7418855-55cc-48b6-61a7-08de8c31821e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 18:48:59.7292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q33dUXAR0ZkmJC6iLWatio5TnEyYk+AxC0cLxU6XWQCE4ktqnH4vPWT6MrxCBufLIBGZkQ40ez/4zOrpv02wmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3647
X-Authority-Analysis: v=2.4 cv=fvjRpV4f c=1 sm=1 tr=0 ts=69c6d11f cx=c_pps
 a=v9d8l4VwGb/BX2RVr192eg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=bd-SKr3HlWZVCYFCRTQK:22 a=VwQbUJbxAAAA:8
 a=pgMwbierAAAA:8 a=zIG1XzswD56S2meQQXMA:9 a=QEXdDO2ut3YA:10
 a=jg0q2lLtnhMsWSggHq3u:22
X-Proofpoint-ORIG-GUID: 8bS_s8CSoovIgmwtwlaaBfAFy2Pt83fV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzMSBTYWx0ZWRfXxOPeg/0Vc1ZP
 PcX6jZwla/rYq2tijw9C0iBlcg9TXGRf38fW5ndgJ4UeaE8HIpQuwq0nPTjdMX1j/B1h6SpSq8z
 yrM6gyrf83ogTwiCDqUWrUs7bam+2/JznYyaDKyAfkWY6HnJglNCmrtb6IJs4ER2XYi4EXdSFLE
 InJmF0/tt9DwP71zUx6FsLgNY4DKTDK8E2BvzvBU3WNGjX9VMv0FrJqkTin4bBK6BHDqgzKw1KA
 bvmly81SzaJVSNz6O2J4axwqrF4F47raWfvp/Clpm9FDbApUyn/4sXOQUWaOfHyc7Mgf3zIpnra
 38RABQrdamYvOOAz9dGNS/maNNEVgJlOx3yKppxG03UdCTXfB3r8J5axSwgxQA6GUZp6ehanpmj
 uyeSaxC/pHqxW9FEsuo94wpIUqCL5uTGft8Mk0Mtg8gQy35/6PSdi1CjygrJU1Y9ImAGBP1k/xG
 Rk3tJ7jYTqpz3kd9xvQ==
X-Proofpoint-GUID: 8bS_s8CSoovIgmwtwlaaBfAFy2Pt83fV
X-Sony-Outbound-GUID: 8bS_s8CSoovIgmwtwlaaBfAFy2Pt83fV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01

DQpIZXkgVGhvbWFzLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuLi4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAa2VybmVsLm9y
Zz4NCj4gT24gVHVlLCBGZWIgMTAgMjAyNiBhdCAxNjo0NywgVGltIEJpcmQgd3JvdGU6DQo+ID4g
RHVyaW5nIGVhcmx5IGJvb3QsIHByaW50ayB0aW1lc3RhbXBzIGFyZSByZXBvcnRlZCBhcyB6ZXJv
IGJlZm9yZQ0KPiA+IGtlcm5lbCB0aW1la2VlcGluZyBzdGFydHMgKGUuZy4gYmVmb3JlIHRpbWVf
aW5pdCgpKS4gIFRoaXMNCj4gPiBoaW5kZXJzIGJvb3QtdGltZSBvcHRpbWl6YXRpb24gZWZmb3J0
cy4gIFRoaXMgcGVyaW9kIGlzIGFib3V0IDQwMA0KPiA+IG1pbGxpc2Vjb25kcyBmb3IgbWFueSBj
dXJyZW50IGRlc2t0b3AgYW5kIGVtYmVkZGVkIG1hY2hpbmVzDQo+ID4gcnVubmluZyBMaW51eC4N
Cj4gPg0KPiA+IEFkZCBzdXBwb3J0IHRvIHNhdmUgY3ljbGVzIGR1cmluZyBlYXJseSBib290LCBh
bmQgb3V0cHV0IGNvcnJlY3QNCj4gPiB0aW1lc3RhbXAgdmFsdWVzIGFmdGVyIHRpbWVrZWVwaW5n
IGlzIGluaXRpYWxpemVkLiAgZ2V0X2N5Y2xlcygpDQo+ID4gaXMgb3BlcmF0aW9uYWwgb24gYXJt
NjQgYW5kIHg4Nl82NCBmcm9tIGtlcm5lbCBzdGFydC4gIEFkZCBjb2RlDQo+ID4gYW5kIHZhcmlh
YmxlcyB0byBzYXZlIGNhbGlicmF0aW9uIHZhbHVlcyB1c2VkIHRvIGxhdGVyIGNvbnZlcnQNCj4g
PiBjeWNsZSBjb3VudHMgdG8gdGltZSB2YWx1ZXMgaW4gdGhlIGVhcmx5IHByaW50a3MuICBBZGQg
YSBjb25maWcNCj4gPiB0byBjb250cm9sIHRoZSBmZWF0dXJlLg0KPiA+DQo+ID4gVGhpcyB5aWVs
ZHMgbm9uLXplcm8gdGltZXN0YW1wcyBmb3IgcHJpbnRrcyBmcm9tIHRoZSB2ZXJ5IHN0YXJ0DQo+
ID4gb2Yga2VybmVsIGV4ZWN1dGlvbi4gIFRoZSB0aW1lc3RhbXBzIGFyZSByZWxhdGl2ZSB0byB0
aGUgc3RhcnQgb2YNCj4gPiB0aGUgYXJjaGl0ZWN0dXJlLXNwZWNpZmllZCBjb3VudGVyIHVzZWQg
aW4gZ2V0X2N5Y2xlcw0KPiA+IChlLmcuIHRoZSBUU0Mgb24geDg2XzY0IGFuZCBjbnR2Y3RfZWww
IG9uIGFybTY0KS4NCj4gPg0KPiA+IEFsbCB0aW1lc3RhbXBzIHJlZmxlY3QgdGltZSBmcm9tIHBy
b2Nlc3NvciBwb3dlci1vbiBpbnN0ZWFkIG9mDQo+ID4gdGltZSBmcm9tIHRoZSBrZXJuZWwncyB0
aW1la2VlcGluZyBpbml0aWFsaXphdGlvbi4NCj4gDQo+IENhbiB3ZSBwcmV0dHkgcGxlYXNlIF9u
b3RfIGludHJvZHVjZSB5ZXQgYW5vdGhlciBzaWRlIGNoYW5uZWwgdG8NCj4gZ2VuZXJhdGUgdGlt
ZSBzdGFtcHM/DQoNCldlbGwsIHRoaXMgaXMgdXNpbmcgZ2V0X2N5Y2xlcygpLCB3aGljaCBhbHJl
YWR5IGV4aXN0cyBvbiBtb3N0IGFyY2hpdGVjdHVyZXMuDQpUaGlzIHBhdGNoIGp1c3QgYWRkcyBh
IGZ1bmt5IHdheSB0byB1c2UgY3ljbGVzICh3aGljaCBhcmUgYXZhaWxhYmxlDQpmcm9tIHBvd2Vy
IG9uLCByYXRoZXIgdGhhbiBmcm9tIHRoZSBzdGFydCBvZiBrZXJuZWwgdGltZWtlZXBpbmcpIHRv
DQphbGxvdyBzYXZpbmcgdGltaW5nIGRhdGEgZm9yIHNvbWUgZWFybHkgcHJpbnRrcyAodXN1YWxs
eSBhYm91dCAyMCB0byA2MCBwcmludGtzKS4NCg0KQWxzbywgbXkgY3VycmVudCBwbGFuIGlzIHRv
IGJhY2sgb2ZmIG9mIGFkanVzdGluZyB0aGUgb2Zmc2V0IG9mIHVucmVsYXRlZCAobm9uLXByZS10
aW1lX2luaXQoKSkgcHJpbnRrcywNCmFuZCBsaW1pdCB0aGUgZWZmZWN0IGluIHRoZSBzeXN0ZW0g
dG8ganVzdCB0aG9zZSBmaXJzdCBlYXJseSAocHJlLXRpbWVfaW5pdCgpKSBwcmludGtzLg0KVGhl
IGNvbXBsaWNhdGlvbiB0byBhZGQgYW4gb2Zmc2V0IHRvIGFsbCBmb2xsb3dpbmcgcHJpbnRrcyB3
YXMganVzdCB0byBhdm9pZCBhIGRpc2NvbnRpbnVpdHkNCmluIHByaW50ayB0aW1lc3RhbXBzLCBv
bmNlIHRpbWVfaW5pdCgpIHdhcyBjYWxsZWQgYW5kICJyZWFsIiB0aW1lc3RhbXBzIHN0YXJ0ZWQg
cHJvZHVjaW5nIG5vbi16ZXJvcy4NCkdpdmVuIGhvdyBjb25mdXNpbmcgdGhpcyBzZWVtcyB0byBo
YXZlIG1hZGUgdGhpbmdzLCBJJ20gdGhpbmtpbmcgb2YgYmFja2luZw0Kb2ZmIG9mIHRoYXQgYXBw
cm9hY2guDQoNCj4gDQo+IHByaW50aygpDQo+IA0KPiAgICB0aW1lX25zID0gbG9jYWxfY2xvY2so
KTsNCnRoYXQncyB0c19uc2VjID0gbG9jYWxfY2xvY2soKQ0KDQo+IA0KPiBsb2NhbF9jbG9jaygp
DQo+ICAgbG9jYWxfY2xvY2tfbm9pbnN0cigpDQo+ICAgCS8vIEFmdGVyIGJvb3QNCj4gCWlmIChz
dGF0aWNfYnJhbmNoX2xpa2VseSgmX19zY2hlZF9jbG9ja19zdGFibGUpKQ0KPiAJCXJldHVybiBz
Y2hlZF9jbG9ja19ub2luc3RyKCkgKyBfX3NjaGVkX2Nsb2NrX29mZnNldDsNCj4gDQo+IAkvLyBC
ZWZvcmUgc2NoZWRfY2xvY2tfaW5pdCgpDQo+IAlpZiAoIXN0YXRpY19icmFuY2hfbGlrZWx5KCZz
Y2hlZF9jbG9ja19ydW5uaW5nKSkNCj4gCQlyZXR1cm4gc2NoZWRfY2xvY2tfbm9pbnN0cigpOw0K
PiANCj4gCWNsb2NrID0gc2NoZWRfY2xvY2tfbG9jYWwodGhpc19zY2QoKSk7DQo+IA0KPiBPbiB4
ODY6DQo+IHNjaGVkX2Nsb2NrX25vaW5zdHIoKQ0KPiAgIC8vIGJhcmUgbWV0YWwNCj4gICBuYXRp
dmVfc2NoZWRfY2xvY2soKQ0KPiAgICAgIC8vIEFmdGVyIFRTQyBjYWxpYnJhdGlvbg0KPiAgICAg
IGlmIChzdGF0aWNfYnJhbmNoX2xpa2VseSgmX191c2VfdHNjKSkgew0KPiAgICAgICAgLi4uDQo+
ICAgICAgfQ0KPiANCj4gICAvLyBKaWZmaWVzIGZhbGxiYWNrLg0KPiANCj4gU28gdGhlIG9idmlv
dXMgc29sdXRpb24gaXMgdG8gZXhwYW5kIHRoZSBmYWxsYmFjayB3aXRoOg0KPiANCj4gICAgIGlm
ICh0c2NfYXZhaWxhYmxlKCkpDQo+ICAgICAJcmV0dXJuIHRzY19lYXJseV91bmNhbGlicmF0ZWQo
KTsNCj4gDQo+ICAgICByZXR1cm4gamlmZmllcyAuLi4uOw0KPiANCj4gQXMgdGhpcyBuZWVkcyB0
byBiZSBzdXBwb3J0ZWQgYnkgdGhlIGFyY2hpdGVjdHVyZS9wbGF0Zm9ybSBpbiBhbnkgY2FzZQ0K
PiB0aGVyZSBpcyBjbG9zZSB0byB6ZXJvIGJlbmVmaXQgZnJvbSBjcmVhdGluZyBjb21wbGljYXRl
ZCBnZW5lcmljDQo+IGluZnJhc3RydWN0dXJlIGZvciB0aGlzLg0KDQpUaGUgcHJvYmxlbSB3aXRo
IHRoaXMgaXMgdGhhdCAgdHNjX2Vhcmx5X3VuY2FsaWJyYXRlZCgpIGNhbid0IHJldHVybiBuYW5v
c2Vjb25kcw0KdW50aWwgYWZ0ZXIgY2FsaWJyYXRpb24uDQpJIGRvbid0IHRoaW5rIGl0J3MgYSBn
b29kIGlkZWEgdG8gcmV0dXJucyBjeWNsZXMgc29tZXRpbWVzIGFuZCBuYW5vc2Vjb25kcw0KYXQg
b3RoZXIgdGltZXMsIGZyb20gYSBkZWVwLXNlYXRlZCB0aW1pbmcgZnVuY3Rpb24gbGlrZSB0aGlz
Lg0KQWxzbyB0c2NfYXZhaWxhYmxlKCkgbWlnaHQgaXRzZWxmIGRlcGVuZCBvbiBpbml0aWFsaXph
dGlvbiB0aGF0IGhhc24ndCBoYXBwZW5lZCB5ZXQNCihpbiBlYXJseSBib290KS4NCg0KTXkgYXBw
cm9hY2ggb2Ygc2F2aW5nIGN5Y2xlcyBpbiB0c19uc2VjICBmb3IgdGhlIGVhcmx5IHByaW50a3Mg
d29ya3MgYmVjYXVzZSB0aGVyZSdzDQphIGxpbWl0ZWQgbnVtYmVyIG9mIHBsYWNlcyAob25seSAy
KSBpbnNpZGUgdGhlIHByaW50ayBjb2RlIHdoZXJlIHRzX25zZWMNCmlzIGFjY2Vzc2VkLCBtZWFu
aW5nIHRoYXQgdGhlIGNvZGUgdG8gZGV0ZWN0IGEgY3ljbGVzIHZhbHVlIGluc3RlYWQgb2YgYSBu
YW5vc2Vjb25kcw0KdmFsdWUgY2FuIGJlIGNvbnN0cmFpbmVkIHRvIGp1c3QgdGhvc2UgdHdvIHBs
YWNlcy4gIEJhc2ljYWxseSwgSSdtIGRvaW5nIHRoZSBjb252ZXJzaW9uDQpmcm9tIGN5Y2xlcyB0
byBuYW5vc2Vjb25kcyBhdCBwcmludGsgcHJlc2VudGF0aW9uIHRpbWUsIHJhdGhlciB0aGFuIGF0
IHRoZSB0aW1lIG9mDQpwcmludGsgbWVzc2FnZSBzdWJtaXNzaW9uLg0KDQpUaGUgYXBwcm9hY2gg
dGhhdCBJIG9yaWdpbmFsbHkgc3RhcnRlZCB3aXRoDQooc2VlIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LWVtYmVkZGVkLzM5YjA5ZWRiLTg5OTgtNGViZC1hNTY0LTdkNTk0NDM0YTk4MUBi
aXJkLm9yZy8NCndhcyB0byB1c2UgaGFyZGNvZGVkIG11bHRpcGxpZXIgYW5kIHNoaWZ0IHZhbHVl
cyBmb3IgY29udmVydGluZyBmcm9tIGN5Y2xlcw0KdG8gbmFub3NlY29uZHMuICBUaGVzZSBtdWx0
aXBsaWVyIGFuZCBzaGlmdCB2YWx1ZXMgd291bGQgYmUgc2V0IGF0IGtlcm5lbA0KY29uZmlndXJh
dGlvbiB0aW1lIChpZSwgdXNpbmcgQ09ORklHIHZhbHVlcykuIFRoaXMgYXBwcm9hY2ggYWxsb3dz
IGdlbmVyYXRpbmcgbmFub3NlY29uZA0KdmFsdWVzIGZyb20gVFNDIGN5Y2xlcyBmcm9tIHRoZSB2
ZXJ5IGZpcnN0IGtlcm5lbCBpbnN0cnVjdGlvbiwgYW5kIGhlbmNlIHJlbW92ZXMgdGhlIG5lZWQg
Zm9yIGENCmNhbGlicmF0aW9uIHN0ZXAgYXQgYWxsIChidXQgb2YgY291cnNlLCBpdCByZXF1aXJl
cyBib290LXRpbWUtb3B0aW1pemluZyBkZXZlbG9wZXJzIHRvDQpidWlsZCBhIGN1c3RvbSBrZXJu
ZWwgZm9yIHRoZWlyIG1hY2hpbmUpLiAgVGhpcyBtaWdodCBiZSBhIHJlYXNvbmFibGUgYXBwcm9h
Y2gsIGFzIHRoZQ0KbnVtYmVyIG9mIHBlb3BsZSB3b3JraW5nIG9uIHJlZHVjaW5nIHRoZSBib290
LXRpbWUgb2YgdGhpcyBzZWN0aW9uIG9mIHRoZSBrZXJuZWwNCihwcmUtdGltZV9pbml0KCkpLCBp
cyBwcmV0dHkgc21hbGwsIElNSE8uICBBbHNvLCB0aGUgcGF0Y2ggZm9yIHRoYXQgd2FzIG11Y2gg
c2ltcGxlciB0aGFuIHRoaXMNCm9uZS4NCg0KVGhlcmUgYXJlIG90aGVyIGFwcHJvYWNoZXMsIGJ1
dCBub25lIHJlYWxseSB3b3JrIGVhcmx5IGVub3VnaCBpbiB0aGUga2VybmVsIGJvb3QNCnRvIG5v
dCBiZSBhIHBhaW4uICAgVGhlIGdvYWwgaXMgdG8gcHJvdmlkZSB0aW1pbmcgaW5mbyBiZWZvcmU6
IHRpbWVrZWVwaW5nIGluaXQsDQpqaWZmaWVzIHN0YXJ0dXAsIGFuZCBldmVuIENQVSBmZWF0dXJl
cyBkZXRlcm1pbmF0aW9uLCBhbmQgdG8ga2VlcCB0aGUgZWZmZWN0IG5hcnJvdyAtLQ0KbGltaXRl
ZCBvbmx5IHRvIHByaW50a3MsIGFuZCB0aGUgZmlyc3QgZmV3IHByZS10aW1lX2luaXQoKSBwcmlu
dGsgbWVzc2FnZXMsIGF0IHRoYXQuDQoNCkknbSBub3cgcmVzZWFyY2hpbmcgYSBzdWdnZXN0aW9u
IGZyb20gU2hhc2hhbmsgQmFsYWppIHRvIHVzZSB0aGUgZXhpc3RpbmcgY2FsaWJyYXRpb24NCmRh
dGEgZnJvbSB0c2MgaW5pdGlhbGl6YXRpb24sIHdoaWNoIG1pZ2h0IHNpbXBsaWZ5IHRoZSBjdXJy
ZW50IHBhdGNoIGV2ZW4gZnVydGhlci4gIEknbGwgbWFrZSBzdXJlDQp0byBDQyB5b3Ugb24gdGhl
IG5leHQgdmVyc2lvbiBvZiB0aGUgcGF0Y2guDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcgYW5k
IGZlZWRiYWNrIG9mIHRoaXMgZmVhdHVyZS4NCiAtLSBUaW0NCg0K
