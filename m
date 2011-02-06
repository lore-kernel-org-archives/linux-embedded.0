From: Andrew Murray <amurray@mpcdata.com>
Subject: Re: [PATCH] printk-formats.txt documentation update
Date: Sun, 6 Feb 2011 10:07:45 +0000
Message-ID: <AANLkTi=fdwiVRavB-NbDNcpGLVNyH7ybpEzRYm1fkWGD@mail.gmail.com>
References: <AANLkTikj+FU8OF_-KFr2hmTSWqTHMK5JnrnTVyn-XtxQ@mail.gmail.com>
	<1296952626.4133.77.camel@Joe-Laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1296952626.4133.77.camel@Joe-Laptop>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Joe Perches <joe@perches.com>
Cc: linux-embedded@vger.kernel.org, linux kernel <linux-kernel@vger.kernel.org>, Jiri Kosina <trivial@kernel.org>

Thanks for the feedback - I will truncate to 80 characters and
implement Joe's advice.

Thanks,

Andrew Murray

On 6 February 2011 00:37, Joe Perches <joe@perches.com> wrote:
> On Sun, 2011-02-06 at 00:15 +0000, Andrew Murray wrote:
>> From: Andrew Murray <amurray@mpc-data.co.uk>
>> This patch updates the incomplete documentation concerning the print=
k
>> extended format specifiers.
>> Signed-off-by: Andrew Murray <amurray@mpc-data.co.uk>
>> ---
>> diff --git a/Documentation/printk-formats.txt b/Documentation/printk=
-formats.txt
> []
>> @@ -9,7 +9,42 @@ If variable is of Type, =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0use printk format specifier:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%zu or %zx
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssize_t =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %zd or %zx
>>
>> -Raw pointer value SHOULD be printed with %p.
>> +Raw pointer value SHOULD be printed with %p. The kernel supports
>> +the following extended format specifiers for pointer types:
>
> I think it'd be better if each extension were individually described
> with an example output.
>
>> +
>> + =C2=A0 =C2=A0 General:
>> +
>> + =C2=A0 =C2=A0 %pF =C2=A0 =C2=A0 function pointer with offset, e.g.=
 module_start
>> + =C2=A0 =C2=A0 %pf =C2=A0 =C2=A0 function pointer without offset, e=
=2Eg. module_start+0x0/0x62 [hello]
>
> with/without inversion?
>
>> + =C2=A0 =C2=A0 %pS =C2=A0 =C2=A0 text symbol with offset
>> + =C2=A0 =C2=A0 %ps =C2=A0 =C2=A0 text symbol without offset
>> + =C2=A0 =C2=A0 %pR =C2=A0 =C2=A0 struct resource with decoded flags=
, e.g. [mem 0x0-0x1f 64 bit pref]
>> + =C2=A0 =C2=A0 %pr =C2=A0 =C2=A0 struct resource with raw flags, e.=
g. [mem 0x0-0x1f flags 0x201]
>> +
>> + =C2=A0 =C2=A0 MAC/FDDI addresses:
>> +
>> + =C2=A0 =C2=A0 %pM =C2=A0 =C2=A0 colon-seperated 6-byte MAC address=
 in hex notation, e.g. 00:01:02:03:04:05
>
> spelling: separated
>
>> + =C2=A0 =C2=A0 %pm =C2=A0 =C2=A0 non-colon-seperated 6-byte MAC add=
ress is hex notation, e.g. 000102030405
>> + =C2=A0 =C2=A0 %pMF =C2=A0 =C2=A06-byte dash-separated FDDI hex not=
ation
>> +
>> + =C2=A0 =C2=A0 IPv4 addresses:
>> +
>> + =C2=A0 =C2=A0 %pI4 =C2=A0 =C2=A0IPv4 dot-seperated decimal without=
 leading 0's, e.g. 1.2.3.4
>> + =C2=A0 =C2=A0 %pi4 =C2=A0 =C2=A0IPv4 dot-seperated decimal with le=
ading 0's, 001.002.003.004
>> + =C2=A0 =C2=A0 %p[Ii]4[hl] IPv4 dot-seperated decimal with/without =
leading 0's for
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host (h), little (l) or =
network/big (default) endian order
>> +
>> + =C2=A0 =C2=A0 IPv6 addresses:
>> + =C2=A0 =C2=A0 %pI6 =C2=A0 =C2=A0IPv6 colon-seperated network-order=
 16 bit hex with leading 0's,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.g. 0001:0203:...:0708
>> + =C2=A0 =C2=A0 %pi6 =C2=A0 =C2=A0IPv6 non-colon-seperated network-o=
rder 16 bit hex with leading 0's,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.g. 000102...0f
>> + =C2=A0 =C2=A0 %pI6c =C2=A0 IPv6 address as described by
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://tools.ietf.org/ht=
ml/draft-ietf-6man-text-addr-representation-00,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.g. 1::708
>> +
>> + =C2=A0 =C2=A0 %pU[bBlL] 16 byte UUID/GUID in big or little endian =
using lower or upper case
>
> Maybe a simple 2 line table without the e.g.:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0%p<extension1> =C2=A0sample output1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0description1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0%p<extension2> =C2=A0sample output2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0description2
>
>
>



--=20
Andrew Murray, Embedded Linux Group
MPC Data Limited
e-mail: amurray@mpc-data.co.uk=C2=A0 web: www.mpc-data.co.uk
tel: +44 (0) 1225 710600=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0 fax: +44 (0) 1225 710601
ddi: +44 (0) 1225 710665

MPC Data Limited is a company registered in England and Wales with
company number 05507446
Registered Address: County Gate, County Way, Trowbridge, Wiltshire, BA1=
4 7FJ
VAT no: 850625238

The information in this email and in the attached documents is
confidential and may be
legally privileged. Any unauthorized review, copying, disclosure or
distribution is
prohibited and may be unlawful. It is intended solely for the
addressee. Access to this
email by anyone else is unauthorized. If you are not the intended
recipient, please
contact the sender by reply email and destroy all copies of the
original message. When
addressed to our clients any opinions or advice contained in this
email is subject to
the terms and conditions expressed in the governing contract.
