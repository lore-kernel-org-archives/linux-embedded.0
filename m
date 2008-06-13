From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: cross-compiling alternatives
Date: Fri, 13 Jun 2008 13:24:06 +0200
Message-ID: <200806131324.06467.neundorf@eit.uni-kl.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806131106.18487.neundorf@eit.uni-kl.de> <1213351433.17853.61.camel@tara.firmix.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <1213351433.17853.61.camel@tara.firmix.at>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-embedded@vger.kernel.org

On Friday 13 June 2008 12:03:53 you wrote:
> On Fre, 2008-06-13 at 11:06 +0200, Alexander Neundorf wrote:
...
> > > - rewrite generated pkg_config files after generation.
> > > Yes, that's pretty ugly.
> > > But perhaps I was just too dumb to find the correct solutions.
> >
> > Can you please explain ? How do the generated pkg_config files look like
> > ? Ahh, you mean they contain e.g
> > -L/my/build/host/target/environment/opt/foo/lib instead of just
> > -L/opt/foo/lib ?
>
> Yes. And even worse the compiled lib "foo" had explicit dependencies (on
> lib "bar") on
> "/my/build/host/target/environment/opt/bar/lib/libbar.so.1.2.3.4". And

You mean the RPATH in the installed executable was wrong ?

> that is not trivially overridable at run-time AFAIK so that ld-linux

If RUNPATH is available in the binary (exists since a few years, so it should 
be in your toolchain), then RPATH is ignored. RUNPATH can be overridden using 
LD_LIBRARY_PATH. It can be enabled with the linker flag --enable-new-dtags I 
think.
If there is RPATH but not RUNPATH, then it can't be overridden. But still if 
it doesn't find the library in that place, it will continue searching in the 
other directories, e.g. LD_LIBRARY_PATH.

There is also a tool "chrpath", which you can use to change the RPATH entry in 
an existing executable.
It's a bit hard to find, you can get it e.g. from an older revision of kdesvn:
http://websvn.kde.org/trunk/kdesupport/chrpath/?pathrev=808076
(it was removed again in revision 808077).
It may have issues with endianness.

Alex
