From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 02 Jan 2009 10:41:22 +0000
Message-ID: <yw1x3ag2t2gd.fsf@thrashbarg.mansr.com>
References: <200901020207.30359.rob@landley.net> <200901021026.37905.a.miskiewicz@gmail.com> <20090102094934.GB17841@infradead.org> <495DE995.1070002@opensde.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758165AbZABKqH@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-kernel@vger.kernel.org
Cc: linux-embedded@vger.kernel.org

Alejandro Mery <amery@opensde.org> writes:

> Christoph Hellwig escribi=F3:
>> On Fri, Jan 02, 2009 at 10:26:37AM +0100, Arkadiusz Miskiewicz wrote=
:
>>  =20
>>> On Friday 02 of January 2009, Rob Landley wrote:
>>>    =20
>>>> Before 2.6.25 (specifically git bdc807871d58285737d50dc6163d0feb72=
cb0dc2 )
>>>> building a Linux kernel never required perl to be installed on the=
 build
>>>> system.  (Various development and debugging scripts were written i=
n perl
>>>> and python and such, but they weren't involved in actually buildin=
g a
>>>> kernel.) Building a kernel before 2.6.25 could be done with a mini=
mal
>>>> system built from gcc, binutils, bash, make, busybox, uClibc, and =
the Linux
>>>> kernel, and nothing else.
>>>>      =20
>>> And now bash is going to be required... while some distros don't ne=
ed/have=20
>>> bash. /bin/sh should be enough.
>>>    =20
>>
>> *nod*  bash is in many ways a worse requirement than perl.  strict p=
osix
>> /bin/sh + awk + sed would be nicest, but if that's too much work per=
l
>> seems reasonable.
> well, bash is not worse as bash is trivial to cross-compile to run on=
 a
> constrained sandbox and perl is a nightmare, but I agree bash should =
be
> avoided too.
>
> I think the $(( ... )) bash-ism can be replaced with a simple .c help=
er toy.

The $(( ... )) construct is standard POSIX shell syntax, see
http://www.opengroup.org/onlinepubs/000095399/utilities/xcu_chap02.html=
#tag_02_06_04

Bash supports $[ ... ] as an alternate syntax for the same thing.
Perhaps you were thinking of that.

--=20
M=E5ns Rullg=E5rd
mans@mansr.com
