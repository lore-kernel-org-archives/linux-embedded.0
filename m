From: Mark Miller <mark@mirell.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 2 Jan 2009 04:02:33 -0600
Message-ID: <8A892FD3-50DE-4AFF-A314-5BB3284644EC@mirell.org>
References: <200901020207.30359.rob@landley.net> <200901021026.37905.a.miskiewicz@gmail.com>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901021026.37905.a.miskiewicz@gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed	delsp=yes"
To: Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>
Cc: linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>


On Jan 2, 2009, at 3:26 AM, Arkadiusz Miskiewicz wrote:

> On Friday 02 of January 2009, Rob Landley wrote:
>> Before 2.6.25 (specifically git =20
>> bdc807871d58285737d50dc6163d0feb72cb0dc2 )
>> building a Linux kernel never required perl to be installed on the =20
>> build
>> system.  (Various development and debugging scripts were written in =
=20
>> perl
>> and python and such, but they weren't involved in actually building =
a
>> kernel.) Building a kernel before 2.6.25 could be done with a minima=
l
>> system built from gcc, binutils, bash, make, busybox, uClibc, and =20
>> the Linux
>> kernel, and nothing else.
>
> And now bash is going to be required... while some distros don't =20
> need/have
> bash. /bin/sh should be enough.

Which distros only have /bin/sh which do not have Perl? I'm honestly =20
curious.

> --=20
> Arkadiusz Mi=C5=9Bkiewicz        PLD/Linux Team
> arekm / maven.pl            http://ftp.pld-linux.org/

--
Mark Miller
mark@mirell.org



