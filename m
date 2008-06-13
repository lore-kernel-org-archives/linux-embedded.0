From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: cross-compiling alternatives
Date: Fri, 13 Jun 2008 17:16:35 +0200
Message-ID: <20080613151634.GJ11760@nibiru.local>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806130843.05704.neundorf@eit.uni-kl.de> <1213346316.17853.28.camel@tara.firmix.at> <200806131106.18487.neundorf@eit.uni-kl.de> <1213351433.17853.61.camel@tara.firmix.at>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1213351433.17853.61.camel@tara.firmix.at>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

* Bernd Petrovitsch <bernd@firmix.at> schrieb:

> > Basically yes. But if you have a big number of packages (or a huge package) 
> > which you didn't write yourself, there will be tests which run executables. 
> > Figuring out what all the tests are supposed to test in a complex unknown 
> > software project is not trivial.
> 
> Yes, you get used to find the relevant lines in config.log and similar
> with `grep` and similar tools;-)

Which are different on each package. So you have to configure each package
for each target manually, which leads the whole point of autoconf
ad absurdum ;-o

> But most embedded projects haven't that much number of "large tools" -
> mainly because the space is limited.

I'm probably not quite representative, but I'm using crosscompile
techniques also for building to the same arch - mainly for QM reasons.

> pkg-config generated (and generates? - I didn't check recently)
> references to libraries including the full absolute path (which is the
> one at build time. And at run-time there is usually
> no /home/bernd/src/... or where some build may just run).

Recent pkg-config supports sysroot.
So you simply build your .pc files as usual (w/o sysroot prefix) and
set the sysroot prefix via env on the pkg-config call.

> > Can you please explain ? How do the generated pkg_config files look like ?
> > Ahh, you mean they contain e.g -L/my/build/host/target/environment/opt/foo/lib 
> > instead of just -L/opt/foo/lib ?

Then you've got a broken .pc file ;-P

> Yes. And even worse the compiled lib "foo" had explicit dependencies (on
> lib "bar") on
> "/my/build/host/target/environment/opt/bar/lib/libbar.so.1.2.3.4". 

And that's even more broken.

> And BTW pkg-config didn't support the concept of a "DESTDIR" variable
> (and I don't care about the name of that variable).

No, why should it ?! It does not install anything.
Probably you're looking for sysroot ?


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
