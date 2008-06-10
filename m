From: Tim Bird <tim.bird@am.sony.com>
Subject: Re: [PATCH 0/1] Embedded Maintainer(s), linux-embedded@vger list
Date: Tue, 10 Jun 2008 10:36:07 -0700
Message-ID: <484EBB87.8070009@am.sony.com>
References: <1209577322.25560.402.camel@pmac.infradead.org> <200806092253.11897.rob@landley.net> <20080610043020.GA31765@uranus.ravnborg.org> <200806100155.31904.rob@landley.net> <20080610075432.GB776@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <20080610075432.GB776@uranus.ravnborg.org>
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Landley <rob@landley.net>, Leon Woestenberg <leon.woestenberg@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-embedded@vger.kernel.org

Sam Ravnborg wrote:
>> (Maybe I _am_ the only person who still cares about 
>> building on a host without perl.  If I wasn't, somebody else would have acked 
>> the patch...)
> 
> perl is pretty standard and I fail to see the benefits of avoiding it.
> For embedded development I see even less benefits as I assume
> any sane embedded development environment are based on a
> cross-toolchain so you do the build on a high perfomance box.
> 
> Building everything for my arm board on the arm board would be a disater
> for example.

It is true that perl is pervasive and standard, in most scenarios.
However, it is not uncommon in the embedded world for people
to strive to containerize the build process for a whole distro (kernel
included) in order to reduce problems with configure scripts that
(incorrectly) probe the host environment.  I know of at least 3 distros
or distro-building methods that do this.  Working to reduce the
complexity of these constrained environments is a valid goal.

My own reasons for wanting to avoid using perl, however, aren't
based on its availability.

I don't want to start a language war, but in general I think adding
"knowledge of perl" to the list of things someone needs to understand
in order to understand how to build the kernel, would be a bad thing.
There's already a huge mountain to climb for someone trying to learn
enough to modify the kernel (or it's build system).  Adding perl
doesn't IMHO contribute enough value to warrant this extension in
required knowledge.

Also (again IMHO), perl is harder to maintain than other alternatives,
if a full-service scripting language is really needed.

I don't care so much if perl is used in some non-essential role,
like python is used for bloat-o-meter, for example.  But it would
be nice, IMHO, to minimize the external dependencies for required
kernel build infrastructure.

Having said all this, I can't object too strenuously, since I
have some code, out of tree, that uses perl as a pre-processor.
One of the reasons I haven't submitted it is that I find its
use of perl somewhat distasteful, for the reasons mentioned
above.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

