From: Andrew Murray <amurray@mpcdata.com>
Subject: Re: [PATCH] printk-formats.txt documentation update
Date: Fri, 10 Jun 2011 18:56:36 +0100
Message-ID: <BANLkTinww27eecz7zs4Ts33ci9ONBPM4pQ@mail.gmail.com>
References: <20110609124549.48117a75.rdunlap@xenotime.net>
	<1307654688-28015-1-git-send-email-amurray@mpcdata.com>
	<20110610105015.01504554.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110610105015.01504554.rdunlap@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: joe@perches.com, w.sang@pengutronix.de, geert@linux-m68k.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org, udknight@gmail.com, namhyung@gmail.com

Great! Thanks for the help.

On 10 June 2011 18:50, Randy Dunlap <rdunlap@xenotime.net> wrote:
> On Thu, =C2=A09 Jun 2011 22:24:48 +0100 Andrew Murray wrote:
>
>> From: Andrew Murray <amurray@mpc-data.co.uk>
>>
>> This patch updates the incomplete documentation concerning the print=
k
>> extended format specifiers
>>
>> Signed-off-by: Andrew Murray <amurray@mpc-data.co.uk>
>
> Applied with minor tweaks (including dropping trailing whitespace).
>
> Thanks.
>
>> ---
>> =C2=A0Documentation/printk-formats.txt | =C2=A0119 +++++++++++++++++=
++++++++++++++++++++-
>> =C2=A01 files changed, 117 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/printk-formats.txt b/Documentation/printk=
-formats.txt
>> index 1b5a5dd..6455e5b 100644
>> --- a/Documentation/printk-formats.txt
>> +++ b/Documentation/printk-formats.txt
>> @@ -9,7 +9,121 @@ If variable is of Type, =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 use printk format specifier:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%zu or %zx
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssize_t =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %zd or %zx
>>
>> -Raw pointer value SHOULD be printed with %p.
>> +Raw pointer value SHOULD be printed with %p. The kernel supports
>> +the following extended format specifiers for pointer types:
>> +
>> +Symbols/Function Pointers:
>> +
>> + =C2=A0 =C2=A0 %pF =C2=A0 =C2=A0 versatile_init+0x0/0x110
>> + =C2=A0 =C2=A0 %pf =C2=A0 =C2=A0 versatile_init
>> + =C2=A0 =C2=A0 %pS =C2=A0 =C2=A0 versatile_init+0x0/0x110
>> + =C2=A0 =C2=A0 %ps =C2=A0 =C2=A0 versatile_init
>> + =C2=A0 =C2=A0 %pB =C2=A0 =C2=A0 prev_fn_of_versatile_init+0x88/0x8=
8
>> +
>> + =C2=A0 =C2=A0 For printing symbols and function pointers. The 'S' =
and 's' specifiers
>> + =C2=A0 =C2=A0 result in the symbol name with ('S') or without ('s'=
) offsets. Where
>> + =C2=A0 =C2=A0 this is used on a kernel without KALLSYMS - the symb=
ol address is
>> + =C2=A0 =C2=A0 printed instead.
>> +
>> + =C2=A0 =C2=A0 The 'B' specifier results in the symbol name with of=
fsets and should be
>> + =C2=A0 =C2=A0 used when printing stack backtraces. The specifier t=
akes into
>> + =C2=A0 =C2=A0 consideration the effect of compiler optimisations w=
hich may occur
>> + =C2=A0 =C2=A0 when tail-call's are used and marked with the noretu=
rn GCC attribute.
>> +
>> + =C2=A0 =C2=A0 On ia64, ppc64 and parisc64 architectures function p=
ointers are
>> + =C2=A0 =C2=A0 actually function descriptors which must first be re=
solved. The 'F' and
>> + =C2=A0 =C2=A0 'f' specifiers perform this resolution and then prov=
ide the same
>> + =C2=A0 =C2=A0 functionality as the 'S' and 's' specifiers.
>> +
>> +Kernel Pointers:
>> +
>> + =C2=A0 =C2=A0 %pK =C2=A0 =C2=A0 0x01234567 or 0x0123456789abcdef
>> +
>> + =C2=A0 =C2=A0 For printing kernel pointers which should be hidden =
from unprivileged
>> + =C2=A0 =C2=A0 users. The behaviour of %pK depends on the kptr_rest=
rict sysctl - see
>> + =C2=A0 =C2=A0 Documentation/sysctl/kernel.txt for more details.
>> +
>> +Struct Resources:
>> +
>> + =C2=A0 =C2=A0 %pr =C2=A0 =C2=A0 [mem 0x60000000-0x6fffffff flags 0=
x2200] or
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [mem 0x0000000060000000-=
0x000000006fffffff flags 0x2200]
>> + =C2=A0 =C2=A0 %pR =C2=A0 =C2=A0 [mem 0x60000000-0x6fffffff pref] o=
r
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [mem 0x0000000060000000-=
0x000000006fffffff pref]
>> +
>> + =C2=A0 =C2=A0 For printing struct resources. The 'R' and 'r' speci=
fiers result in a
>> + =C2=A0 =C2=A0 printed resource with ('R') or without ('r') a decod=
ed flags member.
>> +
>> +MAC/FDDI addresses:
>> +
>> + =C2=A0 =C2=A0 %pM =C2=A0 =C2=A0 00:01:02:03:04:05
>> + =C2=A0 =C2=A0 %pMF =C2=A0 =C2=A000-01-02-03-04-05
>> + =C2=A0 =C2=A0 %pm =C2=A0 =C2=A0 000102030405
>> +
>> + =C2=A0 =C2=A0 For printing 6-byte MAC/FDDI addresses in hex notati=
on. The 'M' and 'm'
>> + =C2=A0 =C2=A0 specifiers result in a printed address with ('M') or=
 without ('m') byte
>> + =C2=A0 =C2=A0 separators. The default byte separator is the colon =
(':').
>> +
>> + =C2=A0 =C2=A0 Where FDDI addresses are concerned the 'F' specifier=
 can be used after
>> + =C2=A0 =C2=A0 the 'M' specifier to use dash ('-') separators inste=
ad of the default
>> + =C2=A0 =C2=A0 separator.
>> +
>> +IPv4 addresses:
>> +
>> + =C2=A0 =C2=A0 %pI4 =C2=A0 =C2=A01.2.3.4
>> + =C2=A0 =C2=A0 %pi4 =C2=A0 =C2=A0001.002.003.004
>> + =C2=A0 =C2=A0 %p[Ii][hnbl]
>> +
>> + =C2=A0 =C2=A0 For printing IPv4 dot-separated decimal addresses. T=
he 'I4' and 'i4'
>> + =C2=A0 =C2=A0 specifiers result in a printed address with ('i4') o=
r without ('I4')
>> + =C2=A0 =C2=A0 leading zeros.
>> +
>> + =C2=A0 =C2=A0 The additional 'h', 'n', 'b', and 'l' specifiers are=
 used to specify
>> + =C2=A0 =C2=A0 host, network, big or little endian order addresses =
respectively. Where
>> + =C2=A0 =C2=A0 no specifier is provided the default network/big end=
ian order is used.
>> +
>> +IPv6 addresses:
>> +
>> + =C2=A0 =C2=A0 %pI6 =C2=A0 =C2=A00001:0002:0003:0004:0005:0006:0007=
:0008
>> + =C2=A0 =C2=A0 %pi6 =C2=A0 =C2=A000010002000300040005000600070008
>> + =C2=A0 =C2=A0 %pI6c =C2=A0 1:2:3:4:5:6:7:8
>> +
>> + =C2=A0 =C2=A0 For printing IPv6 network-order 16-bit hex addresses=
=2E The 'I6' and 'i6'
>> + =C2=A0 =C2=A0 specifiers result in a printed address with ('I6') o=
r without ('i6')
>> + =C2=A0 =C2=A0 colon-separators. Leading zeros are always used.
>> +
>> + =C2=A0 =C2=A0 The additional 'c' specifier can be used with the 'I=
' specifier to
>> + =C2=A0 =C2=A0 print a compressed IPv6 address as described by
>> + =C2=A0 =C2=A0 http://tools.ietf.org/html/rfc5952
>> +
>> +UUID/GUID addresses:
>> +
>> + =C2=A0 =C2=A0 %pUb =C2=A0 =C2=A000010203-0405-0607-0809-0a0b0c0d0e=
0f
>> + =C2=A0 =C2=A0 %pUB =C2=A0 =C2=A000010203-0405-0607-0809-0A0B0C0D0E=
0F
>> + =C2=A0 =C2=A0 %pUl =C2=A0 =C2=A003020100-0504-0706-0809-0a0b0c0e0e=
0f
>> + =C2=A0 =C2=A0 %pUL =C2=A0 =C2=A003020100-0504-0706-0809-0A0B0C0E0E=
0F
>> +
>> + =C2=A0 =C2=A0 For printing-16 byte UUID/GUIDs addresses. The addit=
ional 'l', 'L',
>> + =C2=A0 =C2=A0 'b' and 'B' specifiers are used to specify a little =
endian order in
>> + =C2=A0 =C2=A0 lower ('l') or upper case ('L') hex characters - and=
 big endian order
>> + =C2=A0 =C2=A0 in lower ('b') or upper case ('B') hex characters.
>> +
>> + =C2=A0 =C2=A0 Where no additional specifiers are used the default =
little endian
>> + =C2=A0 =C2=A0 order with lower case hex characters will be printed=
=2E
>> +
>> +struct va_format:
>> +
>> + =C2=A0 =C2=A0 %pV
>> +
>> + =C2=A0 =C2=A0 For printing struct va_format structures. These cont=
ain a format string
>> + =C2=A0 =C2=A0 and va_list as follows:
>> +
>> + =C2=A0 =C2=A0 struct va_format {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *fmt;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 va_list *va;
>> + =C2=A0 =C2=A0 };
>> +
>> + =C2=A0 =C2=A0 Do not use this feature without some mechanism to ve=
rify the
>> + =C2=A0 =C2=A0 correctness of the format string and va_list argumen=
ts.
>>
>> =C2=A0u64 SHOULD be printed with %llu/%llx, (unsigned long long):
>>
>> @@ -32,4 +146,5 @@ Reminder: sizeof() result is of type size_t.
>> =C2=A0Thank you for your cooperation and attention.
>>
>>
>> -By Randy Dunlap <rdunlap@xenotime.net>
>> +By Randy Dunlap <rdunlap@xenotime.net> and
>> +Andrew Murray <amurray@mpc-data.co.uk>
>> --
>> 1.7.4.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-embe=
dded" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
>
>
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your c=
ode ***
>
