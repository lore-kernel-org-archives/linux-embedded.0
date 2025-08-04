Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA98202961
	for <linux-embedded@vger.kernel.org>; Mon,  4 Aug 2025 21:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754342056; cv=fail; b=W+N6wKF+xrN1jh7wmAMeBeGBKIrO0LKsj4mXmDPMml9Xc07meeR8wACbme5P6Ftz5oUAXWMSqy48+eZzmPkIpN9AkW6ox2aH/S5X7kaoWUl7BTDLES51o7sRtl7Y8lU3y92QWmsnF+x0YYQkB4Z03LZRY8gFfxsif37K6kLsQFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754342056; c=relaxed/simple;
	bh=x5mW0x87RfD85OJu271xinkR1xf9V2I1KIAxr065ddE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=Xtq0Xw3M75dKzTqzqrj5bViMSNuSWmAavtsYQpcuH7LtaOqI3FqbIbNIKx7rKsjIvLXNamI1aCLVoHFcia2JQkcKz/MgpfC7k43Mr8x6nKn5aN3iiDwD2tOYw9Dot9igSOEFjJu7mpHBhR0dpYr+F+Kg/uFKSZBH8kVKUS/qxaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=brtyj3bS; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="brtyj3bS"
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574Iw162026011;
	Mon, 4 Aug 2025 21:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=x5mW0x8
	7RfD85OJu271xinkR1xf9V2I1KIAxr065ddE=; b=brtyj3bSa+Dix29LOcM9ler
	o/PVtgTUmU8r6RaoVb3JH9E1x+zA27tDe/tgwHQcVFmB3S+dXehMffTtzOAFvlwk
	LeKnMrB058pgo9vSmILeNQzHofU5AchG1Tqjj+9+rsy7ihCgytRWBLZmnMEc7C4r
	GG/kVPWLkKcVr3wbvpHaNDL5pLmal7qJ3fjYW6b+oUtZN2QWpDJt+3rszkKXuCD2
	QECxEhW/giZgY8rNebrPgvtGdvwIGg6HHNDeYTtbKpz5hdXdq9ByqxRMvW55bEub
	AOJLi9IQq8vox2PjPyP6u8M8tgUkKHyhl5ugubmVd7mUm7c+UwoYCi84oH3HeVg=
	=
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 489bup2363-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 04 Aug 2025 21:14:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ty8vzRnVY+MnASC9vW9ZUh3D6xy7ZyoudpullD5/hvV8GTOYgEH0bhwNutjUt/Noi+VL4JanwhtwNrauIGeS3ZyF4uyePfcBAuFSc6C6QPziJ8Z++wPIXdw7+MKm+mHeUWmtkfgNzkfd6B4Luyq/TE4gVcuyiuwMRmoKI0GbWBoR3ysdzLqR2BMgVYuBxa6Jf76sPw1GyM4ugh4eJr1psZOcDLVCRX+RrgpmhJfrBgp1mtYn5Q8ct3jV7HL5aYqfYKsCT/V8j3gztuISAFO1BMu7aHiMVWH6m68ze5yaucTy48B1k/Ectp6rKmEPcEhpWDWo0qV5x8VemUul3axGuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aw9gN3GuZ6NANJbmE17j2pFvPZLe7acBF9SA38zy9Gc=;
 b=j+eQpVrfGFbSblS1bfH1CEp4cqww+lH8n+Wv+Q0yCds7HwDI4v32eAeeXKTF2ogsrpotQAXpxAqnkDoB+aXXeYiSUMmKqqq4sX8KJ1CQ1xRaKEqrSclXrFtOm2xe3txJ7Lg2wnMSc6yr/06gfOzysXSwakc+e0ybzkCr1xDj/+rT4y3g6u+GMwqkzbj4OmyKfYtEL9BAwoO7OxDUF6Jq5gK2A64VR3T4YCTYTwLIlrDAbslS1PVeUMM+eUZpx9CPy56hc9XhFLnNvtKMePfp12v+hB1wSeBYVvyzGdYxfCCB9QF8FYpiDA/8xA5UgOVG5DVYPyW3Mhm5IkfE37VjlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SN7PR13MB6227.namprd13.prod.outlook.com (2603:10b6:806:2de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 21:14:02 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%5]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 21:14:01 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Rob Landley <rob@landley.net>,
        Linux Embedded
	<linux-embedded@vger.kernel.org>
Subject: RE: [boot-time] New page for tracking boot-time activities
Thread-Topic: [boot-time] New page for tracking boot-time activities
Thread-Index: AdvhSdQEPBO5vNr+Sve72t2mxktshgkIJAsAAAZzPrA=
Date: Mon, 4 Aug 2025 21:14:01 +0000
Message-ID:
 <MW5PR13MB56329C91EC3243DDE6B55384FD23A@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <MW5PR13MB5632D3415109C228182DF2F3FD7DA@MW5PR13MB5632.namprd13.prod.outlook.com>
 <56e24313-cb40-445e-b2e2-900fe7e27b33@landley.net>
In-Reply-To: <56e24313-cb40-445e-b2e2-900fe7e27b33@landley.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SN7PR13MB6227:EE_
x-ms-office365-filtering-correlation-id: c5f05d2f-1d03-497f-ee3e-08ddd39bd5df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RXVhUTdITVlXblo2ajZMQUZ3Q1MyTlIvM3NlSDhPVEFwZHhwVm50bkNrVWg5?=
 =?utf-8?B?Wnc3Q3Z0aGFWZ0lLMm1rU3ljbmJVay9wY2V4UXJ0Nk01Y1hySktQRlc0VXYz?=
 =?utf-8?B?dmkxb3ZTNERSMElDcjAzajNQOHpBbURoaVAxNEtOMGFYdEszN2t2Q1BKL2o4?=
 =?utf-8?B?TFoycU9KbWRjeUFzUWVZNWZaa0diSkNaNnJqREhST3N4cDg4NnFtZUlUMWtK?=
 =?utf-8?B?dkxrakp4TmhDVXZrRlVmeWRRMmIwWkFLT0l4TC9XRXhLR1AzcjZ3NnVSZ2Zj?=
 =?utf-8?B?UngwZkJIOGNoV1BxNFJOb2ZRVkxmVmRFSGU4MDJBSVNocFVrTEIzek05M2Yx?=
 =?utf-8?B?R1BaM3BuTTRlWlBTRFJuWGRYRlArQXJzYTQwdWx6dWg4eGMzZ1RldXhlK1Rs?=
 =?utf-8?B?ejNTUElsSHIyNnRDTk5HVURZRVZPZklRaTkwM1lqL1BEUDNuK0ZreFd3MXQ0?=
 =?utf-8?B?dWowUHgxOHpGTnM0b1hRUmdpdmdnL25tVDZtd3UyelErTHBSbkJJZ3lBZm1C?=
 =?utf-8?B?ZGtKNHJyR3Z2cHA3QVRHT1lNVEZ1S0IzK1pTamFCeWZFK1JQTTYxdkwvMGhV?=
 =?utf-8?B?MHMwT1pVLzJtOEFyWHQ4MmRVWlRPTG9NblExVDgybTNJb29JS0s4dWRVTXpy?=
 =?utf-8?B?MEcrQkdNdWNNVHBXZktZVWh1dTJyOUl1bzlzRmxneUxTTE5nc3BPUDhDTWtH?=
 =?utf-8?B?Rk9hUitnUFFIRDZtUEVzS254Qjg4NDRkOWVqWVlISEl5NUlCR3lNYllmVnZs?=
 =?utf-8?B?WE01eEJUdi8remhmZjlsUWdibVJKQXlPd2VhM3dqSE50Z0pnZ1VIdXB2Y0hY?=
 =?utf-8?B?MWZ2OXFuN2JDbmJMRU5kNHk2aGJvNG04WU5VV1NWaVZxTGZSTjJ1KzNlMUZT?=
 =?utf-8?B?KzZ0VmZGdmpPdzRlTHBqOGN0UlQ1a1o4Qkg4VjlCdU8zdU5tZDIwZVNTOG1C?=
 =?utf-8?B?OUJFRW9TT3h6YWdRa3ZpNVZCNE0wTlpKN05NZXc2TzltK0lGMDN3akNJekRP?=
 =?utf-8?B?dnppWjJkblJiZ1UxZEsyVXkvdzZ5UzJjMGxaSytGTmlUbG9ZVVdLS016Z1do?=
 =?utf-8?B?dWVwdGYwaEE1b3pqNktiMWllenoxM1dzWXhnamthMytkQXBmME9GM1djZFdS?=
 =?utf-8?B?SHA0cVVVWTM3NWtWa0dBdlJvRGhpQXBVZnNIK1l1R3hjYng1Vlk0V1p4Yndj?=
 =?utf-8?B?OTlLS3VRdlhwR2poNERtRFdDYXlIZ05MZDJtSWoxUGwwbGhwckEvUWVrbXBK?=
 =?utf-8?B?OGpGT0ZYRFVETjl0QmsxTUtlOU81c1QxRjJpa2JFdC9MRUtQZ2VsWTRpRU1S?=
 =?utf-8?B?OExTSWpTcTliMVRjVS9ubjZIUEtDd0pyVlhxVUxLa0FnUWFvSkZhUjg3Yzg4?=
 =?utf-8?B?b3hyNHIreXhEUVpPU1dmaXc1cFArbWdWM2d3OUhMMGtiZTNoVEszcmdad2cw?=
 =?utf-8?B?Mk5Namc2ZUlia2ZobGF6UDE1eGFxM29JRVYwV25KQVNaOUZKNzl2TE5yNGtI?=
 =?utf-8?B?SkJ4V2RXdmtDeGU0aG0wOGY5QkdHS1JhT2xVR2J1M241c240cTJ1dmlBemQx?=
 =?utf-8?B?bnpoL3gxc0R6UWE5amJuYjdaQlZtb3BRbzZPU2U3SUFuT3BCeVlRNmwxSXBa?=
 =?utf-8?B?SVE2K0gySHF5eE5qY3ZJNmNXNERDOFJ2cHpBT0ltV09ueHl3QVVRR0FVSUJT?=
 =?utf-8?B?UHZLMXMyZkZZdnM4U1UxWTJLRDFsYUg1RmdabTZUTDNYZUMwQUdtUjhPaWJ0?=
 =?utf-8?B?Ukt4d3VWS1BpSUdiYmVxaHMvUmpibEdBOFhKMDNYa0xDaUZ0Y0VWdlNPQW9R?=
 =?utf-8?B?Z3k2eFV5ZkFrU3MveHZwbzhDYzl1QjZoQml1TStCd1FQRzRJdEhYbngwTkIr?=
 =?utf-8?B?aGRBZlltRURjbmxOemE5Y1RjWmZoRkd3djQ4aXBWTDZNU0VHQ0NuT0JtRllS?=
 =?utf-8?Q?ukAmUXtUP9o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YTViVUNWTXJDbzlBaTl1Y3NPaW1PQm43c0FrVGhYTzN6MjhGWktYYzl6WHVn?=
 =?utf-8?B?RU8yTzBhNFA4amdhN0xYaUl1UkZROWlZaUxKK1g3aExRbWRqWlIwc29iMWFo?=
 =?utf-8?B?S0VwcW1peE96aWtjNjJ5S0FraXFpZTBNTWJDZ1kyUDZEUVRERnZjeVNrdndh?=
 =?utf-8?B?Uk1YMXdIdFB4Y0VtcUJock51dk1XQjZobnF0UlB6bEFFZzRhaTBaYlRPTFhP?=
 =?utf-8?B?UXVJVGNkTDY4bVNZQ1lpTFV3ekZrTU12RDloWG42RXFicEpvRE5SN1VRRjJY?=
 =?utf-8?B?L3F6Q0NXV0RERGEvQmlCeHpBSWtwV29KOGgvTitIWnFxSzluWFMwS0FLV2Nz?=
 =?utf-8?B?UkpPZk9wSVdhcnBHK3pQS0R4NldyZ3puelVZUGYrYVpuUlh2WGRSK3JYQmtL?=
 =?utf-8?B?Nktoc1hVM2ZvSFVFTDBRVXJtNFNxWEpXdE4rR0pKNmI3UXJlZEdjeHZKaWVX?=
 =?utf-8?B?QlRkYTF1MGU5dUhVeVd3c0xDL1JQUmx3NWR5alo3QldmRXZRQ2NjRHBqK0ts?=
 =?utf-8?B?RC90QUszM3dGVjY1Y2JxbGNWNzl4N1hmb2t2d24wOUVuMHhEWFoxdis1RFo0?=
 =?utf-8?B?eDBmRHlBS095ZmhpSnpVVmlYN3huMXgvcEtiNW16cEc0ckxac0pJT080cndy?=
 =?utf-8?B?Q1BqdklXOXRqSm9qd1VJTFFxUVJaQTBuRmhZL1dnRGdsak4raDVNc2pVVlFR?=
 =?utf-8?B?NTVDVzdjMUFoQmN4bjFNQnVaOGpPckxqUVVaSHE3cjRIS1Z3VmhPZ2hzTG5k?=
 =?utf-8?B?R2FKbjc3S3VBbE1LYmFxNjl0U3p6Y1l3YTZWbWl3Sy9sUjJ4V1dWUklOM256?=
 =?utf-8?B?YmdoZ0l2QkorTWRXdWthaUQzSVF2VFZ5YUwzVGlHZFFmSjRHVHY2Vm5wWENX?=
 =?utf-8?B?cngxc0RBL1lId2h2bG5CVE5UZWpiOGFva21ud1krYytMcnVkelY5QndkamhB?=
 =?utf-8?B?MGFhSVJqNEM3WUpGNXRMRUZRZllJN0I0SVR4blRvc1NYZHhxcE8yalpaUEtN?=
 =?utf-8?B?TGpUa0d1RHhUcTFmZU90L1hhSk53TER5OTYyOWVUMWlKL3AvejZ6OGZEWXhq?=
 =?utf-8?B?eEV4L0FNbHRHRnRLaCtBZ2FhL2tSTUg4MXZOdmVVUDQ0SENUSXoyY0UwUXRK?=
 =?utf-8?B?cXdtMm4rRnFYbkVScWg1U2VteStkc1ZhWEF1bzZvVlJoMi8rNlNaNEo1ZE5v?=
 =?utf-8?B?OEhYTy90dDEyL2ZjbVRRNXNldVVTdG41UzlRNmd3MUljVnh0TEVuS3NaRlpH?=
 =?utf-8?B?YnBFS2F1cGFLMDJiNzBPM05QMHNwdy9GaXJjWTFUY1NqWTlsTFdkNDlkbDJj?=
 =?utf-8?B?eDIvNG82MmlwaU1qVnNUbjZBdFZOQUttQXN1TXJ0SHhuOWF6RHBFZVRrMU44?=
 =?utf-8?B?cGRmYjljNS81ZTJpbU1vdS9GZGFPeERMSHpoQ1dHc0VEK3dKbWFvODVkZnJz?=
 =?utf-8?B?WUF3MmI0K3Y0Q054eGU4MlB0Uks4V2M1L213b2xDRCt6eFBObG8yREtpUHAy?=
 =?utf-8?B?a2lPb1lpeVhDK09qSlJZYmRtbVg0YnlIZk5uN1l1RGFST0hsaS9QY08yT0tP?=
 =?utf-8?B?RG5DbTlxL3JOaEFWY1ZBQWxxRjZISERRcmlQOUk2NVpFWGxmbThvQzB0U3Vv?=
 =?utf-8?B?UDZnclNCQ0NjQytGQk1NSllVelNwNFJzV0tBVTlsQWhPcWI1U2tCS2orVUhM?=
 =?utf-8?B?SW4vZngrWmNUS3E5bURhdUl0YWFyejZ3Q1ZqZnNpS200T3pmS2tnTlBiQUVi?=
 =?utf-8?B?N0RmUzVDaDYwbzM2TjVsVHJMMHZQN3MxT0R1OGdSbmU0RE1HUFdCTDNhc0VG?=
 =?utf-8?B?VjZrb2xmZTRMSmlXSXNSUjNlWHQ3SDBvWmZWVnM2LzhaZEJUL2lKc0w1UDFj?=
 =?utf-8?B?Vk4xeCs1VnYzMytrakthWU4xRUpXc0txWG1GSGdLL2pLYy95WGtDNGhPZFJm?=
 =?utf-8?B?M1dDZVhhRkNIcFlpTGNOcnA4ZkZBelAxNDdIN0hmb0ttbGlaMk0xZ044RC9I?=
 =?utf-8?B?T0wydm9MV1grRmFxNVYzT05veGtzcWlodWFSQ1BnTDZVYmdOVWxlQnhuakw3?=
 =?utf-8?B?d001aTNGdW9YYzJOQW9qQ0hMdFJ3Z1ZDTitvN243cjdTbWwzMzlkNHdZS1gz?=
 =?utf-8?Q?+4eA=3D?=
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aIqf1WTe4Cv/A7jrB6m239ESzN6Ddg4SRyd4RhHD5kkAvm4QESR3ADNYBPU/Yivzm4dZye7qSGfml+wFKNCNrg2aUduoQOQ0LAXPQF655tqdsI3Rg4AN051k95NzIDc+njsBSgxtK9KyZhMtqqy++Oj1xLQn2gJ30d0so8qg3kOu9KQKVxmt45Ra9e/H0xDHcNfcsctqsKO23JSdTpbxxiPBMgusUyarxCyDlRfquckx2DOfCOe/eE+1JLP3p4TmCRagLAMWu4PTvwoYPFJD0giEUq4+7cb+34cGiDs8Rypai8TI+FIKovOYi8TIOHDFxtMjYeFqVhRRwSSq4e+WghyrgMtqaIdDrqx9Iy/CJTAIDelXKxFrWV1CXXuKyMrtx7FKsRAE9Z1DsdMqWZz5d4WIZuF399zdutxXjy5LP+XU+i8t5HHXtGHZHnOwM3un9OEuyZ2BC11sQ8gZ+h+d78VHs8RWSNswM9tlioh+nto38w7tqmz3wHX7ucDR0tYouI2FImMf+2dxVYJ1WdR75b2CfDjj7sSccL4C0k+x5l8Q6YH9ahJklQGXL6E6wNt6T6NEuXZzWN8SqQK0GJBVUD6TDs3EDGDT/n1R4m3IRMgMswS+H0UUkIs9KtxoI5za
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f05d2f-1d03-497f-ee3e-08ddd39bd5df
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 21:14:01.7812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ByaR6rX+jD1XQ7QtMGa0cKFO79rL/SZm2mnxJyxTWQLwLhNCdxCRmwb3sNDDWZcSc8cf60LjmFyUWT5Yrjs4pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR13MB6227
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: BW_Tu-MT1CPv6FMDwHd4roloGb5Ye7hu
X-Authority-Analysis: v=2.4 cv=Mblsu4/f c=1 sm=1 tr=0 ts=689122a2 cx=c_pps a=xvwQcxOyB39F00Ilg3n1Ug==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=xR56lInIT_wA:10 a=vugxpd_pAAAA:8 a=jJrOw3FHAAAA:8 a=y5Yq1ZyPAAAA:8 a=z6gsHLkEAAAA:8 a=VwQbUJbxAAAA:8 a=WvloUR9mahz8QPqqLU4A:9 a=QEXdDO2ut3YA:10 a=25paI02-nAkA:10 a=dlIDbnWlQMEhdIxAeUMX:22
 a=PoVUXeey_BepnEeCpHdp:22
X-Proofpoint-ORIG-GUID: BW_Tu-MT1CPv6FMDwHd4roloGb5Ye7hu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDEyOCBTYWx0ZWRfX7MfxW2mtclkr 0/OMjcX6tKBR7x7nw575m7E/SnNeqxYJGwMY85B8sOJaUQ4SVULvWSUM8JplA02r1zZjHNfMDNX WMzItr0GNfQAhsbwIk1fOCsaC2T1QqG62eTPLQgn93KNsp5fg/WLSh4qCkIYQMQeCEy0rrlUTwN
 ghkzGdhcM0lMRmoucJD/GOhMH9WyOwHk76ujV/960FLteqsbj9PyiwsQW8+Jiw10QyKUsJowVbG IHFN6vxodIwpoelZkgRxdwFnEujzJbonMRWH1wJ3vtrIn/OZktEaiV1F3DHgHcOVlxTvVm+mqy8 0bJ3F2CthshYlzqj9HTZ4HEiHBwqVMmBmxU++9NAw4Z9XPFMObYYBopSiEJcupR31cO39tluGRx
 639N9shiK+zP+QWlsBHFVG6Ah0UMjBHypyfN/ElTBRs6+fwK4rVLEz3BrvQ9AFvo+YafiWPT
X-Sony-Outbound-GUID: BW_Tu-MT1CPv6FMDwHd4roloGb5Ye7hu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_09,2025-08-04_01,2025-03-28_01



> -----Original Message-----
> From: Rob Landley <rob@landley.net>
> Sent: Monday, August 4, 2025 12:06 PM
> To: Bird, Tim <Tim.Bird@sony.com>; Linux Embedded <linux-embedded@vger.ke=
rnel.org>
> Subject: Re: [boot-time] New page for tracking boot-time activities
>=20
> On 6/19/25 14:=E2=80=8A06, Bird, Tim wrote: > Hey kernel boot-time develo=
pers, > > This month, I'm replacing our regular Boot-time SIG meeting
> (which normally > happens on the 4th Tuesday of every month), with a Bird=
s-of-a-Feather (BoF) >
>=20
> On 6/19/25 14:06, Bird, Tim wrote:
> > Hey kernel boot-time developers,
> >
> > This month, I'm replacing our regular Boot-time SIG meeting (which norm=
ally
> > happens on the 4th Tuesday of every month), with a Birds-of-a-Feather (=
BoF)
> > session at Open Source Summit North America, as part of the Embedded
> > Linux Conference track.
> >
> > Tthe BOF is Tuesday, June 24.
> > See here for session details: https://ossna2025.sched.com/event/1zfle?i=
frame=3Dno
>=20
> Was there a recording or minutes of this meeting for those who couldn't
> attend?

Here a link to a recording of this session:
https://youtu.be/qcotfSsrtnk

 -- Tim

