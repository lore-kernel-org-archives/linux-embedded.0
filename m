Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9091934A76B;
	Tue, 24 Mar 2026 20:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774383820; cv=fail; b=JhNHGLyGGBk2aqk3WUYqGNDN87eMIkJfKs50AwUUWio/l++frknBM32i8T7e9Fo9b5AYL5yttlsrDNe1onh37Yw2DSuT80/PWt+vV9OmTBv1f8dK4bLtTeTIYsO9rBMOTbbcYnzcsrR6xXPloiEyI9dDWqw7VWCLOcs3spMPFjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774383820; c=relaxed/simple;
	bh=PuQVoq1KFqOUgiAQLbwPCOmXJyEZWW4pIit9rL0fx2k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mGkL0dfWZLBGtSWPIK+llFlh237OVgFjAltFeZNvURMFn6kE0fVfN0eLOgHTeQr3ptjtJg2+2trZoMxfa4V1O65qVq/T4oYED4AZLrEF2A4QpqkSBa3A4g//yO/hybvxWEAaZaYCCD+NgrSojeigfb+8z/cj6iAJ6+WS3hkbEhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=gK8wpGZ1; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="gK8wpGZ1"
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O5wr0N1063185;
	Tue, 24 Mar 2026 20:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=PuQVoq1
	KFqOUgiAQLbwPCOmXJyEZWW4pIit9rL0fx2k=; b=gK8wpGZ1mfUeDhqQvGBN925
	fJS810n6bRAu8RYfhvW6oRvGZwriH/DEUKGn2S2OSdHq+lLhbB72dlzTWAYwGWuK
	9E0CdUN//NZtz6vz66LTbIBbOg6/hVhFsofkI3HzIsuz7wVdmwymg+iHtiBh5kIu
	RXAodcEU4hDyt5tBKA1lYbdUF99iQtc+Yx2PH2Y9cK/pWHxPC78YKxKI0CP3gkwM
	ujhAM5oKiYe9X/KWyMdRdFQoFeYJbkNGrHXuwsMQJHCOE/g4sRDQlM2UeCf+NLg3
	rrI4pPCENnXpvnrSoXHLaVc/F51wD75PKQHKymBR0TjYhOMzoPIkQGI57b18qyw=
	=
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013068.outbound.protection.outlook.com [40.107.201.68])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4d1mgev5xy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2026 20:08:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3OmcBuqVAGEjH7spEY5Ef9MwZjLK4cOWe1B6ZMM72d4XBa3f1IXS7G0RmEht6PxP2jsljKcNH26YcFy8b0NT/QmY17B9ibBLM1z+nnks16EDrhokf9oRzk7jiJfFzFYZQRL2pv8qvkrrsNkhP2EZi6joLzxjXl+dhNiWbBc7BTMPOtNCQAHdxdrSdtRtW3I0hAd9dK9AdDQaHsNbf3dM35fby925/ShafOUPyH++4hKQSIgUZt3Xb7KYFyUPLJmhmxikxof2MxsFiJruLEvCg5kzzCoIvMUk6P6m4QnqlgYBpQJqbs5XcwSBBgb3B/O34KfxB2l4YxUH8iPON871w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuQVoq1KFqOUgiAQLbwPCOmXJyEZWW4pIit9rL0fx2k=;
 b=Hmbk2B2qRoHu91wCr1oXVU2jd+J9S0qN19m+dwbcQFy2h47xP54fpiHw+ISnTf+ryFoj4cFJgo1xPeubYVrbYcUAcCKTG96wmgasbf+De9YzSP2wD2hiuuFOWbz0spbIE/Q0p3oNCnQ65fnurgkIthuiYXW385eN/o4cs0KIXt+CG+GKJOlJ+L5Q3qMF2xqGH6E5WJwn3+mVwh2Om+CsSjH1DYIlQ2wOc0Irz6Yt9G0w7rMZIvMf4sgODWiPOBDe05rIJRGQUJ27GVuzF2bK/pGDcDaxknkUz2JL1WOeNgNqD9rd8BFBpV1D7ItmyV0Fx1c7ITNZp31ulwxO1tPpJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SN7PR13MB6202.namprd13.prod.outlook.com (2603:10b6:806:2ec::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 20:07:59 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%5]) with mapi id 15.20.9723.022; Tue, 24 Mar 2026
 20:07:59 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Shashank Balaji <shashankbalaji02@gmail.com>,
        Petr Mladek
	<pmladek@suse.com>
CC: Michael Kelley <mhklinux@outlook.com>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "francesco@valla.it" <francesco@valla.it>,
        "geert@linux-m68k.org"
	<geert@linux-m68k.org>,
        "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, John
 Stultz <jstultz@google.com>,
        Stephen Boyd <sboyd@kernel.org>,
        John Ogness
	<john.ogness@linutronix.de>
Subject: RE: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Thread-Topic: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Thread-Index: AQHcmuexSh6ktdFaZUimYV7dOjz0LrWppsqAgAJpSmCAAGcAAIABzV4AgBAUd1A=
Date: Tue, 24 Mar 2026 20:07:59 +0000
Message-ID:
 <MW5PR13MB5632F3D531CCA95BB53E9CBBFD48A@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
 <SN6PR02MB41571D45C1C8ADF89BD1FE8DD447A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <MW5PR13MB563216F6D786D4DCDFEBED2BFD45A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <abPqrqgXHnDu8XWf@pathway> <abVttIDVZ4y2BZAU@fedora>
In-Reply-To: <abVttIDVZ4y2BZAU@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SN7PR13MB6202:EE_
x-ms-office365-filtering-correlation-id: 208de164-30ed-4294-a0ef-08de89e10be1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|10070799003|376014|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 Go9YdYUhiguexO3fF4S/efN9MzFKUMAotXDidGjJYHz7gCuoL4JDymOAyfq6BCpnGb/rDS59FDGg/Yi8kBVNAffZtGGpxa1fd+Jy/ph6MX18b3X8Bcl5r9LwPEM8XB+a8HhJegzuC0urd0iVIgumj5FkS26GRIV0CDisZWCh2SjJ9LLVI7zWxxPxEV2XxK65Ii2bEBrZD7VCbEizlzEz0j2g9p4W+4OEq3a/VWU6hwUkCEdzGMVK38Sk1FwWcmCn1SHINBi/3nAKlAaaNxgv8M0tofvEECYDH5gxY+fb90eqiYEbp3P07/p9q4r/CeomzbE9zl7RYco/OwGcZxvZmKI1i9xdBlqbXdAGu8WRHbL63pxYm/H2MuOULGlS4AKhTW20kthDLIXRBpdZW7UCILKWOF+lFtfHd/L81h8Uulz3n/5MLGEuUbOIOVKFw6qN1YCjrAAOCrpWm8g+lWuLho+t3aDdiAACUsX7m5d6NRYY+N7YykQAEdvPCFRx1K7Vl2tuRoHNmBsdIQnjwM9kMjd+kOh2Sy8yXafiXxvky2nCadiCk+cVEiB41A1v+QVVOxiAgaIGOTG6rhYxBBSTicALQmHvoCN1ziID4sJOK2hwMp+2MloFfYbteo8CSPfwwtdMfiXDoLEUf/5/Ubg5BR/RVrcF3DoMeT9rtAiOpHgd4YjM2LQLFX4p4uUCCdZRDItYzYnnvyjp3T4FgMXSccvngJ4+sCswT3AjNV0WQWLiywm2RmOMrRMNrRGUqxjU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(10070799003)(376014)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXR5TzdveHFmc3dlZDZXN2ZxNVd6NEhmTVdvYVo1VUxKckFQQ3BkYzFDL01C?=
 =?utf-8?B?WXdDeEJySUNWU1VteFVCajR5OE9yV2FBNU8raUN3ak1ISW1qR0Q1d3pnYXRw?=
 =?utf-8?B?SVRKK2VlTmM3UlBEa2pNV2EwaHdnMVNVZkpFNm5Dc3ZrVWN6aWtDeW9RSmZj?=
 =?utf-8?B?dHc2Y2JSOEVUN2ZZYUNqRTJJbExVMlJna245bnQ3VlZ5VlZSZW4xTjFBQUdJ?=
 =?utf-8?B?cDFFNUZxUzhobFhIUUJ0MjVrVUpoVmRDaVMxQmFiWEpJdEpNMEsrTm5IWTZB?=
 =?utf-8?B?VUZ6Tmo4MHdMbkM0RFpnRlFBUVY2UUlUaS9qVlhXQzVrYm1kdVJpd2dabm5I?=
 =?utf-8?B?QnA1YlVMQVR6Ynd4M3hSTXROMXdtVkF1VHdzaXJ5anljY0ZCNmh3SVBBTVAr?=
 =?utf-8?B?S1c1ZUIxV0J6S1RwRDd5WkM3ajJUOUJmZEdjYjR2dUMxeDNpc0JLVENtR1N2?=
 =?utf-8?B?TmFUdzZybWVYR2swV2dObjJVaHd3ekJ5TUo0NHZDemNzSUhKQVhOaTFET1VN?=
 =?utf-8?B?ZzY2ak8zRzUwcTZTMWVsd2diaVFKUSt2a0ZoZDNWUktKWUlqS0IvQmVYNlRI?=
 =?utf-8?B?SDZ2LzBvQXJ3RnVYa0cvWUpaUkNiR3JWRGhQdVRVamxQemdNTlRIZ05QbzNx?=
 =?utf-8?B?MmRnY01Pc1JRaUIzNytoQjYwRG1NN0FhZ1c2VEJqVFdDRitBdXpkRllYR3dL?=
 =?utf-8?B?bGlIQVYyOFlGanBFS083UnYzTytNK3N5TW5RMmw1QVJzMW95bXlZQjlLVERJ?=
 =?utf-8?B?RWVZNi9SZllpeXNQdk1NMFBrLzhuM0FsSTd6QWJyQVdvK0ZIZWQwRVpONnRB?=
 =?utf-8?B?Smh2dTcvK05ZTHVGK3hwSm9Gc1BCTzFrbGRsWHN0NHBUWTZHb1hYUHEwNmNW?=
 =?utf-8?B?TjNjcTFHY2w5OXBjOVFIaGtyT3J2QmY1RFNvZmtDa1JPS3V4UE1JRytxckxJ?=
 =?utf-8?B?NUwrd05EWHc1eDM0QmpvaTc5TzJOV3F3NjhFRHdlL2NiVEFicUhXMU5lUUpQ?=
 =?utf-8?B?WXhZNEgyNGhLZ2wzMkMwYURjcEd5K3pxNkhuaFBCZjhNTW9Lc0dWbU0rSVNy?=
 =?utf-8?B?dXRxOVF5Vm9zMW1zUW1OVzQwOVVNSCtLYUl0UGpyZ2ZySklycWdkQkFwS3ll?=
 =?utf-8?B?enl5dnNnYTBxdzFIR09ybXFTa3JrSmhXeGxiMXNxdzRlZnRQVzNOWGV6eVBz?=
 =?utf-8?B?bE5CRmEzVEpvdk9NSjJ4V2U3T3ZRU0FaRlgzd3dNaCsvSmVRLzZkV0llbmIz?=
 =?utf-8?B?b2NUNnlvMUcrRUlRYkpZTE5vVnpHbHZHbTRLZmNQYUdlaUhUUnphbmNaTXpm?=
 =?utf-8?B?RXd4S1hENTRFeXV2RllUbDM4SWdkL1RIbThZM01hRmt5ZHFYUHpJRGc2emxT?=
 =?utf-8?B?eDNvbmpZdzJFaFp6Tk03L2pQQkRZaytGOThjaXNNY0tIMnpwSUxaUmpFcVdX?=
 =?utf-8?B?UWxZWmEzNUxRUm9NYTYrYjduRytGbEZkaW13cERYVjBnb3N4OGFscHN1ckY5?=
 =?utf-8?B?TzVmSlVqZjFoTXJvMWNrVE8zUFprRFJJR2E3WVo3OEtUTHZnek1BaTBFd1lE?=
 =?utf-8?B?RUFIbFlEcEVZMTNzNG5tSTlBVlRlN0ZTNCszUUJyeDRJRldUWExiajdROE1a?=
 =?utf-8?B?VnR1eWJ2a25QM2VPYmFxYTVnME9YNEx1Y3VLcjRzeVR3cWN1N2JBMEdtN2Rq?=
 =?utf-8?B?R1FFTHhJQlZTNmdPUWcvcmNNYkhkTmQ3cFNpK1krWHNycE1xYnF5T1cxcVdk?=
 =?utf-8?B?NHZYOEpEYThhNGxxeisrOFpzYTdsVXZsQXAxVkNpb2RzK2ZUcFIwL2ZvWGpE?=
 =?utf-8?B?ZTBueHpjZ0NsaWdmbTVIY0pDWmY5WFg0Zm1WYzBnN0Z1YjllR1AwdTlYdUhG?=
 =?utf-8?B?c1prVWtaQXRnazZpNEJlMFkwMi9QWE04YXRwOEdJTXcrYzhqQVV5ZHBtMEwx?=
 =?utf-8?B?anBDS0RKN2VCcFN3ZGhsMVQzSXFZaERyT0FQUENramZsdkNrWklDVDlKU2Q1?=
 =?utf-8?B?a1JzcmR0UG4reUVtM3l6T3V3azZ1MFNDcldhcWpNM0JtR0I4cXAwczBGV2dr?=
 =?utf-8?B?VGZvNzcxNitwVlJaYnFmRUNGS3dTbm4wb3YzaUYvVmtIa01VMXVwRzNEdXUw?=
 =?utf-8?B?OVFBRWxuZjlWVzJyL2kzVnBZYVJtbkxoQy9lQmVSbytNdHNEOVVCOVNtRWVN?=
 =?utf-8?B?ZU9jN0pCQzEwRk0wVUEzN1UvUDNBSUhtT2YxMDBlcGZjOFkzSTk3YXJKeEFy?=
 =?utf-8?B?dTZkTW1vejRLazdsanZXdlVpdlIyVy9GeVlNUFkyTGFtK2p3RDlLc2hOdmR2?=
 =?utf-8?B?dDQ3TEUxYnV0dnBKNkNSSjB4S01DOFllc0FLb2hIeDVWUVRkbTRXeDVOOVkx?=
 =?utf-8?Q?pHankAQhuWu2Mby5mmDNfAkSKIODQDkqgZajk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Syl6zuZRteFuBOcGWkjvaU3T5FnWeyLEHB0C5wTr5Ija6SxAm5rZ/UXO+HjPSwNaScyWhZAuvZBziS3GjLxicFaKAabstbTWWnZfP+zKHdwSjs5cTm7iio5hJG8Jb5VExdtogkn7Q8YhGbefgYj5N3WNEOfiiUJM/0rtJRfLuE5QxbbVOvfMtsVd+wYFMqhq7T0TzcFto3tjpJQAc7IPw/em3JAjwMBpZf/pzViwMFoulzhOsl5u55sU+c8xvsZpMlkaRWzomfyFqin73NWp/8YUy85iFisF+KC+dPDwv2HxxJue9BcvaIcXxRakShiUU8t/ASaiito4KGBUApCHhw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jor7cLiCsOoKKyXp1+OGSHoSrwdUbha90thw3Sd0if0jGiu4JUktOIsXrn3plr6os0VU8vf4wQCCR461kkUjrjISL0sqAhy/yeOcf/uKhkxGpKxkvS9J6Np3whm8I7NUgFOZ7IFpLqIVXLfGDgrrZGrGJ3pBiXejrvc4B8u8pRZPvykhNaQtQoV9sy2QsD2PRqKLT/1tyvgHiPgToHfBx1Ww97yCv85XOOy+IYINanftz4CS7yPaZDY1eJavrVU7bjRm6JXgAepQjs4YDBXEeZWJsNrRZB1mketzcvwQ591tkZ7R+p7HiQNa6vDrIi1ODT6fLGcNWlJBMBRAHZOP8rJbA5tPKTSpeJxQh8pTZ/oIFpm2r6NFmXdrgBjIHD0CnFkTxcm32bSbTKxESZyfnNF/7pF2AAz+a/E+rVJ9jJ3qMIj/SsExH6ndegbUqWdt/neJKi0/fwV3GcmLKMpGAx1aWwtjBsrVK6yA3gfoU5PTRc74HqGwa5z7td04HrrCK1Axr0E+4dDiiLIpwS8UKhEaJR3l/irhRCRLCNqmGvG3O1m626bkrW0fT4uaBYBgB0iwxIBh8+50v8jLg0HJAwqBTjBLTjYc9fo3cqenFPFwSRFQU/DwS234frGtwXZA
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208de164-30ed-4294-a0ef-08de89e10be1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 20:07:59.3007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AAy9UoVWaVPBDLkERhIyWy+pk31iRu1FWjfxeJyplKVHXws8o4CZL4vtSTdx8AolEA5ZCOjAIgcotTFuZblenA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR13MB6202
X-Proofpoint-GUID: YFYCmWTT4N0aCMDbCMp6zVNGNM16yQJE
X-Proofpoint-ORIG-GUID: YFYCmWTT4N0aCMDbCMp6zVNGNM16yQJE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE1NSBTYWx0ZWRfX+f2OaLZgHF0G
 nCjP4d1DIkdAPb2Yw7zfvsteCjTPHkfYThNy4DtRrFNJ10dSn0OmzlI8YMewuM+NpUKrtPuAc7M
 RpB1Y47nyXnjUVRbyhhznEmzuALU0l/jWfFUeTmlgjzJBPtIM2sUTsSt0S7lUqY3ZxMnWmuw1lO
 vGwVmNQNd2SZ5FaNCVEZ6z0rA92JYV3e7X4P08N7IoFmOTVuXH0oM/FNglTeCcn5d4H3TnuepcP
 09s7GXjqxlwanVTH2LIpOlpHO9hE6OTN66fecOH0P4k3UwT0ypjNcFN1WQ66bN/w2ykSoGYJOia
 4tH9LZf/bd1hiCZlsj2ljuIYx1pZ8nstHJ6Xtzbn17PaxPddJOBMjDKgRKTR/9cd0jSmlksSlFg
 zs/+AX77qllW3r+AUNeAuSYPnr4kcqB+rKEnxoyBOI5Z/ebsI53IQ0BwhjKnA1J6WTb2ab5VUYL
 7sdLGviKwVYCpTtlV5Q==
X-Authority-Analysis: v=2.4 cv=RNG+3oi+ c=1 sm=1 tr=0 ts=69c2ef26 cx=c_pps
 a=QwCZ9Ep3279coiJ7nb8JBQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=jHItnBwsj8f3cr25iGAb:22 a=VwQbUJbxAAAA:8
 a=pgMwbierAAAA:8 a=pGLkceISAAAA:8 a=u6wFRDrsi-01auhIjDwA:9 a=QEXdDO2ut3YA:10
 a=jg0q2lLtnhMsWSggHq3u:22
X-Sony-Outbound-GUID: YFYCmWTT4N0aCMDbCMp6zVNGNM16yQJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01

SGV5IFNoYXNoYW5rLA0KDQpUaGFua3MgZm9yIGxvb2tpbmcgaW50byB0aGlzLCBhbmQgcHJvdmlk
aW5nIHNvbWUgaWRlYXMuICBTZWUgbXkgcmVzcG9uc2VzIGJlbG93Lg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNoYXNoYW5rIEJhbGFqaSA8c2hhc2hhbmtiYWxhamkw
MkBnbWFpbC5jb20+DQo+IA0KPiBIaSBUaW0sIFBldHIsDQo+IA0KPiBPbiBGcmksIE1hciAxMywg
MjAyNiBhdCAxMTo0NTowMkFNICswMTAwLCBQZXRyIE1sYWRlayB3cm90ZToNCj4gPiBGaW5hbGx5
IGFkZGVkIHRpbWVrZWVwaW5nIG1haW50YWluZXJzIGFuZCBKb2huIGludG8gQ2MuDQo+ID4gV2Ug
c2hvdWxkIGhhdmUgYWRkZWQgdGltZSBzaW5jZSB2MS4NCj4gPg0KPiA+IEFueXdheSwgeW91IG1p
Z2h0IHNlZSB0aGUgZW50aXJlIGhpc3RvcnkgYXQNCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMzliMDllZGItODk5OC00ZWJkLWE1NjQtN2Q1OTQ0MzRhOTgxQGJpcmQub3JnLw0KPiA+
DQo+ID4NCi4uLg0KDQo+IA0KPiBCYXNlZCBvbiB0aGUgZGlzY3Vzc2lvbnMgdGh1cyBmYXIsIEkg
c2VlIHRocmVlIHByb2JsZW1zIGN1cnJlbnRseToNCj4gDQo+IDEuIFRocmVlIHBoYXNlcyBvZiB0
aW1lc3RhbXBzIG9uIGNvbnNvbGVzIHByaW50aW5nIHN5bmNocm9ub3VzbHkgaXMgYXdrd2FyZA0K
QWdyZWVkLg0KDQo+IDIuIFBvc3NpYmxlIHVzZXJzcGFjZSBicmVha2FnZToNCj4gDQo+ICAgICBJ
IGRvbid0IGtub3cgaG93IGJpZyBvZiBhIGNvbmNlcm4gdGhpcyBpcywgYnV0IGlmIHRoZSB0aW1l
c3RhbXBzIHdlcmUgdG8gbm90IHN0YXJ0IGF0IHplcm8sIGFueQ0KPiAgICAgdG9vbHMgZXhwZWN0
aW5nIHRoZW0gdG8sIHdvdWxkIGJlIHNob2NrZWQuIHByaW50ayB0aW1lc3RhbXAgY29tcGFyaXNv
biB3aXRoIENMT0NLX0JPT1RUSU1FDQo+ICAgICB3b3VsZG4ndCB3b3JrIGFueW1vcmUuDQo+IA0K
PiAzLiBDb3VudGVyIGZyZXF1ZW5jeSBjb25zdGFuY3kgcmVxdWlyZW1lbnQ6DQo+IA0KPiAgICAg
Rm9yIHRoZSBlYXJseSB0aW1lIGNhbGlicmF0aW9uIHRvIGJlIGFjY3VyYXRlLCB0aGUgY291bnRl
ciBmcmVxdWVuY3kgc2hvdWxkIGJlIGNvbnN0YW50IGZyb20NCj4gICAgIHByb2Nlc3NvciBwb3dl
ciBvbiB0byB0aGUgZW5kIG9mIHRoZSBjYWxpYnJhdGlvbi4gV2UgZG9uJ3Qga25vdyB3aGF0IHRo
ZSBmaXJtd2FyZSBvciB0aGUgYm9vdGxvYWRlcg0KPiAgICAgbWF5IGRvIGluLWJldHdlZW4uIElm
IHRoZSBjb3VudGVyIGZyZXF1ZW5jeSBkZXBlbmRzIG9uIGNwdSBmcmVxdWVuY3kgb3IgaXMganVz
dCB1bnN0YWJsZSwgdGhlbiB3ZQ0KPiAgICAgc2hvdWxkIGVyciBvbiB0aGUgc2lkZSBvZiBjYXV0
aW9uIGFuZCBiYWlsIG91dCBvZiBlYXJseSB0aW1lcy4gT24gdGhlIG90aGVyIGhhbmQsIGlmIGNv
bnN0YW50IGNvdW50ZXINCj4gICAgIGZyZXF1ZW5jeSBpcyBhcmNoaXRlY3R1cmFsbHkgZ3VhcmFu
dGVlZCBvciBpZiB0aGUgY3B1IGFkdmVydGlzZXMgc28sIHRoZW4gd2Ugc2hvdWxkIGJlIGdvb2Qu
IExpa2UsDQo+ICAgICB4ODYgaGFzIG9uZSBvbmx5IGlmIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVS
RV9DT05TVEFOVF9UU0MpLCByZXN0IGFyZSBkdWJpb3VzLg0KDQpJJ2xsIG5lZWQgdG8gY2hlY2sg
d2hlbiB0aGUgZGF0YSBmb3IgYm9vdF9jcHVfaGFzKCkgaXMgaW5pdGlhbGl6ZWQuICBJIGJlbGll
dmUgaXQncyBub3QgYXZhaWxhYmxlDQpmcm9tIHRoZSB2ZXJ5IGZpcnN0IGtlcm5lbCBpbnN0cnVj
dGlvbiwgYnV0IEkgbWF5IGJlIG1pc3JlbWVtYmVyaW5nLiAgSSB0aGluayBhbG1vc3QgYWxsDQp4
ODZfNjQgcHJvY2Vzc29ycyBoYXZlIGludmFyaWFudCBUU0NzIHNpbmNlIGFib3V0IDIwMDgsIHNv
IGl0IG1pZ2h0IGJlIGJldHRlciB0byBqdXN0DQpkb2N1bWVudCB0aGlzIGlzc3VlIGluIHRoZSBj
b25maWcuICBJIGRvbid0IHRoaW5rIGEgbG90IG9mIHBlb3BsZSBhcmUgb3B0aW1pemluZyB0aGlz
DQoxMDBtcyB0byA0MDBtcyByZWdpb24gb2YgZWFybHkgYm9vdCAodGhhdCB0aGlzIHBhdGNoIGlz
IHRhcmdldGVkIGF0KSBvbiBvbGRlciBwcm9jZXNzb3JzLg0KDQo+IA0KPiBJZGVhOiBNYWtpbmcg
dGhlIGVhcmx5IHRpbWVzdGFtcHMgc3RhcnQgYXQgMCB3b3VsZCBwYXJ0aWFsbHkgYWRkcmVzcyB0
aGVzZSBwcm9ibGVtczoNCj4gDQo+IDEuIE5vIGF3a3dhcmQgdGhyZWUgcGhhc2VzIG9mIHRpbWVz
dGFtcHM6DQo+IA0KPiAgICAgVGhlIG9ubHkgZGlmZmVyZW5jZSB3b3VsZCBiZSB0aGF0IHNlcmlh
bCB3b3VsZCBoYXZlIGEgbnVtYmVyIG9mIHRpbWVzdGFtcHMgZXhhY3RseSBhdCAwLCB3aGlsZSB1
c2Vyc3BhY2UNCj4gICAgIHdvdWxkbid0LiBUaGUgZWFybHkgdGltZSBjYWxpYnJhdGlvbiBkYXRh
IHdvdWxkIG9ubHkgYmUgdXNlZCBmb3IgdXNlcnNwYWNlIHRvIGNvbnZlcnQgdGhlIGNvdW50ZXIg
dmFsdWVzDQo+ICAgICB0byB0aW1lc3RhbXBzIHdpdGggYSB6ZXJvIG9yaWdpbi4NCj4gDQo+IDIu
IFVzZXJzcGFjZSBicmVha2FnZToNCj4gDQo+ICAgICBDTE9DS19CT09UVElNRSdzIG9yaWdpbiBp
cyB0aW1la2VlcGluZyBpbml0LiBTbyByZWxhdGl2ZSB0byB0aGF0LCB0aGUgb3JpZ2luIG9mIGVh
cmx5IHRpbWVzdGFtcHMgd291bGQgYmUNCj4gICAgIGNsb3NlciwgYnV0IHN0aWxsIGRpZmZlcmVu
dC4NCj4gDQo+IE1ha2luZyB0aGUgZWFybHkgdGltZXN0YW1wcyBzdGFydCBhdCAwIHdvdWxkIGFs
c28gbG93ZXIgY291bnRlciBmcmVxdWVuY3kgY29uc3RhbmN5IHJlcXVpcmVtZW50LiBOb3cgdGhl
IGNvbnN0YW5jeQ0KPiByZXF1aXJlbWVudCB3b3VsZCBvbmx5IGJlIGJldHdlZW4gdGhlIHBlcmlv
ZCBvZiBrZXJuZWwgc3RhcnQgdG8gY2FsaWJyYXRpb24gZW5kLCBhIHBoYXNlIGluIHdoaWNoIHRo
ZSBrZXJuZWwgaXMNCj4gaW4gZnVsbCBjb250cm9sLiBNYXliZSBldmVuIGlmICFib290X2NwdV9o
YXMoWDg2X0ZFQVRVUkVfQ09OU1RBTlRfVFNDKSwgdGhlIGNhbGlicmF0aW9uIGRhdGEgd291bGQg
YmUgZmluZSB0byB1c2U/DQo+IFRoaXMgaXMgZGViYXRhYmxlLg0KPiANCj4gQSBkaXNhZHZhbnRh
Z2Ugb2YgdGhpcyBtZXRob2QgaXMgdGhhdCB2aXNpYmlsaXR5IGludG8gcGVyLWtlcm5lbCBkdXJh
dGlvbiBpcyBsb3N0LiBCdXQgdGhhdCBjYW4gYmUgbWFkZSB1cCBmb3IgYnkNCj4gYWRkaW5nIHNv
bWV0aGluZyBsaWtlOg0KPiANCj4gICAgIHByX2luZm8oIlByZS1rZXJuZWwgZHVyYXRpb246ICVs
bHUgbXNcbiIsIHByZV9rZXJuZWxfdGltZSk7DQo+IA0KPiBCdXQgdGhpcyBpbmZvcm1hdGlvbiBz
aG91bGQgYmUgdGFrZW4gd2l0aCBhIGdyYWluIG9mIHNhbHQgaWYgY29uc3RhbnQgY291bnRlciBm
cmVxdWVuY3kgaXMgbm90IGd1YXJhbnRlZWQuDQo+IA0KPiBBbm90aGVyIHBvaW50LCBzaW5jZSBj
b25zdGFuY3kgb2YgY291bnRlciBmcmVxdWVuY3kgaXMgYmVpbmcgcmVsaWVkIHVwb24gYW55d2F5
LCBjb252ZXJzaW9uIG9mIGNvdW50ZXIgdmFsdWUgdG8NCj4gdGltZXN0YW1wIGNhbiBiZSBkb25l
IGxhdGVyIG9uY2UgY291bnRlciBmcmVxdWVuY3kgY2FsaWJyYXRpb24gaXMgY29tcGxldGUsIGlu
c3RlYWQgb2YgZG9pbmcgb3VyIG93biBjYWxpYnJhdGlvbi4NCj4gQW4gYXJjaCBob29rIGxpa2Ug
YXJjaF9jb3VudGVyX2ZyZXEoKSBjb3VsZCBiZSBwcm92aWRlZCBmcm9tIHdoaWNoIHdlIGNhbiBn
ZXQgdGhpcyBpbmZvLiBPbiB4ODYsIGl0IHdvdWxkIGJlIHdpcmVkDQo+IHVwIHRvIHRzY19raHou
IElmIGFyY2hfY291bnRlcl9mcmVxKCkgcmV0dXJucyAwLCB0aGF0IG1lYW5zIGNvbnN0YW50IGZy
ZXF1ZW5jeSBpcyBub3QgZ3VhcmFudGVlZCwgc28gd2UnZCBiYWlsDQo+IG91dCBvZiB0aGUgY291
bnRlciB2YWx1ZSB0byB0aW1lc3RhbXAgY29udmVyc2lvbi4NCg0KSW50ZXJlc3RpbmcuICBJZiBJ
IGNhbiB2YWxpZGF0ZSB0aGF0IGxvY2FsX2Nsb2NrKCkgaXMgdXNpbmcgdGhlIHNhbWUgY2xvY2sg
c291cmNlIChUU0MpIGFzIG15IGVhcmx5X3RpbWVzIGNhbGlicmF0aW9uLA0KbWF5YmUgSSAqY2Fu
KiBqdXN0IHN0ZWFsIHRoZSBjYWxpYnJhdGlvbiBhbHJlYWR5IGRvbmUgd2hlbiBpbml0aWFsaXpp
bmcgdGhhdCBjbG9jay4gIEknbSB1c2luZyB0aGUgc2FtZQ0Kcm91dGluZSAnY2xvY2tzX2NhbGNf
bXVsdF9zaGlmdCcsIGFuZCBtYXliZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8ganVzdCBncmFiIHRo
ZSBudW1iZXJzIHRoYXQgcmVzdWx0IGZyb20NCnRoZSBUU0MgY2xvY2sgaW5pdGlhbGl6YXRpb24s
IHJhdGhlciB0aGFuIGNhbGxpbmcgaXQgYWdhaW4gKHdpdGggZGlmZmVyZW50IG51bWJlcnMpIG15
c2VsZi4gIEknbGwgbG9vayBpbnRvIHRoaXMuDQoNClRoYW5rcyB2ZXJ5IG11Y2ggZm9yIHRoZSBm
ZWVkYmFjayBhbmQgaWRlYXMuDQogLS0gVGltDQoNCg==
