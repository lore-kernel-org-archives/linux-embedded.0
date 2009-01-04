From: Michal Jaegermann <michal@ellpspace.math.ualberta.ca>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with
	kernel/timeconst.sh
Date: Sun, 4 Jan 2009 00:15:55 -0700
Message-ID: <20090104071555.GA1074@ellpspace.math.ualberta.ca>
References: <200901020207.30359.rob@landley.net> <200901020213.30658.rob@landley.net> <200901031328.23079.ioe-lkml@rameria.de> <200901031936.04642.rob@landley.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200901031936.04642.rob@landley.net>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Rob Landley <rob@landley.net>
Cc: Ingo Oeser <ioe-lkml@rameria.de>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Sat, Jan 03, 2009 at 07:36:04PM -0600, Rob Landley wrote:
> On Saturday 03 January 2009 06:28:22 Ingo Oeser wrote:
> > > +for i in "MSEC 1000" "USEC 1000000"
> > > +do
> > > +	NAME=3D$(echo $i | awk '{print $1}')
> >
> > cut -d' ' -f1  does the same
> >
> > > +	PERIOD=3D$(echo $i | awk '{print $2}')
> >
> > cut -d' ' -f2  does the same
>=20
> From a standards perspective=20
> http://www.opengroup.org/onlinepubs/9699919799/utilities/cut.html vs=20
> http://www.opengroup.org/onlinepubs/9699919799/utilities/awk.html is =
probably=20
> a wash, but from a simplicity perspective using the tool that _isn't_=
 its own=20
> programming language is probably a win. :)

Vagaries of 'cut' aside you can limit yourself here to just shell:

set_name_period () {
   NAME=3D$1 ; PERIOD=3D$2
}
for i in "MSEC 1000" "USEC 1000000"
do
   set_name_period $i
=2E...
done

or you may skip a shell function and do 'set $i' within a loop plus
assignments of $1 and $2 to NAME and PERIOD but that overwrites origina=
l
positional parameters (which may be already not important).

   Micha=C5=82
