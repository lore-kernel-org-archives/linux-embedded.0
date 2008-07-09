From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: building Rootfs
Date: Wed, 9 Jul 2008 09:06:53 +0200
Message-ID: <20080709070653.GV4319@pengutronix.de>
References: <BAY131-W252EE4B85EEB3F7A87466FE2940@phx.gbl> <4871E98F.8030802@gmail.com> <20080707181018.GG4319@pengutronix.de> <63386a3d0807071334q2242ac45x540cee2a3fcb231b@mail.gmail.com> <20080707212150.GK4319@pengutronix.de> <63386a3d0807081714x5bbf1f03l3c108adc8243f6d7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <63386a3d0807081714x5bbf1f03l3c108adc8243f6d7@mail.gmail.com>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.ml.walleij@gmail.com>
Cc: linux-embedded@vger.kernel.org

On Wed, Jul 09, 2008 at 02:14:04AM +0200, Linus Walleij wrote:
> > They are both build systems for userlands, or whole embedded linux
> > systems. I cannot speak for OE as I don't really know it in detail.
>
> Anyone have experience with both? I'd really like to have them
> contrasted and, well you know, cross-firtualized.

When we started with ptxdist, OE was not there. When I last tried it, we
still saw the following advantages in our design:

- standard unix technology (make+bash) instead of python did fit our
  skills better (yes, a very personal argument)

- we have a "project" pattern: users have their "project workspace"
  which can for example be revisioned in the user's own scm.

- ptxdist can be installed as a tool (to be installed with configure &&
  make && make install) and contains anything you need, besides the
  "project". With OE, we had to checkout bit repositories.

- ptxdist has a clear revision policy, with stable and unstable
  development branches. There are numbered releases available.

- ptxdist has full configurability; everything can be configured with
  kconfig menues.

Other than that, the OE people have very good ideas and found similar
problems and solutions as the ptxdist team did. They have a similar
patch stack concept which makes it easy to share ideas.

> I really like ptxdist, especially it is beautiful that you have based
> it around just bash and make plus some crosscompiler of choice.

Yup :-)

> I just have some trouble getting it to do what I want. I'll hopefully
> get there. This is not meant as any generic complaining. I'm trying to
> figure out if ptxdist or openembedded is the best starting point.

So if you see problems, just post your ptxconfig file on the ptxdist
mailing list. We will be glad to discuss your problems there.

> I have a situation where the build system would be on top of some SCM
> like git, CVS or whatever and packages being checked out and worked on
> by several people daily.

You can overwrite almost everything in the project that is defined in
ptxdist; for example, if you have a rule set rules/foobar.make and a
corresponding menu rules/foobar.in in ptxdist, you can also have these
files in the project workspace and they overrule the ones which come
from the base package.

So what you can do is:

- have your project workspace, like this:
  /home/you/my_project/ptxconfig
  /home/you/my_project/rules/my_packet.in
  /home/you/my_project/rules/my_packet.make

- If several people shall work on the "local" packages in rules/, just
  put the whole workspace into your SCM. That works pretty well in real
  life; we have done big projects that way, where several ten people
  worked together in a project team, synchronized via SVN.

- You can also make use of svn externals: for example, we have a shared
  "technology pool" here at Pengutronix, with packages that are not
  ready for mainline but need to be shared. We just bring them into a
  project via svn:externals.

- Imagine team member A works on package foobar, has tested it and
  released foobar-1.0.0 somwhere in the repository. He then changes
  rules/foobar.make to contain the revision number 1.0.0. Then he
  continues developing, changing the revision to -trunk or whatever he
  uses internally, but only on his workspace, without checking in. This
  way he can do all the development, until the point that he has
  released 1.0.1. Then he just checks in the changed .make file with the
  new revision and everybody else sees the new and tested packet.

What does not work yet out-of-the-box is that one team develops for
example a base platform, which is then made available in binary form,
and everyone else gets just the binary packets foo_x.y.z_arch.ipk
instead of compiling from scratch.

We have ideas how to realize that, as it is a common pattern in our
projects. Will be a ptxdist-2.x issue.

> ptxdist seems
> * hardcoded to run in a users home directory
>   with projects in $HOME/foo (stopped me
>   right now, perhaps it can easily be fixed or is
>   already part of ptxdist 2?)

It is already part of ptxdist-1.0.x. You can put your project workspace
whereever you want.

> * assume only one person builds rootfs. So
>   it doesn't really want the project tree to be used
>   or modified by more than one person at the time.
>   (Same as first more or less.)

If different people are working on it, everyone has his own working
copy. It's not different from other revisioned projects.

> * not store source code, patches and config plus my
>   local additions in one place. For most other package
>   systems e.g. RPM there is
>   /foo/foo.spec
>   /foo/foo-1.0.tar.gz
>   /foo/foo-patch1.diff
>   /foo/foo-patch2.diff
>   /foo/my-foo-config.file
> 
> In ptxdist these seem to be spread out, some in the installation
> of ptxdist itself in say /usr/lib/ptxdist/patches, /usr/lib/ptxdist/...
> then in my project space $HOME/project/... etc.

Think of it as object orientation, written in make :-) For each packet
(let's say bash), ptxdist brings it's own information with it:

rules/bash.make			rule set (what is to be done)
rules/bash.in			menu definition (kconfig)
patches/bash-x.y/generic/	patch series (quilt format, canonical
				patches, following kernel rules)

PTXdist brings a "set" of such packages with each installation of the
tool itself (i.e. ptxdist-1.0.2 has it's own packet set).

You can overwrite packages (make, in and patches) by simply putting them
into the project. This makes it possible to change things in single
packets, without the need to switch to a new ptxdist version.

> I believe at archivicing time everything including ptxdist itself
> is zipped up and archived on one storage media. But I need to
> keep all files relating to a package in one place while developing,
> and living like that for a long time. Since /usr/lib/ptxdist isn't even
> being backed up normally, only NFS mounts like /home, I then
> need to move the entire ptxdist into the SCM, which it clearly
> doesn't like without a lot of hacking, plus, how would I
> upgrade it?

Archiving is pretty easy: all you need is:

- the ptxdist tarballs you have installed from
- all the source tarballs which have been downloaded on the first run of
  the "get" stages
- your project workspace

It was *desinged* to be easily archived, so this is exactly what has to
be done.

HTH,
rsc
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
