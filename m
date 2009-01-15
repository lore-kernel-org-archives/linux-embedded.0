From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Thu, 15 Jan 2009 19:45:10 +0000
Message-ID: <yw1xtz80z73t.fsf@thrashbarg.mansr.com>
References: <200901020207.30359.rob@landley.net>
	<200901021026.37905.a.miskiewicz@gmail.com>
	<20090102094934.GB17841@infradead.org> <495DE995.1070002@opensde.org>
	<yw1x3ag2t2gd.fsf@thrashbarg.mansr.com>
	<496F3344.9060104@draigBrady.com>
	<20090115185224.GB5440@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090115185224.GB5440@shareable.org> (Jamie Lokier's message of "Thu, 15 Jan 2009 18:52:24 +0000")
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jamie Lokier <jamie@shareable.org>
Cc: =?iso-8859-1?Q?P=E1draig?= Brady <P@draigBrady.com>, =?iso-8859-1?Q?M?= =?iso-8859-1?Q?=E5ns_Rullg=E5rd?= <mans@mansr.com>, linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org

Jamie Lokier <jamie@shareable.org> writes:

> P=E1draig Brady wrote:
>> > The $(( ... )) construct is standard POSIX shell syntax, see
>> > http://www.opengroup.org/onlinepubs/000095399/utilities/xcu_chap02=
=2Ehtml#tag_02_06_04
>> >=20
>> > Bash supports $[ ... ] as an alternate syntax for the same thing.
>> > Perhaps you were thinking of that.
>>=20
>> I think the misconception that $(( ... )) is a bashism is caused by
>> the wrong highlighting defaults chosen by vim.
>
> I think the misconception is because traditional unix bourne shells
> don't implement that construct.  I just tried it on a few machines,
> and it failed on 4 of them.  Admittedly, the only up to date one is
> running Solaris 10; the others are older unixes that you're unlikely
> to build Linux on.

On Solaris, /usr/xpg4/bin/sh is usually a POSIX-compliant shell.  I
don't know how long it has been there.

--=20
M=E5ns Rullg=E5rd
mans@mansr.com
