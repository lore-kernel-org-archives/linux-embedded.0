From: Rob Landley <rob@landley.net>
Subject: Re: Firmware Linux (was Re: Cross Compiler and loads of issues)
Date: Tue, 24 Jun 2008 20:49:26 -0500
Message-ID: <200806242049.27143.rob@landley.net>
References: <7b740b700806121052n2f98dfa4hc96ebfc1be5b6bbf@mail.gmail.com> <200806131224.58568.rob@landley.net> <20080616043812.GB32139@nibiru.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080616043812.GB32139@nibiru.local>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: weigelt@metux.de
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On Sunday 15 June 2008 23:38:12 Enrico Weigelt wrote:
> * Rob Landley <rob@landley.net> schrieb:
> > Did you try my FWL project? :)
> >
> > http://landley.net/code/firmware
>
> hmm, doesnt look like supporting sysroot ...

It doesn't use sysroot.  It makes the compiler relocatable using an updated 
version of the old uClibc wrapper script, which rewrites each glibc command 
line to start with --nostinc --nostdlib and then adds the correct paths back 
in from the ground up.

Have you ever run gcc under strace?  Or worse, looked at the gcc path logic 
source code?  It's a mess.  It gets paths from ./configure options, it gets 
paths from spec files, it adds hardwired paths in the C source code, it 
checks enviroment variables to get more paths, and this isn't counting the 
paths you tell it on the command line.  Every time they gave up on the 
previous approach because it was obviously unworkable, they NEVER REMOVED 
ANYTHING.  They just added yet another layer on top of it, falling back to 
the previous one each time.  It never occurred to them that people would want 
to make it NOT check paths like /usr/include.  They just keep piling on more 
and more, appending to a big vararray and never removing anything.

Do you know how sysroot is implemented?  It still hardwires absolute paths 
into the binary, but then it does a string compare with the start of the 
hardwired path so it knows how much to trim off when substituting another 
path instead.

I once tried to work up a patch to remove the obsolete or clearly defective 
parts of the gcc path logic, but when my patch got large than 10,000 lines I 
gave up and went to a wrapper script.  The only way to make the gcc path 
logic reliable is to NOT USE IT.  Hence the wrapper script to tell it to 
ignore all the paths it _thinks_ it knows, and check in exactly these places 
(and only those places) instead.  Then you can run the result under strace 
without wanting to throw up quite so much.

> cu

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
