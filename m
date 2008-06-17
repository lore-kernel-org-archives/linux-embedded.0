From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Tue, 17 Jun 2008 08:27:09 +0200
Message-ID: <200806170827.09103.neundorf@eit.uni-kl.de>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806160955.12752.neundorf@eit.uni-kl.de> <20080616151536.GC9141@nibiru.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080616151536.GC9141@nibiru.local>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Embedded Maillist <linux-embedded@vger.kernel.org>

On Monday 16 June 2008 17:15:37 Enrico Weigelt wrote:
> * Alexander Neundorf <neundorf@eit.uni-kl.de> schrieb:
> > CMake has a cache, where the values of variables are stored, e.g. if an
> > option is enabled or not, or where a library has been found (e.g.
> > JPEG_LIBRARY=/usr/local/lib/libjpeg.so).
> > The way to influence the behaviour of cmake is to change the value of
> > these variables, this can be done either via a GUI (curses based or with
> > cmake 2.6 also a graphical one), or via the command line:
> > $ cmake -D<name_of_variable>=<new_value> ...more options
>
> Are these variables strictly specified or is all left to individual
> author's decision ?

Authors decision.

> > > autotools need only a shell and make
> >
> > Yes, and requiring a shell is a lot, in the case you want to port
> > also to Windows.
>
> hmm, why not just expecting an sane shell on the building system ?
> (as you already have to expect a sane compiler)

Well, we could go so far to expect a "sane" operating system, but you can't 
change it, there are "insane" people in the world ;-)

Alex
