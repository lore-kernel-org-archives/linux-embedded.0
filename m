From: Rob Landley <rob@landley.net>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Fri, 13 Jun 2008 13:01:36 -0500
Message-ID: <200806131301.36729.rob@landley.net>
References: <1209577322.25560.402.camel@pmac.infradead.org> <20080612163155.GC9327@linux-sh.org> <48515978.8040603@billgatliff.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_AYrUIwm8RYHsl65"
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48515978.8040603@billgatliff.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
To: Bill Gatliff <bgat@billgatliff.com>
Cc: linux-embedded@vger.kernel.org

--Boundary-00=_AYrUIwm8RYHsl65
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 12 June 2008 12:14:32 Bill Gatliff wrote:
> Paul Mundt wrote:
> > Yes, that's the easy case. It's things like perl that are the corner
> > cases, and my objection comes from the fact that people think we ought to
> > not have the kernel depend on perl rather than just fixing the package
> > itself. Autoconf/libtool damage is an entirely different problem :-)
>
> At first glance, it seems like checkincludes.pl could be duplicated by
> egrep | uniq | wc vs. egrep | wc.  Not quite sure what checkversion.pl is
> trying to do.

There's a difference between "this is a development tool used while modifying 
source code" and "this is needed to build".

There are situations where it's ok to have a dependency on X11/qt/gtk, such 
as "make xconfig".  This is _not_ the same as adding such dependency to "make 
modules".

So far, none of the perl dependencies prevent you from building the kernel on 
a system that didn't have perl (or didn't have the right version of perl).

> So maybe we could _reduce_ dependency on perl, if there's any advantage to
> gain by doing so.  But the kernel build machinery isn't dependent on very
> many other systems (just tcl, bash and gcc-core),

There's no tcl dependency in the build.  (Yes, I actually know this.)

Part of my FWL work involves getting the system to rebuild itself under 
itself.  (The packages you need to make a minimal self-bootstrapping system 
are gcc, binutils, make, bash, uClibc, linux, and busybox/toybox).  I'm seven 
commands away from doing this.

I know this because I made a horrible little wrapper (attached, it really is 
sad) which touched a file with the name it was called as and then exec()ed 
the actual executable out of another directory.  Then I populated a directory 
with symlinks to every executable in $PATH (for i in `echo $PATH | 
sed 's/:/ /g'`;do for j in `ls $i`; do ln -s $i/$j $j; done; done), and 
another directory of similar symlinks to my wrapper.  I then ran my build 
with that wrapper directory at the start of $PATH and let the wrapper 
populate a directory with all the executables that actually got called during 
the build.  Then I filled up a directory with those executables, tried to run 
the build, and figured out why it broke.  (The above approach won't find 
calls to /bin/bash and a few other things, but it's a good start.)

Most of the point of my ./host-tools.sh wrapper in the FWL build is to 
populate a directory with the command line utilities mini-native will have in 
it (specifically the busybox/toybox versions, not the ones in the host 
system), and set $PATH equal to that directory and only that directory.  This 
way I know the system will build under itself because that's how it's 
building in the first place.

Currently, I need to grab the following out of the host system:

for i in ar as nm cc gcc make ld   bzip2 find install od sort diff wget
do
  [ ! -f "${HOSTTOOLS}/$i" ] && (ln -s `which $i` "${HOSTTOOLS}/$i" || dienow)
done

The first seven are the needed bits of the host toolchain (you'd think "strip" 
would be in there, but it turns out those packages only ever use 
$TARGET-strip).  The last seven are the ones that are either missing or had 
various bugs in the version of busybox I'm using that prevented the build 
from working right.

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.

--Boundary-00=_AYrUIwm8RYHsl65
Content-Type: text/x-csrc;
  charset="iso-8859-1";
  name="wrappy.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="wrappy.c"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <fcntl.h>

char blah[65536];

#define ROOTPATH "/home/landley/firmware/firmware"

int main(int argc, char *argv[], char *env[])
{
  char *p, *p2;

  int i, fd;

  p2 = strrchr(*argv, '/');
  if (!p2) p2=*argv;
  else p2++;

  p=blah + sprintf(blah, "%s ",p2);
  for (i=1; i<argc; i++) {
    p += sprintf(p, "\"%s\" ",argv[i]);
  }
  p[-1]='\n';

  // Log the command line

  fd=open(ROOTPATH "/loggy.txt",O_WRONLY|O_CREAT|O_APPEND,0777);
  write(fd, blah, strlen(blah));
  close(fd);

  // Touch the file that got used.

  sprintf(blah,ROOTPATH "/used/%s", p2);
  close(open(blah, O_WRONLY|O_CREAT, 0777));

  // Hand off control to the real executable
  sprintf(blah, ROOTPATH "/handoff/%s", p2);
  execve(blah, argv, env);

  // Should never happen, means handoff dir is set up wrong.
  dprintf(2,"Didn't find %s\n", *argv);
  exit(1);
}

--Boundary-00=_AYrUIwm8RYHsl65--
