From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 4/4] module: Use the binary search for symbols resolution
Date: Tue, 19 Apr 2011 21:05:49 +0930
Message-ID: <87aafmo4mi.fsf@rustcorp.com.au>
References: <1302960373-5309-1-git-send-email-abogani@kernel.org> <1302960373-5309-5-git-send-email-abogani@kernel.org> <BANLkTik9oekjUH6YXTda1P_dM231nEHQqA@mail.gmail.com> <87liz73tso.fsf@rustcorp.com.au> <4DACE8F4.2050807@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4DACE8F4.2050807@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-embedded.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wanlong Gao <wanlong.gao@gmail.com>
Cc: Alessio Igor Bogani <abogani@kernel.org>, Tim Abbott <tabbott@ksplice.com>, Anders Kaseorg <andersk@ksplice.com>, Jason Wessel <jason.wessel@windriver.com>, Tim Bird <tim.bird@am.sony.com>, LKML <linux-kernel@vger.kernel.org>, Linux Embedded <linux-embedded@vger.kernel.org>

On Tue, 19 Apr 2011 09:44:20 +0800, Wanlong Gao <wanlong.gao@gmail.com> wrote:
>   2011-4-19 9:37, Rusty Russell wroted:
> > On Sat, 16 Apr 2011 22:32:08 +0800, Wanlong Gao<wanlong.gao@gmail.com>  wrote:
> >>> +	sym = bsearch(fsa->name, syms->start, syms->stop - syms->start,
> >> As the bsearch func, why not change the syms->stop to syms->end ?
> >> Hmm..Just a stupid suggestion.
> >
> >
> > The names are derived from the linker symbols for end of sections, which
> > is __stop_<sectionname>.
> >
> > Cheers,
> > Rusty.
> As this , why not change the bsearch's "end" to "stop", too ? It will be 
> more readable.

I'm confused.  bsearch uses a count, not an end pointer...

Rusty.
