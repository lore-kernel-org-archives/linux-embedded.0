From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] module: Use binary search in lookup_symbol()
Date: Wed, 18 May 2011 10:37:52 +0930
Message-ID: <87liy4n7dj.fsf@rustcorp.com.au>
References: <BANLkTinPG100vbVAN1RZWb3h9Xuu6SKJ0Q@mail.gmail.com> <1305665763-3988-1-git-send-email-abogani@kernel.org> <20110517232241.GA19140@kroah.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110517232241.GA19140@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <greg@kroah.com>, Alessio Igor Bogani <abogani@kernel.org>
Cc: Anders Kaseorg <andersk@ksplice.com>, Tim Abbott <tabbott@ksplice.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, Dirk Behme <dirk.behme@googlemail.com>

On Tue, 17 May 2011 16:22:41 -0700, Greg KH <greg@kroah.com> wrote:
> On Tue, May 17, 2011 at 10:56:03PM +0200, Alessio Igor Bogani wrote:
> > This work was supported by a hardware donation from the CE Linux Forum.
> > 
> > Signed-off-by: Alessio Igor Bogani <abogani@kernel.org>
> > ---
> 
> That's nice, but _why_ do this change?  What does it buy us?
> 
> Please explain why you make a change, not just who sponsored the change,
> that's not very interesting to developers.

I was going to let this pass, but since Greg flagged it...

It's sufficient given the context (it's the tail end of a series of
patches), but it's preferable to allude to the other patches in a case
like this.  For example:

        Now we have sorted symbols, we can use binary search for
        kallsyms lookups as well.

(1) "Now we have sorted symbols" indicates to the reader that this has
    just recently become possible.
(2) "as well." indicates that this was not the main justification for
    sorting the symbols.
 
Ideally you would add some numbers, like so:

        On my machine 'cat /proc/kallsyms' only takes 0.02 seconds, but
        this halves it to 0.01 seconds.

(That's my results under kvm, which is a poor way to do timing, but you
get the idea).

Thanks,
Rusty.
