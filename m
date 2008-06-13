From: Rob Landley <rob@landley.net>
Subject: Re: Kernel boot problem on IXP422 Rev. A
Date: Fri, 13 Jun 2008 12:33:49 -0500
Message-ID: <200806131233.50360.rob@landley.net>
References: <1522484831@web.de> <8bd0f97a0806121304m7d00fb6dq27fa7aa37cbeb828@mail.gmail.com> <17882748-2E1B-4DB4-82FD-C5D5C4E62CC8@logicaloutcome.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <17882748-2E1B-4DB4-82FD-C5D5C4E62CC8@logicaloutcome.ca>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glenn Henshaw <thraxisp@logicaloutcome.ca>
Cc: linux-embedded <linux-embedded@vger.kernel.org>

On Thursday 12 June 2008 16:28:48 Glenn Henshaw wrote:
> On 12-Jun-08, at 4:04 PM, Mike Frysinger wrote:
> > On Thu, Jun 12, 2008 at 3:35 PM, Marcus Tangermann wrote:
> >> we currently try to boot a 2.6.21 kernel
> >
> > time to upgrade
>
>    Wrong answer!!!

Fairly common answer actually.  It translates to:

There's a decent chance whatever bug you're encountering is one we've already 
fixed.  As volunteers, we're not really interested in reinventing the wheel.  
We're trying to come up with a better kernel, and debugging old version may 
help you but it doesn't help us.

If you try the current version and the problem persists, we're happy to help 
you debug it, because this makes the kernel better for all of us.  If you 
have your own reason to want to stick with an old version, there are plenty 
of vendors happy to take your money to make this work for you, but you've 
sacrificed the support of the volunteer community in doing so.

>    Many embedded devices can't upgrade kernels easily because of
> customer requirements and certifications.

I'm aware of this.  That's what vendors are for.

> For example, I have worked 
> on Linux based applications in the financial industry. A kernel
> upgrade here is viewed as equivalent to switching from Windows XP to
> Vista, and requires significant effort in certification testing from
> the customer's perspective. This doesn't make economic sense for
> either party.

Making economic sense and making sense to open source volunteers are two 
different sets of criteria.  Part of "making economic sense" is realizing 
that you must replace volunteer effort with paid effort to do it that way.

The procedure is:

1) Try to reproduce the bug under a current kernel.  (Set up a _test_ system.)

If you can't reproduce it:
  Git bisect to find the fix, then backport it to your kernel if possible.
If you can reproduce it:
  Demonstrate the bug to the community in the current kernel, get help 
debugging the problem, then backport the fix to your kernel if possible.

>    Often developers not working in the embedded space don't understand
> this reality.

Often developers who _are_ working in the embedded space don't understand how 
and why volunteers collaborate through the internet in this thing 
called "open source development".

>    Helpful responses on what does/does not work would be more
> appreciated.

He did give a helpful response.  You didn't understand it.  I elaborated.

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
