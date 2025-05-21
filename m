Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF0B1DE8B6
	for <linux-embedded@vger.kernel.org>; Wed, 21 May 2025 20:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747860444; cv=fail; b=LB4fuPR9PGxtzVtAJGYMgUULdr/YA5o5JBK9a3zSUkFy5TULcIhGseMVQc7/qB9IeXQvVY3IY0A7ZF51MPFERnK66tJBlxcibQg+cW8SNJBAnsbNzunRdZQG6dKdI0kT+edIN9fUcNuhVzpxAcrhRG23Z/wGqjUc8SFTwxVMa1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747860444; c=relaxed/simple;
	bh=mCorhza+yDQ9iYNWlDRcm9kc381peilTKyaWaR3b4u8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nTz5YcNOClUUKDWxEJST93L6UxlnTcZu6+UtJSu7W43oEC+olTR6kOsUkoZvl+1UZ2toN7pOb9kBVajXVTDSJIuDvgXedtgDMc+Bpz8wTGImJ/3yXSi/XoJVs2Xo/fA02cedkl7ZGCiUMeVM2y4JETZ9pUIwdVavu3Ap2wr3RYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=kGq5ANjm; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="kGq5ANjm"
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LKIGA6001102;
	Wed, 21 May 2025 20:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=mCorhza
	+yDQ9iYNWlDRcm9kc381peilTKyaWaR3b4u8=; b=kGq5ANjmIBcGivFsim+U3+2
	LXt/2dAnMJC3F9j2jkmz6iklb9YLjCpW2If0aw79QYK23l2MuPiRYvmNv6nbvMn5
	NIc8RldrKXi0NNhQ3/Fze3UtLr8U3PymkIxYNjgaukpGMMNjcCj/PjNMlDzp3yk9
	lcdDDflsC9sTdzggqtB7HX0DccXTSSmfUtnlsdV+fvCHfIrvSWY/yE75xn5n+P/D
	UICgSWzYRyiGHmlTVxtrwDnAgkjN2GX09KzDOo8O6Lvk93fHEgE/evLgOdL3MCic
	uYEGl0//xaVZQqaIr2UUJ4S9f0F6GW1ykVgwfyp8vOtJaYsyJo2d9TywCc/tfFA=
	=
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 46rwgx14bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 20:47:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m58dQ4WxJN/Logj56ynxFmS+LCyRpoti2zWRoNlAHp8T4nlB23YO2FKKsse7wKIhqbQrbEC7kcMlojguymHWxTXc+m4FDN/7r6tp5ZxvEshQzM8E6N/5BCDIPErqfNs2031EiV8Hgh+r2BD7eikC3d2YNMDPvmyli1iiChFd9sueJekdUMNukLpDqwzBuhyWXP6FjgHNXu6mX9YfSP1O25QBbjB6t338fhCg/lHbrO/h1GFH5D+nqOkq+QSiNNm4pFn4m1vzqqZEiVlS7Q6PSgcZs+gQ5kD8fuLLmsU7YW9Hir2HH1e4t4xCf4/w7Y/gl3D54XlDDvmvvMU35VWjWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCorhza+yDQ9iYNWlDRcm9kc381peilTKyaWaR3b4u8=;
 b=WAddrNXpRGsoIbIsQibO/HCvWR/jnOGeCJlpMJM+IYj7jMrPm5BpyaolK0pU1vFtpwNlArE7eT2qSN93uZ5EynI/nYXJRQ/s9HEM3IJ/OR6FDfYXCnqdWGBqxE5v87PcIuHg8j5oiM4B01b6641YPUlvV8rYxKcOkrIG2TtD+K1G+LDPVaeNz23HPRHzHrfcypXINh/ZlZyRlUIHEp+P2hFAFY9rMcnWv2P5J0o5bPXqGaTu2vWF1HBflE0tXP72vm15zmbsgttgx/RdNtOvxeg6bznmNxwivlAEOs6KZ2djaPlNYYjJclOBsyL3hGRStqUsCJUlaTRB5WBxf4LRjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by CO6PR13MB6048.namprd13.prod.outlook.com (2603:10b6:303:14f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Wed, 21 May
 2025 20:47:07 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 20:47:06 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Saravana Kannan <saravanak@google.com>
CC: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: RE: [boot-time] Unified Boot Log - special topic call for Boot-Time
 SIG (meeting announcement)
Thread-Topic: [boot-time] Unified Boot Log - special topic call for Boot-Time
 SIG (meeting announcement)
Thread-Index: AdvI1ps725/tFCwOTFW4FBYefrI1AgBEYusAACpEKgA=
Date: Wed, 21 May 2025 20:47:06 +0000
Message-ID:
 <MW5PR13MB56320C5883FEC27C49C7F296FD9EA@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <MW5PR13MB5632B8FA3279D77F2F9217BBFD9CA@MW5PR13MB5632.namprd13.prod.outlook.com>
 <CAGETcx9S2nyz00G3fq1taz9QEshpTPmaUX_+=FyHzzj--ELEXg@mail.gmail.com>
In-Reply-To:
 <CAGETcx9S2nyz00G3fq1taz9QEshpTPmaUX_+=FyHzzj--ELEXg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|CO6PR13MB6048:EE_
x-ms-office365-filtering-correlation-id: 9a76140f-002c-49e9-9eee-08dd98a8a63f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RXZYRWRVNnVrdXRRTG9pRjJIYmRkZHhPOGJYQkpJV0dwNFVSWWgzeEk0RzBo?=
 =?utf-8?B?aW1MU0xQMnBWS2F5MGhzbWs3S0FnWTVWNmN1QmVIZ1pBd3hJcUVQS1hxbzhS?=
 =?utf-8?B?TG1WbTVlOXBUTGl4YURJMmtkMWtnNzZGWThYcjRBVXhUbFpENDNIcnFKb0hV?=
 =?utf-8?B?cE1nODdyQU9PZG1CaVVsUHBFVE9TUW5iaDJoa0t1T0IzaEt1SnhlazViWURl?=
 =?utf-8?B?YWM5MGJLWlpLQ1VUUkk2U0h2SDZiMkdBTVZKUDhPNkN1SUNhSlViR2dVeVpp?=
 =?utf-8?B?VTJRTTl1ajNDQURLVzBhZ0JvV1J3U2g5ekNibnNIMWxDd08wdWE4eW9oWk83?=
 =?utf-8?B?QUM2aVRpZGlxcE9DUnc1SzkvN0U5c09UZyt0aTFDWHZkYWFsUlJyekRmOWov?=
 =?utf-8?B?SCtxWk5mUURFYS9IbkZqRUFlOEEybFFKVkk5Smo3ODZkV0dmZE5BbFpsSXE1?=
 =?utf-8?B?dWhWRjZ6dkwwYTZmVzVIZ2VqMGFoZUFDQTFBM1N5U1UrRFRkQXlablpWOEtp?=
 =?utf-8?B?OFdpNzNTQnUxYThzNm5BUldhNjJVN0EzdHFXMEJheGxEK3ViVEkyVmpjeU1x?=
 =?utf-8?B?U0pzS0IvL0Q5cVJrTVd4SVlVS1BuYWI0QjFXUFJheUhrcHR3dENTUWExSXd5?=
 =?utf-8?B?c2czZHpiMWoxMTFyRVd6bFM3NzdvTFJEM25OU2JDc3ZpeXRxS1lFWWpiYnlB?=
 =?utf-8?B?aTBaNTRJSHlzdWhxSGsxRUNzUXpBYmx4cHhuRU9OM3NIU2w3T3dhc2RtTS95?=
 =?utf-8?B?dUhmSTg0MXJ0VkExQVFaVWNoSTRRUmRjNVZ6cW9lOVNtRDNiY0lqVWZHY1FL?=
 =?utf-8?B?Z1BYZC94K0xpVU5lblVacU1ZQzYra0VLejdRTVRRYlo3OUdPcUMrV3doZGFh?=
 =?utf-8?B?eTZVNjJFNkFJbkNKQmswbi9wU0dYWlNUeDJyVm55R1R6eUlwZ1lFK0tzMEcx?=
 =?utf-8?B?YTBOclBtZldHem5xNEZJdkNSRVYwQWc5N1lFcU1OekV1ZncxNUpCMGVGMmp2?=
 =?utf-8?B?MDg5MTRXa0NsaVYra3J1MDdEbytjeWpjN0p0QzdhMEhaazJWMGtjSlFqcjhs?=
 =?utf-8?B?RFZ1bkxjeFkyWGQ4RHdjV3ErQ21aUXd2NlcvVWU2L1BvSDVBWnczMDBKeFhq?=
 =?utf-8?B?Z3N4TnRnSktEZWZKeTcrYVNoZGYrWmVIVFRYS284V3Q3RkVIVFZQL25TN1hQ?=
 =?utf-8?B?ZW5ONjRDczVwU0dJSkZFRnNzeVZ1aFZ3djZOUWxsSUxWWGZzN2FaQnA4bEVh?=
 =?utf-8?B?cjh6eldnNVQ2NjJQNG5TcmdlQkdXcndyclp0bzZNK1VLSzNJbDdiQ0VTMnVi?=
 =?utf-8?B?SWlDNDZBRjhlNXVLSmt0UnJJYXJIV3hmRlhvRjZKZEhCNVhXd3NZd3BRMWVy?=
 =?utf-8?B?eWJXcWxGZ2hLL3RJSDJtc29UWStsVHdaMEZXWGw0SmhIV2IwV3ZMZnBVMnhI?=
 =?utf-8?B?UjNRakk5RVRiSXhDWCtKTHRBQW9JeVVlUmF6MVJVc3BudVJXRFVPTmQ5a3hX?=
 =?utf-8?B?Qy9GdGFJZW0wR0ZTanp3YzNCdXlBdms1ME55Z0ZMMHlmR0w4eHIzMlhPSFpx?=
 =?utf-8?B?ZERlaHVNYk44OHFJRHQ0UmpGUmdZVGtvc2lqRStudnJuYU9JUVJCV0tyYk1t?=
 =?utf-8?B?Y3MwMnZuVVJENGRvRmtUWTVTNUpwNFMwY0trdyt1ZlU4dWpMeEFvYnRQbVhP?=
 =?utf-8?B?ZXJQdkNrN3lobmlKek9TWGtXVHJqbFBrS0V1c0xsN203OHIwTjZuUEp2anFh?=
 =?utf-8?B?b0YvVFUzc0dHV1p6eVpEb0RLR25IZGNYOXNzMWthNHM4N1ZwaGM1SE5QM3NU?=
 =?utf-8?B?clZNSFhadzA3aFNUamQ5S2hIVktDK1FxaG9STmdvdWRsTldsOEh2WTM4ZTBr?=
 =?utf-8?B?eS8vMnZuRVA2V25GdFUrbjRPZlAvNVFZcVptSkJkaGFJUVQyUXpoRlUwVXNy?=
 =?utf-8?Q?s7hBgLkffYeFeRRSYZOuGecEPoGfIrRm?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K3E1bGQ2ZmVETHN3QUpFZ2tyOThTNU5MQU9SWEUvMFFEV3htQlF4ZnlKT2lo?=
 =?utf-8?B?bkVaaXhNRlVSdGFZbUEzbGJRZ21rbTZneTV1OGtDMXFqV2lVRUFpNW42ZWRy?=
 =?utf-8?B?dVZSQWJXa011YlVaeDhGM1R1SGltSTErUG9VMlpKOXF4d0F6RDFzUmJzbGRo?=
 =?utf-8?B?VkcvcDZ0UGxUQnNXNWpKQml5cGNGWXpMVGl5VVlxSzlEVWlkZ2VnM3c5djJC?=
 =?utf-8?B?TG1KNWhLV1p6MHB1TjFYMmVjQ0RzczdPN3BoMmZUMDBuc0pKRDU1ZzJCOTIy?=
 =?utf-8?B?ditCVGhvL2xLU2ZyQTdEbUVxdGJzYjRYQUpBT1ltdDFia1JCVmI0em9QUTNB?=
 =?utf-8?B?bi9VMzllbFVEUU1RQW8wb29MM29uMmt1THR5bndod3JyWDlPbDNOL1VYQUx3?=
 =?utf-8?B?VDI1dm4vaEhmSVZrWEVNMFZ6cDVjb1dIdVlVSkFUTUdERjVaa045bTBqTkth?=
 =?utf-8?B?UXg3dkY3cDNOWEM5Q2N3YzZ3M3R0WnBZQkNmOXlOM1gyQWRoN3A2VWtFWkEz?=
 =?utf-8?B?cysrWWREcUR2YWw2MmlKbFpwcW10dC9FWk9UdVRiem8xTkRWTk0xNTQ2OUNB?=
 =?utf-8?B?dmtEQVNLNUF5MlFnMkVtbFhNNVVjY1dxejZUNTFmN2Rnelpvc0tNRWpIVGRD?=
 =?utf-8?B?TkpWWXRncHQzU0pMRlM3S2ovOGlZUS9wODVwdEtRK1RKbkdDeFZTMkhqODgz?=
 =?utf-8?B?M0pEQ2hNWmorQVB4MWE0UXk5bUxORWZEeEcrWGhmRG1oaG5iZEhjS3NCVktt?=
 =?utf-8?B?VXVQVWk5TnJ4ZVJkMEVnZitUb3BFRnlYeXQ2QzlZZXN0bWM5MFhJRFc2UmV1?=
 =?utf-8?B?WWJ1VkJNQjROWnBLT0liaWt6TXNmb3pFTWMyTXhRaThIRVVEN0w0VUNnMUo4?=
 =?utf-8?B?YVZXM0Rmcm8xVUFORW9HRTNpVlFVakhQZm1EVU1yYk1oR0tJeEh1U1Rsd3dv?=
 =?utf-8?B?Q2VtZmg3NlVrZ1lWWXpCU3dGZ0tsSEVSNEthR2cxYkkvbjRSQlpIRFdVbzVp?=
 =?utf-8?B?UTJlemN4em5JcVFkNU5obkphT3Vsajl0RzViNnR1cGJaK3ZuTjliK3BTMGdD?=
 =?utf-8?B?WnVsOEpsYnlFSWRXY3MybVdyOG1scktHbVVSY0gweEJtMnRhNmlPSGo4TVRa?=
 =?utf-8?B?Q0JqQ09oQ1VYU1dlSWhaYThDOFNIMXZsRzg4OVhLNDNBbXVzbkdGSEpRNU0z?=
 =?utf-8?B?ZWxVWFBBdVZocG1pdDBOZU9lYTN2K0lNZGFlenFkRjc5VnVld0U0cEdkU0d4?=
 =?utf-8?B?Snh2elkxREc4MGV5QmE4bHRJMnVYV1JDSDU4U2I1R3BLb2tIS3FXYU1sb2o0?=
 =?utf-8?B?RE12YUs4TXo2NW5ydUZSczcyYko0c3JWd1JXTWZzOFBlUEZ4MG9LSjNpT25s?=
 =?utf-8?B?NHdGZjVnekJsRmhWb3ZZaEY4L2Y1M1I1Rk0rR2xtWHBTYjFHeVFNWHFLN3Vw?=
 =?utf-8?B?VzJxS2tDNFg3T2o2MHh3dXVZeDVCeW5jNXNoUzQ0TE5ucWxkZ0RiRkJGYnJI?=
 =?utf-8?B?Y01SQmU0TXkwaGgvN3Q4emlSdHo1bG0xeGFEb1dENHJBMkYrVkhORkpZdFA2?=
 =?utf-8?B?Wlg2ZFFtcUV3MTZKdHhBV3RYSFAvSGxFdEtVbFU0QW9LQTdEaWNQeGlNUU52?=
 =?utf-8?B?ZVA4eVZGbERCZmgxTktFMWhIRW84NFFjK1QvdGYwRW5zQUdpSk1PYzlzR2Ro?=
 =?utf-8?B?TjgxWFNGQUZCNW9mWlUzRzZiTFpQMmJ0V2dFenJmTVhSbGZkeVVsTktpWjNi?=
 =?utf-8?B?V3ZWWlowb01vaTNGL0Jpc0FvTEd2MUJjcnR0aVE4ZlJlOVJ0TDVvQmt5WXor?=
 =?utf-8?B?OEZvODhpNGFJdzQ1NTYwNy8rSkRNWHNYenNDbTh2Vy9ibG5RU3pxeUo2R1Ry?=
 =?utf-8?B?dUZEd2RBM0oyWWN1WHVtMVgrNVdIUFdDVWMySjhXcFRESER2UEh3QnhnOUdU?=
 =?utf-8?B?d0JnRVVwWFZ3UWdDQUYrVm1hcXZqT2phd0dVaDVnYis1eHVwbjVyclAvajFT?=
 =?utf-8?B?aDM5WnZ1T0owOHB5SnRVREZmMStwK0U2bXY0UVVkVlpHN2VJUmVzZ3BQeU1t?=
 =?utf-8?B?NC9VWW53RFU0dlJIeUNSd1Y4K0V3RUwzbkxqMzlwZWNVUFB4VitpVUdhamlk?=
 =?utf-8?Q?OoNs=3D?=
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
	KWV24/MV1GqR/gEkmOeceDVxp4tehVM6d52I9J1d+yWbL4/LYA1HPkWGOf/fQViWJ778+gu3WK7MZSGi2X8uW/aNCBvd3o0/jSA7ahY02Le5h/9jkotWzawPP5hGRZCGy/5Cb6ZZXDlOEGbrm8MN63nwmBS5/nvrX3smRhw407NgU7LKXI+LgbFHNR1wqbBagViq43njzzT2RZo+6gqpJnPLlKFLri/R2pIpgcho+Ahuk8lnZmt2jPp2yKl0lDco/OJoeId8dAUSPNanZwXCcZ9qA7UYH+qy/rRTpMoAxsuVlZuCm2QeuTa8pOgzrsFVEKuu3btFwsX+6iBq0QySXzTsMX75mruWq9WjszB2CW5qL+AY3CgI37A+PzOBz1Ju2d1qXMkeuNWxmEJs1qvk8PfavexIdFTvwGnZmxLAddykByNvmIJm0DiyP0IitntXrd4zCICi9VuadpMzYSokLBCC6Bw16FjAj6I2cSP3WroSzDUDo3SuLQB0w1JgHRoxHfALj5KIoP0NjBC+jYt8JuQ9QE4xgb00u4LUTRieGFy74rMfLuiNV1palMtEfJVeGQgLuUlj8XlwlpFneWpayAiN5M3NsaG4Hlfys5USvfJnMd/6rxOp5Yw1nG5vxSlj
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a76140f-002c-49e9-9eee-08dd98a8a63f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 20:47:06.6875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EqhRL3I+FxoVHfA0MU5KPb5ZENvmuLPzZJa7LA9YayTjt1k3fTlffkK1EcFgSL3dyAW4/o898JDzGDGjulwhDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR13MB6048
X-Proofpoint-GUID: TQh3b66DfXTRgpN8X1tu34T6zrAy15Sf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIwNSBTYWx0ZWRfX9H2Q/9LSfckb RGAfaYKFXyraQd4I2Af3hTbGOsJMnxDGH4WEZGcVPrlBUVSrpYLNe0WypekRHEd9ZI6snLmgJRA 5bc2qpWDkcYrb2FoXdKLZZW2Q0hqsOTlP1asce76HfnUZspS2k/vMK0gsEariGFsPUG3p0YSvdh
 4vxSbxY2XYP80wYaDbkyhIt1Fg7JynbSyUSFVeNmDmkC0bVnsgUnxwoxXYE9UcXM4wP+yYoEq4y QAoq5K0Pnby/S2/2sOduAWoFvoCYmn8kWyzp9fD39sc2RXrKf7nRvpJWjAi4Eavzbmvw4wkPxr4 TcQqxaM2kENXZERTRdiHMC3BiFkbpHyD+ZWPY4JNcxrfT2/Uoo58fTl6cGSTWNyUgffWbQjvfsK
 qjmcYWG+44D6LIH1e1U1CpuI/OTa1uakRd7cw0u8AWoPmHEq+MsPgRviCp/dta55NIu71IZo
X-Authority-Analysis: v=2.4 cv=JbG8rVKV c=1 sm=1 tr=0 ts=682e3bcf cx=c_pps a=4IGGKwhCMA6ph+0beaNuyw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=xR56lInIT_wA:10 a=Xu_aML22AAAA:8 a=nXA5WNwiAAAA:8 a=NiL0GWOVAAAA:8 a=2iSxh-PlAAAA:20 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=1XWaLZrsAAAA:8 a=z6gsHLkEAAAA:8 a=8z-HEmAbjOmwBJK3VHQA:9 a=QEXdDO2ut3YA:10 a=-wH59cBETLoA:10 a=U_XVwcaHIQkA:10
 a=o_LaMfWX3WolavuFUIfu:22 a=fGr-7aqQv4RST94IA8XU:22
X-Proofpoint-ORIG-GUID: TQh3b66DfXTRgpN8X1tu34T6zrAy15Sf
X-Sony-Outbound-GUID: TQh3b66DfXTRgpN8X1tu34T6zrAy15Sf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2FyYXZhbmEgS2FubmFu
IDxzYXJhdmFuYWtAZ29vZ2xlLmNvbT4NCj4gSGkgVGltLA0KPiANCj4gQ291bGQgeW91IHNlbmQg
b3V0IHRoZXNlIHJlbWluZGVycyAyIGRheXMgZWFybGllcj8gSSBhbHdheXMgbWlzcyB0aGVtIGFu
ZCBzZWUgdGhlbSBsYXRlciBpbiB0aGUgZGF5IG9uIFR1ZXNkYXlzIGFuZCByZWdyZXQgbm90IGJl
aW5nIGFibGUgdG8NCj4gYXR0ZW5kIGl0LiBJdCBoYXMgaGFwcGVuZWQgYXQgbGVhc3QgMyB0aW1l
cyBzbyBmYXIuDQoNClllcy4gIEknbGwgdHJ5IHRvIGdldCB0aGVzZSByZW1pbmRlcnMgb3V0IGVh
cmxpZXIuICBJIGFwb2xvZ2l6ZSB0aGVzZSBoYXZlIGJlZW4gc28gbGF0ZS4NCk15IGdvYWwgaXMg
dG8gc2VuZCB0aGUgcmVtaW5kZXIgdGhlIHdlZWsgYmVmb3JlIChsaWtlIFdlZG5lc2RheSBvciBU
aHVyc2RheSksIGJ1dA0KSSB3YXMgdHJhdmVsaW5nIGxhc3Qgd2VlayBhbmQgZ290IGJlaGluZC4N
Cg0KPiANCj4gQW5vdGhlciBvcHRpb24gaXMgdG8gaGF2ZSBzb21lIGNhbGVuZGFyIHRoYXQgcGVv
cGxlIGNvdWxkIHN1YnNjcmliZSB0by4NCkkgc2hvdWxkIGxvb2sgaW50byB0aGF0LiAgTXkgcHJv
Y2VzcyBsZWF2ZXMgc29tZXRoaW5nIHRvIGJlIGRlc2lyZWQuDQoNCkkgYXBwcmVjaWF0ZSB5b3Ug
cmVtaW5kaW5nIG1lIHRvIGltcHJvdmUgbXkgcHJvY2VzcyBoZXJlIQ0KDQpSZWdhcmRzLA0KIC0t
IFRpbQ0KDQoNCj4gT24gTW9uLCBNYXkgMTksIDIwMjUgYXQgOToyM+KAr0FNIEJpcmQsIFRpbSA8
VGltLkJpcmRAc29ueS5jb20gPG1haWx0bzpUaW0uQmlyZEBzb255LmNvbT4gPiB3cm90ZToNCj4g
DQo+IA0KPiAJSGV5IExpbnV4IEJvb3QtVGltZSBTSUcgaW50ZXJlc3RlZCBwYXJ0aWVzIChhbmQg
b3RoZXIgaW50ZXJlc3RlZCBMaW51eCBrZXJuZWwgZGV2ZWxvcGVycyksDQo+IA0KPiAJSGVyZSBp
cyB0aGUgaW5mb3JtYXRpb24gZm9yIHRoZSBuZXh0IExpbnV4IEJvb3QtVGltZSBTSUcgY29uZmVy
ZW5jZSBjYWxsLg0KPiANCj4gCVRoaXMgY2FsbCBpcyBhICJzcGVjaWFsIHRvcGljIiBjYWxsLCBv
biB0aGUgc3ViamVjdCBvZiBVbmlmaWVkIEJvb3QgTG9nLg0KPiAJU2VlIGh0dHBzOi8vZWxpbnV4
Lm9yZy9VbmlmaWVkX0Jvb3RfTG9nDQo+IA0KPiAJVGhlIG1lZXRpbmcgd2lsbCBiZSBoZWxkIHZp
YSB0aGUgSml0c2kgb25saW5lIG1lZXRpbmcgcGxhdGZvcm0uDQo+IAlUbyBKb2luIHRoZSBtZWV0
aW5nIHZpYSB3ZWIsIGNsaWNrIG9uOg0KPiAJaHR0cHM6Ly9tZWV0LmppdC5zaS9MaW51eEJvb3RU
aW1lU0lHDQo+IA0KPiAJLS0tLQ0KPiAJVGhlIG1lZXRpbmcgaXMgVHVlc2RheSwgTWF5IDIwLCBh
dCA5OjAwIGFtIE1vdW50YWluIERheWxpZ2h0IFRpbWUuDQo+IAlTZWUgdGhpcyBsaW5rIGZvciBv
dGhlciB0aW1lIHpvbmVzOg0KPiAJaHR0cHM6Ly93d3cudGltZWFuZGRhdGUuY29tL3dvcmxkY2xv
Y2svbWVldGluZ2RldGFpbHMuaHRtbD95ZWFyPTIwMjUmbW9udGg9MDUmZGF5PTIwJmhvdXI9MTUm
bWluPTAmc2VjPTAmcDE9MjIwJg0KPiBwMj0xMzcmcDM9MTk1JnA0PTc3MQ0KPiAJKFRoYXQgbWFr
ZXMgaXQgODowMCBhbSBQYWNpZmljLCAxNTowMCBVVEMsIDE3OjAwIENFU1QsIGFuZCAyMDozMCBJ
U1QpDQo+IA0KPiAJUGxlYXNlIG5vdGUgdGhhdCB0aGlzIGlzIE5PVCBvdXIgcmVndWxhcmx5IHNj
aGVkdWxlZCBtb250aGx5IFNJRyBjYWxsLCB3aGljaCBpcyBuZXh0IHdlZWsuDQo+IA0KPiAJSSdt
IHBsYW5uaW5nIG9uIDMwIG1pbnV0ZXMgZm9yIHRoaXMgbWVldGluZywgYnV0IEkgY2FuIGdvIGxv
bmdlciBpZiB0aGUgZGlzY3Vzc2lvbiB3YXJyYW50cy4NCj4gDQo+IAlUaGUgYWdlbmRhIGZvciB0
aGUgbWVldGluZyAoYW5kIHdoZXJlIHdlJ2xsIGtlZXAgdGhlIG1pbnV0ZXMpIGlzIGhlcmU6DQo+
IAlodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVudC9kLzFYQXVmb1RUNlZWSk9UTXpLTW96
OFN5T3NzLUpBOUg0SjFfeVZYUXE1bU4wL2VkaXQ/dXNwPXNoYXJpbmcNCj4gDQo+IAlUaGUgYWdl
bmRhIGZvciB0aGlzIG1lZXRpbmcgaXM6DQo+IAkgLSBEaXNjdXNzIGlzc3VlcyB3aXRoIHRoZSBV
bmlmaWVkIEJvb3QgTG9nDQo+IAkgICAgLSByZXZpZXcgZWxpbnV4IHBhZ2U6IGh0dHBzOi8vZWxp
bnV4Lm9yZy9VbmlmaWVkX0Jvb3RfTG9nDQo+IAkgICAgLSBkaXNjdXNzIGV4aXN0aW5nL3JlbGF0
ZWQgZWZmb3J0czoNCj4gCSAgICAgICAtIFUtQm9vdCdzIGJvb3Qtc3RhZ2U6IGh0dHBzOi8vZ2l0
aHViLmNvbS91LWJvb3QvdS1ib290L2Jsb2IvbWFzdGVyL2luY2x1ZGUvYm9vdHN0YWdlLmgNCj4g
CSAgICAgICAtIFJlZEhhdCdzIGJvb3QtdGltZS1hbmFseXNpcyB0b29sczogKGNudHZjdCBhbmQg
Ym9vdC10aW1lKQ0KPiAJICAgICAgICAgIC0gaHR0cHM6Ly9naXRsYWIuY29tL0NlbnRPUy9hdXRv
bW90aXZlL3NyYy9ib290LXRpbWUtYW5hbHlzaXMtdG9vbHMNCj4gDQo+IAlJIGxvb2sgZm9yd2Fy
ZCB0byB0YWxraW5nIHdpdGggeW91IGluIHRoZSBtZWV0aW5nLg0KPiAJIC0tIFRpbQ0KPiANCj4g
DQoNCg==
