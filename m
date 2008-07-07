From: "Haller, John H \(John\)" <jhaller@alcatel-lucent.com>
Subject: RE: building Rootfs
Date: Mon, 7 Jul 2008 18:24:48 -0500
Message-ID: <B78930B8E34A824993912C39C24569E60141D874@ILEXC3U01.ndc.lucent.com>
References: <BAY131-W252EE4B85EEB3F7A87466FE2940@phx.gbl> <4871E98F.8030802@gmail.com> <20080707181018.GG4319@pengutronix.de> <63386a3d0807071334q2242ac45x540cee2a3fcb231b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <63386a3d0807071334q2242ac45x540cee2a3fcb231b@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Walleij <linus.ml.walleij@gmail.com>, linux-embedded@vger.kernel.org

> 
> What else is there out there for rootfs, really? A hack
> from every embedded company there is? I'm more after
> what people actually *use* and what is community driven
> here, not so much opinions on what is best (which will
> probably be the unwanted side effect of this mail
> anyway...)
> 
> Linus

There are three issues in building an embedded cross-filesystem:
1. Identification of the files to put into the filesystem.
2. Stripping or extracting debug symbols from the filesystem.
3. Getting files into the filesystem when the development
system does not allow root access.

The first item is made a little easier by RPM, as it groups
files together into packages, and package dependencies are
quite often properly declared. However, packages sometimes
have dependencies on another package when only part of the
package may be required. Another problem is with documentation
files (usually unwanted on an embedded system), and locales
which are huge and generally unwanted.

The second item can be tricky, as one doesn't want to
strip debug symbols every time a filesystem is built, but
the debug symbols are generally needed for cross debugging.
debugedit from the RPM package does a nice job of this,
separating the debug symbols from the executable, but
it is best to do this when an cross executable is installed
on the host system, rather than at filesystem build time.

The third item is easy for an initramfs, but not well handled
by existing tools for an initrd (although I haven't looked
recently). One possibility is to modify a mkfs program, such
as mke2fs, for the filesystem of choice to accept proto
files, like the traditional Unix mkfs does. [Google mkfs proto
for some examples]. I'm not sure if ptxdist supports both
initramfs and initrd. If you do have root access, this is
all much simpler, as an initrd can be locally mounted
and populated.

One other item that pops up sometimes is post-install scripts
that are associated with some packages. These scripts run in
the target filesystem, and there is no good way to run them
in the host environment. This doesn't happen too often, so
it can usually be handled by hand as an exception. One example
of this type of item is installing the symbolic links in the
right place for init scripts. Another option would be to
capture the scripts and run them during boot, but this would
slow boot times.

Using the tools from an embedded vendor has two problems -
they can change from release to release, and they are proprietary
tools that lock you into the vendor. But, they may provide
a GUI, if you are into graphical presentations.



John Haller
