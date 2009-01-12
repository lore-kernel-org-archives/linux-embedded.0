From: Alexander Neundorf <neundorf@eit.uni-kl.de>
Subject: Re: PATCH [0/3]: Simplify the kernel build by removing perl.
Date: Mon, 12 Jan 2009 12:04:34 +0100
Message-ID: <200901121204.34661.neundorf@eit.uni-kl.de>
References: <200901020207.30359.rob@landley.net> <200901121144.16255.neundorf@eit.uni-kl.de> <31014a580901120255q368714a7o897a328d9da479ad@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <31014a580901120255q368714a7o897a328d9da479ad@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Embedded Linux mailing list <linux-embedded@vger.kernel.org>
Cc: "Mark A. Miller" <mark@mirell.org>

On Monday 12 January 2009 11:55:32 Mark A. Miller wrote:
> On Mon, Jan 12, 2009 at 4:44 AM, Alexander Neundorf
>
> <neundorf@eit.uni-kl.de> wrote:
> > On Monday 12 January 2009 11:22:47 you wrote:
> > ...
> >
> >> entire environment, QEMU allows it nicely with distcc at a reasonable
> >> speed. (Albeit there is no distconfigure, but that's entirely an
> >> unrelated tanget of muck and despair and rants against configure, but
> >> we're not going there...)
> >
> > I'd be interested in hearing your issues with configure for cross
> > compiling right ?
> > I added cross compiling support to cmake, so I'm interested to see
> > whether we did it better :-)
> >
> > Alex
>
> Actually, I've mostly avoided that with doing most of the compiles in
> QEMU. I just pine for a distconfigure, 

What should it do ?
Basically configure tests can:
-check for the existance and/or contents of files
-try to build something
-try to execute something already existing
-try to execute something just built

The last two types are the problematic ones. What do you suggest for them ?

> and rant about configure in
> general, since it takes quite a while to do all the checks under an
> emulated host, and it checks for *stupid things* in a lot of packages,
> like, "Do we have the MacOSX 10.5 SDK installed...", when it already
> determined that it was running on Linux, and...

You can do that too with cmake, but don't have to :-)

Alex
