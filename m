From: Jamie Lokier <jamie@shareable.org>
Subject: Re: cross-compiling alternatives (was Re: [PATCH 0/1] Embedded Maintainer(s)...)
Date: Mon, 16 Jun 2008 12:52:18 +0100
Message-ID: <20080616115218.GF18857@shareable.org>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806131106.18487.neundorf@eit.uni-kl.de> <1213348320.26255.231.camel@pmac.infradead.org> <200806131132.55543.neundorf@eit.uni-kl.de> <20080613152854.GM11760@nibiru.local> <20080614003102.GB30652@shareable.org> <20080616042310.GH12962@nibiru.local> <20080616104917.GA18857@shareable.org> <1213614593.26255.691.camel@pmac.infradead.org>
Mime-Version: 1.0
Return-path: <linux-embedded-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1213614593.26255.691.camel@pmac.infradead.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Enrico Weigelt <weigelt@metux.de>, linux-embedded@vger.kernel.org

David Woodhouse wrote:
> On Mon, 2008-06-16 at 11:49 +0100, Jamie Lokier wrote:
> > But here's the thing: do you really want every package have code
> > calling every different variation on a system call, at run time, until
> > it finds one that works?
> 
> No. That functionality lives in libc, if you want it at all.

Sometimes that's ok.

But sometimes libc can't do that, because the point of a newer
function is it addresses some inadequacy of an old function.  If libc
does a "compatibility" thing and uses old syscalls on old kernels,
sometimes that introduces bugs.

E.g. Calls to pread should _not_ be implemented as lseek+read+lseek on
old kernels which don't have pread.  That leads to race conditions and
corruption in some applications.  (I think this has really occurred,
but I'm unable to find it now).

The same applications are fine if pread returns ENOSYS and they know
what they need to do with lseek and read.

The same is true of the rsync example, with utimes and utime.  It's
wrong for libc to "emulate" utimes using utime on old kernels: they
aren't the same.  So the application does it instead: the application
has a policy that it's fine with the different functionality when
utimes returns ENOSYS.

-- Jamie
