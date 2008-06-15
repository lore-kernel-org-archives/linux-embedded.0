From: Rob Landley <rob@landley.net>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Sun, 15 Jun 2008 14:17:34 -0500
Message-ID: <200806151417.35420.rob@landley.net>
References: <1522484831@web.de> <200806131233.50360.rob@landley.net> <4852D322.5060400@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4852D322.5060400@am.sony.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Glenn Henshaw <thraxisp@logicaloutcome.ca>, linux-embedded <linux-embedded@vger.kernel.org>

On Friday 13 June 2008 15:05:54 Tim Bird wrote:
> Rob,
>
> This is an excellent and concise description of the open
> source perspective on the problem.  I'll add just one note below.
>
> Rob Landley wrote:
> > 1) Try to reproduce the bug under a current kernel.  (Set up a _test_
> > system.)
>
> This sounds easy, but can be quite difficult.

It's not a question of difficult or easy: it's the procedure that works.

You don't get support from a commercial vendor unless you pay them money, and 
you don't get support from open source developers unless you help us make the 
next release just a little bit better.  (We never said our help was free, we 
just said it didn't cost _money_.  Ok, the FSF did but they don't speak for 
all of us...)

> Very often, product developers are several versions behind, with
> no easy way to use the current kernel version.

I'm aware of that.  But if you can't set up a test system to reproduce the bug 
on a current system, the rest of us haven't got a _chance_.

> For example, a 
> common scenario is starting with a kernel that comes with a board
> (with source mind you), where the kernel came from the semi-conductor
> vendor, who paid a Linux vendor to do a port, and it was
> released in a time-frame relative to the Linux vendor's
> product schedule.

Then poke your vendor to fix the problem.

If you've decided to use a divergent fork from a vendor rather than the 
mainstream version, then the vendor has to support that fork for you because 
we're not going to be familiar with it.  (You can _hire_ one of us to support 
it for you, but we're not going to do so on a volunteer basis.)

We're happy to debug _our_ code.  But "our code" is the current vanilla 
release tarball.  If you can't reproduce the problem in the current vanilla 
tarball, then it's not our bug.  If you can only reproduce it in an older 
version: congratulations, we must have fixed it since.  If you can only 
reproduce it in some other fork, obviously their changes introduced the bug.  
If it's "your code plus this patch", we need to see the patch.

If _you_ can't reproduce it in our code, how do you expect _us_ to?

> This is how you end up having people STARTING projects today
> using a 2.6.11 kernel.  (I know of many).

Oldest I've seen a new project launch with this year is 2.6.15, but I agree 
with your point.

Whoever decided backporting bug fixes to a 2.6.16 kernel forever was a good 
idea seems to have muddied the waters a bit.  Ironically I don't know anybody 
actually _using_ that version, but I've seen several people point to it to 
show that "the community" supports arbitrarily older versions forever, and 
thus they don't have to upgrade to get support, and 2.6.18 is actually 
_newer_ than that...

> The real difficulty, when a developer finds themselves in
> this position, is how to forward-port the BSP code necessary to
> reproduce the bug in the current kernel.  Often, the code
> is not isolated well enough (this is a vendor problem that
> really needs attention.  If you have the BSP in patches, it
> is usually not too bad to forward port even across several
> kernel versions.  But many vendors don't ship stuff this way.)

Yup.  Sucks, doesn't it?  This is not a problem that improves with the passage 
of time.

Might be a good idea to make it clear up front that even if your changes never 
get mainlined, failure to break up and break out your patches is still likely 
to cause maintenance problems down the road.

> The fact is, that by a series of small steps and delays by
> the linux vendor, chip vendor, board vendor,
> and product developer the code is out-of step.

Hence the importance of breaking out and breaking up the changes.

> It's easy to say "don't get in this position", but
> this even happens when everyone is playing nice and actively
> trying to mainline stuff.  BSP support in arch trees often
> lag mainline by a version or two.

Getting out of sync is inevitable.  Happens to full-time kernel developers, 
that's why they have their own trees.  That's a separate issue from asking 
for patches and getting a source tarball that compiles instead.  "Here's a 
haystack, find the needle."

Mainlining changes and breaking them up into clean patches on top of some 
vanilla version (_any_ vanilla version) are two separate things.  You have to 
win one battle before you can even start the other.

> The number of parties involved here is why, IMHO, it has
> taken so long to make improvements in this area.

The lack of a clear consistent message from us to the vendors hasn't helped.

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
