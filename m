From: Rob Landley <rob@landley.net>
Subject: Re: mainlining min-configs...
Date: Wed, 11 Jun 2008 20:42:49 -0500
Message-ID: <200806112042.50852.rob@landley.net>
References: <48447615.5050806@am.sony.com> <20080611193639.GB2958@cs181133002.pp.htv.fi> <48502BAF.7060209@am.sony.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-embedded-owner@vger.kernel.org>
In-Reply-To: <48502BAF.7060209@am.sony.com>
Content-Disposition: inline
Sender: linux-embedded-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Bird <tim.bird@am.sony.com>
Cc: Adrian Bunk <bunk@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, linux-tiny <Linux-tiny@selenic.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux kernel <linux-kernel@vger.kernel.org>

On Wednesday 11 June 2008 14:46:55 Tim Bird wrote:
> Adrian Bunk wrote:
> > Randy's patch that documents KCONFIG_ALLCONFIG is in Linus' tree since
> > April 2006.
>
> Well, dangit there it is!
>
> The patch I googled had it going into Documentation/kbuild.  It
> somehow escaped my attention in the README.

Mine as well.  (I grepped for KCONFIG_ALLCONFIG in Documentation, not in the 
rest of the tree.  I of all people should know better...)

> If I was 
> a little more skilled with my grep-ing I would have found it.
> Sorry for the bother!

The linux kernel has documentation in Documentation, in the "make htmldocs" 
output, in the Kconfig help entries, in README files, in the output of "make 
help", and several other places.  (And then there's all the stuff that's not 
_in_ the kernel tarball...)

It's easy to miss.

Rob

P.S: yes, README files plural.
  find . -name "*[Rr][Ee][Aa][Dd][Mm][Ee]*" | grep -v Documentation | wc
  69	69	2315

-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
