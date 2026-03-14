Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19012015.outbound.protection.outlook.com [52.103.23.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D002440DFAF;
	Sat, 14 Mar 2026 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773504952; cv=fail; b=UEeYWiJpqgqrSwVQsP0nm+JXDzX10leZisqOVQpXYi/qy1rpxlM6QBcPT7zArr1Bw6OmjqRk1HaFcB1VLxgNa66k7LH7reQrrDPUEjfNxHIAlZ/D+tgAvNrMVA8jFbu63aeAPschQnMsDjXZjGnBkvlZ/eQiHUh5U0wEgU0EM+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773504952; c=relaxed/simple;
	bh=w4ILF6B8l6HTirJffR6JxEoMpwU72DEhHevcnvwuYE0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DZCaYz4BZHNJPPPVBeqjAFCjtXuwA0Y/GBMnY7QsjjWHwp50PdxpT7ajer51PW2bOJQl6nslgVcRAS4pzLrYhJFcLPJlSAjNjP6lKvtU/b3dTsFiKwYDOmjn2BLb8X7a0t3Orzx5TMtLis0iOzf7auFwBw1tdn9vzJ0dAIrpen4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=IbbmZbSV; arc=fail smtp.client-ip=52.103.23.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="IbbmZbSV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvxuHEnsS8LdLQYpYEclEumefZ538W6/Fq1DOowdwRvmuPcE0Q3PvlGwn5afNj7p30cIxKhdSpCtTCeNwYP69vWW9vdxipdCKN9Yidt20SQ8/SKScGWNjjiUE/+df0tqqDNvGu2TozaYSoq9Sa1HhFOZgApBz3vhGCIAyKMluy6Ma2dg/LiSinMavO7eqX0YBnfNLxi8Coc9LfOK5xr188ZHmMWt3yIpmDhYPnhBexlA+yaQU2GvSHl+E3uZ5QdEzfBjP/b9hFCl8D2DIE9DZcTCmAan12BhwgXrPa/x50hMd+1RS+M20vyCXT7nnHGN2iUB+ToCGFnVWw/W43uovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSc6w0K/BJcX8JyCzlcDf6DbSWchCuS/LRarXegEIfA=;
 b=skWtMYum4uoq1/ElmSubbzLr3y+5fEfwDuJMNR8PwF/shSO7Un4PaxZDL7yyBKCF9lYSehK/rnlf+oFOdfRZyK0rNNTrn4Ve4KkKBC6ToaAqJ4a+6QTHXr5083HxywokQy7U4Nn5y76BaqbgBCY06rUkPdtoi62QUU8GxDaK4jsSHDfKeU1KpkdhfQbUGJEYTfOX7Gdi+sFnJ9qlsHnnpVa+x6b9yJgxHmFdZORpn8oAa/gv4FxBuQHqcqlePHuplGF1VbUqqp1fxom9EGu0DE/nltBQvGOcbSW+8ySMLV0YByWBsEA8FdSQc8TxgztLk4gmx5eMBt31DHdYklw+Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSc6w0K/BJcX8JyCzlcDf6DbSWchCuS/LRarXegEIfA=;
 b=IbbmZbSVMjo0WAkLnlUAUajtOSQTeiwwWhjoIvoFJifj8CA9LWgSdHMn6mSbxmHhEApi86KCTG6saXaRJ8Yn50qrBaGbSeCgFlSKSkAaTOBZ4YU3g5cbrLv5yfOyhJ901IY3jfHPI/6Zu1mSfO7uS5cmt/jpO5+4t3wlI9niqBD76kRnjdCv34FYYEuyqqjnUszvsb2wOtY3lJnR+25MbQG7YXcyoZtHR+wL8QsV0w8ldb1WBBg7ezc/7LO5vvlweLgUTLB+Q53PC+A4gut6X3cbRL4BHqVIto/rCrzgNAyRPMrwHo6CmNfYXcn2OORuu4K0/BT7Ax6Ae8IQMYy4Hw==
Received: from BN7PR02MB4148.namprd02.prod.outlook.com (2603:10b6:406:f6::17)
 by MW4PR02MB7426.namprd02.prod.outlook.com (2603:10b6:303:66::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sat, 14 Mar
 2026 16:15:47 +0000
Received: from BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::6007:d1a1:bcf9:58ef]) by BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::6007:d1a1:bcf9:58ef%2]) with mapi id 15.20.9700.020; Sat, 14 Mar 2026
 16:15:47 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Petr Mladek <pmladek@suse.com>, "Bird, Tim" <Tim.Bird@sony.com>, Shashank
 Balaji <shashankbalaji02@gmail.com>
CC: Michael Kelley <mhklinux@outlook.com>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"francesco@valla.it" <francesco@valla.it>, "geert@linux-m68k.org"
	<geert@linux-m68k.org>, "linux-embedded@vger.kernel.org"
	<linux-embedded@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, John
 Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, John Ogness
	<john.ogness@linutronix.de>
Subject: RE: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Thread-Topic: [PATCH v3] printk: fix zero-valued printk timestamps in early
 boot
Thread-Index: AQGlf14jAL0WeEJDVkfpfFvwf4gfXgJtrFDUtgRr3TCAAnJ1AIAAYnMAgAHutoA=
Date: Sat, 14 Mar 2026 16:15:46 +0000
Message-ID:
 <BN7PR02MB4148F06A53EA3A4061765405D442A@BN7PR02MB4148.namprd02.prod.outlook.com>
References: <39b09edb-8998-4ebd-a564-7d594434a981@bird.org>
 <20260210234741.3262320-1-tim.bird@sony.com>
 <SN6PR02MB41571D45C1C8ADF89BD1FE8DD447A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <MW5PR13MB563216F6D786D4DCDFEBED2BFD45A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <abPqrqgXHnDu8XWf@pathway>
In-Reply-To: <abPqrqgXHnDu8XWf@pathway>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR02MB4148:EE_|MW4PR02MB7426:EE_
x-ms-office365-filtering-correlation-id: 75724138-d384-4944-089c-08de81e4f379
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|15080799012|8060799015|8062599012|37011999003|41001999006|461199028|13031999003|19110799012|51005399006|13091999003|12121999013|10035399007|3412199025|440099028|4302099013|12091999003|102099032|1602099012|40105399003|1710799026;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4u0EgHaJseFkX0CMWMEW09ZR73YcWOlJiYMLPXqIpCJTEzopdSfP/nFA9xhm?=
 =?us-ascii?Q?RThT89NM4qm3WanoGLv4Qlx1gbuQ+q0yuvjFcGBmGu8c5asG0zc0ywtoalMi?=
 =?us-ascii?Q?tqJ7paSYZyBN6s7PslhQWUwqzz5a+gBbbzVaDFzpWl2cOD3skB0CR5tNNSnL?=
 =?us-ascii?Q?Xb0lNZN5gKVld4O4nQ5sXt/1xsCdwg1z78KoY3ReKpXuO0/f+r6rEuBeaWnf?=
 =?us-ascii?Q?a4lXVhMyl2G6tgFD10WIaDrEu8tIVA4jRxZyNcFaE/ea8qQ3oAEhFRx0I5d6?=
 =?us-ascii?Q?UgNIQM3NcLCKNqjQDtJ7WP1GJCiAimP6vd+4f4hGzB8uRAvGsRaIW/2HJhCL?=
 =?us-ascii?Q?sb3WWoASKoSeR004oGfnsRXlwjQE00CNtOjZ4kIYQlmau6fJWKpamCXdsSri?=
 =?us-ascii?Q?c/ojgs06kpSthqOh5E0S6Bu6KRAOyOdvt+4ZTfWabgVMGNVz96iCJtEpAUwM?=
 =?us-ascii?Q?0OefoFZvKO0iAY1FqnjkdzSILVsE3gzXJ16Lme+7TS32oZFbGa4hPvfD2aRz?=
 =?us-ascii?Q?b/CH5GSuIqCJCYSp0ddYskdi2Id6kmUtnAMfDJMHdcZ/J+n79TRGWdP3h+z0?=
 =?us-ascii?Q?F43HgQDqoOfZ+E39qvCuFCTmeA76EklM2VI/Hylvnz5Z6uzCpb7B1/hJORNa?=
 =?us-ascii?Q?jgHxrE+lsq5KsZ346ZbWZKrtH1JN6bIDW32ODiYTxRyiM5uWTDD0hHGJqjNr?=
 =?us-ascii?Q?udJbBzJvR61lglkPa/8kYkCpVAsPQBLB+jXRwKQk5O8MU2xEStUIL1Ye9rLm?=
 =?us-ascii?Q?WJcpgGzKluWrUnVUMEPbltpWhO8eiV7tGtYW2Eyf45Ufg0xeWjCuX8I42leC?=
 =?us-ascii?Q?wPFNaXEXGK+tMTg7MQU5/UsZKQb+SkZZEOgcxB62RXWoSdXfIk152guf1217?=
 =?us-ascii?Q?G8GOkXAI1gCgjqFCm2es1QHvbRoTfj3bEGABL0QQXNN4guo4o7QqYDm9IS2m?=
 =?us-ascii?Q?z/nTLLBTvBRBUPxbD9T3NRSzVyeUEOU4nIKkZtK1mnWNBqOmFMyEKit+2eS5?=
 =?us-ascii?Q?mRvjICaHECSH4eyGfCpEPfWZGt/VQAr3L0MFQCNqig7X4C6Fau+HX1pn5uIA?=
 =?us-ascii?Q?njoYHX7m50bsXtDOlvP50RABt8KaRUCfR2WYjrIbWVAeyJu3Yb3+/7QVGEkL?=
 =?us-ascii?Q?x3ie8j01C2HQIO8jI0iqIaKZYmvpSkJiVthiRx5BsPaX28XIRsdyplnV3fwJ?=
 =?us-ascii?Q?UgDV4psq7j4EsnLIGO5nS9wtIaAJiw0iSBCic7A90hFZLthHpas33M2LNkic?=
 =?us-ascii?Q?bMhMThtXtHgamywNoQKa?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FPoT0eiXpbbL4g9dy59cz3Glib7ScZTdUHuVYWx3qPT/FcbNrg4vhcH15H6M?=
 =?us-ascii?Q?RAHPtpFHjAsymetuytmT6/yWpkAGNcCYGzU25ZRBoFzKpbPawDFRACJrrtjI?=
 =?us-ascii?Q?luem9aCy4cGlDyhsTC5pYV/UDedFbX1xGpMvcBFWlILjGGYCoVyAnRn14YX5?=
 =?us-ascii?Q?yzd6VefbN+BIuPIF76d3roQzUGgoL+dC8e0o2nKj5VRufQpj7WT+VyhuZNGo?=
 =?us-ascii?Q?/q66GIKwdshSI6a7hUmpFG12E30K83yzjldALkypParre196zy0vCyEDeD1i?=
 =?us-ascii?Q?fvduLCBxsxknsc5H9k00xcWV9vhIXSfNgjej8mSp0hEgVK3qk07VhE2WKCm3?=
 =?us-ascii?Q?uycslnbgtKqtlSMxYrmeyWyXYXPBwwHv/oENpX5TEFLHJEtyEuGUdAJPCY/h?=
 =?us-ascii?Q?UIsxV/cNOh+xVVf60YvVSt2x3KGM7ogTMzQXI2wG2CWLRUH64tdQL0u+1MYd?=
 =?us-ascii?Q?zbCsGGPOMwHZBTc0aJnv2DPJkegfF+dEC3L9JvrGxhUb2VDzYBm6YVhBhHVp?=
 =?us-ascii?Q?qa+FP1aVjlQls51En6AihjIXaK1wtKpxAIzXuN1Fymx0OcbDpRvwB0Txoz74?=
 =?us-ascii?Q?P586GYd2xJmCqLcfsHmk1PVP3T+MlKO5w8B2VjPusY0pzAHT24PE83fhalBR?=
 =?us-ascii?Q?VeiDP/HmQsTa6FSrwpbJBUB0zzOGxPFFUEHYtHryCezGRWD/tRdqmdl+b/JH?=
 =?us-ascii?Q?uBT9NdhvIA25z1sgSV+d+O5/HJjTQUfqEJIm6b/swydyWFRM/KMKmb6fPC5n?=
 =?us-ascii?Q?Vxn+GBAtm6ELhqse2hX84HGUCkKzha3GTZJ9kodKg4E2W5QMHzFJSFtG3ueq?=
 =?us-ascii?Q?/2sONZbCkbBFk/o+WexNcdI42Il9VYh5qXOnYsmdwt7NpOAVDo1CJLKkOLrK?=
 =?us-ascii?Q?K13dmon0F+Wwap+xGu/bluQIFsVyAbiXyMMLmoCKlAoKl2t8+V1Ke9DeRqRB?=
 =?us-ascii?Q?sQcZxfEHwTmxjwwlmTIRXO1Q0DhmdRCJ85hlmAfXZ/ID2jU4yTiAXw/sFfSd?=
 =?us-ascii?Q?tBDvzJCbCgYKylkJTszrtJuz6mi3+3KxZ+z5Eq7Doq4TriXVZI27JkT1UmOc?=
 =?us-ascii?Q?psFUWqam6sqX6q2EtSzQvCtak8hF0Qyc9ehPOYR9MIiETJCm5Vee7kakTzPJ?=
 =?us-ascii?Q?Feeo4cRFZzAlMhT7ZnDe9YEmkI3qLB/VgX5gXCPj3XWXsIJcP/o6vwYt4tx+?=
 =?us-ascii?Q?kvY3Qgglk3GdTY73uJjx6iKMS0nSjM6TnaNWQC0Oli29SUs/eBgoyFk8iZpZ?=
 =?us-ascii?Q?5dcbqoJwc68RWE40Vx3WfWN0Bv6ovVgtmgWFzcvBcZWlQ/hIckdauqGBKvR0?=
 =?us-ascii?Q?pZdagogxNUufDy91k6z8VjZesaOKx6F/qDzbY9qfbnvS4/FYwcINWHNLoHWT?=
 =?us-ascii?Q?bHcYgsk=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 75724138-d384-4944-089c-08de81e4f379
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2026 16:15:47.0225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7426

From: Petr Mladek <pmladek@suse.com> Sent: Friday, March 13, 2026 3:45 AM
>=20
> Finally added timekeeping maintainers and John into Cc.
> We should have added time since v1.
>=20
> Anyway, you might see the entire history at
> https://lore.kernel.org/all/39b09edb-8998-4ebd-a564-7d594434a981@bird.org=
/
>=20
> On Fri 2026-03-13 04:52:40, Bird, Tim wrote:
> > Hey Micheal,
> >
> > This report is very interesting.
> >
> > Thanks very much for trying it out!
> >
> > > -----Original Message-----
> > > From: Michael Kelley <mhklinux@outlook.com>
> > > Sent: Wednesday, March 11, 2026 9:47 AM
> > > From: Tim Bird <tim.bird@sony.com> Sent: Tuesday, February 10, 2026 3=
:48 PM
> > > >
> > > > During early boot, printk timestamps are reported as zero before
> > > > kernel timekeeping starts (e.g. before time_init()).  This
> > > > hinders boot-time optimization efforts.  This period is about 400
> > > > milliseconds for many current desktop and embedded machines
> > > > running Linux.
> > > >
> > > > Add support to save cycles during early boot, and output correct
> > > > timestamp values after timekeeping is initialized.  get_cycles()
> > > > is operational on arm64 and x86_64 from kernel start.  Add code
> > > > and variables to save calibration values used to later convert
> > > > cycle counts to time values in the early printks.  Add a config
> > > > to control the feature.
> > > >
> > > > This yields non-zero timestamps for printks from the very start
> > > > of kernel execution.  The timestamps are relative to the start of
> > > > the architecture-specified counter used in get_cycles
> > > > (e.g. the TSC on x86_64 and cntvct_el0 on arm64).
> > > >
> > > > All timestamps reflect time from processor power-on instead of
> > > > time from the kernel's timekeeping initialization.
> > >
> > > I tried this patch in linux-next20260302 kernel running as a guest VM
> > > on a Hyper-V host. Two things:
> > >
> > > 1) In the dmesg output, I'm seeing a place where the timestamps brief=
ly go
> > > backwards -- i.e., they are not monotonically increasing. Here's a sn=
ippet,
> > > where there's a smaller timestamp immediately after the tsc is detect=
ed:
> > >
> > > [   27.994891] SMBIOS 3.1.0 present.
> > > [   27.994893] DMI: Microsoft Corporation Virtual Machine/Virtual Mac=
hine, BIOS Hyper-V UEFI Release v4.1 09/25/2025
> > > [   27.994898] DMI: Memory slots populated: 2/2
> > > [   27.995202] Hypervisor detected: Microsoft Hyper-V
> > > [   27.995205] Hyper-V: privilege flags low 0xae7f, high 0x3b8030, ex=
t 0x62, hints 0xa0e24, misc 0xe0bed7b2
> > > [   27.995208] Hyper-V: Nested features: 0x0
> > > [   27.995209] Hyper-V: LAPIC Timer Frequency: 0xc3500
> > > [   27.995210] Hyper-V: Using hypercall for remote TLB flush
> > > [   27.995216] clocksource: hyperv_clocksource_tsc_page: mask: 0xffff=
ffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
> > > [   27.995218] clocksource: hyperv_clocksource_msr: mask: 0xfffffffff=
fffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
> > > [   27.995220] tsc: Detected 2918.401 MHz processor
> >
> > I wonder if the tsc is getting fiddled with or virtualized somewhere
> > in here, as part of clocksource initialization. I believe each clocksou=
rce in
> > the kernel maintains it's own internal offset, and maybe the offset tha=
t is
> > being used ends up being slightly different from the cycle-counter offs=
et
> > that the early_times feature uses. I'm just throwing out guesses.  It's=
 about
> > a 4ms delta, which is pretty big.

I'm fairly certain the TSC frequency is not being fiddled with. In a guest =
VM on
Hyper-V, the x86 instruction to read the TSC executes directly in hardware =
and
is not virtualized. There *is* per-VM scaling of the TSC value to handle li=
ve
migrations across virtualization hosts with different TSC frequencies, but =
that's
not in play during my experiments.

> >
> > > [   27.991060] e820: update [mem 0x00000000-0x00000fff] System RAM =
=3D=3D> device reserved
> > > [   27.991062] e820: remove [mem 0x000a0000-0x000fffff] System RAM
> > > [   27.991064] last_pfn =3D 0x210000 max_arch_pfn =3D 0x400000000
> > > [   27.991065] x86/PAT: PAT support disabled because CONFIG_X86_PAT i=
s disabled in the kernel.
> > > [   27.991066] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  =
UC- UC
>=20
> I wonder how the calibration of the cycles is precise. I wonder if
> the problem might be that cycles were faster right after boot than
> later during the calibration.
>=20
> I added the following debug output on top of this patch:
>=20
> diff --git a/include/linux/early_times.h b/include/linux/early_times.h
> index 05388dcb8573..cdb467345bcc 100644
> --- a/include/linux/early_times.h
> +++ b/include/linux/early_times.h
> @@ -20,6 +20,7 @@ static inline void early_times_start_calibration(void)
>  {
>  	start_cycles =3D get_cycles();
>  	start_ns =3D local_clock();
> +	pr_info("Early printk times: started callibration: %llu ns\n", start_ns=
);
>  }
>=20
>  static inline void early_times_finish_calibration(void)
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 774ffb1fa5ac..836cb03aaa6d 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2308,6 +2308,8 @@ int vprintk_store(int facility, int level,
>  	ts_nsec =3D local_clock();
>  	if (!ts_nsec)
>  		ts_nsec =3D early_cycles();
> +	else
> +		pr_info_once("local_clock() returned non-zero timestamp: %llu nsec\n",=
 ts_nsec);
>=20
>  	caller_id =3D printk_caller_id();
>=20
>=20
> And it produced in my kvm:
>=20
> Let's say that start of the cycle counter is
>=20
> Start of stage A
>=20
> [    8.684438] Linux version 7.0.0-rc2-default+ (pmladek@pathway) (gcc (S=
USE Linux)
> 15.2.1 20260202, GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.45.0.202511=
03-2)
> #571 SMP PREEMPT_DYNAMIC Fri Mar 13 10:23:54 CET 2026
> [    8.684442] Command line: BOOT_IMAGE=3D/boot/vmlinuz-7.0.0-rc2-default=
+
> root=3D/dev/vda2 resume=3D/dev/disk/by-uuid/369c7453-3d16-409d-88b2-
> 5de027891a12 mitigations=3Dauto nosplash earlycon=3Duart8250,io,0x3f8,115=
200
> console=3DttyS0,115200 console=3Dtty0 ignore_loglevel log_buf_len=3D1M
> crashkernel=3D512M,high crashkernel=3D72M,low
> [...]
> [    8.696633] earlycon: uart8250 at I/O port 0x3f8 (options '115200')
> [    8.696639] printk: legacy bootconsole [uart8250] enabled
> [    8.731303] printk: debug: ignoring loglevel setting.
> [    8.732349] NX (Execute Disable) protection: active
> [    8.733447] APIC: Static calls initialized
> [    8.734667] SMBIOS 2.8 present.
> [    8.735358] DMI: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.17.0-=
2-g4f253b9b-prebuilt.qemu.org 04/01/2014
> [    8.737285] DMI: Memory slots populated: 1/1
> [    8.738380] Hypervisor detected: KVM
> [    8.739151] last_pfn =3D 0x7ffdc max_arch_pfn =3D 0x400000000
> [    8.740254] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    8.732971] printk: local_clock() returned non-zero timestamp: 3486 ns=
ec
>=20
> End of stage A
>=20
> This is the point where printk() started storing the values from
> local_clock() instead of cycles.
>=20
> Start of stage B
>=20
> [    8.732971] kvm-clock: using sched offset of 252367014082295 cycles
> [    8.735471] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycle=
s: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [    8.738880] tsc: Detected 3293.776 MHz processor
> [    8.740474] e820: update [mem 0x00000000-0x00000fff] System RAM =3D=3D=
> device reserved
> [...]
> [    8.932671] rcu: srcu_init: Setting srcu_struct sizes based on content=
ion.
> [    8.934047] Early printk times: started callibration: 201079507 ns
>=20
> End of stage B
>=20
> This is where we started calibration of early cycles.
>=20
> Start of stage C
>=20
> [    8.935571] Console: colour dummy device 80x25
> [...]
> [    9.289673] thermal_sys: Registered thermal governor 'fair_share'
> [    9.290077] thermal_sys: Registered thermal governor 'bang_bang'
> [    9.292290] thermal_sys: Registered thermal governor 'step_wise'
> [    9.293530] thermal_sys: Registered thermal governor 'user_space'
> [    9.294856] cpuidle: using governor ladder
> [    9.296302] cpuidle: using governor menu
>=20
> Here the thermal governors are registered. I guess that they might
> reduce speed of some HW.
>=20
> [...]
> [   11.974147] clk: Disabling unused clocks
>=20
> Some unused clocks are disabled. I wonder if this might affect
> counting the cycles.
>=20
> [   12.330852] Freeing unused kernel image (rodata/data gap) memory: 1500=
K
> [   12.351191] Early printk times: mult=3D19634245, shift=3D26, offset=3D=
8732967929 ns
>=20
> End of stage C
>=20
> Here is the end on calibration.
>=20
> Now, if the frequence of the cycles was:
>=20
>    + was higher in the stage A when only cycles were stored
>    + was lower in stage C when it was calibrated against local_clock()
>=20
> Then it might result in higher (calibrated) timestamps in stage A
> and step back in stage B.
>=20
> Or something like this. It is possible that even local_clock() does
> not have a stable frequence during the early boot.

In my VM on Hyper-V, I do see a problem with the results of your
calibration code. Over the calibration interval, you calculate the delta
number of nanoseconds from local_clock() and the delta number of
TSC cycles. The delta TSC cycles divided by the delta nanoseconds
should yield the TSC frequency. But the result of your calibration code
is about 3.05 cycles/nsec, when the actual TSC frequency is 2.918
cycles/nsec for the hardware I'm running on.

In a Linux VM where CONFIG_PARAVIRT=3Dy, local_clock() eventually
comes down to native_sched_clock(), which just reads the TSC and
then converts to nanoseconds based on the kernel's understanding
of the TSC frequency. So I don't think the local_clock() frequency is
varying. But I'm thinking there are some adjustments being made
to the value returned by local_clock() during early initialization, and
I didn't try to track those down.

Hyper-V provides guest VMs with a synthetic clock (that is based
on the TSC). As an experiment, I used that clock in the early time
calibration, and everything worked properly. The calibration code
produced delta nanoseconds and delta cycles that were exactly
2.918 cycles/nsec, and the transition from Stage A to Stage B was
correct -- no cases of a smaller timestamp following a larger
timestamp. So my conclusion is that the calibration is indeed
problematic, though I haven't identified why the nanoseconds
delta from local_clock() is smaller than it should be.

>=20
> Idea: A solution might be to start calibration when printk()
>       gets first non-zero time from local_clock.
>=20
>       Something like:
>=20
> diff --git a/include/linux/early_times.h b/include/linux/early_times.h
> index 05388dcb8573..09d278996184 100644
> --- a/include/linux/early_times.h
> +++ b/include/linux/early_times.h
> @@ -16,10 +16,13 @@ extern u64 start_ns;
>  extern u32 early_mult, early_shift;
>  extern u64 early_ts_offset;
>=20
> -static inline void early_times_start_calibration(void)
> +static inline void early_times_may_start_calibration(u64 ts_ns)
>  {
> +	if (start_ns)
> +		return;
> +
> +	start_ns =3D ts_ns;
>  	start_cycles =3D get_cycles();
> -	start_ns =3D local_clock();
>  }
>=20
>  static inline void early_times_finish_calibration(void)
> diff --git a/init/main.c b/init/main.c
> index 27835270dfb5..a333b0da69cf 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1123,9 +1123,6 @@ void start_kernel(void)
>  	timekeeping_init();
>  	time_init();
>=20
> -	/* This must be after timekeeping is initialized */
> -	early_times_start_calibration();
> -
>  	/* This must be after timekeeping is initialized */
>  	random_init();
>=20
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 774ffb1fa5ac..19330b6b4eb2 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2306,7 +2306,9 @@ int vprintk_store(int facility, int level,
>  	 * timestamp with respect to the caller.
>  	 */
>  	ts_nsec =3D local_clock();
> -	if (!ts_nsec)
> +	if (ts_nsec)
> +		early_times_may_start_calibration(ts_nsec);
> +	else
>  		ts_nsec =3D early_cycles();
>=20
>  	caller_id =3D printk_caller_id();
>=20
>=20
> > >
> > > 2) A Linux VM running in the Azure cloud is also running on Hyper-V. =
Such a
> > > VM typically uses cloud-init to set everything up at boot time, and c=
loud-init
> > > is outputting lines to the serial console with a timestamp that looks=
 like the
> > > printk() timestamp, but apparently is not adjusted for the early time=
stamping
> > > that this patch adds. Again, I haven't debugged what's going on -- I'=
m not
> > > immediately sure of the mechanism that cloud-init uses to do output t=
o the
> > > serial console. The use of the Hyper-V synthetic clock source might t=
he cause
> > > of the problem here as well. Here's an output snippet from the serial=
 console:
> > >
> > > [   20.330414] systemd[1]: Condition check resulted in OpenVSwitch co=
nfiguration for cleanup being skipped.
> > > [   20.332911] systemd[1]: Condition check resulted in Set Up Additio=
nal Binary Formats being skipped.
> > > [   20.333257] pstore: Registered efi_pstore as persistent store back=
end
> > > [   20.334360] systemd[1]: Condition check resulted in File System Ch=
eck on Root Device being skipped.
> > > [   20.338319] systemd[1]: Starting Load Kernel Modules...
> > > [   20.341094] systemd[1]: Starting Remount Root and Kernel File Syst=
ems...
> > > [   20.350993] systemd[1]: Starting udev Coldplug all Devices...
> > > [   20.356255] systemd[1]: Starting Uncomplicated firewall...
> > > [   20.361536] systemd[1]: Started Journal Service.
> > > [   20.386902] EXT4-fs (sda1): re-mounted c02dce0c-0c40-4e6e-88af-c5a=
0987b0adb r/w.
> > > [   22.532033] /dev/sr0: Can't lookup blockdev
> > > [    7.955973] cloud-init[783]: Cloud-init v. 24.3.1-0ubuntu0~20.04.1=
 running 'init-local' at Wed, 11 Mar 2026 15:27:06 +0000. Up 7.48 seconds.
> > > [    9.933120] cloud-init[822]: Cloud-init v. 24.3.1-0ubuntu0~20.04.1=
 running 'init' at Wed, 11 Mar 2026 15:27:08 +0000. Up 9.82 seconds.
> > > [    9.935483] cloud-init[822]: ci-info: ++++++++++++++++++++++++++++=
++++++++++Net device info+++++++++++++++++++++++++++++++++++++++
> > > [    9.937726] cloud-init[822]: ci-info: +--------+------+-----------=
------------------+---------------+--------+-------------------+
> > > [    9.939905] cloud-init[822]: ci-info: | Device |  Up  |           =
Address           |      Mask | Scope  |     Hw-Address    |
> > > [    9.942059] cloud-init[822]: ci-info: +--------+------+-----------=
------------------+---------------+--------+-------------------+

The cloud-init output to the serial console is coming from syslog, which is
presumably writing directly to /dev/console. This output is also recorded
in the syslog log files (/var/log/syslog in my Ubuntu system), though with
timestamps in a text format like

2026-03-14T08:44:24.781241-07:00

The timestamps recorded in /var/log/syslog, and as shown with the
'journalctl' command, are monontonic using that full date/time format. But
'journalctl' with the "-o short-monotonic" option shows the seconds-since-b=
oot
format, and in that case, the cloud-init timestamps are discontinuous with =
the
kernel messages, like in the serial console output. I don't know exactly wh=
ere
journalctl gets its knowledge of the boot time, but among the possibilities=
 are:

/proc/uptime
/proc/stat (the "btime" field)

These are not adjusted for using early boot times. And it's not clear wheth=
er
they should be -- I don't know what the big picture implications would be.
And there are probably other places the boot time is available to user spac=
e.
If using early boot times is intended to be only for occasional diagnostic =
use,
then maybe living with the discontinuity is OK. I see that Shashank Balaji =
has
also commented about userspace issues, which covers this syslog case.

I think all this gives a first-level explanation of what I'm seeing in a
Hyper-V guest. I don't think any of it is specific to Hyper-V guests
or the Hyper-V synthetic clock sources. The issues are more generic.
Sorry. :-(

Michael

>=20
> This is more complicated. I wonder if the timestamps from cloud-init()
> are somehow synchronized with local_clock().
>=20
> We might need to synchronize local_clock() with the cycles as well.
> But there is the chicken&egg problem. We need:
>=20
>     + to know the offset caused by cycles when local_clock() gets initial=
ized.
>     + local_clock() running for some time to calibrate cycles.
>=20
> Hmm, I see that time-management people are not in Cc. We should have
> added them since v1.
>=20
> I add them now. Better late than never.
>=20
> Best Regards,
> Petr

