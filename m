Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19010021.outbound.protection.outlook.com [52.103.23.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8E3192590;
	Wed, 11 Mar 2026 15:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244028; cv=fail; b=i3EA5pgmJNvxTHwPU0+n6xtMe0UDGIAAOUwTrHY8DIm0ls5PAVTSn0JKasyvcFtM7Omjh4N9ZUHt66pUnGZ3rMThC9GTzkXBnt/WPS9x0hv8NBjtxHY6C+VK80Rmwetkzx6NeGqiecs02NmkcLJmMHKz+0LLvmMmb4ucL6SQB1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244028; c=relaxed/simple;
	bh=pupYn4iWnsiFp4vVdMHObe95Va4TIg6K/AHRv900WIg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qXo4judmbPuRXUaGIhFBgT6FlXPWbBg+T2dAHuyaptTLme0BnBQLcp1/ukGhkfGuwHedgmUDISi8hNQ6G+6+YNUgxCIR0liZ6mlqNGQankK5Eu2W//mkcp7VAS0PPMGvF15HjCQkHPSVnBrljGnMdLUv/QCoBNOzXsGX6zaDCDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=oRY+Iu5m; arc=fail smtp.client-ip=52.103.23.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="oRY+Iu5m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjmfXHMsV/rfI2rnFjaG0nEjumEkwZ0f/0xqguoOp8rTGkcKhI/Zj9Gx8zdXp9rLthoHJggShskvvAgyAmPi+tML4/9UjlWmDHJh+yf6MVfZUagLyzf3ArqBzxILOFJ0Ihne5SngBY4g0On7M89gKS9qF7Bo1v79FJwgZO9yb60GkBEESoHJvnUo22fD+x7BYxnh0iy+kjaZHrUhDBlo2LaoZTwFPpTvBl1U1/H/tLGpVkBn5OeWmOJKdh/JTmxJygAbM2kH/LouwBYDKq9o/fpR2ZkGrNY+8zgZJCs9W/SpaILIMiizoHrwwwwnwYOzH0s9hWcPIFxEJnxFejHCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBW/sA/zc8J0fCuym3I/YfJZLwQQEhTDzEJknph60mQ=;
 b=fqQFqMaaXtuyfmQds1gHnHm2l0UUSswDq6v1o/NgFduQHaPRL6Ni1hPU8C2WeeiqwDAH9WiO6/5Azen5pJGP5jTIDj/6hiCo8ZJ55We0LaqwefeIJeyvEInTxlxoJpfaIY/fjfVQW3e8JGTMAjyoG3ZuHuuzSh8LsSj4kjzCLpALrDhiJAMFsPh3RQrdc3L66VrmQ0pVS+aMlu1HTN1qVBCJ+uXpreHQ6g1w8WsknEGCFo6s4aPH4ZzsgoMr7x2as3CxJsMy8DkJvcVlhvVdireiZjm0dH72vSRagmDa4ifh37X1951EFDZYrYZiFY5qbvWpktSV8HYYcp2ezIwldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBW/sA/zc8J0fCuym3I/YfJZLwQQEhTDzEJknph60mQ=;
 b=oRY+Iu5me9ghuJ1ESPCyB+x/Q25ZoAIH9ZaTCoIMf1IBZdL9/cSoRZUxdQykJYdAlUzLXgpf4GZJxtKp3yjz4Xn1NKnfQpS+m5VCkPLEeZsJzAuzU3Vv77ksoF3q/y54aHBIxYqXDSh6eOeYoordX62ZruYviw2wIRShhVyDeZVtUAwYaJ92uyW5JXE0XJnXGZonkE4IxusZfk2PmGuBe51fj5jRtnk5ar7NkXybHTFGp18k/Xr/IHRviOja9gz8efFiKYztpx2CyBGia07BdBsGkIW36Vb68M8CembCY7y9HHhvcIUn25DmRefVR5bjkWtUhsnLaLs7oLfzi9wvXg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SJ0PR02MB8372.namprd02.prod.outlook.com (2603:10b6:a03:3f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 15:47:01 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%6]) with mapi id 15.20.9678.023; Wed, 11 Mar 2026
 15:47:01 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Tim Bird <tim.bird@sony.com>, "pmladek@suse.com" <pmladek@suse.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "john.ogness@linuxtronix.de"
	<john.ogness@linuxtronix.de>, "senozhatsky@chromium.org"
	<senozhatsky@chromium.org>
CC: "francesco@valla.it" <francesco@valla.it>, "geert@linux-m68k.org"
	<geert@linux-m68k.org>, "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Thread-Topic: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Thread-Index: AQGlf14jAL0WeEJDVkfpfFvwf4gfXgJtrFDUtgRr3TA=
Date: Wed, 11 Mar 2026 15:47:01 +0000
Message-ID:
 <SN6PR02MB41571D45C1C8ADF89BD1FE8DD447A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
In-Reply-To: <20260210234741.3262320-1-tim.bird@sony.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SJ0PR02MB8372:EE_
x-ms-office365-filtering-correlation-id: 4b3a858c-1750-4229-d848-08de7f856fb2
x-microsoft-antispam:
 BCL:0;ARA:14566002|13091999003|19110799012|37011999003|8062599012|8060799015|41001999006|12121999013|31061999003|15080799012|461199028|53005399003|40105399003|3412199025|440099028|102099032|12091999003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VPGPajoEG9VcN+bwzVgAn0HLvi4dArQngvM4sZ1XpaxpNGucsQIR3Wn8pl/E?=
 =?us-ascii?Q?Y3ripH1p07wsRc9bjY1gGvfF6lCtSf9UvoPnbYcD5M1zVNibFfy/Ba+57hnU?=
 =?us-ascii?Q?FRwkiW5t3Vea84FNwfofyjC0Q6t8EAzti1YQQfzSDS8bEceIk1VN3H8fm/DN?=
 =?us-ascii?Q?D1HGZhv8u0UDAB8vBgcmulns/t1H+voEIxxX8Y24vAZHbf9l01wjjHq/a13o?=
 =?us-ascii?Q?nvzje3Y042Ma8brwY/6EyHhE4D+zma9G9B0aGGj0AlHo2UqswuSb+/YQ+kzg?=
 =?us-ascii?Q?bC4W3OagjFzGVF/0rc4x2/bQ4jC+rMW4aRokDRrmCtDcmq5ZH5U/TggcuF9u?=
 =?us-ascii?Q?CZbdUw3HbphyHJXUO7Ffaf0SOJ4fEGqbaLN/17bMVLQ28JmdgCMIyWe29cWG?=
 =?us-ascii?Q?vBHEXlFNFkq701b1X2eNR+ub+YkoTR9TfFjfpxgiA2HgaXN3Z8HHU8tA791y?=
 =?us-ascii?Q?Rubt3KoIZ4elDKUa8ZW8/mw1TEozQ7bdGwj1S53bibTeVigWOSv+U82hXXJ1?=
 =?us-ascii?Q?48zGiGeYbw6nUmqgufqJOTYtr2T2MT78O8zGKSAXMCZ7neYnYCS7CQpcEXaz?=
 =?us-ascii?Q?7YnDQkWK3oX28fSV3wB3y0TbAAQn+wZK4ZNqQyU3V5hdpOuKYTmbDMfmR0Rn?=
 =?us-ascii?Q?cLKbjp6NzMc/GaGaYMm8tptPZWkAa8UCFfNU+6gBhYLBO+Me7O6ZVdQ0u383?=
 =?us-ascii?Q?uGh6S1AtpwlUdt0ONU9JgLIK84oL5vRfKTnmdAGkiT829Ed9YUcRvFI5+aF3?=
 =?us-ascii?Q?4vii8jRdHUtd34Zj0uw1q8tAfuXjM3FvN8JtxaZFTWKo1/CduvYPgbi4rPVR?=
 =?us-ascii?Q?Wb4sVnr708J/LHXmIw0rfF8DL+GztPopAlwQ4Gngn9SCWpRE9pg21f+ARkEn?=
 =?us-ascii?Q?3fk1rpiEECCW9QyAMXflWK0EApE8kTYMVjBQhSiglVFlxeDcigm87XzzaeTE?=
 =?us-ascii?Q?zNUweHaFV5m8UC8fGh5H50DaFzcfpgJqOV4Cxh93MN1rvWlzcQoW4XX10Czl?=
 =?us-ascii?Q?hMkT5NvAgXDLnqpcZYrrEgl2gZMRC/uqRLMSEYx11Ox7eIOtHIG0M0xGStmv?=
 =?us-ascii?Q?B8hXKMPL?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ijM8rDm7tECLm2GgkKaITjDHHea04qvIDakZpv3Rwob6ZsNZUjYqjc1wizys?=
 =?us-ascii?Q?I81kYkWKQIXpb0dkFWme6NY33KChc5lBswVuBGsWIPCfBzv6eR6/nR5YsA0W?=
 =?us-ascii?Q?wTf89V8B/giajToeanWO6fyaWjhw/kKBq5ii6CDZSPIuyNXnqU08EULGC0lm?=
 =?us-ascii?Q?OT/9pAIiPGynNqG5hPDRDnmdBLXMav5Y7Q9OVvNw0KNM/FYGld20aK5FF8B+?=
 =?us-ascii?Q?bMFjDEw/mYl7slvboZstoDj/AjRd6EsM4mRJy2NSHbdrF7ANaLdq7vyagUAh?=
 =?us-ascii?Q?l9givM+DCrbbcYIFVLQusEPR4ZBJe1GUinqn/asvU5/UTUT0/MYAW/UC7w2l?=
 =?us-ascii?Q?60ge0c7v0PKV/v5LQU1FAbgyrvFt0J8fhQeL1gWpx/Gzzn39iToNYpOnvLJf?=
 =?us-ascii?Q?fyoBBRveainu5i24zKziIuZfF5yzRXwl5I+fXW6NAYTDI2BIVTLct+pJbnxg?=
 =?us-ascii?Q?yZJk+iMWMyW7ymESgc+DeHLAd4ShqnZg+RBrg5JeFtTkVTSpIgFu0gHzTJQ6?=
 =?us-ascii?Q?0L+gFQZe1wtFgX97Axq4yr3Mf5VPHH17oEXd5blCsWA4qaeCsMuN3fNAJWIR?=
 =?us-ascii?Q?qQJIWYAEXWW+CiYW1onguAt/y2hi/tsa1zjLiwGH20TCjilooQtQUAc5iOci?=
 =?us-ascii?Q?1tPb9YcQEwHddDDN0CDSjV64l1k4e6W4W8Ps//zG8aKOiWSXemm3JFpennkr?=
 =?us-ascii?Q?3dEWKM7YnzX4jODbrW6v2iWTjXanHrWp6Z7dwAwzLlqEnncKKumFSO2EdBkL?=
 =?us-ascii?Q?jm8lRem9v4AVtT0IKhEgvcMcdSC4grVa5FM7AjEV4a77wgIQDwSDC3vD9X6L?=
 =?us-ascii?Q?2V/AzwyVerAOnEJrf14ftz1xeyWWus4wehoqFPIoeSRNIw6ACYLBHOHS+Pgz?=
 =?us-ascii?Q?ezFp5mCKa/sNcducv5te1D4pkonuMhnXtnAfAcm78HAACptOkpKRuXw/XQAM?=
 =?us-ascii?Q?wgDzCkj20SxBtklV6HWA1qTiuUeXP5hm0eJHPfKanl3y07Gg5pytGSErPIjy?=
 =?us-ascii?Q?A4vT2veJny8irOkyJq8HqyvAqZhn+gRM4zJvgKbgmvkztCeIpPhd50QUpG3N?=
 =?us-ascii?Q?SLP6LBmEs0PsccnLUmBbUigzJSNMMXuVqgHy7HjMm3rbBDb+rumRrj41SQ+q?=
 =?us-ascii?Q?n9ceJEIbpQCkiPwCRHu59RcKH3KpuDOQD1QWFP8FpR3Gf5BHLJ9bOKWTQv9Y?=
 =?us-ascii?Q?dX8DmUiLomYwO3xYvCZlGPAIqvIk38Fg5oZAP15xU0OeStRA240PetV/Mwwl?=
 =?us-ascii?Q?aJCwh14+cFcp+1TeiTug7qBTZe4+Lw16bTd5MrXvY2By/Ptv8mvv5UY/V0Sl?=
 =?us-ascii?Q?mnj5FmmNjrfkPAeFFeecWRjVPFDxbWxAQEJoe1CeJhonBYO1KxGMvebeV7Bk?=
 =?us-ascii?Q?MdpTv7w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-embedded@vger.kernel.org
List-Id: <linux-embedded.vger.kernel.org>
List-Subscribe: <mailto:linux-embedded+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-embedded+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3a858c-1750-4229-d848-08de7f856fb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 15:47:01.4179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8372

From: Tim Bird <tim.bird@sony.com> Sent: Tuesday, February 10, 2026 3:48 PM
>=20
> During early boot, printk timestamps are reported as zero before
> kernel timekeeping starts (e.g. before time_init()).  This
> hinders boot-time optimization efforts.  This period is about 400
> milliseconds for many current desktop and embedded machines
> running Linux.
>=20
> Add support to save cycles during early boot, and output correct
> timestamp values after timekeeping is initialized.  get_cycles()
> is operational on arm64 and x86_64 from kernel start.  Add code
> and variables to save calibration values used to later convert
> cycle counts to time values in the early printks.  Add a config
> to control the feature.
>=20
> This yields non-zero timestamps for printks from the very start
> of kernel execution.  The timestamps are relative to the start of
> the architecture-specified counter used in get_cycles
> (e.g. the TSC on x86_64 and cntvct_el0 on arm64).
>=20
> All timestamps reflect time from processor power-on instead of
> time from the kernel's timekeeping initialization.

I tried this patch in linux-next20260302 kernel running as a guest VM
on a Hyper-V host. Two things:

1) In the dmesg output, I'm seeing a place where the timestamps briefly go
backwards -- i.e., they are not monotonically increasing. Here's a snippet,
where there's a smaller timestamp immediately after the tsc is detected:

[   27.994891] SMBIOS 3.1.0 present.
[   27.994893] DMI: Microsoft Corporation Virtual Machine/Virtual Machine, =
BIOS Hyper-V UEFI Release v4.1 09/25/2025
[   27.994898] DMI: Memory slots populated: 2/2
[   27.995202] Hypervisor detected: Microsoft Hyper-V
[   27.995205] Hyper-V: privilege flags low 0xae7f, high 0x3b8030, ext 0x62=
, hints 0xa0e24, misc 0xe0bed7b2
[   27.995208] Hyper-V: Nested features: 0x0
[   27.995209] Hyper-V: LAPIC Timer Frequency: 0xc3500
[   27.995210] Hyper-V: Using hypercall for remote TLB flush
[   27.995216] clocksource: hyperv_clocksource_tsc_page: mask: 0xffffffffff=
ffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
[   27.995218] clocksource: hyperv_clocksource_msr: mask: 0xfffffffffffffff=
f max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
[   27.995220] tsc: Detected 2918.401 MHz processor
[   27.991060] e820: update [mem 0x00000000-0x00000fff] System RAM =3D=3D> =
device reserved
[   27.991062] e820: remove [mem 0x000a0000-0x000fffff] System RAM
[   27.991064] last_pfn =3D 0x210000 max_arch_pfn =3D 0x400000000
[   27.991065] x86/PAT: PAT support disabled because CONFIG_X86_PAT is disa=
bled in the kernel.
[   27.991066] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- UC

Hyper-V provides a synthetic clocksource (two actually), and perhaps they
are the cause of the problem, though I haven't spent any time debugging.

2) A Linux VM running in the Azure cloud is also running on Hyper-V. Such a
VM typically uses cloud-init to set everything up at boot time, and cloud-i=
nit
is outputting lines to the serial console with a timestamp that looks like =
the
printk() timestamp, but apparently is not adjusted for the early timestampi=
ng
that this patch adds. Again, I haven't debugged what's going on -- I'm not
immediately sure of the mechanism that cloud-init uses to do output to the
serial console. The use of the Hyper-V synthetic clock source might the cau=
se
of the problem here as well. Here's an output snippet from the serial conso=
le:

[   20.330414] systemd[1]: Condition check resulted in OpenVSwitch configur=
ation for cleanup being skipped.
[   20.332911] systemd[1]: Condition check resulted in Set Up Additional Bi=
nary Formats being skipped.
[   20.333257] pstore: Registered efi_pstore as persistent store backend
[   20.334360] systemd[1]: Condition check resulted in File System Check on=
 Root Device being skipped.
[   20.338319] systemd[1]: Starting Load Kernel Modules...
[   20.341094] systemd[1]: Starting Remount Root and Kernel File Systems...
[   20.350993] systemd[1]: Starting udev Coldplug all Devices...
[   20.356255] systemd[1]: Starting Uncomplicated firewall...
[   20.361536] systemd[1]: Started Journal Service.
[   20.386902] EXT4-fs (sda1): re-mounted c02dce0c-0c40-4e6e-88af-c5a0987b0=
adb r/w.
[   22.532033] /dev/sr0: Can't lookup blockdev
[    7.955973] cloud-init[783]: Cloud-init v. 24.3.1-0ubuntu0~20.04.1 runni=
ng 'init-local' at Wed, 11 Mar 2026 15:27:06 +0000. Up 7.48 seconds.
[    9.933120] cloud-init[822]: Cloud-init v. 24.3.1-0ubuntu0~20.04.1 runni=
ng 'init' at Wed, 11 Mar 2026 15:27:08 +0000. Up 9.82 seconds.
[    9.935483] cloud-init[822]: ci-info: ++++++++++++++++++++++++++++++++++=
++++Net device info+++++++++++++++++++++++++++++++++++++++
[    9.937726] cloud-init[822]: ci-info: +--------+------+-----------------=
------------+---------------+--------+-------------------+
[    9.939905] cloud-init[822]: ci-info: | Device |  Up  |           Addres=
s           |      Mask     | Scope  |     Hw-Address    |
[    9.942059] cloud-init[822]: ci-info: +--------+------+-----------------=
------------+---------------+--------+-------------------+

The cloud-init lines don't show up in dmesg, so there's no problem there.

I will look into both issues further, but probably not today.

Michael

>=20
> Signed-off-by: Tim Bird <tim.bird@sony.com>
> ---
> V2->V3
>  Default CONFIG option to 'n'
>  Move more code from into early_times.h
>   (reducing ifdefs in init/main.c)
>  Use math64 helper routines
>  Use cycles_t instead of u64 type
>  Add #defines for EARLY_CYCLES_BIT and MASK
>  Invert if logic in adjust_early_ts()
>  (note: no change to 'depends on' in Kconfig entry)
>=20
> V1->V2
>  Remove calibration CONFIG vars
>  Add 'depends on' to restrict arches (to handle ppc bug)
>  Add early_ts_offset to avoid discontinuity
>  Save cycles in ts_nsec, and convert on output
>  Move conditional code to include file (early_times.h)
>=20
>  include/linux/early_times.h | 85 +++++++++++++++++++++++++++++++++++++
>  init/Kconfig                | 14 ++++++
>  init/main.c                 |  6 +++
>  kernel/printk/printk.c      | 18 +++++++-
>  4 files changed, 121 insertions(+), 2 deletions(-)
>  create mode 100644 include/linux/early_times.h
>=20
> diff --git a/include/linux/early_times.h b/include/linux/early_times.h
> new file mode 100644
> index 000000000000..05388dcb8573
> --- /dev/null
> +++ b/include/linux/early_times.h
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _KERNEL_PRINTK_EARLY_TIMES_H
> +#define _KERNEL_PRINTK_EARLY_TIMES_H
> +
> +#include <linux/timex.h>
> +#include <linux/clocksource.h>
> +
> +/* use high bit of a u64 to indicate cycles instead of a timestamp */
> +#define EARLY_CYCLES_BIT	BIT_ULL(63)
> +#define EARLY_CYCLES_MASK	~(BIT_ULL(63))
> +
> +#if defined(CONFIG_EARLY_PRINTK_TIMES)
> +extern cycles_t start_cycles;
> +extern u64 start_ns;
> +extern u32 early_mult, early_shift;
> +extern u64 early_ts_offset;
> +
> +static inline void early_times_start_calibration(void)
> +{
> +	start_cycles =3D get_cycles();
> +	start_ns =3D local_clock();
> +}
> +
> +static inline void early_times_finish_calibration(void)
> +{
> +	cycles_t end_cycles;
> +	u64 end_ns;
> +
> +	/* set calibration data for early_printk_times */
> +	end_cycles =3D get_cycles();
> +	end_ns =3D local_clock();
> +	clocks_calc_mult_shift(&early_mult, &early_shift,
> +		mul_u64_u64_div_u64(end_cycles - start_cycles,
> +			NSEC_PER_SEC, end_ns - start_ns),
> +		NSEC_PER_SEC, 100);
> +	early_ts_offset =3D mul_u64_u32_shr(start_cycles, early_mult, early_shi=
ft) -
> start_ns;
> +
> +	pr_debug("Early printk times: mult=3D%u, shift=3D%u, offset=3D%llu ns\n=
",
> +		early_mult, early_shift, early_ts_offset);
> +}
> +
> +static inline u64 early_cycles(void)
> +{
> +	return (get_cycles() | EARLY_CYCLES_BIT);
> +}
> +
> +/*
> + * adjust_early_ts detects whether ts in is cycles or nanoseconds
> + * and converts it or adjusts it, taking into account the offset
> + * from cycle-counter start.
> + *
> + * Note that early_mult may be 0, but that's OK because
> + * we'll just multiply by 0 and return 0. This will
> + * only occur if we're outputting a printk message
> + * before the calibration of the early timestamp.
> + * Any output after user space start (eg. from dmesg or
> + * journalctl) will show correct values.
> + */
> +static inline u64 adjust_early_ts(u64 ts)
> +{
> +	if (likely(!(ts & EARLY_CYCLES_BIT)))
> +		/* if timestamp is not in cycles, just add offset */
> +		return ts + early_ts_offset;
> +
> +	/* mask high bit and convert to nanoseconds */
> +	return mul_u64_u32_shr(ts & EARLY_CYCLES_MASK, early_mult, early_shift)=
;
> +}
> +
> +#else
> +# define early_times_start_calibration() do { } while (0)
> +# define early_times_finish_calibration() do { } while (0)
> +
> +static inline u64 early_cycles(void)
> +{
> +	return 0;
> +}
> +
> +static inline u64 adjust_early_ts(u64 ts)
> +{
> +	return ts;
> +}
> +#endif /* CONFIG_EARLY_PRINTK_TIMES */
> +
> +#endif /* _KERNEL_PRINTK_EARLY_TIMES_H */
> diff --git a/init/Kconfig b/init/Kconfig
> index fa79feb8fe57..a928c1efb09d 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -777,6 +777,20 @@ config IKHEADERS
>  	  or similar programs.  If you build the headers as a module, a module =
called
>  	  kheaders.ko is built which can be loaded on-demand to get access to h=
eaders.
>=20
> +config EARLY_PRINTK_TIMES
> +	bool "Show non-zero printk timestamps early in boot"
> +	default n
> +	depends on PRINTK
> +	depends on ARM64 || X86_64
> +	help
> +	  Use a cycle-counter to provide printk timestamps during
> +	  early boot.  This allows seeing timestamps for printks that
> +	  would otherwise show as 0.  Note that this will shift the
> +	  printk timestamps to be relative to processor power on, instead
> +	  of relative to the start of kernel timekeeping.  This should be
> +	  closer to machine power on, giving a better indication of
> +	  overall boot time.
> +
>  config LOG_BUF_SHIFT
>  	int "Kernel log buffer size (16 =3D> 64KB, 17 =3D> 128KB)"
>  	range 12 25
> diff --git a/init/main.c b/init/main.c
> index b84818ad9685..d5774aec1aff 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -104,6 +104,7 @@
>  #include <linux/pidfs.h>
>  #include <linux/ptdump.h>
>  #include <linux/time_namespace.h>
> +#include <linux/early_times.h>
>  #include <net/net_namespace.h>
>=20
>  #include <asm/io.h>
> @@ -1118,6 +1119,9 @@ void start_kernel(void)
>  	timekeeping_init();
>  	time_init();
>=20
> +	/* This must be after timekeeping is initialized */
> +	early_times_start_calibration();
> +
>  	/* This must be after timekeeping is initialized */
>  	random_init();
>=20
> @@ -1600,6 +1604,8 @@ static int __ref kernel_init(void *unused)
>=20
>  	do_sysctl_args();
>=20
> +	early_times_finish_calibration();
> +
>  	if (ramdisk_execute_command) {
>  		ret =3D run_init_process(ramdisk_execute_command);
>  		if (!ret)
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 1d765ad242b8..5afd31c3345c 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -46,6 +46,7 @@
>  #include <linux/ctype.h>
>  #include <linux/uio.h>
>  #include <linux/sched/clock.h>
> +#include <linux/early_times.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/panic.h>
> @@ -75,6 +76,13 @@ EXPORT_SYMBOL(ignore_console_lock_warning);
>=20
>  EXPORT_TRACEPOINT_SYMBOL_GPL(console);
>=20
> +#ifdef CONFIG_EARLY_PRINTK_TIMES
> +cycles_t start_cycles;
> +u64 start_ns;
> +u32 early_mult, early_shift;
> +u64 early_ts_offset;
> +#endif
> +
>  /*
>   * Low level drivers may need that to know if they can schedule in
>   * their unblank() callback or not. So let's export it.
> @@ -639,7 +647,7 @@ static void append_char(char **pp, char *e, char c)
>  static ssize_t info_print_ext_header(char *buf, size_t size,
>  				     struct printk_info *info)
>  {
> -	u64 ts_usec =3D info->ts_nsec;
> +	u64 ts_usec =3D adjust_early_ts(info->ts_nsec);
>  	char caller[20];
>  #ifdef CONFIG_PRINTK_CALLER
>  	u32 id =3D info->caller_id;
> @@ -1352,7 +1360,11 @@ static size_t print_syslog(unsigned int level, cha=
r *buf)
>=20
>  static size_t print_time(u64 ts, char *buf)
>  {
> -	unsigned long rem_nsec =3D do_div(ts, 1000000000);
> +	unsigned long rem_nsec;
> +
> +	ts =3D adjust_early_ts(ts);
> +
> +	rem_nsec =3D do_div(ts, 1000000000);
>=20
>  	return sprintf(buf, "[%5lu.%06lu]",
>  		       (unsigned long)ts, rem_nsec / 1000);
> @@ -2242,6 +2254,8 @@ int vprintk_store(int facility, int level,
>  	 * timestamp with respect to the caller.
>  	 */
>  	ts_nsec =3D local_clock();
> +	if (!ts_nsec)
> +		ts_nsec =3D early_cycles();
>=20
>  	caller_id =3D printk_caller_id();
>=20
> --
> 2.43.0
>=20

