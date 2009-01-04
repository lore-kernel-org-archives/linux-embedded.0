From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 3 Jan 2009 19:32:32 -0600
Message-ID: <200901031932.33003.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <200901020513.19593.rob@landley.net> <495E3AF8.6000006@parrot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <495E3AF8.6000006@parrot.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matthieu CASTET <matthieu.castet@parrot.com>
Cc: Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>, linux-kernel@vger.kernel.org, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Friday 02 January 2009 10:04:08 Matthieu CASTET wrote:
> Rob Landley a =C3=A9crit :
> > On Friday 02 January 2009 03:26:37 Arkadiusz Miskiewicz wrote:
> >> On Friday 02 of January 2009, Rob Landley wrote:
> >>
> >> Heh,
> >
> > I believe all three scripts run under dash and busybox ash.  (The
> > timeconst.sh one needs 64 bit math which dash only provides on 64 b=
it
> > hosts, which is a regression from Red Hat 9 in 2003 by the way.
>
> With dash 0.5.4-12 (from debian sid), I seems I got the 64 bit math f=
or
> 32 bit hosts :
> $ uname -m
> i686
> $ dash -c 'echo $((1<<32))'
> 4294967296
>
>
> Matthieu

Alas, my attempt to install a 32 bit version of xubuntu 8.10 under qemu=
 hung=20
at "Scanning files: 15%", and has been there for an hour now.  I'll hav=
e to=20
take your word for it.  (All three scripts work fine under 64 bit dash.=
)

I encountered one bug in busybox, which I pinged that list about, but=20
otherwise busybox ash works on 'em all too.

Rob
