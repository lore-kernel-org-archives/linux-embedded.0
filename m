Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C25A1AAA1D
	for <linux-embedded@vger.kernel.org>; Tue,  7 Jan 2025 22:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736288832; cv=fail; b=jAK6YB3jT0XfftmLW1br0n6LMxz1KhPs3DBQmm33f52kgSoKxGIhBGT1G94dMeYJDmppW5WNI1gduPQia88o9AdyklAvkdk5reuCxwwmB8htvCk/+eUrV7pgRnHiHK85+uHanWwXt4E9XPHYOWmbOlsQEIDy85iFUg7CRxsvhss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736288832; c=relaxed/simple;
	bh=OBWCOSBhDZRc21kbHEGbdBcNtlumn+xz1QkZ3pH//X4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f3EyvbEz29T6yBa/PDnwP/HSpSeey4O03rNlp8NKPZSQtLaCybKy0FXeJETuHowWpT6cna0it4KsYQtMVuV6FjuFlfytveMZeijzFkb0UiEHBcK7pHTB9Ry8NZyDhIWJ6i/STqc0SvouaDdilv08+3mjfF6yDk6+NXOXRe/cATU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=V/8pr7e5; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="V/8pr7e5"
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507LbKms016353;
	Tue, 7 Jan 2025 21:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=OBWCOSB
	hDZRc21kbHEGbdBcNtlumn+xz1QkZ3pH//X4=; b=V/8pr7e56Y38I/h7M+NPsmS
	k5uslOZD5cjBuEsKHG7TaWQPTk32W+zZkyomcsBCf5iA0MWILzGW299WLwLewq6V
	KlGRFfPOG7eRvsYucIP+gW6dV9BpqPrEKaxbqPUUfxuuAqhnJEJ+yH4o+J7aDjYi
	VVOPSB17vWrbBQ/kpUSKSuAe4Pfm2SzGOcGz6Z2yPTNy3Ml7FGIi8zbaVAV0L2EQ
	0j3dMmCNdEYCvZxBbGdfoeyHsY2V9bra2piln8fE+yuPzueVV+WLpBTGiFrxFMRQ
	hEAIaiPLICdexVYBLjggDnEXCHu2d4wGTlJfX8Bp2cqagbmwgK7M0DSnlb0AkQA=
	=
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 43xuj32rtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 07 Jan 2025 21:42:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXVJ8vFzv6zdJ/PRgG46yaLQ69NZ0icI/wcTA53tZvErYy4bfLNX9GapC3BWNuDEQxvussqEOwr/rCr1sUAr9f02hLJrasICXSVFuNyv3jcvGLKMa9cANpvQMjyofmV7WEEcyXf00a+FRVqvLGS+bn67w8Xacq90I/tYG/lazZsXBkmuZ/kbmGuUkWTgGHsh2Pfg/dC3irgLxEGoh509XMNYIjC2Wheb31lCAuuuoN2GRwAjs5Ahlg5y0Uz6Ux3tAKoT2kOJpkQ3BVImcXBZrAP4YRiMNG0lxnLwc4xBEpHKtC4X9WFDeB3bMHxcAmb8vmsHDs42SNBuKm4hH9+vPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBWCOSBhDZRc21kbHEGbdBcNtlumn+xz1QkZ3pH//X4=;
 b=ldQRmtvikzd24GfK8GK3U63+2HreK+2t1SbFmfIHjClVxGSBRqMXweVfe1b7kaGCyAmIYwPYLOPcESO/H7K30A84z95dR01KBV7widKzHb/+Mjm3G5BziDV97yHM6CUzQD5aqQLWmcYZVnA9LXOimZbfM3uhhXrAu/lgzcWAwjZbtfMM3z6HtQ5+PpkXW27O9QrFD9nrE4PIzTuuIohCo8W/Yj/KOAez3WpDzbmz8P9preCys8siXoOXWeSM/uuThVac9ys1ohCOQ8pmNXW7MFJS9PG8MMeeF2vzTRZMKej1UAsr8urowUv+5CeQspCcHDRs3Ms13FaTbg5LjZsTTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by CO1PR13MB4951.namprd13.prod.outlook.com (2603:10b6:303:f2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 21:42:21 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 21:42:21 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Francesco Valla <francesco@valla.it>,
        Stephan Mueller
	<smueller@chronox.de>,
        Shankari <beingcap11@gmail.com>
CC: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: boot markers ideas (was RE: [boot-time] jent_mod_init on beagleplay)
Thread-Topic: boot markers ideas (was RE: [boot-time] jent_mod_init on
 beagleplay)
Thread-Index: AQHbYU0IJhr5sGKZx0+nM1iQXB2wlg==
Date: Tue, 7 Jan 2025 21:42:21 +0000
Message-ID:
 <MW5PR13MB5632780514DC36D18EE9AC33FD112@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <1964175.7Z3S40VBb9@fedora.fritz.box>
 <4095066.UUX0tPYDPe@tauon.atsec.com>
 <CAORPcfUfgNnQb6m0baW9qEGnrGYsnbpvwUUmF5Y9Byh9_iMAZw@mail.gmail.com>
 <22372644.4csPzL39Zc@fedora.fritz.box>
In-Reply-To: <22372644.4csPzL39Zc@fedora.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|CO1PR13MB4951:EE_
x-ms-office365-filtering-correlation-id: bc60ff02-9efb-4b3f-573c-08dd2f642abd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NmFYdnVSRytKWm1ieGFTYUNHdFVHb2JhRkNRMEl3RDhQekNaREtRS1VnZDd0?=
 =?utf-8?B?WGtSdHdzMlVWQldaMEVUY0lWZS9nbnRvMlZ6eWtZTVZGTTJnYmdZZDFtSWIz?=
 =?utf-8?B?U2RLVGZ4bFkzdW04cXoxTW1QRWFOQ01GTnNtckVyWlFmRW5XcmQ2NmczdXB1?=
 =?utf-8?B?QWgrU3AzRlVJOVhBUklKVE1JTDhzRktzQWZqOTFpOFpneDhMTFZGY043STQ0?=
 =?utf-8?B?cWcxSVZQVGpSaGJubVZ0Ti95K2t2aStjcmtwcjlsek92WW9Cd1dDS1VFYW5i?=
 =?utf-8?B?U1plU2oxUURpYU1HNjNSdkl1WnA4c01Eb2xKMTIzZkc3bmpVZ2hkZVB0RkVL?=
 =?utf-8?B?Mk5Bb1EvcExrWjBGTi9zN0N1SHdTN2ltRXJtd1d3bElWTjZ3UWd4QkU3VUZO?=
 =?utf-8?B?ZzB4TmpDWldSREEzSDNuNEd3SFM5aE1ET2V0SS85RzAvNmlKRkNpUkx5eFcx?=
 =?utf-8?B?YmtrYi8reGtRVk5nLzMxM3YxNmhYbXB2bi9udStzRitrNGN2cWgydkZ2N2N3?=
 =?utf-8?B?TzhpbG0xSEE0d0JuM2hJQ1BNdnVvc1ZuclluQ2FCMUlQVmJIUlh6MTVKYnNH?=
 =?utf-8?B?dWJadkx5dE5RMVNaU3lwNkZuRzJzM3d4aFlUSW1VT0ZSVlBWbnZsWFFLcGdq?=
 =?utf-8?B?YThBcERVNlJCUitINVM4RDZ3YzNoVEJ0Mm80VW1pdDFsK29QL1QzemNWVjZm?=
 =?utf-8?B?OUF2MDhFRXhzMW5mWk1NR1g3d2oyQnBodmJ5bGZlNGszeDNGMVUxb3RGMm02?=
 =?utf-8?B?WjkyUENabEU1Mkp3aCtTSGZnalRQVXZIeUhWVUt5emZWTXFzTm8xbjV4RjZZ?=
 =?utf-8?B?SWkwSzBobzhvWmJQVW9KVnZ0dFpSUjdFQTlMaXdMdi84REdXY1NKSVV2U3Q5?=
 =?utf-8?B?cHp3eWdnL0czenRyb1RqYjhBT1pCUzVqNmZJbW5lRGlIRG44dEo2aXh4NDFM?=
 =?utf-8?B?L0RRaVpiOXRnNWZ6ZW9MdStvNzljTGIyR1pJTzJvcnhFSnpBSnpZSDZUUEY0?=
 =?utf-8?B?RGQzS1puNFhvM283R0tCVzhnamQxWnVQYlRsOTdrTFZEMVpDUXVVS1NKK2dq?=
 =?utf-8?B?ZzNhdDlIT0lSSSs0UEljMG90azA0K0lkSWZmRnZ0MnF3ZDlOaU8xSHRIWHFs?=
 =?utf-8?B?U2d2ZkNaL3BFRVVmS29TK01DODQ0ZDg4V1h6Z2xyczR4UThCbE1UN2x5V0sx?=
 =?utf-8?B?Q0ZLdHRwNDhYVXFEYnZ2bm9FNUpjcEVqUVB6aG5aZHNWUEYwWWYvclFVTzNq?=
 =?utf-8?B?dlJPbFJURjlnNFgxTEhUM3c4Vm1YeGFaWTJyZlpoRjd5NEg4elBtSFB0K2ZW?=
 =?utf-8?B?Vy9kTXFSUW43bEUxWnBDazRHZ3dyeHY5OWVBbTNoSUZkY2JoTklKVEtYTGF5?=
 =?utf-8?B?ckVYRitHSCt6TlJVR0ozVUtQVExkSzIyZ3ZhNEVQTEMrWG00clBmNzNYbyt5?=
 =?utf-8?B?ZTE1OFdzSzYxUFQyaFRjWGhTYmpxN2htbm00em5lZ3I1d1NtSlI4dUZid05B?=
 =?utf-8?B?R2NIczBCdDNsZncwZlkycFpHbmhRQk9FUDV4TXFtK0o2OER3aVU0SU1wcG94?=
 =?utf-8?B?ZWFmSFo0eU8ydW41bjUwVlRjRGxNSktvbmoxRlJnK09JVmdpaktoT0pOdHpT?=
 =?utf-8?B?dFJwL2lUTXpFNW40NG85K0czL3JTSFBuUUJWcjVYU1dMRnZOL3JTOTV2dFJY?=
 =?utf-8?B?ZzhLN3lhcW41Y25BSTI5cnBGTjg1cjBkbEpjbGduS1QycnZpaXFuclU4TzRT?=
 =?utf-8?B?b25pQWczRjhzRnJzaWt4anE2RUFSRFlJYXVxS0tNUCttZW83MzZXOGNmZXBj?=
 =?utf-8?B?UW11QjhZM3BXdFQ3VDNVbU5zYWpBRkU3dmtnSXp3clFNUlppb1JhZVE4dUdr?=
 =?utf-8?B?U0pEdlZMYXNzZlB6QlRXSElLTlAwNk5DSnp5WkdUazI1ei9iejZHSWt3dXZj?=
 =?utf-8?Q?Rm/9+3ftkTC/t9qif81+6qmGR2Ybtftf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2w1MmcvSnNDUDdFTkF1UWlrVEp6MDdxdEFwVXpjVlJEK3ZUWU9hRVBmemJT?=
 =?utf-8?B?ZUR5ODU5Z0JVdWg0YnhUa0pxdWxFRzhVVll1VmVlWmRSSkVlTUk3Y2s5VGEz?=
 =?utf-8?B?KzllMU5ZOUN4N3J1Uk1EL1lWQkNGR3hTajhmU0kxamUvNC9ISHNscTd1R3Fh?=
 =?utf-8?B?c21ueXg3aEpWcVNiclp4b21nZlB0cUp3ZVM4RG1ta1J1Y2RXS1BoaXA3ek02?=
 =?utf-8?B?K3Jub0ZuNUlnSDdtZGx2K0xoc2xYODJzTEVIVkljVHBkZmtSNUdPMGJvb0ov?=
 =?utf-8?B?MksxaDYyVTVmWExEdy9ES2JPYnlLRWxJTEdHem5FRmNhbHhCNjFnaTJ5RElY?=
 =?utf-8?B?TDJON0I0ekJPYStzbUdqOERodVZOcmZDZkFvOERvbG0zYmttTmdUR1dmd0h5?=
 =?utf-8?B?dXdJOTU5MktlT2pmZjEvRkxlaHZkRlJURmprSmtPQ3g5VVZGVi9aR2VyOFRW?=
 =?utf-8?B?TjBmY2NYUVZXbjdkeEFRNDJLUnJZbFhobFBONDQxUWxFVU5SalhZOGRwVVp3?=
 =?utf-8?B?Q0NnQmhmS2lSMDBDa0pwM1IvbVc2WEcxd3l2MTVVVGVFd2dBY0Jid3o3blQ0?=
 =?utf-8?B?T0wvLytVc3JaVEczRG5rVjZPSnlIbmp3ZDBHTy9VZTlYMVBhaEd6MmlYQ2lp?=
 =?utf-8?B?Y2dBckkxNXFRZlRIZEJXQjJSMUJ6aEdYWUYwMWUwVklnaWxXUll1R3lZdHl4?=
 =?utf-8?B?Z0dCVVprZVltWVB2dEIvbmZSMS9mWCtsMXdvdWtyS3JsM1FBYTluTEEyUWxs?=
 =?utf-8?B?d0czeXgxeFI2djBKUm9vYXppQW0xdDEzMDdDWmdVL1lsMmRTTGdIQU1MeEZF?=
 =?utf-8?B?REZGYXRSTXJSVWJyUWVEdTRRQXVMeUpDS3Nrdzcydk42SWtKNTE4V1dUTHhS?=
 =?utf-8?B?ejJEV21KNlRLSFF2cVdFZWhHNnh5Y0xEOTQ4eHBxY0xkZURDTU9JN0pieHpy?=
 =?utf-8?B?ZEZVRVdRMVVwcFJrZEM0MysxWlh0dHpKRk9FNUh0ZnVuclFsTmNPZWtvRzEw?=
 =?utf-8?B?R1ZYWHZtN0lPOVIrdEhMUjNzTDRvYkFyRTg0V1dqaGZUTUE3elgzYzljdzZ1?=
 =?utf-8?B?WmEzOWNTdTRhbk9ZbUFxK0libHFqcHh2RExIY25uNmYwbktuN2FyYTUvY0Mv?=
 =?utf-8?B?aUxKeUp2WldkS2hBMk5TOGxPb3IvQW1OSmNZVnJkdUl3Qkk0TW1xcElrYWts?=
 =?utf-8?B?a0w4SXhJcWVZdFkzSjA3cXoyWFN4Vy9ScldlazdKMUhsa25UZUUzRlY0SzY1?=
 =?utf-8?B?bzZOd3IvWlE4VnFsZHptRmtscEE2RERGMUZ3M3p4Q3lvMjRNcU4wQkdGaWI4?=
 =?utf-8?B?TUVaanNqK3VUWlJENWRqV3dic1BrcUNML3NWaEgxVDJRWGtzMzhrMmQ2L2U1?=
 =?utf-8?B?cEM3eXVINWZxTEp4S0lDaSt6bVR6RHV3V3RHR3JYeU44ZjUrQUVjaFVyZU1z?=
 =?utf-8?B?RVcvUmxmaXZ5WUhFaFhZS3EzdEYxNXErQmJkaUJOZE9BWnNlYjVYNjlPSnlh?=
 =?utf-8?B?UWdkYnptTWpwNmxMQ3cwMzkxcU1KbGRKUFVFOUsyUTlnMm9laHlUS3pQbytW?=
 =?utf-8?B?ajYvR3hkRmozWFFVb1laUHVpd3EzcXN0T0IwcFp5VVk2T3BWVmhkY09hc200?=
 =?utf-8?B?U0pRWlJFMmhHTmViN2hzZDFZVGk4NmdmSDBydTZwd1luNE5jVHpJbzkybGUw?=
 =?utf-8?B?WXlNeFUrNFJPYnU2V0VaeVdXbUR4d3dnOFkzaG1ma20yWjYzWnRYT1c3Ukxv?=
 =?utf-8?B?c08vbEtvaWtkcVQ0S3hTT2lnRlhkV3pKaGNKRng1N2RqOEduWWQ5a0hPdy82?=
 =?utf-8?B?K3JsZmkrVTM4cmZqTWwyYkdnMjBIc2pZalZVN3JibnVtaEhSU0RnTU1EWHM4?=
 =?utf-8?B?TmdhN0NOemNpUVprZU5xLzBLcXZiZ0lpSkRKdERJWFJvekZrMzdpUmFpTW5B?=
 =?utf-8?B?L24vWnlBK05LU1ZYOGc3SkM4eTRCY3BmWGRwakZ3YS9sdklmZUNONkFLQzRr?=
 =?utf-8?B?WEEveHkwcnJ6eHZJdkI5REZFcFF2THdvK0JyT3Bvbk12NWZoUjRaR3FkV08x?=
 =?utf-8?B?T1FwYm9lZyt6Mm0vMmt3NkhUaVc4aTBpaTFkazBvQnVJVDJUUFVXVjRHeGVr?=
 =?utf-8?Q?D/YU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9sK/PkyeQVsz/meuM7ItZVR/9oNYv9e9B/rsJP+cRe1Zm6MtswCwS3hz8p1oi7OxG42lWVOtIge4AGcUQo+A4XEbkUcPWo6MJ8GCPdEIlXvMDVEwsFKLwpaym+BKAIEfo5ESX/D1bTreh1dTkdsIgMY21jV+02W4iStoXfBN0EbQONqie44JaNxg7D0oBn+hIrC1ypPPZClOoJ/6tPDq5SqjQsIiF1Q6IEmgjAo6ZJrwTlx3QM/LqR0/QoOKY3SuJI9yUkOtjbUHcy0Yy/Cm1ZvMeFUeFvzZgP9iYQrveAMIRm5q5YLXhpNJmoSGNQLUsGFkHWns7ZpY2R0fUmVM+BVKtRzrN0NBLzpANtXwJK0RkV5ZxUd8c1912Y+1FVaM3x+buMIEqvlFBGlIV+Xge5mIAGmlbj0Q86FluhltBZZuO1ddCN1HfErJYJxvXQcRr5AuBIX/jqdmP3CNQOeXErjE7Z+/3arEGJIo0CqS2lLu6hwNVBg9i27AnHxh50A3Q30s2oCHlpV6PzUfMdxfWxuyR/R6W7QsEaZmTUZ0Lf4FUpD1AvYr5xHztxzLVezJdSmFGAAgCo3PjP2/j+ICtgy2W4RkcOODgn1X9IRUqO0wqMfEx4G3+n9uHALkEQ2V
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc60ff02-9efb-4b3f-573c-08dd2f642abd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 21:42:21.6161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Jm+NNY8pN6ZolUG1TFEE9Pbl7K5ahpYsPiIElUfth9XOysu0bl2v19WyCqF8ypAQrWiS5WDnuLL1N2Z2qz6ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR13MB4951
X-Proofpoint-ORIG-GUID: YnbuO4B2bEwUYOH2dTlABA4KYIN84cFV
X-Proofpoint-GUID: YnbuO4B2bEwUYOH2dTlABA4KYIN84cFV
X-Sony-Outbound-GUID: YnbuO4B2bEwUYOH2dTlABA4KYIN84cFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_06,2025-01-06_02,2024-11-22_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRnJhbmNlc2NvIFZhbGxh
IDxmcmFuY2VzY29AdmFsbGEuaXQ+DQouLi4NCj4gPiBJIHdhbnRlZCB0byBwcm92aWRlIGFuIHVw
ZGF0ZSBvbiBteSByZWNlbnQgY29udHJpYnV0aW9ucyB0byB0aGUgQmVhZ2xlUGxheQ0KPiA+IHBy
b2plY3QuIEkgaGF2ZSByZWNlbnRseSBzdGFydGVkIGNvbnRyaWJ1dGluZyBhbmQgaGF2ZSBiZWVu
IGFuYWx5emluZyB0aGUNCj4gPiBib290IHRpbWUgb2YgdGhlIGluaXQgcHJvY2Vzcy4gQmVsb3cg
aXMgdGhlIG91dHB1dCBmcm9tIHRoZSBzeXN0ZW0gbG9nOg0KPiA+DQo+ID4gZGViaWFuQEJlYWds
ZVBsYXk6fiQgZG1lc2cgfCBncmVwICJpbml0IHByb2Nlc3MiDQo+ID4gWyAgICAxLjQ4MDQ5MF0g
UnVuIC9pbml0IGFzIGluaXQgcHJvY2Vzcw0KPiA+DQouLi4NCg0KPiANCj4gSSBzdGFydGVkIHRo
ZSBzYW1lIGpvdXJuZXkgYXJvdW5kIGEgd2VlayBhZ28sIGFuZCBpdCdzIHByb3ZpbmcgYSB2YWx1
YWJsZQ0KPiBleHBlcmllbmNlLg0KPiANCj4gQWZ0ZXIgc29tZSB0cmltbWluZywgSSByZWFjaGVk
IGEgKHJlcG9ydGVkKSBpbml0IHN0YXJ0dXAgdGltZSBvZiBhcm91bmQgMC42czoNCj4gDQo+IHJv
b3RAYmVhZ2xlcGxheS10aTp+IyBkbWVzZ3xncmVwIC9zYmluDQo+IFsgICAgMC42MzAwNDZdIFJ1
biAvc2Jpbi9pbml0IGFzIGluaXQgcHJvY2Vzcw0KDQoNCkknbSBzdGFydGluZyB0byB0aGluayB0
aGF0IHdlIHNob3VsZCBiZSB1c2luZyB0aGlzIHBhcnRpY3VsYXIga2VybmVsIG1lc3NhZ2UNCmFz
IGEgY29uc2lzdGVudCAiYm9vdCBtYXJrZXIiIGZvciBrZXJuZWwgc3RhcnR1cCB0aW1lLiAgSXQn
cyBjZXJ0YWlubHkgbm90IHRoZQ0KZW5kIG9mIHdoZW4gdGhlIGtlcm5lbCBpcyBkb2luZyBzdHVm
ZiBvbiBzdGFydHVwLCBidXQgSSBkbyBiZWxpZXZlIGl0IG1hcmtzDQpvbmUgb2YgdGhlIGltcG9y
dGFudCB0cmFuc2l0aW9uIHBvaW50cyAoc3RhcnQgb2YgdXNlciBzcGFjZSBhY3Rpdml0eSksIGFu
ZA0KaXQgc2VlbXMgdG8gYmUgdWJpcXVpdG91c2x5IHJlcG9ydGVkLg0KDQpBdCBQbHVtYmVycywg
SSBoYWQgcHJvcG9zZWQgdG8gaW50cm9kdWNlIGEgc2V0IG9mIHNwZWNpZmljIGluc3RydW1lbnRh
dGlvbg0KcG9pbnRzIGluIHRoZSBrZXJuZWwgYW5kIHVzZSB0aG9zZSBhcyBrZXkgY2hlY2twb2lu
dHMuICBCdXQgSU1ITyBpdCdzIGdvb2QNCnRvIHVzZSBleGlzdGluZyBwcmludGsgbWVzc2FnZXMg
d2hlcmUgcG9zc2libGUsIHNpbmNlIHRoZXkncmUgYWxyZWFkeSBwcmVzZW50IC0gbm8NCmFkZGl0
aW9uYWwgaW5zdHJ1bWVudGF0aW9uIG5lZWRlZC4NCg0KSSdtIGdvaW5nIHRvIGRvIHNvbWUgYWRk
aXRpb25hbCByZXNlYXJjaCBvbiBob3cgY29uc2lzdGVudGx5IG90aGVyIHByaW50ayBzdHJpbmdz
DQpzaG93IHVwIGluIGRtZXNnIGJvb3QgcmVwb3J0cywgdG8gc2VlIGlmIHRoZXJlIGFyZSBzb21l
IG90aGVyIHN0cmluZ3MNCnRoYXQgY2FuIGJlIHVzZWQgYSBib290IG1hcmtlcnMsIG9yIGlmIGl0
IHdvdWxkIHN0aWxsIG1ha2Ugc2Vuc2UgdG8gaW50cm9kdWNlIHNvbWUuDQpJIHRoaW5rIGEgYm9v
dCBtYXJrZXIgZm9yIHRoZSBzdGFydCBvZiBlYWNoIGluaXRjYWxsIHBoYXNlIGlzIHByb2JhYmx5
IHVzZWZ1bC4NCg0KVGhhbmtzIGZvciB0aGVzZSByZXBvcnRzIG9mIHRoZSB0aW1lc3RhbXBzIGZv
ciB0aGUgImluaXQgcHJvY2VzcyIgc3RyaW5ncy4NCiAtLSBUaW0NCg==
