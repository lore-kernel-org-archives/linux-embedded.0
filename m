From: Rob Landley <rob@landley.net>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Sat, 17 Jan 2009 19:44:03 -0600
Message-ID: <200901171944.05014.rob@landley.net>
References: <495FEEAF.5020005@zytor.com> <200901161554.02054.rob@landley.net> <20090117095143.GA20389@shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20090117095143.GA20389@shareable.org>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Valdis.Kletnieks@vt.edu, Embedded Linux mailing list <linux-embedded@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

On Saturday 17 January 2009 03:51:43 Jamie Lokier wrote:
> Rob Landley wrote:
> > On Friday 16 January 2009 08:54:42 Valdis.Kletnieks@vt.edu wrote:
> > > On Fri, 16 Jan 2009 00:11:09 CST, Rob Landley said:
> > > > P.S.  I still hope autoconf dies off and the world wakes up and moves
> > > > away from that.  And from makefiles for that matter.  But in the
> > > > meantime, I can work around it with enough effort.
> > >
> > > What do you propose autoconf and makefiles get replaced by?
> >
> > I've never built pidgin from source, but I've got the output of the
> > binutils build in a log file.
> > How many of these tests are actually necessary on an Linux system:
>
> None, but then it's not a Linux-only program that you're compiling.
> (Nor is it Linux-in-2009-only).

Yeah, I noticed.  It's not quite as bad as OpenSSL (where Linux support is 
intentionally an afterthought), but things like "Libtool" are supposed to be a 
NOP on ELF Linux and yet regularly screw up builds.  (It's supposed to do 
nothing, and can't manage to do it correctly.  That's sad.)

> If you _know_ you're running on Linux from a particular era, you can
> provide a config.cache file with the correct answers already filled in.

And yet very few projects actually do.

As for "from a particular era", just for fun I fired up the Red Hat 9 qemu 
image I keep around for this sort of thing, downloaded glibc 2.7 (the most 
recent one they bothered to cut a tarball for on ftp.gnu.org and one of the 
big autoconf offenders), and ran its ./configure.  It died with:

configure: error:
*** These critical programs are missing or too old: gcc
*** Check the INSTALL file for required versions.

So you can't build a 2 year old version of glibc under a 6 year old version of 
Linux (which was the most popular Linux version in the world when it shipped, 
with about 50% market share among Linux seats).  And yet glibc (one of the 
FSF's flagship projects) bothers doing extensive autoconf probes.  Why?  
Autoconf isn't really _helping_ here...

The bottom line is that if your assumption is that you have an open source 
application targeting an open source operating system, lots of the hoops you 
used to have to jump through just aren't very interesting anymore.

> I agree that Autoconf sucks (I've written enough sucking Autoconf
> macros myself, I hate it), but the tough part is providing a suitable
> replacement when you still want portable source code.

Depends on your definition of "portable".  The unix wars of the 80's are over; 
they're pretty much all dead.  Even the surviving legacy deployments of 
Solaris and AIX provide Linux emulation environments.  And of course FreeBSD's 
done so for years: 
http://www.onlamp.com/pub/a/bsd/2006/01/12/Big_Scary_Daemons.html

MacOS X and windows are still very much alive, but if you want to target those 
you can either A) treat them as Posix/SUSv3 (which both _claim_ to support), 
B) use cross platform libraries like SDL and opengl and program to their APIs, 
C) bother to do a proper port of the thing ala 
http://porting.openoffice.org/mac/ or http://www.kju-app.org/ or the way khtml 
wound up in Safari.

For Windows there's Cygwin, running windows programs on Linux has Wine.  Or 
just qemu/kvm in either direction.

Basically, pick a standard to write to.  If you want to write to posix and 
SUSv4, do it.  If you want to add in LSB and the Linux man pages, go for it.  
But autoconf was designed for portability between Irix and HP-UX, which just 
doesn't come up much anymore.

> > It just goes on and on and on like this.  Tests like "checking
> > whether byte ordering is bigendian... no" means "Either I didn't
> > know endian.h existed, or I don't trust it to be there".  How about
> > the long stretches checking for the existence of header files
> > specified by posix?
>
> You seem to be arguing for "let's make all our programs Linux-specific
> (and Glibc-specific in many cases)".

Checking for the existence of posix header files is Linux-specific?

I'm saying there are many standards, and you can choose to adhere to standards 
like LP64 (which MacOSX, Linux, and the BSDs all support) and _say_ you do so 
and achieve portability that way.

You also have "#if defined __linux__" and "#if defined __APPLE__" and so on, 
so header files can do a lot of the tests that people wind up doing with 
autoconf for some reason.

And there will always be platforms you're NOT portable to.  (Game consoles 
come to mind: your average autoconf recipe isn't going to make your program 
run on a PS3, XBox 360, or Wii.  Unless you load Linux on those systems first 
and program for Linux.)

> Given all the problems you've
> seen with cross-compiling, let alone compiling for different OS
> platforms, that seems a little odd.

If I can't get Linux running on the hardware (which is seldom an interesting 
case anymore; it's on everything from cell phones to the S390), and I can't 
get a Linux emulation environment like Solaris' lxrun, aix5L, or cygwin, then 
I probably want a rigidly posix environment.  (Heck, even wince has celib and 
gnuwince, not that I really care.)

The extra "portability" isn't even going to buy you 5% more seats these days.  
It's really not that interesting.  It's not that the world is homogenous now, 
it's that between open source and open standards we don't need giant if/else 
ladders with hundreds of tests to cover the interesting cases.  And trying to 
achieve portability by relying on standards is a superior approach to trying 
to achieve portability via an infinite series of special case checks.

> -- Jamie

Rob
