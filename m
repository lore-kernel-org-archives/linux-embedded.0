From: Bernd Petrovitsch <bernd@firmix.at>
Subject: Re: cross-compiling alternatives
Date: Fri, 13 Jun 2008 20:45:09 +0200
Message-ID: <1213382709.17853.79.camel@tara.firmix.at>
References: <1209577322.25560.402.camel@pmac.infradead.org>
	 <200806130843.05704.neundorf@eit.uni-kl.de>
	 <1213346316.17853.28.camel@tara.firmix.at>
	 <200806131106.18487.neundorf@eit.uni-kl.de>
	 <1213351433.17853.61.camel@tara.firmix.at>
	 <20080613151634.GJ11760@nibiru.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080613151634.GJ11760@nibiru.local>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: weigelt@metux.de
Cc: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Fre, 2008-06-13 at 17:16 +0200, Enrico Weigelt wrote:
> * Bernd Petrovitsch <bernd@firmix.at> schrieb:
> 
> > > Basically yes. But if you have a big number of packages (or a huge package) 
> > > which you didn't write yourself, there will be tests which run executables. 
> > > Figuring out what all the tests are supposed to test in a complex unknown 
> > > software project is not trivial.
> > 
> > Yes, you get used to find the relevant lines in config.log and similar
> > with `grep` and similar tools;-)
> 
> Which are different on each package. So you have to configure each package

ACK.

> for each target manually, which leads the whole point of autoconf
> ad absurdum ;-o

Yup.

[...]
> > pkg-config generated (and generates? - I didn't check recently)
> > references to libraries including the full absolute path (which is the
> > one at build time. And at run-time there is usually
> > no /home/bernd/src/... or where some build may just run).
> 
> Recent pkg-config supports sysroot.

FC-6 has "only" 0.21.

> So you simply build your .pc files as usual (w/o sysroot prefix) and
> set the sysroot prefix via env on the pkg-config call.

From a quick glance over the man page of 0.23, yes.

> > > Can you please explain ? How do the generated pkg_config files look like ?
> > > Ahh, you mean they contain e.g -L/my/build/host/target/environment/opt/foo/lib 
> > > instead of just -L/opt/foo/lib ?
> 
> Then you've got a broken .pc file ;-P

The problem is that the build-time (cross-)linker needs to find the
(cross-compiled) lib under /my/build/host/target/environment/opt/foo/lib
at link time and the shared linker under /opt/foo/lib at run-time.
Hmm, after digging into that old project, it seems that libtool and
the .la files were the problem.

> > Yes. And even worse the compiled lib "foo" had explicit dependencies (on
> > lib "bar") on
> > "/my/build/host/target/environment/opt/bar/lib/libbar.so.1.2.3.4". 
> 
> And that's even more broken.

Yup. Maybe it was a result of my trial to make libtool work somehow ..

> > And BTW pkg-config didn't support the concept of a "DESTDIR" variable
> > (and I don't care about the name of that variable).
> 
> No, why should it ?! It does not install anything.

But it may "use" installed files.

> Probably you're looking for sysroot ?

Yes, very probably.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


