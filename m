From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 1/3]: Replace kernel/timeconst.pl with kernel/timeconst.sh
Date: Sun, 4 Jan 2009 22:50:35 -0600
Message-ID: <200901042250.36847.rob@landley.net>
References: <200901020207.30359.rob@landley.net> <20090104221356.GA32357@shareable.org> <1231114530.3310.6.camel@gimli.at.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1231114530.3310.6.camel@gimli.at.home>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernd Petrovitsch <bernd@firmix.at>
Cc: Jamie Lokier <jamie@shareable.org>, Valdis.Kletnieks@vt.edu, Ingo Oeser <ioe-lkml@rameria.de>, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Sunday 04 January 2009 18:15:30 Bernd Petrovitsch wrote:
> On Son, 2009-01-04 at 22:13 +0000, Jamie Lokier wrote:
> > Rob Landley wrote:
> > > In a private email, Bernd Petrovitsch suggested "set -- $i" and then
> > > using NAME=$1; PERIOD=$2.  (I keep getting private email responses
> > > to these sort of threads, and then getting dismissed as the only one
> > > who cares about the issue.  Less so this time around, but still...)
> > > This apparently works all the way back to the bourne shell.
> >
> > If you're going "all the way back to the bourne shell", don't use "set
>
> "Going back to a Bourne shell" was neither the intention nor makes it
> sense IMHO.
> I mentioned it to point out that the `set -- ' (or `set x `) is nothing
> new or even a bash-ism.
>
> > -- $i"; use "set x $i" instead, and don't expect to do any arithmetic
> > in the shell; use "expr" or "awk" for arithmetic.
> >
> > (Not relevant to kernel scripts, imho, since you can always assume
> > something a bit more modern and not too stripped down).
>
> ACK. A bash can IMHO be expected. Even going for `dash` is IMHO somewhat
> too extreme.

I have yet to encounter a system that uses dash _without_ bash.  (All ubuntu 
variants, even jeos, install bash by default.  They moved the /bin/sh symlink 
but they didn't stop installing bash, and the kernel will preferentially use 
bash if it finds it.)  People keep telling me they exist.  I suppose you could 
uninstall bash.  You could also uninstall gcc.  Not sure what that proves. 
(And nobody's shown me this mythical second implementation of perl that all 
these perl scripts are supposed to be portable to...)

Busybox ash is a more interesting case, but that implements lots of bash 
extensions.

That said, it's easy enough the scripts to work with current versions of dash.  
The whole shell portability issue mostly seems to be a stand-in for other 
objections (Peter Anvin didn't change syslinux and klibc to require perl to 
build this year because of dash), but it's easy enough to just address the 
proxy objection and move on rather than arguing about it...

> > (I have 850 Linux boxes on my network with a bourne shell which
> > doesn't do $((...)).  I won't be building kernels on them though :-)
>
> Believe it or not, but there are folks out there who build the firmware
> on ARM 200 MHz NFS-mounted systems natively  (and not simply
> cross-compile it on a 2GHz PC .....).

Yeah, but according to Changes if they do it with the current kernel they do 
it with at least gcc 3.2 (August 2002) and make 3.79.1 (June 2000), so trying 
to make it work on software released pre-Y2K probably isn't that high a 
priority. :)

> 	Bernd

Rob
