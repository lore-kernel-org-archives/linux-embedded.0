From: Mark Miller <mark@mirell.org>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Fri, 2 Jan 2009 04:30:06 -0600
Message-ID: <865953A9-E699-45E1-A726-F3F4EE41A0C9@mirell.org>
References: <200901020207.30359.rob@landley.net> <200901021026.37905.a.miskiewicz@gmail.com> <20090102094934.GB17841@infradead.org> <495DE995.1070002@opensde.org>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <495DE995.1070002@opensde.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: Alejandro Mery <amery@opensde.org>
Cc: Christoph Hellwig <hch@infradead.org>, Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>


On Jan 2, 2009, at 4:16 AM, Alejandro Mery wrote:

> Christoph Hellwig escribi=F3:
>> On Fri, Jan 02, 2009 at 10:26:37AM +0100, Arkadiusz Miskiewicz wrote=
:
>>
>>> On Friday 02 of January 2009, Rob Landley wrote:
>>>
>>>> Before 2.6.25 (specifically git =20
>>>> bdc807871d58285737d50dc6163d0feb72cb0dc2 )
>>>> building a Linux kernel never required perl to be installed on =20
>>>> the build
>>>> system.  (Various development and debugging scripts were written =20
>>>> in perl
>>>> and python and such, but they weren't involved in actually =20
>>>> building a
>>>> kernel.) Building a kernel before 2.6.25 could be done with a =20
>>>> minimal
>>>> system built from gcc, binutils, bash, make, busybox, uClibc, and =
=20
>>>> the Linux
>>>> kernel, and nothing else.
>>>>
>>> And now bash is going to be required... while some distros don't =20
>>> need/have
>>> bash. /bin/sh should be enough.
>>>
>>
>> *nod*  bash is in many ways a worse requirement than perl.  strict =20
>> posix
>> /bin/sh + awk + sed would be nicest, but if that's too much work per=
l
>> seems reasonable.

>>
> well, bash is not worse as bash is trivial to cross-compile to run =20
> on a
> constrained sandbox and perl is a nightmare, but I agree bash should =
=20
> be
> avoided too.
>
> I think the $(( ... )) bash-ism can be replaced with a simple .c =20
> helper toy.
>
> Thank Rob for reopening the topic.
>
> Alejandro Mery

And actually, one of the things that I just recalled, is that several =20
of the Perl configure scripts in order to actually build itself, rely =20
on Bourne shell calls. So the argument to require a strict POSIX+sed=20
+awk implementation rather than Perl to build the kernel, fails, since =
=20
you already require some variant of shell greater than strict POSIX /=20
bin/sh to build Perl. So this is one less dependency.

Also, attempting to cross-compile Perl, is indeed a nightmare.

--
Mark Miller
mark@mirell.org



