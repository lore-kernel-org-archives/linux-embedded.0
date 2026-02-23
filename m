Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464A0DF76
	for <linux-embedded@vger.kernel.org>; Mon, 23 Feb 2026 23:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771887715; cv=fail; b=PuKAJPVzP+JRymUK3Quj1O27Z4WkVzt9z8HXHgs6PnjmM7rvp7lKfynYEBVnrlz39LDHcUYWN9ybMcevr3uOY12yDp/WEq+RaNljFVZQxYJZrN1sWqd1D/4suZad0bIcTlh8/JviZznWAK80W/uaqFo5nRjkcp/NLCcujZ4Lk3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771887715; c=relaxed/simple;
	bh=OXmxKthm+/2k/q9sldl85oxfz3g94xKoTAmXc7oTRuY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Mzt4RLXO0kWK1Jdk+/1emiLSb6LM5fUc3qqo1Ub39F6yGGDwLr0DPd4slWzIQDcFJ7yQKT5ErzpyOjAobrMqlwyRQKwgKc5lbAUT+g6uaZFOwao65l+BLZRAbQPIjOx2gigD8BmyFk9EOAJe9laQBzEocMGKG8Ej3tSNGPMiMkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=oJ5suJ6D; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="oJ5suJ6D"
Received: from pps.filterd (m0209319.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NKo5MD3364739
	for <linux-embedded@vger.kernel.org>; Mon, 23 Feb 2026 23:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=OXmxKthm+/2k/q9sldl85oxfz3g94
	xKoTAmXc7oTRuY=; b=oJ5suJ6Dl/tVamAsUyE7a+oQjf0mfOBb4GW+gt3y/8FqV
	pcPymZ2lM4gOf4isbBn3ZSoLQ2t2OF8nqEaCLMyNXyFthEPLwr2UnStS6xGFAisK
	3E8W0h10t2Q9WDsosGgoJMLt0H5QbzMpnGZqWBYJoIbMvxPh84kwpboRAq1e38bo
	foqCWtMl2UTYHmwokkhX+we0MvRv6o57AlJYWrpEOv/T9Ltga2YHFsf25Vcc02kO
	htwAd4Ln5S5XaAyK3Uuozs6C5/9BBzJpn885bYj25w/drI1dN6/LVnyUGePKyP2U
	OHBFmYvfqGwOOkJOspq1P9jKA/VDdTDSkiC2unTDw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4cf53kt602-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <linux-embedded@vger.kernel.org>; Mon, 23 Feb 2026 23:01:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gs6YXcFHHCxEcy2chFa5bMRWzJ2bKUA2SgAhT/tLTBVBYNefc4LM7AHP+/jXSJZ5Hfq9dFDZYWKLpIjXrKMKer0kU+HZLZXY+02zMUkWWPQZ2soLSMf66nteGJBQPhzveTkG57xPX5C3qSmG0i9SmnZ3q6BO1zj6+Dp8gOkPCrz8EToYXCmPjKJe1UCMhue7wXtMXASzRiAwu7HF3uI6OWiQ11csnFPXd4UkGfuumbr8B5iXKOKqNpdUGJhOZpngGai7WWh7fWSzRE2yhrqpSnmCYgtt5GGJ4jnxXfftbZwljFMEZKOMrkFw4++4q5bbDf4M+NbHfnN2PqsL+SPsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXmxKthm+/2k/q9sldl85oxfz3g94xKoTAmXc7oTRuY=;
 b=rZQ0BHyl6wea0V0+gITI6nO6/s17nq6pYVfxZnnH+DXbZxkxPrEFVSqr3StACOF7LWl8ik77AR9foy2UWvAmzWqEG1VFbVevQkbFNMvebuqKWRTbVQlI+VcVIh04pAcMt0FlQYGF+z+cTlaCed3IT8u1uqIinWPpjzX5p7K80p5gl3GN6gdkYKvt/x9oEQwuLyRa0nxqIgaUO1L1m4lsgaLAOfUKGZ8oIfS+iycQjLFRq0k3Pht1LPlj/bmdw1h8JJKpF//JoJQ6o1z4MjcdgHFF7uwSWBmvi5vkusUR/yzgFDBwSzkz/p0kcLv9IblpN7e67brx+6hxxbIK9TF+ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SA5PR13MB7609.namprd13.prod.outlook.com (2603:10b6:806:478::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 23:01:41 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 23:01:41 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Linux Embedded <linux-embedded@vger.kernel.org>
Subject: Reminder of Boot-Time SIG meeting (Feb 24)
Thread-Topic: Reminder of Boot-Time SIG meeting (Feb 24)
Thread-Index: AdylFqsVqHFxlRmRTySNEyTkWN2KtA==
Date: Mon, 23 Feb 2026 23:01:41 +0000
Message-ID:
 <MW5PR13MB5632F87A486BDA1B67684BABFD77A@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SA5PR13MB7609:EE_
x-ms-office365-filtering-correlation-id: 67008153-fd95-4c47-7bd9-08de732f8223
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y2VmLzZkWU51MVZRZXFzc1A0ZXZqb1dRZ1FydGpsdmloY0NTZk82dzUrYWlI?=
 =?utf-8?B?UEFnZERUMDhkYlcvRllZdUdqcXV2WWNlaVk0RktmNGRMMWhjbDRiekt3UHVo?=
 =?utf-8?B?Mjh0b1dsbGVjdXVvV3RvU3kxYThuWFhobWcwR3kzREh5RzNhWm5XYUNET0c5?=
 =?utf-8?B?aElEODN0R0xZTnBwQzBlM2dWNjNVWU5WWHNGWjBsV2pLeUpsMFh2eUduY05l?=
 =?utf-8?B?eWR5bjRVZEZYamtPaDkzYnlNL1JtMXlZcEdNSG11OUI4Z1ZUcHJrbDNsaTZp?=
 =?utf-8?B?N1o2MzJUYUlFOXk2NjFpUS9sRW80TmhYVE5pcTV1MzNGSVFIc0s5N2EzVUlV?=
 =?utf-8?B?dVhjYkpoY1dTcWdQRm4yVy9tVzU2elFwWGRUVTRuZE5mZG9QY2RwMXhlWEdU?=
 =?utf-8?B?Qm9lWmFZY1RZUTIrdkh3eVJZaXQwcVo1NXJ6TDJ4ZDNDUUFjNk0wWVhvRytX?=
 =?utf-8?B?T0lJdkZma3FSWVpFQjJOZTk1eFNCOXdyS0VxWEU5K0szUFpNNEhKL1BpY3hQ?=
 =?utf-8?B?NnBHbHhRN3FocDFVQWZiUjFZeGlpS1RDQ29vTi9lZStmUlloWEhuYnU1N1dL?=
 =?utf-8?B?aG1zZHl0YWN1V2pmVVN4WjhHRldjRGkzMTV4Q0N2UU9PNm9JbUh1Ujhjb2lw?=
 =?utf-8?B?azdDRndjT2JuTjdZclhGd0NOcmFaM3ltWXdteldOYU12bjJ6ZE1mRWFXcUVs?=
 =?utf-8?B?T3NEWEFoSHhkWm1wSjlwaHZ5WlB2cUNJRFU5ejRuT2hwSHBUMEVHcVlRV1h3?=
 =?utf-8?B?bXpEL1gxbkwrRDl0cVNzOVNtMU5CWFB1SVJaQnNnWVVNREFVbHN5V1JaeGtH?=
 =?utf-8?B?VFlmZFdUekpjUy9Ndm9iL014M2JUZXRrYTZZUGJ5T1BOdGNwcXhVT0R3UlZW?=
 =?utf-8?B?dVBWUFFLK2xPRXVWL1duYkx4ODN4YWZHQWxRazNOQ0Vkek9QRGNDL05RLytw?=
 =?utf-8?B?QWxvWS8ybHNGOXRCVkxSRVVybWZDNkZnNmMvNVd6em1UQWZwTVRvNHRVb2xZ?=
 =?utf-8?B?dTI3VXBreU1TUEFBVjlYaFJqTEhFN0xpZ2dFZ25LVlU3NXVGQTZMOGt3V3dT?=
 =?utf-8?B?eTFRMEdzeUZXbm5xNURkNFQrbHNObDZSV2dZRkFTUHJOZTFqd3FNSGN4T2Q2?=
 =?utf-8?B?cjhHTlNCN3R1TlRveWptQU9tRnNLZFpZM1RadUpTRDhWKzcxdWMwQUxCU1Vm?=
 =?utf-8?B?SWFGZ2xHR0VmOXkzQjExdjlUNlBRY3Ezem9waWhVWHZBMHhIWU1nakQ5dTRD?=
 =?utf-8?B?L0pZNGJ6R0dvUXVMSVlpS3JuOWVnQ2FZWE1VMWUySi9CVDgybndhV2txSjEr?=
 =?utf-8?B?Z0JHM2cxYk5nRzBVTUtyU0RtK0dSRWJ3MmpLTmNoTUY0TkVHdVJsalI5VTVx?=
 =?utf-8?B?dHVSYW9SMVc4b1BlWHdaekpnd010VktwVUNiR2pzNnNISDJNaHRDSjJONEx4?=
 =?utf-8?B?OGhmS1YxV05IYnZiOVRTL09LZlA4VWo4M0l5VHV1Q2FaK05WODlrNGQzZHkz?=
 =?utf-8?B?K21SeExSbDh3UGUwbXUrdUxQbHJ1MkpvM2d6bnczLzQ2Q0pyU212bkduK1dK?=
 =?utf-8?B?SDdXNlZXd2lYaVFDdVdNVW90dGZIRDBEMVRpWXpuWWR5ZVQzUXdIQXZwemdv?=
 =?utf-8?B?cmZpaWRTQUFQaXlCTkpTZHo0V2tqYTlXL2o0RHJTK1JvR3p4bnZRVVUzUmV1?=
 =?utf-8?B?ZkxYQTIyTmxLUG0yU3VjNlcrZGh2dnRKT0RNL2VFYjQ4eEQ4a2ordDEwL3Jv?=
 =?utf-8?B?YnU5MWszVXRNcUtGSy9lbVZFaThHVWM5c3QvUElPdkQ3Nk9FR2hkMDRHR3hU?=
 =?utf-8?B?cUZ1OHlQVzVYcXcySkN2Q1ZLZjJNcy9FU2xXeWdGei9RZ3lQMjhORjJVSk5w?=
 =?utf-8?B?R0JadmRlRzh1eW9zQk9IMVBLc081Rmcrd1ZrNi9HbEZUNXppbnZBOVdEWGRy?=
 =?utf-8?B?TFJIc2Z0MnBOdVVwQVBZdVJQS2tCTjhCTlZtZVFJWXcyMHRTbWlUZTZMZzNr?=
 =?utf-8?B?RUp2NjNxTGVlSzNUNklXL3hFY2FjbDRJM2lnd1JNNWkvVG1mZGVuRXpCZVNL?=
 =?utf-8?B?L0crMmRvVUo2Z0xzd3Z0MGl5RW9OajRaVFhYZmJobjV2UTY4bWlLd2swN2VI?=
 =?utf-8?Q?tfwsY20vH2McVEtZqiDVRBhbF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UURSZnpFUHFpaEZ2a2VPR08vNGc1azBhRmVjNWJ3bXlJeWFLcUQyazVqckZu?=
 =?utf-8?B?N1FuamtMUnhaY2ZTMkFrUlFaRW1aamJkbjdKZGVpT2gvRk5WTm1pdFNQRlNW?=
 =?utf-8?B?cUxVYk55bU5lWW1IbFJwU0lzRVpmd1ZPZWdEWUFBcFpYQ3NCTnYxZUxvanJ4?=
 =?utf-8?B?TXhYbWdnNTdiMDFJYkY0OS9VVHhDUFQ2Ym9Uc3ZXWjljSjRKQnpSVm9BRGZF?=
 =?utf-8?B?Ty9qajVXQ1AwUHIyQlhDK1NFd3ZoWDRvR0JSYm1BS1oveTFScG9LSmdlTDQw?=
 =?utf-8?B?Y0RzeXUwNU85emVVUHA0emVCUlRmcHh0QkpaRWdieUs4L0Z4bVNjazVPT2Ns?=
 =?utf-8?B?Qm8zSzAwVDBVTGNXNXp4OEJid2lWSVRlalpyWXQzL3VscnFacStBbjcxR0ln?=
 =?utf-8?B?WWYzdzEwYUhSckRrVFJOckJJY0d0Y3hpZUR2bE5XdEpRZTZSanZ5SEUva1lU?=
 =?utf-8?B?L01YRHdLelBMRkNweVVpT3VmbXAzTXRuUVBSQlBtUHFHMkNmZ1JBWDBtSlpR?=
 =?utf-8?B?L1JUb2VtamV0TU4zOGdOZllLTzRjUUFEQjRpRHhsVkhCS0cwaE45cEVYRkQw?=
 =?utf-8?B?RXlhb2M4UFV5Q0xIaWU5Z2czMjY4RVhTSk9HV3N5Snc5OXlhSjFiV0N0VVZk?=
 =?utf-8?B?VHE0c1dxNHlLTUZrQ2U0T2hrbVJVRU1XUURVYlIvRnVmTTBmd0MyaFpzd3lz?=
 =?utf-8?B?em1hNTZpV2dGSElwSVJlTHNWeVF6WHQ1cWcrOFRZTEl0QVErV1pYVDVLYW95?=
 =?utf-8?B?cUEzMDBYSUlINitNTVArZlhpMEdxaGNRdkR2REVzOXQvc3M0cElrWjdRbTFp?=
 =?utf-8?B?aHVwSnkrUG0yMW10RDJNdExINU9XVnpQeWt5VStlUzR0ZFh6TllzNjRPZE9q?=
 =?utf-8?B?YlJ3TXJ6SHd6V2U1WUpRa2VCWnpjVkNxV1pWc3FQNjFyZU9XRzkyczRjd2hU?=
 =?utf-8?B?Q21xS1R6MjRYdnNrNmVCb1FYY1pFcnNycTQzdFF4SWhQN3hqVXd6U05NK09Q?=
 =?utf-8?B?blMwSWIrdFJZRFZ5WjA1bWNUdjd6YVRNeDdUbm95eXQ5Mk40dFNIbHFFdFhk?=
 =?utf-8?B?dWtNSEU1N2k4ekgrakhnWUxuV2tjOHZsQk44NklqL1FldEZZZmpXSkV3TENv?=
 =?utf-8?B?MDZSbkt0bm5iMXdaWFF6R1gyYzFhdkpKSnVybEpuYy84R2R4Mnl0MjZwRHd2?=
 =?utf-8?B?dTR0bkdFMWFybDJ1OUdFL01MZlBObUp2MHJseExFaEdzZU1aQzdsMVJXYUNB?=
 =?utf-8?B?SHBLM1kwMTF4WENxMmg0b1pTelhTdHZBQ1pvaFpoVkIzT1FHSXFoSStieUZB?=
 =?utf-8?B?WU95bUdueFN6eXYrbmsxTFZqejNwRHVmakd2bWw1Vm9kaW12M2hZTm5FN1Fo?=
 =?utf-8?B?Q1o4QWliTWs2TGFhaCttQVJEL2FuUzRSSWsxVFVabUtrSGVPRnFTUFZhVkZB?=
 =?utf-8?B?THBiSUtBSmxDazB6OGVEbFdJUlFzTUx3aWQxbngwVW5TNCtjQ1FBVUphRzh5?=
 =?utf-8?B?VEQ4Z0JwaEhUa3RWWW1IL0lUdVZDNVZqVEpBWUxlcHFrRHJ4TjRzMUVzanhs?=
 =?utf-8?B?RVp2dVlEemVMMUNVUFI4MjNJdXJFUUhqaTROdUplMURjL0NkQ21KTm1uUHFL?=
 =?utf-8?B?YzlWZXU1NXdNOWJMQlJGTlYyZnFZdElWK1U0TUE4b1c4enM1WVJVR0ZhWWgr?=
 =?utf-8?B?RFNHWFFTcngwaHZYVXplVUc2RUwvLy9iOVZzNTdQcXhIQ0ZTU0ZBdlllb2R2?=
 =?utf-8?B?MmlTK05tTkdUd1hNOVdmRkNjWjBXaFl6VXNMYnhpU2RIMHNGOUNsdHlzOSsr?=
 =?utf-8?B?eHpYeW5ockZ0NyszeEJMbEw4QVBINXRmWVU1TVZRSUpLdGdjQ0E3ME5YTi9C?=
 =?utf-8?B?UDl3aytSbTR2RWk5WGpFWVd3ZmFHS2h4aFhod1RTUVc0T0l2dmtoblp0ZHRr?=
 =?utf-8?B?Zk9YZXcxR3FJRG40SUpwRSt3NDVyZmdiaVVOMXFMN2RXRUpOY0tRdCs3TW1v?=
 =?utf-8?B?bUE3NkFTNTlrMmpmbG5qTGxld05EN01lMjZURktOV3Ezak9PZXpvcDYrNFpN?=
 =?utf-8?B?dkRnMlRkRzlERUM0cFZlY2hDa2l6dWxBQVdscUduR1NQOUJtTG15N3JCZzd6?=
 =?utf-8?B?blZMQlYyUENKWHZLeDd6cWMzNFZlWTZqbW9tSFBTLzA1VW1zMUdBNzJKSEd1?=
 =?utf-8?B?SmxiaUNLbjlwSHJHSXFDV2dybVlia3daQVRSTmNrdkRuQWVuWXkrbHdBWUw4?=
 =?utf-8?B?bi8xVFI4WDltVE5GNlgzTDRobVVVd1RvRnF0dGlVbTJ3NFk0Ync2anQ4WG9w?=
 =?utf-8?Q?g/aKZHsdHUGOFqS3vP?=
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
	1D5/rToE9OvrB8ktvgMafudCVssiD/1veMern8/+w/3xY6Yr77LF5/U56Wnq+dieVdtAKJPFcqLK7NoZGfMoT7DajhdrHIETHvccAPj34g35FFRitsx5AQ2KDnNmmaR7LuaVSp+igylJ5jndn4qAA/BDeNdPi0kYhWi1c4+vff/09Ds+Rm5ldzN7n9XNpzEwH/LFWfVhhP8sh2Vnb1jIZ24Rko7r1asG2y1AdG/HMuTiH3yd+T8jFCrfT+z1jpSOaLyd0RgQPaFm3SvyqMHxdtaTmJ6oGlrOKEydOyLzoX1H64of4iFdv7DZSrDLwPEUBVGlLT/Rjy+qmC5e8KsLFDWsPXOa1juPNirwinRhNE4bA8kM6stvOH1fwL3GZUL7YQvbzCN3dUoIXOdkLfDCy/WswkAdVUmI5MRHy0gFvc9wGPTiuN83MxYq7M62IXSsWB+kPo7CcgI+qE9aOfEa/1Iu+Qw94AFZ6cnmaC1Ubfqe5weTUd4LSquwmV2N9tLt7/lX411Q5n7u0w+ZGVJgKkq95efdOWkHQPdeKQBQ/7/l22g4oS6Nt03qvIEhCClE8qbyYRdeQHDdB0cTpRJr6N/WQah+0bfoKR+iQVRQHUEqTwQPq+9uJ+dp4EfK7IU/
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67008153-fd95-4c47-7bd9-08de732f8223
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 23:01:41.6442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BpptWvde55XI2q3iwr6Ckxy9/BoCe9qNDMJvgPHyxBoC+6S8YOvfoTM4C86F54KoQN2aAsrridL64cIcUTEaeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR13MB7609
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDIwMCBTYWx0ZWRfX5hSBYPDvTcAZ
 pj1ubEPsMsqOnx2mBZJlPiemNdF3Gju6eCC6IEFVyMK6c78wmXNWk2aBb0N+GO0jF/ghIxfD/c/
 n3bcQ40l+xORzBKfOpLiQxktHBc1L4ROYso9e/XAJfzksqbxU/xNW66L+o1AXSHZXHRjq193XyR
 Rd/hGFUSTQDLRZ8xrjIl9jXTe8eKb7olU0ambEzRVoRE+O2c5LDDdV3TfjwLXuyrhNv/7H3/L3r
 pRYDhbDWEpzIbSzXlerhRvOBbWpISLy0fy9jAx9fLesmyv6/Z99QQpmcDj5jFZTQAcwD209MBrR
 Kfc5tZqJ1DsLkBCaWx5e7hE59ZZwPbt9gmP7h/Dz4ZOBlpPR6k7iyZBZ68ZLeZNbXUwXqWeFB/W
 wcKTHdoR1QAaHqCBaIVidhSe1dJXZlgknvheEZkEcB143Sw14z4snlWz0c95gCkGkouN6Gy2Op+
 3hUGL7cCy33rOW6Hi4A==
X-Proofpoint-ORIG-GUID: DUSqrLVIabEun6pwh2HqB976cjWNsfTQ
X-Proofpoint-GUID: DUSqrLVIabEun6pwh2HqB976cjWNsfTQ
X-Authority-Analysis: v=2.4 cv=YpEChoYX c=1 sm=1 tr=0 ts=699cdc59 cx=c_pps
 a=ynjcjXHaqbEn4NYQb+mZsg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=nXA5WNwiAAAA:8
 a=NiL0GWOVAAAA:8 a=2iSxh-PlAAAA:20 a=kozKGR69gjD_1NYjldgA:9 a=QEXdDO2ut3YA:10
 a=fGr-7aqQv4RST94IA8XU:22
X-Sony-Outbound-GUID: DUSqrLVIabEun6pwh2HqB976cjWNsfTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01

SGV5IExpbnV4IEJvb3QtVGltZSBTSUcgaW50ZXJlc3RlZCBwYXJ0aWVzIChhbmQgb3RoZXIgaW50
ZXJlc3RlZCBMaW51eCBrZXJuZWwgZGV2ZWxvcGVycyksDQoNClNvcnJ5IGZvciB0aGUgbGF0ZSBu
b3RpY2UuICBJIGludGVuZGVkIHRvIHNlbmQgdGhpcyBsYXN0IHdlZWsuDQoNCkhlcmUgaXMgdGhl
IGluZm9ybWF0aW9uIGZvciB0aGUgbmV4dCBMaW51eCBCb290LVRpbWUgU0lHIGNvbmZlcmVuY2Ug
Y2FsbC4NCg0KVGhlIG1lZXRpbmcgd2lsbCBiZSBoZWxkIHZpYSB0aGUgSml0c2kgb25saW5lIG1l
ZXRpbmcgcGxhdGZvcm0uDQpUbyBKb2luIHRoZSBtZWV0aW5nIHZpYSB3ZWIsIGNsaWNrIG9uOg0K
aHR0cHM6Ly9tZWV0LmppdC5zaS9MaW51eEJvb3RUaW1lU0lHDQoNCi0tLS0NCk91ciBuZXh0IG1l
ZXRpbmcgaXMgVHVlc2RheSwgSmFudWFyeSAyNCwgYXQgOTowMCBhbSBNb3VudGFpbiBTdGFuZGFy
ZCBUaW1lLg0KU2VlIHRoaXMgbGluayBmb3Igb3RoZXIgdGltZSB6b25lczoNCmh0dHBzOi8vd3d3
LnRpbWVhbmRkYXRlLmNvbS93b3JsZGNsb2NrL21lZXRpbmdkZXRhaWxzLmh0bWw/eWVhcj0yMDI2
Jm1vbnRoPTAyJmRheT0yNCZob3VyPTE2Jm1pbj0wJnNlYz0wJnAxPTIyMCZwMj0xMzcmcDM9MTk1
JnA0PTc3MQ0KKFRoYXQgbWFrZXMgaXQgODowMCBhbSBQYWNpZmljLCAxNTowMCBVVEMsIDE2OjAw
IENFVCwgYW5kIDIwOjMwIElTVCkNCg0KSSdtIHBsYW5uaW5nIG9uIDEgaG91ciBmb3IgdGhpcyBt
ZWV0aW5nLg0KDQpUaGUgYWdlbmRhIGZvciB0aGUgbWVldGluZyAoYW5kIHdoZXJlIHdlJ2xsIGtl
ZXAgdGhlIG1pbnV0ZXMpIGlzIGhlcmU6DQpodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVu
dC9kLzFYQXVmb1RUNlZWSk9UTXpLTW96OFN5T3NzLUpBOUg0SjFfeVZYUXE1bU4wL2VkaXQ/dXNw
PXNoYXJpbmcNCg0KVGhlIGFnZW5kYSBmb3IgdGhlIEZlYnJ1YXJ5IDI0IG1lZXRpbmcgd2lsbCBi
ZSBhdmFpbGFibGUgaW4gdGhlIGFib3ZlIGRvY3VtZW50IGJlZm9yZSB0aGUgY2FsbC4NCg0KVG8g
YmUgaG9uZXN0LCBJIGhhdmVuJ3QgZ290dGVuIGEgdG9uIG9mIHRoaW5ncyBkb25lIG9uIGJvb3Qg
dGltZSBpbiB0aGUgbGFzdCBtb250aC4gIEJ1dCBvdGhlcnMNCm1heSBoYXZlLiAgSSdtIHNoaWZ0
aW5nIGdlYXJzIG5vdyB0byBsb29rIGF0IHR3byBhcmVhcyBvZiBmb2N1cyAxKSBib290LXRpbWUg
cmVkdWN0aW9uIHRocm91Z2gNCmF1dG9tYXRlZCBmZWVkYmFjayAodHVuaW5nIHdpemFyZCksIGFu
ZCAyKSBleGFtaW5pbmcgZGVsYXlzIGluIHVzZXIgc3BhY2UuDQoNCklmIHlvdSBoYXZlIGl0ZW1z
IHlvdSdkIGxpa2UgdG8gYWRkIHRvIHRoZSBhZ2VuZGEsIHBsZWFzZSBsZXQgbWUga25vdy4NCihQ
bGVhc2UgZS1tYWlsIG1lIGFuZC9vciBwdXQgdGhlbSBpbiB0aGUgZG9jdW1lbnQuKQ0KDQpJIGxv
b2sgZm9yd2FyZCB0byB0YWxraW5nIHRvIHlvdSB0aGVuLg0KDQpUaGFua3MsDQogLS0gVGltDQo=
