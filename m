From: =?UTF-8?B?UMOhZHJhaWcgQnJhZHk=?= <P@draigBrady.com>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Thu, 15 Jan 2009 14:32:57 +0000
Message-ID: <496F4919.8060302@draigBrady.com>
References: <200901020207.30359.rob@landley.net> <200901032006.47652.rob@landley.net> <49601B94.3060408@zytor.com> <200901040029.03396.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <200901040029.03396.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rob Landley <rob@landley.net>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Leon Woestenberg <leon.woestenberg@gmail.com>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, austin-group-l@opengroup.org

Rob Landley wrote:
> Implementing something by hand isn't _always_ a good alternative, sur=
e.  That=20
> would be the "thinking about the problem" part.  In this instance, av=
oiding=20
> overflow is trivial.  (If 1<<-1 didn't wrap around, it wouldn't even =
need the=20
> if statement.)

I don't think this affects your script but it's worth noting
that both bash and ksh use arithmetic rather than logical shift
for the >> operator.

Now arithmetic shift is not useful on 2's compliment machines,
and moreover it's compiler dependent as to whether arithmetic
or logical shift is done for >>. Therefore to increase usefulness
and decrease ambiguity, shells really should only shift unsigned
variables internally.

I know the opengroup spec says to use signed ints, but I think
that is intended to disambiguate input and output, rather than defining
internal operations. This is correct I think since the POSIX spec says
you can even use floating point internally if you like.

I asked the bash maintainer who said he would need clarification
from the austin group (CC'd) before changing anything.

cheers,
P=C3=A1draig.
