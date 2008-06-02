From: Rob Landley <rob@landley.net>
Subject: Re: initramfs size limitation
Date: Sun, 1 Jun 2008 19:03:46 -0500
Message-ID: <200806011903.47135.rob@landley.net>
References: <4841481E.8090406@cox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <4841481E.8090406@cox.net>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pwilshire@cox.net
Cc: linux-embedded@vger.kernel.org

On Saturday 31 May 2008 07:44:14 Phil Wilshire wrote:
> Hi All,
>
> Firstly, thanks for this list I hope we can get some interesting things
> happening.
>
> I have a question regarding initramfs and tmpfs in a NOMMU environment.

/me pleads the fifth.

> I hope this is the right place and the right sort of question.
>
> I work closely with the Blackfin systems and they have now integrated
> the initramfs generation into their system build. The result is great
> the root fs is ready to run from the page cache.

Is it possible to get blackfin working with a vanilla gcc release yet, or do 
you still need out-of-tree patches?  (I have a blackfin board I got at OLS, 
but it needs a toolchain I can't reproduce.)

All my builds these days are based on http://landley.net/code/firmware (and in 
fact it would be really nice if qemu grew blackfin support because messing 
with real hardware is a pain while using a laptop at coffee shops).

> There is one problem that I can see that may be more serious for
> embedded users.
> As far as I can tell the initramfs filesystem is not restricted in size.
> You can keep writing files until it uses all available memory.

Yup.  There have intermittently been patches to make rootfs be tmpfs instead 
of ramfs, the most recent of which I remember was:
http://lkml.org/lkml/2007/7/13/354

If they ever got merged, I didn't hear about it.  People keep bringing up 
vague handwaving about potential problems with memory management setup 
sequencing, since tmpfs potentially interacts with swap and that's not set up 
yet when tmpfs gets mounted.  (Then again no swap partitions are mounted at 
that point either.)  I'm unaware of anybody who tried it reporting any actual 
problems, but oh well...

> ? Would the mainline kernel be receptive to such modifications ?

Post a patch, get a signed-off-by David Woodhouse (in his role as embedded 
maintainer), and submit to Andrew Morton's tree.  That way, at each point, 
you at least know who owes you a response (even if it's "no").

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
