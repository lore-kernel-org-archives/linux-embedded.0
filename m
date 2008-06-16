From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives
Date: Mon, 16 Jun 2008 06:08:54 +0200
Message-ID: <20080616040854.GG12962@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806130843.05704.neundorf@eit.uni-kl.de> <1213346316.17853.28.camel@tara.firmix.at> <200806131106.18487.neundorf@eit.uni-kl.de> <1213351433.17853.61.camel@tara.firmix.at> <20080613151634.GJ11760@nibiru.local> <1213382709.17853.79.camel@tara.firmix.at>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1213382709.17853.79.camel@tara.firmix.at>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Bernd Petrovitsch <bernd@firmix.at> schrieb:

> > Recent pkg-config supports sysroot.
> 
> FC-6 has "only" 0.21.

Not sure when the sysroot stuff got into upstream releaes, but
maybe you just should update ;-P

> > So you simply build your .pc files as usual (w/o sysroot prefix) and
> > set the sysroot prefix via env on the pkg-config call.
> 
> From a quick glance over the man page of 0.23, yes.

Yep, it doesn't take $SYSROOT (as my original patch did), but with 
some prefix ...

> The problem is that the build-time (cross-)linker needs to find the
> (cross-compiled) lib under /my/build/host/target/environment/opt/foo/lib
> at link time and the shared linker under /opt/foo/lib at run-time.
> Hmm, after digging into that old project, it seems that libtool and
> the .la files were the problem.

Yes, libtool doesn't understand anything like sysroot. It generates 
broken pathnames in the .la files. You could use unitool and it's 
libtool-replacement.

> > > Yes. And even worse the compiled lib "foo" had explicit dependencies (on
> > > lib "bar") on
> > > "/my/build/host/target/environment/opt/bar/lib/libbar.so.1.2.3.4". 
> > 
> > And that's even more broken.
> 
> Yup. Maybe it was a result of my trial to make libtool work somehow ..

Heh, I've given up trying to repair libtool for a long time ;-P

> > > And BTW pkg-config didn't support the concept of a "DESTDIR" variable
> > > (and I don't care about the name of that variable).
> > 
> > No, why should it ?! It does not install anything.
> 
> But it may "use" installed files.

Yes, but they have to be strictly from sysroot. As said, recent 
pkg-config can handle this properly.
 
> > Probably you're looking for sysroot ?
> 
> Yes, very probably.

:)


cu
-- 
---------------------------------------------------------------------
 Enrico Weigelt    ==   metux IT service - http://www.metux.de/
---------------------------------------------------------------------
 Please visit the OpenSource QM Taskforce:
 	http://wiki.metux.de/public/OpenSource_QM_Taskforce
 Patches / Fixes for a lot dozens of packages in dozens of versions:
	http://patches.metux.de/
---------------------------------------------------------------------
