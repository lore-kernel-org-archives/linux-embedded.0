From: Mark Miller <mark@mirell.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 2 Jan 2009 04:03:47 -0600
Message-ID: <45153060-F5A5-44BE-B2A0-C995E65ACE9C@mirell.org>
References: <200901020207.30359.rob@landley.net> <200901021026.37905.a.miskiewicz@gmail.com> <8A892FD3-50DE-4AFF-A314-5BB3284644EC@mirell.org>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758008AbZABKEP@vger.kernel.org>
In-Reply-To: <8A892FD3-50DE-4AFF-A314-5BB3284644EC@mirell.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed	delsp=yes"
To: Mark Miller <mark@mirell.org>
Cc: Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>


On Jan 2, 2009, at 4:02 AM, Mark Miller wrote:

>
> On Jan 2, 2009, at 3:26 AM, Arkadiusz Miskiewicz wrote:
>
>> On Friday 02 of January 2009, Rob Landley wrote:
>>> Before 2.6.25 (specifically git =20
>>> bdc807871d58285737d50dc6163d0feb72cb0dc2 )
>>> building a Linux kernel never required perl to be installed on the =
=20
>>> build
>>> system.  (Various development and debugging scripts were written =20
>>> in perl
>>> and python and such, but they weren't involved in actually =20
>>> building a
>>> kernel.) Building a kernel before 2.6.25 could be done with a =20
>>> minimal
>>> system built from gcc, binutils, bash, make, busybox, uClibc, and =20
>>> the Linux
>>> kernel, and nothing else.
>>
>> And now bash is going to be required... while some distros don't =20
>> need/have
>> bash. /bin/sh should be enough.
>
> Which distros only have /bin/sh which do not have Perl? I'm honestly =
=20
> curious.

That is, *do* have Perl. Typo there.

>
>
>> --=20
>> Arkadiusz Mi=C5=9Bkiewicz        PLD/Linux Team
>> arekm / maven.pl            http://ftp.pld-linux.org/

--
Mark Miller
mark@mirell.org



