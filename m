From: Rob Landley <rob@landley.net>
Subject: Re: initramfs size limitation
Date: Tue, 3 Jun 2008 15:59:55 -0500
Message-ID: <200806031559.55526.rob@landley.net>
References: <4841481E.8090406@cox.net> <200806011903.47135.rob@landley.net> <8bd0f97a0806011725u3dc70e2cy1b317b2b6564f5c8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <8bd0f97a0806011725u3dc70e2cy1b317b2b6564f5c8@mail.gmail.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: pwilshire@cox.net, linux-embedded@vger.kernel.org

On Sunday 01 June 2008 19:25:11 Mike Frysinger wrote:
> On Sun, Jun 1, 2008 at 8:03 PM, Rob Landley wrote:
> > On Saturday 31 May 2008 07:44:14 Phil Wilshire wrote:
> >> I hope this is the right place and the right sort of question.
> >>
> >> I work closely with the Blackfin systems and they have now integrated
> >> the initramfs generation into their system build. The result is great
> >> the root fs is ready to run from the page cache.
> >
> > Is it possible to get blackfin working with a vanilla gcc release yet, or
> > do you still need out-of-tree patches?  (I have a blackfin board I got at
> > OLS, but it needs a toolchain I can't reproduce.)
>
> there's plenty of usable binaries available

I like to build things from source.  (I'm funny that way, I realize this is 
totally out of place when dealing with Linux, but it's what I do.)  I also 
like to use vanilla release packages where possible, and failing that a patch 
against against the release version.  (Again, a personal idiosyncrasy...)

To me, saying "you need this binary-only toolchain to build" is like 
saying "you need this binary-only driver to boot".

> > fact it would be really nice if qemu grew blackfin support because
> > messing
>
> i imagine it would be ... too bad qemu lacks real documentation

Actually there was documentation on the old stuff if you knew where to dig it 
up (a good starting point was Fabrice's old usenix paper and then I had some 
links I'd collected from there), but they just ripped out the old code 
generator in favor of a new one 
(See http://lists.gnu.org/archive/html/qemu-devel/2008-02/msg00011.html ) so 
there's not much point in going there right now.  (Hopefully they'll have a 
1.0 release within our lifetimes.)

I'm guessing that's why your qemu blackfin work on wh0rd.net stalled last 
year?

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
